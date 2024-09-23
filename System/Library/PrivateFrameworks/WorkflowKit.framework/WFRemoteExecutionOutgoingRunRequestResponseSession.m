@implementation WFRemoteExecutionOutgoingRunRequestResponseSession

- (WFRemoteExecutionOutgoingRunRequestResponseSession)initWithService:(id)a3 responseData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFRemoteExecutionOutgoingRunRequestResponseSession *v10;
  WFRemoteExecutionOutgoingRunRequestResponseSession *v11;
  WFRemoteExecutionOutgoingRunRequestResponseSession *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestResponseSession.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingRunRequestResponseSession.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseData"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFRemoteExecutionOutgoingRunRequestResponseSession;
  v10 = -[WFRemoteExecutionSession initWithService:](&v16, sel_initWithService_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_responseData, a4);
    v12 = v11;
  }

  return v11;
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)WFRemoteExecutionOutgoingRunRequestResponseSession;
  v6 = a4;
  v7 = a3;
  -[WFRemoteExecutionSession sendToDestinations:options:](&v19, sel_sendToDestinations_options_, v7, v6);
  -[WFRemoteExecutionSession setState:](self, "setState:", 100);
  v8 = objc_alloc(MEMORY[0x1E0D34348]);
  -[WFRemoteExecutionOutgoingRunRequestResponseSession responseData](self, "responseData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithProtobufData:type:isResponse:", v9, 2, 0);

  getWFRemoteExecutionLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFRemoteExecutionOutgoingRunRequestResponseSession sendToDestinations:options:]";
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_INFO, "%s sending run request response", buf, 0xCu);
  }

  -[WFRemoteExecutionSession restartTimeout](self, "restartTimeout");
  -[WFRemoteExecutionSession service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v13 = objc_msgSend(v12, "sendProtobuf:toDestinations:priority:options:identifier:error:", v10, v7, 300, v6, &v18, &v17);

  v14 = v18;
  v15 = v17;

  if ((v13 & 1) != 0)
  {
    -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v14);
    -[WFRemoteExecutionSession setState:](self, "setState:", 103);
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFRemoteExecutionOutgoingRunRequestResponseSession sendToDestinations:options:]";
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s failed to send run request response with error: %{public}@", buf, 0x16u);
    }

    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    -[WFRemoteExecutionSession finish](self, "finish");
  }

}

- (void)handleTimeout
{
  -[WFRemoteExecutionSession setState:](self, "setState:", 104);
  -[WFRemoteExecutionSession finish](self, "finish");
}

- (double)timeoutLimitInSeconds
{
  return 60.0;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
