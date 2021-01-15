## Module Overview

This module provides functions to interact with the Ballerina runtime invocation context.

#### Invocation Context

The Invocation Context is a data holder, which is created per request and preserved for a single request-response flow. It comprises of a unique ID and an attribute map to hold the context information.

The following code snippet shows how to access the `runtime:InvocationContext` and how to set the data to the `attributes` map.
```ballerina
runtime:InvocationContext invocationContext = runtime:getInvocationContext();
invocationContext.attributes["SERVICE_NAME"] = "HelloService";
```

The following code snippet shows how to access the `runtime:InvocationContext` and get the data from the `attributes` map.
```ballerina
string serviceName = runtime:getInvocationContext().attributes["SERVICE_NAME"].toString();
```

For information on the operations, which you can perform with this module, see the below **Functions**.
