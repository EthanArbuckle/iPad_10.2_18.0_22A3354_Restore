@implementation SKIDirectInvocation

+ (id)runSiriKitExecutorCommandWithContext:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (!v5)
    +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:].cold.1();
  v7 = v6;
  if (!v6)
    +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:].cold.2();
  +[SKIDirectInvocation makeParseWithDirectInvocationPayload:](SKIDirectInvocation, "makeParseWithDirectInvocationPayload:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:parse:appBundleId:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:parse:appBundleId:", v5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)wrapCommandInStartLocalRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[2];
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE817A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAceId:", v7);

  v33[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientBoundCommands:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BE81548]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAceId:", v11);

  objc_msgSend(v5, "aceId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRefId:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BE81550]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAceId:", v15);

  objc_msgSend(v5, "aceId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRefId:", v16);

  objc_msgSend(v13, "setCode:", 0);
  v32 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCommands:", v17);

  v18 = objc_alloc_init(MEMORY[0x24BE811A8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAceId:", v20);

  objc_msgSend(v5, "aceId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRefId:", v21);

  v22 = objc_alloc_init(MEMORY[0x24BE81550]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAceId:", v24);

  objc_msgSend(v5, "aceId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRefId:", v25);

  objc_msgSend(v22, "setCode:", -1);
  v31 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCommands:", v26);

  v30[0] = v13;
  v30[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallbacks:", v27);

  objc_msgSend(v5, "aceId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRefId:", v28);

  return v5;
}

+ (id)runSiriKitExecutorCommandWithContext:(id)a3 parse:(id)a4 appBundleId:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x24BE813A0];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAceId:", v13);

  objc_msgSend(v11, "setParameterPrompts:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v11, "setMultiUser:", 0);
  objc_msgSend(v11, "setDirectAction:", 1);
  objc_msgSend(v11, "setRequiresConditionalMultiUserGrounding:", 0);
  objc_msgSend(v11, "setUserInitiatedAction:", *MEMORY[0x24BE822D8]);
  v14 = objc_alloc_init(MEMORY[0x24BE813C8]);
  objc_msgSend(v11, "setRemoteExecution:", v14);

  objc_msgSend(v11, "setParse:", v9);
  objc_msgSend(v11, "setTextToSpeechEnabled:", objc_msgSend(v10, "isTextToSpeechEnabled"));
  objc_msgSend(v11, "setVoiceTriggerEnabled:", objc_msgSend(v10, "isVoiceTriggerEnabled"));
  objc_msgSend(v10, "interactionType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInteractionType:", v15);

  objc_msgSend(v10, "inputOrigin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInputOrigin:", v16);

  objc_msgSend(v11, "setEyesFree:", objc_msgSend(v10, "isEyesFree"));
  objc_msgSend(v10, "responseMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMode:", v17);
  if (v7 && objc_msgSend(v7, "length"))
  {
    v18 = objc_alloc_init(MEMORY[0x24BE817D8]);
    objc_msgSend(v18, "setBundleId:", v7);
    v19 = objc_alloc_init(MEMORY[0x24BE813B0]);
    objc_msgSend(v19, "setRequestedApp:", v18);
    objc_msgSend(v11, "setAppSelectionState:", v19);

  }
  return v11;
}

+ (id)makeParseWithDirectInvocationPayload:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;

  v3 = (objc_class *)MEMORY[0x24BE81320];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvocationIdentifier:", v6);

  v7 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend(v4, "userData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v8, 200, 0, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  objc_msgSend(v5, "setData:", v9);

  if (v10)
  {
    SKIDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SKIDirectInvocation makeParseWithDirectInvocationPayload:].cold.1((uint64_t)v10, v11);

  }
  v12 = objc_alloc_init(MEMORY[0x24BE81368]);
  objc_msgSend(v12, "setType:", *MEMORY[0x24BE822A0]);
  objc_msgSend(v12, "setDirectInvocation:", v5);

  return v12;
}

+ (void)runSiriKitExecutorCommandWithContext:payload:.cold.1()
{
  __assert_rtn("+[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]", "SKIDirectInvocation.m", 22, "context != nil");
}

+ (void)runSiriKitExecutorCommandWithContext:payload:.cold.2()
{
  __assert_rtn("+[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]", "SKIDirectInvocation.m", 23, "payload != nil");
}

+ (void)makeParseWithDirectInvocationPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_212490000, a2, OS_LOG_TYPE_ERROR, "error serializing SKIDirectInvocationPayload: %@", (uint8_t *)&v2, 0xCu);
}

@end
