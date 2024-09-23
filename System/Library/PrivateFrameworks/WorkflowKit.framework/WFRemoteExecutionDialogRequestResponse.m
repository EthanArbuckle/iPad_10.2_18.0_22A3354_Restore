@implementation WFRemoteExecutionDialogRequestResponse

- (WFRemoteExecutionDialogRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionDialogRequestResponse;
  return -[WFRemoteExecutionRequest initWithData:error:](&v5, sel_initWithData_error_, a3, a4);
}

- (WFRemoteExecutionDialogRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFRemoteExecutionDialogRequestResponse *v13;
  WFRemoteExecutionDialogRequestResponse *v14;
  WFRemoteExecutionDialogRequestResponse *v15;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionDialogRequestResponse.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originatingRequestIdentifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionDialogRequestResponse;
  v13 = -[WFRemoteExecutionRequest init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v14->_dialogResponse, a4);
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
  WFREPBDialogRequestResponse *v9;
  BOOL v10;
  id v11;
  void *v12;
  NSString *v13;
  NSString *originatingRequestIdentifier;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSError *v48;
  NSError *error;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D82B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);

  v9 = objc_alloc_init(WFREPBDialogRequestResponse);
  v57 = 0;
  v10 = -[PBCodable readFrom:error:](v9, "readFrom:error:", v8, &v57);
  v11 = v57;
  v12 = v11;
  if (v10)
  {
    v54 = v8;
    v55 = v11;
    -[WFREPBDialogRequestResponse originatingRequestIdentifier](v9, "originatingRequestIdentifier");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v13;

    -[WFREPBDialogRequestResponse dialogRequestResponseData](v9, "dialogRequestResponseData");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v51 = v20;
    v22 = (void *)v15;
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v51, v21, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(v24, "addObject:", objc_opt_class());
    v56 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v24, v15, &v56);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v56;
    v27 = v25 != 0;
    if (!v25)
    {
      getWFRemoteExecutionLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[WFRemoteExecutionDialogRequestResponse readMessageFromData:error:]";
        v60 = 2114;
        v61 = v26;
        _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_FAULT, "%s Unable to unarchive dialog response from protobuf: %{public}@", buf, 0x16u);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v26);
      goto LABEL_22;
    }
    objc_storeStrong((id *)&self->_dialogResponse, v25);
    -[WFREPBDialogRequestResponse error](v9, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
LABEL_22:

      v8 = v54;
      v12 = v55;
      goto LABEL_23;
    }
    v52 = v22;
    v53 = v26;
    -[WFREPBDialogRequestResponse error](v9, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedFailureReason");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      -[WFREPBDialogRequestResponse error](v9, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v35 = 0;
LABEL_21:
        v44 = (void *)MEMORY[0x1E0CB35C8];
        -[WFREPBDialogRequestResponse error](v9, "error");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "domain");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFREPBDialogRequestResponse error](v9, "error");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v46, (int)objc_msgSend(v47, "code"), v35);
        v48 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v48;

        v22 = v52;
        v26 = v53;
        goto LABEL_22;
      }
    }
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[WFREPBDialogRequestResponse error](v9, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedFailureReason");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[WFREPBDialogRequestResponse error](v9, "error");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedFailureReason");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v39, *MEMORY[0x1E0CB2D68]);

    }
    -[WFREPBDialogRequestResponse error](v9, "error");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[WFREPBDialogRequestResponse error](v9, "error");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v43, *MEMORY[0x1E0CB2D50]);

    }
    goto LABEL_21;
  }
  getWFRemoteExecutionLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFRemoteExecutionDialogRequestResponse readMessageFromData:error:]";
    v60 = 2114;
    v61 = v12;
    _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_FAULT, "%s Failed to read dialog response protobuf, %{public}@", buf, 0x16u);
  }

  v27 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v12);
LABEL_23:

  return v27;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6;
  WFREPBDialogRequestResponse *v7;
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
  v7 = objc_alloc_init(WFREPBDialogRequestResponse);
  -[WFRemoteExecutionDialogRequestResponse originatingRequestIdentifier](self, "originatingRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBDialogRequestResponse setOriginatingRequestIdentifier:](v7, "setOriginatingRequestIdentifier:", v8);

  v9 = (void *)MEMORY[0x1E0CB36F8];
  -[WFRemoteExecutionDialogRequestResponse dialogResponse](self, "dialogResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  if (objc_msgSend(v11, "length"))
  {
    -[WFREPBDialogRequestResponse setDialogRequestResponseData:](v7, "setDialogRequestResponseData:", v11);
    -[WFRemoteExecutionDialogRequestResponse error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(WFREPBError);
      -[WFRemoteExecutionDialogRequestResponse error](self, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setDomain:](v14, "setDomain:", v16);

      -[WFRemoteExecutionDialogRequestResponse error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setCode:](v14, "setCode:", objc_msgSend(v17, "code"));

      -[WFRemoteExecutionDialogRequestResponse error](self, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0CB2D50]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setLocalizedDescription:](v14, "setLocalizedDescription:", v20);

      -[WFRemoteExecutionDialogRequestResponse error](self, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB2D68]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFREPBError setLocalizedFailureReason:](v14, "setLocalizedFailureReason:", v23);

      -[WFREPBDialogRequestResponse setError:](v7, "setError:", v14);
    }
    -[WFREPBDialogRequestResponse writeTo:](v7, "writeTo:", v6);
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
      v29 = "-[WFRemoteExecutionDialogRequestResponse writeMessageToWriter:error:]";
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Unable to write dialog request response as data: %{public}@", buf, 0x16u);
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

- (WFDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialogResponse, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

+ (int64_t)version
{
  return 1;
}

@end
