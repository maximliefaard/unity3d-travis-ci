using RosSharp.RosBridgeClient.Messages.Standard;
using UnityEngine;

namespace RosSharp.RosBridgeClient
{
    public class CustomSubscriber : Subscriber<Messages.Standard.String>
    {
        public string messageData;

        protected override void Start()
        {
            base.Start();
            Debug.Log("Lets go!");
        }

        protected override void ReceiveMessage(Messages.Standard.String message)
        {
            messageData = message.data;
            Debug.LogError("MSG: " + messageData);
        }
    }
}