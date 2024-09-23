@implementation SBLayoutElementViewController

- (SBLayoutElementViewController)initWithDisplayIdentity:(id)a3
{
  id v5;
  SBLayoutElementViewController *v6;
  SBLayoutElementViewController *v7;
  CGSize v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLayoutElementViewController;
  v6 = -[SBLayoutElementViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayIdentity, a3);
    v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v7->_referenceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v7->_referenceFrame.size = v8;
    v7->_supportedContentInterfaceOrientations = 2;
    v7->_contentWrapperInterfaceOrientation = 1;
    v7->_isViewVisible = 0;
    v7->_isTransitioningVisibility = 0;
  }

  return v7;
}

- (SBLayoutElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%s is not a valid initializer. You must call -[%@ initWithDisplayIdentity:]."), "-[SBLayoutElementViewController initWithNibName:bundle:]", v8);

  return -[SBLayoutElementViewController initWithDisplayIdentity:](self, "initWithDisplayIdentity:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[SBLayoutElementViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBLayoutElementViewController;
  -[SBLayoutElementViewController dealloc](&v3, sel_dealloc);
}

- (SBLayoutElementViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBLayoutElementViewController *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBLayoutElementViewController;
  v9 = -[SBLayoutElementViewController initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BSUIOrientationTransformWrapperView *v8;
  BSUIOrientationTransformWrapperView *contentWrapperView;
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
  UIView *v22;
  UIView *contentContainerView;
  id v24;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v24 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[SBLayoutElementViewController setView:](self, "setView:", v24);
  v8 = (BSUIOrientationTransformWrapperView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01940]), "initWithFrame:", v4, v5, v6, v7);
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v8;

  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_contentWrapperView, "setContainerOrientation:", 1);
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_contentWrapperView, "setContentOrientation:", -[SBLayoutElementViewController contentWrapperInterfaceOrientation](self, "contentWrapperInterfaceOrientation"));
  -[BSUIOrientationTransformWrapperView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v24, "addSubview:", self->_contentWrapperView);
  -[BSUIOrientationTransformWrapperView leftAnchor](self->_contentWrapperView, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[BSUIOrientationTransformWrapperView rightAnchor](self->_contentWrapperView, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[BSUIOrientationTransformWrapperView topAnchor](self->_contentWrapperView, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[BSUIOrientationTransformWrapperView bottomAnchor](self->_contentWrapperView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v22;

  -[BSUIOrientationTransformWrapperView addContentView:](self->_contentWrapperView, "addContentView:", self->_contentContainerView);
}

- (id)_sbWindowScene
{
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", self->_displayIdentity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setContentWrapperInterfaceOrientation:(int64_t)a3
{
  id v5;

  if (self->_contentWrapperInterfaceOrientation != a3)
  {
    self->_contentWrapperInterfaceOrientation = a3;
    if (-[SBLayoutElementViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_contentWrapperView, "setContentOrientation:", a3);
      -[SBLayoutElementViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNeedsLayout");

    }
  }
}

- (BOOL)supportsReuse
{
  return 1;
}

- (void)invalidate
{
  BSInvalidatable *displayLayoutElementAssertion;
  SBSDisplayLayoutElement *displayLayoutElement;
  SBSDisplayLayoutElement *v5;
  SBLayoutElement *layoutElement;
  SBLayoutState *layoutState;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = 0;

  }
  v5 = self->_displayLayoutElement;
  self->_displayLayoutElement = 0;

  layoutElement = self->_layoutElement;
  self->_layoutElement = 0;

  layoutState = self->_layoutState;
  self->_layoutState = 0;

}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  SBLayoutElement *v14;
  SBLayoutState *v15;
  SBSDisplayLayoutElement *v16;
  SBSDisplayLayoutElement *displayLayoutElement;
  SBLayoutElement *v18;
  _QWORD v19[4];
  SBLayoutElement *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = (SBLayoutElement *)a4;
  v15 = (SBLayoutState *)a5;
  if (self->_layoutElement != v14)
    objc_storeStrong((id *)&self->_layoutElement, a4);
  if (self->_layoutState != v15)
    objc_storeStrong((id *)&self->_layoutState, a5);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  if (!CGRectEqualToRect(self->_referenceFrame, v25))
  {
    self->_referenceFrame.origin.x = x;
    self->_referenceFrame.origin.y = y;
    self->_referenceFrame.size.width = width;
    self->_referenceFrame.size.height = height;
  }
  if (!self->_displayLayoutElement)
  {
    v16 = -[SBLayoutElementViewController _newDisplayLayoutElementForEntity:](self, "_newDisplayLayoutElementForEntity:", v13);
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = v16;

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__SBLayoutElementViewController_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame___block_invoke;
  v19[3] = &unk_1E8EAFA40;
  v20 = v14;
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  v18 = v14;
  -[SBLayoutElementViewController _updateDisplayLayoutElementWithBuilder:](self, "_updateDisplayLayoutElementWithBuilder:", v19);

}

void __106__SBLayoutElementViewController_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLayoutRole:", SBSDisplayLayoutRoleForLayoutRole(objc_msgSend(v3, "layoutRole")));
  objc_msgSend(v4, "setLevel:", 1);
  objc_msgSend(v4, "setReferenceFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (id)animationControllerForTransitionRequest:(id)a3
{
  return 0;
}

- (void)prepareForReuse
{
  BSInvalidatable *displayLayoutElementAssertion;
  SBSDisplayLayoutElement *displayLayoutElement;
  SBSDisplayLayoutElement *v5;
  SBLayoutElement *layoutElement;
  SBLayoutState *layoutState;

  self->_isViewVisible = 0;
  self->_isTransitioningVisibility = 0;
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = 0;

  }
  v5 = self->_displayLayoutElement;
  self->_displayLayoutElement = 0;

  layoutElement = self->_layoutElement;
  self->_layoutElement = 0;

  layoutState = self->_layoutState;
  self->_layoutState = 0;

  -[SBLayoutElementViewController setContentWrapperInterfaceOrientation:](self, "setContentWrapperInterfaceOrientation:", 1);
}

- (void)willBeginTransitionToVisible:(BOOL)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLayoutElementViewController layoutElement](self, "layoutElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ will begin transition to visible %{public}@", (uint8_t *)&v11, 0x20u);

  }
  self->_isViewVisible = a3;
  self->_isTransitioningVisibility = 1;
  -[SBLayoutElementViewController _updateDisplayLayoutElementVisibility](self, "_updateDisplayLayoutElementVisibility");
}

- (void)didEndTransitionToVisible:(BOOL)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLayoutElementViewController layoutElement](self, "layoutElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ did end transition to visible %{public}@", (uint8_t *)&v11, 0x20u);

  }
  self->_isViewVisible = a3;
  self->_isTransitioningVisibility = 0;
  -[SBLayoutElementViewController _updateDisplayLayoutElementVisibility](self, "_updateDisplayLayoutElementVisibility");
}

- (void)_updateDisplayLayoutElementVisibility
{
  BSInvalidatable *displayLayoutElementAssertion;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *v7;
  id v8;

  if (self->_isViewVisible && !self->_isTransitioningVisibility)
  {
    if (-[SBLayoutElementViewController _shouldDisplayLayoutElementBecomeActive](self, "_shouldDisplayLayoutElementBecomeActive"))
    {
      goto LABEL_6;
    }
LABEL_10:
    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
LABEL_12:

    return;
  }
  if (!self->_isViewVisible)
    goto LABEL_10;
LABEL_6:
  if (self->_displayLayoutElement && !self->_displayLayoutElementAssertion)
  {
    -[SBLayoutElementViewController _sbWindowScene](self, "_sbWindowScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayLayoutPublisher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addElement:", self->_displayLayoutElement);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v6;

    displayLayoutElementAssertion = (BSInvalidatable *)v8;
    goto LABEL_12;
  }
}

- (void)_updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v4)(id, SBSDisplayLayoutElement *);
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v10;
  BSInvalidatable *v11;
  void (*v12)(void);
  id v13;

  if (self->_displayLayoutElementAssertion)
  {
    v4 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    -[SBLayoutElementViewController _sbWindowScene](self, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayLayoutPublisher");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transitionAssertionWithReason:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v4[2](v4, self->_displayLayoutElement);
    objc_msgSend(v13, "addElement:", self->_displayLayoutElement);
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v10;

    objc_msgSend(v8, "invalidate");
  }
  else
  {
    v12 = (void (*)(void))*((_QWORD *)a3 + 2);
    v13 = a3;
    v12();
  }

}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s is not implemented by subclass."), "-[SBLayoutElementViewController _newDisplayLayoutElementForEntity:]");
  return 0;
}

- (BOOL)_shouldDisplayLayoutElementBecomeActive
{
  return 1;
}

- (id)sourceView
{
  return self->_contentContainerView;
}

- (id)initialCornerRadiusConfiguration
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", 0.0);
}

- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters
{
  return self;
}

- (SBDragPreviewShadowParameters)initialRimShadowParameters
{
  return self;
}

- (id)initialDiffuseShadowFilters
{
  return 0;
}

- (id)initialRimShadowFilters
{
  return 0;
}

- (id)containerViewForBlurContentView
{
  return self->_contentContainerView;
}

- (UIView)_contentContainerView
{
  return self->_contentContainerView;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (SBLayoutElement)layoutElement
{
  return self->_layoutElement;
}

- (SBLayoutState)layoutState
{
  return self->_layoutState;
}

- (CGRect)referenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceFrame.origin.x;
  y = self->_referenceFrame.origin.y;
  width = self->_referenceFrame.size.width;
  height = self->_referenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)supportedContentInterfaceOrientations
{
  return self->_supportedContentInterfaceOrientations;
}

- (int64_t)contentWrapperInterfaceOrientation
{
  return self->_contentWrapperInterfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_layoutElement, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

- (id)mainWorkspaceApplicationSceneLayoutElementViewController
{
  return 0;
}

@end
