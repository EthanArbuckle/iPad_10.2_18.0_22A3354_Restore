@implementation SXFullscreenCanvasViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenCanvasViewController;
  -[SXFullscreenCanvasViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7998], 0, sel_dismiss);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel_dismiss);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
  -[SXFullscreenCanvasViewController addKeyCommand:](self, "addKeyCommand:", v3);
  -[SXFullscreenCanvasViewController addKeyCommand:](self, "addKeyCommand:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCanvasViewController;
  -[SXFullscreenCanvasViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SXFullscreenCanvasViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCanvasViewController;
  -[SXFullscreenCanvasViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SXFullscreenCanvasViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
  -[SXFullscreenCanvasViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (BOOL)prefersStatusBarHidden
{
  return !-[SXFullscreenCanvasViewController isTransitioning](self, "isTransitioning");
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SXFullscreenCanvasViewController;
  -[SXFullscreenCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SXFullscreenCanvasViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SXFullscreenCanvasViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullscreenCanvasViewController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);

  }
}

- (void)dismiss
{
  void *v3;
  char v4;
  id v5;

  -[SXFullscreenCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXFullscreenCanvasViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullScreenCanvasViewControllerWantsToDismiss:", self);

  }
}

- (void)scrollToNext
{
  id v2;

  -[SXFullscreenCanvasViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleNextCommand");

}

- (void)scrollToPrevious
{
  id v2;

  -[SXFullscreenCanvasViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlePreviousCommand");

}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  if (-[SXFullscreenCanvasViewController isTransitioning](self, "isTransitioning"))
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7998], 0, sel_dismiss);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A8], 0, sel_scrollToNext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A0], 0, sel_scrollToPrevious);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsPriorityOverSystemBehavior:", 1);
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (SXFullscreenCanvasViewControllerDelegate)delegate
{
  return (SXFullscreenCanvasViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
