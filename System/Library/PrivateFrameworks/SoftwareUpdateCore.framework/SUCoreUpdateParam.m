@implementation SUCoreUpdateParam

- (SUCoreUpdateParam)init
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, 0, 0, 0, 0, 0, 0);
}

- (id)initTargetPhase:(int64_t)a3 withPolicy:(id)a4
{
  return -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", a3, a4, 0, 0, 0, 0, 0, 0);
}

- (SUCoreUpdateParam)initWithDownloadProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, a3, 0, 0, 0, 0, 0);
}

- (SUCoreUpdateParam)initWithPrepareProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, 0, a3, 0, 0, 0, 0);
}

- (SUCoreUpdateParam)initWithApplyProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, 0, 0, a3, 0, 0, 0);
}

- (SUCoreUpdateParam)initWithError:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;

  v4 = a3;
  v5 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, 0, 0, 0, 0, objc_msgSend(v4, "code"), v4);

  return v5;
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withPolicy:(id)a4
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 11, a4, 0, 0, 0, a3, 0, 0);
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  SUCoreUpdateParam *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 11, 0, 0, 0, 0, v7, objc_msgSend(v6, "code"), v6);

  return v8;
}

- (id)initTargetPhase:(int64_t)a3 policy:(id)a4 downloadProgress:(id)a5 prepareProgress:(id)a6 applyProgress:(id)a7 rollback:(id)a8 resultCode:(int64_t)a9 error:(id)a10
{
  id v16;
  id v17;
  id v18;
  SUCoreUpdateParam *v19;
  SUCoreUpdateParam *v20;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a4;
  v17 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)SUCoreUpdateParam;
  v19 = -[SUCoreUpdateParam init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_targetPhase = a3;
    objc_storeStrong((id *)&v19->_policy, a4);
    objc_storeStrong((id *)&v20->_downloadProgress, a5);
    objc_storeStrong((id *)&v20->_prepareProgress, a6);
    objc_storeStrong((id *)&v20->_applyProgress, a7);
    objc_storeStrong((id *)&v20->_rollback, a8);
    v20->_resultCode = a9;
    objc_storeStrong((id *)&v20->_error, a10);
  }

  return v20;
}

- (SUCoreUpdateParam)initWithCoder:(id)a3
{
  id v4;
  SUCoreUpdateParam *v5;
  uint64_t v6;
  SUCorePolicy *policy;
  uint64_t v8;
  SUCoreProgress *downloadProgress;
  uint64_t v10;
  SUCoreProgress *prepareProgress;
  uint64_t v12;
  SUCoreProgress *applyProgress;
  uint64_t v14;
  SUCoreRollback *rollback;
  void *v16;
  void *v17;
  uint64_t v18;
  NSError *error;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUCoreUpdateParam;
  v5 = -[SUCoreUpdateParam init](&v21, sel_init);
  if (v5)
  {
    v5->_targetPhase = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TargetPhase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Policy"));
    v6 = objc_claimAutoreleasedReturnValue();
    policy = v5->_policy;
    v5->_policy = (SUCorePolicy *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DownloadProgress"));
    v8 = objc_claimAutoreleasedReturnValue();
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (SUCoreProgress *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrepareProgress"));
    v10 = objc_claimAutoreleasedReturnValue();
    prepareProgress = v5->_prepareProgress;
    v5->_prepareProgress = (SUCoreProgress *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ApplyProgress"));
    v12 = objc_claimAutoreleasedReturnValue();
    applyProgress = v5->_applyProgress;
    v5->_applyProgress = (SUCoreProgress *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Rollback"));
    v14 = objc_claimAutoreleasedReturnValue();
    rollback = v5->_rollback;
    v5->_rollback = (SUCoreRollback *)v14;

    v5->_resultCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ResultCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ErrorString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buildError:underlying:description:", v5->_resultCode, 0, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"), CFSTR("TargetPhase"));
  -[SUCoreUpdateParam policy](self, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Policy"));

  -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DownloadProgress"));

  -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PrepareProgress"));

  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ApplyProgress"));

  -[SUCoreUpdateParam rollback](self, "rollback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Rollback"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam resultCode](self, "resultCode"), CFSTR("ResultCode"));
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreUpdateParam error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "initWithFormat:", CFSTR("%@"), v11);

  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ErrorString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  SUCoreUpdateParam *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(SUCoreUpdateParam);
  -[SUCoreUpdateParam setTargetPhase:](v3, "setTargetPhase:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
  -[SUCoreUpdateParam policy](self, "policy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setPolicy:](v3, "setPolicy:", v4);

  -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setDownloadProgress:](v3, "setDownloadProgress:", v5);

  -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setPrepareProgress:](v3, "setPrepareProgress:", v6);

  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setApplyProgress:](v3, "setApplyProgress:", v7);

  -[SUCoreUpdateParam rollback](self, "rollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setRollback:](v3, "setRollback:", v8);

  -[SUCoreUpdateParam setResultCode:](v3, "setResultCode:", -[SUCoreUpdateParam resultCode](self, "resultCode"));
  -[SUCoreUpdateParam error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setError:](v3, "setError:", v9);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam policy](self, "policy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam rollback](self, "rollback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "summary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreUpdateParam resultCode](self, "resultCode");
  -[SUCoreUpdateParam error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("\n[>>>\n        targetPhase: %@\n             policy: %@\n   downloadProgress: %@\n    prepareProgress: %@\n      applyProgress: %@\n           rollback: %@\n         resultCode: %ld\n              error: %@\n<<<]"), v14, v3, v4, v6, v8, v10, v11, v12);

  return v16;
}

- (id)summary
{
  void *v3;
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  -[SUCoreUpdateParam error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = -[SUCoreUpdateParam resultCode](self, "resultCode");
    -[SUCoreUpdateParam error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("resultCode:%ld,errorDesc:%@"), v5, v7);

  }
  else
  {
    if (-[SUCoreUpdateParam targetPhase](self, "targetPhase"))
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[SUCoreUpdateParam targetPhaseName:](SUCoreUpdateParam, "targetPhaseName:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("target:%@"), v10);
    }
    else
    {
      -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "summary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("downloadProg:%@"), v13);
      }
      else
      {
        -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "summary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "initWithFormat:", CFSTR("prepareProg:%@"), v13);
        }
        else
        {
          -[SUCoreUpdateParam applyProgress](self, "applyProgress");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          if (!v17)
          {
            v8 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("resultCode:%ld"), -[SUCoreUpdateParam resultCode](self, "resultCode"));
            return v8;
          }
          -[SUCoreUpdateParam applyProgress](self, "applyProgress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "summary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v18, "initWithFormat:", CFSTR("applyProg:%@"), v13);
        }
      }
      v8 = (void *)v14;

    }
  }
  return v8;
}

+ (id)targetPhaseName:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB)
    return CFSTR("UNKNOWN");
  else
    return kSUCoreUpdateTargetPhaseName[a3];
}

+ (id)targetRollbackPhaseName:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return CFSTR("UNKNOWN");
  else
    return kSUCoreRollbackTargetPhaseName[a3];
}

- (int64_t)targetPhase
{
  return self->_targetPhase;
}

- (void)setTargetPhase:(int64_t)a3
{
  self->_targetPhase = a3;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (SUCoreProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgress, a3);
}

- (SUCoreProgress)prepareProgress
{
  return self->_prepareProgress;
}

- (void)setPrepareProgress:(id)a3
{
  objc_storeStrong((id *)&self->_prepareProgress, a3);
}

- (SUCoreProgress)applyProgress
{
  return self->_applyProgress;
}

- (void)setApplyProgress:(id)a3
{
  objc_storeStrong((id *)&self->_applyProgress, a3);
}

- (SUCoreRollback)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
  objc_storeStrong((id *)&self->_rollback, a3);
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_applyProgress, 0);
  objc_storeStrong((id *)&self->_prepareProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
