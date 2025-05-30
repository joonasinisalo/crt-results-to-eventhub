import json
from azure.eventhub import EventHubProducerClient, EventData

def send_test_result_to_eventhub(connection_str, test_result):
    """
    Sends a test result to Azure Event Hub.

    Parameters:
    connection_str (str): The connection string for the Event Hub.
    test_result (dict): A dictionary representing the test result.

    """
    producer = EventHubProducerClient.from_connection_string(conn_str=connection_str)
    event_data_batch = producer.create_batch()
    event_data_batch.add(EventData(json.dumps(test_result)))
    producer.send_batch(event_data_batch)
    print("Test result sent successfully.")
    producer.close()
