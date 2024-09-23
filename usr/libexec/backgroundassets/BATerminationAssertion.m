@implementation BATerminationAssertion

- (BATerminationAssertion)initWithBundleIdentifier:(id)a3
{
  id v4;
  BATerminationAssertion *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BATerminationAssertion;
  v5 = -[BATerminationAssertion init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BackgroundAssets daemon terminating bundleID: %@"), v4));
    v8 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", v7);
    objc_msgSend(v8, "setReportType:", 0);
    objc_msgSend(v8, "setMaximumTerminationResistance:", 40);
    v9 = objc_msgSend(objc_alloc((Class)RBSTerminationAssertion), "initWithPredicate:context:", v6, v8);
    -[BATerminationAssertion setTerminationAssertion:](v5, "setTerminationAssertion:", v9);

  }
  return v5;
}

- (BOOL)acquireAssertionSync:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));

  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    -[BATerminationAssertion setSyncSema:](self, "setSyncSema:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
    objc_msgSend(v7, "addObserver:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
    v9 = objc_msgSend(v8, "acquireWithError:", a3);

    if ((v9 & 1) != 0)
    {
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
      objc_msgSend(v11, "removeObserver:", self);

    }
  }
  else if (a3)
  {
    v10 = sub_1000273E4(CFSTR("BAErrorDomain"), -500);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (void)acquireAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_block_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));

  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A9B4;
    block[3] = &unk_100058B50;
    objc_copyWeak(&v18, &location);
    block[4] = self;
    v6 = v4;
    v17 = v6;
    v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    -[BATerminationAssertion setAsyncClientBlock:](self, "setAsyncClientBlock:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
    objc_msgSend(v8, "addObserver:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
    v15 = 0;
    v10 = objc_msgSend(v9, "acquireWithError:", &v15);
    v11 = v15;

    if ((v10 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
      objc_msgSend(v12, "removeObserver:", self);

      -[BATerminationAssertion setAsyncClientBlock:](self, "setAsyncClientBlock:", 0);
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v11);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = sub_1000273E4(CFSTR("BAErrorDomain"), -500);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BATerminationAssertion terminationAssertion](self, "terminationAssertion"));
  objc_msgSend(v3, "invalidate");

  -[BATerminationAssertion setTerminationAssertion:](self, "setTerminationAssertion:", 0);
  -[BATerminationAssertion setAsyncClientBlock:](self, "setAsyncClientBlock:", 0);
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *dsema;

  dsema = objc_claimAutoreleasedReturnValue(-[BATerminationAssertion syncSema](self, "syncSema", a3));
  if (dsema)
    dispatch_semaphore_signal(dsema);
  v4 = objc_claimAutoreleasedReturnValue(-[BATerminationAssertion asyncClientBlock](self, "asyncClientBlock"));
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    -[BATerminationAssertion setAsyncClientBlock:](self, "setAsyncClientBlock:", 0);
  }

}

- (RBSTerminationAssertion)terminationAssertion
{
  return self->_terminationAssertion;
}

- (void)setTerminationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_terminationAssertion, a3);
}

- (OS_dispatch_semaphore)syncSema
{
  return self->_syncSema;
}

- (void)setSyncSema:(id)a3
{
  objc_storeStrong((id *)&self->_syncSema, a3);
}

- (id)asyncClientBlock
{
  return self->_asyncClientBlock;
}

- (void)setAsyncClientBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_asyncClientBlock, 0);
  objc_storeStrong((id *)&self->_syncSema, 0);
  objc_storeStrong((id *)&self->_terminationAssertion, 0);
}

@end
