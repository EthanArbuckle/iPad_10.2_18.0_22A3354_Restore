@implementation SUSplitViewRotationController

- (void)dealloc
{
  SURotationController *v3;
  SURotationController *v4;
  objc_super v5;

  -[SURotationController setViewController:](self->_firstRotationController, "setViewController:", 0);
  v3 = self->_firstRotationController;
  self->_firstRotationController = 0;

  -[SURotationController setViewController:](self->_secondRotationController, "setViewController:", 0);
  v4 = self->_secondRotationController;
  self->_secondRotationController = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUSplitViewRotationController;
  -[SURotationController dealloc](&v5, sel_dealloc);
}

- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "animateRotationToInterfaceOrientation:duration:", a3, a4);
  objc_msgSend(-[SUSplitViewRotationController _secondRotationController](self, "_secondRotationController"), "animateRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  SURotationController *v5;
  SURotationController *v6;
  void *v7;
  void *v8;

  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  -[SURotationController setViewController:](self->_firstRotationController, "setViewController:", 0);
  v5 = self->_firstRotationController;
  self->_firstRotationController = 0;
  objc_msgSend(-[SUSplitViewRotationController _secondRotationController](self, "_secondRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  -[SURotationController setViewController:](self->_secondRotationController, "setViewController:", 0);
  v6 = self->_secondRotationController;
  self->_secondRotationController = 0;
  v7 = (void *)-[SUViewController view](self->super._viewController, "view");
  v8 = (void *)-[SUViewController _splitView](self->super._viewController, "_splitView");
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend((id)objc_msgSend(v8, "layer"), "setShouldRasterize:", 0);
  objc_msgSend(v7, "addSubview:", v8);
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "prepareToRotateToInterfaceOrientation:", a3);
  objc_msgSend(-[SUSplitViewRotationController _secondRotationController](self, "_secondRotationController"), "prepareToRotateToInterfaceOrientation:", a3);
  v5 = (void *)-[SUViewController _splitView](self->super._viewController, "_splitView");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  -[SURotationController viewFrameForInterfaceOrientation:](self, "viewFrameForInterfaceOrientation:", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "setAutoresizingMask:", 0);
  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  objc_msgSend((id)objc_msgSend(v5, "layer"), "setShouldRasterize:", 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (id)_firstRotationController
{
  void *v3;
  SURotationController *firstRotationController;
  SURotationController *v5;
  UIViewController *v6;

  v3 = (void *)-[SUViewController firstViewController](self->super._viewController, "firstViewController");
  firstRotationController = self->_firstRotationController;
  if (firstRotationController)
  {
    if (-[SURotationController viewController](firstRotationController, "viewController") == v3)
      return self->_firstRotationController;
    v5 = self->_firstRotationController;
  }
  else
  {
    v5 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_firstRotationController = (SURotationController *)objc_msgSend(v3, "newRotationController");
    v6 = v3;
  }
  else
  {
    v6 = 0;
    self->_firstRotationController = 0;
  }
  self->_firstViewController = v6;
  return self->_firstRotationController;
}

- (id)_secondRotationController
{
  void *v3;
  SURotationController *secondRotationController;
  SURotationController *v5;
  UIViewController *v6;

  v3 = (void *)-[SUViewController secondViewController](self->super._viewController, "secondViewController");
  secondRotationController = self->_secondRotationController;
  if (secondRotationController)
  {
    if (-[SURotationController viewController](secondRotationController, "viewController") == v3)
      return self->_secondRotationController;
    v5 = self->_secondRotationController;
  }
  else
  {
    v5 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_secondRotationController = (SURotationController *)objc_msgSend(v3, "newRotationController");
    v6 = v3;
  }
  else
  {
    v6 = 0;
    self->_secondRotationController = 0;
  }
  self->_secondViewController = v6;
  return self->_secondRotationController;
}

@end
