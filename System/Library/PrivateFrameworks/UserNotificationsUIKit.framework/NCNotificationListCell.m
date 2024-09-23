@implementation NCNotificationListCell

- (NCNotificationListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NCNotificationListCell *v7;
  uint64_t v8;
  UIView *contentView;
  void *v10;
  void *v11;
  uint64_t v12;
  PLSwipeInteraction *swipeInteraction;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationListCell;
  v7 = -[NCNotificationListCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v8;

    -[NCNotificationListCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("ListCell"));
    -[UIView setAccessibilityIdentifier:](v7->_contentView, "setAccessibilityIdentifier:", CFSTR("ListCell.ContentView"));
    -[NCNotificationListCell addSubview:](v7, "addSubview:", v7->_contentView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCell setBackgroundColor:](v7, "setBackgroundColor:", v10);

    -[NCNotificationListCell layer](v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    v7->_disableDimming = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F8]), "initWithDelegate:", v7);
    swipeInteraction = v7->_swipeInteraction;
    v7->_swipeInteraction = (PLSwipeInteraction *)v12;

    -[NCNotificationListCell addInteraction:](v7, "addInteraction:", v7->_swipeInteraction);
  }
  return v7;
}

- (void)setContentViewController:(id)a3
{
  NCNotificationListDimmable *v5;
  NCNotificationListDimmable *contentViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NCNotificationListDimmable *v11;

  v5 = (NCNotificationListDimmable *)a3;
  contentViewController = self->_contentViewController;
  v11 = v5;
  if (contentViewController != v5)
  {
    -[NCNotificationListDimmable view](contentViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeStrong((id *)&self->_contentViewController, a3);
    -[NCNotificationListCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListDimmable view](v11, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[NCNotificationListCell setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[NCNotificationListDimmable overrideUserInterfaceStyle](self->_contentViewController, "overrideUserInterfaceStyle"));
    -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self->_swipeInteraction, "hideActionsAnimated:fastAnimation:completion:", 0, 0, 0);
    -[NCNotificationListCell notificationViewController](self, "notificationViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundAlpha:", self->_backgroundAlpha);

    -[NCNotificationListCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContentUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[NCNotificationListCell notificationViewController](self, "notificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setInteractionEnabled:", v3);
  }
  else
  {
    -[NCNotificationListCell contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", v3);

  }
}

- (void)setBackgroundAlpha:(double)a3
{
  void *v4;

  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[NCNotificationListCell notificationViewController](self, "notificationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundAlpha:", self->_backgroundAlpha);

    -[NCNotificationListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDisableDimming:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_disableDimming != a3)
  {
    v3 = a3;
    self->_disableDimming = a3;
    -[NCNotificationListCell notificationViewController](self, "notificationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisableDimming:", v3);

    -[NCNotificationListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideDate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_hideDate != a3)
  {
    v3 = a3;
    self->_hideDate = a3;
    -[NCNotificationListCell notificationViewController](self, "notificationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHideDate:", v3);

    -[NCNotificationListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isContentUserInteractionEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[NCNotificationListCell notificationViewController](self, "notificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isInteractionEnabled");
  }
  else
  {
    -[NCNotificationListCell contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isUserInteractionEnabled");

  }
  return v5;
}

- (void)hideActionButtonsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5
{
  -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self->_swipeInteraction, "hideActionsAnimated:fastAnimation:completion:", a3, a4, a5);
}

- (void)hintSideSwipeForDefaultAction
{
  -[PLSwipeInteraction hintActionsForLayoutLocation:](self->_swipeInteraction, "hintActionsForLayoutLocation:", 0);
}

- (void)revealSupplementaryActionsWithCompletion:(id)a3
{
  -[PLSwipeInteraction revealActionsForLayoutLocation:completion:](self->_swipeInteraction, "revealActionsForLayoutLocation:completion:", 1, a3);
}

- (id)senderForActionWithIdentifier:(id)a3
{
  return (id)-[PLSwipeInteraction senderForActionWithIdentifier:](self->_swipeInteraction, "senderForActionWithIdentifier:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListCell;
  -[NCNotificationListCell layoutSubviews](&v4, sel_layoutSubviews);
  -[NCNotificationListCell _layoutContentView](self, "_layoutContentView");
  -[NCNotificationListCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "subviewDidLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationListCell contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (PLSwipeInteraction)swipeInteraction
{
  return self->_swipeInteraction;
}

- (void)_layoutContentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[NCNotificationListCell bounds](self, "bounds");
  -[UIView frame](self->_contentView, "frame");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[NCNotificationListCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[NCNotificationListDimmable view](self->_contentViewController, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v7, v8, v4, v6);

}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  NCNotificationListDimmable *contentViewController;
  __int128 v4;
  _OWORD v5[3];

  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    v4 = *(_OWORD *)&a3->c;
    v5[0] = *(_OWORD *)&a3->a;
    v5[1] = v4;
    v5[2] = *(_OWORD *)&a3->tx;
    -[NCNotificationListDimmable configureStackDimmingForTransform:](contentViewController, "configureStackDimmingForTransform:", v5);
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v5 = a3;
  -[PLSwipeInteraction setMaterialGroupNameBase:](self->_swipeInteraction, "setMaterialGroupNameBase:", v5);

}

- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationListCell actionProvider](self, "actionProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "shouldContinuePresentingActionButtonsForNotificationListCell:", self);
  else
    v5 = 0;

  return v5;
}

- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NCNotificationListCell actionProvider](self, "actionProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "supplementaryActionsForNotificationListCell:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (a4 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v6, "defaultActionForNotificationListCell:", self);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

LABEL_9:
  return v9;
}

- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4
{
  void *v6;
  char v7;
  BOOL v8;

  -[NCNotificationListCell actionProvider](self, "actionProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "shouldShowSupplementaryActionsForNotificationListCell:", self);
      goto LABEL_7;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (a4 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  v7 = objc_msgSend(v6, "shouldShowDefaultActionForNotificationListCell:", self);
LABEL_7:
  v8 = v7;
LABEL_9:

  return v8;
}

- (id)viewToMoveForSwipeInteraction:(id)a3
{
  return self->_contentView;
}

- (int64_t)buttonsRecipeForSwipeInteraction:(id)a3
{
  return self->_materialRecipe;
}

- (id)buttonsTintColorForSwipeInteraction:(id)a3
{
  return self->_materialTintColor;
}

- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3
{
  return 23.5;
}

- (void)swipeInteractionDidBeginHidingActions:(id)a3
{
  UIView *contentView;
  id v5;
  id v6;

  contentView = self->_contentView;
  v5 = a3;
  -[UIView setUserInteractionEnabled:](contentView, "setUserInteractionEnabled:", 1);
  -[NCNotificationListCell setContentUserInteractionEnabled:](self, "setContentUserInteractionEnabled:", 1);
  -[NCNotificationListCell actionHandler](self, "actionHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListCell:didBeginHidingActionsForSwipeInteraction:", self, v5);

}

- (void)swipeInteractionDidBeginRevealingActions:(id)a3
{
  UIView *contentView;
  id v5;
  id v6;

  contentView = self->_contentView;
  v5 = a3;
  -[UIView setUserInteractionEnabled:](contentView, "setUserInteractionEnabled:", 0);
  -[NCNotificationListCell setContentUserInteractionEnabled:](self, "setContentUserInteractionEnabled:", 0);
  -[NCNotificationListCell actionHandler](self, "actionHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListCell:didBeginRevealingActionsForSwipeInteraction:", self, v5);

}

- (void)swipeInteractionDidSignificantUserInteraction:(id)a3
{
  id v4;

  -[NCNotificationListCell actionHandler](self, "actionHandler", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListCellDidSignificantUserInteraction:", self);

}

- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4
{
  id v6;

  -[NCNotificationListCell actionHandler](self, "actionHandler", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListCell:didMoveToNewXPosition:", self, a4);
  if (a4 == 0.0)
    -[NCNotificationListCell _resetClipping](self, "_resetClipping");
  else
    -[NCNotificationListCell _configureClippingIfNecessary](self, "_configureClippingIfNecessary");

}

- (BOOL)shouldVerticallyStackButtonsForSwipeInteraction:(id)a3
{
  NSString *v4;
  char IsAX;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  -[NCNotificationListCell actionProvider](self, "actionProvider");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((IsAX & 1) == 0 && v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      IsAX = objc_msgSend(v7, "shouldVerticallyStackActionButtonsForNotificationListCell:", self);
    else
      IsAX = 0;
  }

  return IsAX;
}

- (void)_configureClippingIfNecessary
{
  if (-[NCNotificationListCell _shouldPerformClipping](self, "_shouldPerformClipping"))
    -[NCNotificationListCell _setupClipping](self, "_setupClipping");
  else
    -[NCNotificationListCell _resetClipping](self, "_resetClipping");
}

- (void)_setupClipping
{
  void *v3;

  -[NCNotificationListCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", 15);

  -[NCNotificationListCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 23.5);
  -[NCNotificationListCell setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)_resetClipping
{
  void *v3;

  -[NCNotificationListCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", 0);

  -[NCNotificationListCell setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (BOOL)_shouldPerformClipping
{
  uint64_t v3;
  void *v4;
  BOOL v6;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v4, "userInterfaceIdiom") == 1 || (unint64_t)(v3 - 3) <= 1)
    && -[NCNotificationListCell _actionHandlerAllowsPerformingClipping](self, "_actionHandlerAllowsPerformingClipping");

  return v6;
}

- (BOOL)_actionHandlerAllowsPerformingClipping
{
  void *v3;
  char v4;

  -[NCNotificationListCell actionHandler](self, "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldPerformClippingForNotificationListCell:", self);
  else
    v4 = 1;

  return v4;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  self->_materialRecipe = a3;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (void)setMaterialTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NCNotificationListDimmable)contentViewController
{
  return self->_contentViewController;
}

- (NCNotificationListCellActionHandling)actionHandler
{
  return (NCNotificationListCellActionHandling *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (NCNotificationListCellActionProviding)actionProvider
{
  return (NCNotificationListCellActionProviding *)objc_loadWeakRetained((id *)&self->_actionProvider);
}

- (void)setActionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_actionProvider, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (BOOL)isSideSwipedWithoutTouch
{
  return self->_sideSwipedWithoutTouch;
}

- (void)setSideSwipedWithoutTouch:(BOOL)a3
{
  self->_sideSwipedWithoutTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_swipeInteraction, 0);
}

- (NCNotificationViewController)notificationViewController
{
  NCNotificationListDimmable *contentViewController;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    contentViewController = self->_contentViewController;
  else
    contentViewController = 0;
  return (NCNotificationViewController *)contentViewController;
}

@end
