@implementation WFRemoteExecutionOutgoingAceCommandSession

- (WFRemoteExecutionOutgoingAceCommandSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFRemoteExecutionOutgoingAceCommandSession *v12;
  WFRemoteExecutionOutgoingAceCommandSession *v13;
  void *v14;
  id completion;
  WFRemoteExecutionOutgoingAceCommandSession *v16;
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAceCommandSession.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAceCommandSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingAceCommandSession.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionOutgoingAceCommandSession;
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
  WFRemoteExecutionOutgoingAceCommandSession *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  WFRemoteExecutionOutgoingAceCommandSession *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  WFRemoteExecutionOutgoingAceCommandSession *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WFRemoteExecutionOutgoingAceCommandSession;
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
    v14 = (void *)objc_msgSend(v12, "initWithProtobufData:type:isResponse:", v13, 8, 0);

    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (WFRemoteExecutionOutgoingAceCommandSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFRemoteExecutionOutgoingAceCommandSession sendToDestinations:options:]";
      v32 = 2114;
      v33 = v17;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending ace command", buf, 0x16u);

    }
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
        v31 = "-[WFRemoteExecutionOutgoingAceCommandSession sendToDestinations:options:]";
        v32 = 2114;
        v33 = self;
        v34 = 2114;
        v35 = v21;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      -[WFRemoteExecutionOutgoingAceCommandSession finishWithError:](self, "finishWithError:", v21);
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
      v24 = (WFRemoteExecutionOutgoingAceCommandSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFRemoteExecutionOutgoingAceCommandSession sendToDestinations:options:]";
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionOutgoingAceCommandSession finishWithError:](self, "finishWithError:", v11);
  }

}

- (void)handleIncomingProtobuf:(id)a3
{
  id v4;
  WFRemoteExecutionAceCommandRequestResponse *v5;
  void *v6;
  WFRemoteExecutionAceCommandRequestResponse *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionSession setState:](self, "setState:", 102);
  v5 = [WFRemoteExecutionAceCommandRequestResponse alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v7 = -[WFRemoteExecutionAceCommandRequestResponse initWithData:error:](v5, "initWithData:error:", v6, &v21);
  v8 = v21;

  if (v7)
  {
    -[WFRemoteExecutionAceCommandRequestResponse originatingRequestIdentifier](v7, "originatingRequestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionSession request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
    {
      -[WFRemoteExecutionOutgoingAceCommandSession completion](self, "completion");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAceCommandRequestResponse aceCommandResponseDictionary](v7, "aceCommandResponseDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionAceCommandRequestResponse error](v7, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v13)[2](v13, v14, v15);

      -[WFRemoteExecutionOutgoingAceCommandSession setCompletion:](self, "setCompletion:", 0);
      -[WFRemoteExecutionOutgoingAceCommandSession finish](self, "finish");
      v16 = 103;
    }
    else
    {
      v16 = -420;
    }
    -[WFRemoteExecutionSession setState:](self, "setState:", v16);

  }
  else
  {
    v17 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v8);
    getWFRemoteExecutionLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[WFRemoteExecutionOutgoingAceCommandSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of ace command request response", buf, 0xCu);
      }
      v20 = 2;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[WFRemoteExecutionOutgoingAceCommandSession handleIncomingProtobuf:]";
        v24 = 2114;
        v25 = v8;
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s Failed to read ace command response: %{public}@", buf, 0x16u);
      }
      v20 = 1;
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", v20);
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionOutgoingAceCommandSession finishWithError:](self, "finishWithError:", v8);
  }

}

- (void)finish
{
  -[WFRemoteExecutionOutgoingAceCommandSession finishWithError:](self, "finishWithError:", 0);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  -[WFRemoteExecutionOutgoingAceCommandSession completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFRemoteExecutionOutgoingAceCommandSession completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

    -[WFRemoteExecutionOutgoingAceCommandSession setCompletion:](self, "setCompletion:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionOutgoingAceCommandSession;
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
