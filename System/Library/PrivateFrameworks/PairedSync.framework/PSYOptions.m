@implementation PSYOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSYOptions)init
{
  PSYOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSYOptions;
  result = -[PSYOptions init](&v3, sel_init);
  if (result)
  {
    result->_resumePendingJobs = 1;
    result->_terminationJobCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PSYOptions)initWithCoder:(id)a3
{
  id v4;
  PSYOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *testInputs;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *jobs;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PSYOptions;
  v5 = -[PSYOptions init](&v17, sel_init);
  if (v5)
  {
    v5->_resumePendingJobs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PSOptionsResumePendingJobsKey"));
    v5->_dryRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PSOptionsDryRunKey"));
    v5->_terminationJobCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PSOptionsTerminationJobCount"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PSOptionsTestInputsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    testInputs = v5->_testInputs;
    v5->_testInputs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("PSOptionsJobsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    jobs = v5->_jobs;
    v5->_jobs = (NSArray *)v14;

    v5->_resetDeviceSyncState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PSOptionsResetDeviceSyncStateKey"));
    v5->_syncSessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncSessionType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PSYOptions shouldResumePendingJobs](self, "shouldResumePendingJobs"), CFSTR("PSOptionsResumePendingJobsKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PSYOptions dryRun](self, "dryRun"), CFSTR("PSOptionsDryRunKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PSYOptions terminationJobCount](self, "terminationJobCount"), CFSTR("PSOptionsTerminationJobCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_testInputs, CFSTR("PSOptionsTestInputsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_jobs, CFSTR("PSOptionsJobsKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_resetDeviceSyncState, CFSTR("PSOptionsResetDeviceSyncStateKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_syncSessionType, CFSTR("syncSessionType"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSYOptions dryRun](self, "dryRun"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYOptions jobs](self, "jobs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSYOptions shouldResetDeviceSyncState](self, "shouldResetDeviceSyncState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; dryRun=%@; jobs=%@; resetDeviceSyncState=%@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldResumePendingJobs
{
  return self->_resumePendingJobs;
}

- (void)setResumePendingJobs:(BOOL)a3
{
  self->_resumePendingJobs = a3;
}

- (NSURL)activityInfoDirectory
{
  return self->_activityInfoDirectory;
}

- (void)setActivityInfoDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldResetDeviceSyncState
{
  return self->_resetDeviceSyncState;
}

- (void)setResetDeviceSyncState:(BOOL)a3
{
  self->_resetDeviceSyncState = a3;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (unint64_t)terminationJobCount
{
  return self->_terminationJobCount;
}

- (void)setTerminationJobCount:(unint64_t)a3
{
  self->_terminationJobCount = a3;
}

- (NSArray)testInputs
{
  return self->_testInputs;
}

- (void)setTestInputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)syncSessionType
{
  return self->_syncSessionType;
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_testInputs, 0);
  objc_storeStrong((id *)&self->_activityInfoDirectory, 0);
}

@end
