@implementation NCNotificationListCoalescingControlsCell

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingControlsCell;
  -[NCNotificationListCoalescingControlsCell layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListCoalescingControlsCell _configureCoalescingControlsViewIfNecessary](self, "_configureCoalescingControlsViewIfNecessary");
  -[NCNotificationListCoalescingControlsCell _layoutCoalescingControlsView](self, "_layoutCoalescingControlsView");
}

- (void)setClearAllText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_clearAllText, a3);
  v5 = a3;
  -[NCNotificationListCoalescingControlsView setClearAllText:](self->_coalescingControlsView, "setClearAllText:", v5);

}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationListCoalescingControlsCell coalescingControlsView](self, "coalescingControlsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetClearButtonStateAnimated:", v3);

}

- (BOOL)dismissModalFullScreenIfNeeded
{
  void *v2;
  char v3;

  -[NCNotificationListCoalescingControlsCell coalescingControlsView](self, "coalescingControlsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissModalFullScreenIfNeeded");

  return v3;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[NCNotificationListCoalescingControlsCell coalescingControlsView](self, "coalescingControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldReceiveTouchAtPointInWindowSpace:", x, y);

  return v6;
}

- (void)setShouldShowCoalescingControls:(BOOL)a3
{
  NCNotificationListCoalescingControlsView *coalescingControlsView;
  double v4;

  if (self->_shouldShowCoalescingControls != a3)
  {
    self->_shouldShowCoalescingControls = a3;
    coalescingControlsView = self->_coalescingControlsView;
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[NCNotificationListCoalescingControlsView setAlpha:](coalescingControlsView, "setAlpha:", v4);
  }
}

+ (double)coalescingControlsCellHeightShowingCoalescingControls:(BOOL)a3
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (a3)
    v3 = 56.0;
  else
    v3 = 28.0;
  +[NCNotificationListCoalescingControlsView labelTextStyle](NCNotificationListCoalescingControlsView, "labelTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", v3);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();

  _NCMainScreenScale();
  UICeilToScale();
  v8 = v7;

  return v8;
}

- (void)notificationListCoalescingControlsViewRequestsClear:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationListCoalescingControlsHandlerRequestsClearingNotifications:", self);
      v5 = v7;
    }
  }

}

- (void)notificationListCoalescingControlsViewRequestsClearAll:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationListCoalescingControlsHandlerRequestsClearingAllNotifications:", self);
      v5 = v7;
    }
  }

}

- (void)notificationListCoalescingControlsViewRequestsRestack:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationListCoalescingControlsHandlerRequestsRestackingNotifications:", self);
      v5 = v7;
    }
  }

}

- (void)notificationListCoalescingControlsView:(id)a3 didTransitionToClearState:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "notificationListCoalescingControlsHandler:didTransitionToClearState:", self, v4);
      v7 = v9;
    }
  }

}

- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "containerViewForCoalescingControlsHandlerPreviewInteractionPresentedContent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notificationListCoalescingControlsViewDidBeginPreviewInteraction:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:", self);

}

- (void)notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:", self);

}

- (void)notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:", self);

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCNotificationListCoalescingControlsView setAdjustsFontForContentSizeCategory:](self->_coalescingControlsView, "setAdjustsFontForContentSizeCategory:");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[NCNotificationListCoalescingControlsCell adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v3 = -[NCNotificationListCoalescingControlsView adjustForContentSizeCategoryChange](self->_coalescingControlsView, "adjustForContentSizeCategoryChange");
    if (v3)
    {
      -[NCNotificationListCoalescingControlsCell setNeedsLayout](self, "setNeedsLayout");
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString **p_materialGroupNameBase;
  id v6;

  p_materialGroupNameBase = &self->_materialGroupNameBase;
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v6 = a3;
  -[NCNotificationListCoalescingControlsView setMaterialGroupNameBase:](self->_coalescingControlsView, "setMaterialGroupNameBase:", *p_materialGroupNameBase);

}

- (void)_configureCoalescingControlsViewIfNecessary
{
  NCNotificationListCoalescingControlsView *v3;
  NCNotificationListCoalescingControlsView *v4;
  NCNotificationListCoalescingControlsView *coalescingControlsView;
  NCNotificationListCoalescingControlsView *v6;
  void *v7;
  double v8;

  if (!self->_coalescingControlsView)
  {
    v3 = [NCNotificationListCoalescingControlsView alloc];
    -[NCNotificationListCoalescingControlsCell bounds](self, "bounds");
    v4 = -[NCNotificationListCoalescingControlsView initWithFrame:](v3, "initWithFrame:");
    coalescingControlsView = self->_coalescingControlsView;
    self->_coalescingControlsView = v4;

    -[NCNotificationListCoalescingControlsView setFooterCell:](self->_coalescingControlsView, "setFooterCell:", self->_footerCell);
    -[NCNotificationListCoalescingControlsView setDelegate:](self->_coalescingControlsView, "setDelegate:", self);
    v6 = self->_coalescingControlsView;
    -[NCNotificationListCoalescingControlsCell materialGroupNameBase](self, "materialGroupNameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingControlsView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v7);

    -[NCNotificationListCoalescingControlsView setClearAllText:](self->_coalescingControlsView, "setClearAllText:", self->_clearAllText);
    -[NCNotificationListCoalescingControlsView setAdjustsFontForContentSizeCategory:](self->_coalescingControlsView, "setAdjustsFontForContentSizeCategory:", -[NCNotificationListCoalescingControlsCell adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    v8 = 1.0;
    if (!self->_shouldShowCoalescingControls)
      v8 = 0.0;
    -[NCNotificationListCoalescingControlsView setAlpha:](self->_coalescingControlsView, "setAlpha:", v8);
    -[NCNotificationListCoalescingControlsCell addSubview:](self, "addSubview:", self->_coalescingControlsView);
  }
}

- (void)_layoutCoalescingControlsView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;
  double Width;
  CGRect v22;
  CGRect v23;

  -[NCNotificationListCoalescingControlsCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationListCoalescingControlsView frame](self->_coalescingControlsView, "frame");
  v12 = v11;
  v14 = v13;
  -[NCNotificationListCoalescingControlsView sizeThatFits:](self->_coalescingControlsView, "sizeThatFits:", v8, v10);
  v16 = v15;
  v18 = v17;
  v19 = -[NCNotificationListCoalescingControlsCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v20 = 0.0;
  if ((v19 & 1) == 0)
  {
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    Width = CGRectGetWidth(v22);
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.width = v16;
    v23.size.height = v18;
    v20 = Width - CGRectGetWidth(v23);
  }
  -[NCNotificationListCoalescingControlsView setFrame:](self->_coalescingControlsView, "setFrame:", v20, 0.0, v16, v18);
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  return (NCNotificationListCoalescingControlsHandlerDelegate *)objc_loadWeakRetained((id *)&self->_handlerDelegate);
}

- (void)setHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_handlerDelegate, a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)shouldShowCoalescingControls
{
  return self->_shouldShowCoalescingControls;
}

- (BOOL)isFooterCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(BOOL)a3
{
  self->_footerCell = a3;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (NCNotificationListCoalescingControlsView)coalescingControlsView
{
  return self->_coalescingControlsView;
}

- (void)setCoalescingControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingControlsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingControlsView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_destroyWeak((id *)&self->_handlerDelegate);
}

@end
