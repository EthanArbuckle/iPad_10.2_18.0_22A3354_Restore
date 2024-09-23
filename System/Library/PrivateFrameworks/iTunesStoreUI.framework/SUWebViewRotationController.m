@implementation SUWebViewRotationController

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  void *v4;
  CGRect v5;

  if (!-[SUViewController _isEnteringForeground](self->super._viewController, "_isEnteringForeground", a3))
  {
    v4 = (void *)-[SUViewController webView](self->super._viewController, "webView");
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom")
      || (objc_msgSend(v4, "frame"), !CGRectEqualToRect(v5, *MEMORY[0x24BDBF090])))
    {
      objc_msgSend(v4, "endSynchronousLayout");
    }
    if (objc_msgSend(v4, "superview"))
    {
      objc_msgSend((id)objc_msgSend(v4, "superview"), "bounds");
      objc_msgSend(v4, "setFrame:");
    }
    -[SUViewController _setLastKnownOrientation:](self->super._viewController, "_setLastKnownOrientation:", -[SUViewController interfaceOrientation](self->super._viewController, "interfaceOrientation"));
  }
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  _BOOL4 v5;
  SUViewController *viewController;
  void *v7;
  void *v8;
  _QWORD v9[6];
  CGRect v10;

  v5 = -[SUViewController _isEnteringForeground](self->super._viewController, "_isEnteringForeground");
  viewController = self->super._viewController;
  v7 = (void *)-[SUViewController webView](viewController, "webView");
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setHidden:", 1);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__SUWebViewRotationController_prepareToRotateToInterfaceOrientation___block_invoke;
    v9[3] = &unk_24DE7B950;
    v9[4] = viewController;
    v9[5] = a3;
    dispatch_after(0, MEMORY[0x24BDAC9B8], v9);
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom")
         || (objc_msgSend(v8, "frame"), !CGRectEqualToRect(v10, *MEMORY[0x24BDBF090])))
  {
    objc_msgSend(v8, "beginSynchronousLayout");
    -[SUViewController _sendOrientationWillChangeToInterfaceOrientation:](self->super._viewController, "_sendOrientationWillChangeToInterfaceOrientation:", a3);
  }
}

uint64_t __69__SUWebViewRotationController_prepareToRotateToInterfaceOrientation___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "webView");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(v2, "beginSynchronousLayout");
  objc_msgSend(*(id *)(a1 + 32), "_sendOrientationWillChangeToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "endSynchronousLayout");
  objc_msgSend(v2, "setHidden:", 0);
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

@end
