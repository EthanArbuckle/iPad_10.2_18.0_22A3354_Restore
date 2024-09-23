@implementation SUStorePageRotationController

- (void)dealloc
{
  SURotationController *v3;
  objc_super v4;

  -[SURotationController setViewController:](self->_childRotationController, "setViewController:", 0);
  v3 = self->_childRotationController;
  self->_childRotationController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageRotationController;
  -[SURotationController dealloc](&v4, sel_dealloc);
}

- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  -[SUViewController tabBarController](self->super._viewController, "tabBarController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend((id)-[SUViewController view](self->super._viewController, "view"), "viewWithTag:", 1920234350), "setAlpha:", 0.0);
  objc_msgSend(-[SUStorePageRotationController _childRotationController](self, "_childRotationController"), "animateRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  SURotationController *v5;

  -[SUViewController tabBarController](self->super._viewController, "tabBarController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend((id)-[SUViewController view](self->super._viewController, "view"), "viewWithTag:", 1920234350), "removeFromSuperview");
  objc_msgSend(-[SUStorePageRotationController _childRotationController](self, "_childRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  -[SURotationController setViewController:](self->_childRotationController, "setViewController:", 0);
  v5 = self->_childRotationController;
  self->_childRotationController = 0;
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(-[SUStorePageRotationController _childRotationController](self, "_childRotationController"), "prepareToRotateToInterfaceOrientation:", a3);
}

- (id)_childRotationController
{
  void *v3;
  SURotationController *childRotationController;
  SURotationController *v5;

  v3 = (void *)-[SUViewController _activeChildViewController](self->super._viewController, "_activeChildViewController");
  childRotationController = self->_childRotationController;
  if (!childRotationController)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (-[SURotationController viewController](childRotationController, "viewController") != v3)
  {
    v5 = self->_childRotationController;
LABEL_5:

    self->_childRotationController = (SURotationController *)objc_msgSend(v3, "newRotationController");
    self->_childViewController = (SUViewController *)v3;
  }
  return self->_childRotationController;
}

@end
