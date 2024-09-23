@implementation WFRemoteExecutionRunRequest

- (WFRemoteExecutionRunRequest)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionRunRequest;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionRunRequest)initWithAction:(id)a3 workflowControllerState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  WFRemoteExecutionRunRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *actionIdentifier;
  uint64_t v22;
  NSDictionary *variables;
  void *v24;
  NSDictionary *v25;
  void *v26;
  void *v27;
  NSDictionary *serializedParameters;
  NSDictionary *v29;
  uint64_t v30;
  NSDictionary *processedParameters;
  uint64_t v32;
  WFContentCollection *input;
  WFRemoteExecutionRunRequest *v34;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionRunRequest.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionRunRequest.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

LABEL_3:
  objc_msgSend(v9, "runningContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionRunRequest.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state.runningContext.identifier"));

  }
  v39.receiver = self;
  v39.super_class = (Class)WFRemoteExecutionRunRequest;
  v12 = -[WFRemoteExecutionRequest init](&v39, sel_init);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "runningContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@.%@.%lu"), v15, v17, v18, objc_msgSend(v9, "currentActionIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionRequest setIdentifier:](v12, "setIdentifier:", v19);

    objc_msgSend(v7, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v12->_actionIdentifier;
    v12->_actionIdentifier = (NSString *)v20;

    objc_msgSend(v9, "variables");
    v22 = objc_claimAutoreleasedReturnValue();
    variables = v12->_variables;
    v12->_variables = (NSDictionary *)v22;

    objc_msgSend(v7, "serializedParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSDictionary *)objc_msgSend(v24, "mutableCopy");

    if (v25)
    {
      objc_msgSend(v7, "workflow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "workflowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setValue:forKey:](v25, "setValue:forKey:", v27, CFSTR("workflowID"));

    }
    serializedParameters = v12->_serializedParameters;
    v12->_serializedParameters = v25;
    v29 = v25;

    objc_msgSend(v9, "currentProcessedParameters");
    v30 = objc_claimAutoreleasedReturnValue();
    processedParameters = v12->_processedParameters;
    v12->_processedParameters = (NSDictionary *)v30;

    objc_msgSend(v9, "currentInput");
    v32 = objc_claimAutoreleasedReturnValue();
    input = v12->_input;
    v12->_input = (WFContentCollection *)v32;

    v34 = v12;
  }

  return v12;
}

- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 *v24;
  _QWORD v25[5];
  NSObject *v26;
  __int128 *v27;
  _QWORD v28[5];
  NSObject *v29;
  __int128 *v30;
  _QWORD v31[5];
  NSObject *v32;
  __int128 *p_buf;
  uint8_t v34[4];
  const char *v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Inflating request", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__19876;
  v39 = __Block_byref_object_dispose__19877;
  v40 = 0;
  v9 = dispatch_group_create();
  -[WFRemoteExecutionRunRequest variablesData](self, "variablesData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    getWFRemoteExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v34 = 136315138;
      v35 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Has variables data", v34, 0xCu);
    }

    dispatch_group_enter(v9);
    -[WFRemoteExecutionRunRequest variablesData](self, "variablesData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke;
    v31[3] = &unk_1E7AEEA50;
    v31[4] = self;
    p_buf = &buf;
    v32 = v9;
    -[WFRemoteExecutionRunRequest inflateVariablesData:fileCoordinator:completion:](self, "inflateVariablesData:fileCoordinator:completion:", v13, v6, v31);

  }
  -[WFRemoteExecutionRunRequest inputData](self, "inputData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v34 = 136315138;
      v35 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s Has input data", v34, 0xCu);
    }

    dispatch_group_enter(v9);
    -[WFRemoteExecutionRunRequest inputData](self, "inputData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_122;
    v28[3] = &unk_1E7AEEA78;
    v28[4] = self;
    v30 = &buf;
    v29 = v9;
    -[WFRemoteExecutionRunRequest inflateInputData:fileCoordinator:completion:](self, "inflateInputData:fileCoordinator:completion:", v16, v6, v28);

  }
  -[WFRemoteExecutionRunRequest processedParametersData](self, "processedParametersData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    getWFRemoteExecutionLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v34 = 136315138;
      v35 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s Has processed parameters data", v34, 0xCu);
    }

    dispatch_group_enter(v9);
    -[WFRemoteExecutionRunRequest processedParametersData](self, "processedParametersData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_124;
    v25[3] = &unk_1E7AEEA50;
    v25[4] = self;
    v27 = &buf;
    v26 = v9;
    -[WFRemoteExecutionRunRequest inflateProcessedParametersData:fileCoordinator:completion:](self, "inflateProcessedParametersData:fileCoordinator:completion:", v19, v6, v25);

  }
  dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_125;
  v22[3] = &unk_1E7AF7FA0;
  v22[4] = self;
  v23 = v7;
  v24 = &buf;
  v21 = v7;
  dispatch_group_notify(v9, v20, v22);

  _Block_object_dispose(&buf, 8);
}

- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v11 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke;
  v12[3] = &unk_1E7AEEAF0;
  v13 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2_137;
  v10[3] = &unk_1E7AF6C78;
  v8 = v11;
  v9 = v7;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v12, v10);

}

- (void)inflateInputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v11 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke;
  v12[3] = &unk_1E7AEEAC8;
  v13 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_139;
  v10[3] = &unk_1E7AF6C78;
  v8 = v11;
  v9 = v7;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v12, v10);

}

- (void)inflateProcessedParametersData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionRunRequest actionIdentifier](self, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionRunRequest serializedParameters](self, "serializedParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createActionWithIdentifier:serializedParameters:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "initializeParametersIfNecessary");
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke;
  v24[3] = &unk_1E7AEEB40;
  v25 = v12;
  v26 = v8;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_143;
  v21[3] = &unk_1E7AF8598;
  v22 = v25;
  v23 = v9;
  v18 = v25;
  v19 = v9;
  v20 = v8;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v24, v21);

}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBRunRequest *v9;
  BOOL v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSString *v17;
  NSString *actionIdentifier;
  NSObject *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *variablesData;
  void *v24;
  void *v25;
  NSDictionary *v26;
  id v27;
  NSDictionary *serializedParameters;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSString *v37;
  NSString *workflowID;
  NSMutableArray *v39;
  NSMutableArray *processedParametersData;
  NSMutableArray *v41;
  NSMutableArray *inputData;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBRunRequest);
  v48 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v48);
  v11 = v48;
  if (v10)
  {
    v12 = -[WFREPBRunRequest payloadType](v9, "payloadType");
    -[WFREPBRunRequest payload](v9, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == 1)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v13);
      v15 = (void *)objc_opt_new();
      v47 = 0;
      v16 = objc_msgSend(v15, "readFrom:error:", v14, &v47);
      v45 = v47;
      if ((v16 & 1) != 0)
      {
        v44 = v13;
        objc_msgSend(v15, "actionIdentifier");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        actionIdentifier = self->_actionIdentifier;
        self->_actionIdentifier = v17;

        getWFRemoteExecutionLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          -[WFRemoteExecutionRequest identifier](self, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFRemoteExecutionRunRequest actionIdentifier](self, "actionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
          v51 = 2114;
          v52 = v20;
          v53 = 2114;
          v54 = v21;
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_INFO, "%s <%{public}@> action identifier: %{public}@", buf, 0x20u);

        }
        objc_msgSend(v15, "variables");
        v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        variablesData = self->_variablesData;
        self->_variablesData = v22;

        v24 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v15, "serializedParameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        objc_msgSend(v24, "propertyListWithData:options:format:error:", v25, 0, 0, &v46);
        v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v27 = v46;
        serializedParameters = self->_serializedParameters;
        self->_serializedParameters = v26;

        -[NSDictionary objectForKey:](self->_serializedParameters, "objectForKey:", CFSTR("workflowID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v30 = v29;
          else
            v30 = 0;
        }
        else
        {
          v30 = 0;
        }
        v37 = v30;

        workflowID = self->_workflowID;
        self->_workflowID = v37;

        v32 = v27 == 0;
        if (v27)
        {
          v13 = v44;
          if (a4)
            *a4 = objc_retainAutorelease(v27);
        }
        else
        {
          objc_msgSend(v15, "processedParameters");
          v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          processedParametersData = self->_processedParametersData;
          self->_processedParametersData = v39;

          objc_msgSend(v15, "inputs");
          v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          inputData = self->_inputData;
          self->_inputData = v41;

          v13 = v44;
        }

        v36 = v45;
      }
      else
      {
        getWFRemoteExecutionLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v45;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
          v51 = 2114;
          v52 = v45;
          _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_FAULT, "%s Failed to read single action execution from payload: %{public}@", buf, 0x16u);
        }

        v32 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v45);
      }

    }
    else
    {
      getWFRemoteExecutionLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
        v51 = 1024;
        LODWORD(v52) = v12;
        _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_FAULT, "%s Unsupported run request type: %i", buf, 0x12u);
      }

      if (!a4)
      {
        v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = CFSTR("Unsupported run request type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionRequestErrorDomain"), 1, v14);
      v32 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_33;
  }
  getWFRemoteExecutionLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
    v51 = 2114;
    v52 = v11;
    _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_FAULT, "%s Failed to read run request protobuf, %{public}@", buf, 0x16u);
  }

  v32 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_34:

  return v32;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  WFRemoteExecutionFileCoder *v29;
  void *v30;
  void *v31;
  WFRemoteExecutionFileCoder *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setPayloadType:", 1);
  v7 = (void *)objc_opt_new();
  -[WFRemoteExecutionRunRequest actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionIdentifier:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WFRemoteExecutionRunRequest variables](self, "variables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke;
  v50[3] = &unk_1E7AEEB70;
  v50[4] = self;
  v12 = v9;
  v51 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v50);

  v40 = v12;
  objc_msgSend(v7, "setVariables:", v12);
  -[WFRemoteExecutionRunRequest processedParameters](self, "processedParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v11;
  v48[1] = 3221225472;
  v48[2] = __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke_159;
  v48[3] = &unk_1E7AEEB98;
  v48[4] = self;
  v14 = v7;
  v49 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v48);

  v15 = (void *)MEMORY[0x1E0CB38B0];
  -[WFRemoteExecutionRunRequest serializedParameters](self, "serializedParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v15, "dataWithPropertyList:format:options:error:", v16, 200, 0, &v47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;
  objc_msgSend(v14, "setSerializedParameters:", v17);

  if (v18)
  {
    v19 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    v36 = v41;
  }
  else
  {
    v38 = v14;
    v39 = v6;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[WFRemoteExecutionRunRequest input](self, "input");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v22;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v28 = (void *)objc_opt_new();
          v29 = [WFRemoteExecutionFileCoder alloc];
          -[WFRemoteExecutionRunRequest coordinator](self, "coordinator");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFRemoteExecutionRequest identifier](self, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[WFRemoteExecutionFileCoder initWithCoordinator:requestIdentifier:](v29, "initWithCoordinator:requestIdentifier:", v30, v31);

          objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:fileCoder:", v27, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setItem:", v33);

          objc_msgSend(v28, "setEncodingType:", 2);
          objc_msgSend(v20, "addObject:", v28);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v24);
    }

    v14 = v38;
    objc_msgSend(v38, "setInputs:", v20);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v38, "writeTo:", v34);
    objc_msgSend(v34, "immutableData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v41;
    objc_msgSend(v41, "setPayload:", v35);

    v6 = v39;
    objc_msgSend(v41, "writeTo:", v39);
    objc_msgSend(v39, "immutableData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
  }

  return v19;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (NSMutableArray)variablesData
{
  return self->_variablesData;
}

- (void)setVariablesData:(id)a3
{
  objc_storeStrong((id *)&self->_variablesData, a3);
}

- (NSMutableArray)inputData
{
  return self->_inputData;
}

- (void)setInputData:(id)a3
{
  objc_storeStrong((id *)&self->_inputData, a3);
}

- (NSMutableArray)processedParametersData
{
  return self->_processedParametersData;
}

- (void)setProcessedParametersData:(id)a3
{
  objc_storeStrong((id *)&self->_processedParametersData, a3);
}

- (WFRemoteExecutionCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_processedParametersData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_variablesData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowID, 0);
}

void __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  WFRemoteExecutionFileCoder *v13;
  void *v14;
  void *v15;
  WFRemoteExecutionFileCoder *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v22 = v5;
  objc_msgSend(v7, "setKey:", v5);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v6;
  objc_msgSend(v6, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v13 = [WFRemoteExecutionFileCoder alloc];
        objc_msgSend(*(id *)(a1 + 32), "coordinator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[WFRemoteExecutionFileCoder initWithCoordinator:requestIdentifier:](v13, "initWithCoordinator:requestIdentifier:", v14, v15);

        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setEncodingType:", 2);
        objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:fileCoder:", v12, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setItem:", v18);

        objc_msgSend(v17, "item");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          getWFRemoteExecutionLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v29 = "-[WFRemoteExecutionRunRequest writeMessageToWriter:error:]_block_invoke";
            v30 = 2114;
            v31 = v12;
            _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s No data returned for content item in variable: %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v7, "addItems:", v17);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

void __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFRemoteExecutionFileCoder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFRemoteExecutionFileCoder *v12;

  v5 = a3;
  v6 = a2;
  v7 = [WFRemoteExecutionFileCoder alloc];
  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFRemoteExecutionFileCoder initWithCoordinator:requestIdentifier:](v7, "initWithCoordinator:requestIdentifier:", v8, v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setKey:", v6);

  objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:fileCoder:", v5, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:", v11);
  objc_msgSend(*(id *)(a1 + 40), "addProcessedParameters:", v10);

}

void __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v8 = a2;
  v9 = a4;
  +[WFParameterValueRegistry registeredValueClasses](WFParameterValueRegistry, "registeredValueClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(v8, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_2;
  v19 = &unk_1E7AEEB18;
  v20 = *(id *)(a1 + 32);
  v21 = v8;
  v22 = v9;
  v23 = a5;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v10, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "registerArchiver:", v15, v16, v17, v18, v19);
}

uint64_t __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, v5);

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[WFRemoteExecutionRunRequest inflateProcessedParametersData:fileCoordinator:completion:]_block_invoke_2";
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Reading processed parameter (%{public}@) failed", (uint8_t *)&v8, 0x16u);

    }
    **(_BYTE **)(a1 + 56) = 1;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = a2;
  objc_msgSend(v7, "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(v8, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E7AEEAA0;
  v15 = v6;
  v12 = v6;
  objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "registerArchiver:", v13);
}

void __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_139(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0D13EA8];
  v6 = a3;
  objc_msgSend(v5, "collectionWithItems:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getWFRemoteExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[WFRemoteExecutionRunRequest inflateInputData:fileCoordinator:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2;
    v14[3] = &unk_1E7AEEAC8;
    v15 = *(id *)(a1 + 32);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_132;
    v11[3] = &unk_1E7AF8790;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2_137(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "value", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = a2;
  objc_msgSend(v7, "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(v8, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_3;
  v14[3] = &unk_1E7AEEAA0;
  v15 = v6;
  v12 = v6;
  objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "registerArchiver:", v13);
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  WFRemoteExecutionKeyValuePair *v8;
  void *v9;
  WFRemoteExecutionKeyValuePair *v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  v8 = [WFRemoteExecutionKeyValuePair alloc];
  objc_msgSend(*(id *)(a1 + 32), "key");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFRemoteExecutionKeyValuePair initWithKey:value:](v8, "initWithKey:value:", v11, v9);
  (*(void (**)(uint64_t, WFRemoteExecutionKeyValuePair *, id))(v5 + 16))(v5, v10, v6);

}

uint64_t __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getWFRemoteExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[WFRemoteExecutionRunRequest inflateVariablesData:fileCoordinator:completion:]_block_invoke_3";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Done with variables: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = 0;

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Done with input: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 88);
  *(_QWORD *)(v9 + 88) = 0;

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    v13 = 2114;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Done with processedParameters: %{public}@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 96);
  *(_QWORD *)(v9 + 96) = 0;

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_125(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFRemoteExecutionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Finished inflating request", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (int64_t)version
{
  return 2;
}

@end
