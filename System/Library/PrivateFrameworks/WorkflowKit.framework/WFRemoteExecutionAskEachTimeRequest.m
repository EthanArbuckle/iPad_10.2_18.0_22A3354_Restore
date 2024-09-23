@implementation WFRemoteExecutionAskEachTimeRequest

- (WFRemoteExecutionAskEachTimeRequest)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAskEachTimeRequest;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionAskEachTimeRequest)initWithAction:(id)a3 parameters:(id)a4 associatedRunRequestIdentifier:(id)a5 possibleStatesByParameterKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFRemoteExecutionAskEachTimeRequest *v15;
  WFRemoteExecutionAskEachTimeRequest *v16;
  uint64_t v17;
  NSString *actionIdentifier;
  uint64_t v19;
  NSDictionary *actionSerializedParameters;
  NSDictionary *v21;
  NSArray *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSArray *parameterKeys;
  NSArray *v31;
  NSDictionary *parameterKeysAndStates;
  NSDictionary *v33;
  WFRemoteExecutionAskEachTimeRequest *v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAskEachTimeRequest.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

    if (v13)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAskEachTimeRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v12)
    goto LABEL_17;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAskEachTimeRequest.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("associatedRunRequestIdentifier"));

LABEL_4:
  v47.receiver = self;
  v47.super_class = (Class)WFRemoteExecutionAskEachTimeRequest;
  v15 = -[WFRemoteExecutionRequest init](&v47, sel_init);
  v16 = v15;
  if (v15)
  {
    v39 = v14;
    v40 = v13;
    obj = a6;
    objc_storeStrong((id *)&v15->_associatedRunRequestIdentifier, a5);
    objc_msgSend(v11, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v16->_actionIdentifier;
    v16->_actionIdentifier = (NSString *)v17;

    objc_msgSend(v11, "serializedParameters");
    v19 = objc_claimAutoreleasedReturnValue();
    actionSerializedParameters = v16->_actionSerializedParameters;
    v16->_actionSerializedParameters = (NSDictionary *)v19;

    v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v12;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v27), "key");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v22, "addObject:", v28);
          objc_msgSend(v11, "parameterStateForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            -[NSDictionary setObject:forKey:](v21, "setObject:forKey:", v29, v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v25);
    }

    parameterKeys = v16->_parameterKeys;
    v16->_parameterKeys = v22;
    v31 = v22;

    parameterKeysAndStates = v16->_parameterKeysAndStates;
    v16->_parameterKeysAndStates = v21;
    v33 = v21;

    objc_storeStrong((id *)&v16->_possibleStatesByParameterKey, obj);
    v34 = v16;
    v12 = v42;
    v14 = v39;
    v13 = v40;
  }

  return v16;
}

- (void)inflateParameterStatesWithAction:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSDictionary *possibleStatesByParameterKey;
  WFRemoteExecutionAskEachTimeRequest *v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  if (v45)
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v37 = self;
    -[WFRemoteExecutionAskEachTimeRequest parameterKeysAndStatesData](self, "parameterKeysAndStatesData");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v5, "key");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "parameterForKey:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "stateClass");
          if (v8)
          {
            v9 = (objc_class *)v8;
            v42 = v7;
            v43 = v6;
            v10 = (void *)MEMORY[0x1E0CB3710];
            v11 = (void *)MEMORY[0x1E0C99E60];
            v12 = objc_opt_class();
            v13 = objc_opt_class();
            v14 = objc_opt_class();
            v15 = objc_opt_class();
            v16 = objc_opt_class();
            objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v17, v18, &v53);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v53;

            if (v19)
            {
              v7 = v42;
              v21 = objc_msgSend([v9 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v19, 0, v42);
              v6 = v43;
              if (v21)
              {
                v22 = v21;
                objc_msgSend(v38, "setObject:forKey:", v21, v43);
              }
              else
              {
                getWFRemoteExecutionLogObject();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v60 = "-[WFRemoteExecutionAskEachTimeRequest inflateParameterStatesWithAction:]";
                  v61 = 2114;
                  v62 = v43;
                  v63 = 2114;
                  v64 = v20;
                  _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s An error occurred when inflating parameter (%{public}@) state data, error: %{public}@", buf, 0x20u);
                }

                v22 = 0;
              }
            }
            else
            {
              getWFRemoteExecutionLogObject();
              v22 = objc_claimAutoreleasedReturnValue();
              v7 = v42;
              v6 = v43;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v60 = "-[WFRemoteExecutionAskEachTimeRequest inflateParameterStatesWithAction:]";
                v61 = 2114;
                v62 = v43;
                v63 = 2114;
                v64 = v20;
                _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s An error occurred when inflating serialized data for key %{public}@, error: %{public}@", buf, 0x20u);
              }
            }

          }
        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v41);
    }

    objc_storeStrong((id *)&v37->_parameterKeysAndStates, v38);
    -[WFRemoteExecutionAskEachTimeRequest setParameterKeysAndStatesData:](v37, "setParameterKeysAndStatesData:", 0);
    v24 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[WFRemoteExecutionAskEachTimeRequest possibleStatesByParameterKeyData](v37, "possibleStatesByParameterKeyData");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(v44);
          v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v29, "key");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "parameterForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "singleStateClass");
          if (v32)
          {
            v33 = v32;
            objc_msgSend(v29, "values");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __72__WFRemoteExecutionAskEachTimeRequest_inflateParameterStatesWithAction___block_invoke;
            v46[3] = &unk_1E7AEABF0;
            v48 = v33;
            v47 = v31;
            objc_msgSend(v34, "if_map:", v46);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSDictionary setObject:forKey:](v24, "setObject:forKey:", v35, v30);
          }

        }
        v26 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v26);
    }

    possibleStatesByParameterKey = v37->_possibleStatesByParameterKey;
    v37->_possibleStatesByParameterKey = v24;

    -[WFRemoteExecutionAskEachTimeRequest setPossibleStatesByParameterKeyData:](v37, "setPossibleStatesByParameterKeyData:", 0);
  }

}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBAskWhenRunRequest *v9;
  BOOL v10;
  id v11;
  NSString *v12;
  NSString *associatedRunRequestIdentifier;
  NSArray *v14;
  NSArray *parameterKeys;
  NSMutableArray *v16;
  NSMutableArray *parameterKeysAndStatesData;
  NSString *v18;
  NSString *actionIdentifier;
  NSMutableArray *v20;
  NSMutableArray *possibleStatesByParameterKeyData;
  void *v22;
  void *v23;
  NSDictionary *v24;
  id v25;
  NSDictionary *actionSerializedParameters;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBAskWhenRunRequest);
  v32 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v32);
  v11 = v32;
  if (v10)
  {
    -[WFREPBAskWhenRunRequest associatedRunRequestIdentifier](v9, "associatedRunRequestIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
    self->_associatedRunRequestIdentifier = v12;

    -[WFREPBAskWhenRunRequest parameterKeys](v9, "parameterKeys");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    parameterKeys = self->_parameterKeys;
    self->_parameterKeys = v14;

    -[WFREPBAskWhenRunRequest parameterKeysAndStates](v9, "parameterKeysAndStates");
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    parameterKeysAndStatesData = self->_parameterKeysAndStatesData;
    self->_parameterKeysAndStatesData = v16;

    -[WFREPBAskWhenRunRequest actionIdentifier](v9, "actionIdentifier");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    actionIdentifier = self->_actionIdentifier;
    self->_actionIdentifier = v18;

    -[WFREPBAskWhenRunRequest possibleStates](v9, "possibleStates");
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    possibleStatesByParameterKeyData = self->_possibleStatesByParameterKeyData;
    self->_possibleStatesByParameterKeyData = v20;

    v22 = (void *)MEMORY[0x1E0CB38B0];
    -[WFREPBAskWhenRunRequest actionSerializedParameters](v9, "actionSerializedParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v22, "propertyListWithData:options:format:error:", v23, 0, 0, &v31);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v25 = v31;
    actionSerializedParameters = self->_actionSerializedParameters;
    self->_actionSerializedParameters = v24;

    if (!self->_actionSerializedParameters)
    {
      getWFRemoteExecutionLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        -[WFREPBAskWhenRunRequest actionSerializedParameters](v9, "actionSerializedParameters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v34 = "-[WFRemoteExecutionAskEachTimeRequest readMessageFromData:error:]";
        v35 = 2114;
        v36 = v28;
        v37 = 2114;
        v38 = v25;
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_ERROR, "%s An error occurred when decoding object (%{public}@), error: %{public}@", buf, 0x20u);

      }
      if (a4)
        *a4 = objc_retainAutorelease(v25);
    }

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFRemoteExecutionAskEachTimeRequest readMessageFromData:error:]";
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_FAULT, "%s Failed to read ask each time request protobuf, %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[WFRemoteExecutionAskEachTimeRequest associatedRunRequestIdentifier](self, "associatedRunRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssociatedRunRequestIdentifier:", v8);

  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[WFRemoteExecutionAskEachTimeRequest parameterKeys](self, "parameterKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);
  objc_msgSend(v7, "setParameterKeys:", v11);

  -[WFRemoteExecutionAskEachTimeRequest actionIdentifier](self, "actionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionIdentifier:", v12);

  v13 = (void *)MEMORY[0x1E0CB38B0];
  -[WFRemoteExecutionAskEachTimeRequest actionSerializedParameters](self, "actionSerializedParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v13, "dataWithPropertyList:format:options:error:", v14, 200, 0, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v29;
  objc_msgSend(v7, "setActionSerializedParameters:", v15);

  objc_msgSend(v7, "actionSerializedParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[WFRemoteExecutionAskEachTimeRequest parameterKeysAndStates](self, "parameterKeysAndStates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke;
    v27[3] = &unk_1E7AF6B30;
    v20 = v7;
    v28 = v20;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v27);

    -[WFRemoteExecutionAskEachTimeRequest possibleStatesByParameterKey](self, "possibleStatesByParameterKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_2;
    v25[3] = &unk_1E7AF1C88;
    v22 = v20;
    v26 = v22;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v25);

    objc_msgSend(v22, "writeTo:", v6);
    objc_msgSend(v6, "immutableData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return v23;
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (NSArray)parameterKeys
{
  return self->_parameterKeys;
}

- (NSDictionary)parameterKeysAndStates
{
  return self->_parameterKeysAndStates;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)actionSerializedParameters
{
  return self->_actionSerializedParameters;
}

- (NSDictionary)possibleStatesByParameterKey
{
  return self->_possibleStatesByParameterKey;
}

- (NSMutableArray)parameterKeysAndStatesData
{
  return self->_parameterKeysAndStatesData;
}

- (void)setParameterKeysAndStatesData:(id)a3
{
  objc_storeStrong((id *)&self->_parameterKeysAndStatesData, a3);
}

- (NSMutableArray)possibleStatesByParameterKeyData
{
  return self->_possibleStatesByParameterKeyData;
}

- (void)setPossibleStatesByParameterKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_possibleStatesByParameterKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStatesByParameterKeyData, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStatesData, 0);
  objc_storeStrong((id *)&self->_possibleStatesByParameterKey, 0);
  objc_storeStrong((id *)&self->_actionSerializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStates, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
}

void __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v7 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v5, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBKeyValuePair setValue:](v10, "setValue:", v9);

  objc_msgSend(*(id *)(a1 + 32), "addParameterKeysAndStates:", v10);
}

void __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  WFREPBRepeatedKeyValuePair *v9;

  v5 = a3;
  v6 = a2;
  v9 = objc_alloc_init(WFREPBRepeatedKeyValuePair);
  -[WFREPBRepeatedKeyValuePair setKey:](v9, "setKey:", v6);

  objc_msgSend(v5, "if_map:", &__block_literal_global_2342);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRepeatedKeyValuePair setValues:](v9, "setValues:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addPossibleStates:", v9);
}

id __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(a2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__WFRemoteExecutionAskEachTimeRequest_inflateParameterStatesWithAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a2, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithSerializedRepresentation:variableProvider:parameter:", v3, 0, *(_QWORD *)(a1 + 32));

  return v4;
}

+ (int64_t)version
{
  return 1;
}

@end
