@implementation HDSPSleepScheduleModelSaveResult

+ (id)emptyResult
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuccess:changeEvaluation:error:shouldNotify:", 1, v3, 0, 0);

  return v4;
}

+ (id)saveFailedWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation](HDSPSleepScheduleModelChangeEvaluation, "emptyEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSuccess:changeEvaluation:error:shouldNotify:", 0, v6, v4, 0);

  return v7;
}

- (HDSPSleepScheduleModelSaveResult)initWithSuccess:(BOOL)a3 changeEvaluation:(id)a4 error:(id)a5 shouldNotify:(BOOL)a6
{
  id v11;
  id v12;
  HDSPSleepScheduleModelSaveResult *v13;
  HDSPSleepScheduleModelSaveResult *v14;
  HDSPSleepScheduleModelSaveResult *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSPSleepScheduleModelSaveResult;
  v13 = -[HDSPSleepScheduleModelSaveResult init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    objc_storeStrong((id *)&v13->_changeEvaluation, a4);
    objc_storeStrong((id *)&v14->_error, a5);
    v14->_shouldNotify = a6;
    v15 = v14;
  }

  return v14;
}

- (BOOL)success
{
  return self->_success;
}

- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation
{
  return self->_changeEvaluation;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_changeEvaluation, 0);
}

@end
