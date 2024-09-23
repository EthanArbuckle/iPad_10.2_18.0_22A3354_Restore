@implementation NCNotificationListCoalescingHeaderCell

+ (CGSize)_coalescingControlsViewPreferredSize
{
  double v2;
  double v3;
  NCNotificationListCoalescingControlsView *v4;
  uint64_t v5;
  uint64_t v6;
  CGSize result;

  v3 = *((double *)&__coalescingControlsViewPreferredSize + 1);
  v2 = *(double *)&__coalescingControlsViewPreferredSize;
  if (*(double *)&__coalescingControlsViewPreferredSize == 0.0
    && *((double *)&__coalescingControlsViewPreferredSize + 1) == 0.0)
  {
    v4 = objc_alloc_init(NCNotificationListCoalescingControlsView);
    -[NCNotificationListCoalescingControlsView setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
    -[NCNotificationListCoalescingControlsView sizeThatFits:](v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    *(_QWORD *)&__coalescingControlsViewPreferredSize = v5;
    *((_QWORD *)&__coalescingControlsViewPreferredSize + 1) = v6;

    v3 = *((double *)&__coalescingControlsViewPreferredSize + 1);
    v2 = *(double *)&__coalescingControlsViewPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)coalescingHeaderCellHeightForWidth:(double)a3 title:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id *v10;
  NSString *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4B58];
  v8 = a4;
  objc_msgSend(v6, "preferredFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  _NCSizeCategoryIsAX(v11);

  if (!coalescingHeaderCellHeightForWidth_title____drawingContext)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v13 = (void *)coalescingHeaderCellHeightForWidth_title____drawingContext;
    coalescingHeaderCellHeightForWidth_title____drawingContext = (uint64_t)v12;

    objc_msgSend((id)coalescingHeaderCellHeightForWidth_title____drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  objc_msgSend(a1, "_coalescingControlsViewPreferredSize");
  v15 = v14;
  objc_msgSend(*v10, "activeInterfaceOrientation");
  v16 = v15 + 0.0;
  v17 = objc_msgSend(*v10, "activeInterfaceOrientation");
  v18 = 6.0;
  if ((unint64_t)(v17 - 1) < 2)
    v18 = 10.0;
  v19 = a3 - (v16 + v18);
  v24 = *MEMORY[0x1E0DC1138];
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v20, coalescingHeaderCellHeightForWidth_title____drawingContext, v19, 0.0);

  objc_msgSend(v9, "lineHeight");
  objc_msgSend((id)coalescingHeaderCellHeightForWidth_title____drawingContext, "numberOfLineFragments");
  _NCMainScreenScale();
  UICeilToScale();
  v22 = v21;

  return v22;
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationListCoalescingHeaderCell coalescingControlsView](self, "coalescingControlsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetClearButtonStateAnimated:", v3);

}

- (BOOL)dismissModalFullScreenIfNeeded
{
  void *v2;
  char v3;

  -[NCNotificationListCoalescingHeaderCell coalescingControlsView](self, "coalescingControlsView");
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
  -[NCNotificationListCoalescingHeaderCell coalescingControlsView](self, "coalescingControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldReceiveTouchAtPointInWindowSpace:", x, y);

  return v6;
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[NCNotificationListHeaderTitleView setTitle:](self->_headerTitleView, "setTitle:", v5);

}

- (void)setClearAllText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_clearAllText, a3);
  v5 = a3;
  -[NCNotificationListCoalescingControlsView setClearAllText:](self->_coalescingControlsView, "setClearAllText:", v5);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingHeaderCell;
  -[NCNotificationListCoalescingHeaderCell layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListCoalescingHeaderCell _configureCoalescingControlsViewIfNecessary](self, "_configureCoalescingControlsViewIfNecessary");
  -[NCNotificationListCoalescingHeaderCell _configureHeaderTitleViewIfNecessary](self, "_configureHeaderTitleViewIfNecessary");
  -[NCNotificationListCoalescingHeaderCell _layoutCoalescingControlsView](self, "_layoutCoalescingControlsView");
  -[NCNotificationListCoalescingHeaderCell _layoutHeaderTitleView](self, "_layoutHeaderTitleView");
}

- (void)notificationListCoalescingControlsViewRequestsClear:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
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

- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
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

- (void)notificationListCoalescingControlsViewRequestsClearAll:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
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

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
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
  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
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

- (void)notificationListCoalescingControlsViewDidBeginPreviewInteraction:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:", self);

}

- (void)notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:", self);

}

- (void)notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingHeaderCell handlerDelegate](self, "handlerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:", self);

}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v5 = a3;
  -[NCNotificationListHeaderTitleView adjustForLegibilitySettingsChange:](self->_headerTitleView, "adjustForLegibilitySettingsChange:", v5);

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    v3 = a3;
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCNotificationListCoalescingHeaderCell coalescingControlsView](self, "coalescingControlsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", v3);

    -[NCNotificationListCoalescingHeaderCell headerTitleView](self, "headerTitleView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", v3);

  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  if (!self->_adjustsFontForContentSizeCategory)
    return 0;
  v3 = -[NCNotificationListCoalescingControlsView adjustForContentSizeCategoryChange](self->_coalescingControlsView, "adjustForContentSizeCategoryChange");
  if (!-[NCNotificationListHeaderTitleView adjustForContentSizeCategoryChange](self->_headerTitleView, "adjustForContentSizeCategoryChange")&& !v3)
  {
    return 0;
  }
  -[NCNotificationListCoalescingHeaderCell setNeedsLayout](self, "setNeedsLayout");
  return 1;
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

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListCoalescingHeaderCell;
  v4 = a3;
  -[NCNotificationListCoalescingHeaderCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[NCNotificationListCoalescingHeaderCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[NCNotificationListCoalescingHeaderCell _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  -[NCNotificationListCoalescingHeaderCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_contentSizeCategoryDidChange
{
  __coalescingControlsViewPreferredSize = *MEMORY[0x1E0C9D820];
}

- (void)_configureCoalescingControlsViewIfNecessary
{
  NCNotificationListCoalescingControlsView *v3;
  NCNotificationListCoalescingControlsView *v4;
  NCNotificationListCoalescingControlsView *coalescingControlsView;
  NCNotificationListCoalescingControlsView *v6;
  void *v7;

  if (!self->_coalescingControlsView)
  {
    v3 = [NCNotificationListCoalescingControlsView alloc];
    -[NCNotificationListCoalescingHeaderCell bounds](self, "bounds");
    v4 = -[NCNotificationListCoalescingControlsView initWithFrame:](v3, "initWithFrame:");
    coalescingControlsView = self->_coalescingControlsView;
    self->_coalescingControlsView = v4;

    -[NCNotificationListCoalescingControlsView setDelegate:](self->_coalescingControlsView, "setDelegate:", self);
    -[NCNotificationListCoalescingControlsView setClearAllText:](self->_coalescingControlsView, "setClearAllText:", self->_clearAllText);
    v6 = self->_coalescingControlsView;
    -[NCNotificationListCoalescingHeaderCell materialGroupNameBase](self, "materialGroupNameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingControlsView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v7);

    -[NCNotificationListCoalescingControlsView setAdjustsFontForContentSizeCategory:](self->_coalescingControlsView, "setAdjustsFontForContentSizeCategory:", -[NCNotificationListCoalescingHeaderCell adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    -[NCNotificationListCoalescingHeaderCell addSubview:](self, "addSubview:", self->_coalescingControlsView);
  }
}

- (void)_configureHeaderTitleViewIfNecessary
{
  NCNotificationListHeaderTitleView *v3;
  NCNotificationListHeaderTitleView *v4;
  NCNotificationListHeaderTitleView *headerTitleView;

  if (!self->_headerTitleView)
  {
    v3 = [NCNotificationListHeaderTitleView alloc];
    -[NCNotificationListCoalescingHeaderCell bounds](self, "bounds");
    v4 = -[NCNotificationListHeaderTitleView initWithFrame:](v3, "initWithFrame:");
    headerTitleView = self->_headerTitleView;
    self->_headerTitleView = v4;

    -[NCNotificationListHeaderTitleView setTitle:](self->_headerTitleView, "setTitle:", self->_title);
    -[NCNotificationListHeaderTitleView adjustForLegibilitySettingsChange:](self->_headerTitleView, "adjustForLegibilitySettingsChange:", self->_legibilitySettings);
    -[NCNotificationListHeaderTitleView setAdjustsFontForContentSizeCategory:](self->_headerTitleView, "setAdjustsFontForContentSizeCategory:", -[NCNotificationListCoalescingHeaderCell adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    -[NCNotificationListCoalescingHeaderCell addSubview:](self, "addSubview:", self->_headerTitleView);
    -[NCNotificationListCoalescingHeaderCell sendSubviewToBack:](self, "sendSubviewToBack:", self->_headerTitleView);
  }
}

- (CGRect)_coalescingControlsViewFrameForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id *v15;
  NSString *v16;
  _BOOL4 IsAX;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat rect;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCNotificationListCoalescingControlsView sizeThatFits:](self->_coalescingControlsView, "sizeThatFits:", a3.size.width, a3.size.height);
  BSRectWithSize();
  rect = v8;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v16);

  v18 = IsAX ^ -[NCNotificationListCoalescingHeaderCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v19 = 0.0;
  if (IsAX)
  {
    if ((unint64_t)(objc_msgSend(*v15, "activeInterfaceOrientation") - 1) >= 2)
      v19 = 6.0;
    else
      v19 = 10.0;
  }
  if ((v18 & 1) == 0)
  {
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v27 = x;
    v20 = y;
    v21 = CGRectGetWidth(v29);
    v30.origin.x = rect;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    v22 = v21 - CGRectGetWidth(v30);
    y = v20;
    x = v27;
    v19 = v22 - v19;
  }
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  CGRectGetHeight(v31);
  v32.origin.x = v19;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  CGRectGetHeight(v32);
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_layoutCoalescingControlsView
{
  -[NCNotificationListCoalescingHeaderCell bounds](self, "bounds");
  -[NCNotificationListCoalescingHeaderCell _coalescingControlsViewFrameForBounds:](self, "_coalescingControlsViewFrameForBounds:");
  -[NCNotificationListCoalescingControlsView setFrame:](self->_coalescingControlsView, "setFrame:");
}

- (void)_layoutHeaderTitleView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *v11;
  NSString *v12;
  _BOOL4 IsAX;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NCNotificationListHeaderTitleView *headerTitleView;
  double Width;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double Height;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[NCNotificationListCoalescingHeaderCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v12);

  -[NCNotificationListCoalescingHeaderCell _coalescingControlsViewFrameForBounds:](self, "_coalescingControlsViewFrameForBounds:", v4, v6, v8, v10);
  rect_24 = v15;
  v39 = v14;
  rect_8 = v16;
  rect_16 = v17;
  if (IsAX)
    v18 = 12.0;
  else
    v18 = 22.0;
  headerTitleView = self->_headerTitleView;
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  Width = CGRectGetWidth(v42);
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  -[NCNotificationListHeaderTitleView sizeThatFits:](headerTitleView, "sizeThatFits:", Width, CGRectGetHeight(v43) - v18);
  BSRectWithSize();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v40 = v23;
  v41 = v27;
  if (!-[NCNotificationListCoalescingHeaderCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    if ((unint64_t)(objc_msgSend(*v11, "activeInterfaceOrientation") - 1) >= 2)
      v33 = 6.0;
    else
      v33 = 10.0;
    if (IsAX)
      goto LABEL_15;
    goto LABEL_8;
  }
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  rect = v22;
  v29 = CGRectGetWidth(v44);
  v30 = objc_msgSend(*v11, "activeInterfaceOrientation");
  v31 = 6.0;
  if ((unint64_t)(v30 - 1) < 2)
    v31 = 10.0;
  v32 = v29 - v31;
  v45.origin.x = rect;
  v45.origin.y = v24;
  v45.size.width = v26;
  v45.size.height = v28;
  v33 = v32 - CGRectGetWidth(v45);
  if (!IsAX)
  {
LABEL_8:
    v46.origin.x = v4;
    v46.origin.y = v6;
    v46.size.width = v8;
    v46.size.height = v10;
    Height = CGRectGetHeight(v46);
    v47.origin.x = v39;
    v47.origin.y = rect_8;
    v47.size.width = rect_24;
    v47.size.height = rect_16;
    if ((unint64_t)(Height / CGRectGetHeight(v47)) >= 2)
    {
      v48.origin.x = v33;
      v48.origin.y = v40;
      v48.size.width = v26;
      v48.size.height = v41;
      CGRectGetHeight(v48);
      v49.origin.x = v39;
      v49.origin.y = rect_8;
      v49.size.width = rect_24;
      v49.size.height = rect_16;
      CGRectGetHeight(v49);
    }
    UIRectCenteredYInRect();
  }
LABEL_15:
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[NCNotificationListHeaderTitleView setFrame:](self->_headerTitleView, "setFrame:");
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

- (NSString)title
{
  return self->_title;
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

- (NCNotificationListHeaderTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleView, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_coalescingControlsView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_destroyWeak((id *)&self->_handlerDelegate);
}

@end
