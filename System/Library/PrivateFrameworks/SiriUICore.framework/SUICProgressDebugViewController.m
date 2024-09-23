@implementation SUICProgressDebugViewController

- (SUICProgressDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUICProgressDebugViewController *v4;
  SUICProgressIndicatorViewController *v5;
  SUICProgressIndicatorViewController *indicatorViewController;
  UIButton *v7;
  UIButton *eventGeneratorButton;
  SUICProgressStateMachine *v9;
  SUICProgressStateMachine *stateMachine;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUICProgressDebugViewController;
  v4 = -[SUICProgressDebugViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SUICProgressIndicatorViewController);
    indicatorViewController = v4->_indicatorViewController;
    v4->_indicatorViewController = v5;

    -[SUICProgressIndicatorViewController setDataSource:](v4->_indicatorViewController, "setDataSource:", v4);
    v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    eventGeneratorButton = v4->_eventGeneratorButton;
    v4->_eventGeneratorButton = v7;

    -[UIButton addTarget:action:forControlEvents:](v4->_eventGeneratorButton, "addTarget:action:forControlEvents:", v4, sel__eventGeneratorButtonTouchedUpInside_, 64);
    v9 = objc_alloc_init(SUICProgressStateMachine);
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = v9;

    -[SUICProgressStateMachine addObserver:](v4->_stateMachine, "addObserver:", v4->_indicatorViewController);
  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUICProgressDebugViewController;
  -[SUICProgressDebugViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SUICProgressDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SUICProgressDebugViewController addChildViewController:](self, "addChildViewController:", self->_indicatorViewController);
  -[SUICProgressDebugViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICProgressIndicatorViewController view](self->_indicatorViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[SUICProgressIndicatorViewController didMoveToParentViewController:](self->_indicatorViewController, "didMoveToParentViewController:", self);
  -[SUICProgressDebugViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_eventGeneratorButton);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUICProgressDebugViewController;
  -[SUICProgressDebugViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SUICProgressDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIButton setFrame:](self->_eventGeneratorButton, "setFrame:", v5, v7, v9, v11);
  -[SUICProgressIndicatorViewController view](self->_indicatorViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");

}

- (id)stateMachineForProgressIndicatorViewController:(id)a3
{
  return self->_stateMachine;
}

- (NSProgress)progress
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", 45);
  return (NSProgress *)v2;
}

- (void)_eventGeneratorButtonTouchedUpInside:(id)a3
{
  unint64_t testEventLoopCounter;

  testEventLoopCounter = self->_testEventLoopCounter;
  if (testEventLoopCounter >= 5)
  {
    testEventLoopCounter = 0;
    self->_testEventLoopCounter = 0;
  }
  -[SUICProgressStateMachine handleEvent:](self->_stateMachine, "handleEvent:", testEventLoopCounter);
  ++self->_testEventLoopCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_eventGeneratorButton, 0);
  objc_storeStrong((id *)&self->_indicatorViewController, 0);
}

@end
