@implementation UIInterfaceActionSelectionTrackingController

- (UIInterfaceActionSelectionTrackingController)initWithTrackableContainerView:(id)a3 actionsScrollView:(id)a4
{
  id v6;
  id v7;
  UIInterfaceActionSelectionTrackingController *v8;
  UIInterfaceActionSelectionTrackingController *v9;
  uint64_t v10;
  NSMutableSet *viewsRequiringSelectionGestureDisabling;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionSelectionTrackingController;
  v8 = -[UIInterfaceActionSelectionTrackingController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_trackableContainerView, v6);
    -[UIInterfaceActionSelectionTrackingController _initializeSelectionGestureRecognizer](v9, "_initializeSelectionGestureRecognizer");
    objc_storeWeak((id *)&v9->_actionsScrollView, v7);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    viewsRequiringSelectionGestureDisabling = v9->_viewsRequiringSelectionGestureDisabling;
    v9->_viewsRequiringSelectionGestureDisabling = (NSMutableSet *)v10;

    -[UIInterfaceActionSelectionTrackingController _registerForScrollViewNotifications](v9, "_registerForScrollViewNotifications");
    v9->_scrubbingEnabled = 1;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInterfaceActionSelectionTrackingController _unregisterForScrollViewNotifications](self, "_unregisterForScrollViewNotifications");
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionSelectionTrackingController;
  -[UIInterfaceActionSelectionTrackingController dealloc](&v3, sel_dealloc);
}

- (void)setCooperatingSelectionTrackingControllers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addPointer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[UIInterfaceActionSelectionTrackingController setWeakCooperatingSelectionTrackingControllers:](self, "setWeakCooperatingSelectionTrackingControllers:", v5);
}

- (void)setWeakCooperatingSelectionTrackingControllers:(id)a3
{
  objc_storeStrong((id *)&self->_weakCooperatingSelectionTrackingControllers, a3);
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  UILongPressGestureRecognizer *selectionGestureRecognizer;
  void *v5;
  _UIInterfaceActionSelectionDelayGestureRecognizer *selectionDelayGestureRecognizer;
  _UIInterfaceActionSelectionDelayGestureRecognizer *v7;
  _UIInterfaceActionSelectionDelayGestureRecognizer *v8;
  id v9;

  if (self->_scrubbingEnabled != a3)
  {
    self->_scrubbingEnabled = a3;
    selectionGestureRecognizer = self->_selectionGestureRecognizer;
    if (a3)
    {
      -[UILongPressGestureRecognizer setAllowableMovement:](selectionGestureRecognizer, "setAllowableMovement:", 1.79769313e308);
      -[UILongPressGestureRecognizer setCancelPastAllowableMovement:](self->_selectionGestureRecognizer, "setCancelPastAllowableMovement:", 0);
      -[UIGestureRecognizer view](self->_selectionDelayGestureRecognizer, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeGestureRecognizer:", self->_selectionDelayGestureRecognizer);

      selectionDelayGestureRecognizer = self->_selectionDelayGestureRecognizer;
      self->_selectionDelayGestureRecognizer = 0;

    }
    else
    {
      -[UILongPressGestureRecognizer setAllowableMovement:](selectionGestureRecognizer, "setAllowableMovement:", 10.0);
      -[UILongPressGestureRecognizer setCancelPastAllowableMovement:](self->_selectionGestureRecognizer, "setCancelPastAllowableMovement:", 1);
      v7 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)objc_opt_new();
      v8 = self->_selectionDelayGestureRecognizer;
      self->_selectionDelayGestureRecognizer = v7;

      -[UIGestureRecognizer setDelegate:](self->_selectionDelayGestureRecognizer, "setDelegate:", self);
      -[UIGestureRecognizer setName:](self->_selectionDelayGestureRecognizer, "setName:", CFSTR("UIInterfaceAction.selectionDelay"));
      -[UIGestureRecognizer view](self->_selectionGestureRecognizer, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addGestureRecognizer:", self->_selectionDelayGestureRecognizer);

    }
  }
}

- (void)setSelectByPressGestureEnabled:(BOOL)a3
{
  _UIInterfaceActionSelectByPressGestureRecognizer *v4;
  _UIInterfaceActionSelectByPressGestureRecognizer *v5;

  if (self->_selectByPressGestureEnabled != a3)
  {
    self->_selectByPressGestureEnabled = a3;
    if (a3)
      v4 = -[_UIInterfaceActionSelectByPressGestureRecognizer initWithFocusedInterfaceActionPressDelegate:]([_UIInterfaceActionSelectByPressGestureRecognizer alloc], "initWithFocusedInterfaceActionPressDelegate:", self);
    else
      v4 = 0;
    v5 = v4;
    -[UIInterfaceActionSelectionTrackingController setSelectByPressGestureRecognizer:](self, "setSelectByPressGestureRecognizer:", v4);

  }
}

- (void)setSelectionFeedbackEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  UISelectionFeedbackGenerator *v6;
  void *v7;
  UISelectionFeedbackGenerator *v8;

  if (self->_selectionFeedbackEnabled != a3)
  {
    self->_selectionFeedbackEnabled = a3;
    if (a3)
    {
      +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration](_UISelectionFeedbackGeneratorConfiguration, "defaultConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("retarget"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = [UISelectionFeedbackGenerator alloc];
      -[UIInterfaceActionSelectionTrackingController trackableContainerView](self, "trackableContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIFeedbackGenerator initWithConfiguration:view:](v6, "initWithConfiguration:view:", v5, v7);

    }
    else
    {
      v8 = 0;
    }
    -[UIInterfaceActionSelectionTrackingController setSelectionRetargetFeedbackGenerator:](self, "setSelectionRetargetFeedbackGenerator:", v8);

  }
}

- (void)setSelectByIndirectPointerTouchEnabled:(BOOL)a3
{
  UILongPressGestureRecognizer *selectionGestureRecognizer;
  void *v4;

  if (self->_selectByIndirectPointerTouchEnabled != a3)
  {
    self->_selectByIndirectPointerTouchEnabled = a3;
    selectionGestureRecognizer = self->_selectionGestureRecognizer;
    if (a3)
      v4 = &unk_1E1A929F0;
    else
      v4 = &unk_1E1A929D8;
    -[UIGestureRecognizer setAllowedTouchTypes:](selectionGestureRecognizer, "setAllowedTouchTypes:", v4);
  }
}

- (void)setSelectByPressGestureRecognizer:(id)a3
{
  _UIInterfaceActionSelectByPressGestureRecognizer **p_selectByPressGestureRecognizer;
  id WeakRetained;
  _UIInterfaceActionSelectByPressGestureRecognizer *selectByPressGestureRecognizer;
  id v8;
  id v9;

  p_selectByPressGestureRecognizer = &self->_selectByPressGestureRecognizer;
  v9 = a3;
  if ((-[_UIInterfaceActionSelectByPressGestureRecognizer isEqual:](*p_selectByPressGestureRecognizer, "isEqual:") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_selectByPressGestureRecognizer);

    objc_storeStrong((id *)&self->_selectByPressGestureRecognizer, a3);
    selectByPressGestureRecognizer = self->_selectByPressGestureRecognizer;
    if (selectByPressGestureRecognizer)
    {
      -[UIGestureRecognizer setCancelsTouchesInView:](selectByPressGestureRecognizer, "setCancelsTouchesInView:", 0);
      v8 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
      objc_msgSend(v8, "addGestureRecognizer:", *p_selectByPressGestureRecognizer);

    }
  }

}

- (id)_interfaceActionOfFocusedRepresentationView
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIInterfaceActionSelectionTrackingController _allActionViewsIncludingCooperatingActionViews](self, "_allActionViewsIncludingCooperatingActionViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isFocused") & 1) != 0)
        {
          objc_msgSend(v6, "action");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  -[UIInterfaceActionSelectionTrackingController _setSystemProvidedGestureRecognizer:](self, "_setSystemProvidedGestureRecognizer:", v4);
  -[UIInterfaceActionSelectionTrackingController _handleActionSelectionGestureRecognizer:](self, "_handleActionSelectionGestureRecognizer:", v4);

}

- (void)_setSystemProvidedGestureRecognizer:(id)a3
{
  id v5;
  UIGestureRecognizer *systemProvidedGestureRecognizer;
  id *p_systemProvidedGestureRecognizer;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_systemProvidedGestureRecognizer = (id *)&self->_systemProvidedGestureRecognizer;
  systemProvidedGestureRecognizer = self->_systemProvidedGestureRecognizer;
  if (systemProvidedGestureRecognizer != v5)
  {
    if (systemProvidedGestureRecognizer)
      -[UIGestureRecognizer removeTarget:action:](systemProvidedGestureRecognizer, "removeTarget:action:", self, 0);
    objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, a3);
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[UIInterfaceActionSelectionTrackingController _allGestureRecognizers](self, "_allGestureRecognizers", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v13;
      while (1)
      {
        if (*(_QWORD *)v13 != v11)
          objc_enumerationMutation(v8);
        if (*p_systemProvidedGestureRecognizer != v5)
          objc_msgSend(v5, "setEnabled:", *p_systemProvidedGestureRecognizer == 0);
        if (!--v10)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (!v10)
            break;
        }
      }
    }

    if (*p_systemProvidedGestureRecognizer)
      objc_msgSend(*p_systemProvidedGestureRecognizer, "addTarget:action:", self, sel__handleSystemProvidedGestureRecognizer_);
  }

}

- (void)_clearSystemProvidedGestureRecognizer
{
  -[UIInterfaceActionSelectionTrackingController _setSystemProvidedGestureRecognizer:](self, "_setSystemProvidedGestureRecognizer:", 0);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "allowedTouchTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "type");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v6, "containsObject:", v9);

  return (char)v7;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIInterfaceActionSelectionDelayGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  UILongPressGestureRecognizer *v8;
  UILongPressGestureRecognizer *selectionGestureRecognizer;
  char v10;
  void *v11;
  void *v12;

  v6 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)a3;
  v7 = (UILongPressGestureRecognizer *)a4;
  v8 = v7;
  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  if (self->_selectionDelayGestureRecognizer == v6)
  {
    v10 = selectionGestureRecognizer != v7;
  }
  else if (selectionGestureRecognizer == (UILongPressGestureRecognizer *)v6)
  {
    -[UIGestureRecognizer view](v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterfaceActionSelectionTrackingController trackableContainerView](self, "trackableContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDescendantOfView:", v12) & 1) != 0)
      v10 = 1;
    else
      v10 = _UISheetInteractionGestureIsForInteractiveDismiss(v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UILongPressGestureRecognizer *v6;
  _UIInterfaceActionSelectionDelayGestureRecognizer *v7;
  _UIInterfaceActionSelectionDelayGestureRecognizer *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)a4;
  v8 = v7;
  if (self->_selectionGestureRecognizer != v6)
    goto LABEL_2;
  if (self->_selectionDelayGestureRecognizer == v7)
  {
LABEL_8:
    v9 = 1;
    goto LABEL_3;
  }
  if (-[UIGestureRecognizer _isGestureType:](v7, "_isGestureType:", 9))
  {
    -[UIGestureRecognizer view](v8, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterfaceActionSelectionTrackingController trackableContainerView](self, "trackableContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDescendantOfView:", v12) & 1) != 0)
    {
      -[UIGestureRecognizer view](v8, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInterfaceActionSelectionTrackingController actionsScrollView](self, "actionsScrollView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_8;
    }
    else
    {

    }
  }
LABEL_2:
  v9 = 0;
LABEL_3:

  return v9;
}

- (void)deselectAllActions
{
  id v2;

  -[UIInterfaceActionSelectionTrackingController _allActionViewsIncludingCooperatingActionViews](self, "_allActionViewsIncludingCooperatingActionViews");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_9);

}

uint64_t __66__UIInterfaceActionSelectionTrackingController_deselectAllActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHighlighted:", 0);
}

- (void)_rolloverActionChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (-[UIInterfaceActionSelectionTrackingController _isPresentedAndVisible](self, "_isPresentedAndVisible"))
  {
    if (objc_msgSend(v8, "state") == 3)
    {
      v4 = 0;
    }
    else
    {
      -[UIInterfaceActionSelectionTrackingController _actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:](self, "_actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIInterfaceActionSelectionTrackingController _allActionViewsIncludingCooperatingActionViews](self, "_allActionViewsIncludingCooperatingActionViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__UIInterfaceActionSelectionTrackingController__rolloverActionChanged___block_invoke;
    v9[3] = &unk_1E16B21A0;
    v10 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

    objc_msgSend(v6, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", objc_msgSend(v7, "isEnabled"));

  }
}

uint64_t __71__UIInterfaceActionSelectionTrackingController__rolloverActionChanged___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2)
    return objc_msgSend(a2, "setHighlighted:", 0);
  return result;
}

- (void)_handleActionSelectionGestureRecognizer:(id)a3
{
  UILongPressGestureRecognizer *v4;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void (**v25)(void *, _QWORD);
  id v26;
  void (**v27)(void *, _QWORD);
  uint64_t (**v28)(_QWORD);
  int v29;
  int v30;
  void *v31;
  int v32;
  char v33;
  void *v34;
  void *v35;
  _QWORD v36[7];
  _QWORD v37[5];
  _QWORD v38[5];
  id v39;
  _QWORD aBlock[4];
  id v41;
  UIInterfaceActionSelectionTrackingController *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v4 = (UILongPressGestureRecognizer *)a3;
  if (-[UIInterfaceActionSelectionTrackingController _isPresentedAndVisible](self, "_isPresentedAndVisible"))
  {
    if (!self->_scrubbingEnabled)
      goto LABEL_34;
    if (self->_selectionGestureRecognizer == v4)
      goto LABEL_34;
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionsScrollView);
    objc_msgSend(WeakRetained, "bounds");
    v7 = v6;
    v8 = objc_loadWeakRetained((id *)&self->_actionsScrollView);
    objc_msgSend(v8, "contentSize");
    v10 = v9;

    if (v7 >= v10)
    {
LABEL_34:
      if (-[UIInterfaceActionSelectionTrackingController _allowSelectionForCurrentGestureLocationWithGestureRecognizer:](self, "_allowSelectionForCurrentGestureLocationWithGestureRecognizer:", v4))
      {
        -[UIInterfaceActionSelectionTrackingController _actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:](self, "_actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v11, "action");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEnabled");
      v14 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
      objc_msgSend(v14, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredContentSizeCategory");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();

      v35 = v12;
      if (v16)
        v17 = !UIContentSizeCategoryIsAccessibilityCategory(v16);
      else
        v17 = 1;
      -[UIInterfaceActionSelectionTrackingController trackableContainerView](self, "trackableContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILongPressGestureRecognizer locationInView:](v4, "locationInView:", v18);
      v20 = v19;
      v22 = v21;

      v23 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke;
      aBlock[3] = &unk_1E16B21C8;
      v45 = v13;
      v24 = v11;
      v41 = v24;
      v42 = self;
      v43 = v20;
      v44 = v22;
      v25 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
      v38[0] = v23;
      v38[1] = 3221225472;
      v38[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_2;
      v38[3] = &unk_1E16B2218;
      v38[4] = self;
      v26 = v24;
      v39 = v26;
      v27 = (void (**)(void *, _QWORD))_Block_copy(v38);
      v37[0] = v23;
      v37[1] = 3221225472;
      v37[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_4;
      v37[3] = &unk_1E16B2268;
      v37[4] = self;
      v28 = (uint64_t (**)(_QWORD))_Block_copy(v37);
      v36[0] = v23;
      v36[1] = 3221225472;
      v36[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_6;
      v36[3] = &unk_1E16B2290;
      v36[4] = self;
      v36[5] = v20;
      v36[6] = v22;
      if (-[UIGestureRecognizer state](v4, "state") == UIGestureRecognizerStateBegan)
      {
        v25[2](v25, 0);
        goto LABEL_16;
      }
      if (-[UIGestureRecognizer state](v4, "state") == UIGestureRecognizerStateChanged)
      {
        v29 = v28[2](v28);
        v27[2](v27, 0);
        if ((v17 | v29) == 1)
        {
          v30 = 1;
          v25[2](v25, 1);
LABEL_17:
          v31 = v35;
LABEL_18:
          __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_6((uint64_t)v36, v30);
LABEL_19:

          goto LABEL_20;
        }
LABEL_16:
        v30 = 1;
        goto LABEL_17;
      }
      if (-[UIGestureRecognizer state](v4, "state") != UIGestureRecognizerStateEnded)
      {
        v31 = v35;
        if (-[UIGestureRecognizer state](v4, "state") != UIGestureRecognizerStateCancelled)
          goto LABEL_19;
        v27[2](v27, 1);
        -[UIInterfaceActionSelectionTrackingController _clearSystemProvidedGestureRecognizer](self, "_clearSystemProvidedGestureRecognizer");
        goto LABEL_31;
      }
      if (!v13)
      {
        v27[2](v27, 1);
        -[UIInterfaceActionSelectionTrackingController _clearSystemProvidedGestureRecognizer](self, "_clearSystemProvidedGestureRecognizer");
        v30 = 0;
        goto LABEL_17;
      }
      v32 = objc_msgSend(v26, "isHighlighted");
      v33 = v32;
      if (!v32 || self->_scrubbingEnabled)
      {
        v27[2](v27, 1);
        -[UIInterfaceActionSelectionTrackingController _clearSystemProvidedGestureRecognizer](self, "_clearSystemProvidedGestureRecognizer");
        v31 = v35;
        if ((v33 & 1) == 0)
        {
LABEL_31:
          v30 = 0;
          goto LABEL_18;
        }
      }
      else
      {
        -[UIInterfaceActionSelectionTrackingController _clearSystemProvidedGestureRecognizer](self, "_clearSystemProvidedGestureRecognizer");
        v31 = v35;
      }
      +[_UIStatistics alertButtonTapCount](_UIStatistics, "alertButtonTapCount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "incrementValueBy:", 1);

      -[UIInterfaceActionSelectionTrackingController _invokeHandlerForInterfaceAction:](self, "_invokeHandlerForInterfaceAction:", v31);
      goto LABEL_31;
    }
  }
LABEL_20:

}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke(uint64_t a1, int a2)
{
  char v4;
  id v5;

  if (*(_BYTE *)(a1 + 64))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
    objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
    if ((v4 & 1) == 0)
    {
      if (a2)
      {
        objc_msgSend(*(id *)(a1 + 40), "selectionRetargetFeedbackGenerator");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selectionChangedAtLocation:", *(double *)(a1 + 48), *(double *)(a1 + 56));

      }
    }
  }
}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "_allActionViewsIncludingCooperatingActionViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_3;
  v5[3] = &unk_1E16B21F0;
  v7 = a2;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40) || *(id *)(a1 + 32) != v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setHighlighted:", 0);
    v3 = v4;
  }

}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_allActionViewsIncludingCooperatingActionViews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_5;
  v4[3] = &unk_1E16B2240;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHighlighted");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isActive");
  if (a2)
  {
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "userInteractionStartedAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else if ((_DWORD)result)
  {
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "userInteractionEndedAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  return result;
}

- (BOOL)_isPresentedAndVisible
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  objc_msgSend(WeakRetained, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_invokeHandlerForInterfaceAction:(id)a3
{
  objc_msgSend(a3, "_invokeHandlerWithCompletionBlock:", &__block_literal_global_37);
}

- (BOOL)_allowSelectionForCurrentGestureLocationWithGestureRecognizer:(id)a3
{
  UIView **p_trackableContainerView;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint *p_actionSelectionInitialLocationInContainerView;
  double y;
  double x;

  p_trackableContainerView = &self->_trackableContainerView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_trackableContainerView);
  objc_msgSend(v5, "locationInView:", WeakRetained);
  v8 = v7;
  v10 = v9;

  x = self->_actionSelectionInitialLocationInContainerView.x;
  y = self->_actionSelectionInitialLocationInContainerView.y;
  p_actionSelectionInitialLocationInContainerView = &self->_actionSelectionInitialLocationInContainerView;
  if (x == *MEMORY[0x1E0C9D538] && y == *(double *)(MEMORY[0x1E0C9D538] + 8))
    return 1;
  if (sqrt((v8 - x) * (v8 - x) + (v10 - y) * (v10 - y)) > 15.0)
  {
    *p_actionSelectionInitialLocationInContainerView = *(CGPoint *)MEMORY[0x1E0C9D538];
    return 1;
  }
  return 0;
}

- (id)_actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __128__UIInterfaceActionSelectionTrackingController__actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer___block_invoke;
  v8[3] = &unk_1E16B22B8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[UIInterfaceActionSelectionTrackingController _performRecursivelyWithVisitedCooperatingControllers:block:](self, "_performRecursivelyWithVisitedCooperatingControllers:block:", 0, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __128__UIInterfaceActionSelectionTrackingController__actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "_actionViewAtCurrentLocationForGestureRecognizer:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)_actionViewAtCurrentLocationForGestureRecognizer:(id)a3
{
  id v4;
  UIView **p_trackableContainerView;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_trackableContainerView = &self->_trackableContainerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  objc_msgSend(v4, "locationInView:", WeakRetained);
  v8 = v7;
  v10 = v9;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = self->_representationViews;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "_containingScrollView", (_QWORD)v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17
          || (v18 = objc_loadWeakRetained((id *)p_trackableContainerView),
              objc_msgSend(v17, "convertPoint:fromView:", v18, v8, v10),
              v20 = v19,
              v22 = v21,
              v18,
              objc_msgSend(v17, "pointInside:withEvent:", 0, v20, v22)))
        {
          v23 = objc_loadWeakRetained((id *)p_trackableContainerView);
          objc_msgSend(v16, "convertPoint:fromView:", v23, v8, v10);
          v25 = v24;
          v27 = v26;

          if (objc_msgSend(v16, "pointInside:withEvent:", 0, v25, v27))
          {
            v28 = v16;

            goto LABEL_13;
          }
        }

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v13)
        continue;
      break;
    }
  }
  v28 = 0;
LABEL_13:

  return v28;
}

- (void)_initializeSelectionGestureRecognizer
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *selectionGestureRecognizer;
  id WeakRetained;
  UIHoverGestureRecognizer *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleActionSelectionGestureRecognizer_);
  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  self->_selectionGestureRecognizer = v3;

  -[UILongPressGestureRecognizer setAllowableMovement:](self->_selectionGestureRecognizer, "setAllowableMovement:", 1.79769313e308);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_selectionGestureRecognizer, "setMinimumPressDuration:", 0.0);
  -[UIGestureRecognizer setCancelsTouchesInView:](self->_selectionGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UIGestureRecognizer setDelegate:](self->_selectionGestureRecognizer, "setDelegate:", self);
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_selectionGestureRecognizer, "setAllowedTouchTypes:", &unk_1E1A929D8);
  -[UIGestureRecognizer setAllowedPressTypes:](self->_selectionGestureRecognizer, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
  -[UIGestureRecognizer setName:](self->_selectionGestureRecognizer, "setName:", CFSTR("UIInterfaceAction.selection"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_selectionGestureRecognizer);

  v6 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__rolloverActionChanged_);
  -[UIInterfaceActionSelectionTrackingController setHoverGestureRecognizer:](self, "setHoverGestureRecognizer:", v6);

  -[UIInterfaceActionSelectionTrackingController hoverGestureRecognizer](self, "hoverGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  v9 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  -[UIInterfaceActionSelectionTrackingController hoverGestureRecognizer](self, "hoverGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", v8);

}

- (void)_registerForScrollViewNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id scrollViewWillBeginDraggingNotificationToken;
  void *v8;
  id scrollViewDidEndDraggingNotificationToken;
  void *v10;
  id scrollViewDidEndDeceleratingNotificationToken;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke;
  v16[3] = &unk_1E16B22E0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewWillBeginDraggingNotification"), 0, v4, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  scrollViewWillBeginDraggingNotificationToken = self->_scrollViewWillBeginDraggingNotificationToken;
  self->_scrollViewWillBeginDraggingNotificationToken = v6;

  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_2;
  v14[3] = &unk_1E16B22E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewDidEndDraggingNotification"), 0, v4, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  scrollViewDidEndDraggingNotificationToken = self->_scrollViewDidEndDraggingNotificationToken;
  self->_scrollViewDidEndDraggingNotificationToken = v8;

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_3;
  v12[3] = &unk_1E16B22E0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewDidEndDeceleratingNotification"), 0, v4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  scrollViewDidEndDeceleratingNotificationToken = self->_scrollViewDidEndDeceleratingNotificationToken;
  self->_scrollViewDidEndDeceleratingNotificationToken = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_noteScrollView:isUserScrolling:", v4, 1);
}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v8, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_noteScrollView:isUserScrolling:", v7, 0);

  }
}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_noteScrollView:isUserScrolling:", v4, 0);
}

- (void)_unregisterForScrollViewNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_scrollViewWillBeginDraggingNotificationToken);
  objc_msgSend(v3, "removeObserver:", self->_scrollViewDidEndDraggingNotificationToken);
  objc_msgSend(v3, "removeObserver:", self->_scrollViewDidEndDeceleratingNotificationToken);

}

- (void)_noteScrollView:(id)a3 isUserScrolling:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableSet *viewsRequiringSelectionGestureDisabling;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[UIInterfaceActionSelectionTrackingController _shouldDisableSelectionTrackingIfScrollingScrollView:](self, "_shouldDisableSelectionTrackingIfScrollingScrollView:"))
  {
    viewsRequiringSelectionGestureDisabling = self->_viewsRequiringSelectionGestureDisabling;
    if (v4)
      -[NSMutableSet addObject:](viewsRequiringSelectionGestureDisabling, "addObject:", v7);
    else
      -[NSMutableSet removeObject:](viewsRequiringSelectionGestureDisabling, "removeObject:", v7);
    -[UIGestureRecognizer setEnabled:](self->_selectionGestureRecognizer, "setEnabled:", -[NSMutableSet count](self->_viewsRequiringSelectionGestureDisabling, "count") == 0);
  }

}

- (BOOL)_shouldDisableSelectionTrackingIfScrollingScrollView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionsScrollView);
  if (WeakRetained == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
    v7 = objc_msgSend(v6, "isDescendantOfView:", v4);

  }
  return v7;
}

- (void)_performRecursivelyWithVisitedCooperatingControllers:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, UIInterfaceActionSelectionTrackingController *, _BYTE *);
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, UIInterfaceActionSelectionTrackingController *, _BYTE *);
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23[8];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, UIInterfaceActionSelectionTrackingController *, _BYTE *))a4;
  if ((objc_msgSend(v6, "containsObject:", self) & 1) == 0)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", self);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23[0] = 0;
    v7[2](v7, self, v23);
    if (!*((_BYTE *)v21 + 24))
    {
      -[NSPointerArray compact](self->_weakCooperatingSelectionTrackingControllers, "compact");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = self->_weakCooperatingSelectionTrackingControllers;
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v17;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __107__UIInterfaceActionSelectionTrackingController__performRecursivelyWithVisitedCooperatingControllers_block___block_invoke;
          v13[3] = &unk_1E16B2308;
          v14 = v7;
          v15 = &v20;
          objc_msgSend(v12, "_performRecursivelyWithVisitedCooperatingControllers:block:", v6, v13);
          LOBYTE(v12) = *((_BYTE *)v21 + 24) == 0;

          if ((v12 & 1) == 0)
            break;
          if (v9 == ++v11)
          {
            v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v9)
              goto LABEL_7;
            break;
          }
        }
      }

    }
    _Block_object_dispose(&v20, 8);
  }

}

uint64_t __107__UIInterfaceActionSelectionTrackingController__performRecursivelyWithVisitedCooperatingControllers_block___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

- (id)_allActionViewsIncludingCooperatingActionViews
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__UIInterfaceActionSelectionTrackingController__allActionViewsIncludingCooperatingActionViews__block_invoke;
  v6[3] = &unk_1E16B2330;
  v4 = v3;
  v7 = v4;
  -[UIInterfaceActionSelectionTrackingController _performRecursivelyWithVisitedCooperatingControllers:block:](self, "_performRecursivelyWithVisitedCooperatingControllers:block:", 0, v6);

  return v4;
}

uint64_t __94__UIInterfaceActionSelectionTrackingController__allActionViewsIncludingCooperatingActionViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a2 + 32));
}

- (id)_allGestureRecognizers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_selectionGestureRecognizer)
    objc_msgSend(v3, "addObject:");
  if (self->_selectByPressGestureRecognizer)
    objc_msgSend(v4, "addObject:");
  if (self->_systemProvidedGestureRecognizer)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (UIView)trackableContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_trackableContainerView);
}

- (void)setTrackableContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_trackableContainerView, a3);
}

- (UIScrollView)actionsScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_actionsScrollView);
}

- (void)setActionsScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_actionsScrollView, a3);
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (BOOL)selectByPressGestureEnabled
{
  return self->_selectByPressGestureEnabled;
}

- (BOOL)selectionFeedbackEnabled
{
  return self->_selectionFeedbackEnabled;
}

- (BOOL)selectByIndirectPointerTouchEnabled
{
  return self->_selectByIndirectPointerTouchEnabled;
}

- (NSArray)representationViews
{
  return self->_representationViews;
}

- (void)setRepresentationViews:(id)a3
{
  objc_storeStrong((id *)&self->_representationViews, a3);
}

- (CGPoint)actionSelectionInitialLocationInContainerView
{
  double x;
  double y;
  CGPoint result;

  x = self->_actionSelectionInitialLocationInContainerView.x;
  y = self->_actionSelectionInitialLocationInContainerView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UILongPressGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (_UIInterfaceActionSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer
{
  return self->_selectionDelayGestureRecognizer;
}

- (UIGestureRecognizer)systemProvidedGestureRecognizer
{
  return self->_systemProvidedGestureRecognizer;
}

- (NSMutableSet)viewsRequiringSelectionGestureDisabling
{
  return self->_viewsRequiringSelectionGestureDisabling;
}

- (_UIInterfaceActionSelectByPressGestureRecognizer)selectByPressGestureRecognizer
{
  return self->_selectByPressGestureRecognizer;
}

- (UISelectionFeedbackGenerator)selectionRetargetFeedbackGenerator
{
  return self->_selectionRetargetFeedbackGenerator;
}

- (void)setSelectionRetargetFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRetargetFeedbackGenerator, a3);
}

- (NSPointerArray)weakCooperatingSelectionTrackingControllers
{
  return self->_weakCooperatingSelectionTrackingControllers;
}

- (id)scrollViewWillBeginDraggingNotificationToken
{
  return self->_scrollViewWillBeginDraggingNotificationToken;
}

- (void)setScrollViewWillBeginDraggingNotificationToken:(id)a3
{
  objc_storeStrong(&self->_scrollViewWillBeginDraggingNotificationToken, a3);
}

- (id)scrollViewDidEndDraggingNotificationToken
{
  return self->_scrollViewDidEndDraggingNotificationToken;
}

- (void)setScrollViewDidEndDraggingNotificationToken:(id)a3
{
  objc_storeStrong(&self->_scrollViewDidEndDraggingNotificationToken, a3);
}

- (id)scrollViewDidEndDeceleratingNotificationToken
{
  return self->_scrollViewDidEndDeceleratingNotificationToken;
}

- (void)setScrollViewDidEndDeceleratingNotificationToken:(id)a3
{
  objc_storeStrong(&self->_scrollViewDidEndDeceleratingNotificationToken, a3);
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong(&self->_scrollViewDidEndDeceleratingNotificationToken, 0);
  objc_storeStrong(&self->_scrollViewDidEndDraggingNotificationToken, 0);
  objc_storeStrong(&self->_scrollViewWillBeginDraggingNotificationToken, 0);
  objc_storeStrong((id *)&self->_weakCooperatingSelectionTrackingControllers, 0);
  objc_storeStrong((id *)&self->_selectionRetargetFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectByPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_viewsRequiringSelectionGestureDisabling, 0);
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_representationViews, 0);
  objc_destroyWeak((id *)&self->_actionsScrollView);
  objc_destroyWeak((id *)&self->_trackableContainerView);
}

@end
