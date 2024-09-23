@implementation WFRemoteExecutionOutgoingFileSession

- (WFRemoteExecutionOutgoingFileSession)initWithService:(id)a3 fileURL:(id)a4 transferIdentifier:(id)a5 requestIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFRemoteExecutionOutgoingFileSession *v15;
  WFRemoteExecutionOutgoingFileSession *v16;
  WFRemoteExecutionOutgoingFileSession *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingFileSession.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingFileSession.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingFileSession.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transferIdentifier"));

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)WFRemoteExecutionOutgoingFileSession;
  v15 = -[WFRemoteExecutionSession initWithService:](&v22, sel_initWithService_, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fileURL, a4);
    objc_storeStrong((id *)&v16->_transferIdentifier, a5);
    objc_storeStrong((id *)&v16->_requestIdentifier, a6);
    -[WFRemoteExecutionSession setState:](v16, "setState:", 100);
    v17 = v16;
  }

  return v16;
}

- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionOutgoingFileSession.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

  }
  getWFRemoteExecutionLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[WFRemoteExecutionOutgoingFileSession transferIdentifier](self, "transferIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionOutgoingFileSession fileURL](self, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v29 = "-[WFRemoteExecutionOutgoingFileSession sendToDestinations:options:error:]";
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_INFO, "%s <%{public}@> Sending file at URL: %{public}@", buf, 0x20u);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFRemoteExecutionOutgoingFileSession requestIdentifier](self, "requestIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("requestIdentifier"));

  -[WFRemoteExecutionOutgoingFileSession transferIdentifier](self, "transferIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("transferIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "version"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("version"));

  -[WFRemoteExecutionSession service](self, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteExecutionOutgoingFileSession fileURL](self, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = 0;
  v20 = objc_msgSend(v18, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v19, v14, v9, 300, v10, &v27, &v26);
  v21 = v27;
  v22 = v26;

  if ((v20 & 1) != 0)
  {
    -[WFRemoteExecutionSession setIdsIdentifier:](self, "setIdsIdentifier:", v21);
    -[WFRemoteExecutionSession setState:](self, "setState:", 101);
  }
  else
  {
    -[WFRemoteExecutionSession setState:](self, "setState:", 1);
    getWFRemoteExecutionLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFRemoteExecutionOutgoingFileSession sendToDestinations:options:error:]";
      v30 = 2114;
      v31 = v22;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s File sending failed with error: %{public}@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v22);
    -[WFRemoteExecutionSession finish](self, "finish");
  }

  return v20;
}

- (void)fileSentWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  getWFRemoteExecutionLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[WFRemoteExecutionOutgoingFileSession transferIdentifier](self, "transferIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "-[WFRemoteExecutionOutgoingFileSession fileSentWithSuccess:error:]";
    v11 = 2114;
    v12 = v8;
    v13 = 1024;
    v14 = v4;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s <%{public}@> file sent with success: %i, error: %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[WFRemoteExecutionSession finish](self, "finish");

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (void)setTransferIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transferIdentifier, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (int64_t)version
{
  return 1;
}

+ (BOOL)supportsVersion:(int64_t)a3
{
  return objc_msgSend(a1, "version") == a3;
}

@end
