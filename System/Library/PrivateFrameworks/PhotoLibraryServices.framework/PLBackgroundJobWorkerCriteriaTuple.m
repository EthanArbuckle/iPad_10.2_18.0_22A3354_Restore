@implementation PLBackgroundJobWorkerCriteriaTuple

- (PLBackgroundJobWorkerCriteriaTuple)initWithWorker:(id)a3 withCriteria:(id)a4
{
  id v7;
  id v8;
  PLBackgroundJobWorkerCriteriaTuple *v9;
  PLBackgroundJobWorkerCriteriaTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLBackgroundJobWorkerCriteriaTuple;
  v9 = -[PLBackgroundJobWorkerCriteriaTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_worker, a3);
    objc_storeStrong((id *)&v10->_criteria, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLBackgroundJobCriteria shortCode](self->_criteria, "shortCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorker workerDetailedName](self->_worker, "workerDetailedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PLBackgroundJobWorkerCriteriaTuple *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (PLBackgroundJobWorkerCriteriaTuple *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLBackgroundJobWorkerCriteriaTuple;
    if (-[PLBackgroundJobWorkerCriteriaTuple isEqual:](&v13, sel_isEqual_, v4))
    {
      -[PLBackgroundJobWorkerCriteriaTuple worker](self, "worker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "workerDetailedName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBackgroundJobWorkerCriteriaTuple worker](v4, "worker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "workerDetailedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v8))
      {
        -[PLBackgroundJobWorkerCriteriaTuple criteria](self, "criteria");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBackgroundJobWorkerCriteriaTuple criteria](v4, "criteria");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[PLBackgroundJobWorkerCriteriaTuple worker](self, "worker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workerDetailedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PLBackgroundJobWorkerCriteriaTuple criteria](self, "criteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (PLBackgroundJobWorker)worker
{
  return self->_worker;
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_worker, 0);
}

@end
