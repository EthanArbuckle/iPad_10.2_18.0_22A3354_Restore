@implementation WFRemoteExecutionAskEachTimeRequestResponse

- (WFRemoteExecutionAskEachTimeRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAskEachTimeRequestResponse;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionAskEachTimeRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 inputtedStates:(id)a4 error:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFRemoteExecutionAskEachTimeRequestResponse *v13;
  WFRemoteExecutionAskEachTimeRequestResponse *v14;
  WFRemoteExecutionAskEachTimeRequestResponse *v15;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAskEachTimeRequestResponse.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestIdentifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionAskEachTimeRequestResponse;
  v13 = -[WFRemoteExecutionRequest init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v14->_inputtedStates, a4);
    objc_storeStrong((id *)&v14->_error, a5);
    v15 = v14;
  }

  return v14;
}

- (void)inflateInputtedStatesWithAction:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *inputtedStates;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSDictionary *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WFRemoteExecutionAskEachTimeRequestResponse inputtedStatesData](self, "inputtedStatesData");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v10, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "propertyListWithData:options:format:error:", v12, 0, 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "parameterForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "stateClass")), "initWithSerializedRepresentation:variableProvider:parameter:", v13, v4, v15);
        if (v16)
        {
          objc_msgSend(v10, "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v16, v17);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  inputtedStates = self->_inputtedStates;
  self->_inputtedStates = v5;

  -[WFRemoteExecutionAskEachTimeRequestResponse setInputtedStatesData:](self, "setInputtedStatesData:", 0);
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBAskWhenRunRequestResponse *v9;
  BOOL v10;
  id v11;
  NSString *v12;
  NSString *originatingRequestIdentifier;
  NSMutableArray *v14;
  NSMutableArray *inputtedStatesData;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSError *v26;
  NSError *error;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBAskWhenRunRequestResponse);
  v30 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v30);
  v11 = v30;
  if (v10)
  {
    -[WFREPBAskWhenRunRequestResponse originatingRequestIdentifier](v9, "originatingRequestIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v12;

    -[WFREPBAskWhenRunRequestResponse inputtedStates](v9, "inputtedStates");
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    inputtedStatesData = self->_inputtedStatesData;
    self->_inputtedStatesData = v14;

    -[WFREPBAskWhenRunRequestResponse error](v9, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (v19)
      {
        objc_msgSend(v16, "localizedDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v20, *MEMORY[0x1E0CB2D50]);

      }
      objc_msgSend(v16, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22)
      {
        objc_msgSend(v16, "localizedFailureReason");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v23, *MEMORY[0x1E0CB2D68]);

      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v16, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, (int)objc_msgSend(v16, "code"), v17);
      v26 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v26;

    }
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionAskEachTimeRequestResponse readMessageFromData:error:]";
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Failed to read ask each time request response protobuf, %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[WFRemoteExecutionAskEachTimeRequestResponse originatingRequestIdentifier](self, "originatingRequestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginatingRequestIdentifier:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WFRemoteExecutionAskEachTimeRequestResponse inputtedStates](self, "inputtedStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __74__WFRemoteExecutionAskEachTimeRequestResponse_writeMessageToWriter_error___block_invoke;
  v32[3] = &unk_1E7AF6B30;
  v10 = v8;
  v33 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v32);

  objc_msgSend(v6, "setInputtedStates:", v10);
  -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_opt_new();
    -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCode:", objc_msgSend(v13, "code"));

    -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDomain:", v15);

    -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLocalizedDescription:", v22);

    }
    -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[WFRemoteExecutionAskEachTimeRequestResponse error](self, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLocalizedFailureReason:", v29);

    }
    objc_msgSend(v6, "setError:", v12);

  }
  objc_msgSend(v6, "writeTo:", v5);
  objc_msgSend(v5, "immutableData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (NSDictionary)inputtedStates
{
  return self->_inputtedStates;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableArray)inputtedStatesData
{
  return self->_inputtedStatesData;
}

- (void)setInputtedStatesData:(id)a3
{
  objc_storeStrong((id *)&self->_inputtedStatesData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedStatesData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inputtedStates, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

void __74__WFRemoteExecutionAskEachTimeRequestResponse_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  WFREPBKeyValuePair *v10;

  v5 = a3;
  v6 = a2;
  v10 = objc_alloc_init(WFREPBKeyValuePair);
  -[WFREPBKeyValuePair setKey:](v10, "setKey:", v6);

  v7 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(v5, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBKeyValuePair setValue:](v10, "setValue:", v9);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
}

+ (int64_t)version
{
  return 1;
}

@end
