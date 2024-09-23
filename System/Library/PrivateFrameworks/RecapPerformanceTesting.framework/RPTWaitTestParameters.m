@implementation RPTWaitTestParameters

- (RPTWaitTestParameters)initWithTestName:(id)a3 wait:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  RPTWaitTestParameters *v10;
  RPTWaitTestParameters *v11;
  uint64_t v12;
  id completionHandler;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RPTWaitTestParameters;
  v10 = -[RPTWaitTestParameters init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[RPTWaitTestParameters setTestName:](v10, "setTestName:", v8);
    v11->_waitDuration = a4;
    v12 = objc_msgSend(v9, "copy");
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v12;

  }
  return v11;
}

- (RPTWaitTestParameters)initWithWait:(double)a3
{
  return -[RPTWaitTestParameters initWithTestName:wait:completionHandler:](self, "initWithTestName:wait:completionHandler:", 0, 0, a3);
}

- (RPTWaitTestParameters)init
{
  return -[RPTWaitTestParameters initWithWait:](self, "initWithWait:", 0.5);
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__RPTWaitTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __38__RPTWaitTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "waitDuration");
  objc_msgSend(v3, "advanceTime:");

}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)waitDuration
{
  return self->_waitDuration;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
