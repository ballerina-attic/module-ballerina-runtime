// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

@test:Config {}
isolated function testInvocationContextId() {
    // This will generate an ID as the invocation context gets created for the first time
    InvocationContext invocationContext1 = getInvocationContext();
    string id1 = invocationContext1.id;
    // This invocation context should be the same as above created one without newly creating
    // an invocation context. So the ID should be the same as above.
    InvocationContext invocationContext2 = getInvocationContext();
    string id2 = invocationContext2.id;
    test:assertEquals(id1, id2);
}

@test:Config {}
isolated function testInvocationContextAttributes() {
    InvocationContext invocationContext = getInvocationContext();
    invocationContext.attributes["SERVICE_NAME"] = "HelloService";
    InvocationContext invocationContext2 = getInvocationContext();
    string serviceName = invocationContext2.attributes["SERVICE_NAME"].toString();
    test:assertEquals(serviceName, "HelloService");
}

@test:Config {}
isolated function getCallStackTest() {
    CallStackElement[] callStack = getCallStack();
    test:assertEquals(callStack[0].toString(), "{\"callableName\":\"getCallStack\",\"moduleName\":" +
    "\"ballerina.runtime.0_5_3.errors\",\"fileName\":\"errors.bal\",\"lineNumber\":38}");
}
