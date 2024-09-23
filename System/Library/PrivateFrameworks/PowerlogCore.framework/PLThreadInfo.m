@implementation PLThreadInfo

- (PLThreadInfo)initWithThread:(unint64_t)a3 inProcess:(int)a4
{
  PLThreadInfo *v6;
  _OWORD v8[80];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, 512);
  if (proc_pidinfo(a4, 10, a3, v8, 1288) <= 0 && (*__error() == 3 || *__error() == 22))
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(PLThreadInfo);
    -[PLThreadInfo setUserTime:](v6, "setUserTime:", (double)*(unint64_t *)&v8[0] / 1000000000.0);
    -[PLThreadInfo setSystemTime:](v6, "setSystemTime:", (double)*((unint64_t *)&v8[0] + 1) / 1000000000.0);
    -[PLThreadInfo setThreadID:](v6, "setThreadID:", a3);
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLThreadInfo threadName](self, "threadName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLThreadInfo threadID](self, "threadID");
  -[PLThreadInfo userTime](self, "userTime");
  v7 = v6;
  -[PLThreadInfo systemTime](self, "systemTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (0x%llx) %.2fs user %.2fs system"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)diffSinceBaseline:(id)a3
{
  id v4;
  PLThreadInfo *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(PLThreadInfo);
    -[PLThreadInfo threadName](self, "threadName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThreadInfo setThreadName:](v5, "setThreadName:", v6);

    -[PLThreadInfo setThreadID:](v5, "setThreadID:", -[PLThreadInfo threadID](self, "threadID"));
    -[PLThreadInfo systemTime](self, "systemTime");
    v8 = v7;
    objc_msgSend(v4, "systemTime");
    -[PLThreadInfo setSystemTime:](v5, "setSystemTime:", v8 - v9);
    -[PLThreadInfo userTime](self, "userTime");
    v11 = v10;
    objc_msgSend(v4, "userTime");
    v13 = v12;

    -[PLThreadInfo setUserTime:](v5, "setUserTime:", v11 - v13);
  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (BOOL)isEqualToThreadInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[PLThreadInfo threadName](self, "threadName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_4;
  -[PLThreadInfo userTime](self, "userTime");
  v9 = v8;
  objc_msgSend(v4, "userTime");
  if (v9 == v10)
  {
    -[PLThreadInfo systemTime](self, "systemTime");
    v14 = v13;
    objc_msgSend(v4, "systemTime");
    v11 = v14 == v15;
  }
  else
  {
LABEL_4:
    v11 = 0;
  }

  return v11;
}

- (double)systemTime
{
  return self->_systemTime;
}

- (void)setSystemTime:(double)a3
{
  self->_systemTime = a3;
}

- (double)userTime
{
  return self->_userTime;
}

- (void)setUserTime:(double)a3
{
  self->_userTime = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (NSString)threadName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isNamed
{
  return self->_isNamed;
}

- (void)setIsNamed:(BOOL)a3
{
  self->_isNamed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadName, 0);
}

@end
