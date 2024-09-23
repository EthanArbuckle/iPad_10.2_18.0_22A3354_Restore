@implementation WFRemoteExecutionIncomingAceCommandSession

- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFRemoteExecutionAceCommandRequest *v11;
  void *v12;
  WFRemoteExecutionAceCommandRequest *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  WFRemoteExecutionAceCommandRequest *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v11 = [WFRemoteExecutionAceCommandRequest alloc];
  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v13 = -[WFRemoteExecutionAceCommandRequest initWithData:error:](v11, "initWithData:error:", v12, &v34);
  v14 = v34;

  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0D87F40];
    -[WFRemoteExecutionAceCommandRequest aceCommandDictionary](v13, "aceCommandDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "aceObjectWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __90__WFRemoteExecutionIncomingAceCommandSession_handleIncomingProtobuf_destinations_options___block_invoke;
      v29[3] = &unk_1E7AF93F0;
      v29[4] = self;
      v30 = v13;
      v31 = v9;
      v32 = v10;
      WFPerformACECommand(v17, 0, v29);

    }
    else
    {
      getWFRemoteExecutionLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_FAULT, "%s unable to create ace command from dictionary representation", buf, 0xCu);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      -[WFRemoteExecutionRequest identifier](v13, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionSession invalidAceCommandError](self, "invalidAceCommandError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionIncomingAceCommandSession sendResponseWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:destinations:options:](self, "sendResponseWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:destinations:options:", v27, 0, v28, v9, v10);

      -[WFRemoteExecutionSession finish](self, "finish");
    }

  }
  else
  {
    v18 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v14);
    getWFRemoteExecutionLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s Encountered unsupported version of ace command request", buf, 0xCu);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 2);
      objc_msgSend(v8, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      +[WFRemoteExecutionRequest identifierFromData:error:](WFRemoteExecutionRequest, "identifierFromData:error:", v21, &v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v33;

      getWFRemoteExecutionLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
          _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported ace command request error back", buf, 0xCu);
        }

        -[WFRemoteExecutionIncomingAceCommandSession sendResponseWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:destinations:options:](self, "sendResponseWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:destinations:options:", v22, 0, v14, v9, v10);
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
          v37 = 2112;
          v38 = v23;
          _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
        }

      }
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        v37 = 2114;
        v38 = v14;
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s failed to read incoming ace command request from data, error: %{public}@", buf, 0x16u);
      }

      -[WFRemoteExecutionSession setState:](self, "setState:", 1);
      -[WFRemoteExecutionSession finish](self, "finish");
    }
  }

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
  WFRemoteExecutionIncomingAceCommandSession *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  WFRemoteExecutionIncomingAceCommandSession *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  WFRemoteExecutionIncomingAceCommandSession *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WFRemoteExecutionIncomingAceCommandSession;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v30, sel_sendToDestinations_options_, v6, v7);
  v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[WFRemoteExecutionIncomingAceCommandSession response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v10 = objc_msgSend(v9, "writeTo:error:", v8, &v29);
  v11 = v29;

  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(v8, "immutableData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithProtobufData:type:isResponse:", v13, 9, 0);

    getWFRemoteExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[WFRemoteExecutionIncomingAceCommandSession response](self, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (WFRemoteExecutionIncomingAceCommandSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending ace command response", buf, 0x16u);

    }
    -[WFRemoteExecutionSession service](self, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v19 = objc_msgSend(v18, "sendProtobuf:toDestinations:priority:options:identifier:error:", v14, v6, 300, v7, &v28, &v27);
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
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
        v33 = 2114;
        v34 = self;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      v22 = 1;
    }
    -[WFRemoteExecutionSession setState:](self, "setState:", v22);
    -[WFRemoteExecutionSession finish](self, "finish");

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      -[WFRemoteExecutionIncomingAceCommandSession response](self, "response");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (WFRemoteExecutionIncomingAceCommandSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
      v33 = 2114;
      v34 = v25;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);

    }
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
  }

}

- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFRemoteExecutionAceCommandRequestResponse *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[WFRemoteExecutionAceCommandRequestResponse initWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:]([WFRemoteExecutionAceCommandRequestResponse alloc], "initWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:", v16, v15, v14);

  -[WFRemoteExecutionIncomingAceCommandSession setResponse:](self, "setResponse:", v17);
  -[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:](self, "sendToDestinations:options:", v13, v12);

}

- (WFRemoteExecutionAceCommandRequestResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

void __90__WFRemoteExecutionIncomingAceCommandSession_handleIncomingProtobuf_destinations_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(v6, "setState:", 201);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sendResponseWithOriginatingRequestIdentifier:aceCommandResponseDictionary:error:destinations:options:", v11, v10, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
