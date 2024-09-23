@implementation WFRemoteExecutionOutgoingRunRequestSession

- (WFRemoteExecutionOutgoingRunRequestSession)initWithService:(id)a3 request:(id)a4 userInterface:(id)a5 parameterInputProvider:(id)a6 coordinator:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFRemoteExecutionOutgoingRunRequestSession *v21;
  WFRemoteExecutionOutgoingRunRequestSession *v22;
  uint64_t v23;
  id completion;
  WFRemoteExecutionOutgoingRunRequestSession *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestSession.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestSession.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  if (v17)
  {
LABEL_4:
    if (v19)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestSession.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator"));

    if (v20)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestSession.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterface"));

  if (!v19)
    goto LABEL_12;
LABEL_5:
  if (v20)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestSession.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  v21 = -[WFRemoteExecutionSession initWithService:](&v32, sel_initWithService_, v15);
  v22 = v21;
  if (v21)
  {
    -[WFRemoteExecutionSession setRequest:](v21, "setRequest:", v16);
    objc_storeStrong((id *)&v22->_userInterface, a5);
    objc_storeStrong((id *)&v22->_parameterInputProvider, a6);
    v23 = objc_msgSend(v20, "copy");
    completion = v22->_completion;
    v22->_completion = (id)v23;

    objc_storeWeak((id *)&v22->_coordinator, v19);
    v25 = v22;
  }

  return v22;
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  WFRemoteExecutionOutgoingRunRequestSession *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  WFRemoteExecutionOutgoingRunRequestSession *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  WFRemoteExecutionOutgoingRunRequestSession *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v31, sel_sendToDestinations_options_, v6, v7);
  -[WFRemoteExecutionSession setState:](self, "setState:", 100);
  v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionOutgoingRunRequestSession coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionSession request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCoordinator:", v9);

  -[WFRemoteExecutionSession request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v12 = objc_msgSend(v11, "writeTo:error:", v8, &v30);
  v13 = v30;

  if ((v12 & 1) != 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v8, "immutableData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithProtobufData:type:isResponse:", v15, 1, 0);

    getWFRemoteExecutionLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (WFRemoteExecutionOutgoingRunRequestSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
      v34 = 2114;
      v35 = v19;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s <%{public}@> sending run request", buf, 0x16u);

    }
    -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
    -[WFRemoteExecutionSession service](self, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    v21 = objc_msgSend(v20, "sendProtobuf:toDestinations:priority:options:identifier:error:", v16, v6, 300, v7, &v29, &v28);
    v22 = v29;
    v23 = v28;

    if ((v21 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v22);
      -[WFRemoteExecutionSession setState:](self, "setState:", 101);
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
        v34 = 2114;
        v35 = self;
        v36 = 2114;
        v37 = v23;
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", v23);
    }

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      -[WFRemoteExecutionSession request](self, "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (WFRemoteExecutionOutgoingRunRequestSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
      v34 = 2114;
      v35 = v26;
      v36 = 2114;
      v37 = v13;
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", v13);
  }

}

- (void)handleIncomingProtobuf:(id)a3
{
  id v4;
  WFRemoteExecutionRunRequestResponse *v5;
  void *v6;
  WFRemoteExecutionRunRequestResponse *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteExecutionSession setState:](self, "setState:", 102);
  v5 = [WFRemoteExecutionRunRequestResponse alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v7 = -[WFRemoteExecutionRunRequestResponse initWithData:error:](v5, "initWithData:error:", v6, &v19);
  v8 = v19;

  if (v7)
  {
    -[WFRemoteExecutionRunRequestResponse runRequestIdentifier](v7, "runRequestIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionSession request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      -[WFRemoteExecutionOutgoingRunRequestSession fileCoordinator](self, "fileCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69__WFRemoteExecutionOutgoingRunRequestSession_handleIncomingProtobuf___block_invoke;
      v18[3] = &unk_1E7AF0D20;
      v18[4] = self;
      -[WFRemoteExecutionRunRequestResponse inflateWithFileCoordinator:completion:](v7, "inflateWithFileCoordinator:completion:", v13, v18);

    }
    else
    {
      -[WFRemoteExecutionSession setState:](self, "setState:", -420);
    }

  }
  else
  {
    v14 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v8);
    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of run request response", buf, 0xCu);
      }
      v17 = 2;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]";
        v22 = 2114;
        v23 = v8;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s Failed to read run request response: %{public}@", buf, 0x16u);
      }
      v17 = 1;
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", v17);
    -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", v8);
  }

}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKey:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WFRemoteExecutionOutgoingFileSession supportsVersion:](WFRemoteExecutionOutgoingFileSession, "supportsVersion:", objc_msgSend(v9, "integerValue")))
  {
    -[WFRemoteExecutionOutgoingRunRequestSession fileCoordinator](self, "fileCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFile:withIdentifier:", v11, v8);
  }
  else
  {
    -[WFRemoteExecutionSession setState:](self, "setState:", 2);
    +[WFRemoteExecutionRequest unsupportedVersionError](WFRemoteExecutionRunRequestResponse, "unsupportedVersionError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", v10);
  }

}

- (void)handleTimeout
{
  id v3;

  -[WFRemoteExecutionSession setState:](self, "setState:", 104);
  -[WFRemoteExecutionSession sessionTimedOutError](self, "sessionTimedOutError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", v3);

}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  WFRemoteExecutionStopRequest *v8;
  void *v9;
  uint64_t v10;
  WFRemoteExecutionStopRequest *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFRemoteExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s finishWithError: %@", buf, 0x16u);
  }

  if (-[WFRemoteExecutionSession state](self, "state") == 101)
  {
    -[WFRemoteExecutionSession request](self, "request");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      getWFRemoteExecutionLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Sending stop...", buf, 0xCu);
      }

      v8 = [WFRemoteExecutionStopRequest alloc];
      -[WFRemoteExecutionSession request](self, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[WFRemoteExecutionStopRequest initWithRequestIdentifier:](v8, "initWithRequestIdentifier:", v10);

      -[WFRemoteExecutionOutgoingRunRequestSession coordinator](self, "coordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      LOBYTE(v10) = objc_msgSend(v12, "sendStopRequest:error:", v11, &v19);
      v6 = v19;

      if ((v10 & 1) == 0)
      {
        -[WFRemoteExecutionSession setState:](self, "setState:", 1);
        getWFRemoteExecutionLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
          v22 = 2114;
          v23 = v6;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Failed to send stop request: %{public}@", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    v6 = 0;
  }
  -[WFRemoteExecutionOutgoingRunRequestSession completion](self, "completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WFRemoteExecutionOutgoingRunRequestSession completion](self, "completion");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v4)
      v17 = v4;
    else
      v17 = v6;
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v17);

    -[WFRemoteExecutionOutgoingRunRequestSession setCompletion:](self, "setCompletion:", 0);
  }
  -[WFRemoteExecutionSession setState:](self, "setState:", 103);
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  -[WFRemoteExecutionSession finish](&v18, sel_finish);

}

- (void)finish
{
  -[WFRemoteExecutionOutgoingRunRequestSession finishWithError:](self, "finishWithError:", 0);
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (WFRemoteExecutionFileCoordinator)fileCoordinator
{
  WFRemoteExecutionFileCoordinator *fileCoordinator;
  WFRemoteExecutionFileCoordinator *v4;
  WFRemoteExecutionFileCoordinator *v5;

  fileCoordinator = self->_fileCoordinator;
  if (!fileCoordinator)
  {
    v4 = (WFRemoteExecutionFileCoordinator *)objc_opt_new();
    v5 = self->_fileCoordinator;
    self->_fileCoordinator = v4;

    fileCoordinator = self->_fileCoordinator;
  }
  return fileCoordinator;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (WFActionParameterInputProvider)parameterInputProvider
{
  return self->_parameterInputProvider;
}

- (WFRemoteExecutionCoordinator)coordinator
{
  return (WFRemoteExecutionCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setFileCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_parameterInputProvider, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
}

void __69__WFRemoteExecutionOutgoingRunRequestSession_handleIncomingProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", 103);
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v5)[2](v5, v3, v6);

    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s completion is nil in handleIncomingProtobuf:", buf, 0xCu);
    }

  }
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  objc_msgSendSuper2(&v8, sel_finish);

}

@end
