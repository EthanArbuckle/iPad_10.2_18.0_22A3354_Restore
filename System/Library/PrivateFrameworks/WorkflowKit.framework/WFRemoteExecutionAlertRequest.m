@implementation WFRemoteExecutionAlertRequest

+ (int64_t)version
{
  return 1;
}

- (WFRemoteExecutionAlertRequest)initWithAlert:(id)a3 associatedRunRequestIdentifier:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFRemoteExecutionAlertRequest *v11;
  WFRemoteExecutionAlertRequest *v12;
  WFRemoteExecutionAlertRequest *v13;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAlertRequest.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alert"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionAlertRequest.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runRequestIdentifier"));

LABEL_3:
  v11 = -[WFRemoteExecutionRequest init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_associatedRunRequestIdentifier, a4);
    objc_storeStrong((id *)&v12->_alert, a3);
    v13 = v12;
  }

  return v12;
}

- (void)inflateAlertWithBlock:(id)a3
{
  id v5;
  WFAlert *v6;
  WFAlert *alert;
  id v8;

  v5 = a3;
  -[WFRemoteExecutionAlertRequest pbAlert](self, "pbAlert");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v8);
  v6 = (WFAlert *)objc_claimAutoreleasedReturnValue();

  alert = self->_alert;
  self->_alert = v6;

}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  WFREPBAlertRequest *v8;
  BOOL v9;
  id v10;
  NSString *v11;
  NSString *associatedRunRequestIdentifier;
  WFREPBAlert *v13;
  NSObject *p_super;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D82B90];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

  v8 = objc_alloc_init(WFREPBAlertRequest);
  v16 = 0;
  v9 = -[PBCodable readFrom:error:](v8, "readFrom:error:", v7, &v16);
  v10 = v16;
  if (v9)
  {
    -[WFREPBAlertRequest associatedRunRequestIdentifier](v8, "associatedRunRequestIdentifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
    self->_associatedRunRequestIdentifier = v11;

    -[WFREPBAlertRequest alert](v8, "alert");
    v13 = (WFREPBAlert *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_pbAlert->super.super;
    self->_pbAlert = v13;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionAlertRequest readMessageFromData:error:]";
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1C15B3000, p_super, OS_LOG_TYPE_FAULT, "%s Failed to read alert request protobuf, %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = (void *)objc_opt_new();
  -[WFRemoteExecutionAlertRequest associatedRunRequestIdentifier](self, "associatedRunRequestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssociatedRunRequestIdentifier:", v6);

  v7 = (void *)objc_opt_new();
  -[WFRemoteExecutionAlertRequest alert](self, "alert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  -[WFRemoteExecutionAlertRequest alert](self, "alert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v11);

  -[WFRemoteExecutionAlertRequest alert](self, "alert");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredStyle:", objc_msgSend(v12, "preferredStyle"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFRemoteExecutionAlertRequest alert](self, "alert");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "buttons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        v20 = (void *)objc_opt_new();
        objc_msgSend(v19, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTitle:", v21);

        objc_msgSend(v20, "setPreferred:", objc_msgSend(v19, "isPreferred"));
        objc_msgSend(v20, "setStyle:", objc_msgSend(v19, "style"));
        objc_msgSend(v7, "addButtons:", v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend(v5, "setAlert:", v7);
  objc_msgSend(v5, "writeTo:", v24);
  objc_msgSend(v24, "immutableData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (WFAlert)alert
{
  return self->_alert;
}

- (WFREPBAlert)pbAlert
{
  return self->_pbAlert;
}

- (void)setPbAlert:(id)a3
{
  objc_storeStrong((id *)&self->_pbAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbAlert, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
}

@end
