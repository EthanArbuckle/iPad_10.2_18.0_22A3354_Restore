@implementation PPTTestSM

- (PPTTestSM)initWithDelegate:(id)a3
{
  id v4;
  PPTTestSM *v5;
  PPTTestSM *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPTTestSM;
  v5 = -[PPTTestSM init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_state = 0;
    v6->_sleepSeq = 0;
  }

  return v6;
}

- (void)sleep:(int)a3 completion:(id)a4
{
  id v6;
  int v7;
  int state;
  dispatch_time_t v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  int v15;
  int v16;

  v6 = a4;
  v7 = self->_sleepSeq + 1;
  self->_sleepSeq = v7;
  state = self->_state;
  v9 = dispatch_time(0, 1000000000 * a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B6F60;
  block[3] = &unk_1008E9B78;
  v15 = state;
  v16 = v7;
  block[4] = self;
  v14 = v6;
  v12 = v6;
  dispatch_after(v9, v11, block);

}

- (void)startTest
{
  PPTTestSMDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "testDelegate"));
  objc_msgSend(v5, "startTest");

  self->_state = 2;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDelegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001B7054;
  v8[3] = &unk_1008E72C0;
  v8[4] = self;
  -[PPTTestSM sleep:completion:](self, "sleep:completion:", objc_msgSend(v7, "testTimeout"), v8);

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
  block[2] = sub_1001B7188;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handlerReceived
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7354;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

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
  block[2] = sub_1001B73F0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)onTestFinished
{
  return self->_onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)onTestError
{
  return self->_onTestError;
}

- (void)setOnTestError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onTestTimeout
{
  return self->_onTestTimeout;
}

- (void)setOnTestTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)onHandlerTimeout
{
  return self->_onHandlerTimeout;
}

- (void)setOnHandlerTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onHandlerTimeout, 0);
  objc_storeStrong(&self->_onTestTimeout, 0);
  objc_storeStrong(&self->_onTestError, 0);
  objc_storeStrong(&self->_onTestFinished, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
