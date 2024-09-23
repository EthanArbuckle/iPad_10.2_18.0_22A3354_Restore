@implementation WFRemoteExecutionAlertRequestResponse

- (WFRemoteExecutionAlertRequestResponse)initWithSelectedButton:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFRemoteExecutionAlertRequestResponse *v13;
  WFRemoteExecutionAlertRequestResponse *v14;
  WFRemoteExecutionAlertRequestResponse *v15;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAlertRequestResponse.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestIdentifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionAlertRequestResponse;
  v13 = -[WFRemoteExecutionRequest init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestIdentifier, a4);
    objc_storeStrong((id *)&v14->_selectedButton, a3);
    objc_storeStrong((id *)&v14->_error, a5);
    v15 = v14;
  }

  return v14;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBAlertRequestResponse *v9;
  BOOL v10;
  id v11;
  NSString *v12;
  NSString *requestIdentifier;
  NSString *v14;
  NSString *selectedButton;
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

  v9 = objc_alloc_init(WFREPBAlertRequestResponse);
  v30 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v30);
  v11 = v30;
  if (v10)
  {
    -[WFREPBAlertRequestResponse requestIdentifier](v9, "requestIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v12;

    -[WFREPBAlertRequestResponse selectedButton](v9, "selectedButton");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectedButton = self->_selectedButton;
    self->_selectedButton = v14;

    -[WFREPBAlertRequestResponse error](v9, "error");
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
      v32 = "-[WFRemoteExecutionAlertRequestResponse readMessageFromData:error:]";
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Failed to read alert request response protobuf, %{public}@", buf, 0x16u);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[WFRemoteExecutionAlertRequestResponse requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestIdentifier:", v7);

  -[WFRemoteExecutionAlertRequestResponse selectedButton](self, "selectedButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedButton:", v8);

  -[WFRemoteExecutionAlertRequestResponse error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    -[WFRemoteExecutionAlertRequestResponse error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDomain:", v12);

    -[WFRemoteExecutionAlertRequestResponse error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCode:", objc_msgSend(v13, "code"));

    -[WFRemoteExecutionAlertRequestResponse error](self, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocalizedDescription:", v16);

    -[WFRemoteExecutionAlertRequestResponse error](self, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocalizedFailureReason:", v19);

    objc_msgSend(v6, "setError:", v10);
  }
  objc_msgSend(v6, "writeTo:", v5);
  objc_msgSend(v5, "immutableData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)selectedButton
{
  return self->_selectedButton;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

+ (int64_t)version
{
  return 1;
}

@end
