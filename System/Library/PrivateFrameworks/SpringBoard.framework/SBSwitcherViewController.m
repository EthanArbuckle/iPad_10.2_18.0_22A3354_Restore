@implementation SBSwitcherViewController

- (void)setContentOrientation:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_contentWrapperView, "setContentOrientation:", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherViewController;
  -[SBSwitcherViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewWillAppearForSwitcherViewController:animated:", self, v3);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)_overrideInterfaceOrientationMechanics
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "overrideInterfaceOrientationMechanicsForSwitcherViewController:", self);

  return v4;
}

- (int64_t)contentOrientation
{
  return -[BSUIOrientationTransformWrapperView contentOrientation](self->_contentWrapperView, "contentOrientation");
}

- (void)addContentView:(id)a3
{
  -[BSUIOrientationTransformWrapperView addContentView:](self->_contentWrapperView, "addContentView:", a3);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  BSUIOrientationTransformWrapperView *v5;
  BSUIOrientationTransformWrapperView *contentWrapperView;
  void *v7;
  id WeakRetained;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherViewController;
  -[SBSwitcherViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D01940]);
  -[SBSwitcherViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v3, "initWithFrame:");
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v5;

  -[BSUIOrientationTransformWrapperView setAutoresizingMask:](self->_contentWrapperView, "setAutoresizingMask:", 18);
  -[SBSwitcherViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_contentWrapperView);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewDidLoadForSwitcherViewController:", self);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (SBSwitcherViewControllerDelegate)delegate
{
  return (SBSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end
