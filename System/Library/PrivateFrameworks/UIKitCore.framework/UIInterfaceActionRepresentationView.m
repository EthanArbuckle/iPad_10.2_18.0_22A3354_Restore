@implementation UIInterfaceActionRepresentationView

- (UIInterfaceActionRepresentationView)initWithAction:(id)a3
{
  id v5;
  UIInterfaceActionRepresentationView *v6;
  UIInterfaceActionRepresentationView *v7;
  NSString *sectionID;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *minimumWidthConstraint;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *minimumHeightConstraint;
  double v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIInterfaceActionRepresentationView;
  v6 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v7->_ownsActionContent = 1;
    sectionID = v7->_sectionID;
    v7->_sectionID = (NSString *)&stru_1E16EDF20;

    -[UIInterfaceAction _addActionDisplayPropertyObserver:](v7->_action, "_addActionDisplayPropertyObserver:", v7);
    v7->_canRemoveContentFromHierarchyWhenNotVisible = 0;
    -[UIView widthAnchor](v7, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    minimumWidthConstraint = v7->_minimumWidthConstraint;
    v7->_minimumWidthConstraint = (NSLayoutConstraint *)v10;

    -[UIView heightAnchor](v7, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 0.0);
    v13 = objc_claimAutoreleasedReturnValue();
    minimumHeightConstraint = v7->_minimumHeightConstraint;
    v7->_minimumHeightConstraint = (NSLayoutConstraint *)v13;

    LODWORD(v15) = 1148829696;
    -[NSLayoutConstraint setPriority:](v7->_minimumHeightConstraint, "setPriority:", v15);
    -[UIView setFocusEffect:](v7, "setFocusEffect:", 0);
    -[UIInterfaceActionRepresentationView _initializeHorizontalMarginsForAction](v7, "_initializeHorizontalMarginsForAction");
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionRepresentationView action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ action = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInterfaceAction _removeActionDisplayPropertyObserver:](self->_action, "_removeActionDisplayPropertyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)_setContentsInsertedIntoViewHierarchy:(BOOL)a3
{
  if (self->_contentsInsertedIntoViewHierarchy != a3)
  {
    self->_contentsInsertedIntoViewHierarchy = a3;
    -[UIInterfaceActionRepresentationView updateContentsInsertedIntoHierarchy](self, "updateContentsInsertedIntoHierarchy");
  }
}

- (void)invokeInterfaceAction
{
  id v2;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invokeHandlerWithCompletionBlock:", &__block_literal_global_10);

}

- (UIInterfaceActionVisualStyle)visualStyle
{
  void *v2;
  void *v3;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInterfaceActionVisualStyle *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIInterfaceActionRepresentationView _updateHighlightAndPressedFeedback](self, "_updateHighlightAndPressedFeedback");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[UIInterfaceActionRepresentationView _updateHighlightAndPressedFeedback](self, "_updateHighlightAndPressedFeedback");
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    -[UIInterfaceActionRepresentationView _applyVisualStyle](self, "_applyVisualStyle");
  }
}

- (void)setCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3
{
  if (self->_enforcedCanRemoveContentFromHierarchyWhenNotVisible)
    *(_DWORD *)&a3 = self->_enforcedCanRemoveContentFromHierarchyWhenNotVisibleValue;
  if (self->_canRemoveContentFromHierarchyWhenNotVisible != a3)
  {
    self->_canRemoveContentFromHierarchyWhenNotVisible = a3;
    if (a3)
      -[UIInterfaceActionRepresentationView _removeLoadedContentsFromHierarchyIfNotVisible](self, "_removeLoadedContentsFromHierarchyIfNotVisible");
  }
}

- (BOOL)hasLayoutHeightConstraintsIdenticalToRepresentationView:(id)a3
{
  return 0;
}

- (void)_enforceActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3
{
  self->_enforcedCanRemoveContentFromHierarchyWhenNotVisibleValue = a3;
  self->_enforcedCanRemoveContentFromHierarchyWhenNotVisible = 1;
  -[UIInterfaceActionRepresentationView setCanRemoveContentFromHierarchyWhenNotVisible:](self, "setCanRemoveContentFromHierarchyWhenNotVisible:", 1);
  -[UIInterfaceActionRepresentationView _updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary](self, "_updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary");
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v5 = a4;
  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionPropertiesAffectingActionRepresentationViewStyling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v5, v6);

  if (v7)
  {
    -[UIInterfaceActionRepresentationView _actionViewState](self, "_actionViewState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configureAttributesForActionRepresentationView:actionViewState:", self, v8);

  }
}

- (void)updateConstraints
{
  objc_super v3;

  -[UIInterfaceActionRepresentationView _updateFittingContentSizingViewToFitSize](self, "_updateFittingContentSizingViewToFitSize");
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__UIInterfaceActionRepresentationView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UIView _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:](self, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v3);
}

uint64_t __53__UIInterfaceActionRepresentationView_layoutSubviews__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_loadContentsIntoHierarchyAndPrepareIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_updateFittingContentSizingViewToFitSize");
  objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[57];
  objc_msgSend(v2, "bounds");
  return objc_msgSend(v3, "setFrame:");
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  -[UIInterfaceActionRepresentationView __fittingContentSizingViewIfNotSelf](self, "__fittingContentSizingViewIfNotSelf");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateIntrinsicContentSize");

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  UIInterfaceActionRepresentationView *v3;
  UIInterfaceActionRepresentationView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  -[UIInterfaceActionRepresentationView _loadContentsIntoHierarchyAndPrepareIfNecessary](self, "_loadContentsIntoHierarchyAndPrepareIfNecessary");
  -[UIInterfaceActionRepresentationView __fittingContentSizingViewAllowingSelf](self, "__fittingContentSizingViewAllowingSelf");
  v3 = (UIInterfaceActionRepresentationView *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInterfaceActionRepresentationView;
    -[UIView intrinsicContentSize](&v11, sel_intrinsicContentSize);
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  -[UIInterfaceActionRepresentationView _fittingContentSizeWithFittingViewSize:](self, "_fittingContentSizeWithFittingViewSize:");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  UIInterfaceActionRepresentationView *v10;
  double v11;
  double v12;
  UIInterfaceActionRepresentationView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIInterfaceActionRepresentationView _loadContentsIntoHierarchyAndPrepareIfNecessary](self, "_loadContentsIntoHierarchyAndPrepareIfNecessary");
  -[UIInterfaceActionRepresentationView __fittingContentSizingViewAllowingSelf](self, "__fittingContentSizingViewAllowingSelf");
  v10 = (UIInterfaceActionRepresentationView *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10 == self)
  {
    v20.receiver = self;
    v20.super_class = (Class)UIInterfaceActionRepresentationView;
    *(float *)&v11 = a4;
    *(float *)&v12 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  else
  {
    *(float *)&v11 = a4;
    *(float *)&v12 = a5;
    -[UIInterfaceActionRepresentationView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
  }
  -[UIInterfaceActionRepresentationView _fittingContentSizeWithFittingViewSize:](self, "_fittingContentSizeWithFittingViewSize:");
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)_updateFittingContentSizingViewToFitSize
{
  id v3;

  -[UIInterfaceActionRepresentationView __fittingContentSizingViewIfNotSelf](self, "__fittingContentSizingViewIfNotSelf");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView bounds](self, "bounds");
    -[UIInterfaceActionRepresentationView _fittingContentSizingViewFrameInBounds:](self, "_fittingContentSizingViewFrameInBounds:");
    objc_msgSend(v3, "setFrame:");
  }

}

- (id)__fittingContentSizingViewIfNotSelf
{
  UIInterfaceActionRepresentationView *v3;
  UIInterfaceActionRepresentationView *v4;
  UIInterfaceActionRepresentationView *v5;

  -[UIInterfaceActionRepresentationView _fittingContentSizingView](self, "_fittingContentSizingView");
  v3 = (UIInterfaceActionRepresentationView *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
    v3 = 0;
  v5 = v3;

  return v5;
}

- (id)__fittingContentSizingViewAllowingSelf
{
  void *v3;
  void *v4;
  id v5;

  -[UIInterfaceActionRepresentationView _fittingContentSizingView](self, "_fittingContentSizingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (UIEdgeInsets)_fittingContentSizingViewMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIView layoutMargins](self, "layoutMargins");
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (CGSize)_fittingContentSizeWithFittingViewSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIInterfaceActionRepresentationView _fittingContentSizingViewMargins](self, "_fittingContentSizingViewMargins");
  v7 = v6 + width + v5;
  v10 = v9 + height + v8;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGRect)_fittingContentSizingViewFrameInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIInterfaceActionRepresentationView _fittingContentSizingViewMargins](self, "_fittingContentSizingViewMargins");
  v8 = y + v7;
  v11 = width - (v9 + v10);
  v13 = height - (v7 + v12);
  v14 = x + v9;
  v15 = v8;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setSpringLoaded:(BOOL)a3
{
  void *v5;
  void *v6;
  UISpringLoadedInteraction *v7;

  if (-[UIInterfaceActionRepresentationView isSpringLoaded](self, "isSpringLoaded") != a3)
  {
    if (a3)
    {
      v5 = (void *)objc_opt_new();
      v6 = (void *)objc_opt_new();
      v7 = -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:]([UISpringLoadedInteraction alloc], "initWithInteractionBehavior:interactionEffect:activationHandler:", v5, v6, &__block_literal_global_278);

      -[UIInterfaceActionRepresentationView setInteractionForSpringLoading:](self, "setInteractionForSpringLoading:", v7);
    }
    else
    {
      -[UIInterfaceActionRepresentationView setInteractionForSpringLoading:](self, "setInteractionForSpringLoading:", 0);
    }
  }
}

- (void)setInteractionForSpringLoading:(id)a3
{
  UISpringLoadedInteraction *v5;
  UISpringLoadedInteraction *interactionForSpringLoading;
  UISpringLoadedInteraction *v7;

  v5 = (UISpringLoadedInteraction *)a3;
  interactionForSpringLoading = self->_interactionForSpringLoading;
  v7 = v5;
  if (interactionForSpringLoading != v5)
  {
    if (interactionForSpringLoading)
      -[UIView removeInteraction:](self, "removeInteraction:");
    objc_storeStrong((id *)&self->_interactionForSpringLoading, a3);
    if (self->_interactionForSpringLoading)
      -[UIView addInteraction:](self, "addInteraction:");
  }

}

- (BOOL)_showsFocusForFocusedView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)canBecomeFocused
{
  void *v2;
  char v3;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInterfaceActionRepresentationView;
  v6 = a3;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIInterfaceActionRepresentationView _showsFocusForFocusedView:](self, "_showsFocusForFocusedView:", v7);

  objc_msgSend(v6, "previouslyFocusedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = -[UIInterfaceActionRepresentationView _showsFocusForFocusedView:](self, "_showsFocusForFocusedView:", v9);
  if (v8 != (_DWORD)v6)
  {
    -[UIInterfaceActionRepresentationView setHighlighted:](self, "setHighlighted:", v8);
    -[UIInterfaceActionRepresentationView action](self, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setIsFocused:", v8);

    if (!v8)
      -[UIInterfaceActionRepresentationView _showVisualFeedbackForPressed:](self, "_showVisualFeedbackForPressed:", 0);
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[UIInterfaceActionRepresentationView _handleVisualFeedbackForPress:pressed:](self, "_handleVisualFeedbackForPress:pressed:", v6, 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[UIInterfaceActionRepresentationView _handleVisualFeedbackForPress:pressed:](self, "_handleVisualFeedbackForPress:pressed:", v6, 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    -[UIResponder pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[UIInterfaceActionRepresentationView _handleVisualFeedbackForPress:pressed:](self, "_handleVisualFeedbackForPress:pressed:", v6, 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[UIInterfaceActionRepresentationView _handleVisualFeedbackForPress:pressed:](self, "_handleVisualFeedbackForPress:pressed:", v6, 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (BOOL)_handleVisualFeedbackForPress:(id)a3 pressed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;

  v4 = a4;
  v6 = -[UIInterfaceActionRepresentationView _shouldShowPressFeedbackForEventWithPresses:](self, "_shouldShowPressFeedbackForEventWithPresses:", a3);
  if (v6)
    -[UIInterfaceActionRepresentationView _showVisualFeedbackForPressed:](self, "_showVisualFeedbackForPressed:", v4);
  return v6;
}

- (BOOL)_shouldShowPressFeedbackForEventWithPresses:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");
  if (v5 == 4)
  {
    v6 = 1;
  }
  else if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    -[UIInterfaceActionRepresentationView action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "type") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_showVisualFeedbackForPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[UIInterfaceActionRepresentationView _updateHighlightAndPressedFeedback](self, "_updateHighlightAndPressedFeedback");
  }
}

- (void)_applyVisualStyle
{
  -[UIInterfaceActionRepresentationView _applyVisualStyleToMinimumSizeConstraints](self, "_applyVisualStyleToMinimumSizeConstraints");
  -[UIInterfaceActionRepresentationView _applyVisualStyleToLayoutMargins](self, "_applyVisualStyleToLayoutMargins");
  -[UIInterfaceActionRepresentationView _applyVisualStyleToBackgroundViewAndHighlighting](self, "_applyVisualStyleToBackgroundViewAndHighlighting");
}

- (void)_applyVisualStyleToMinimumSizeConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  void (**v9)(void *, NSLayoutConstraint *, double);
  _QWORD aBlock[4];
  BOOL v11;

  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumActionContentSize");
  v5 = v4;
  v7 = v6;
  if (-[UIInterfaceActionRepresentationView _fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:](self, "_fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:"))
  {
    v8 = !self->_contentsInsertedIntoViewHierarchy;
  }
  else
  {
    v8 = 1;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__UIInterfaceActionRepresentationView__applyVisualStyleToMinimumSizeConstraints__block_invoke;
  aBlock[3] = &__block_descriptor_33_e31_v24__0__NSLayoutConstraint_8d16l;
  v11 = v8;
  v9 = (void (**)(void *, NSLayoutConstraint *, double))_Block_copy(aBlock);
  v9[2](v9, self->_minimumWidthConstraint, v5);
  v9[2](v9, self->_minimumHeightConstraint, v7);

}

void __80__UIInterfaceActionRepresentationView__applyVisualStyleToMinimumSizeConstraints__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3 > 0.0 && *(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v5, "setConstant:", a3);
    objc_msgSend(v6, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v5, "setActive:", 0);
    objc_msgSend(v6, "setConstant:", 0.0);
  }

}

- (BOOL)_fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  char v6;

  height = a3.height;
  width = a3.width;
  -[UIInterfaceActionRepresentationView _fittingContentSizingView](self, "_fittingContentSizingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "hasActiveMinimumSizeConstraintsWithSize:", width, height);
  else
    v6 = 0;

  return v6;
}

- (void)_setHorizontalMargins:(UIEdgeInsets)a3 preservesSuperviewLayoutMargins:(BOOL)a4
{
  _BOOL8 v4;
  double right;
  double left;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a4;
  right = a3.right;
  left = a3.left;
  -[UIView layoutMargins](self, "layoutMargins", a3.top, a3.left, a3.bottom);
  if (left != v11
    || (v8 == 0.0 ? (v12 = right == v10) : (v12 = 0),
        !v12 || v9 != 0.0 || -[UIView preservesSuperviewLayoutMargins](self, "preservesSuperviewLayoutMargins") != v4))
  {
    -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", v4);
    -[UIView setLayoutMargins:](self, "setLayoutMargins:", 0.0, left, 0.0, right);
    -[UIInterfaceActionRepresentationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_initializeHorizontalMarginsForAction
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInterfaceActionRepresentationView _applyVisualStyleToLayoutMargins](self, "_applyVisualStyleToLayoutMargins");
  }
  else
  {
    -[UIInterfaceActionRepresentationView action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_typeForDeterminingViewRepresentation");

    if (v5 == 100)
      -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 1, 0.0, 0.0, 0.0, 0.0);
  }
}

- (void)_applyVisualStyleToLayoutMargins
{
  void *v3;
  uint64_t v4;
  id v5;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_typeForDeterminingViewRepresentation");

  if (v4 == 100)
  {
    -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 1, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentMargin");
    -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 0);

  }
}

- (void)_reloadBackgroundHighlightView
{
  void *v3;
  void *v4;
  void *v5;
  UIInterfaceActionVisualBackgroundDisplaying **p_backgroundHighlightView;
  UIInterfaceActionVisualBackgroundDisplaying *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIInterfaceActionVisualBackgroundDisplaying *v37;
  void *v38;
  id v39;

  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v39 = v3;
    -[UIInterfaceActionRepresentationView _actionViewState](self, "_actionViewState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v39, "newActionBackgroundViewForViewState:", v4);

    p_backgroundHighlightView = &self->_backgroundHighlightView;
    v7 = self->_backgroundHighlightView;
    v8 = v5;
    v9 = objc_opt_class();
    if (v9 == objc_opt_class() && (v8 != 0) != (v7 == 0))
    {
      objc_msgSend(v8, "alpha");
      v11 = v10;
      -[UIInterfaceActionVisualBackgroundDisplaying alpha](v7, "alpha");
      if (vabdd_f64(v11, v12) <= 0.00000011920929)
      {
        objc_msgSend(v8, "backgroundColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          +[UIColor clearColor](UIColor, "clearColor");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        -[UIInterfaceActionVisualBackgroundDisplaying backgroundColor](v7, "backgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = v17;
        }
        else
        {
          +[UIColor clearColor](UIColor, "clearColor");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = v19;

        if (objc_msgSend(v16, "isEqual:", v20))
        {
          objc_msgSend(v8, "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "filters");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v38 = v16;
          v24 = MEMORY[0x1E0C9AA60];
          v25 = (void *)(v22 ? v22 : MEMORY[0x1E0C9AA60]);
          v26 = v25;

          -[UIInterfaceActionVisualBackgroundDisplaying layer](v7, "layer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "filters");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          v30 = (void *)(v28 ? v28 : v24);
          v31 = v30;

          v32 = objc_msgSend(v26, "isEqual:", v31);
          v16 = v38;

          if (v32)
          {
            objc_msgSend(v8, "_cornerRadius");
            v34 = v33;
            -[UIInterfaceActionVisualBackgroundDisplaying _cornerRadius](v7, "_cornerRadius");
            v36 = vabdd_f64(v34, v35);

            if (v36 <= 0.00000011920929)
            {
LABEL_25:
              self->_hasLoadedBackgroundView = 1;
              -[UIView setNeedsLayout](self, "setNeedsLayout", v38);

              v3 = v39;
              goto LABEL_26;
            }
LABEL_23:
            -[UIInterfaceActionVisualBackgroundDisplaying removeFromSuperview](*p_backgroundHighlightView, "removeFromSuperview", v38);
            v37 = *p_backgroundHighlightView;
            *p_backgroundHighlightView = 0;

            if (v8)
            {
              -[UIView bounds](self, "bounds");
              objc_msgSend(v8, "setFrame:");
              objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
              objc_msgSend(v8, "setUserInteractionEnabled:", 0);
              objc_msgSend(v8, "layoutBelowIfNeeded");
              -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
              objc_storeStrong((id *)&self->_backgroundHighlightView, v5);
            }
            goto LABEL_25;
          }
        }

      }
    }

    goto LABEL_23;
  }
LABEL_26:

}

- (BOOL)isFocused
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionRepresentationView;
  if (-[UIView isFocused](&v6, sel_isFocused))
    return 1;
  -[UIInterfaceActionRepresentationView __fittingContentSizingViewIfNotSelf](self, "__fittingContentSizingViewIfNotSelf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isFocused");

  return v3;
}

- (void)_updateHighlightAndPressedFeedback
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  -[UIInterfaceActionRepresentationView _reloadBackgroundHighlightView](self, "_reloadBackgroundHighlightView");
  -[UIInterfaceActionVisualBackgroundDisplaying setPressed:](self->_backgroundHighlightView, "setPressed:", -[UIInterfaceActionRepresentationView isPressed](self, "isPressed"));
  -[UIInterfaceActionVisualBackgroundDisplaying setHighlighted:](self->_backgroundHighlightView, "setHighlighted:", -[UIInterfaceActionRepresentationView isHighlighted](self, "isHighlighted"));
  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0x1E16EFB60;
  v19[1] = 0x1E16EFB80;
  v19[2] = 0x1E16EFB40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPropertiesAffectingActionRepresentationViewStyling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v4, v5);

  if (v6)
  {
    -[UIInterfaceActionRepresentationView _actionViewState](self, "_actionViewState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configureAttributesForActionRepresentationView:actionViewState:", self, v7);

  }
  v14 = 0u;
  v15 = 0u;
  if (-[UIInterfaceActionRepresentationView isHighlighted](self, "isHighlighted"))
    v8 = 0.0;
  else
    v8 = 1.0;
  v16 = 0uLL;
  v17 = 0uLL;
  -[UIInterfaceActionRepresentationView viewsToDisappearWhenHighlighted](self, "viewsToDisappearWhenHighlighted", (_QWORD)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setAlpha:", v8);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_loadContentsIntoHierarchyAndPrepareIfNecessary
{
  if (self->_hasLoadedContentFirstTime
    || !-[UIInterfaceActionRepresentationView _canLoadContentsIntoHierarchy](self, "_canLoadContentsIntoHierarchy"))
  {
    -[UIInterfaceActionRepresentationView _addLoadedContentsToHierarchyIfAllowed](self, "_addLoadedContentsToHierarchyIfAllowed");
  }
  else
  {
    -[UIInterfaceActionRepresentationView _addLoadedContentsToHierarchyFirstTime](self, "_addLoadedContentsToHierarchyFirstTime");
  }
}

- (void)_updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary
{
  if (self->_contentsInsertedIntoViewHierarchy)
    -[UIInterfaceActionRepresentationView _removeLoadedContentsFromHierarchyIfNotVisible](self, "_removeLoadedContentsFromHierarchyIfNotVisible");
  else
    -[UIInterfaceActionRepresentationView _loadContentsIntoHierarchyAndPrepareIfNecessary](self, "_loadContentsIntoHierarchyAndPrepareIfNecessary");
}

- (void)_addLoadedContentsToHierarchyFirstTime
{
  UIInterfaceAction *action;
  id v4;

  self->_hasLoadedContentFirstTime = 1;
  -[UIInterfaceActionRepresentationView loadContents](self, "loadContents");
  -[UIInterfaceActionRepresentationView _setContentsInsertedIntoViewHierarchy:](self, "_setContentsInsertedIntoViewHierarchy:", 1);
  -[UIInterfaceActionRepresentationView interfaceAction:reloadDisplayedContentActionProperties:](self, "interfaceAction:reloadDisplayedContentActionProperties:", self->_action, 0);
  action = self->_action;
  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionRepresentationView interfaceAction:reloadDisplayedContentVisualStyle:](self, "interfaceAction:reloadDisplayedContentVisualStyle:", action, v4);

}

- (void)_addLoadedContentsToHierarchyIfAllowed
{
  if (!self->_contentsInsertedIntoViewHierarchy)
  {
    if (-[UIInterfaceActionRepresentationView _canLoadContentsIntoHierarchy](self, "_canLoadContentsIntoHierarchy"))
      -[UIInterfaceActionRepresentationView _setContentsInsertedIntoViewHierarchy:](self, "_setContentsInsertedIntoViewHierarchy:", 1);
  }
}

- (void)_removeLoadedContentsFromHierarchyIfNotVisible
{
  if (self->_contentsInsertedIntoViewHierarchy
    && !-[UIInterfaceActionRepresentationView _isVisibleWithinContainmentAncestor](self, "_isVisibleWithinContainmentAncestor")&& self->_canRemoveContentFromHierarchyWhenNotVisible)
  {
    -[UIInterfaceActionRepresentationView _setContentsInsertedIntoViewHierarchy:](self, "_setContentsInsertedIntoViewHierarchy:", 0);
  }
}

- (BOOL)_canLoadContentsIntoHierarchy
{
  if (!self->_ownsActionContent)
    return 0;
  if (self->_canRemoveContentFromHierarchyWhenNotVisible)
    return -[UIInterfaceActionRepresentationView _isVisibleWithinContainmentAncestor](self, "_isVisibleWithinContainmentAncestor");
  return 1;
}

- (BOOL)_isVisibleWithinContainmentAncestor
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[UIView _enclosingInterfaceActionGroupView](self, "_enclosingInterfaceActionGroupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView bounds](self, "bounds");
    objc_msgSend(v3, "convertRect:fromView:", self);
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    if (CGRectIsEmpty(v14))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "bounds");
      v16.origin.x = v9;
      v16.origin.y = v10;
      v16.size.width = v11;
      v16.size.height = v12;
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      v8 = CGRectIntersectsRect(v15, v16);
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_viewDisplayingBackground
{
  return self->_backgroundHighlightView;
}

- (void)_clearBackgroundPressedState
{
  -[UIInterfaceActionVisualBackgroundDisplaying setPressed:](self->_backgroundHighlightView, "setPressed:", 0);
}

- (id)_actionViewState
{
  void *v3;
  void *v4;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInterfaceActionViewState viewStateForActionRepresentationView:action:](UIInterfaceActionViewState, "viewStateForActionRepresentationView:action:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_contentsInsertedIntoViewHierarchy
{
  return self->_contentsInsertedIntoViewHierarchy;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (BOOL)ownsActionContent
{
  return self->_ownsActionContent;
}

- (void)setOwnsActionContent:(BOOL)a3
{
  self->_ownsActionContent = a3;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (id)actionViewStateContext
{
  return self->_actionViewStateContext;
}

- (void)setActionViewStateContext:(id)a3
{
  objc_storeStrong(&self->_actionViewStateContext, a3);
}

- (UIInterfaceActionVisualBackgroundDisplaying)backgroundHighlightView
{
  return self->_backgroundHighlightView;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (NSArray)viewsToDisappearWhenHighlighted
{
  return self->_viewsToDisappearWhenHighlighted;
}

- (void)setViewsToDisappearWhenHighlighted:(id)a3
{
  objc_storeStrong((id *)&self->_viewsToDisappearWhenHighlighted, a3);
}

- (BOOL)canRemoveContentFromHierarchyWhenNotVisible
{
  return self->_canRemoveContentFromHierarchyWhenNotVisible;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (UISpringLoadedInteraction)interactionForSpringLoading
{
  return self->_interactionForSpringLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionForSpringLoading, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_viewsToDisappearWhenHighlighted, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundHighlightView, 0);
  objc_storeStrong(&self->_actionViewStateContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
