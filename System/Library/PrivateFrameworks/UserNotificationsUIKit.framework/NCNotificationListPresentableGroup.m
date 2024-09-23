@implementation NCNotificationListPresentableGroup

- (NCNotificationListViewProtocol)listView
{
  NCNotificationListViewProtocol *listView;
  NCNotificationListView *v4;
  uint64_t v5;
  void *v6;
  NCNotificationListViewProtocol *v7;
  NCNotificationListViewProtocol *v8;
  _BOOL4 v9;

  listView = self->_listView;
  if (!listView)
  {
    v4 = [NCNotificationListView alloc];
    v5 = objc_opt_class();
    -[NCNotificationListPresentableGroup purpose](self, "purpose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NCNotificationListView initWithModelType:purpose:](v4, "initWithModelType:purpose:", v5, v6);
    v8 = self->_listView;
    self->_listView = v7;

    -[NCNotificationListViewProtocol setDataSource:](self->_listView, "setDataSource:", self);
    -[NCNotificationListViewProtocol setSupportsGrouping:](self->_listView, "setSupportsGrouping:", 1);
    -[NCNotificationListViewProtocol setGrouped:](self->_listView, "setGrouped:", 1);
    v9 = -[NCNotificationListPresentableGroup shouldImmediatelyReveal](self, "shouldImmediatelyReveal");
    listView = self->_listView;
    if (v9)
    {
      -[NCNotificationListViewProtocol setRevealed:](listView, "setRevealed:", 1);
      -[NCNotificationListViewProtocol setRevealPercentage:](self->_listView, "setRevealPercentage:", 1.0);
      listView = self->_listView;
    }
  }
  return listView;
}

- (BOOL)isGrouped
{
  void *v3;
  char v4;

  if (-[NCNotificationListPresentableGroup count](self, "count") < 2)
    return 0;
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  return v4;
}

- (void)setGrouped:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a4;
  v5 = a3;
  if (-[NCNotificationListPresentableGroup count](self, "count") > 1
    || -[NCNotificationListPresentableGroup count](self, "count") == 1 && !v5)
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isGrouped");

    if (v5)
    {
      if ((v8 & 1) != 0)
        return;
    }
    else if (!v8)
    {
      return;
    }
    if (v4)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__NCNotificationListPresentableGroup_setGrouped_animated___block_invoke;
      v9[3] = &unk_1E8D1B278;
      objc_copyWeak(&v10, &location);
      -[NCNotificationListPresentableGroup _scrollToTopIfNecessaryAndPerformBlock:](self, "_scrollToTopIfNecessaryAndPerformBlock:", v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      -[NCNotificationListPresentableGroup toggleGroupedState](self, "toggleGroupedState");
    }
  }
}

void __58__NCNotificationListPresentableGroup_setGrouped_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleGroupedState");

}

- (BOOL)actionsRevealedForNotificationListCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup cellWithActionsRevealed](self, "cellWithActionsRevealed");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustForLegibilitySettingsChange:", v4);

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateData");

  -[NCNotificationListPresentableGroup headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustForContentSizeCategoryChange");

  -[NCNotificationListPresentableGroup footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustForContentSizeCategoryChange");

  return 1;
}

- (NSString)materialGroupNameBase
{
  NSString *materialGroupNameBase;
  void *v4;
  NSString *v5;
  NSString *v6;

  materialGroupNameBase = self->_materialGroupNameBase;
  if (!materialGroupNameBase)
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_materialGroupNameBase;
      self->_materialGroupNameBase = v5;

    }
    materialGroupNameBase = self->_materialGroupNameBase;
  }
  return materialGroupNameBase;
}

- (unint64_t)count
{
  return 0;
}

+ (NSSet)presentableTypes
{
  return 0;
}

- (id)purpose
{
  return 0;
}

- (id)headerViewForNotificationList:(id)a3
{
  void *v4;
  double Width;
  void *v6;
  void *v7;
  NCNotificationListCoalescingHeaderCell *v8;
  NCNotificationListCoalescingHeaderCell *headerView;
  NCNotificationListCoalescingHeaderCell *v10;
  void *v11;
  NCNotificationListCoalescingHeaderCell *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  if (!self->_headerView
    && -[NCNotificationListPresentableGroup _shouldAllowRestacking](self, "_shouldAllowRestacking", a3))
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    Width = CGRectGetWidth(v15);

    -[NCNotificationListPresentableGroup headerText](self, "headerText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPresentableGroup clearAllText](self, "clearAllText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCache coalescingHeaderCellWithTitle:clearAllText:width:](self->_notificationListCache, "coalescingHeaderCellWithTitle:clearAllText:width:", v6, v7, Width);
    v8 = (NCNotificationListCoalescingHeaderCell *)objc_claimAutoreleasedReturnValue();
    headerView = self->_headerView;
    self->_headerView = v8;

    -[NCNotificationListCoalescingHeaderCell setTitle:](self->_headerView, "setTitle:", v6);
    -[NCNotificationListCoalescingHeaderCell setClearAllText:](self->_headerView, "setClearAllText:", v7);
    -[NCNotificationListCoalescingHeaderCell setHandlerDelegate:](self->_headerView, "setHandlerDelegate:", self);
    v10 = self->_headerView;
    -[NCNotificationListPresentableGroup materialGroupNameBase](self, "materialGroupNameBase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingHeaderCell setMaterialGroupNameBase:](v10, "setMaterialGroupNameBase:", v11);

    -[NCNotificationListCoalescingHeaderCell setAdjustsFontForContentSizeCategory:](self->_headerView, "setAdjustsFontForContentSizeCategory:", 1);
    v12 = self->_headerView;
    -[NCNotificationListPresentableGroup _legibilitySettings](self, "_legibilitySettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingHeaderCell adjustForLegibilitySettingsChange:](v12, "adjustForLegibilitySettingsChange:", v13);

    -[NCNotificationListCoalescingHeaderCell frame](self->_headerView, "frame");
    self->_headerViewHeight = CGRectGetHeight(v16);

  }
  return self->_headerView;
}

- (void)recycleView:(id)a3
{
  NCNotificationListCoalescingHeaderCell *v4;
  NCNotificationListCoalescingHeaderCell *v5;
  void *v6;
  NCNotificationListCoalescingControlsCell *v7;
  NCNotificationListCoalescingControlsCell *v8;
  NCNotificationListCoalescingControlsCell *footerView;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (NCNotificationListCoalescingHeaderCell *)v10;
    if (self->_headerView == v4)
    {
      v5 = v4;
      self->_headerView = 0;

      -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recycleNotificationListCoalescingHeaderCell:", v5);
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (NCNotificationListCoalescingControlsCell *)v10;
    if (self->_footerView == v7)
    {
      v8 = v7;
      -[NCNotificationListCoalescingControlsCell setFooterCell:](v7, "setFooterCell:", 0);
      footerView = self->_footerView;
      self->_footerView = 0;

      -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recycleNotificationListCoalescingControlsCell:", v8);
      goto LABEL_7;
    }
LABEL_8:

  }
}

- (id)footerViewForNotificationList:(id)a3
{
  id v4;
  void *v5;
  double Width;
  void *v7;
  NCNotificationListCoalescingControlsCell *v8;
  NCNotificationListCoalescingControlsCell *footerView;
  void *v10;
  double Height;
  void *v12;
  _BOOL8 v13;
  NCNotificationListCoalescingControlsCell *v14;
  void *v15;
  NCNotificationListCoalescingControlsCell *v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  if (!self->_footerView
    && -[NCNotificationListPresentableGroup _shouldAllowRestacking](self, "_shouldAllowRestacking"))
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Width = CGRectGetWidth(v18);

    -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coalescingControlsCellWithWidth:", Width);
    v8 = (NCNotificationListCoalescingControlsCell *)objc_claimAutoreleasedReturnValue();
    footerView = self->_footerView;
    self->_footerView = v8;

    -[NCNotificationListCoalescingControlsCell setFooterCell:](self->_footerView, "setFooterCell:", 1);
    -[NCNotificationListCoalescingControlsCell setHandlerDelegate:](self->_footerView, "setHandlerDelegate:", self);
    -[NCNotificationListPresentableGroup clearAllText](self, "clearAllText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingControlsCell setClearAllText:](self->_footerView, "setClearAllText:", v10);
    objc_msgSend(v4, "frame");
    Height = CGRectGetHeight(v19);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = Height > CGRectGetHeight(v20) * 0.8;

    -[NCNotificationListCoalescingControlsCell setShouldShowCoalescingControls:](self->_footerView, "setShouldShowCoalescingControls:", v13);
    v14 = self->_footerView;
    -[NCNotificationListPresentableGroup materialGroupNameBase](self, "materialGroupNameBase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListCoalescingControlsCell setMaterialGroupNameBase:](v14, "setMaterialGroupNameBase:", v15);

    -[NCNotificationListCoalescingControlsCell setAdjustsFontForContentSizeCategory:](self->_footerView, "setAdjustsFontForContentSizeCategory:", 1);
    -[NCNotificationListCoalescingControlsCell frame](self->_footerView, "frame");
    self->_footerViewHeight = CGRectGetHeight(v21);

  }
  v16 = self->_footerView;

  return v16;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  double result;

  if (!-[NCNotificationListPresentableGroup _shouldAllowRestacking](self, "_shouldAllowRestacking", a3, a4))
    return 0.0;
  -[NCNotificationListPresentableGroup headerViewHeight](self, "headerViewHeight");
  return result;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  double result;

  if (!-[NCNotificationListPresentableGroup _shouldAllowRestacking](self, "_shouldAllowRestacking", a3, a4))
    return 0.0;
  -[NCNotificationListPresentableGroup footerViewHeight](self, "footerViewHeight");
  return result;
}

- (double)notificationListView:(id)a3
{
  return 0.0;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  return 0.0;
}

- (BOOL)shouldPerformClippingForNotificationListCell:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationListPresentableGroup listView](self, "listView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped") ^ 1;

  return v4;
}

- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationListBaseComponent:didTransitionActionsForSwipeInteraction:revealed:", self, v6, 0);
  -[NCNotificationListPresentableGroup setCellWithActionsRevealed:](self, "setCellWithActionsRevealed:", 0);

}

- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationListBaseComponent:didTransitionActionsForSwipeInteraction:revealed:", self, v6, 1);
  -[NCNotificationListPresentableGroup setCellWithActionsRevealed:](self, "setCellWithActionsRevealed:", v8);

}

- (void)notificationListCell:(id)a3 didMoveToNewXPosition:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  -[NCNotificationListPresentableGroup listView](self, "listView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSubviewTranslation:", a4);

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v10 = (void *)v7;
    v9 = objc_opt_respondsToSelector();
    v8 = v10;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "notificationListPresentableGroup:didReceivedHorizontalTranslation:", self, a4);
      v8 = v10;
    }
  }

}

- (void)notificationListCoalescingControlsHandlerRequestsRestackingNotifications:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[NCNotificationListPresentableGroup _didSignificantInteraction](self, "_didSignificantInteraction");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsRestackingNotifications___block_invoke;
  v5[3] = &unk_1E8D1B278;
  objc_copyWeak(&v6, &location);
  -[NCNotificationListPresentableGroup _scrollToTopIfNecessaryAndPerformBlock:](self, "_scrollToTopIfNecessaryAndPerformBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __111__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsRestackingNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleGroupedState");

}

- (void)notificationListCoalescingControlsHandlerRequestsClearingNotifications:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  -[NCNotificationListPresentableGroup _didSignificantInteraction](self, "_didSignificantInteraction");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsClearingNotifications___block_invoke;
  v5[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[NCNotificationListPresentableGroup _scrollToTopIfNecessaryAndPerformBlock:](self, "_scrollToTopIfNecessaryAndPerformBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __109__NCNotificationListPresentableGroup_notificationListCoalescingControlsHandlerRequestsClearingNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "listView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGrouped:", 1);

    objc_msgSend(*(id *)(a1 + 32), "clearAll");
    WeakRetained = v4;
  }

}

- (void)notificationListCoalescingControlsHandlerRequestsClearingAllNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Requests clearing all", v7, 2u);
  }
  -[NCNotificationListPresentableGroup _didSignificantInteraction](self, "_didSignificantInteraction");
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notificationListBaseComponentRequestsClearingAll:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notificationListBaseComponent:didEndUserInteractionWithViewController:", self, 0);

}

- (id)containerViewForCoalescingControlsHandlerPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:(id)a3
{
  id v4;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListBaseComponent:didBeginUserInteractionWithViewController:", self, 0);

}

- (void)notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListBaseComponent:didPresentCoalescingControlsHandler:inForceTouchState:", self, v5, 1);

}

- (void)notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListBaseComponent:didPresentCoalescingControlsHandler:inForceTouchState:", self, v5, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationListBaseComponent:didEndUserInteractionWithViewController:", self, 0);

}

- (void)notificationListCoalescingControlsHandler:(id)a3 didTransitionToClearState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListBaseComponent:didTransitionCoalescingControlsHandler:toClearState:", self, v6, v4);

  -[NCNotificationListPresentableGroup _didSignificantInteraction](self, "_didSignificantInteraction");
}

- (void)_didSignificantInteraction
{
  id v3;

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

- (BOOL)_shouldAllowRestacking
{
  void *v3;
  char v4;

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldAllowRestackingForNotificationListPresentableGroup:", self);
  else
    v4 = 0;

  return v4;
}

- (void)_scrollToTopIfNecessaryAndPerformBlock:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "shouldScrollToTopForNotificationListBaseComponent:", self);
  else
    v5 = 0;
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVisibleForViewAtIndex:", 0);

  if (!v7 || v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "notificationListPresentableGroup:requestsScrollToTopOfCollectionWithCompletion:", self, v8);
  }
  else if (v8)
  {
    v8[2]();
  }

}

- (id)_legibilitySettings
{
  void *v3;
  void *v4;

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "legibilitySettingsForNotificationListBaseComponent:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NCNotificationListBaseComponentDelegate)delegate
{
  return (NCNotificationListBaseComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCache, a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (BOOL)shouldImmediatelyReveal
{
  return self->_shouldImmediatelyReveal;
}

- (void)setShouldImmediatelyReveal:(BOOL)a3
{
  self->_shouldImmediatelyReveal = a3;
}

- (NCNotificationListCoalescingHeaderCell)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NCNotificationListCoalescingControlsCell)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (void)setFooterViewHeight:(double)a3
{
  self->_footerViewHeight = a3;
}

- (NCNotificationListCell)cellWithActionsRevealed
{
  return self->_cellWithActionsRevealed;
}

- (void)setCellWithActionsRevealed:(id)a3
{
  objc_storeStrong((id *)&self->_cellWithActionsRevealed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellWithActionsRevealed, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
