@implementation WFRemoteExecutionIncomingRunRequestSession

- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFRemoteExecutionRunRequest *v11;
  void *v12;
  WFRemoteExecutionRunRequest *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFRemoteExecutionIncomingRunRequestSession setLastKnownDestinations:](self, "setLastKnownDestinations:", v9);
  -[WFRemoteExecutionIncomingRunRequestSession setLastKnownOptions:](self, "setLastKnownOptions:", v10);
  -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v11 = [WFRemoteExecutionRunRequest alloc];
  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v13 = -[WFRemoteExecutionRunRequest initWithData:error:](v11, "initWithData:error:", v12, &v24);
  v14 = v24;

  if (v13)
  {
    -[WFRemoteExecutionSession setRequest:](self, "setRequest:", v13);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C18]), "initWithEnvironment:runningContext:presentationMode:", 4, 0, 0);
    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v8, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "runActionWithRunRequestData:error:", v16, &v23);
    v17 = v23;

    objc_storeStrong((id *)&self->_controller, v15);
    if (v17)
    {
      getWFRemoteExecutionLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        v27 = 2114;
        v28 = v17;
        _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s failed to start running in the out of process controller: %{public}@", buf, 0x16u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      -[WFRemoteExecutionIncomingRunRequestSession finish](self, "finish");
    }

  }
  else
  {
    v19 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v14);
    getWFRemoteExecutionLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of run request", buf, 0xCu);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 2);
      objc_msgSend(v8, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingRunRequestSession handleUnsupportedVersionForRequestData:error:destinations:options:](self, "handleUnsupportedVersionForRequestData:error:destinations:options:", v22, v14, v9, v10);

    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_FAULT, "%s failed to read run request from data, error: %{public}@", buf, 0x16u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    }
  }

}

- (void)handleUnsupportedVersionForRequestData:(id)a3 error:(id)a4 destinations:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  WFRemoteExecutionRunRequestResponse *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3)
  {
    v17 = 0;
    +[WFRemoteExecutionRequest identifierFromData:error:](WFRemoteExecutionRequest, "identifierFromData:error:", a3, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (WFRemoteExecutionRunRequestResponse *)v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFRemoteExecutionIncomingRunRequestSession handleUnsupportedVersionForRequestData:error:destinations:options:]";
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1C15B3000, &v16->super.super, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported version error back for request with identifier %{public}@", buf, 0x16u);
      }

      v16 = -[WFRemoteExecutionRunRequestResponse initWithRunRequestIdentifier:variables:output:error:]([WFRemoteExecutionRunRequestResponse alloc], "initWithRunRequestIdentifier:variables:output:error:", v13, 0, 0, v10);
      -[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:](self, "sendResponse:toDestinations:options:", v16, v11, v12);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFRemoteExecutionIncomingRunRequestSession handleUnsupportedVersionForRequestData:error:destinations:options:]";
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1C15B3000, &v16->super.super, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
    }

  }
}

- (void)sendResponse:(id)a3 toDestinations:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  WFRemoteExecutionIncomingRunRequestSession *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  WFRemoteExecutionIncomingRunRequestSession *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFRemoteExecutionSession setState:](self, "setState:", 201);
  v11 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v29 = 0;
  v12 = objc_msgSend(v8, "writeTo:error:", v11, &v29);
  v13 = v29;
  if ((v12 & 1) != 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v11, "immutableData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithProtobufData:type:isResponse:", v15, 2, 0);

    -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
    -[WFRemoteExecutionSession service](self, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v18 = v9;
    v26 = v10;
    v19 = objc_msgSend(v17, "sendProtobuf:toDestinations:priority:options:identifier:error:", v16, v9, 300, v10, &v28, &v27);
    v20 = v28;
    v21 = v27;

    if ((v19 & 1) != 0)
    {
      -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v20);
      v22 = 202;
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:]";
        v32 = 2114;
        v33 = self;
        v34 = 2114;
        v35 = v21;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      v22 = 1;
    }
    v9 = v18;
    -[WFRemoteExecutionSession setState:](self, "setState:", v22);
    -[WFRemoteExecutionIncomingRunRequestSession finish](self, "finish");

    v10 = v26;
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "identifier");
      v24 = (WFRemoteExecutionIncomingRunRequestSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:]";
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35 = v13;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionIncomingRunRequestSession finish](self, "finish");
  }

}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  WFRemoteExecutionRunRequestResponse *v17;
  WFRemoteExecutionRunRequestResponse *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  -[WFRemoteExecutionIncomingRunRequestSession setLastKnownDestinations:](self, "setLastKnownDestinations:", v13);
  -[WFRemoteExecutionIncomingRunRequestSession setLastKnownOptions:](self, "setLastKnownOptions:", v14);
  objc_msgSend(v15, "objectForKey:", CFSTR("version"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[WFRemoteExecutionOutgoingFileSession supportsVersion:](WFRemoteExecutionOutgoingFileSession, "supportsVersion:", objc_msgSend(v16, "integerValue")))
  {
    -[WFRemoteExecutionIncomingRunRequestSession controller](self, "controller");
    v17 = (WFRemoteExecutionRunRequestResponse *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionRunRequestResponse handleIncomingFileForRemoteExecutionWithURL:withIdentifier:](v17, "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:", v22, v12);
  }
  else
  {
    -[WFRemoteExecutionSession setState:](self, "setState:", 2);
    v18 = [WFRemoteExecutionRunRequestResponse alloc];
    -[WFRemoteExecutionSession request](self, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFRemoteExecutionRequest unsupportedVersionError](WFRemoteExecutionRunRequestResponse, "unsupportedVersionError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WFRemoteExecutionRunRequestResponse initWithRunRequestIdentifier:variables:output:error:](v18, "initWithRunRequestIdentifier:variables:output:error:", v20, 0, 0, v21);

    -[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:](self, "sendResponse:toDestinations:options:", v17, v13, v14);
  }

}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 203);
  -[WFRemoteExecutionIncomingRunRequestSession finish](self, "finish");
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)finish
{
  void *v3;
  objc_super v4;

  -[WFRemoteExecutionIncomingRunRequestSession controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[WFRemoteExecutionIncomingRunRequestSession setController:](self, "setController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WFRemoteExecutionIncomingRunRequestSession;
  -[WFRemoteExecutionSession finish](&v4, sel_finish);
}

- (void)finishWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFRemoteExecutionRunRequestResponse *v7;
  void *v8;
  void *v9;
  WFRemoteExecutionRunRequestResponse *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[WFRemoteExecutionIncomingRunRequestSession finish](self, "finish");
  -[WFRemoteExecutionIncomingRunRequestSession lastKnownDestinations](self, "lastKnownDestinations");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFRemoteExecutionSession request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [WFRemoteExecutionRunRequestResponse alloc];
      -[WFRemoteExecutionSession request](self, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFRemoteExecutionRunRequestResponse initWithRunRequestIdentifier:variables:output:error:](v7, "initWithRunRequestIdentifier:variables:output:error:", v9, 0, 0, v13);

      -[WFRemoteExecutionIncomingRunRequestSession lastKnownDestinations](self, "lastKnownDestinations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingRunRequestSession lastKnownOptions](self, "lastKnownOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:](self, "sendResponse:toDestinations:options:", v10, v11, v12);

    }
  }

}

- (WFOutOfProcessWorkflowController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (NSSet)lastKnownDestinations
{
  return self->_lastKnownDestinations;
}

- (void)setLastKnownDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownDestinations, a3);
}

- (NSDictionary)lastKnownOptions
{
  return self->_lastKnownOptions;
}

- (void)setLastKnownOptions:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownOptions, 0);
  objc_storeStrong((id *)&self->_lastKnownDestinations, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
