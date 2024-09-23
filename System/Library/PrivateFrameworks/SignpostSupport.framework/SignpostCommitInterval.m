@implementation SignpostCommitInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (SignpostCommitInterval)initWithCommitInterval:(id)a3
{
  id v4;
  SignpostCommitInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *processName;
  void *v13;
  uint64_t v14;
  NSString *executablePath;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SignpostCommitInterval;
  v5 = -[SignpostAnimationSubInterval initWithInterval:](&v17, sel_initWithInterval_, v4);
  if (v5)
  {
    objc_msgSend(v4, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_numberArgumentWithName:", CFSTR("transaction_seed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5->_transactionSeed = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "beginEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_threadID = objc_msgSend(v8, "threadID");

    objc_msgSend(v4, "beginEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v9, "processID");

    objc_msgSend(v4, "beginEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v11;

    objc_msgSend(v4, "beginEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processImagePath");
    v14 = objc_claimAutoreleasedReturnValue();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v14;

  }
  return v5;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

@end
