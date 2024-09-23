@implementation SBSDispatch

- (SBSDispatch)initWithQueue:(id)a3
{
  id v5;
  SBSDispatch *v6;
  SBSDispatch *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSDispatch;
  v6 = -[SBSDispatch init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)sync:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[SBSDispatch queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

- (void)async:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[SBSDispatch queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
