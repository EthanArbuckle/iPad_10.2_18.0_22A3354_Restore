@implementation WFRemoteExecutionAceCommandRequest

- (WFRemoteExecutionAceCommandRequest)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAceCommandRequest;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionAceCommandRequest)initWithAceCommandDictionary:(id)a3
{
  id v5;
  WFRemoteExecutionAceCommandRequest *v6;
  WFRemoteExecutionAceCommandRequest *v7;
  WFRemoteExecutionAceCommandRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteExecutionAceCommandRequest;
  v6 = -[WFRemoteExecutionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aceCommandDictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBAceCommandRequest *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSDictionary *v21;
  id v22;
  NSDictionary *aceCommandDictionary;
  NSDictionary *v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  id *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBAceCommandRequest);
  v32 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v32);
  v11 = v32;
  v12 = v11;
  if (v10)
  {
    v29 = a4;
    v30 = v11;
    -[WFREPBAceCommandRequest aceCommandData](v9, "aceCommandData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v20, v13, &v31);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = v31;
    aceCommandDictionary = self->_aceCommandDictionary;
    self->_aceCommandDictionary = v21;

    v24 = self->_aceCommandDictionary;
    v25 = v24 != 0;
    if (!v24)
    {
      getWFRemoteExecutionLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFRemoteExecutionAceCommandRequest readMessageFromData:error:]";
        v35 = 2114;
        v36 = v22;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_FAULT, "%s Unable to convert data into the ace command's dictionary representation: %{public}@", buf, 0x16u);
      }

      if (v29)
        *v29 = objc_retainAutorelease(v22);
    }

    v12 = v30;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFRemoteExecutionAceCommandRequest readMessageFromData:error:]";
      v35 = 2114;
      v36 = v12;
      _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Failed to read ace command protobuf, %{public}@", buf, 0x16u);
    }

    v25 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v25;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBAceCommandRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(WFREPBAceCommandRequest);
  v8 = (void *)MEMORY[0x1E0CB36F8];
  -[WFRemoteExecutionAceCommandRequest aceCommandDictionary](self, "aceCommandDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    -[WFREPBAceCommandRequest setAceCommandData:](v7, "setAceCommandData:", v10);
    -[WFREPBAceCommandRequest writeTo:](v7, "writeTo:", v6);
    objc_msgSend(v6, "immutableData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFRemoteExecutionAceCommandRequest writeMessageToWriter:error:]";
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Unable to archive ace command dictionary: %{public}@", buf, 0x16u);
    }

    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v12;
}

- (NSDictionary)aceCommandDictionary
{
  return self->_aceCommandDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceCommandDictionary, 0);
}

+ (int64_t)version
{
  return 1;
}

@end
