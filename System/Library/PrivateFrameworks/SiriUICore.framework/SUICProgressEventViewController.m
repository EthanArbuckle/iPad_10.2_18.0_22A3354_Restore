@implementation SUICProgressEventViewController

- (SUICProgressEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUICProgressEventViewController *v4;
  SUICProgressStateMachine *v5;
  SUICProgressStateMachine *stateMachine;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUICProgressEventViewController;
  v4 = -[SUICProgressEventViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SUICProgressStateMachine);
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = v5;

    -[SUICProgressStateMachine addObserver:](v4->_stateMachine, "addObserver:", v4);
    -[SUICProgressIndicatorViewController setDataSource:](v4, "setDataSource:", v4);
  }
  return v4;
}

- (id)stateMachineForProgressIndicatorViewController:(id)a3
{
  return self->_stateMachine;
}

- (void)handleEvent:(unint64_t)a3
{
  -[SUICProgressStateMachine handleEvent:](self->_stateMachine, "handleEvent:", a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
