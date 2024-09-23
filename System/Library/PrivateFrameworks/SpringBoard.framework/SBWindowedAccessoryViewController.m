@implementation SBWindowedAccessoryViewController

- (void)loadView
{
  SBWindowedAccessoryView *v3;
  SBWindowedAccessoryView *windowedAccessoryView;

  v3 = objc_alloc_init(SBWindowedAccessoryView);
  windowedAccessoryView = self->_windowedAccessoryView;
  self->_windowedAccessoryView = v3;

  -[SBWindowedAccessoryView setDelegate:](self->_windowedAccessoryView, "setDelegate:", self);
  -[SBWindowedAccessoryViewController setView:](self, "setView:", self->_windowedAccessoryView);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBWindowedAccessoryViewController;
  -[SBWindowedAccessoryViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)forceDetachWindowedAcessoryButtonTapped:(id)a3
{
  id v4;

  -[SBWindowedAccessoryViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowedAccessoryViewControllerForceDetachButtonTapped:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBWindowedAccessoryViewControllerDelegate)delegate
{
  return (SBWindowedAccessoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowedAccessoryView)windowedAccessoryView
{
  return self->_windowedAccessoryView;
}

- (void)setWindowedAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_windowedAccessoryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowedAccessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
