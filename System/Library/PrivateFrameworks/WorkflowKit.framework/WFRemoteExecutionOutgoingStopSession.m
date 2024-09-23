@implementation WFRemoteExecutionOutgoingStopSession

- (WFRemoteExecutionOutgoingStopSession)initWithService:(id)a3 request:(id)a4
{
  id v6;
  WFRemoteExecutionOutgoingStopSession *v7;
  WFRemoteExecutionOutgoingStopSession *v8;
  WFRemoteExecutionOutgoingStopSession *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFRemoteExecutionOutgoingStopSession;
  v7 = -[WFRemoteExecutionSession initWithService:](&v11, sel_initWithService_, a3);
  v8 = v7;
  if (v7)
  {
    -[WFRemoteExecutionSession setRequest:](v7, "setRequest:", v6);
    v9 = v8;
  }

  return v8;
}

- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  WFRemoteExecutionOutgoingStopSession *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  WFRemoteExecutionOutgoingStopSession *v27;
  NSObject *v28;
  void *v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  WFRemoteExecutionOutgoingStopSession *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingStopSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

  }
  -[WFRemoteExecutionSession setState:](self, "setState:", 100);
  v11 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionSession request](self, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v13 = objc_msgSend(v12, "writeTo:error:", v11, &v34);
  v14 = v34;

  if ((v13 & 1) != 0)
  {
    v31 = a5;
    v15 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v11, "immutableData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithProtobufData:type:isResponse:", v16, 7, 0);

    getWFRemoteExecutionLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (WFRemoteExecutionOutgoingStopSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
      v37 = 2114;
      v38 = v20;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s <%{public}@> sending stop request", buf, 0x16u);

    }
    -[WFRemoteExecutionSession service](self, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = 0;
    v22 = objc_msgSend(v21, "sendProtobuf:toDestinations:priority:options:identifier:error:", v17, v9, 300, v10, &v33, &v32);
    v23 = v33;
    v24 = v32;

    if ((v22 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v23);
      -[WFRemoteExecutionSession setState:](self, "setState:", 103);
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
        v37 = 2114;
        v38 = self;
        v39 = 2114;
        v40 = v24;
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      if (v31)
        *v31 = objc_retainAutorelease(v14);
    }
    -[WFRemoteExecutionSession finish](self, "finish");

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (WFRemoteExecutionOutgoingStopSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
      v37 = 2114;
      v38 = v27;
      v39 = 2114;
      v40 = v14;
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    -[WFRemoteExecutionSession finish](self, "finish");
    v22 = 0;
  }

  return v22;
}

@end
