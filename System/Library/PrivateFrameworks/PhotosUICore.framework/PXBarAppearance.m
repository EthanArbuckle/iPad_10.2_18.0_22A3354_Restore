@implementation PXBarAppearance

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXBarAppearanceObservationContext == a5)
    -[PXBarAppearance _update](self, "_update", a3, a4);
}

- (void)setPrefersToolbarVisible:(BOOL)a3
{
  if (self->_prefersToolbarVisible != a3)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 4);
    self->_prefersToolbarVisible = a3;
  }
}

- (void)setPrefersTabBarVisible:(BOOL)a3
{
  if (self->_prefersTabBarVisible != a3)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 8);
    self->_prefersTabBarVisible = a3;
  }
}

- (void)setPrefersStatusBarVisible:(BOOL)a3
{
  if (self->_prefersStatusBarVisible != a3)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 1);
    self->_prefersStatusBarVisible = a3;
  }
}

- (void)setPrefersNavigationBarVisible:(BOOL)a3
{
  if (self->_prefersNavigationBarVisible != a3)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 2);
    self->_prefersNavigationBarVisible = a3;
  }
}

- (void)viewControllerViewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PXBarAppearance isEnabled](self, "isEnabled"))
  {
    if (-[PXBarAppearance prefersViewIsAppearingForAppearanceUpdates](self, "prefersViewIsAppearingForAppearanceUpdates"))
    {
      -[PXBarAppearance _updateOnViewAppearance:](self, "_updateOnViewAppearance:", v3);
    }
  }
}

- (void)_updateWithAnimationOptions:(id)a3 isStatusBarHidden:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL8 v14;
  void *v15;
  int v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  -[PXBarAppearance viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_appearState") - 1 <= 2)
  {
    v8 = -[PXBarAppearance prefersStatusBarVisible](self, "prefersStatusBarVisible");
    v9 = -[PXBarAppearance prefersNavigationBarVisible](self, "prefersNavigationBarVisible");
    v10 = -[PXBarAppearance prefersToolbarVisible](self, "prefersToolbarVisible");
    if (-[PXBarAppearance prefersTabBarVisible](self, "prefersTabBarVisible"))
    {
      objc_msgSend(v7, "tabBarController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "px_hidesTabBarForCurrentHorizontalSizeClass") ^ 1;

    }
    else
    {
      v12 = 0;
    }
    -[PXBarAppearance navigationBarTintColor](self, "navigationBarTintColor");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v10 & v12)
    {
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "UIKit doesn't support displaying both toolbar and tab bar simultaneously, see <rdar://problem/48875763>.", buf, 2u);
      }

    }
    v14 = v10;
    objc_msgSend(v7, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isNavigationBarHidden");
    v18 = objc_msgSend(v15, "_useStandardStatusBarHeight");
    if (v8 == v4 && v9 == v16 && v8 == v9)
      objc_msgSend(v15, "_setUseStandardStatusBarHeight:", 1);
    if ((v8 & 1) != 0)
    {
      -[PXBarAppearance _setNavigationBarVisible:withAnimationOptions:](self, "_setNavigationBarVisible:withAnimationOptions:", v9, v6);
      v17 = (void *)v19;
      -[PXBarAppearance _setNavigationBarTintColor:withAnimationOptions:](self, "_setNavigationBarTintColor:withAnimationOptions:", v19, v6);
      -[PXBarAppearance _setTabBarVisible:withAnimationOptions:](self, "_setTabBarVisible:withAnimationOptions:", v12, v6);
      -[PXBarAppearance _setToolbarVisible:withAnimationOptions:](self, "_setToolbarVisible:withAnimationOptions:", v14, v6);
      -[PXBarAppearance _updateStatusBarStyleAndVisibilityWithAnimationOptions:](self, "_updateStatusBarStyleAndVisibilityWithAnimationOptions:", v6);
    }
    else
    {
      -[PXBarAppearance _updateStatusBarStyleAndVisibilityWithAnimationOptions:](self, "_updateStatusBarStyleAndVisibilityWithAnimationOptions:", v6);
      -[PXBarAppearance _setNavigationBarVisible:withAnimationOptions:](self, "_setNavigationBarVisible:withAnimationOptions:", v9, v6);
      v17 = (void *)v19;
      -[PXBarAppearance _setNavigationBarTintColor:withAnimationOptions:](self, "_setNavigationBarTintColor:withAnimationOptions:", v19, v6);
      -[PXBarAppearance _setTabBarVisible:withAnimationOptions:](self, "_setTabBarVisible:withAnimationOptions:", v12, v6);
      -[PXBarAppearance _setToolbarVisible:withAnimationOptions:](self, "_setToolbarVisible:withAnimationOptions:", v14, v6);
    }
    objc_msgSend(v15, "_setUseStandardStatusBarHeight:", v18);

  }
}

- (BOOL)prefersToolbarVisible
{
  return self->_prefersToolbarVisible;
}

- (void)_updateImplementationDelegate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  -[PXBarAppearance viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_barAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "implementationDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (uint64_t)v9;
  if (!v9)
  {
    do
    {
      objc_msgSend(v3, "parentViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[PXBarAppearance _sharedDefaultImplementationDelegate](PXBarAppearance, "_sharedDefaultImplementationDelegate");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      v6 = (void *)v8;

      objc_msgSend(v6, "px_barAppearance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "implementationDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (uint64_t)v10;
      v3 = v6;
    }
    while (!v10);
    v3 = v6;
  }
LABEL_7:
  v11 = (id)v5;
  -[PXBarAppearance _setImplementationDelegate:](self, "_setImplementationDelegate:", v5);

}

- (BOOL)adjustedPrefersStatusBarHidden:(BOOL)a3
{
  _BOOL4 v3;

  LOBYTE(v3) = a3;
  if (-[PXBarAppearance isEnabled](self, "isEnabled"))
    return !-[PXBarAppearance prefersStatusBarVisible](self, "prefersStatusBarVisible");
  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)prefersStatusBarVisible
{
  return self->_prefersStatusBarVisible;
}

- (PXBarAppearanceImplementationDelegate)implementationDelegate
{
  return (PXBarAppearanceImplementationDelegate *)objc_loadWeakRetained((id *)&self->_implementationDelegate);
}

- (PXBarAppearance)initWithViewController:(id)a3
{
  id v4;
  PXBarAppearance *v5;
  PXBarAppearance *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXBarAppearance;
  v5 = -[PXBarAppearance init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_prefersStatusBarVisible = 1;
    v5->_prefersNavigationBarVisible = 1;
    v5->_prefersToolbarVisible = 0;
    v5->_prefersTabBarVisible = 1;
    objc_storeWeak((id *)&v5->_viewController, v4);
    -[PXBarAppearance registerChangeObserver:context:](v6, "registerChangeObserver:context:", v6, PXBarAppearanceObservationContext);
  }

  return v6;
}

- (void)_setImplementationDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__implementationDelegate, obj);
    self->_implementationDelegateFlags.respondsToWillUpdateBarAppearanceOnViewWillAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToIsStatusBarVisible = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToIsStatusBarVisible = objc_opt_respondsToSelector() & 1;
  }

}

+ (id)_sharedDefaultImplementationDelegate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXBarAppearance__sharedDefaultImplementationDelegate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedDefaultImplementationDelegate_onceToken != -1)
    dispatch_once(&_sharedDefaultImplementationDelegate_onceToken, block);
  return (id)_sharedDefaultImplementationDelegate_defaultImplementationDelegate;
}

- (BOOL)prefersTabBarVisible
{
  return self->_prefersTabBarVisible;
}

- (BOOL)prefersNavigationBarVisible
{
  return self->_prefersNavigationBarVisible;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (void)_performBarsTransition:(id)a3
{
  void (**v4)(_QWORD);
  int64_t transitionsCounter;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[5];

  v4 = (void (**)(_QWORD))a3;
  transitionsCounter = self->_transitionsCounter;
  self->_transitionsCounter = transitionsCounter + 1;
  if (!transitionsCounter)
  {
    -[PXBarAppearance viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_willTransitionBars");

  }
  v4[2](v4);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXBarAppearance__performBarsTransition___block_invoke;
  aBlock[3] = &unk_1E5149198;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PXBarAppearance viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __42__PXBarAppearance__performBarsTransition___block_invoke_2;
    v11[3] = &unk_1E512CC28;
    v12 = v8;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v11);

  }
  else
  {
    v8[2](v8);
  }

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

void __42__PXBarAppearance__performBarsTransition___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[13])
  {
    objc_msgSend(v1, "viewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_didTransitionBars");

  }
}

uint64_t __65__PXBarAppearance__setNavigationBarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  uint64_t result;
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(result)
  {
    case 2:
      v3 = *(_BYTE *)(a1 + 48) == 0;
      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v5 = v4;
      v6 = v3;
      v7 = 1;
      return objc_msgSend(v5, "_setNavigationBarHidden:edge:duration:", v6, v7);
    case 1:
      v8 = *(_BYTE *)(a1 + 48) == 0;
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v5 = v9;
      v6 = v8;
      v7 = 15;
      return objc_msgSend(v5, "_setNavigationBarHidden:edge:duration:", v6, v7);
    case 0:
      return objc_msgSend(*(id *)(a1 + 40), "setNavigationBarHidden:animated:", *(_BYTE *)(a1 + 48) == 0, 0);
  }
  return result;
}

uint64_t __58__PXBarAppearance__setTabBarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  void *v3;

  v1 = *(unsigned __int8 *)(a1 + 52);
  v2 = *(unsigned int *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "duration");
  if (v1)
    return objc_msgSend(v3, "showBarWithTransition:duration:", v2);
  else
    return objc_msgSend(v3, "hideBarWithTransition:duration:", v2);
}

- (void)_setToolbarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v4 = a3;
  v6 = a4;
  -[PXBarAppearance viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isToolbarHidden") == v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PXBarAppearance__setToolbarVisible_withAnimationOptions___block_invoke;
    v9[3] = &unk_1E51473C0;
    v10 = v6;
    v11 = v8;
    v12 = v4;
    -[PXBarAppearance _performBarsTransition:](self, "_performBarsTransition:", v9);

  }
}

- (void)viewControllerViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PXBarAppearance isEnabled](self, "isEnabled"))
  {
    -[PXBarAppearance _updateOnViewWillAppear:](self, "_updateOnViewWillAppear:", v3);
    if (!-[PXBarAppearance prefersViewIsAppearingForAppearanceUpdates](self, "prefersViewIsAppearingForAppearanceUpdates"))-[PXBarAppearance _updateOnViewAppearance:](self, "_updateOnViewAppearance:", v3);
  }
}

- (BOOL)prefersViewIsAppearingForAppearanceUpdates
{
  return self->_prefersViewIsAppearingForAppearanceUpdates;
}

- (void)_updateOnViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXBarAppearance _updateImplementationDelegate](self, "_updateImplementationDelegate");
  -[PXBarAppearance _implementationDelegate](self, "_implementationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_implementationDelegateFlags.respondsToWillUpdateBarAppearanceOnViewWillAppear)
  {
    v6 = v5;
    objc_msgSend(v5, "barAppearance:willUpdateBarAppearanceOnViewWillAppear:", self, v3);
    v5 = v6;
  }

}

- (void)_updateOnViewAppearance:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  PXBarAnimationOptions *v7;
  PXBarAnimationOptions *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  -[PXBarAppearance viewController](self, "viewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXBarAppearance _updateImplementationDelegate](self, "_updateImplementationDelegate");
  -[PXBarAppearance _implementationDelegate](self, "_implementationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isCancelled"))
  {
    -[PXBarAppearance navigationBarTintColor](self, "navigationBarTintColor");
    v7 = (PXBarAnimationOptions *)objc_claimAutoreleasedReturnValue();
    -[PXBarAppearance _setNavigationBarTintColor:withAnimationOptions:](self, "_setNavigationBarTintColor:withAnimationOptions:", v7, 0);
  }
  else
  {
    if (v3)
    {
      v8 = [PXBarAnimationOptions alloc];
      objc_msgSend(v6, "transitionDuration");
      v7 = -[PXBarAnimationOptions initWithType:duration:](v8, "initWithType:duration:", 1);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isStatusBarHidden");

    if (self->_implementationDelegateFlags.respondsToIsStatusBarVisible)
      v10 = objc_msgSend(v5, "barAppearanceIsStatusBarVisible:", self) ^ 1;
    -[PXBarAppearance _updateWithAnimationOptions:isStatusBarHidden:](self, "_updateWithAnimationOptions:isStatusBarHidden:", v7, v10);
  }

}

- (PXBarAppearanceImplementationDelegate)_implementationDelegate
{
  return (PXBarAppearanceImplementationDelegate *)objc_loadWeakRetained((id *)&self->__implementationDelegate);
}

- (void)_update
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PXBarAppearance _animationOptions](self, "_animationOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStatusBarHidden");

  -[PXBarAppearance _updateWithAnimationOptions:isStatusBarHidden:](self, "_updateWithAnimationOptions:isStatusBarHidden:", v5, v4);
}

- (void)performChangesWithAnimationOptions:(id)a3 changes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXBarAppearance _animationOptions](self, "_animationOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (v8)
    {
      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "bar appearance animation options specified multiple times (existing:%@, specified:%@)", buf, 0x16u);
      }

    }
    else
    {
      -[PXBarAppearance _setAnimationOptions:](self, "_setAnimationOptions:", v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PXBarAppearance;
  -[PXBarAppearance performChanges:](&v11, sel_performChanges_, v7);
  -[PXBarAppearance _setAnimationOptions:](self, "_setAnimationOptions:", v9);

}

- (void)_setAnimationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (PXBarAnimationOptions)_animationOptions
{
  return self->__animationOptions;
}

- (void)_setNavigationBarTintColor:(id)a3 withAnimationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[PXBarAppearance viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v7, "type"))
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(v7, "duration");
      v13 = v12;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __67__PXBarAppearance__setNavigationBarTintColor_withAnimationOptions___block_invoke;
      v16[3] = &unk_1E5148D08;
      v17 = v10;
      v18 = v6;
      objc_msgSend(v11, "animateWithDuration:animations:", v16, v13);

    }
    else if (v6)
    {
      objc_msgSend(v10, "setTintColor:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v15);

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)adjustedPreferredStatusBarStyle:(int64_t)a3
{
  void *v7;

  switch(-[PXBarAppearance barAppearancePreferredStatusBarStyle](self, "barAppearancePreferredStatusBarStyle"))
  {
    case 0:
      return a3;
    case 1:
      a3 = 0;
      break;
    case 2:
      a3 = 1;
      break;
    case 3:
      a3 = 3;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBarAppearance.m"), 173, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return a3;
}

- (int64_t)barAppearancePreferredStatusBarStyle
{
  return self->_barAppearancePreferredStatusBarStyle;
}

void __74__PXBarAppearance__updateStatusBarStyleAndVisibilityWithAnimationOptions___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsStatusBarAppearanceUpdate");

}

void __55__PXBarAppearance__sharedDefaultImplementationDelegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultImplementationDelegate");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate;
    _sharedDefaultImplementationDelegate_defaultImplementationDelegate = v2;

  }
}

- (void)_updateStatusBarStyleAndVisibilityWithAnimationOptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = 1;
  if (v5 == 2)
    v6 = 2;
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  -[PXBarAppearance _setPreferredStatusBarUpdateAnimation:](self, "_setPreferredStatusBarUpdateAnimation:", v7);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v4, "duration");
  v10 = v9;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PXBarAppearance__updateStatusBarStyleAndVisibilityWithAnimationOptions___block_invoke;
  v11[3] = &unk_1E5149198;
  v11[4] = self;
  objc_msgSend(v8, "animateWithDuration:animations:", v11, v10);
}

- (void)_setPreferredStatusBarUpdateAnimation:(int64_t)a3
{
  self->__preferredStatusBarUpdateAnimation = a3;
}

- (void)_setTabBarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int v17;
  BOOL v18;

  v6 = a4;
  v7 = objc_msgSend(v6, "type");
  if (v7 == 1)
    v8 = 6;
  else
    v8 = 0;
  if (v7 == 2)
    v9 = 7;
  else
    v9 = v8;
  -[PXBarAppearance viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tabBarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PXBarAppearance__setTabBarVisible_withAnimationOptions___block_invoke;
  v14[3] = &unk_1E512CC00;
  v18 = a3;
  v17 = v9;
  v15 = v11;
  v16 = v6;
  v12 = v6;
  v13 = v11;
  -[PXBarAppearance _performBarsTransition:](self, "_performBarsTransition:", v14);

}

- (void)_setNavigationBarVisible:(BOOL)a3 withAnimationOptions:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v4 = a3;
  v6 = a4;
  -[PXBarAppearance viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isNavigationBarHidden") == v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__PXBarAppearance__setNavigationBarVisible_withAnimationOptions___block_invoke;
    v9[3] = &unk_1E51473C0;
    v10 = v6;
    v11 = v8;
    v12 = v4;
    -[PXBarAppearance _performBarsTransition:](self, "_performBarsTransition:", v9);

  }
}

- (PXBarAppearance)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBarAppearance.m"), 51, CFSTR("unavailable initializer"));

  return 0;
}

- (void)performChanges:(id)a3
{
  -[PXBarAppearance performChangesWithAnimationOptions:changes:](self, "performChangesWithAnimationOptions:changes:", 0, a3);
}

- (void)setBarAppearancePreferredStatusBarStyle:(int64_t)a3
{
  if (self->_barAppearancePreferredStatusBarStyle != a3)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 32);
    self->_barAppearancePreferredStatusBarStyle = a3;
  }
}

- (void)setNavigationBarTintColor:(id)a3
{
  UIColor *v4;
  UIColor *navigationBarTintColor;
  char v6;
  UIColor *v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = self->_navigationBarTintColor;
  navigationBarTintColor = v8;
  if (v4 == v8)
    goto LABEL_4;
  v6 = -[UIColor isEqual:](v8, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[PXBarAppearance signalChange:](self, "signalChange:", 16);
    v7 = (UIColor *)-[UIColor copy](v8, "copy");
    navigationBarTintColor = self->_navigationBarTintColor;
    self->_navigationBarTintColor = v7;
LABEL_4:

  }
}

- (int64_t)adjustedPreferredStatusBarUpdateAnimation:(int64_t)a3
{
  if (-[PXBarAppearance isEnabled](self, "isEnabled"))
    return -[PXBarAppearance _preferredStatusBarUpdateAnimation](self, "_preferredStatusBarUpdateAnimation");
  else
    return a3;
}

- (int64_t)_preferredStatusBarUpdateAnimation
{
  return self->__preferredStatusBarUpdateAnimation;
}

- (void)setPrefersViewIsAppearingForAppearanceUpdates:(BOOL)a3
{
  self->_prefersViewIsAppearingForAppearanceUpdates = a3;
}

- (void)setImplementationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_implementationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implementationDelegate);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->__animationOptions, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_destroyWeak((id *)&self->__implementationDelegate);
}

uint64_t __42__PXBarAppearance__performBarsTransition___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__PXBarAppearance__setToolbarVisible_withAnimationOptions___block_invoke(uint64_t a1)
{
  uint64_t result;
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(result)
  {
    case 2:
      v3 = *(_BYTE *)(a1 + 48) == 0;
      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v5 = v4;
      v6 = v3;
      v7 = 4;
      return objc_msgSend(v5, "_setToolbarHidden:edge:duration:", v6, v7);
    case 1:
      v8 = *(_BYTE *)(a1 + 48) == 0;
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v5 = v9;
      v6 = v8;
      v7 = 15;
      return objc_msgSend(v5, "_setToolbarHidden:edge:duration:", v6, v7);
    case 0:
      return objc_msgSend(*(id *)(a1 + 40), "setToolbarHidden:animated:", *(_BYTE *)(a1 + 48) == 0, 0);
  }
  return result;
}

void __67__PXBarAppearance__setNavigationBarTintColor_withAnimationOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v2);

  }
}

@end
