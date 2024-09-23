@implementation PLBackgroundJobStatusStartWorkerEvent

- (id)statusDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobStatusStartWorkerEvent;
  -[PLBackgroundJobStatusEvent statusDump](&v8, sel_statusDump);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusStartWorkerEvent worker](self, "worker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ working on %lu jobs\n"), v4, v5, -[PLBackgroundJobStatusStartWorkerEvent jobsCount](self, "jobsCount"));
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

- (unint64_t)jobsCount
{
  return self->_jobsCount;
}

- (void)setJobsCount:(unint64_t)a3
{
  self->_jobsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worker, 0);
}

@end
