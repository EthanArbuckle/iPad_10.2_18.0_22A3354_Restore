@implementation OctagonPendingFlag

- (OctagonPendingFlag)initWithFlag:(id)a3 delayInSeconds:(double)a4
{
  id v7;
  OctagonPendingFlag *v8;
  OctagonPendingFlag *v9;
  uint64_t v10;
  NSDate *fireTime;
  NSOperation *afterOperation;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OctagonPendingFlag;
  v8 = -[OctagonPendingFlag init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_flag, a3);
    v10 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
    fireTime = v9->_fireTime;
    v9->_fireTime = (NSDate *)v10;

    afterOperation = v9->_afterOperation;
    v9->_afterOperation = 0;

    v9->_conditions = 0;
  }

  return v9;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4
{
  return -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:](self, "initWithFlag:conditions:delayInSeconds:", a3, a4, 0.0);
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 delayInSeconds:(double)a5
{
  id v9;
  OctagonPendingFlag *v10;
  OctagonPendingFlag *v11;
  uint64_t v12;
  NSDate *fireTime;
  NSOperation *afterOperation;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)OctagonPendingFlag;
  v10 = -[OctagonPendingFlag init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_flag, a3);
    if (a5 <= 0.0)
    {
      fireTime = v11->_fireTime;
      v11->_fireTime = 0;
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
      fireTime = v11->_fireTime;
      v11->_fireTime = (NSDate *)v12;
    }

    afterOperation = v11->_afterOperation;
    v11->_afterOperation = 0;

    v11->_conditions = a4;
  }

  return v11;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 after:(id)a4
{
  return -[OctagonPendingFlag initWithFlag:conditions:after:](self, "initWithFlag:conditions:after:", a3, 0, a4);
}

- (OctagonPendingFlag)initWithFlag:(id)a3 scheduler:(id)a4
{
  return -[OctagonPendingFlag initWithFlag:conditions:scheduler:](self, "initWithFlag:conditions:scheduler:", a3, 0, a4);
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 scheduler:(id)a5
{
  id v9;
  id v10;
  OctagonPendingFlag *v11;
  OctagonPendingFlag *v12;
  NSDate *fireTime;
  uint64_t v14;
  NSOperation *afterOperation;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "trigger");
  v17.receiver = self;
  v17.super_class = (Class)OctagonPendingFlag;
  v11 = -[OctagonPendingFlag init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0;

    objc_storeStrong((id *)&v12->_scheduler, a5);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "operationDependency"));
    afterOperation = v12->_afterOperation;
    v12->_afterOperation = (NSOperation *)v14;

    v12->_conditions = a4;
  }

  return v12;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 after:(id)a5
{
  id v9;
  id v10;
  OctagonPendingFlag *v11;
  OctagonPendingFlag *v12;
  NSDate *fireTime;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonPendingFlag;
  v11 = -[OctagonPendingFlag init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0;

    objc_storeStrong((id *)&v12->_afterOperation, a5);
    v12->_conditions = a4;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag fireTime](self, "fireTime"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag flag](self, "flag"));
    v5 = objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag fireTime](self, "fireTime"));
LABEL_3:
    v6 = (void *)v5;
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonPendingFlag: %@: %@>"), v4, v5);
    goto LABEL_4;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag afterOperation](self, "afterOperation"));

  if (!v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag flag](self, "flag"));
    v15 = sub_1000F7BA4(-[OctagonPendingFlag conditions](self, "conditions"));
    v5 = objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_3;
  }
  v11 = -[OctagonPendingFlag conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag flag](self, "flag"));
  v12 = objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag afterOperation](self, "afterOperation"));
  v6 = (void *)v12;
  if (v11)
  {
    v13 = sub_1000F7BA4(-[OctagonPendingFlag conditions](self, "conditions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonPendingFlag: %@: %@ %@>"), v4, v6, v14));

    goto LABEL_5;
  }
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonPendingFlag: %@: %@>"), v4, v12);
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_5:

  return v8;
}

- (OctagonFlagString)flag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)fireTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)conditions
{
  return self->_conditions;
}

- (NSOperation)afterOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAfterOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKKSNearFutureScheduler)scheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_afterOperation, 0);
  objc_storeStrong((id *)&self->_fireTime, 0);
  objc_storeStrong((id *)&self->_flag, 0);
}

@end
