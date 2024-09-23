@implementation TRITaskRunResult

- (TRITaskRunResult)initWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6
{
  id v12;
  id v13;
  TRITaskRunResult *v14;
  TRITaskRunResult *v15;
  void *v17;
  objc_super v18;

  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextTasks != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)TRITaskRunResult;
  v14 = -[TRITaskRunResult init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_runStatus = a3;
    v14->_reportResultToServer = a4;
    objc_storeStrong((id *)&v14->_nextTasks, a5);
    objc_storeStrong((id *)&v15->_earliestRetryDate, a6);
  }

  return v15;
}

+ (id)resultWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v8, v7, v11, v10);

  return v12;
}

- (id)copyWithReplacementRunStatus:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", *(_QWORD *)&a3, self->_reportResultToServer, self->_nextTasks, self->_earliestRetryDate);
}

- (id)copyWithReplacementReportResultToServer:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", self->_runStatus, a3, self->_nextTasks, self->_earliestRetryDate);
}

- (id)copyWithReplacementNextTasks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", self->_runStatus, self->_reportResultToServer, v4, self->_earliestRetryDate);

  return v5;
}

- (id)copyWithReplacementEarliestRetryDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", self->_runStatus, self->_reportResultToServer, self->_nextTasks, v4);

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4;
  void *v5;
  int runStatus;
  int reportResultToServer;
  int v8;
  void *v9;
  int v10;
  NSArray *nextTasks;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  NSDate *earliestRetryDate;
  void *v18;
  char v19;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  runStatus = self->_runStatus;
  if (runStatus != objc_msgSend(v4, "runStatus"))
    goto LABEL_10;
  reportResultToServer = self->_reportResultToServer;
  if (reportResultToServer != objc_msgSend(v5, "reportResultToServer"))
    goto LABEL_10;
  v8 = self->_nextTasks != 0;
  objc_msgSend(v5, "nextTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v8 == v10)
    goto LABEL_10;
  nextTasks = self->_nextTasks;
  if (nextTasks)
  {
    objc_msgSend(v5, "nextTasks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSArray isEqual:](nextTasks, "isEqual:", v12);

    if (!v13)
      goto LABEL_10;
  }
  v14 = self->_earliestRetryDate != 0;
  objc_msgSend(v5, "earliestRetryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v14 != v16)
  {
    earliestRetryDate = self->_earliestRetryDate;
    if (earliestRetryDate)
    {
      objc_msgSend(v5, "earliestRetryDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSDate isEqual:](earliestRetryDate, "isEqual:", v18);

    }
    else
    {
      v19 = 1;
    }
  }
  else
  {
LABEL_10:
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  TRITaskRunResult *v4;
  TRITaskRunResult *v5;
  BOOL v6;

  v4 = (TRITaskRunResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITaskRunResult isEqualToResult:](self, "isEqualToResult:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = self->_reportResultToServer - (uint64_t)self->_runStatus + 32 * self->_runStatus;
  v4 = -[NSArray hash](self->_nextTasks, "hash") - v3 + 32 * v3;
  return -[NSDate hash](self->_earliestRetryDate, "hash") - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_runStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reportResultToServer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITaskRunResult | runStatus:%@ reportResultToServer:%@ nextTasks:%@ earliestRetryDate:%@>"), v4, v5, self->_nextTasks, self->_earliestRetryDate);

  return v6;
}

- (int)runStatus
{
  return self->_runStatus;
}

- (BOOL)reportResultToServer
{
  return self->_reportResultToServer;
}

- (NSArray)nextTasks
{
  return self->_nextTasks;
}

- (NSDate)earliestRetryDate
{
  return self->_earliestRetryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestRetryDate, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end
