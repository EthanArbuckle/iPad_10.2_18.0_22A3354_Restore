@implementation PLBackgroundJobStatusStopWorkerEvent

- (id)statusDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLBackgroundJobStatusStopWorkerEvent;
  -[PLBackgroundJobStatusEvent statusDump](&v8, sel_statusDump);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusStopWorkerEvent worker](self, "worker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ told to stop working with %lu jobs still remaining\n"), v4, v5, -[PLBackgroundJobStatusStopWorkerEvent pendingJobsCount](self, "pendingJobsCount"));
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

- (unint64_t)pendingJobsCount
{
  return self->_pendingJobsCount;
}

- (void)setPendingJobsCount:(unint64_t)a3
{
  self->_pendingJobsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worker, 0);
}

@end
