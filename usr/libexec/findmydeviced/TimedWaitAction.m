@implementation TimedWaitAction

- (TimedWaitAction)initWithAction:(id)a3 executeAt:(id)a4
{
  id v6;
  id v7;
  TimedWaitAction *v8;
  TimedWaitAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TimedWaitAction;
  v8 = -[TimedWaitAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[TimedWaitAction setEmbeddedAction:](v8, "setEmbeddedAction:", v6);
    -[TimedWaitAction setExecutionDate:](v9, "setExecutionDate:", v7);
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction executionDate](self, "executionDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TimedWait(0x%p)-%ld-%@"), self, (uint64_t)v6, v7));

  return (NSString *)v8;
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  TimedWaitAction *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction executionDate](self, "executionDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = objc_alloc((Class)FMDispatchTimer);
  global_queue = dispatch_get_global_queue(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100070910;
  v18 = &unk_1002C16D8;
  v19 = self;
  v20 = v4;
  v12 = v4;
  v13 = objc_msgSend(v9, "initWithQueue:timeout:completion:", v11, &v15, v8);
  -[TimedWaitAction setTimer:](self, "setTimer:", v13, v15, v16, v17, v18, v19);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction timer](self, "timer"));
  objc_msgSend(v14, "start");

}

- (id)actionType
{
  return CFSTR("TimedWaitAction");
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
  v6 = objc_opt_respondsToSelector(v5, "shouldCancelAction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
    v8 = objc_msgSend(v7, "shouldCancelAction:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
  v6 = objc_opt_respondsToSelector(v5, "shouldWaitForAction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
    v8 = objc_msgSend(v7, "shouldWaitForAction:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)willCancelAction
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction timer](self, "timer"));
  objc_msgSend(v3, "cancel");

  -[TimedWaitAction setTimer:](self, "setTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
  v5 = objc_opt_respondsToSelector(v4, "willCancelAction");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[TimedWaitAction embeddedAction](self, "embeddedAction"));
    objc_msgSend(v6, "willCancelAction");

  }
}

- (Action)embeddedAction
{
  return self->_embeddedAction;
}

- (void)setEmbeddedAction:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedAction, a3);
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (void)setExecutionDate:(id)a3
{
  objc_storeStrong((id *)&self->_executionDate, a3);
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_executionDate, 0);
  objc_storeStrong((id *)&self->_embeddedAction, 0);
}

@end
