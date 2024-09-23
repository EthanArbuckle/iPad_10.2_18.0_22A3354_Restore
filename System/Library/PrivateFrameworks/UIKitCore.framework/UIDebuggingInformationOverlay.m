@implementation UIDebuggingInformationOverlay

- (UIDebuggingInformationOverlay)init
{
  UIDebuggingInformationOverlay *v3;
  UIDebuggingInformationOverlay *v4;
  UIDebuggingInformationOverlay *v5;
  objc_super v7;

  if (qword_1ECD7B010 != -1)
    dispatch_once(&qword_1ECD7B010, &__block_literal_global_82_5);
  if (_MergedGlobals_11_15)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDebuggingInformationOverlay;
    v3 = -[UIWindow init](&v7, sel_init);
    v4 = v3;
    if (v3)
      -[UIWindow _setWindowControlsStatusBarOrientation:](v3, "_setWindowControlsStatusBarOrientation:", 0);
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isFullscreen
{
  void *v2;
  char v3;

  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullscreen");

  return v3;
}

+ (void)prepareDebuggingOverlay
{
  id v2;
  id v3;

  if (_UIGetDebuggingOverlayEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationProtectedDataWillBecomeUnavailable"), 0, 0, &__block_literal_global_81_6);

  }
}

void __56__UIDebuggingInformationOverlay_prepareDebuggingOverlay__block_invoke()
{
  id v0;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_setHidden:", 1);

}

+ (id)overlay
{
  if (qword_1ECD7B020 != -1)
    dispatch_once(&qword_1ECD7B020, &__block_literal_global_84);
  return (id)qword_1ECD7B018;
}

uint64_t __40__UIDebuggingInformationOverlay_overlay__block_invoke()
{
  UIDebuggingInformationOverlay *v0;
  void *v1;
  void *v2;
  UIDebuggingInformationOverlayViewController *v3;

  v0 = objc_alloc_init(UIDebuggingInformationOverlay);
  v1 = (void *)qword_1ECD7B018;
  qword_1ECD7B018 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B018;
  v3 = objc_alloc_init(UIDebuggingInformationOverlayViewController);
  objc_msgSend(v2, "setRootViewController:", v3);

  return objc_msgSend((id)qword_1ECD7B018, "setHidden:", 1);
}

- (void)_setHidden:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD aBlock[5];
  CGAffineTransform v18;
  _QWORD v19[5];
  CGAffineTransform v20;
  CGAffineTransform v21;

  -[UIView frame](self, "frame");
  v6 = v5;
  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v6 - v9;

  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeTranslation(&v21, 0.0, v10);
  if (a3)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    v18 = v21;
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke_2;
    aBlock[3] = &unk_1E16BF720;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke_3;
    v16[3] = &unk_1E16B3FD8;
    v16[4] = self;
    v13 = _Block_copy(v16);
  }
  else
  {
    -[UIWindow setHidden:](self, "setHidden:", 0);
    v20 = v21;
    -[UIView setTransform:](self, "setTransform:", &v20);
    -[UIWindow makeKeyAndVisible](self, "makeKeyAndVisible");
    +[UIColor clearColor](UIColor, "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v14);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke;
    v19[3] = &unk_1E16B1B28;
    v19[4] = self;
    v12 = _Block_copy(v19);
    +[_UIPrototypingSettingsManager sharedManager](_UIPrototypingSettingsManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "synchronizeStoredSettings");

    v13 = 0;
  }
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v13, 0.2);

}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

- (void)toggleVisibility
{
  void *v3;
  void *v4;

  -[UIDebuggingInformationOverlay inspectedWindow](self, "inspectedWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationOverlay setInspectedWindow:](self, "setInspectedWindow:", v4);

  }
  -[UIDebuggingInformationOverlay _setHidden:](self, "_setHidden:", -[UIView isHidden](self, "isHidden") ^ 1);
}

- (void)toggleFullscreen
{
  id v2;

  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleFullscreen");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  UIDebuggingInformationOverlay *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v31.x = x;
  v31.y = y;
  v10 = CGRectContainsPoint(v32, v31);

  if (v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)UIDebuggingInformationOverlay;
    -[UIView hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y, v23.receiver, v23.super_class);
LABEL_3:
    v11 = (UIDebuggingInformationOverlay *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!-[UIDebuggingInformationOverlay checkingTouches](self, "checkingTouches"))
  {
    -[UIDebuggingInformationOverlay lastTouch](self, "lastTouch");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v7)
    {
      if (!-[UIDebuggingInformationOverlay touchCaptureEnabled](self, "touchCaptureEnabled"))
      {
        v11 = 0;
        goto LABEL_19;
      }
      -[UIView hitTest:withEvent:](&v23, sel_hitTest_withEvent_, v7, x, y, self, UIDebuggingInformationOverlay);
      goto LABEL_3;
    }
  }
  -[UIDebuggingInformationOverlay inspectedWindow](self, "inspectedWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", v7, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIDebuggingInformationOverlay touchObservers](self, "touchObservers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19++), "didReceiveNewView:", v14);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

  -[UIDebuggingInformationOverlay setCheckingTouches:](self, "setCheckingTouches:", 0);
  -[UIDebuggingInformationOverlay lastTouch](self, "lastTouch");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v7)
    v21 = 0;
  else
    v21 = v7;
  -[UIDebuggingInformationOverlay setLastTouch:](self, "setLastTouch:", v21);
  v11 = self;

LABEL_19:
  return v11;
}

- (UIDebuggingInformationOverlay)initWithFrame:(CGRect)a3
{
  UIDebuggingInformationOverlay *v3;
  uint64_t v4;
  NSMutableArray *touchObservers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationOverlay;
  v3 = -[UIWindow initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    touchObservers = v3->_touchObservers;
    v3->_touchObservers = (NSMutableArray *)v4;

    -[UIWindow setWindowLevel:](v3, "setWindowLevel:", 2200.0);
  }
  return v3;
}

- (UIDebuggingInformationRootTableViewController)rootTableViewController
{
  void *v2;
  void *v3;

  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIDebuggingInformationRootTableViewController *)v3;
}

- (void)setRootTableViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIDebuggingInformationOverlay overlayViewController](self, "overlayViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRootTableViewController:", v4);

}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (BOOL)checkingTouches
{
  return self->_checkingTouches;
}

- (void)setCheckingTouches:(BOOL)a3
{
  self->_checkingTouches = a3;
}

- (BOOL)touchCaptureEnabled
{
  return self->_touchCaptureEnabled;
}

- (void)setTouchCaptureEnabled:(BOOL)a3
{
  self->_touchCaptureEnabled = a3;
}

- (NSMutableArray)touchObservers
{
  return self->_touchObservers;
}

- (void)setTouchObservers:(id)a3
{
  objc_storeStrong((id *)&self->_touchObservers, a3);
}

- (UIWindow)inspectedWindow
{
  return self->_inspectedWindow;
}

- (void)setInspectedWindow:(id)a3
{
  objc_storeStrong((id *)&self->_inspectedWindow, a3);
}

- (UIEvent)lastTouch
{
  return self->_lastTouch;
}

- (void)setLastTouch:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouch, a3);
}

- (CGPoint)drawingOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_drawingOrigin.x;
  y = self->_drawingOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDrawingOrigin:(CGPoint)a3
{
  self->_drawingOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_inspectedWindow, 0);
  objc_storeStrong((id *)&self->_touchObservers, 0);
}

@end
