@implementation WFRemoteExecutionIncomingStopSession

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  WFRemoteExecutionStopRequest *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  _BOOL4 v25;
  NSObject *v26;
  id v27;
  void *v28;
  WFRemoteExecutionIncomingStopSession *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFRemoteExecutionSession setState:](self, "setState:", 200);
  v8 = objc_alloc(MEMORY[0x1E0D82B90]);
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:", v9);

  v11 = objc_alloc_init(WFRemoteExecutionStopRequest);
  v36 = 0;
  LOBYTE(v8) = -[WFRemoteExecutionRequest readFrom:error:](v11, "readFrom:error:", v10, &v36);
  v12 = v36;
  if ((v8 & 1) != 0)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v7;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v27 = v12;
      v28 = v10;
      v29 = self;
      v30 = v7;
      v31 = v6;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "request");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFRemoteExecutionStopRequest requestIdentifier](v11, "requestIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          if (v22)
          {
            getWFRemoteExecutionLogObject();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
              v40 = 2112;
              v41 = v18;
              _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_DEFAULT, "%s Found a match for the stop request; stopping session: %@",
                buf,
                0x16u);
            }

            objc_msgSend(v18, "finish");
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
      v7 = v30;
      v6 = v31;
      v10 = v28;
      self = v29;
      v12 = v27;
    }
    v24 = 202;
  }
  else
  {
    v25 = +[WFRemoteExecutionRequest isUnsupportedVersionError:](WFRemoteExecutionRequest, "isUnsupportedVersionError:", v12);
    getWFRemoteExecutionLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    v13 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of stop request response", buf, 0xCu);
      }
      v24 = 2;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
        v40 = 2114;
        v41 = v12;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s failed to read stop request: %{public}@", buf, 0x16u);
      }
      v24 = 1;
    }
  }

  -[WFRemoteExecutionSession setState:](self, "setState:", v24);
}

@end
