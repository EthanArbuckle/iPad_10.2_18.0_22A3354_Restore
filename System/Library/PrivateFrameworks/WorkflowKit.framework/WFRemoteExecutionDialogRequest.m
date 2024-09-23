@implementation WFRemoteExecutionDialogRequest

- (WFRemoteExecutionDialogRequest)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionDialogRequest;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionDialogRequest)initWithDialogRequest:(id)a3 runRequestIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFRemoteExecutionDialogRequest *v10;
  uint64_t v11;
  WFDialogRequest *dialogRequest;
  WFRemoteExecutionDialogRequest *v13;
  void *v15;
  void *v16;
  objc_super v17;

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
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionDialogRequest.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dialogRequest"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionDialogRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runRequestIdentifier"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionDialogRequest;
  v10 = -[WFRemoteExecutionRequest init](&v17, sel_init);
  if (v10)
  {
    objc_msgSend(v7, "requestByCompactingRequest");
    v11 = objc_claimAutoreleasedReturnValue();
    dialogRequest = v10->_dialogRequest;
    v10->_dialogRequest = (WFDialogRequest *)v11;

    objc_storeStrong((id *)&v10->_runRequestIdentifier, a4);
    v13 = v10;
  }

  return v10;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBDialogRequest *v9;
  BOOL v10;
  id v11;
  void *v12;
  NSString *v13;
  NSString *runRequestIdentifier;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  WFDialogRequest *v24;
  id v25;
  WFDialogRequest *dialogRequest;
  WFDialogRequest *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  id *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBDialogRequest);
  v35 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v35);
  v11 = v35;
  v12 = v11;
  if (v10)
  {
    v32 = a4;
    v33 = v11;
    -[WFREPBDialogRequest runRequestIdentifier](v9, "runRequestIdentifier");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    runRequestIdentifier = self->_runRequestIdentifier;
    self->_runRequestIdentifier = v13;

    -[WFREPBDialogRequest dialogRequestData](v9, "dialogRequestData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v23, "addObject:", objc_opt_class());
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v23, v15, &v34);
    v24 = (WFDialogRequest *)objc_claimAutoreleasedReturnValue();
    v25 = v34;
    dialogRequest = self->_dialogRequest;
    self->_dialogRequest = v24;

    v27 = self->_dialogRequest;
    v28 = v27 != 0;
    if (!v27)
    {
      getWFRemoteExecutionLogObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[WFRemoteExecutionDialogRequest readMessageFromData:error:]";
        v38 = 2114;
        v39 = v25;
        _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_FAULT, "%s Unable to convert data into dialog request: %{public}@", buf, 0x16u);
      }

      if (v32)
        *v32 = objc_retainAutorelease(v25);
    }

    v12 = v33;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[WFRemoteExecutionDialogRequest readMessageFromData:error:]";
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_FAULT, "%s Failed to read dialog request protobuf, %{public}@", buf, 0x16u);
    }

    v28 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v28;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBDialogRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(WFREPBDialogRequest);
  v8 = (void *)MEMORY[0x1E0CB36F8];
  -[WFRemoteExecutionDialogRequest dialogRequest](self, "dialogRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (v10)
  {
    -[WFREPBDialogRequest setDialogRequestData:](v7, "setDialogRequestData:", v10);
    -[WFRemoteExecutionDialogRequest runRequestIdentifier](self, "runRequestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFREPBDialogRequest setRunRequestIdentifier:](v7, "setRunRequestIdentifier:", v12);

    -[WFREPBDialogRequest writeTo:](v7, "writeTo:", v6);
    objc_msgSend(v6, "immutableData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionDialogRequest writeMessageToWriter:error:]";
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Unable to archive dialog request: %{public}@", buf, 0x16u);
    }

    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v13;
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (WFDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
}

+ (int64_t)version
{
  return 1;
}

@end
