@implementation SASProximityBackupAction

+ (unint64_t)actionID
{
  return 6;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3;
  SASProximityBackupAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(SASProximityBackupAction);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldStartBackup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityBackupAction setShouldStartBackup:](v4, "setShouldStartBackup:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("finishedBackup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityBackupAction setFinishedBackup:](v4, "setFinishedBackup:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDomain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v10, "integerValue"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityBackupAction setError:](v4, "setError:", v11);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("percentComplete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  -[SASProximityBackupAction setPercentComplete:](v4, "setPercentComplete:");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeRemaining"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityBackupAction setTimeRemaining:](v4, "setTimeRemaining:", objc_msgSend(v13, "unsignedIntegerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("completionDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityBackupAction setCompletionDate:](v4, "setCompletionDate:", v14);

  return v4;
}

- (id)requestPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SASProximityBackupAction shouldStartBackup](self, "shouldStartBackup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("shouldStartBackup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SASProximityBackupAction finishedBackup](self, "finishedBackup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("finishedBackup"));

  -[SASProximityBackupAction error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SASProximityBackupAction error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorDomain"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[SASProximityBackupAction error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SASProximityBackupAction percentComplete](self, "percentComplete");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("percentComplete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASProximityBackupAction timeRemaining](self, "timeRemaining"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("timeRemaining"));

  -[SASProximityBackupAction completionDate](self, "completionDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("completionDate"));

  return v3;
}

- (BOOL)shouldStartBackup
{
  return self->_shouldStartBackup;
}

- (void)setShouldStartBackup:(BOOL)a3
{
  self->_shouldStartBackup = a3;
}

- (BOOL)finishedBackup
{
  return self->_finishedBackup;
}

- (void)setFinishedBackup:(BOOL)a3
{
  self->_finishedBackup = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (unint64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(unint64_t)a3
{
  self->_timeRemaining = a3;
}

- (NSDate)completionDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
