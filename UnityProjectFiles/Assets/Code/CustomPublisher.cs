using UnityEngine;

namespace RosSharp.RosBridgeClient
{
    public class CustomPublisher : Publisher<Messages.Standard.String>
    {
        private Messages.Standard.String message;

        protected override void Start()
        {
            base.Start();
            InitializeGameObject();
            InitializeMessage();
        }

        private void Update()
        {
            UpdateMessage();
        }      

        private void InitializeGameObject()
        {
            Debug.Log("Publisher initialized!");        
        }

        private void InitializeMessage()
        {
            message = new Messages.Standard.String("none");
            message.data = "Hi I am Unity! This is update number: " + Time.frameCount;
        }

        private void UpdateMessage()
        {
            Publish(message);
        }
    }
}