@implementation PPTTestRunner

- (void)startTest
{
  -[PPTTestSM start](self->_testMachine, "start");
}

- (void)removeTestFromQueue
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PPTTestRunner testQueue](self, "testQueue"));
  objc_msgSend(v2, "removeObjectAtIndex:", 0);

}

- (int)timeBeforeTest
{
  return -[PPTTestDelegate timeBeforeTest](self->_testDelegate, "timeBeforeTest");
}

- (BOOL)isFatalError
{
  return 1;
}

- (BOOL)isQueueEmpty
{
  return -[NSMutableArray count](self->_testQueue, "count") == 0;
}

- (BOOL)shouldSleepBeforeTest
{
  return (int)-[PPTTestDelegate timeBeforeTest](self->_testDelegate, "timeBeforeTest") > 0;
}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PPTTestRunner machine](self, "machine"));
  objc_msgSend(v2, "start");

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PPTTestRunner machine](self, "machine"));
  objc_msgSend(v2, "stop");

}

- (PPTTestRunner)init
{
  PPTTestRunner *v2;
  PPTTestRunner *v3;
  uint64_t v4;
  NSMutableArray *testQueue;
  PPTTestRunnerSM *v6;
  PPTTestRunnerSM *machine;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPTTestRunner;
  v2 = -[PPTTestRunner init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_queue, &_dispatch_main_q);
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    testQueue = v3->_testQueue;
    v3->_testQueue = (NSMutableArray *)v4;

    v6 = -[PPTTestRunnerSM initWithDelegate:]([PPTTestRunnerSM alloc], "initWithDelegate:", v3);
    machine = v3->_machine;
    v3->_machine = v6;

    v3->_testSequence = 0;
  }
  return v3;
}

- (id)createSafeBlock:(id)a3
{
  id v4;
  int testSequence;
  id v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  int v12;
  id location;

  v4 = a3;
  testSequence = self->_testSequence;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001AA3CC;
  v9[3] = &unk_1008EE2A8;
  objc_copyWeak(&v11, &location);
  v12 = testSequence;
  v10 = v4;
  v6 = v4;
  v7 = objc_retainBlock(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (void)prepareTestToStart
{
  void *v3;
  PPTTestDelegate *v4;
  PPTTestDelegate *testDelegate;
  PPTTestSM *v6;
  PPTTestSM *testMachine;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTTestRunner testQueue](self, "testQueue"));
  v4 = (PPTTestDelegate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  testDelegate = self->_testDelegate;
  self->_testDelegate = v4;

  v6 = -[PPTTestSM initWithDelegate:]([PPTTestSM alloc], "initWithDelegate:", self);
  testMachine = self->_testMachine;
  self->_testMachine = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPTTestRunner createSafeBlock:](self, "createSafeBlock:", &stru_1008EE2E8));
  -[PPTTestDelegate setOnTestFinished:](self->_testDelegate, "setOnTestFinished:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PPTTestRunner createSafeBlock:](self, "createSafeBlock:", &stru_1008EE308));
  -[PPTTestDelegate setOnReceiveHandler:](self->_testDelegate, "setOnReceiveHandler:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PPTTestRunner createSafeBlock:](self, "createSafeBlock:", &stru_1008EE328));
  -[PPTTestSM setOnTestFinished:](self->_testMachine, "setOnTestFinished:", v10);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001AA6C8;
  v18[3] = &unk_1008EE378;
  v18[4] = self;
  v11 = objc_retainBlock(v18);
  v12 = ((uint64_t (*)(_QWORD *, const __CFString *))v11[2])(v11, CFSTR("failed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[PPTTestSM setOnTestError:](self->_testMachine, "setOnTestError:", v13);

  v14 = ((uint64_t (*)(_QWORD *, const __CFString *))v11[2])(v11, CFSTR("time out"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[PPTTestSM setOnTestTimeout:](self->_testMachine, "setOnTestTimeout:", v15);

  v16 = ((uint64_t (*)(_QWORD *, const __CFString *))v11[2])(v11, CFSTR("time out waiting for handler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[PPTTestSM setOnHandlerTimeout:](self->_testMachine, "setOnHandlerTimeout:", v17);

}

- (void)terminateTest
{
  PPTTestSM *testMachine;
  PPTTestDelegate *testDelegate;

  ++self->_testSequence;
  testMachine = self->_testMachine;
  self->_testMachine = 0;

  -[PPTTestDelegate setOnTestFinished:](self->_testDelegate, "setOnTestFinished:", 0);
  -[PPTTestDelegate setOnReceiveHandler:](self->_testDelegate, "setOnReceiveHandler:", 0);
  testDelegate = self->_testDelegate;
  self->_testDelegate = 0;

}

- (id)onFatalError
{
  return self->onFatalError;
}

- (void)setOnFatalError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)onIdle
{
  return self->onIdle;
}

- (void)setOnIdle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onStopped
{
  return self->onStopped;
}

- (void)setOnStopped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)onStart
{
  return self->onStart;
}

- (void)setOnStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onSuccess
{
  return self->onSuccess;
}

- (void)setOnSuccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)onTestFinished
{
  return self->onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)onTestError
{
  return self->onTestError;
}

- (void)setOnTestError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSMutableArray)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PPTTestSM)testMachine
{
  return self->_testMachine;
}

- (void)setTestMachine:(id)a3
{
  objc_storeStrong((id *)&self->_testMachine, a3);
}

- (PPTTestRunnerSM)machine
{
  return self->_machine;
}

- (void)setMachine:(id)a3
{
  objc_storeStrong((id *)&self->_machine, a3);
}

- (PPTTestDelegate)testDelegate
{
  return self->_testDelegate;
}

- (void)setTestDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_testDelegate, a3);
}

- (int)testSequence
{
  return self->_testSequence;
}

- (void)setTestSequence:(int)a3
{
  self->_testSequence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDelegate, 0);
  objc_storeStrong((id *)&self->_machine, 0);
  objc_storeStrong((id *)&self->_testMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong(&self->onTestError, 0);
  objc_storeStrong(&self->onTestFinished, 0);
  objc_storeStrong(&self->onSuccess, 0);
  objc_storeStrong(&self->onStart, 0);
  objc_storeStrong(&self->onStopped, 0);
  objc_storeStrong(&self->onIdle, 0);
  objc_storeStrong(&self->onFatalError, 0);
}

@end
