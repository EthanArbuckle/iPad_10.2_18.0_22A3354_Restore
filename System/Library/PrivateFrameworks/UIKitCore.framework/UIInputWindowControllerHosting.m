@implementation UIInputWindowControllerHosting

- (void)_updateBackdropViews
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (BOOL)useCrescendoHostingItem
{
  return 0;
}

- (id)placementForHost:(id)a3
{
  UIInputWindowController **p_owner;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  p_owner = &self->_owner;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(WeakRetained, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting subPlacementFromPlacement:forHost:](self, "subPlacementFromPlacement:forHost:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subPlacementFromPlacement:(id)a3 forHost:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = -[UIInputWindowControllerHosting indexOfHost:](self, "indexOfHost:", a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && (v8 = v7) != 0)
  {
    objc_msgSend(v6, "subPlacements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8 - 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (unint64_t)indexOfHost:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_hostingItems, "indexOfObject:", a3);
}

- (UIInputWindowController)owner
{
  return (UIInputWindowController *)objc_loadWeakRetained((id *)&self->_owner);
}

- (id)itemForPurpose:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  unint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPurpose:", a3);

  if (v7 >= -[NSMutableArray count](self->_hostingItems, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_hostingItems, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)host:(id)a3 isForPurpose:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id WeakRetained;
  void *v10;

  v6 = -[NSMutableArray indexOfObject:](self->_hostingItems, "indexOfObject:", a3);
  v7 = v6;
  if (a4 == 200)
    return v6 == 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "placement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "indexForPurpose:", a4) == v7;

  return v8;
}

- (void)reloadForPlacementForInputViewSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  UIInputWindowController **p_owner;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  char v29;
  unint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)UIApp, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInputWindowControllerHosting owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputViewSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputAccessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inputAccessoryView");
  v10 = objc_claimAutoreleasedReturnValue();
  v49 = v9;
  v50 = v6;
  if ((void *)v10 == v9)
  {

  }
  else
  {
    v11 = (void *)v10;
    objc_msgSend(v6, "inputAccessoryViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v9)
    {
      v14 = 0;
      goto LABEL_6;
    }
  }
  v14 = v6;
LABEL_6:
  p_owner = &self->_owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "placement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v17;
  v51 = v4;
  objc_msgSend(v17, "subPlacementsForInputViewSet:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)-[NSMutableArray copy](self->_hostingItems, "copy");
  v46 = v18;
  -[UIInputWindowControllerHosting setExtraHostsRequired:](self, "setExtraHostsRequired:", objc_msgSend(v18, "count"));
  objc_msgSend((id)UIApp, "keyWindow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstResponder");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 != v14)
    objc_msgSend(v14, "becomeFirstResponder");
  v48 = v14;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v26, "placement");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_loadWeakRetained((id *)&self->_owner);
        v29 = objc_msgSend(v28, "shouldNotifyRemoteKeyboards");

        if ((v29 & 1) == 0)
          objc_msgSend(v26, "setPlacement");

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v23);
  }

  v30 = objc_msgSend(v47, "computeComparisonMask");
  if (self->_currentState != v30)
  {
    self->_currentState = v30;
    if (v51)
    {
      v31 = v51;
    }
    else
    {
      v32 = objc_loadWeakRetained((id *)&self->_owner);
      objc_msgSend(v32, "inputViewSet");
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v31, "inputViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "parentViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v31, "inputViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "parentViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "invalidateInputView");

    }
    objc_msgSend(v31, "assistantViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "parentViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();

    if ((v40 & 1) != 0)
    {
      objc_msgSend(v31, "assistantViewController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "parentViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "invalidateInputAssistantView");

    }
    v43 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v43, "changeToInputViewSet:", v31);

    if ((objc_msgSend(v47, "isFloating") & 1) != 0 || objc_msgSend(v47, "isHiddenForFloatingTransition"))
    {
      v44 = objc_loadWeakRetained((id *)p_owner);
      objc_msgSend(v44, "validateInputView");

    }
  }

}

- (void)setExtraHostsRequired:(int)a3
{
  unint64_t v4;
  void *v5;
  UIInputLayoutHostingItem *v6;
  void *v7;
  void *v8;
  UIInputWindowControllerHostingItem *v9;

  self->_extraHostsRequired = a3;
  v4 = a3 + 1;
  while (-[NSMutableArray count](self->_hostingItems, "count") > v4)
  {
    -[NSMutableArray lastObject](self->_hostingItems, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearVisibilityConstraints");
    -[NSMutableArray removeLastObject](self->_hostingItems, "removeLastObject");

  }
  while (-[NSMutableArray count](self->_hostingItems, "count") < v4)
  {
    if (-[UIInputWindowControllerHosting useCrescendoHostingItem](self, "useCrescendoHostingItem"))
    {
      v6 = [UIInputLayoutHostingItem alloc];
      -[UIInputWindowControllerHosting owner](self, "owner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputViewSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIInputLayoutHostingItem initWithInputViewSet:container:](v6, "initWithInputViewSet:container:", v8, self);

    }
    else
    {
      v9 = -[UIInputWindowControllerHostingItem initWithContainer:]([UIInputWindowControllerHostingItem alloc], "initWithContainer:", self);
    }
    -[NSMutableArray addObject:](self->_hostingItems, "addObject:", v9);

  }
}

- (NSArray)allHostingItems
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_hostingItems, "copy");
}

- (void)removeAllAnimations
{
  void *v2;
  id v3;

  -[UIInputWindowControllerHosting owner](self, "owner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllAnimations:", 1);

}

- (void)updateEmptyHeightConstraint
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)updateViewConstraints
{
  id WeakRetained;
  char v4;
  BOOL v5;
  void *v6;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v4 = objc_msgSend(WeakRetained, "isChangingInputViews");

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "updateViewConstraints");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    v5 = 0;
  }
  self->_requiresConstraintUpdate = v5;
}

- (void)initializeTranslateGestureRecognizerIfNecessary
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)resetInputViewVisibility
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)clearInputViewEdgeConstraints
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (UIEdgeInsets)_inputViewPadding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIEdgeInsets result;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endPlacementForInputViewSet:windowScene:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || (v12 = 0.0,
        v13 = 0.0,
        v14 = 0.0,
        v15 = 0.0,
        +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard")))
  {
    -[UIInputWindowControllerHosting owner](self, "owner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViewSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isCustomInputView");

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") && v18)
    {
      -[UIInputWindowControllerHosting owner](self, "owner");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "inputViewSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputViewBounds");
      LOBYTE(v18) = v21 == 0.0;

    }
    v12 = 0.0;
    if (!objc_msgSend(v11, "showsKeyboard") || (v18 & 1) != 0)
    {
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isMinimized");

      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      if ((v23 & 1) == 0)
      {
        -[UIInputWindowControllerHosting owner](self, "owner");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "keyboardOrientation");

        if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
        {
          +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "currentUIState");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            v25 = objc_msgSend(v27, "orientation");

        }
        +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v25, v4);
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", v25, v4);
        v15 = -(v29 - v36);
        v14 = v31 - v37;
        v13 = -(v33 - v38);
        v12 = -(v35 - v39);
      }
    }
  }

  v40 = v15;
  v41 = v14;
  v42 = v13;
  v43 = v12;
  result.right = v43;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
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
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "disableViewSizingConstraints:forNewView:", a3, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (UIInputWindowControllerHosting)initWithHost:(id)a3
{
  id v4;
  UIInputWindowControllerHosting *v5;
  UIInputWindowControllerHosting *v6;
  uint64_t v7;
  NSMutableArray *hostingItems;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIInputWindowControllerHosting;
  v5 = -[UIInputWindowControllerHosting init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owner, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    hostingItems = v6->_hostingItems;
    v6->_hostingItems = (NSMutableArray *)v7;

    -[UIInputWindowControllerHosting reloadForPlacementForInputViewSet:](v6, "reloadForPlacementForInputViewSet:", 0);
  }

  return v6;
}

- (void)unloadForPlacement
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", sel_resetPlacement);
}

- (void)updateConstraintInsets
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)removeInputAssistantHostView
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)clearInputAssistantViewEdgeConstraints
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)clearInputAccessoryViewEdgeConstraints
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_hostingItems, 0);
}

- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
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

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "updateCombinedBackdropViewAnimated:forKeyboardUp:", v5, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)resetBackdropHeight
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)setNeedsLayout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "hostView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsLayout");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)performForInputAccessoryBackdropViews:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "_inputAccessoryBackdropView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)layoutIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if (-[UIInputWindowControllerHosting useCrescendoHostingItem](self, "useCrescendoHostingItem"))
        {
          objc_msgSend(v8, "someViewDidLayoutSubviews");
        }
        else
        {
          objc_msgSend(v8, "hostView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "layoutIfNeeded");

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)updateViewSizingConstraints
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_hostingItems, "makeObjectsPerformSelector:", a2);
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  void *v6;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self, "allHostingItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "extendKeyboardBackdropHeight:withDuration:", a3, a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (CGRect)visibleFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIInputWindowControllerHosting itemForPurpose:](self, "itemForPurpose:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)expectedPlacementForHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "expectedPlacement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting subPlacementFromPlacement:forHost:](self, "subPlacementFromPlacement:forHost:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(v10, "placement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHosting subPlacementFromPlacement:forHost:](self, "subPlacementFromPlacement:forHost:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expiringPlacement");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)scrollTrackingView
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHosting itemForPurpose:](self, "itemForPurpose:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollTrackingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeMatchMoveAnimationIfNeeded
{
  id v2;

  -[UIInputWindowControllerHosting itemForPurpose:](self, "itemForPurpose:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeMatchMoveAnimationIfNeeded");

}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (int)extraHostsRequired
{
  return self->_extraHostsRequired;
}

- (BOOL)requiresConstraintUpdate
{
  return self->_requiresConstraintUpdate;
}

- (void)setRequiresConstraintUpdate:(BOOL)a3
{
  self->_requiresConstraintUpdate = a3;
}

@end
