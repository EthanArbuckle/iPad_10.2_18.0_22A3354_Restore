@implementation SSTestingCoordinator

- (void)_delayedHandleRunPPTRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedIPTest:", v5);

  if (objc_msgSend(v8, "numberOfRequiredScreenshots"))
  {
    -[SSTestingCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "testingCoordinator:requestsTakingScreenshotForRunPPTRequest:", self, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "testName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishedIPTest:", v7);

  }
}

- (void)handleRunPPTRequest:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 5000000000);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SSTestingCoordinator_handleRunPPTRequest___block_invoke;
  v7[3] = &unk_24D06BBA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

uint64_t __44__SSTestingCoordinator_handleRunPPTRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delayedHandleRunPPTRequest:", *(_QWORD *)(a1 + 40));
}

- (SSTestingCoordinatorDelegate)delegate
{
  return (SSTestingCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
