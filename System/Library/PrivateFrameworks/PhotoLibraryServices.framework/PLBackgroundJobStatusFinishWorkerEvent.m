@implementation PLBackgroundJobStatusFinishWorkerEvent

- (id)statusDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobStatusFinishWorkerEvent;
  -[PLBackgroundJobStatusEvent statusDump](&v8, sel_statusDump);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusFinishWorkerEvent worker](self, "worker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ finished running jobs\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)worker
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWorker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worker, 0);
}

@end
