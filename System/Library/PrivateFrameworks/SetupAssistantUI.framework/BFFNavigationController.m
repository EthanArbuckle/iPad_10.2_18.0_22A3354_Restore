@implementation BFFNavigationController

- (BFFNavigationController)init
{
  BFFNavigationController *v2;
  uint64_t v3;
  NSMutableArray *observers;
  uint64_t v5;
  NSMutableDictionary *appearanceHandlers;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BFFNavigationController;
  v2 = -[BFFNavigationController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    appearanceHandlers = v2->_appearanceHandlers;
    v2->_appearanceHandlers = (NSMutableDictionary *)v5;

    v2->_pendingShowOperation = 0;
    v8.receiver = v2;
    v8.super_class = (Class)BFFNavigationController;
    -[BFFNavigationController setDelegate:](&v8, sel_setDelegate_, v2);
  }
  return v2;
}

- (id)initIgnoringDismissals:(BOOL)a3
{
  id result;

  result = -[BFFNavigationController init](self, "init");
  if (result)
    *((_BYTE *)result + 1442) = a3;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (BOOL)_usesTransitionController
{
  return 0;
}

- (BOOL)_canShowTextServices
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  void *v6;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[BFFNavigationController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFNavigationController backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v5 = v8;
  }

}

- (UIColor)backgroundColor
{
  UIColor *backgroundColor;
  UIColor *v3;
  void *v4;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    v3 = backgroundColor;
  }
  else
  {
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[BFFNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredStatusBarStyle");

  if (!v4)
    return 0;
  -[BFFNavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredStatusBarStyle");

  return v6;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  char v3;

  -[BFFNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersStatusBarHidden");

  return v3;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  -[BFFNavigationController forcedPreferredContentSize](self, "forcedPreferredContentSize");
  if (v4 == *MEMORY[0x24BDBF148] && v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v8.receiver = self;
    v8.super_class = (Class)BFFNavigationController;
    -[BFFNavigationController preferredContentSize](&v8, sel_preferredContentSize);
  }
  else
  {
    -[BFFNavigationController forcedPreferredContentSize](self, "forcedPreferredContentSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_super v21;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  BFFNavigationController *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyAutomaticScrollToEdgeBehaviorOnNavigationItem:", v8);

  self->_pendingShowOperation = 1;
  -[BFFNavigationController backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFNavigationController backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "applicationState");

  if (-[BFFNavigationController pushWithoutDeferringTransitionsWhileInBackground](self, "pushWithoutDeferringTransitionsWhileInBackground")&& v13)
  {
    _BYLoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_214875000, v14, OS_LOG_TYPE_DEFAULT, "Will push %@ without deferring transitions (will not animate)", buf, 0xCu);

    }
    v17 = (void *)MEMORY[0x24BEBDB08];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __55__BFFNavigationController_pushViewController_animated___block_invoke;
    v23[3] = &unk_24D2341E0;
    v24 = v6;
    v25 = self;
    objc_msgSend(v17, "_performWithoutDeferringTransitions:", v23);

  }
  else if (v13)
  {
    _BYLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_214875000, v18, OS_LOG_TYPE_DEFAULT, "Will push %@ in background (will not animate)", buf, 0xCu);

    }
    -[BFFNavigationController pushViewController:animated:](&v22, sel_pushViewController_animated_, v6, 0, v21.receiver, v21.super_class, self, BFFNavigationController);
  }
  else
  {
    -[BFFNavigationController pushViewController:animated:](&v21, sel_pushViewController_animated_, v6, v4, self, BFFNavigationController, v22.receiver, v22.super_class);
  }

}

id __55__BFFNavigationController_pushViewController_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BFFNavigationController;
  return objc_msgSendSuper2(&v3, sel_pushViewController_animated_, v1, 0);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  objc_super v4;

  self->_pendingShowOperation = 2;
  v4.receiver = self;
  v4.super_class = (Class)BFFNavigationController;
  -[BFFNavigationController popViewControllerAnimated:](&v4, sel_popViewControllerAnimated_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  -[BFFNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    self->_pendingShowOperation = 2;
  v11.receiver = self;
  v11.super_class = (Class)BFFNavigationController;
  -[BFFNavigationController popToViewController:animated:](&v11, sel_popToViewController_animated_, v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v3 = a3;
  -[BFFNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
    self->_pendingShowOperation = 2;
  v8.receiver = self;
  v8.super_class = (Class)BFFNavigationController;
  -[BFFNavigationController popToRootViewControllerAnimated:](&v8, sel_popToRootViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)pushViewController:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *appearanceHandlers;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a3;
  objc_msgSend(v6, "valueWithPointer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  appearanceHandlers = self->_appearanceHandlers;
  if (v11)
  {
    v10 = (void *)MEMORY[0x2199D7C3C]();
    -[NSMutableDictionary setObject:forKey:](appearanceHandlers, "setObject:forKey:", v10, v8);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](appearanceHandlers, "removeObjectForKey:", v8);
  }
  -[BFFNavigationController pushViewController:animated:](self, "pushViewController:animated:", v7, 1);

}

- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v31 = a4;
  v28 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v31;
    _os_log_impl(&dword_214875000, v7, OS_LOG_TYPE_DEFAULT, "will transition to shield color %@", buf, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BFFNavigationController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v8, "setFrame:");

  -[BFFNavigationController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v8);

  v30 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFNavigationController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v36;
  objc_msgSend(v8, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFNavigationController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v32;
  objc_msgSend(v8, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFNavigationController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v15;
  objc_msgSend(v8, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFNavigationController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v20);

  objc_initWeak((id *)buf, self);
  v21 = (void *)MEMORY[0x24BEBDB00];
  v22 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke;
  v47[3] = &unk_24D2341E0;
  v23 = v8;
  v48 = v23;
  v49 = v31;
  v41[0] = v22;
  v41[1] = 3221225472;
  v41[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2;
  v41[3] = &unk_24D2346D0;
  v24 = v49;
  v42 = v24;
  objc_copyWeak(&v46, (id *)buf);
  v25 = v29;
  v43 = v25;
  v26 = v28;
  v45 = v26;
  v27 = v23;
  v44 = v27;
  objc_msgSend(v21, "animateWithDuration:animations:completion:", v47, v41, 0.5);

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

}

uint64_t __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

void __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "did transition to shield color %@", buf, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WeakRetained[177];
  if (*(_QWORD *)(a1 + 56))
  {
    v7 = (void *)MEMORY[0x2199D7C3C]();
    objc_msgSend(v6, "setObject:forKey:", v7, v5);

  }
  else
  {
    objc_msgSend(WeakRetained[177], "removeObjectForKey:", v5);
  }
  objc_msgSend(WeakRetained, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setViewControllers:", v9);

  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", *(_QWORD *)(a1 + 48));

  v11 = MEMORY[0x24BDAC760];
  v12 = (void *)MEMORY[0x24BEBDB00];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_35;
  v16[3] = &unk_24D2341B8;
  v17 = *(id *)(a1 + 48);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2_36;
  v13[3] = &unk_24D2346A8;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v12, "animateWithDuration:animations:completion:", v16, v13, 0.5);

}

void __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_35(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

uint64_t __74__BFFNavigationController_pushViewController_usingShieldColor_completion___block_invoke_2_36(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "did transition from shield color %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)popToViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *appearanceHandlers;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  appearanceHandlers = self->_appearanceHandlers;
  if (v6)
  {
    v9 = (void *)MEMORY[0x2199D7C3C](v6);
    -[NSMutableDictionary setObject:forKey:](appearanceHandlers, "setObject:forKey:", v9, v7);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appearanceHandlers, "removeObjectForKey:", v7);
  }
  v10 = -[BFFNavigationController popToViewController:animated:](self, "popToViewController:animated:", v11, 1);

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applyAutomaticScrollToEdgeBehaviorOnNavigationItem:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  -[BFFNavigationController viewControllers](self, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if ((v16 & 1) == 0)
    self->_pendingShowOperation = 1;
  -[BFFNavigationController backgroundColor](self, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if (objc_msgSend(v23, "isViewLoaded"))
          {
            objc_msgSend(v23, "view");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[BFFNavigationController backgroundColor](self, "backgroundColor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setBackgroundColor:", v25);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

  }
  v26.receiver = self;
  v26.super_class = (Class)BFFNavigationController;
  -[BFFNavigationController setViewControllers:animated:](&v26, sel_setViewControllers_animated_, v6, v4);

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  BFFNavigationController *v11;
  uint64_t v12;

  v4 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  if (-[BFFNavigationController ignoreDismissals](self, "ignoreDismissals")
    && (-[BFFNavigationController presentedViewController](self, "presentedViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
    }

    if (v6)
      v6[2](v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BFFNavigationController;
    -[BFFNavigationController dismissViewControllerWithTransition:completion:](&v9, sel_dismissViewControllerWithTransition_completion_, v4, v6);
  }

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  BFFNavigationController *v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  if (-[BFFNavigationController ignoreDismissals](self, "ignoreDismissals")
    && (-[BFFNavigationController presentedViewController](self, "presentedViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);
    }

    if (v6)
      v6[2](v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BFFNavigationController;
    -[BFFNavigationController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6);
  }

}

- (void)setDelegate:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[BFFNavigationController removeDelegateObserver:](self, "removeDelegateObserver:", v4);
    -[BFFNavigationController addDelegateObserver:](self, "addDelegateObserver:", v4);

  }
}

- (void)_reapObservers
{
  id v3;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_observers, "indexesOfObjectsPassingTest:", &__block_literal_global_1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_observers, "removeObjectsAtIndexes:", v3);

}

BOOL __41__BFFNavigationController__reapObservers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)addDelegateObserver:(id)a3
{
  NSMutableArray *observers;
  id v4;

  observers = self->_observers;
  +[BFFNavigationObserver observerWithObserver:](BFFNavigationObserver, "observerWithObserver:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](observers, "addObject:", v4);

}

- (void)removeDelegateObserver:(id)a3
{
  id v4;
  NSMutableArray *observers;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  observers = self->_observers;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__BFFNavigationController_removeDelegateObserver___block_invoke;
  v8[3] = &unk_24D234738;
  v7 = v4;
  v9 = v7;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](observers, "indexOfObjectPassingTest:", v8);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_observers, "removeObjectAtIndex:", v6);

}

BOOL __50__BFFNavigationController_removeDelegateObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v21 = a4;
  v8 = v5;
  if (v5)
    self->_animating = 1;
  -[BFFNavigationController _reapObservers](self, "_reapObservers");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)-[NSMutableArray copy](self->_observers, "copy");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "observer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_respondsToSelector();

        objc_msgSend(v13, "observer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v15 & 1) != 0)
        {
          objc_msgSend(v16, "navigationController:willShowViewController:operation:animated:", self, v21, self->_pendingShowOperation, v8);
        }
        else
        {
          v18 = objc_opt_respondsToSelector();

          if ((v18 & 1) == 0)
            continue;
          objc_msgSend(v13, "observer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "navigationController:willShowViewController:animated:", v19, v21, v8);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  int64_t pendingShowOperation;
  BFFNavigationController *v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v27 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v7 = a4;
  pendingShowOperation = self->_pendingShowOperation;
  self->_pendingShowOperation = 0;
  self->_animating = 0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appearanceHandlers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_appearanceHandlers, "objectForKeyedSubscript:", v8);
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    -[NSMutableDictionary removeObjectForKey:](self->_appearanceHandlers, "removeObjectForKey:", v8);
  }
  v23 = (void *)v8;
  -[BFFNavigationController _reapObservers](self, "_reapObservers");
  v26 = self;
  v11 = (void *)-[NSMutableArray copy](self->_observers, "copy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "observer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        objc_msgSend(v17, "observer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v19 & 1) != 0)
        {
          objc_msgSend(v20, "navigationController:didShowViewController:operation:animated:", v26, v7, pendingShowOperation, v27);
        }
        else
        {
          v22 = objc_opt_respondsToSelector();

          if ((v22 & 1) == 0)
            continue;
          objc_msgSend(v17, "observer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "navigationController:didShowViewController:animated:", v24, v7, v27);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

}

- (CGSize)forcedPreferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_forcedPreferredContentSize.width;
  height = self->_forcedPreferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setForcedPreferredContentSize:(CGSize)a3
{
  self->_forcedPreferredContentSize = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)pushWithoutDeferringTransitionsWhileInBackground
{
  return self->_pushWithoutDeferringTransitionsWhileInBackground;
}

- (void)setPushWithoutDeferringTransitionsWhileInBackground:(BOOL)a3
{
  self->_pushWithoutDeferringTransitionsWhileInBackground = a3;
}

- (BOOL)ignoreDismissals
{
  return self->_ignoreDismissals;
}

- (void)setIgnoreDismissals:(BOOL)a3
{
  self->_ignoreDismissals = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_appearanceHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
