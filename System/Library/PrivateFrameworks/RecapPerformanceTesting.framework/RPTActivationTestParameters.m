@implementation RPTActivationTestParameters

- (RPTActivationTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPTActivationTestParameters *v11;
  RPTActivationTestParameters *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RPTActivationTestParameters;
  v11 = -[RPTActivationTestParameters init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[RPTActivationTestParameters setTestName:](v11, "setTestName:", v8);
    -[RPTActivationTestParameters setWindow:](v12, "setWindow:", v9);
    -[RPTActivationTestParameters setCompletionHandler:](v12, "setCompletionHandler:", v10);
  }

  return v12;
}

- (void)prepareWithComposer:(id)a3
{
  id v4;
  RPTActivationInteraction *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = [RPTActivationInteraction alloc];
  -[RPTActivationTestParameters window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RPTActivationInteraction initForAction:window:](v5, "initForAction:window:", 1, v6);

  objc_msgSend(v7, "invokeWithComposer:duration:", v4, 1.0);
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__RPTActivationTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __44__RPTActivationTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  RPTActivationInteraction *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = [RPTActivationInteraction alloc];
  objc_msgSend(*(id *)(a1 + 32), "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RPTActivationInteraction initForAction:window:](v3, "initForAction:window:", 0, v4);

  +[RPTSettings processEnvironment](RPTSettings, "processEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activationIterationCount");

  if (v7 >= 2)
  {
    do
    {
      objc_msgSend(v5, "invokeWithComposer:duration:", v9, 1.0);
      objc_msgSend(v5, "reversedInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invokeWithComposer:duration:", v9, 1.0);

      --v7;
    }
    while (v7);
  }
  else
  {
    objc_msgSend(v5, "invokeWithComposer:duration:", v9, 1.0);
  }

}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
