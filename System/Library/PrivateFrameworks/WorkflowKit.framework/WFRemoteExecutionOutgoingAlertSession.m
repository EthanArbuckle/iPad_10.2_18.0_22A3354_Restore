@implementation WFRemoteExecutionOutgoingAlertSession

- (WFRemoteExecutionOutgoingAlertSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFRemoteExecutionOutgoingAlertSession *v12;
  WFRemoteExecutionOutgoingAlertSession *v13;
  void *v14;
  id completion;
  WFRemoteExecutionOutgoingAlertSession *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAlertSession.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAlertSession.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAlertSession.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  v12 = -[WFRemoteExecutionSession initWithService:](&v21, sel_initWithService_, v9);
  v13 = v12;
  if (v12)
  {
    -[WFRemoteExecutionSession setRequest:](v12, "setRequest:", v10);
    v14 = _Block_copy(v11);
    completion = v13->_completion;
    v13->_completion = v14;

    v16 = v13;
  }

  return v13;
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v31, sel_sendToDestinations_options_, v6, v7);
  -[WFRemoteExecutionSession setState:](self, "setState:", 100);
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[WFRemoteExecutionSession request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
    v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s <%{public}@> Sending alert", buf, 0x16u);

  }
  v11 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionSession request](self, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v13 = objc_msgSend(v12, "writeTo:error:", v11, &v30);
  v14 = v30;

  if ((v13 & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v11, "immutableData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithProtobufData:type:isResponse:", v16, 3, 0);

    -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
    -[WFRemoteExecutionSession service](self, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    v19 = objc_msgSend(v18, "sendProtobuf:toDestinations:priority:options:identifier:error:", v17, v6, 300, v7, &v29, &v28);
    v20 = v29;
    v21 = v28;

    if ((v19 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v20);
      -[WFRemoteExecutionSession setState:](self, "setState:", 101);
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        -[WFRemoteExecutionSession request](self, "request");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
        v34 = 2114;
        v35 = v26;
        v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

      }
      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      -[WFRemoteExecutionOutgoingAlertSession finishWithError:](self, "finishWithError:", v21);
    }

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
      v34 = 2114;
      v35 = v24;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionOutgoingAlertSession finishWithError:](self, "finishWithError:", v14);
  }

}

- (void)handleIncomingProtobuf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  WFRemoteExecutionAlertRequestResponse *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  objc_super v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionSession setState:](self, "setState:", 102);
  v5 = objc_alloc(MEMORY[0x1E0D82B90]);
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithData:", v6);
  v8 = objc_alloc_init(WFRemoteExecutionAlertRequestResponse);
  v26 = 0;
  v9 = -[WFRemoteExecutionRequest readFrom:error:](v8, "readFrom:error:", v7, &v26);
  v10 = v26;
  if (v9)
  {
    -[WFRemoteExecutionAlertRequestResponse requestIdentifier](v8, "requestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionSession request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      getWFRemoteExecutionLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[WFRemoteExecutionRequest identifier](v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRemoteExecutionAlertRequestResponse requestIdentifier](v8, "requestIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        v29 = 2114;
        v30 = v16;
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> Received response for alert: %{public}@", buf, 0x20u);

      }
      -[WFRemoteExecutionOutgoingAlertSession completion](self, "completion");
      v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAlertRequestResponse selectedButton](v8, "selectedButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAlertRequestResponse error](v8, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v18)[2](v18, v19, v20);

      v25.receiver = self;
      v25.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
      -[WFRemoteExecutionSession finish](&v25, sel_finish);
    }
    else
    {
      -[WFRemoteExecutionSession setState:](self, "setState:", -420);
    }
  }
  else
  {
    v21 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v10);
    getWFRemoteExecutionLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of alert request response", buf, 0xCu);
      }
      v24 = 2;
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        v29 = 2114;
        v30 = v10;
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s failed to read response protobuf: %{public}@", buf, 0x16u);
      }
      v24 = 1;
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", v24);
    -[WFRemoteExecutionOutgoingAlertSession finishWithError:](self, "finishWithError:", v10);
  }

}

- (void)handleTimeout
{
  id v3;

  -[WFRemoteExecutionSession setState:](self, "setState:", 104);
  -[WFRemoteExecutionSession sessionTimedOutError](self, "sessionTimedOutError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingAlertSession finishWithError:](self, "finishWithError:", v3);

}

- (double)timeoutLimitInSeconds
{
  return 60.0;
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  -[WFRemoteExecutionOutgoingAlertSession completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFRemoteExecutionOutgoingAlertSession completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

  }
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  -[WFRemoteExecutionSession finish](&v7, sel_finish);

}

- (void)finish
{
  -[WFRemoteExecutionOutgoingAlertSession finishWithError:](self, "finishWithError:", 0);
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
