@implementation _UIFindNavigatorHarness

- (_UIFindNavigatorHarness)init
{
  _UIFindNavigatorHarness *v2;
  _UIFindNavigatorViewController *v3;
  _UIFindNavigatorViewController *findNavigatorViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorHarness;
  v2 = -[_UIFindNavigatorHarness init](&v6, sel_init);
  if (v2)
  {
    v3 = -[UIInputViewController initWithNibName:bundle:]([_UIFindNavigatorViewController alloc], "initWithNibName:bundle:", 0, 0);
    findNavigatorViewController = v2->_findNavigatorViewController;
    v2->_findNavigatorViewController = v3;

    -[_UIFindNavigatorViewController setFindNavigatorViewControllerDelegate:](v2->_findNavigatorViewController, "setFindNavigatorViewControllerDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIFindNavigatorHarness endHoistingFindNavigator:](self, "endHoistingFindNavigator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorHarness;
  -[_UIFindNavigatorHarness dealloc](&v3, sel_dealloc);
}

- (void)setInteractionView:(id)a3
{
  UIView **p_interactionView;
  id v5;

  p_interactionView = &self->_interactionView;
  v5 = a3;
  objc_storeWeak((id *)p_interactionView, v5);
  NSClassFromString(CFSTR("WKWebView"));
  LOBYTE(p_interactionView) = objc_opt_isKindOfClass();

  self->_interactionViewIsWebView = p_interactionView & 1;
}

- (id)_findNavigatorView
{
  return -[_UIFindNavigatorViewController findNavigatorView](self->_findNavigatorViewController, "findNavigatorView");
}

- (BOOL)_shouldAdjustHostViewContentOffsets
{
  UIScrollView **p_hostScrollView;
  id WeakRetained;
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  BOOL v9;

  p_hostScrollView = &self->_hostScrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);

  if (!WeakRetained)
    return 0;
  v4 = objc_loadWeakRetained((id *)p_hostScrollView);
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v7 = objc_loadWeakRetained((id *)p_hostScrollView);
  objc_msgSend(v7, "_minimumContentOffset");
  v9 = vabdd_f64(v6, v8) < 2.22044605e-16;

  return v9;
}

- (void)_adjustHostViewScrollOffsetToTopIfSupported
{
  UIScrollView **p_hostScrollView;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  id v8;
  id WeakRetained;

  p_hostScrollView = &self->_hostScrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);
  objc_msgSend(WeakRetained, "contentOffset");
  v4 = v3;
  v5 = objc_loadWeakRetained((id *)p_hostScrollView);
  objc_msgSend(v5, "_minimumContentOffset");
  v7 = v6;
  v8 = objc_loadWeakRetained((id *)p_hostScrollView);
  objc_msgSend(v8, "setContentOffset:", v4, v7);

}

- (void)beginHoistingFindNavigator:(BOOL)a3
{
  _BOOL4 v3;
  UIView **p_hostView;
  id WeakRetained;
  _BOOL4 v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v3 = a3;
  p_hostView = &self->_hostView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFindNavigatorHarness.m"), 86, CFSTR("No host view to hoist the find navigator."));

  }
  if (!self->_isHoistingFindNavigator)
  {
    self->_isHoistingFindNavigator = 1;
    v8 = -[_UIFindNavigatorHarness _shouldAdjustHostViewContentOffsets](self, "_shouldAdjustHostViewContentOffsets");
    v9 = objc_loadWeakRetained((id *)p_hostView);
    -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v11 = objc_loadWeakRetained((id *)p_hostView);
    -[UIView _addGeometryChangeObserver:](v11, self);

    -[_UIFindNavigatorHarness _layoutFindNavigator](self, "_layoutFindNavigator");
    if (v3)
    {
      -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      CGAffineTransformMakeTranslation(&v20, 0.0, -v13);
      -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      objc_msgSend(v14, "setTransform:", &v19);

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54___UIFindNavigatorHarness_beginHoistingFindNavigator___block_invoke;
      v17[3] = &unk_1E16B1B78;
      v17[4] = self;
      v18 = v8;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, 0, 0.35, 0.0, 600.0, 0.0);
    }
    else if (v8)
    {
      -[_UIFindNavigatorHarness _adjustHostViewScrollOffsetToTopIfSupported](self, "_adjustHostViewScrollOffsetToTopIfSupported");
      -[_UIFindNavigatorHarness _sendPlacementUpdate](self, "_sendPlacementUpdate");
    }
  }
  -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "becomeFirstResponder");

}

- (void)endHoistingFindNavigator:(BOOL)a3
{
  -[_UIFindNavigatorHarness endHoistingFindNavigator:endingActiveSession:](self, "endHoistingFindNavigator:endingActiveSession:", a3, 1);
}

- (void)endHoistingFindNavigator:(BOOL)a3 endingActiveSession:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  _QWORD *WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  BOOL v18;
  _QWORD aBlock[5];

  if (self->_isHoistingFindNavigator)
  {
    v4 = a4;
    v5 = a3;
    self->_isHoistingFindNavigator = 0;
    v7 = -[_UIFindNavigatorHarness _shouldAdjustHostViewContentOffsets](self, "_shouldAdjustHostViewContentOffsets");
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
    -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

    -[_UIFindNavigatorHarness findNavigatorViewController](self, "findNavigatorViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "findSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v4)
    {
      objc_msgSend(v10, "parentInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_didEndActiveFindSession");

    }
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    v14 = v13;
    if (v5)
    {
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_2;
      v17[3] = &unk_1E16B1B78;
      v17[4] = self;
      v18 = v7;
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_3;
      v15[3] = &unk_1E16BC218;
      v15[4] = self;
      v16 = v13;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, v15, 0.35, 0.0, 600.0, 0.0);

    }
    else
    {
      v13[2](v13);
      if (v7)
        -[_UIFindNavigatorHarness _adjustHostViewScrollOffsetToTopIfSupported](self, "_adjustHostViewScrollOffsetToTopIfSupported");
      -[_UIFindNavigatorHarness _sendPlacementUpdate](self, "_sendPlacementUpdate");
    }

  }
}

- (void)_layoutFindNavigator
{
  UIView **p_hostView;
  id WeakRetained;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  p_hostView = &self->_hostView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  objc_msgSend(WeakRetained, "safeAreaInsets");
  v6 = v5;

  -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;

  v10 = -v9;
  v11 = objc_loadWeakRetained((id *)p_hostView);
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (self->_interactionViewIsWebView)
  {
    v18 = objc_loadWeakRetained((id *)&self->_hostScrollView);

    if (v18)
    {
      v19 = objc_loadWeakRetained((id *)&self->_interactionView);
      objc_msgSend(v19, "_obscuredInsets");
      if (v6 < v20)
        v6 = v20;

    }
    else
    {
      v10 = 0.0;
    }
  }
  if (v10 >= v15 + v6)
    v21 = v10;
  else
    v21 = v15 + v6;
  -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v13, v21, v17, v9);

  v23 = objc_loadWeakRetained((id *)&self->_hostScrollView);
  objc_msgSend(v23, "_setSystemInsetAdjustment:forAdjustmentTypeIdentifier:", CFSTR("findadj"), v9);

  v25 = objc_loadWeakRetained((id *)p_hostView);
  -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bringSubviewToFront:", v24);

}

- (void)_sendPlacementUpdate
{
  void *v3;
  _UIFindNavigatorInlinePlacement *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[_UIFindNavigatorHarness findNavigatorViewController](self, "findNavigatorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(_UIFindNavigatorInlinePlacement);
  -[_UIFindNavigatorHarness _findNavigatorView](self, "_findNavigatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  -[_UIFindNavigatorInlinePlacement setIntrinsicContentSize:](v4, "setIntrinsicContentSize:");

  -[_UIFindNavigatorPlacement setShowing:](v4, "setShowing:", self->_isHoistingFindNavigator);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  -[_UIFindNavigatorInlinePlacement setHostView:](v4, "setHostView:", WeakRetained);

  objc_msgSend(v8, "parentInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_willChangeNavigatorPlacement:", v4);

}

- (BOOL)isFindNavigatorVisible
{
  return self->_isHoistingFindNavigator;
}

- (void)presentFindNavigatorWithFindSession:(id)a3 showingReplace:(BOOL)a4 idiom:(int64_t)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v7 = a3;
  v10 = v7;
  if (v5)
    v8 = objc_msgSend(v7, "supportsReplacement");
  else
    v8 = 0;
  -[_UIFindNavigatorViewController setFindSession:](self->_findNavigatorViewController, "setFindSession:", v10);
  -[_UIFindNavigatorViewController findNavigatorView](self->_findNavigatorViewController, "findNavigatorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMode:", v8);
  objc_msgSend(v9, "setIntrinsicHeightDerivedFromAssistantBar:", 0);
  objc_msgSend(v9, "setVisibleSeparatorEdges:", 4);
  objc_msgSend(v9, "setUsesOpaqueBackground:", 1);
  -[_UIFindNavigatorViewController setTintTechnique:](self->_findNavigatorViewController, "setTintTechnique:", 0);
  -[_UIFindNavigatorHarness beginHoistingFindNavigator:](self, "beginHoistingFindNavigator:", 1);

}

- (void)dismissFindNavigatorEndingActiveSession:(BOOL)a3
{
  -[_UIFindNavigatorHarness endHoistingFindNavigator:endingActiveSession:](self, "endHoistingFindNavigator:endingActiveSession:", 1, a3);
}

- (BOOL)findNavigatorShouldDismissOnResponderChange:(id)a3
{
  return 0;
}

- (void)findNavigatorViewControllerDidRequestDismissal:(id)a3
{
  -[_UIFindNavigatorHarness endHoistingFindNavigator:](self, "endHoistingFindNavigator:", 1);
}

- (void)findNavigatorViewControllerViewDidChangeIntrinsicContentSize:(id)a3
{
  -[_UIFindNavigatorHarness _layoutFindNavigator](self, "_layoutFindNavigator", a3);
  -[_UIFindNavigatorHarness _sendPlacementUpdate](self, "_sendPlacementUpdate");
}

- (UIView)interactionView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_interactionView);
}

- (UIView)hostView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (UIScrollView)hostScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_hostScrollView);
}

- (void)setHostScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_hostScrollView, a3);
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
  objc_destroyWeak((id *)&self->_hostScrollView);
  objc_destroyWeak((id *)&self->_hostView);
  objc_destroyWeak((id *)&self->_interactionView);
}

@end
