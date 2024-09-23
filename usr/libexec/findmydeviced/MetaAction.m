@implementation MetaAction

- (MetaAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MetaAction;
  return -[MetaAction init](&v3, "init");
}

- (void)dealloc
{
  objc_super v3;

  -[MetaAction removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("isCancelled"));
  v3.receiver = self;
  v3.super_class = (Class)MetaAction;
  -[MetaAction dealloc](&v3, "dealloc");
}

- (MetaAction)initWithAction:(id)a3 id:(id)a4
{
  id v6;
  id v7;
  MetaAction *v8;
  MetaAction *v9;
  id v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MetaAction;
  v8 = -[MetaAction init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[MetaAction setActionId:](v8, "setActionId:", v7);
    -[MetaAction setEmbeddedAction:](v9, "setEmbeddedAction:", v6);
    v10 = objc_alloc((Class)FMSynchronizer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction description](v9, "description"));
    v12 = objc_msgSend(v10, "initWithDescription:andTimeout:", v11, -1.0);
    -[MetaAction setSynchronizer:](v9, "setSynchronizer:", v12);

    -[MetaAction addObserver:forKeyPath:options:context:](v9, "addObserver:forKeyPath:options:context:", v9, CFSTR("isCancelled"), 1, 0);
  }

  return v9;
}

- (void)main
{
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  if ((-[MetaAction isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = _NSConcreteStackBlock;
    v5 = 3221225472;
    v6 = sub_1000370C8;
    v7 = &unk_1002C1378;
    objc_copyWeak(&v8, &location);
    -[MetaAction runWithCompletion:](self, "runWithCompletion:", &v4);
    if ((-[MetaAction isCancelled](self, "isCancelled", v4, v5, v6, v7) & 1) == 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction synchronizer](self, "synchronizer"));
      objc_msgSend(v3, "wait");

    }
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  unsigned int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("isCancelled")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSKeyValueChangeNewKey));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
      v11 = objc_opt_respondsToSelector(v10, "willCancelAction");

      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
        objc_msgSend(v12, "willCancelAction");

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction synchronizer](self, "synchronizer"));
      objc_msgSend(v13, "signal");

    }
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction actionId](self, "actionId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction _actionStateString](self, "_actionStateString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("#%@-%@-%@"), v3, v4, v5));

  return (NSString *)v6;
}

- (id)_actionStateString
{
  if ((-[MetaAction isCancelled](self, "isCancelled") & 1) != 0)
    return CFSTR("Cancel");
  if ((-[MetaAction isFinished](self, "isFinished") & 1) != 0)
    return CFSTR("Finish");
  if ((-[MetaAction isExecuting](self, "isExecuting") & 1) != 0)
    return CFSTR("Exec");
  if (-[MetaAction isReady](self, "isReady"))
    return CFSTR("Ready");
  return CFSTR("Wait");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
  objc_msgSend(v5, "runWithCompletion:", v4);

}

- (id)actionType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionType"));

  return v3;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
  v6 = objc_opt_respondsToSelector(v5, "shouldCancelAction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
  v6 = objc_opt_respondsToSelector(v5, "shouldWaitForAction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MetaAction embeddedAction](self, "embeddedAction"));
    v8 = objc_msgSend(v7, "shouldWaitForAction:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSCopying)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
  objc_storeStrong((id *)&self->_actionId, a3);
}

- (Action)embeddedAction
{
  return self->_embeddedAction;
}

- (void)setEmbeddedAction:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedAction, a3);
}

- (NSDate)queueAddedDate
{
  return self->_queueAddedDate;
}

- (void)setQueueAddedDate:(id)a3
{
  objc_storeStrong((id *)&self->_queueAddedDate, a3);
}

- (FMSynchronizer)synchronizer
{
  return self->_synchronizer;
}

- (void)setSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_queueAddedDate, 0);
  objc_storeStrong((id *)&self->_embeddedAction, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

@end
