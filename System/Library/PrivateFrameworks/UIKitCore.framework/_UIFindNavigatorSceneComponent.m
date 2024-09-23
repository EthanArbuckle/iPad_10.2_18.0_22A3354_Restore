@implementation _UIFindNavigatorSceneComponent

+ (id)sceneComponentForView:(id)a3
{
  void *v3;
  void *v4;
  _UIFindNavigatorSceneComponent *v5;

  objc_msgSend(a3, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_sceneComponentForKey:", CFSTR("_UIFindNavigatorSceneComponentKey"));
    v5 = (_UIFindNavigatorSceneComponent *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = -[_UIFindNavigatorSceneComponent initWithScene:]([_UIFindNavigatorSceneComponent alloc], "initWithScene:", v4);
      objc_msgSend(v4, "_registerSceneComponent:forKey:", v5, CFSTR("_UIFindNavigatorSceneComponentKey"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_UIFindNavigatorSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIFindNavigatorSceneComponent *v5;
  _UIFindNavigatorSceneComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFindNavigatorSceneComponent;
  v5 = -[_UIFindNavigatorSceneComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (BOOL)_keyboardIsPreservingFindNavigatorAsRestorableResponder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNavigatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "searchTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_isPreservedRestorableResponder:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "replaceTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "_isPreservedRestorableResponder:", v7);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFindNavigatorVisible
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if ((v4 & 1) != 0)
    return 1;
  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findNavigatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[_UIFindNavigatorSceneComponent _keyboardIsPreservingFindNavigatorAsRestorableResponder](self, "_keyboardIsPreservingFindNavigatorAsRestorableResponder"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v7, "firstResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "_containsResponder:", v8);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)presentFindNavigatorWithFindSession:(id)a3 showingReplace:(BOOL)a4 idiom:(int64_t)a5
{
  _BOOL4 v5;
  void *v7;
  _UIFindNavigatorViewController *v8;
  void *v9;
  _UIFindNavigatorResponder *v10;
  void *v11;
  _UIFindNavigatorResponder *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v5 = a4;
  v35 = a3;
  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[UIInputViewController initWithNibName:bundle:]([_UIFindNavigatorViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[_UIFindNavigatorSceneComponent setFindNavigatorViewController:](self, "setFindNavigatorViewController:", v8);

  }
  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = [_UIFindNavigatorResponder alloc];
    -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIFindNavigatorResponder initWithFindNavigatorViewController:](v10, "initWithFindNavigatorViewController:", v11);
    -[_UIFindNavigatorSceneComponent setFindNavigatorResponder:](self, "setFindNavigatorResponder:", v12);

    -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "findNavigatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputAssistantItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInputAssistantItem:", v16);

    -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputAssistantItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replaceTextField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInputAssistantItem:", v19);

  }
  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "searchableResponder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_overrideInputAccessoryViewNextResponderWithResponder:", v22);

  if (v5)
    v23 = objc_msgSend(v35, "supportsReplacement");
  else
    v23 = 0;
  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFindSession:", v35);

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFindNavigatorViewControllerDelegate:", self);

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "findNavigatorView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setMode:", v23);
  objc_msgSend(v27, "setVisibleSeparatorEdges:", 10);
  objc_msgSend(v27, "setIntrinsicHeightDerivedFromAssistantBar:", 1);
  objc_msgSend(v27, "setUsesOpaqueBackground:", 0);
  objc_msgSend(v35, "searchableResponderAsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_registerSubtreeMonitor:", self);

  }
  -[_UIFindNavigatorSceneComponent _searchableView](self, "_searchableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "makeKeyWindow");

  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCanBecomeFirstResponder:", 1);

  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "becomeFirstResponderAndFocusFindField");

}

- (void)dismissFindNavigatorEndingActiveSession:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[_UIFindNavigatorSceneComponent _searchableView](self, "_searchableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unregisterSubtreeMonitor:", self);

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findSession");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 && v3)
  {
    objc_msgSend(v17, "parentInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_didEndActiveFindSession");

  }
  if (-[_UIFindNavigatorSceneComponent _keyboardIsPreservingFindNavigatorAsRestorableResponder](self, "_keyboardIsPreservingFindNavigatorAsRestorableResponder"))
  {
    -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "findNavigatorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_clearPreservedInputViewsWithRestorableResponder:", v12);

    objc_msgSend(v10, "replaceTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_clearPreservedInputViewsWithRestorableResponder:", v13);

  }
  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCanBecomeFirstResponder:", 0);

  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resignFirstResponder");

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resignFirstResponderAndFinishSearching");

}

- (void)_sendPlacementUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _UIFindNavigatorKeyboardPlacement *v9;
  void *v10;
  id v11;

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findSession");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findNavigatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFindNavigatorSceneComponent findNavigatorResponder](self, "findNavigatorResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hostingTypeForTraitCollection:", v6);

  v9 = objc_alloc_init(_UIFindNavigatorKeyboardPlacement);
  -[_UIFindNavigatorKeyboardPlacement setAsInputAccessoryView:](v9, "setAsInputAccessoryView:", v8 == 1);
  objc_msgSend(v11, "parentInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_willChangeNavigatorPlacement:", v9);

}

- (id)_searchableView
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchableResponderAsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_monitorsView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_UIFindNavigatorSceneComponent _searchableView](self, "_searchableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDescendantOfView:", v4);

  return v6;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v7;
  void *v8;
  int v9;

  v7 = a3;
  -[_UIFindNavigatorSceneComponent _searchableView](self, "_searchableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDescendantOfView:", v7);

  if (!a5)
  {
    if (v9)
      -[_UIFindNavigatorSceneComponent dismissFindNavigatorEndingActiveSession:](self, "dismissFindNavigatorEndingActiveSession:", 1);
  }
}

- (BOOL)findNavigatorShouldDismissOnResponderChange:(id)a3
{
  return !-[_UIFindNavigatorSceneComponent _keyboardIsPreservingFindNavigatorAsRestorableResponder](self, "_keyboardIsPreservingFindNavigatorAsRestorableResponder", a3);
}

- (void)findNavigatorViewControllerDidRequestDismissal:(id)a3
{
  -[_UIFindNavigatorSceneComponent dismissFindNavigatorEndingActiveSession:](self, "dismissFindNavigatorEndingActiveSession:", 1);
}

- (void)findNavigatorViewControllerViewDidChangeIntrinsicContentSize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI", a3))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteInputViewHost");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "updateInputViewsIfNecessary");
  }
  else
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUpdateAssistantView:", 1);
    -[_UIFindNavigatorSceneComponent findNavigatorViewController](self, "findNavigatorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findNavigatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_didChangeKeyplaneWithContext:", v7);

  }
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (_UIFindNavigatorResponder)findNavigatorResponder
{
  return self->_findNavigatorResponder;
}

- (void)setFindNavigatorResponder:(id)a3
{
  objc_storeStrong((id *)&self->_findNavigatorResponder, a3);
}

- (_UIFindNavigatorViewController)findNavigatorViewController
{
  return self->_findNavigatorViewController;
}

- (void)setFindNavigatorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, 0);
  objc_storeStrong((id *)&self->_findNavigatorResponder, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
