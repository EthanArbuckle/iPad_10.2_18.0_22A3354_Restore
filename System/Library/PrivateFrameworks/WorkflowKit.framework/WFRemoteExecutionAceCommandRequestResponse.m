@implementation WFRemoteExecutionAceCommandRequestResponse

- (WFRemoteExecutionAceCommandRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAceCommandRequestResponse;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionAceCommandRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFRemoteExecutionAceCommandRequestResponse *v12;
  WFRemoteExecutionAceCommandRequestResponse *v13;
  WFRemoteExecutionAceCommandRequestResponse *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFRemoteExecutionAceCommandRequestResponse;
  v12 = -[WFRemoteExecutionRequest init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v13->_aceCommandResponseDictionary, a4);
    objc_storeStrong((id *)&v13->_error, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  WFREPBAceCommandRequestResponse *v9;
  BOOL v10;
  id v11;
  NSString *v12;
  NSString *originatingRequestIdentifier;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSError *v43;
  NSError *error;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBAceCommandRequestResponse);
  v51 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v51);
  v11 = v51;
  if (v10)
  {
    -[WFREPBAceCommandRequestResponse originatingRequestIdentifier](v9, "originatingRequestIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v12;

    -[WFREPBAceCommandRequestResponse aceCommandResponseData](v9, "aceCommandResponseData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v18, v14, &v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v50;
    v21 = v19 != 0;
    if (!v19)
    {
      getWFRemoteExecutionLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[WFRemoteExecutionAceCommandRequestResponse readMessageFromData:error:]";
        v54 = 2114;
        v55 = v20;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_FAULT, "%s Unable to unarchive ace command response dictionary from protobuf: %{public}@", buf, 0x16u);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v20);
      goto LABEL_22;
    }
    objc_storeStrong((id *)&self->_aceCommandResponseDictionary, v19);
    -[WFREPBAceCommandRequestResponse error](v9, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_22:

      goto LABEL_23;
    }
    v47 = v20;
    v49 = v14;
    -[WFREPBAceCommandRequestResponse error](v9, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedFailureReason");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v18;
    v46 = v11;
    if (v24)
    {

    }
    else
    {
      -[WFREPBAceCommandRequestResponse error](v9, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v38 = 0;
LABEL_21:
        v39 = (void *)MEMORY[0x1E0CB35C8];
        -[WFREPBAceCommandRequestResponse error](v9, "error");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "domain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFREPBAceCommandRequestResponse error](v9, "error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", v41, (int)objc_msgSend(v42, "code"), v38);
        v43 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v43;

        v18 = v48;
        v14 = v49;
        v11 = v46;
        v20 = v47;
        goto LABEL_22;
      }
    }
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[WFREPBAceCommandRequestResponse error](v9, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedFailureReason");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[WFREPBAceCommandRequestResponse error](v9, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedFailureReason");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v33, *MEMORY[0x1E0CB2D68]);

    }
    -[WFREPBAceCommandRequestResponse error](v9, "error");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[WFREPBAceCommandRequestResponse error](v9, "error");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v37, *MEMORY[0x1E0CB2D50]);

    }
    v38 = v29;
    goto LABEL_21;
  }
  getWFRemoteExecutionLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[WFRemoteExecutionAceCommandRequestResponse readMessageFromData:error:]";
    v54 = 2114;
    v55 = v11;
    _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Failed to read ace command request response protobuf, %{public}@", buf, 0x16u);
  }

  v21 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_23:

  return v21;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBAceCommandRequestResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  WFREPBError *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(WFREPBAceCommandRequestResponse);
  -[WFRemoteExecutionAceCommandRequestResponse originatingRequestIdentifier](self, "originatingRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAceCommandRequestResponse setOriginatingRequestIdentifier:](v7, "setOriginatingRequestIdentifier:", v8);

  v9 = (void *)MEMORY[0x1E0CB36F8];
  -[WFRemoteExecutionAceCommandRequestResponse aceCommandResponseDictionary](self, "aceCommandResponseDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  if (objc_msgSend(v11, "length"))
  {
    -[WFREPBAceCommandRequestResponse setAceCommandResponseData:](v7, "setAceCommandResponseData:", v11);
    -[WFRemoteExecutionAceCommandRequestResponse error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(WFREPBError);
      -[WFRemoteExecutionAceCommandRequestResponse error](self, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setDomain:](v14, "setDomain:", v16);

      -[WFRemoteExecutionAceCommandRequestResponse error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setCode:](v14, "setCode:", objc_msgSend(v17, "code"));

      -[WFRemoteExecutionAceCommandRequestResponse error](self, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0CB2D50]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setLocalizedDescription:](v14, "setLocalizedDescription:", v20);

      -[WFRemoteExecutionAceCommandRequestResponse error](self, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB2D68]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setLocalizedFailureReason:](v14, "setLocalizedFailureReason:", v23);

      -[WFREPBAceCommandRequestResponse setError:](v7, "setError:", v14);
    }
    -[WFREPBAceCommandRequestResponse writeTo:](v7, "writeTo:", v6);
    objc_msgSend(v6, "immutableData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFRemoteExecutionAceCommandRequestResponse writeMessageToWriter:error:]";
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Unable to write ace command response dictionary as data: %{public}@", buf, 0x16u);
    }

    v24 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v24;
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (NSDictionary)aceCommandResponseDictionary
{
  return self->_aceCommandResponseDictionary;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_aceCommandResponseDictionary, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

+ (int64_t)version
{
  return 1;
}

@end
