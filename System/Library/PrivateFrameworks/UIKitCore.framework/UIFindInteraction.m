@implementation UIFindInteraction

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  -[UIFindInteraction _updateHostViewConformance](self, "_updateHostViewConformance");
}

- (BOOL)isFindNavigatorVisible
{
  void *v2;
  char v3;

  if (!self->_activeFindSession)
    return 0;
  -[UIFindInteraction _findNavigatorHostingForStrategy:](self, "_findNavigatorHostingForStrategy:", self->_lastUsedHostingStrategy);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFindNavigatorVisible");

  return v3;
}

- (void)_updateHostViewConformance
{
  void *v3;
  char v4;
  id v5;

  -[UIFindInteraction _hostView](self, "_hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MFComposeWebView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_BYTE *)&self->_hostViewIs = *(_BYTE *)&self->_hostViewIs & 0xFD | v4;

  -[UIFindInteraction _hostView](self, "_hostView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WKWebView"));
  *(_BYTE *)&self->_hostViewIs = *(_BYTE *)&self->_hostViewIs & 0xFE | objc_opt_isKindOfClass() & 1;

}

- (UIView)_hostView
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_alternateHostView);
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = WeakRetained;
  else
    v5 = objc_loadWeakRetained((id *)&self->_view);
  v6 = v5;

  return (UIView *)v6;
}

- (void)dismissFindNavigator
{
  void *v3;
  void *v4;
  id v5;

  -[UIFindInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIFindInteraction _findNavigatorHosting](self, "_findNavigatorHosting");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissFindNavigatorEndingActiveSession:", 1);

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIFindInteraction)initWithSessionDelegate:(id)sessionDelegate
{
  id v4;
  UIFindInteraction *v5;
  UIFindInteraction *v6;
  id v7;
  id WeakRetained;
  char v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = sessionDelegate;
  v13.receiver = self;
  v13.super_class = (Class)UIFindInteraction;
  v5 = -[UIFindInteraction init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    *(_BYTE *)&v6->_privateDelegateDoes = *(_BYTE *)&v6->_privateDelegateDoes & 0xFE | objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *(_BYTE *)&v6->_privateDelegateDoes = *(_BYTE *)&v6->_privateDelegateDoes & 0xFD | v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__systemInputAssistantCenterVisibilityChanged_, 0x1E171CBE0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__keyboardDidChangePlacementNotification_, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);

  }
  return v6;
}

+ (void)_setGlobalFindBuffer:(id)a3
{
  objc_storeStrong((id *)&__globalFindBuffer, a3);
}

+ (NSString)_globalFindBuffer
{
  return (NSString *)(id)__globalFindBuffer;
}

- (void)_didBeginActiveFindSession
{
  UIFindInteractionDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "findInteraction:didBeginFindSession:", self, self->_activeFindSession);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("UIFindInteractionFindSessionDidBeginNotification"), self->_activeFindSession);

}

- (void)_didEndActiveFindSession
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  -[UIFindSession invalidateFoundResults](self->_activeFindSession, "invalidateFoundResults");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "findInteraction:didEndFindSession:", self, self->_activeFindSession);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("UIFindInteractionFindSessionDidEndNotification"), self->_activeFindSession);

}

- (id)_createActiveFindSessionIfNecessary
{
  UIFindSession *activeFindSession;
  id WeakRetained;
  void *v5;
  UIFindSession *v6;
  UIFindSession *v7;
  void *v8;
  void *v9;
  void *v10;

  activeFindSession = self->_activeFindSession;
  if (!activeFindSession)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[UIFindInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "findInteraction:sessionForView:", self, v5);
    v6 = (UIFindSession *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeFindSession;
    self->_activeFindSession = v6;

    -[UIFindInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindSession setSearchableResponder:](self->_activeFindSession, "setSearchableResponder:", v8);

    -[UIFindSession setParentInteraction:](self->_activeFindSession, "setParentInteraction:", self);
    -[UIFindSession setReplacementText:](self->_activeFindSession, "setReplacementText:", self->_replacementText);
    -[UIFindSession setSearchText:](self->_activeFindSession, "setSearchText:", self->_searchText);
    activeFindSession = self->_activeFindSession;
  }
  -[UIFindSession searchText](activeFindSession, "searchText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[UIFindInteraction _globalFindBuffer](UIFindInteraction, "_globalFindBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindSession setSearchText:](self->_activeFindSession, "setSearchText:", v10);

  }
  return self->_activeFindSession;
}

- (id)_findNavigatorSceneComponent
{
  void *v2;
  void *v3;

  -[UIFindInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFindNavigatorSceneComponent sceneComponentForView:](_UIFindNavigatorSceneComponent, "sceneComponentForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_computedHostingStrategy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  unint64_t v19;

  -[UIFindInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "systemInputAssistantViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "systemInputAssistantViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_hidesCenterViewForActiveWindowingMode");

    if ((v10 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v11 = +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    objc_msgSend(v5, "visualModeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldShowWithinAppWindow");

    objc_msgSend(v5, "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "horizontalSizeClass");

    if (v13 && v16 == 1)
      goto LABEL_11;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isMinimized") & 1) != 0)
  {

LABEL_12:
    v19 = 1;
    goto LABEL_13;
  }
  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {

  }
  else
  {
    v18 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

    if (!v18)
      goto LABEL_12;
  }
LABEL_11:
  v19 = 2;
LABEL_13:

  return v19;
}

- (unint64_t)_currentHostingStrategy
{
  unint64_t result;

  result = self->_lastUsedHostingStrategy;
  if (!result)
  {
    result = -[UIFindInteraction _computedHostingStrategy](self, "_computedHostingStrategy");
    self->_lastUsedHostingStrategy = result;
  }
  return result;
}

- (id)_findNavigatorHostingForStrategy:(unint64_t)a3
{
  _UIFindNavigatorHarness *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3 == 1)
  {
    -[UIFindInteraction _findNavigatorSceneComponent](self, "_findNavigatorSceneComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    if (!self->_findNavigatorHarness)
    {
      v4 = objc_alloc_init(_UIFindNavigatorHarness);
      -[UIFindInteraction setFindNavigatorHarness:](self, "setFindNavigatorHarness:", v4);

    }
    -[UIFindInteraction _hostView](self, "_hostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "scrollView");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    -[UIFindInteraction findNavigatorHarness](self, "findNavigatorHarness");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHostView:", v5);

    -[UIFindInteraction _hostScrollView](self, "_hostScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindInteraction findNavigatorHarness](self, "findNavigatorHarness");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHostScrollView:", v8);

    -[UIFindInteraction view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindInteraction findNavigatorHarness](self, "findNavigatorHarness");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInteractionView:", v10);

    -[UIFindInteraction findNavigatorHarness](self, "findNavigatorHarness");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_findNavigatorHosting
{
  return -[UIFindInteraction _findNavigatorHostingForStrategy:](self, "_findNavigatorHostingForStrategy:", -[UIFindInteraction _computedHostingStrategy](self, "_computedHostingStrategy"));
}

- (void)_recomputeHostingStrategyIfNecessary
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  UIFindInteraction *v11;
  BOOL v12;

  v3 = -[UIFindInteraction _computedHostingStrategy](self, "_computedHostingStrategy");
  -[UIFindInteraction _findNavigatorHostingForStrategy:](self, "_findNavigatorHostingForStrategy:", self->_lastUsedHostingStrategy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFindNavigatorVisible") && v3 != self->_lastUsedHostingStrategy)
  {
    objc_msgSend(v4, "findNavigatorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findNavigatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mode") == 1;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__UIFindInteraction__recomputeHostingStrategyIfNecessary__block_invoke;
    v9[3] = &unk_1E16B4008;
    v10 = v4;
    v11 = self;
    v12 = v7;
    objc_msgSend(v8, "performBlock:", v9);

    self->_lastUsedHostingStrategy = v3;
  }

}

void __57__UIFindInteraction__recomputeHostingStrategyIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dismissFindNavigatorEndingActiveSession:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_findNavigatorHosting");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activeFindSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentFindNavigatorWithFindSession:showingReplace:idiom:", v2, v3, objc_msgSend(v5, "userInterfaceIdiom"));

}

- (void)presentFindNavigatorShowingReplace:(BOOL)showingReplace
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = showingReplace;
  -[UIFindInteraction _createActiveFindSessionIfNecessary](self, "_createActiveFindSessionIfNecessary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v5 = -[UIFindSession supportsReplacement](self->_activeFindSession, "supportsReplacement") & v3;
    -[UIFindInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIContextMenuSceneComponent sceneComponentForView:](_UIContextMenuSceneComponent, "sceneComponentForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissActiveMenus");

    -[UIFindInteraction _findNavigatorHosting](self, "_findNavigatorHosting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentFindNavigatorWithFindSession:showingReplace:idiom:", v11, v5, objc_msgSend(v10, "userInterfaceIdiom"));

    self->_lastUsedHostingStrategy = -[UIFindInteraction _computedHostingStrategy](self, "_computedHostingStrategy");
    -[UIFindInteraction _didBeginActiveFindSession](self, "_didBeginActiveFindSession");

  }
}

- (id)_currentFindNavigatorController
{
  void *v2;
  void *v3;

  -[UIFindInteraction _findNavigatorHosting](self, "_findNavigatorHosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNavigatorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateResultCount
{
  id v2;

  -[UIFindInteraction _currentFindNavigatorController](self, "_currentFindNavigatorController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateViewForActiveFindSession");

}

- (void)findNext
{
  id v2;

  -[UIFindInteraction _createActiveFindSessionIfNecessary](self, "_createActiveFindSessionIfNecessary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightNextResultInDirection:", 0);

}

- (void)findPrevious
{
  id v2;

  -[UIFindInteraction _createActiveFindSessionIfNecessary](self, "_createActiveFindSessionIfNecessary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightNextResultInDirection:", 1);

}

- (NSString)searchText
{
  UIFindSession *activeFindSession;
  NSString *v4;

  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
  {
    -[UIFindSession searchText](activeFindSession, "searchText");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_searchText;
  }
  return v4;
}

- (void)setSearchText:(NSString *)searchText
{
  UIFindSession *activeFindSession;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = searchText;
  objc_storeStrong((id *)&self->_searchText, searchText);
  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
    -[UIFindSession setSearchText:](activeFindSession, "setSearchText:", v11);
  -[UIFindInteraction _currentFindNavigatorController](self, "_currentFindNavigatorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIFindInteraction _currentFindNavigatorController](self, "_currentFindNavigatorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "findNavigatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

  }
}

- (NSString)replacementText
{
  UIFindSession *activeFindSession;
  NSString *v4;

  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
  {
    -[UIFindSession replacementText](activeFindSession, "replacementText");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_replacementText;
  }
  return v4;
}

- (void)setReplacementText:(NSString *)replacementText
{
  UIFindSession *activeFindSession;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = replacementText;
  objc_storeStrong((id *)&self->_replacementText, replacementText);
  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
    -[UIFindSession setReplacementText:](activeFindSession, "setReplacementText:", v11);
  -[UIFindInteraction _currentFindNavigatorController](self, "_currentFindNavigatorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIFindInteraction _currentFindNavigatorController](self, "_currentFindNavigatorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "findNavigatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

  }
}

- (void)_setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_alternateHostView, a3);
  -[UIFindInteraction _updateHostViewConformance](self, "_updateHostViewConformance");
}

- (UITextSearchOptions)_configuredSearchOptions
{
  void *v2;
  void *v3;

  -[UIFindInteraction _createActiveFindSessionIfNecessary](self, "_createActiveFindSessionIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuredSearchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextSearchOptions *)v3;
}

- (void)_willChangeNavigatorPlacement:(id)a3
{
  UIFindInteractionDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if ((*(_BYTE *)&self->_privateDelegateDoes & 1) != 0)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "_findInteraction:navigatorPlacementWillChange:", self, v5);

  }
}

- (id)_hostScrollView
{
  void *v3;
  void *v4;
  char v5;
  char isKindOfClass;
  void *WeakRetained;
  uint64_t v8;

  if ((*(_BYTE *)&self->_hostViewIs & 2) != 0 && (*(_BYTE *)&self->_privateDelegateDoes & 1) == 0)
    goto LABEL_3;
  if ((*(_BYTE *)&self->_privateDelegateDoes & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_findInteractionScrollViewForInsetAdjustment:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[UIFindInteraction _hostView](self, "_hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "__isKindOfUIScrollView");

  -[UIFindInteraction _hostView](self, "_hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
    return v3;
  NSClassFromString(CFSTR("WKWebView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIFindInteraction _hostView](self, "_hostView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scrollView");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v3 = (void *)v8;

    return v3;
  }
LABEL_3:
  v3 = 0;
  return v3;
}

- (id)searchableObject
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIFindSession searchableObject](self->_activeFindSession, "searchableObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSearchableObject:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIFindInteraction _createActiveFindSessionIfNecessary](self, "_createActiveFindSessionIfNecessary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSearchableObject:", v5);

  }
}

- (UIFindSession)activeFindSession
{
  return self->_activeFindSession;
}

- (void)optionsMenuProvider
{
  return self->_optionsMenuProvider;
}

- (void)setOptionsMenuProvider:(void *)optionsMenuProvider
{
  objc_setProperty_nonatomic_copy(self, a2, optionsMenuProvider, 64);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UIFindNavigatorHarness)findNavigatorHarness
{
  return self->_findNavigatorHarness;
}

- (void)setFindNavigatorHarness:(id)a3
{
  objc_storeStrong((id *)&self->_findNavigatorHarness, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorHarness, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_optionsMenuProvider, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_activeFindSession, 0);
  objc_destroyWeak((id *)&self->_alternateHostView);
  objc_destroyWeak((id *)&self->_view);
}

@end
