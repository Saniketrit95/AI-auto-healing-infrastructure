import boto3            # allow lambda to talk to AWS services,ec2,sns
import numpy as np      # help with number calculation
from sklearn.ensemble import IsolationForest   # actual brain, we will use in this to think and check anomalies

def lambda_handler(event, context):
    # Past normal CPU usage data (simulated)
    data = np.array([[14], [12], [20], [11], [18], [13], [15]])
    
    # Current CPU usage (received from CloudWatch Alarm)
    current_value = [[80]]  # You can dynamically fetch via event if desired
    
    # AI Anomaly Detection Model
    model = IsolationForest() # train AI model
    model.fit(data)
    
    result = model.predict(current_value)  # use AI to predict wheather new current value is weird or not.
    
    if result[0] == -1:  # -1 means anomalies detected
        ec2 = boto3.client('ec2', region_name='us-east-1')
        ec2.start_instances(InstanceIds=['i-xxxxxxxxxxxxxxxxx'])  # Replace with your backup EC2 id
        
        sns = boto3.client('sns')
        sns.publish(
            TopicArn='arn:aws:sns:us-east-1:123456789012:AutoHealAlerts',  # Replace with your SNS ARN
            Subject='EC2 Auto-Healing Triggered',
            Message='Primary EC2 failed. Backup started automatically.'
        )
        return {'status': 'Backup triggered'}
    else:
        return {'status': 'All normal'}
