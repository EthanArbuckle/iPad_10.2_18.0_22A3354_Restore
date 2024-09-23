@implementation PPTTestRunnerSM

- (PPTTestRunnerSM)initWithDelegate:(id)a3
{
  id v4;
  PPTTestRunnerSM *v5;
  PPTTestRunnerSM *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPTTestRunnerSM;
  v5 = -[PPTTestRunnerSM init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_state = 0;
    v6->_sleepSeq = 0;
  }

  return v6;
}

- (void)sleep:(int)a3 onEnd:(id)a4
{
  id v6;
  int state;
  int v8;
  dispatch_time_t v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  int v14;
  int v15;

  v6 = a4;
  if (a3 >= 1)
  {
    state = self->_state;
    v8 = self->_sleepSeq + 1;
    self->_sleepSeq = v8;
    v9 = dispatch_time(0, 1000000000 * a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C1974;
    block[3] = &unk_1008E9B78;
    block[4] = self;
    v14 = state;
    v15 = v8;
    v13 = v6;
    dispatch_after(v9, v11, block);

  }
}

- (void)runTest
{
  PPTTestRunnerSMDelegate **p_delegate;
  id WeakRetained;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(void);
  id v10;
  void *v11;
  id v12;
  void (**v13)(void);
  _QWORD *v14;
  id v15;
  id v16;
  unsigned int v17;
  id v18;
  _QWORD v19[5];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isQueueEmpty");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "onSuccess"));

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onSuccess"));
      v9[2]();

    }
    v10 = objc_loadWeakRetained((id *)p_delegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "onIdle"));

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)p_delegate);
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "onIdle"));
      v13[2]();

    }
    self->_state = 0;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000C1B48;
    v19[3] = &unk_1008E72C0;
    v19[4] = self;
    v14 = objc_retainBlock(v19);
    v15 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v15, "prepareTestToStart");

    v16 = objc_loadWeakRetained((id *)p_delegate);
    v17 = objc_msgSend(v16, "shouldSleepBeforeTest");

    if (v17)
    {
      self->_state = 1;
      v18 = objc_loadWeakRetained((id *)p_delegate);
      -[PPTTestRunnerSM sleep:onEnd:](self, "sleep:onEnd:", objc_msgSend(v18, "timeBeforeTest"), v14);

    }
    else
    {
      ((void (*)(_QWORD *))v14[2])(v14);
    }

  }
}

- (void)start
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1C08;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)stop
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1D30;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)fromStoppingToIdle
{
  PPTTestRunnerSMDelegate **p_delegate;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void (**v8)(void);
  id v9;
  void *v10;
  id v11;
  void (**v12)(void);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeTestFromQueue");

  v5 = objc_loadWeakRetained((id *)p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onStopped"));

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onStopped"));
    v8[2]();

  }
  v9 = objc_loadWeakRetained((id *)p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "onIdle"));

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "onIdle"));
    v12[2]();

  }
  self->_state = 0;
}

- (void)testFinished
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1F44;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)checkFatalError
{
  PPTTestRunnerSMDelegate **p_delegate;
  id WeakRetained;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(void);
  id v10;
  void *v11;
  id v12;
  void (**v13)(void);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isFatalError");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "onFatalError"));

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onFatalError"));
      v9[2]();

    }
    v10 = objc_loadWeakRetained((id *)p_delegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "onIdle"));

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)p_delegate);
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "onIdle"));
      v13[2]();

    }
    self->_state = 0;
  }
  return v5;
}

- (void)testError
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2200;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
