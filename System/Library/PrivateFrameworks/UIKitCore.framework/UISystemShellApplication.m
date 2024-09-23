@implementation UISystemShellApplication

+ (BOOL)rendersLocally
{
  return 0;
}

- (BOOL)isFrontBoard
{
  return 1;
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)isSuspendedEventsOnly
{
  return 0;
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  id v5;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UISystemShellApplication noteActiveInterfaceOrientationWillChangeToOrientation:screen:](self, "noteActiveInterfaceOrientationWillChangeToOrientation:screen:", a3, v5);

}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UISystemShellApplication noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:](self, "noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:", a3, v8, a5, v9);

}

- (int64_t)_interfaceOrientationRotationDirectionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;

  if (a4 == 2)
    v4 = 180;
  else
    v4 = 0;
  if (a4 == 4)
    v5 = -90;
  else
    v5 = v4;
  if (a4 == 3)
    v6 = 90;
  else
    v6 = v5;
  if (a4 == 1)
    v6 = 0;
  if (a3 == 2)
    v7 = -180;
  else
    v7 = 0;
  if (a3 == 4)
    v8 = 90;
  else
    v8 = v7;
  if (a3 == 3)
    v9 = -90;
  else
    v9 = v8;
  if (a3 == 1)
    v9 = 0;
  v10 = v9 + v6;
  v11 = (double)v10;
  if (v10 <= -181)
  {
    do
      v11 = v11 + 360.0;
    while (v11 < -180.0);
  }
  for (; v11 > 180.0; v11 = v11 + -360.0)
    ;
  if (fabs(v11) != 180.0 && v11 < 0.0)
    return 2;
  else
    return 1;
}

- (UISystemShellApplication)init
{
  UISystemShellApplication *v2;
  UISystemShellApplication *v3;
  uint64_t v4;
  FBDisplayLayoutTransition *interfaceOrientationTransition;
  void *v6;
  void *v7;
  id v8;
  UISystemShellApplication *v9;
  uint64_t v10;
  id didFinishLaunchingObserver;
  _QWORD v13[4];
  UISystemShellApplication *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UISystemShellApplication;
  v2 = -[UIApplication init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIApplication _setShouldFixMainThreadPriority:](v2, "_setShouldFixMainThreadPriority:", 1);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D228F0]), "initWithDisplayType:name:", 0, CFSTR("FBSystemAppActiveInterfaceOrientationChanged"));
    interfaceOrientationTransition = v3->_interfaceOrientationTransition;
    v3->_interfaceOrientationTransition = (FBDisplayLayoutTransition *)v4;

    objc_msgSend(MEMORY[0x1E0D22900], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInterfaceOrientation:animationSettings:direction:", -[UISystemShellApplication startupInterfaceOrientation](v3, "startupInterfaceOrientation"), 0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v7);

    v8 = objc_loadWeakRetained(&location);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__UISystemShellApplication_init__block_invoke;
    v13[3] = &unk_1E16CB250;
    objc_copyWeak(&v15, &location);
    v9 = v3;
    v14 = v9;
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidFinishLaunchingNotification"), 0, 0, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    didFinishLaunchingObserver = v9->_didFinishLaunchingObserver;
    v9->_didFinishLaunchingObserver = (id)v10;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__UISystemShellApplication_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v3 = WeakRetained;
  BSRunLoopPerformAfterCACommit();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496), v6, 3221225472, __32__UISystemShellApplication_init__block_invoke_2, &unk_1E16B1B50);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 496);
  *(_QWORD *)(v4 + 496) = 0;

}

uint64_t __32__UISystemShellApplication_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", *MEMORY[0x1E0D22870], *(_QWORD *)(a1 + 40));
}

- (int64_t)startupInterfaceOrientation
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 1;
}

- (BOOL)isSuspendedUnderLock
{
  return 0;
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  return 1;
}

- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3
{
  return 1;
}

- (BOOL)_saveSnapshotWithName:(id)a3
{
  return 0;
}

- (BOOL)canOpenURL:(id)a3
{
  return -[UIApplication _canOpenURL:publicURLsOnly:](self, "_canOpenURL:publicURLsOnly:", a3, 0);
}

- (BOOL)_openURL:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4 && -[UISystemShellApplication canOpenURL:](self, "canOpenURL:", v4))
  {
    -[UIApplication _applicationOpenURL:payload:](self, "_applicationOpenURL:payload:", v4, 0);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  if (-[FBDisplayLayoutTransition interfaceOrientation](self->_interfaceOrientationTransition, "interfaceOrientation") != a3)
  {
    -[FBDisplayLayoutTransition setInterfaceOrientation:](self->_interfaceOrientationTransition, "setInterfaceOrientation:", a3);
    -[FBDisplayLayoutTransition beginTransition](self->_interfaceOrientationTransition, "beginTransition");
  }
  v7.receiver = self;
  v7.super_class = (Class)UISystemShellApplication;
  -[UIApplication noteActiveInterfaceOrientationWillChangeToOrientation:screen:](&v7, sel_noteActiveInterfaceOrientationWillChangeToOrientation_screen_, a3, v6);

}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6
{
  id v10;
  int64_t v11;
  void *v12;
  objc_super v13;

  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UISystemShellApplication;
  -[UIApplication noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:](&v13, sel_noteActiveInterfaceOrientationDidChangeToOrientation_willAnimateWithSettings_fromOrientation_screen_, a3, v10, a5, a6);
  if (-[FBDisplayLayoutTransition isTransitioning](self->_interfaceOrientationTransition, "isTransitioning"))
  {
    -[FBDisplayLayoutTransition setInterfaceOrientation:](self->_interfaceOrientationTransition, "setInterfaceOrientation:", a3);
    -[FBDisplayLayoutTransition endTransition](self->_interfaceOrientationTransition, "endTransition");
    v11 = -[UISystemShellApplication _interfaceOrientationRotationDirectionFromOrientation:toOrientation:](self, "_interfaceOrientationRotationDirectionFromOrientation:toOrientation:", a5, a3);
    objc_msgSend(MEMORY[0x1E0D22900], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInterfaceOrientation:animationSettings:direction:", a3, v10, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishLaunchingObserver, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationTransition, 0);
}

@end
