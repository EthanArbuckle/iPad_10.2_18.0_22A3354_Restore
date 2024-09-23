@implementation UIStatusBarForegroundView

- (UIStatusBarForegroundView)initWithFrame:(CGRect)a3 foregroundStyle:(id)a4 usesVerticalLayout:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  UIStatusBarForegroundView *v13;
  UIStatusBarForegroundView *v14;
  uint64_t v15;
  UIStatusBarLayoutManager *v16;
  UIStatusBarLayoutManager *v17;
  UIAccessibilityHUDGestureManager *v18;
  UIAccessibilityHUDGestureManager *accessibilityHUDGestureManager;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIStatusBarForegroundView;
  v13 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_foregroundStyle, a4);
    v15 = 0;
    v14->_usesVerticalLayout = a5;
    do
    {
      v16 = -[UIStatusBarLayoutManager initWithRegion:foregroundView:usesVerticalLayout:]([UIStatusBarLayoutManager alloc], "initWithRegion:foregroundView:usesVerticalLayout:", v15, v14, v14->_usesVerticalLayout);
      v17 = v14->_layoutManagers[v15];
      v14->_layoutManagers[v15] = v16;

      ++v15;
    }
    while (v15 != 3);
    -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
    v18 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", v14, v14);
    accessibilityHUDGestureManager = v14->_accessibilityHUDGestureManager;
    v14->_accessibilityHUDGestureManager = v18;

  }
  return v14;
}

- (void)dealloc
{
  uint64_t v3;
  UIStatusBarLayoutManager **layoutManagers;
  UIStatusBarLayoutManager *v5;
  objc_super v6;

  v3 = 0;
  layoutManagers = self->_layoutManagers;
  do
  {
    -[UIStatusBarLayoutManager setForegroundView:](layoutManagers[v3], "setForegroundView:", 0);
    v5 = layoutManagers[v3];
    layoutManagers[v3] = 0;

    ++v3;
  }
  while (v3 != 3);
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarForegroundView;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (id)_statusBarItemViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  UIStatusBarLayoutManager **layoutManagers;
  UIStatusBarLayoutManager *v8;
  void *v9;
  BOOL v10;

  y = a3.y;
  x = a3.x;
  v6 = 0;
  layoutManagers = self->_layoutManagers;
  do
  {
    v8 = layoutManagers[v6];
    -[UIStatusBarLayoutManager visibleItemViewAtPoint:inForegroundView:](v8, "visibleItemViewAtPoint:inForegroundView:", self, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = 1;
    else
      v10 = v6 == 2;
    ++v6;
  }
  while (!v10);
  return v9;
}

- (id)_statusBarWindowForAccessibilityHUD
{
  void *v2;
  id v3;
  unint64_t v4;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    v4 = _statusBarWindowForAccessibilityHUD___s_category;
    if (!_statusBarWindowForAccessibilityHUD___s_category)
    {
      v4 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_statusBarWindowForAccessibilityHUD___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v6 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "status bar wanted to show or hide the accessibility HUD but instead of a status bar window there was %@", (uint8_t *)&v7, 0xCu);
      }
    }
    v3 = 0;
  }

  return v3;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  void *v4;
  void *v5;

  -[UIStatusBarForegroundView _statusBarItemViewAtPoint:](self, "_statusBarItemViewAtPoint:", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHUDRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  -[UIStatusBarForegroundView _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showAccessibilityHUDItem:forView:", v5, self);

}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3;

  -[UIStatusBarForegroundView _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dismissAccessibilityHUD");

}

- (UIStatusBar)statusBar
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UIStatusBar *)v5;
}

- (BOOL)willChangeNavigationItemDisplayWithSystemNavigationAction:(id)a3
{
  int v3;
  void *v4;
  int v5;

  v3 = self->_itemIsEnabled[50];
  objc_msgSend(a3, "titleForDestination:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v3 != v5;
}

- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL *itemIsEnabled;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  UIStatusBarLayoutManager **layoutManagers;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  void *v26;
  uint64_t i;
  dispatch_time_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  _BOOL4 v32;
  _QWORD v33[6];
  _QWORD block[4];
  id v35;
  UIStatusBarForegroundView *v36;

  v5 = a5;
  v9 = a3;
  if (a4 || !-[UIStatusBarComposedData isEqual:](self->_currentData, "isEqual:", v9))
  {
    objc_storeStrong((id *)&self->_currentData, a3);
    -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData");
    -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canShowBreadcrumbs");

    if (v11)
    {
      if (*(_BYTE *)(objc_msgSend(v9, "rawData") + 2537))
      {
        v12 = 1;
      }
      else
      {
        objc_msgSend(v9, "systemNavigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "destinations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v14, "containsObject:", &unk_1E1A9A2C0);

      }
      objc_msgSend(v9, "setItem:enabled:", 50, v12);
      objc_msgSend(v9, "setItem:enabled:", 51, 0);
    }
    else
    {
      LODWORD(v12) = 0;
    }
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      v15 = objc_msgSend(v9, "isItemEnabled:", 0) ? 6 : 1;
      objc_msgSend(v9, "setItem:enabled:", v15, 0);
      if (MGGetBoolAnswer())
      {
        if ((objc_msgSend(v9, "isItemEnabled:", 4) & 1) == 0 && (objc_msgSend(v9, "isItemEnabled:", 3) & 1) == 0)
        {
          objc_msgSend(v9, "setItem:enabled:", 4, 1);
          *(_DWORD *)(objc_msgSend(v9, "rawData") + 440) = -1;
        }
      }
    }
    v16 = 0;
    itemIsEnabled = self->_itemIsEnabled;
    v32 = self->_itemIsEnabled[0];
    v18 = self->_itemIsEnabled[39];
    do
    {
      itemIsEnabled[v16] = objc_msgSend(v9, "isItemEnabled:", v16);
      ++v16;
    }
    while (v16 != 52);
    v19 = 0;
    if ((a4 & 4) != 0)
      v20 = a4 & 0xFFFFFFFE;
    else
      v20 = a4;
    layoutManagers = self->_layoutManagers;
    do
      LODWORD(v12) = v12 | -[UIStatusBarLayoutManager prepareEnabledItems:withData:actions:](layoutManagers[v19++], "prepareEnabledItems:withData:actions:", self->_itemIsEnabled, v9, v20);
    while (v19 != 3);
    v22 = 0.0;
    if (v5 & (a4 >> 2))
      v22 = 0.5;
    v23 = (v20 >> 6) & 1;
    if (v22 != 0.0)
      v23 = 0;
    if (v23 & v5)
      v24 = 0.25;
    else
      v24 = v22;
    if (v24 > 0.0)
    {
      +[UIStatusBarLockItemView lockSlideAnimationDuration](UIStatusBarLockItemView, "lockSlideAnimationDuration");
      v26 = 0;
      if (!v18 || v24 >= v25)
      {
LABEL_37:
        for (i = 0; i != 3; ++i)
          LODWORD(v12) = v12 | -[UIStatusBarLayoutManager updateItemsWithData:actions:animated:](layoutManagers[i], "updateItemsWithData:actions:animated:", v9, v20, v5);
        if ((v12 & 1) != 0)
        {
          if (v5 && v24 > 0.0)
          {
            objc_msgSend(v26, "setUseCustomFadeAnimation:", 1);
            v28 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
            v29 = MEMORY[0x1E0C809B0];
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke;
            block[3] = &unk_1E16B1B50;
            v35 = v26;
            v36 = self;
            dispatch_after(v28, MEMORY[0x1E0C80D38], block);
            v33[0] = v29;
            v33[1] = 3221225472;
            v33[2] = __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke_2;
            v33[3] = &unk_1E16B1888;
            v33[4] = self;
            *(double *)&v33[5] = v24;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v33, 0, v24, 0.0);

LABEL_45:
            goto LABEL_46;
          }
          -[UIStatusBarForegroundView _reflowItemViewsWithDuration:preserveHistory:](self, "_reflowItemViewsWithDuration:preserveHistory:", 1, v24);
        }
        -[UIStatusBarForegroundView _cleanUpAfterDataChange](self, "_cleanUpAfterDataChange");
        goto LABEL_45;
      }
      if (self->_itemIsEnabled[39] && v32 != *itemIsEnabled)
      {
        +[UIStatusBarLockItemView lockSlideAnimationDuration](UIStatusBarLockItemView, "lockSlideAnimationDuration");
        v24 = v30;
        -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setViewToAnimateAlongside:", v26);
        objc_msgSend(v31, "setAlongsideViewIsBecomingVisible:", *itemIsEnabled);

        goto LABEL_37;
      }
    }
    v26 = 0;
    goto LABEL_37;
  }
LABEL_46:

}

uint64_t __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUseCustomFadeAnimation:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_cleanUpAfterDataChange");
}

uint64_t __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reflowItemViewsWithDuration:preserveHistory:", 1, *(double *)(a1 + 40));
}

- (void)setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  unint64_t v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  int v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  int v17;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *actionAnimationStack;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  UIStatusBarForegroundView *v37;
  id v38;
  int v39;
  BOOL v40;
  _QWORD v41[5];
  id v42;
  int v43;
  BOOL v44;
  _QWORD v45[5];
  BOOL v46;
  _QWORD v47[5];
  id v48;
  BOOL v49;
  _QWORD aBlock[5];
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = setStatusBarData_actions_animated____s_category;
  if (!setStatusBarData_actions_animated____s_category)
  {
    v10 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&setStatusBarData_actions_animated____s_category);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v32 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v9;
      _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Received data: %@", buf, 0xCu);
    }
  }
  if (-[UIStatusBarForegroundView ignoringData](self, "ignoringData"))
  {
    objc_storeStrong((id *)&self->_pendedData, a3);
    self->_pendedActions |= a4;
    goto LABEL_30;
  }
  if (self->_actionAnimationStack)
  {
    if ((a4 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  actionAnimationStack = self->_actionAnimationStack;
  self->_actionAnimationStack = v28;

  if ((a4 & 0x80) != 0)
  {
LABEL_8:
    a4 &= 0xFFFFFF3F;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v11 = _Block_copy(aBlock);
    v12 = self->_actionAnimationStack;
    v13 = _Block_copy(v11);
    -[NSMutableArray addObject:](v12, "addObject:", v13);

  }
LABEL_9:
  v14 = objc_msgSend(v9, "isItemEnabled:", 2);
  v15 = 0;
  v16 = a4 & 0xFFFFFFCF;
  if ((a4 & 0x10) != 0)
  {
    v17 = v14;
    if (self->_itemIsEnabled[2] != v14 && v5)
    {
      if (!self->_actionAnimationStack)
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v20 = self->_actionAnimationStack;
        self->_actionAnimationStack = v19;

      }
      if ((v17 & 1) == 0)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_3;
        v47[3] = &unk_1E16B4008;
        v47[4] = self;
        v48 = v9;
        v49 = v5;
        v21 = _Block_copy(v47);
        v22 = self->_actionAnimationStack;
        v23 = _Block_copy(v21);
        -[NSMutableArray addObject:](v22, "addObject:", v23);

      }
      v24 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_4;
      v45[3] = &unk_1E16B1B78;
      v45[4] = self;
      v46 = v5;
      v25 = _Block_copy(v45);
      v26 = self->_actionAnimationStack;
      v27 = _Block_copy(v25);
      -[NSMutableArray addObject:](v26, "addObject:", v27);

      if (v17)
      {
        v41[0] = v24;
        v41[1] = 3221225472;
        v41[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_6;
        v41[3] = &unk_1E16D4070;
        v41[4] = self;
        v42 = v9;
        v43 = v16;
        v44 = v5;
        v15 = (void (**)(_QWORD))_Block_copy(v41);

      }
      else
      {
        v30 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v30, "setItem:enabled:", 2, 1);
        v33 = v24;
        v34 = 3221225472;
        v35 = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_7;
        v36 = &unk_1E16D4070;
        v37 = self;
        v38 = v30;
        v39 = v16;
        v40 = v5;
        v31 = v30;
        v15 = (void (**)(_QWORD))_Block_copy(&v33);

      }
    }
  }
  if (-[NSMutableArray count](self->_actionAnimationStack, "count", v33, v34, v35, v36, v37))
  {
    -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData");
    if (v15)
      v15[2](v15);
    -[UIStatusBarForegroundView stopIgnoringData:](self, "stopIgnoringData:", v5);
  }
  else
  {
    -[UIStatusBarForegroundView _setStatusBarData:actions:animated:](self, "_setStatusBarData:actions:animated:", v9, v16, v5);
  }

LABEL_30:
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "startIgnoringData");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_2;
  v4[3] = &unk_1E16B1B28;
  v4[4] = v2;
  return objc_msgSend(v2, "_animateUnlockCompletionBlock:", v4);
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopIgnoringData:", 1);
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusBarData:actions:animated:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48));
}

void __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD v4[5];
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "startIgnoringData");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", 0x1E176A440, *(_QWORD *)(a1 + 32), 0);

  v3 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_5;
  v4[3] = &unk_1E16B1B78;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopIgnoringData:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusBarData:actions:animated:", *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48) | 0x20u, *(unsigned __int8 *)(a1 + 52));
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusBarData:actions:animated:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52));
}

- (void)reflowItemViewsCrossfadingCenter:(id)a3 duration:(double)a4
{
  id v6;
  uint64_t v7;
  BOOL *itemIsEnabled;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = 0;
  itemIsEnabled = self->_itemIsEnabled;
  v9 = self->_itemIsEnabled[0];
  v10 = self->_itemIsEnabled[39];
  do
  {
    itemIsEnabled[v7] = objc_msgSend(v6, "isItemEnabled:", v7);
    ++v7;
  }
  while (v7 != 52);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__UIStatusBarForegroundView_reflowItemViewsCrossfadingCenter_duration___block_invoke;
  v16[3] = &unk_1E16B9698;
  v18 = &v19;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
  if (a4 > 0.0 && v10 && self->_itemIsEnabled[39] && v9 != *itemIsEnabled)
  {
    +[UIStatusBarLockItemView lockSlideAnimationDuration](UIStatusBarLockItemView, "lockSlideAnimationDuration");
    if (v12 > a4)
    {
      +[UIStatusBarLockItemView lockSlideAnimationDuration](UIStatusBarLockItemView, "lockSlideAnimationDuration");
      a4 = v13;
    }
    -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setViewToAnimateAlongside:", v15);
    objc_msgSend(v14, "setAlongsideViewIsBecomingVisible:", *itemIsEnabled);

  }
  if (*((_BYTE *)v20 + 24))
    -[UIStatusBarForegroundView _reflowItemViewsCrossfadingCenterWithDuration:timeWasEnabled:](self, "_reflowItemViewsCrossfadingCenterWithDuration:timeWasEnabled:", v9, a4);

  _Block_object_dispose(&v19, 8);
}

uint64_t __71__UIStatusBarForegroundView_reflowItemViewsCrossfadingCenter_duration___block_invoke(_QWORD *a1)
{
  uint64_t i;
  uint64_t j;
  uint64_t result;

  for (i = 0; i != 24; i += 8)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= objc_msgSend(*(id *)(a1[4] + 472 + i), "prepareEnabledItems:withData:actions:", a1[4] + 417, a1[5], 0);
  for (j = 0; j != 24; j += 8)
  {
    result = objc_msgSend(*(id *)(a1[4] + 472 + j), "updateItemsWithData:actions:animated:", a1[5], 0, 0);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= result;
  }
  return result;
}

- (void)_reflowItemViewsCrossfadingCenterWithDuration:(double)a3 timeWasEnabled:(BOOL)a4
{
  void *v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData", a4);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[UIStatusBarForegroundView _computeVisibleItemsPreservingHistory:](self, "_computeVisibleItemsPreservingHistory:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke;
  v7[3] = &unk_1E16E2E10;
  v7[4] = self;
  v7[5] = &v8;
  *(double *)&v7[6] = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (!*((_BYTE *)v9 + 24))
    -[UIStatusBarForegroundView _cleanUpAfterDataChange](self, "_cleanUpAfterDataChange");

  _Block_object_dispose(&v8, 8);
}

void __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  void *v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;

  v5 = a3;
  v6 = objc_msgSend(a2, "intValue");
  if (v6 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 488);
    objc_msgSend(v7, "itemViewOfType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUseCustomFadeAnimation:", 1);
    v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_2;
    block[3] = &unk_1E16B1B50;
    v11 = *(_QWORD *)(a1 + 32);
    v23 = v8;
    v24 = v11;
    v12 = v8;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    v13 = *(double *)(a1 + 48);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_3;
    v18[3] = &unk_1E16B1C28;
    v19 = v7;
    v20 = v5;
    v21 = *(_QWORD *)(a1 + 48);
    v14 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v18, 0, v13, 0.0);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_4;
    v15[3] = &unk_1E16B5C50;
    v15[4] = *(_QWORD *)(a1 + 32);
    v17 = v6;
    v16 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

  }
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUseCustomFadeAnimation:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_cleanUpAfterDataChange");
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reflowWithVisibleItems:duration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472 + 8 * *(int *)(a1 + 48)), "reflowWithVisibleItems:duration:", *(_QWORD *)(a1 + 40), 0.0);
}

- (void)reflowItemViews:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[6];
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke;
  v5[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  v5[4] = 0;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_2;
  v4[3] = &unk_1E16B1888;
  v4[4] = self;
  v4[5] = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_3;
  v3[3] = &unk_1E16B3FD8;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", 0, v5, v4, v3);
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), 0.0);
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reflowItemViewsWithDuration:preserveHistory:", 1, *(double *)(a1 + 40));
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpAfterSimpleReflow");
}

- (void)reflowItemViewsForgettingEitherSideItemHistory
{
  -[UIStatusBarForegroundView _reflowItemViewsWithDuration:preserveHistory:](self, "_reflowItemViewsWithDuration:preserveHistory:", 0, 0.0);
  -[UIStatusBarForegroundView _cleanUpAfterSimpleReflow](self, "_cleanUpAfterSimpleReflow");
}

- (void)startIgnoringData
{
  ++self->_ignoreDataLevel;
}

- (void)stopIgnoringData:(BOOL)a3
{
  _BOOL8 v3;
  int ignoreDataLevel;
  int v6;
  void (**v7)(void);
  UIStatusBarComposedData *pendedData;
  uint64_t pendedActions;
  void *v11;
  UIStatusBarComposedData *v12;

  v3 = a3;
  ignoreDataLevel = self->_ignoreDataLevel;
  if (ignoreDataLevel <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStatusBarForegroundView.m"), 446, CFSTR("Stopped ignoring data more times than started"));

    ignoreDataLevel = self->_ignoreDataLevel;
  }
  v6 = ignoreDataLevel - 1;
  self->_ignoreDataLevel = v6;
  if (!v6)
  {
    if (-[NSMutableArray count](self->_actionAnimationStack, "count"))
    {
      -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData");
      -[NSMutableArray lastObject](self->_actionAnimationStack, "lastObject");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

      -[NSMutableArray removeLastObject](self->_actionAnimationStack, "removeLastObject");
      -[UIStatusBarForegroundView stopIgnoringData:](self, "stopIgnoringData:", v3);
    }
    else
    {
      pendedData = self->_pendedData;
      if (pendedData)
      {
        pendedActions = self->_pendedActions;
        self->_pendedData = 0;
        v12 = pendedData;

        self->_pendedActions = 0;
        -[UIStatusBarForegroundView setStatusBarData:actions:animated:](self, "setStatusBarData:actions:animated:", v12, pendedActions, v3);

      }
    }
  }
}

- (BOOL)ignoringData
{
  return self->_ignoreDataLevel > 0;
}

- (void)_cleanUpAfterSimpleReflow
{
  uint64_t v2;
  UIStatusBarLayoutManager **layoutManagers;

  v2 = 0;
  layoutManagers = self->_layoutManagers;
  do
    -[UIStatusBarLayoutManager positionInvisibleItems](layoutManagers[v2++], "positionInvisibleItems");
  while (v2 != 3);
}

- (void)_cleanUpAfterDataChange
{
  uint64_t v3;
  UIStatusBarLayoutManager **layoutManagers;
  BOOL *itemIsEnabled;

  v3 = 0;
  layoutManagers = self->_layoutManagers;
  itemIsEnabled = self->_itemIsEnabled;
  do
  {
    -[UIStatusBarLayoutManager removeDisabledItems:](layoutManagers[v3], "removeDisabledItems:", itemIsEnabled);
    -[UIStatusBarLayoutManager positionInvisibleItems](layoutManagers[v3], "positionInvisibleItems");
    -[UIStatusBarLayoutManager makeVisibleItemsPerformPendedActions](layoutManagers[v3++], "makeVisibleItemsPerformPendedActions");
  }
  while (v3 != 3);
  -[UIStatusBarForegroundView stopIgnoringData:](self, "stopIgnoringData:", 1);
}

- (void)_reflowItemViewsWithDuration:(double)a3 preserveHistory:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  _QWORD v9[6];

  v4 = a4;
  -[UIView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIStatusBarForegroundView _computeVisibleItemsPreservingHistory:](self, "_computeVisibleItemsPreservingHistory:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__UIStatusBarForegroundView__reflowItemViewsWithDuration_preserveHistory___block_invoke;
    v9[3] = &unk_1E16D4988;
    v9[4] = self;
    *(double *)&v9[5] = a3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __74__UIStatusBarForegroundView__reflowItemViewsWithDuration_preserveHistory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472 + 8 * (int)objc_msgSend(a2, "intValue")), "reflowWithVisibleItems:duration:", v5, *(double *)(a1 + 40));

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarForegroundView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIStatusBarForegroundView reflowItemViews:](self, "reflowItemViews:", 0);
}

- (id)_computeVisibleItemsPreservingHistory:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  unint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  UIStatusBarLayoutManager **layoutManagers;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL4 usesVerticalLayout;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double MinY;
  double v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double MaxY;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  UIStatusBarLayoutManager *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  int v113;
  uint64_t m;
  uint64_t v115;
  id v116;
  UIStatusBarLayoutManager *v117;
  double *v118;
  UIStatusBarForegroundView *v119;
  void *v120;
  int64_t v121;
  char v122;
  BOOL v123;
  BOOL v124;
  char v125;
  char v126;
  BOOL v127;
  char v128;
  id v129;
  id v130;
  void *v131;
  unsigned int v132;
  void *v133;
  unsigned int v134;
  _BOOL4 v135;
  char v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  BOOL v140;
  uint64_t v141;
  UIStatusBarLayoutManager *v142;
  id v143;
  char v144;
  void *v145;
  uint64_t n;
  uint64_t v147;
  void *v148;
  uint64_t ii;
  void *context;
  void *v153;
  id obj;
  id obja;
  id objb;
  uint64_t v158;
  unint64_t v159;
  _BOOL4 v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  id v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[3];
  _DWORD v181[2];
  _BYTE v182[128];
  double v183;
  double v184;
  double v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  id v189;
  id v190;
  uint64_t v191;
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x186DC9484](self, a2);
  v3 = 0;
  v189 = 0;
  v190 = 0;
  v191 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(&v189 + v3);
    *(&v189 + v3) = v4;

    v180[v3++] = 0;
  }
  while (v3 != 3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 52; ++i)
  {
    if (self->_itemIsEnabled[i])
    {
      +[UIStatusBarItem itemWithType:idiom:](UIStatusBarItem, "itemWithType:idiom:", i, -[UIStatusBarForegroundView idiom](self, "idiom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "appearsOnLeft")
        || (v9 = objc_msgSend(v8, "appearsOnRight"), v10 = (void *)v6, (v9 & 1) == 0))
      {
        v11 = 0;
        while (!objc_msgSend(v8, "appearsInRegion:", v11))
        {
          if ((_DWORD)++v11 == 3)
            goto LABEL_13;
        }
        v10 = *(&v189 + v11);
      }
      objc_msgSend(v10, "addObject:", v8);
LABEL_13:

    }
  }
  v12 = 0;
  v13 = 0;
  v153 = (void *)v6;
  do
  {
    v14 = v13;
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    obj = *(&v189 + v12);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v188, 16);
    v158 = v12;
    if (!v15)
    {
      v18 = 0;
      v17 = 0;
LABEL_36:

      v13 = v14;
LABEL_37:
      if (objc_msgSend(v17, "count"))
      {
        obja = v13;
        v28 = *(&v189 + v12);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v28, "count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = 0u;
        v171 = 0u;
        v172 = 0u;
        v173 = 0u;
        v30 = v28;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v170, v187, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v171;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v171 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v35, "type"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v17, "containsObject:", v36);

              if (v37)
                objc_msgSend(v29, "addObject:", v35);
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v170, v187, 16);
          }
          while (v32);
        }

        v12 = v158;
        *(&v189 + v158) = v29;

        v23 = 0;
        v13 = obja;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_52;
    }
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v177;
LABEL_18:
    v20 = 0;
    v21 = v17;
    v22 = v18;
    while (1)
    {
      if (*(_QWORD *)v177 != v19)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v20);
      v24 = (void *)objc_opt_class();
      v25 = objc_msgSend(v23, "type");
      v174 = v21;
      v175 = v22;
      LODWORD(v24) = objc_msgSend(v24, "isItemWithTypeExclusive:outBlacklistItems:outWhitelistItems:", v25, &v175, &v174);
      v18 = v175;

      v17 = v174;
      if ((_DWORD)v24)
        break;
      v12 = v158;
      if (v158 == 2 && objc_msgSend(v23, "type") == 39)
      {
        -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isExclusive"))
        {
          v40 = v23;

          goto LABEL_49;
        }
      }
      else
      {
        if (objc_msgSend(v17, "count"))
          goto LABEL_36;
        if (!objc_msgSend(v18, "count"))
          goto LABEL_32;
        v27 = v14;
        if (!v14)
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
        objc_msgSend(v18, "allObjects");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v27;
        objc_msgSend(v27, "addObjectsFromArray:", v26);
      }

LABEL_32:
      ++v20;
      v21 = v17;
      v22 = v18;
      if (v16 == v20)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v188, 16);
        v12 = v158;
        if (v16)
          goto LABEL_18;
        goto LABEL_36;
      }
    }
    v38 = v23;
    v12 = v158;
LABEL_49:

    v13 = v14;
    if (!v23)
      goto LABEL_37;
    v39 = *(&v189 + v12);
    objc_msgSend(v39, "removeAllObjects");
    objc_msgSend(v39, "addObject:", v23);
    v180[v12] = 1;
LABEL_52:

    ++v12;
  }
  while (v12 != 3);
  if (objc_msgSend(v13, "count"))
  {
    v41 = 0;
    do
    {
      v159 = v41;
      v42 = *(&v189 + v41);
      v43 = (void *)objc_msgSend(v42, "mutableCopy");
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v44 = v42;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v166, v186, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v167;
        v48 = 1;
        while (2)
        {
          for (k = 0; k != v46; ++k)
          {
            if (*(_QWORD *)v167 != v47)
              objc_enumerationMutation(v44);
            if (!v48)
            {
              v48 = 0;
              goto LABEL_69;
            }
            v50 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v50, "type"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v13;
            v53 = objc_msgSend(v13, "containsObject:", v51);

            if (v53)
            {
              objc_msgSend(v43, "removeObject:", v50);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v50, "type"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "removeObject:", v54);

              v48 = objc_msgSend(v52, "count") != 0;
            }
            else
            {
              v48 = 1;
            }
            v13 = v52;
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v166, v186, 16);
          if (v46)
            continue;
          break;
        }
      }
      else
      {
        v48 = 1;
      }
LABEL_69:

      v55 = *(&v189 + v159);
      *(&v189 + v159) = v43;

      if (v159 > 1)
        break;
      v41 = v159 + 1;
    }
    while (v48);
  }
  layoutManagers = self->_layoutManagers;
  -[UIStatusBarLayoutManager rectForItems:](self->_layoutManagers[2], "rectForItems:", v191);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  usesVerticalLayout = self->_usesVerticalLayout;
  -[UIView bounds](self, "bounds");
  if (usesVerticalLayout)
    v68 = v67;
  else
    v68 = v66;
  v69 = v58;
  v70 = v60;
  v71 = v62;
  v72 = v64;
  if (self->_usesVerticalLayout)
    MinY = CGRectGetMinY(*(CGRect *)&v69);
  else
    MinY = CGRectGetMinX(*(CGRect *)&v69);
  v74 = MinY;
  v75 = 0x1E0CB3000uLL;
  objb = v13;
  v76 = v58;
  v77 = v60;
  v78 = v62;
  v79 = v64;
  if (self->_usesVerticalLayout)
    MaxY = CGRectGetMaxY(*(CGRect *)&v76);
  else
    MaxY = CGRectGetMaxX(*(CGRect *)&v76);
  v81 = MaxY;
  v185 = 0.0;
  -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leftEdgePadding");
  v84 = v83;

  -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rightEdgePadding");
  v87 = v86;

  -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "middlePadding");
  v90 = v89;

  v183 = v74 - v84 - v90 + 1.0;
  v184 = v68 - v81 - v87 - v90 + 1.0;
  if (self->_usesVerticalLayout)
  {
    -[UIStatusBarLayoutManager sizeNeededForItems:](*layoutManagers, "sizeNeededForItems:", v189);
    v92 = v91;
    -[UIStatusBarLayoutManager sizeNeededForItems:](self->_layoutManagers[1], "sizeNeededForItems:", v190);
    v185 = v68 - v92 - v93 - (v90 + v90);
    v94 = (v92 + v68 - v93) * 0.5;
    v95 = self->_layoutManagers[2];
    *(float *)&v94 = v94;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarLayoutManager setAssignedStartPosition:](v95, "setAssignedStartPosition:", v96);

  }
  v97 = 0;
  while (2)
  {
    if (v97 == 2)
    {
      if (!self->_usesVerticalLayout)
        break;
LABEL_87:
      v98 = *(&v189 + v97);
      -[UIStatusBarLayoutManager clearOverlapFromItems:](layoutManagers[v97], "clearOverlapFromItems:", v98);
      -[UIStatusBarLayoutManager sizeNeededForItems:](layoutManagers[v97], "sizeNeededForItems:", v98);
      v100 = *(&v183 + v97) - v99;
      *(&v183 + v97) = v100;
      if (v100 < 0.0)
      {
        -[UIStatusBarLayoutManager distributeOverlap:amongItems:](layoutManagers[v97], "distributeOverlap:amongItems:", v98, -v100);
        *(&v183 + v97) = v101 + *(&v183 + v97);
      }
      objc_msgSend(v98, "sortUsingSelector:", sel_comparePriority_);
      while (1)
      {
        v102 = *(&v183 + v97);
        if (v102 >= 0.0)
          break;
        if (!objc_msgSend(v98, "count"))
        {
          v102 = *(&v183 + v97);
          break;
        }
        objc_msgSend(v98, "objectAtIndex:", 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStatusBarLayoutManager sizeNeededForItem:](layoutManagers[v97], "sizeNeededForItem:", v103);
        *(&v183 + v97) = v104 + *(&v183 + v97);
        objc_msgSend(v98, "removeObjectAtIndex:", 0);

      }
      if (v102 > 0.0)
      {
        -[UIStatusBarLayoutManager removeOverlap:fromItems:](layoutManagers[v97], "removeOverlap:fromItems:", v98);
        *(&v183 + v97) = *(&v183 + v97) - v105;
      }
    }
    else if (!self->_usesVerticalLayout)
    {
      goto LABEL_87;
    }
    if (++v97 != 3)
      continue;
    break;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v106;
  if (a3)
  {
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v108 = v153;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v182, 16);
    if (!v109)
      goto LABEL_113;
    v110 = v109;
    v111 = *(_QWORD *)v163;
    v112 = v180[0];
    v113 = v180[1];
    while (1)
    {
      for (m = 0; m != v110; ++m)
      {
        if (*(_QWORD *)v163 != v111)
          objc_enumerationMutation(v108);
        v115 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * m);
        if (!v112
          && -[UIStatusBarLayoutManager itemIsVisible:](*layoutManagers, "itemIsVisible:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * m)))
        {
          v116 = v189;
          v117 = *layoutManagers;
          v118 = &v183;
          v119 = self;
          goto LABEL_109;
        }
        if (!v113 && -[UIStatusBarLayoutManager itemIsVisible:](self->_layoutManagers[1], "itemIsVisible:", v115))
        {
          v116 = v190;
          v117 = self->_layoutManagers[1];
          v119 = self;
          v118 = &v184;
LABEL_109:
          if (-[UIStatusBarForegroundView _tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:](v119, "_tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:", v115, v116, v117, v118, 0, 0))
          {
            continue;
          }
        }
        objc_msgSend(v107, "addObject:", v115);
      }
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v182, 16);
      if (!v110)
      {
LABEL_113:

        v75 = 0x1E0CB3000;
        goto LABEL_115;
      }
    }
  }
  objc_msgSend(v106, "addObjectsFromArray:", v153);
LABEL_115:
  objc_msgSend(v107, "sortUsingSelector:", sel_comparePriority_);
  if (objc_msgSend(v107, "count"))
  {
    while (2)
    {
      objc_msgSend(v107, "lastObject");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "removeLastObject");
      v121 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
      v122 = 0;
      v123 = v121 != 0;
      v124 = v121 == 0;
      v125 = 1;
      do
      {
        while (1)
        {
          v126 = v125;
          if (!v180[v123])
            break;
          v125 = 0;
          v122 = 1;
          v123 = v124;
          if ((v126 & 1) == 0)
            goto LABEL_122;
        }
        v127 = -[UIStatusBarForegroundView _tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:](self, "_tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:", v120, *(&v189 + v123), layoutManagers[v123], &v183 + v123, 0, 0);
        v125 = 0;
        v128 = v122 | v127;
        v122 = 1;
        v123 = v124;
      }
      while ((v128 & 1) == 0);
      if (v127)
        goto LABEL_133;
LABEL_122:
      v129 = v189;
      if (!objc_msgSend(v189, "count") || (v130 = v190, !objc_msgSend(v190, "count")))
      {

        v145 = 0;
        goto LABEL_138;
      }
      objc_msgSend(v129, "objectAtIndex:", 0);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(v131, "priority");
      objc_msgSend(v130, "objectAtIndex:", 0);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend(v133, "priority");
      v160 = v132 < v134;
      v135 = v132 >= v134;

      v136 = 0;
      v137 = 0;
      v138 = 0;
      v181[0] = v135;
      v181[1] = v160;
      do
      {
        v139 = v181[v137];
        if (v180[v139])
        {
          v140 = 0;
        }
        else
        {
          v141 = (uint64_t)*(&v189 + v139);
          v142 = layoutManagers[v139];
          v161 = v138;
          v140 = -[UIStatusBarForegroundView _tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:](self, "_tryToPlaceItem:inItemArray:layoutManager:roomRemaining:allowSwap:swappedItem:", v120, v141, v142, &v183 + v139, 1, &v161);
          v143 = v161;

          v138 = v143;
        }
        v144 = v136 | v140;
        v136 = 1;
        v137 = 1;
      }
      while ((v144 & 1) == 0);
      if (v138 && objc_msgSend(v153, "containsObject:", v138))
      {
        objc_msgSend(v107, "addObject:", v138);
        objc_msgSend(v107, "sortUsingSelector:", sel_comparePriority_);
      }

      v75 = 0x1E0CB3000uLL;
LABEL_133:

      if (objc_msgSend(v107, "count"))
        continue;
      break;
    }
  }
  v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  for (n = 0; n != 3; ++n)
  {
    v147 = (uint64_t)*(&v189 + n);
    objc_msgSend(*(id *)(v75 + 2024), "numberWithInt:", n);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setObject:forKey:", v147, v148);

  }
LABEL_138:

  for (ii = 16; ii != -8; ii -= 8)
  objc_autoreleasePoolPop(context);
  return v145;
}

- (BOOL)_tryToPlaceItem:(id)a3 inItemArray:(id)a4 layoutManager:(id)a5 roomRemaining:(double *)a6 allowSwap:(BOOL)a7 swappedItem:(id *)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  BOOL v24;

  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(v15, "sizeNeededForItem:", v13);
  v17 = v16;
  if (v16 > *a6 && v9)
  {
    objc_msgSend(v14, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeNeededForItem:", v19);
    v21 = v20;
    v22 = objc_msgSend(v13, "priority");
    if (v22 <= objc_msgSend(v19, "priority") || (v23 = v21 + *a6, v17 > v23))
    {

      goto LABEL_11;
    }
    *a6 = v23;
    objc_msgSend(v14, "removeObjectAtIndex:", 0);
    if (a8)
      *a8 = objc_retainAutorelease(v19);

LABEL_15:
    objc_msgSend(v14, "addObject:", v13);
    objc_msgSend(v14, "sortUsingSelector:", sel_comparePriority_);
    *a6 = *a6 - v17;
    v24 = 1;
    goto LABEL_16;
  }
  if (v16 <= *a6)
    goto LABEL_15;
LABEL_11:
  v24 = 0;
LABEL_16:

  return v24;
}

- (BOOL)isShowingBreadcrumb
{
  return self->_itemIsEnabled[50];
}

- (double)leftEdgePadding
{
  void *v2;
  double v3;
  double v4;

  -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftEdgePadding");
  v4 = v3;

  return v4;
}

- (double)rightEdgePadding
{
  void *v2;
  double v3;
  double v4;

  -[UIStatusBarForegroundView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightEdgePadding");
  v4 = v3;

  return v4;
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  UIStatusBarLayoutManager **layoutManagers;

  v3 = a3;
  v4 = 0;
  layoutManagers = self->_layoutManagers;
  do
    -[UIStatusBarLayoutManager setPersistentAnimationsEnabled:](layoutManagers[v4++], "setPersistentAnimationsEnabled:", v3);
  while (v4 != 3);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 usesVerticalLayout;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  usesVerticalLayout = self->_usesVerticalLayout;
  -[UIView frame](self, "frame");
  if (usesVerticalLayout)
    v11 = v10;
  else
    v11 = v9;
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarForegroundView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (self->_usesVerticalLayout)
    v12 = height;
  else
    v12 = width;
  if (v11 != v12)
    -[UIStatusBarForegroundView reflowItemViews:](self, "reflowItemViews:", 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 usesVerticalLayout;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  usesVerticalLayout = self->_usesVerticalLayout;
  -[UIView bounds](self, "bounds");
  if (usesVerticalLayout)
    v11 = v10;
  else
    v11 = v9;
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarForegroundView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (self->_usesVerticalLayout)
    v12 = height;
  else
    v12 = width;
  if (v11 != v12)
    -[UIStatusBarForegroundView reflowItemViews:](self, "reflowItemViews:", 0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UIStatusBarForegroundView;
  if (-[UIView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
          if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v8 = 1;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_13:

  }
  return v8;
}

- (void)_animateUnlockCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_block_t block;

  block = a3;
  -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v4, "animateUnlockForegroundView:timeItemSnapshot:completionBlock:", self, v6, block);

  }
  else if (block)
  {
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)animateUnlock
{
  void *v3;
  _QWORD v4[5];

  -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[UIStatusBarForegroundView ignoringData](self, "ignoringData"))
    {
      self->_pendedActions |= 0x80u;
    }
    else
    {
      -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData");
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __42__UIStatusBarForegroundView_animateUnlock__block_invoke;
      v4[3] = &unk_1E16B1B28;
      v4[4] = self;
      -[UIStatusBarForegroundView _animateUnlockCompletionBlock:](self, "_animateUnlockCompletionBlock:", v4);
    }
  }

}

uint64_t __42__UIStatusBarForegroundView_animateUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopIgnoringData:", 1);
}

- (void)jiggleLockIcon
{
  void *v3;
  _QWORD v4[5];

  -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[UIStatusBarForegroundView ignoringData](self, "ignoringData"))
  {
    -[UIStatusBarForegroundView startIgnoringData](self, "startIgnoringData");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__UIStatusBarForegroundView_jiggleLockIcon__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    objc_msgSend(v3, "jiggleCompletionBlock:", v4);
  }

}

uint64_t __43__UIStatusBarForegroundView_jiggleLockIcon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopIgnoringData:", 1);
}

- (CGRect)frameForItemOfType:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  UIStatusBarLayoutManager **layoutManagers;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v3 = *(_QWORD *)&a3;
  v5 = 0;
  layoutManagers = self->_layoutManagers;
  while (1)
  {
    -[UIStatusBarLayoutManager itemViewOfType:](layoutManagers[v5], "itemViewOfType:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      break;
    if (++v5 == 3)
    {
      v9 = *MEMORY[0x1E0C9D648];
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "bounds");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v8);
  v9 = v13;
  v10 = v14;
  v11 = v15;
  v12 = v16;
LABEL_6:

  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForAllItemsInRegion:(int)a3
{
  void *v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;

  v31 = *MEMORY[0x1E0C80C00];
  -[UIStatusBarLayoutManager allItemViews](self->_layoutManagers[a3], "allItemViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "bounds");
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v37.origin.x = v14;
        v37.origin.y = v15;
        v37.size.width = v16;
        v37.size.height = v17;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v33 = CGRectUnion(v32, v37);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
      }
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectStandardize(v34);
  v18 = v35.origin.x;
  v19 = v35.origin.y;
  v20 = v35.size.width;
  v21 = v35.size.height;

  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)rectIntersectsTimeItem:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  BOOL v13;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIStatusBarLayoutManager itemViewOfType:](self->_layoutManagers[2], "itemViewOfType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "frame");
    v16.origin.x = v9;
    v16.origin.y = v10;
    v16.size.width = v11;
    v16.size.height = v12;
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v13 = CGRectIntersectsRect(v15, v16);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)rectIntersectsBatteryItem:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIStatusBarForegroundView frameForItemOfType:](self, "frameForItemOfType:", 12);
  v13.origin.x = v7;
  v13.origin.y = v8;
  v13.size.width = v9;
  v13.size.height = v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectIntersectsRect(v12, v13);
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiom = a3;
}

- (UIStatusBarForegroundStyleAttributes)foregroundStyle
{
  return self->_foregroundStyle;
}

- (void).cxx_destruct
{
  UIStatusBarLayoutManager **layoutManagers;
  uint64_t i;

  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_pendedData, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_actionAnimationStack, 0);
  layoutManagers = self->_layoutManagers;
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&layoutManagers[i], 0);
}

@end
