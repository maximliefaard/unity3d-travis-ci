using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateCube : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Debug.LogError("Start method was called!");
    }

    // Update is called once per frame
    void Update()
    {
        this.gameObject.transform.Rotate(1.0f, 1.0f, 1.0f);
    }
}
