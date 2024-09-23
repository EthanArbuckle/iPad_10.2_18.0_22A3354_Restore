@implementation NCNotificationListCoalescingControlsView

+ (double)preferredHeight
{
  double result;

  +[NCToggleControl effectiveHeight:](NCToggleControl, "effectiveHeight:", 1);
  return result;
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  -[NCToggleControlPair setLeadingControlExpanded:animated:](self->_toggleControlPair, "setLeadingControlExpanded:animated:", 1, a3);
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  void *v2;
  char v3;

  -[NCNotificationListCoalescingControlsView _clearButton](self, "_clearButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissModalFullScreenIfNeeded");

  return v3;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BOOL v6;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[NCNotificationListCoalescingControlsView bounds](self, "bounds");
  -[NCNotificationListCoalescingControlsView convertRect:toView:](self, "convertRect:toView:", 0);
  v8.x = x;
  v8.y = y;
  v6 = CGRectContainsPoint(v9, v8);
  return -[NCNotificationListCoalescingControlsView _isClearButtonExpanded](self, "_isClearButtonExpanded") && v6;
}

+ (NSString)labelTextStyle
{
  return (NSString *)(id)*MEMORY[0x1E0DC4AB8];
}

- (void)setClearAllText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_clearAllText, a3);
  v5 = a3;
  -[NCToggleControlPair setClearAllText:](self->_toggleControlPair, "setClearAllText:", v5);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingControlsView;
  -[NCNotificationListCoalescingControlsView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListCoalescingControlsView _configureToggleControlPairIfNecessary](self, "_configureToggleControlPairIfNecessary");
  -[NCNotificationListCoalescingControlsView _layoutToggleControlPair](self, "_layoutToggleControlPair");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationListCoalescingControlsView _configureToggleControlPairIfNecessary](self, "_configureToggleControlPairIfNecessary");
  -[NCToggleControlPair sizeThatFits:](self->_toggleControlPair, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[NCToggleControlPair adjustsFontForContentSizeCategory](self->_toggleControlPair, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[NCNotificationListCoalescingControlsView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[NCNotificationListCoalescingControlsView _configureToggleControlPairIfNecessary](self, "_configureToggleControlPairIfNecessary");
  -[NCToggleControlPair setAdjustsFontForContentSizeCategory:](self->_toggleControlPair, "setAdjustsFontForContentSizeCategory:", v3);
  if (v5 != -[NCNotificationListCoalescingControlsView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))-[NCToggleControlPair adjustForContentSizeCategoryChange](self->_toggleControlPair, "adjustForContentSizeCategoryChange");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NCToggleControlPair adjustForContentSizeCategoryChange](self->_toggleControlPair, "adjustForContentSizeCategoryChange");
  return -[NCToggleControlPair adjustsFontForContentSizeCategory](self->_toggleControlPair, "adjustsFontForContentSizeCategory");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v5 = a3;
  -[NCToggleControlPair setMaterialGroupNameBase:](self->_toggleControlPair, "setMaterialGroupNameBase:", v5);

}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListCoalescingControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "containerViewForCoalescingControlsPreviewInteractionPresentedContent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsViewDidBeginPreviewInteraction:", self);

}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:", self);

}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationListCoalescingControlsView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:", self);

}

- (double)_effectiveButtonHeight
{
  double result;

  result = self->_effectiveButtonHeight;
  if (result == 0.0)
  {
    -[NCNotificationListCoalescingControlsView _effectiveValue:](self, "_effectiveValue:", 34.0);
    self->_effectiveButtonHeight = result;
  }
  return result;
}

- (double)_effectiveHorizontalPadding
{
  double result;

  result = self->_effectiveHorizontalPadding;
  if (result == 0.0)
  {
    -[NCNotificationListCoalescingControlsView _effectiveValue:](self, "_effectiveValue:", 12.0);
    self->_effectiveHorizontalPadding = result;
  }
  return result;
}

- (double)_effectiveVerticalPadding
{
  double result;

  result = self->_effectiveVerticalPadding;
  if (result == 0.0)
  {
    -[NCNotificationListCoalescingControlsView _effectiveValue:](self, "_effectiveValue:", 8.0);
    self->_effectiveVerticalPadding = result;
  }
  return result;
}

- (double)_effectiveValue:(double)a3
{
  void *v4;
  double result;

  if (-[NCNotificationListCoalescingControlsView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scaledValueForValue:", a3);
    _NCMainScreenScale();
    UIRoundToScale();

  }
  _NCMainScreenScale();
  UICeilToScale();
  return result;
}

- (double)_imageDimension
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[NCNotificationListCoalescingControlsView _effectiveButtonHeight](self, "_effectiveButtonHeight");
  v4 = v3;
  -[NCNotificationListCoalescingControlsView _effectiveHorizontalPadding](self, "_effectiveHorizontalPadding");
  v6 = v4 + v5 * -2.0;
  -[NCNotificationListCoalescingControlsView _effectiveButtonHeight](self, "_effectiveButtonHeight");
  return fmin(v6, v7 * 0.5);
}

- (double)_cornerRadius
{
  double v2;

  -[NCNotificationListCoalescingControlsView _effectiveButtonHeight](self, "_effectiveButtonHeight");
  return v2 * 0.5;
}

- (id)_restackButtonTitle
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_SHOW_LESS"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_clearButtonTitle
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIEdgeInsets)_edgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[NCNotificationListCoalescingControlsView _effectiveHorizontalPadding](self, "_effectiveHorizontalPadding");
  v4 = v3;
  -[NCNotificationListCoalescingControlsView _effectiveVerticalPadding](self, "_effectiveVerticalPadding");
  v6 = v4;
  v7 = v5;
  v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)_newRestackButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = !self->_footerCell;
  NCUserNotificationsUIKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCToggleControl showLessControlWithMaterialRecipe:clearAllText:glyphOrientation:](NCToggleControl, "showLessControlWithMaterialRecipe:clearAllText:glyphOrientation:", 1, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setAnchorEdge:", 0);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleRestackTouchUpInside_, 64);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleRestackPrimaryAction_, 0x2000);
  return v6;
}

- (id)_newClearButton
{
  void *v3;
  void *v4;
  void *v5;

  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCToggleControl dismissControlWithMaterialRecipe:clearAllText:](NCToggleControl, "dismissControlWithMaterialRecipe:clearAllText:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setAnchorEdge:", 2);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleClearTouchUpInside_, 64);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleClearPrimaryAction_, 0x2000);
  objc_msgSend(v5, "addTarget:forPreviewInteractionPresentedContentWithAction:", self, sel__handleClearAll_);
  return v5;
}

- (void)_configureToggleControlPairIfNecessary
{
  _QWORD v2[5];

  if (!self->_toggleControlPair)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __82__NCNotificationListCoalescingControlsView__configureToggleControlPairIfNecessary__block_invoke;
    v2[3] = &unk_1E8D1B568;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

uint64_t __82__NCNotificationListCoalescingControlsView__configureToggleControlPairIfNecessary__block_invoke(uint64_t a1)
{
  NCToggleControlPair *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;

  v2 = [NCToggleControlPair alloc];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newRestackButton");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newClearButton");
  v5 = -[NCToggleControlPair initWithLeadingToggleControl:trailingToggleControl:](v2, "initWithLeadingToggleControl:trailingToggleControl:", v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 448);
  *(_QWORD *)(v6 + 448) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setClearAllText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  v8 = *(_QWORD **)(a1 + 32);
  v9 = (void *)v8[56];
  objc_msgSend(v8, "materialGroupNameBase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaterialGroupNameBase:", v10);

  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
}

- (void)_layoutToggleControlPair
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  double v16;
  CGRect v17;

  -[NCNotificationListCoalescingControlsView _configureToggleControlPairIfNecessary](self, "_configureToggleControlPairIfNecessary");
  -[NCNotificationListCoalescingControlsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCToggleControlPair sizeThatFits:](self->_toggleControlPair, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  v15 = -[NCNotificationListCoalescingControlsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v16 = 0.0;
  if ((v15 & 1) == 0)
  {
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    v16 = CGRectGetWidth(v17) - v12;
  }
  -[NCToggleControlPair setFrame:](self->_toggleControlPair, "setFrame:", v16, 0.0, v12, v14);
}

- (void)_handleRestackTouchUpInside:(id)a3
{
  id WeakRetained;

  if (-[NCNotificationListCoalescingControlsView _isClearButtonExpanded](self, "_isClearButtonExpanded", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "notificationListCoalescingControlsView:didTransitionToClearState:", self, 0);

  }
}

- (void)_handleRestackPrimaryAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "notificationListCoalescingControlsViewRequestsRestack:", self);

}

- (void)_handleClearTouchUpInside:(id)a3
{
  id WeakRetained;

  if (!-[NCNotificationListCoalescingControlsView _isClearButtonExpanded](self, "_isClearButtonExpanded", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "notificationListCoalescingControlsView:didTransitionToClearState:", self, 1);

  }
}

- (void)_handleClearPrimaryAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "notificationListCoalescingControlsViewRequestsClear:", self);

}

- (void)_handleClearAll:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "notificationListCoalescingControlsViewRequestsClearAll:", self);
  -[NCNotificationListCoalescingControlsView _clearButton](self, "_clearButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissModalFullScreenIfNeeded");

}

- (id)_clearButton
{
  void *v2;
  void *v3;

  -[NCToggleControlPair toggleControls](self->_toggleControlPair, "toggleControls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isClearButtonExpanded
{
  void *v2;
  char v3;

  -[NCNotificationListCoalescingControlsView _clearButton](self, "_clearButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (NCNotificationListCoalescingControlsViewDelegate)delegate
{
  return (NCNotificationListCoalescingControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFooterCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(BOOL)a3
{
  self->_footerCell = a3;
}

- (NCToggleControlPair)toggleControlPair
{
  return self->_toggleControlPair;
}

- (void)setToggleControlPair:(id)a3
{
  objc_storeStrong((id *)&self->_toggleControlPair, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void)setEffectiveButtonHeight:(double)a3
{
  self->_effectiveButtonHeight = a3;
}

- (void)setEffectiveHorizontalPadding:(double)a3
{
  self->_effectiveHorizontalPadding = a3;
}

- (void)setEffectiveVerticalPadding:(double)a3
{
  self->_effectiveVerticalPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_toggleControlPair, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end
