@implementation WFRemoteExecutionRunRequestResponse

- (WFRemoteExecutionRunRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionRunRequestResponse;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionRunRequestResponse)initWithRunRequestIdentifier:(id)a3 variables:(id)a4 output:(id)a5 error:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFRemoteExecutionRunRequestResponse *v16;
  WFRemoteExecutionRunRequestResponse *v17;
  WFRemoteExecutionRunRequestResponse *v18;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionRunRequestResponse.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runRequestIdentifier"));

  }
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionRunRequestResponse;
  v16 = -[WFRemoteExecutionRequest init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_runRequestIdentifier, a3);
    objc_storeStrong((id *)&v17->_variables, a4);
    objc_storeStrong((id *)&v17->_output, a5);
    objc_storeStrong((id *)&v17->_error, a6);
    v18 = v17;
  }

  return v17;
}

- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4
{
  void *v4;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFREPBError *v16;
  void *v17;
  WFREPBError *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSError *v30;
  NSError *error;
  NSData *errorData;
  NSObject *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  _QWORD v38[5];
  NSObject *v39;
  _QWORD *v40;
  _QWORD v41[5];
  NSObject *v42;
  _QWORD *v43;
  _QWORD v44[5];
  id v45;

  v7 = a3;
  v8 = a4;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__2749;
  v44[4] = __Block_byref_object_dispose__2750;
  v45 = 0;
  v9 = dispatch_group_create();
  -[WFRemoteExecutionRunRequestResponse variablesData](self, "variablesData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    dispatch_group_enter(v9);
    -[WFRemoteExecutionRunRequestResponse variablesData](self, "variablesData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke;
    v41[3] = &unk_1E7AEEA50;
    v41[4] = self;
    v43 = v44;
    v42 = v9;
    -[WFRemoteExecutionRunRequestResponse inflateVariablesData:fileCoordinator:completion:](self, "inflateVariablesData:fileCoordinator:completion:", v12, v7, v41);

  }
  -[WFRemoteExecutionRunRequestResponse outputData](self, "outputData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    dispatch_group_enter(v9);
    -[WFRemoteExecutionRunRequestResponse outputData](self, "outputData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_2;
    v38[3] = &unk_1E7AEEA78;
    v38[4] = self;
    v40 = v44;
    v39 = v9;
    -[WFRemoteExecutionRunRequestResponse inflateOutputData:fileCoordinator:completion:](self, "inflateOutputData:fileCoordinator:completion:", v14, v7, v38);

  }
  -[WFRemoteExecutionRunRequestResponse errorData](self, "errorData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [WFREPBError alloc];
    -[WFRemoteExecutionRunRequestResponse errorData](self, "errorData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFREPBError initWithData:](v16, "initWithData:", v17);

    -[WFREPBError localizedDescription](v18, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    if (v20
      || (-[WFREPBError localizedFailureReason](v18, "localizedFailureReason"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "length")))
    {
      v21 = (void *)objc_opt_new();
      if (v20)
      {
LABEL_12:

        -[WFREPBError localizedDescription](v18, "localizedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (v23)
        {
          -[WFREPBError localizedDescription](v18, "localizedDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v24, *MEMORY[0x1E0CB2D50]);

        }
        -[WFREPBError localizedFailureReason](v18, "localizedFailureReason");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
        {
          -[WFREPBError localizedFailureReason](v18, "localizedFailureReason");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v27, *MEMORY[0x1E0CB2D68]);

        }
        v28 = (void *)MEMORY[0x1E0CB35C8];
        -[WFREPBError domain](v18, "domain");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, (int)-[WFREPBError code](v18, "code"), v21);
        v30 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v30;

        errorData = self->_errorData;
        self->_errorData = 0;

        goto LABEL_17;
      }
    }
    else
    {
      v21 = 0;
    }

    goto LABEL_12;
  }
LABEL_17:
  dispatch_get_global_queue(0, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_3;
  v35[3] = &unk_1E7AF7FA0;
  v35[4] = self;
  v36 = v8;
  v37 = v44;
  v34 = v8;
  dispatch_group_notify(v9, v33, v35);

  _Block_object_dispose(v44, 8);
}

- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "if_map:", &__block_literal_global_2743);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E7AEEAF0;
  v15 = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2_129;
  v12[3] = &unk_1E7AF6C78;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v12);

}

- (void)inflateOutputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "if_map:", &__block_literal_global_131_2733);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E7AEEAC8;
  v15 = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_133;
  v12[3] = &unk_1E7AF6C78;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v12);

}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  WFREPBRunRequestResponse *v8;
  BOOL v9;
  id v10;
  NSString *v11;
  NSString *runRequestIdentifier;
  NSMutableArray *v13;
  NSMutableArray *variablesData;
  NSMutableArray *v15;
  NSMutableArray *outputData;
  NSData *v17;
  NSObject *p_super;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D82B90];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

  v8 = objc_alloc_init(WFREPBRunRequestResponse);
  v20 = 0;
  v9 = -[PBCodable readFrom:error:](v8, "readFrom:error:", v7, &v20);
  v10 = v20;
  if (v9)
  {
    -[WFREPBRunRequestResponse runRequestIdentifier](v8, "runRequestIdentifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    runRequestIdentifier = self->_runRequestIdentifier;
    self->_runRequestIdentifier = v11;

    -[WFREPBRunRequestResponse variablesDatas](v8, "variablesDatas");
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    variablesData = self->_variablesData;
    self->_variablesData = v13;

    -[WFREPBRunRequestResponse outputDatas](v8, "outputDatas");
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    outputData = self->_outputData;
    self->_outputData = v15;

    -[WFREPBRunRequestResponse errorData](v8, "errorData");
    v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_errorData->super;
    self->_errorData = v17;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFRemoteExecutionRunRequestResponse readMessageFromData:error:]";
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1C15B3000, p_super, OS_LOG_TYPE_FAULT, "%s Failed to read run request response protobuf, %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  WFRemoteExecutionFileCoder *v17;
  void *v18;
  void *v19;
  WFRemoteExecutionFileCoder *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  id obj;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v5 = (void *)objc_opt_new();
  -[WFRemoteExecutionRunRequestResponse runRequestIdentifier](self, "runRequestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRunRequestIdentifier:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WFRemoteExecutionRunRequestResponse variables](self, "variables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __66__WFRemoteExecutionRunRequestResponse_writeMessageToWriter_error___block_invoke;
  v55[3] = &unk_1E7AEEB70;
  v55[4] = self;
  v9 = v7;
  v56 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v55);

  v46 = v9;
  v47 = v5;
  objc_msgSend(v5, "setVariablesDatas:", v9);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[WFRemoteExecutionRunRequestResponse output](self, "output");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v17 = [WFRemoteExecutionFileCoder alloc];
        -[WFRemoteExecutionRunRequestResponse coordinator](self, "coordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRemoteExecutionRequest identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[WFRemoteExecutionFileCoder initWithCoordinator:requestIdentifier:](v17, "initWithCoordinator:requestIdentifier:", v18, v19);

        v21 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:fileCoder:", v16, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setItem:", v22);

        objc_msgSend(v21, "setEncodingType:", 2);
        objc_msgSend(v21, "data");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v23);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v13);
  }

  objc_msgSend(v47, "setOutputDatas:", v50);
  -[WFRemoteExecutionRunRequestResponse error](self, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)objc_opt_new();
    -[WFRemoteExecutionRunRequestResponse error](self, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCode:", objc_msgSend(v26, "code"));

    -[WFRemoteExecutionRunRequestResponse error](self, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDomain:", v28);

    -[WFRemoteExecutionRunRequestResponse error](self, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[WFRemoteExecutionRunRequestResponse error](self, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLocalizedDescription:", v35);

    }
    -[WFRemoteExecutionRunRequestResponse error](self, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "userInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[WFRemoteExecutionRunRequestResponse error](self, "error");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "userInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLocalizedFailureReason:", v42);

    }
    objc_msgSend(v25, "data");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setErrorData:", v43);

  }
  objc_msgSend(v47, "writeTo:", v48);
  objc_msgSend(v48, "immutableData");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (WFContentCollection)output
{
  return self->_output;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableArray)variablesData
{
  return self->_variablesData;
}

- (void)setVariablesData:(id)a3
{
  objc_storeStrong((id *)&self->_variablesData, a3);
}

- (NSMutableArray)outputData
{
  return self->_outputData;
}

- (void)setOutputData:(id)a3
{
  objc_storeStrong((id *)&self->_outputData, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
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
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_variablesData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
}

void __66__WFRemoteExecutionRunRequestResponse_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v21 = v5;
  objc_msgSend(v7, "setKey:", v5);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
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

        objc_msgSend(v7, "addItems:", v17);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v19 = *(void **)(a1 + 40);
  objc_msgSend(v7, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

}

void __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v14[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_3;
  v14[3] = &unk_1E7AEEAA0;
  v15 = v6;
  v12 = v6;
  objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "registerArchiver:", v13);
}

void __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_133(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_3(uint64_t a1, uint64_t a2)
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
    v6 = "-[WFRemoteExecutionRunRequestResponse inflateOutputData:fileCoordinator:completion:]_block_invoke_3";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

WFREPBContentItem *__84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFREPBContentItem *v3;

  v2 = a2;
  v3 = -[WFREPBContentItem initWithData:]([WFREPBContentItem alloc], "initWithData:", v2);

  return v3;
}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  objc_msgSend(v6, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_3;
  v16[3] = &unk_1E7AEEAC8;
  v17 = *(id *)(a1 + 32);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_124;
  v13[3] = &unk_1E7AF8790;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v16, v13);

}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2_129(uint64_t a1, void *a2, void *a3)
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

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v14[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_4;
  v14[3] = &unk_1E7AEEAA0;
  v15 = v6;
  v12 = v6;
  objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "registerArchiver:", v13);
}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_124(uint64_t a1, void *a2, void *a3)
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

uint64_t __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_4(uint64_t a1, uint64_t a2)
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
    v6 = "-[WFRemoteExecutionRunRequestResponse inflateVariablesData:fileCoordinator:completion:]_block_invoke_4";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

WFREPBVariable *__87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFREPBVariable *v3;

  v2 = a2;
  v3 = -[WFREPBVariable initWithData:]([WFREPBVariable alloc], "initWithData:", v2);

  return v3;
}

void __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = 0;

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (int64_t)version
{
  return 1;
}

@end
