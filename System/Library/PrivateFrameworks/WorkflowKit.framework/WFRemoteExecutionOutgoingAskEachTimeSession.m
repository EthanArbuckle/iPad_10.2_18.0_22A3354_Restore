@implementation WFRemoteExecutionOutgoingAskEachTimeSession

- (WFRemoteExecutionOutgoingAskEachTimeSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFRemoteExecutionOutgoingAskEachTimeSession *v12;
  WFRemoteExecutionOutgoingAskEachTimeSession *v13;
  void *v14;
  id completion;
  WFRemoteExecutionOutgoingAskEachTimeSession *v16;
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAskEachTimeSession.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAskEachTimeSession.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAskEachTimeSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
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
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  WFRemoteExecutionOutgoingAskEachTimeSession *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  WFRemoteExecutionOutgoingAskEachTimeSession *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  WFRemoteExecutionOutgoingAskEachTimeSession *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v29, sel_sendToDestinations_options_, v6, v7);
  -[WFRemoteExecutionSession setState:](self, "setState:", 100);
  v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionSession request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v9, "writeTo:error:", v8, &v28);
  v11 = v28;

  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v8, "immutableData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithProtobufData:type:isResponse:", v13, 5, 0);

    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (WFRemoteExecutionOutgoingAskEachTimeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFRemoteExecutionOutgoingAskEachTimeSession sendToDestinations:options:]";
      v32 = 2114;
      v33 = v17;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending ask each time request", buf, 0x16u);

    }
    -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
    -[WFRemoteExecutionSession service](self, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = 0;
    v19 = objc_msgSend(v18, "sendProtobuf:toDestinations:priority:options:identifier:error:", v14, v6, 300, v7, &v27, &v26);
    v20 = v27;
    v21 = v26;

    if ((v19 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v20);
      -[WFRemoteExecutionSession setState:](self, "setState:", 101);
    }
    else
    {
      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      getWFRemoteExecutionLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[WFRemoteExecutionOutgoingAskEachTimeSession sendToDestinations:options:]";
        v32 = 2114;
        v33 = self;
        v34 = 2114;
        v35 = v21;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      -[WFRemoteExecutionOutgoingAskEachTimeSession finish](self, "finish");
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
      v24 = (WFRemoteExecutionOutgoingAskEachTimeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFRemoteExecutionOutgoingAskEachTimeSession sendToDestinations:options:]";
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionOutgoingAskEachTimeSession finish](self, "finish");
  }

}

- (void)handleIncomingProtobuf:(id)a3
{
  id v4;
  WFRemoteExecutionAskEachTimeRequestResponse *v5;
  void *v6;
  WFRemoteExecutionAskEachTimeRequestResponse *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionSession setState:](self, "setState:", 102);
  v5 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v7 = -[WFRemoteExecutionAskEachTimeRequestResponse initWithData:error:](v5, "initWithData:error:", v6, &v28);
  v8 = v28;

  if (v7)
  {
    -[WFRemoteExecutionAskEachTimeRequestResponse originatingRequestIdentifier](v7, "originatingRequestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionSession request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      -[WFRemoteExecutionSession setState:](self, "setState:", 103);
      +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionSession request](self, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionSession request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionSerializedParameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createActionWithIdentifier:serializedParameters:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFRemoteExecutionAskEachTimeRequestResponse inflateInputtedStatesWithAction:](v7, "inflateInputtedStatesWithAction:", v18);
      -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAskEachTimeRequestResponse inputtedStates](v7, "inputtedStates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAskEachTimeRequestResponse error](v7, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, void *))v19)[2](v19, 0, v20, v21);

      -[WFRemoteExecutionOutgoingAskEachTimeSession setCompletion:](self, "setCompletion:", 0);
      -[WFRemoteExecutionOutgoingAskEachTimeSession finishWithoutCallingCompletion](self, "finishWithoutCallingCompletion");

    }
    else
    {
      -[WFRemoteExecutionSession setState:](self, "setState:", -420);
    }

  }
  else
  {
    v22 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v8);
    getWFRemoteExecutionLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFRemoteExecutionOutgoingAskEachTimeSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of ask each time request response", buf, 0xCu);
      }
      v25 = 2;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFRemoteExecutionOutgoingAskEachTimeSession handleIncomingProtobuf:]";
        v31 = 2114;
        v32 = v8;
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s Failed to read ask each time request response: %{public}@", buf, 0x16u);
      }
      v25 = 1;
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", v25);
    -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v26)[2](v26, 0, 0, v8);

    -[WFRemoteExecutionOutgoingAskEachTimeSession setCompletion:](self, "setCompletion:", 0);
    v27.receiver = self;
    v27.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
    -[WFRemoteExecutionSession finish](&v27, sel_finish);
  }

}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 104);
  -[WFRemoteExecutionOutgoingAskEachTimeSession finish](self, "finish");
}

- (double)timeoutLimitInSeconds
{
  return 60.0;
}

- (void)finishWithoutCallingCompletion
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
  -[WFRemoteExecutionSession finish](&v2, sel_finish);
}

- (void)finish
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v5;

  -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1, 0, 0);

    -[WFRemoteExecutionOutgoingAskEachTimeSession setCompletion:](self, "setCompletion:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
  -[WFRemoteExecutionSession finish](&v5, sel_finish);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFRemoteExecutionOutgoingAskEachTimeSession completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, _QWORD, id))v6)[2](v6, 1, 0, v4);

    -[WFRemoteExecutionOutgoingAskEachTimeSession setCompletion:](self, "setCompletion:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionOutgoingAskEachTimeSession;
  -[WFRemoteExecutionSession finish](&v7, sel_finish);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
