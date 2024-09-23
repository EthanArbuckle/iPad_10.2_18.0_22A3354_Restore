@implementation NCNotificationSummarizedInlineExpandingSectionList

- (NCNotificationSummarizedInlineExpandingSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  NCNotificationSummarizedInlineExpandingSectionList *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  result = -[NCNotificationCombinedSectionList initWithTitle:sectionType:](&v5, sel_initWithTitle_sectionType_, a3, a4);
  if (result)
    result->_combinedAppSectionListActive = 1;
  return result;
}

- (id)allNotificationGroups
{
  return -[NCNotificationSummarizedInlineExpandingSectionList _notificationGroupsForDigestRankOrderingShouldMerge:](self, "_notificationGroupsForDigestRankOrderingShouldMerge:", 0);
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke;
  v5[3] = &unk_1E8D1B4D8;
  v5[4] = self;
  v6 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
}

void __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appSectionLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(*(id *)(a1 + 32), "listView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isGrouped"),
        v7,
        v8))
  {
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeNotificationGroups:reorderGroupNotifications:", v9, *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "allNotificationRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2;
    v10[3] = &unk_1E8D1B4B0;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  }

}

uint64_t __104__NCNotificationSummarizedInlineExpandingSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive"))
  {
    -[NCNotificationSummarizedInlineExpandingSectionList combinedAppSectionList](self, "combinedAppSectionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:", v8, v9, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

  }
  else
  {
    -[NCNotificationSummarizedInlineExpandingSectionList appSectionLists](self, "appSectionLists");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __140__NCNotificationSummarizedInlineExpandingSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke;
    v16[3] = &unk_1E8D1B500;
    v17 = v10;
    v18 = v8;
    v19 = v9;
    v20 = v5;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

    v11 = v17;
  }

  -[NCNotificationSummarizedInlineExpandingSectionList _removeAppSectionListsIfEmpty](self, "_removeAppSectionListsIfEmpty");
  return v10;
}

void __140__NCNotificationSummarizedInlineExpandingSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (void)insertNotificationRequest:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (!-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive"))
  {
LABEL_6:
    -[NCNotificationSummarizedInlineExpandingSectionList _insertNotificationRequestToAppSectionList:](self, "_insertNotificationRequestToAppSectionList:", v6);
    goto LABEL_7;
  }
  if (!-[NCNotificationSummarizedInlineExpandingSectionList _shouldInsertNotificationRequestToCombinedAppSectionList:](self, "_shouldInsertNotificationRequestToCombinedAppSectionList:", v6))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isGrouped");

    if (!v5)
    {
      -[NCNotificationSummarizedInlineExpandingSectionList _insertNotificationRequestToCombinedAppSectionList:](self, "_insertNotificationRequestToCombinedAppSectionList:", v6);
      -[NCNotificationSummarizedInlineExpandingSectionList setReloadCombinedAppSectionListOnCollapse:](self, "setReloadCombinedAppSectionListOnCollapse:", 1);
      goto LABEL_7;
    }
    -[NCNotificationSummarizedInlineExpandingSectionList setCombinedAppSectionListActive:](self, "setCombinedAppSectionListActive:", 0);
    -[NCNotificationSummarizedInlineExpandingSectionList _splitCombinedAppSectionList](self, "_splitCombinedAppSectionList");
    goto LABEL_6;
  }
  -[NCNotificationSummarizedInlineExpandingSectionList _insertNotificationRequestToCombinedAppSectionList:](self, "_insertNotificationRequestToCombinedAppSectionList:", v6);
LABEL_7:
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
  -[NCNotificationSummarizedSectionList _configureSummaryPlatterViewSwipeInteractionIfNecessary](self, "_configureSummaryPlatterViewSwipeInteractionIfNecessary");

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive"))
  {
    -[NCNotificationSummarizedInlineExpandingSectionList _modifyNotificationInCombinedAppSectionList:](self, "_modifyNotificationInCombinedAppSectionList:", v4);
  }
  else
  {
    -[NCNotificationSummarizedInlineExpandingSectionList _modifyNotificationRequestInAppSectionList:](self, "_modifyNotificationRequestInAppSectionList:", v4);
  }

  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
}

- (void)removeNotificationRequest:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (-[NCNotificationCombinedSectionList containsNotificationRequest:](self, "containsNotificationRequest:"))
  {
    if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive"))
    {
      -[NCNotificationSummarizedInlineExpandingSectionList _removeNotificationFromCombinedAppSectionList:](self, "_removeNotificationFromCombinedAppSectionList:", v6);
    }
    else
    {
      -[NCNotificationSummarizedInlineExpandingSectionList _removeNotificationRequestFromAppSectionList:](self, "_removeNotificationRequestFromAppSectionList:", v6);
      if (-[NCNotificationSummarizedInlineExpandingSectionList _shouldCombineAppSectionLists](self, "_shouldCombineAppSectionLists"))
      {
        -[NCNotificationStructuredSectionList listView](self, "listView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "isGrouped");

        if (v5)
        {
          -[NCNotificationSummarizedInlineExpandingSectionList setCombinedAppSectionListActive:](self, "setCombinedAppSectionListActive:", 1);
          -[NCNotificationSummarizedInlineExpandingSectionList _combineAppSectionLists](self, "_combineAppSectionLists");
        }
        else
        {
          -[NCNotificationSummarizedInlineExpandingSectionList setReloadCombinedAppSectionListOnCollapse:](self, "setReloadCombinedAppSectionListOnCollapse:", 1);
        }
      }
    }
    -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 0);
  }

}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList updateNotificationSectionSettings:previousSectionSettings:](&v5, sel_updateNotificationSectionSettings_previousSectionSettings_, a3, a4);
  -[NCNotificationSummarizedInlineExpandingSectionList _removeAppSectionListsIfEmpty](self, "_removeAppSectionListsIfEmpty");
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  NCToggleControl *leadingPlatterViewClearControl;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList setDeviceAuthenticated:](&v7, sel_setDeviceAuthenticated_);
  if (!a3)
  {
    leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
    if (leadingPlatterViewClearControl)
    {
      if (-[NCToggleControl isExpanded](leadingPlatterViewClearControl, "isExpanded"))
      {
        -[NCToggleControl setExpanded:](self->_leadingPlatterViewClearControl, "setExpanded:", 0);
        -[NCNotificationStructuredSectionList delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationListBaseComponent:didTransitionCoalescingControlsHandler:toClearState:", self, self, 0);

      }
    }
  }
}

- (id)headerViewForNotificationList:(id)a3
{
  -[NCNotificationSummarizedInlineExpandingSectionList _configureExpandedHeaderViewIfNecessary](self, "_configureExpandedHeaderViewIfNecessary", a3);
  return self->_expandedHeaderView;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  double v6;

  -[NCNotificationSummarizedInlineExpandingSectionList _configureExpandedHeaderViewIfNecessary](self, "_configureExpandedHeaderViewIfNecessary", a3);
  -[NCNotificationSummaryExpandedHeaderView sizeThatFits:](self->_expandedHeaderView, "sizeThatFits:", a4, 0.0);
  return v6;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 8.0;
}

- (id)backgroundViewForNotificationList:(id)a3
{
  -[NCNotificationSummarizedInlineExpandingSectionList _configureBackgroundPlatterViewIfNecessary](self, "_configureBackgroundPlatterViewIfNecessary", a3);
  return self->_backgroundPlatterView;
}

- (id)hoverViewForNotificationList:(id)a3
{
  -[NCNotificationSummarizedInlineExpandingSectionList _configureCollapseButtonIfNecessary](self, "_configureCollapseButtonIfNecessary", a3);
  return self->_collapseButtonView;
}

- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGrouped");

  v8 = (void *)*MEMORY[0x1E0DC5F90];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ updating app sections for digest ordered notifications", (uint8_t *)&v14, 0xCu);

    }
    -[NCNotificationSummarizedInlineExpandingSectionList _updateAppSectionsForOrderedNotificationGroupLists:](self, "_updateAppSectionsForOrderedNotificationGroupLists:", v5);
  }
  else
  {
    if (v9)
    {
      v12 = v8;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring updating app sections for digest ordered notifications because it is expanded", (uint8_t *)&v14, 0xCu);

    }
    -[NCNotificationSummarizedInlineExpandingSectionList setReloadOrderingOnCollapse:](self, "setReloadOrderingOnCollapse:", 1);
  }

}

- (id)clearControlViewForLeadingSummaryPlatterViewForSummaryOrderProvider:(id)a3
{
  -[NCNotificationSummarizedInlineExpandingSectionList _configureLeadingPlatterViewClearControlIfNecessary](self, "_configureLeadingPlatterViewClearControlIfNecessary", a3);
  return self->_leadingPlatterViewClearControl;
}

- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationStructuredSectionList:requestsAuxiliaryOptionsContentProviderForNotificationRequest:isLongLook:", self, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "notificationStructuredSectionList:shouldFilterNotificationRequest:", self, v5);

  return (char)self;
}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationListBaseComponent:requestsScrollingToContentOffset:withCompletion:", self, v7, a4);

}

- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "notificationStructuredSectionList:areNotificationsLoadedForSectionIdentifier:", self, v5);

  return (char)self;
}

- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationStructuredSectionList:transitionedGroupedStateIsGrouped:", self, v4);

}

- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationStructuredSectionListRequestsClearingSection:", v4);

}

- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationStructuredSectionListDidClearAllNotificationRequests:", v4);

}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[NCNotificationSummarizedInlineExpandingSectionList _appSectionListDidRemoveNotificationRequests:](self, "_appSectionListDidRemoveNotificationRequests:", v6);
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList notificationListBaseComponentDidRemoveAll:](&v7, sel_notificationListBaseComponentDidRemoveAll_, v4);

}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  -[NCNotificationSummarizedInlineExpandingSectionList _appSectionListDidRemoveNotificationRequests:](self, "_appSectionListDidRemoveNotificationRequests:", v9);
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList notificationListComponent:didRemoveNotificationRequest:](&v10, sel_notificationListComponent_didRemoveNotificationRequest_, v7, v6);

}

- (void)notificationSummaryExpandedHeaderView:(id)a3 acceptedSummaryOnboarding:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "notificationListComponent:acceptedSummaryOnboarding:", self, v4);
    v6 = v7;
  }

}

- (id)materialGroupNameBaseForNotificationSummaryExpandedHeaderView:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notificationSummaryExpandedHeaderViewRequestsClearAll:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponentRequestsClearingAll:", self);

}

- (id)containerViewForClickInteractionPresentedContentForNotificationSummaryExpandedHeaderView:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notificationSummaryExpandedHeaderViewDidBeginClickInteraction:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponent:didBeginUserInteractionWithViewController:", self, 0);

}

- (void)notificationSummaryExpandedHeaderViewDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didPresentCoalescingControlsHandler:inForceTouchState:", self, v4, 1);

}

- (void)notificationSummaryExpandedHeaderViewDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didPresentCoalescingControlsHandler:inForceTouchState:", self, v4, 0);

  objc_msgSend(v5, "notificationListBaseComponent:didEndUserInteractionWithViewController:", self, 0);
}

- (void)notificationSummaryExpandedHeaderView:(id)a3 didTransitionToClearState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListBaseComponent:didTransitionCoalescingControlsHandler:toClearState:", self, v6, v4);

  objc_msgSend(v7, "notificationListBaseComponentDidSignificantUserInteraction:", self);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  UIView *collapseButtonView;
  void *v6;
  NCToggleControl *leadingPlatterViewClearControl;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  -[NCNotificationSummarizedSectionList adjustForContentSizeCategoryChange](&v10, sel_adjustForContentSizeCategoryChange);
  -[NCNotificationSummaryExpandedHeaderView adjustForContentSizeCategoryChange](self->_expandedHeaderView, "adjustForContentSizeCategoryChange");
  -[NCNotificationSummarizedInlineExpandingSectionList appSectionLists](self, "appSectionLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_2);

  collapseButtonView = self->_collapseButtonView;
  self->_collapseButtonView = 0;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadHoverView");

  leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
  self->_leadingPlatterViewClearControl = 0;

  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateLeadingSummaryPlatterView");

  return 1;
}

uint64_t __88__NCNotificationSummarizedInlineExpandingSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[NCToggleControl isExpanded](self->_leadingPlatterViewClearControl, "isExpanded"))
  {
    if (v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __84__NCNotificationSummarizedInlineExpandingSectionList_resetClearButtonStateAnimated___block_invoke;
      v5[3] = &unk_1E8D1B568;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v5, 0, 200.0, 25.0);
    }
    else
    {
      -[NCToggleControl setExpanded:](self->_leadingPlatterViewClearControl, "setExpanded:", 0);
    }
  }
}

void __84__NCNotificationSummarizedInlineExpandingSectionList_resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "leadingPlatterViewClearControl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setExpanded:", 0);

}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return 0;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "leadingSummaryPlatterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummarizedInlineExpandingSectionList leadingPlatterViewClearControl](self, "leadingPlatterViewClearControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  v18.x = x;
  v18.y = y;
  LOBYTE(v6) = CGRectContainsPoint(v19, v18);
  return -[NCToggleControl isExpanded](self->_leadingPlatterViewClearControl, "isExpanded") & v6;
}

- (void)_collapseAllSectionListViews
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NCNotificationSummarizedInlineExpandingSectionList appSectionLists](self, "appSectionLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_18);

  -[NCNotificationSummarizedInlineExpandingSectionList _updateAppSectionListsOnCollapse](self, "_updateAppSectionListsOnCollapse");
  if (-[NCNotificationSummarizedInlineExpandingSectionList reloadCombinedAppSectionListOnCollapse](self, "reloadCombinedAppSectionListOnCollapse"))
  {
    -[NCNotificationSummarizedInlineExpandingSectionList setReloadCombinedAppSectionListOnCollapse:](self, "setReloadCombinedAppSectionListOnCollapse:", 0);
    -[NCNotificationSummarizedInlineExpandingSectionList _toggleCombinedAppSectionListIfNecessary](self, "_toggleCombinedAppSectionListIfNecessary");
    if (!-[NCNotificationSummarizedInlineExpandingSectionList reloadOrderingOnCollapse](self, "reloadOrderingOnCollapse"))
    {
      v4 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v6;
        _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading ordering of app sections on collapse for combined app section", (uint8_t *)&v10, 0xCu);

      }
      -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
    }
  }
  if (-[NCNotificationSummarizedInlineExpandingSectionList reloadOrderingOnCollapse](self, "reloadOrderingOnCollapse"))
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading ordering of app sections on collapse", (uint8_t *)&v10, 0xCu);

    }
    -[NCNotificationSummarizedInlineExpandingSectionList setReloadOrderingOnCollapse:](self, "setReloadOrderingOnCollapse:", 0);
    -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
  }
}

uint64_t __82__NCNotificationSummarizedInlineExpandingSectionList__collapseAllSectionListViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setExpanded:", 0);
}

- (id)_notificationGroupsForDigestRankOrdering
{
  return -[NCNotificationSummarizedInlineExpandingSectionList _notificationGroupsForDigestRankOrderingShouldMerge:](self, "_notificationGroupsForDigestRankOrderingShouldMerge:", 1);
}

- (void)_configureSectionListView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummarizedInlineExpandingSectionList;
  v4 = a3;
  -[NCNotificationSummarizedSectionList _configureSectionListView:](&v6, sel__configureSectionListView_, v4);
  objc_msgSend(v4, "setGroupingAnimationStyle:", 1, v6.receiver, v6.super_class);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insetHorizontalMarginForNotificationListComponent:", self);
  objc_msgSend(v4, "setBackgroundViewHorizontalOutsetMargin:");

  objc_msgSend(v4, "setShowStackBelowLeadingView:", 0);
  objc_msgSend(v4, "setSupportsBottomViewsRollUnder:", 0);
  objc_msgSend(v4, "setVisibleRectBottomMarginForRollUnder:", -80.0);

}

- (void)_configureExpandedHeaderViewIfNecessary
{
  NCNotificationSummaryExpandedHeaderView *expandedHeaderView;
  NCNotificationSummaryExpandedHeaderView *v4;
  NCNotificationSummaryExpandedHeaderView *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NCNotificationSummaryExpandedHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  NCNotificationSummaryExpandedHeaderView *v16;
  void *v17;
  void *v18;
  NCNotificationSummaryExpandedHeaderView *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  expandedHeaderView = self->_expandedHeaderView;
  if (!expandedHeaderView)
  {
    v4 = objc_alloc_init(NCNotificationSummaryExpandedHeaderView);
    v5 = self->_expandedHeaderView;
    self->_expandedHeaderView = v4;

    -[NCNotificationSummaryExpandedHeaderView setDelegate:](self->_expandedHeaderView, "setDelegate:", self);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NCNotificationListBaseContentView requiredVisualStyleCategories](self->_expandedHeaderView, "requiredVisualStyleCategories", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "integerValue");
          v12 = self->_expandedHeaderView;
          -[PLPlatterView visualStylingProviderForCategory:](self->_backgroundPlatterView, "visualStylingProviderForCategory:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](v12, "setVisualStylingProvider:forCategory:", v13, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    expandedHeaderView = self->_expandedHeaderView;
  }
  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "summaryHeading");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryExpandedHeaderView setTitle:](expandedHeaderView, "setTitle:", v15);

  v16 = self->_expandedHeaderView;
  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryExpandedHeaderView setOnboarding:](v16, "setOnboarding:", objc_msgSend(v17, "isOnboardingSummary"));

  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v18, "isOnboardingSummary");

  v19 = self->_expandedHeaderView;
  if ((_DWORD)v17)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_EXPLANATION"), &stru_1E8D21F60, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryExpandedHeaderView setSubtitle:](v19, "setSubtitle:", v21);

  }
  else
  {
    -[NCNotificationSummaryExpandedHeaderView setSubtitle:](v19, "setSubtitle:", 0);
  }
}

- (void)_configureBackgroundPlatterViewIfNecessary
{
  PLPlatterView *v3;
  PLPlatterView *backgroundPlatterView;
  PLPlatterView *v5;
  void *v6;
  id v7;

  if (!self->_backgroundPlatterView)
  {
    v3 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 51);
    backgroundPlatterView = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v3;

    -[PLPlatterView _setContinuousCornerRadius:](self->_backgroundPlatterView, "_setContinuousCornerRadius:", 28.0);
    v5 = self->_backgroundPlatterView;
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterView setMaterialGroupNameBase:](v5, "setMaterialGroupNameBase:", v6);

  }
}

- (void)_configureCollapseButtonIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *collapseButtonView;
  UIView *v11;
  void *v12;
  double v13;
  id v14;

  if (!self->_collapseButtonView)
  {
    v3 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationWithFont:scale:", v4, 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3C0]), "initWithMaterialRecipe:", 1);
    -[UIView setGlyph:](v6, "setGlyph:", v5);
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v8);

    -[UIView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("notification-summary-collapse-control"));
    -[UIView addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__collapseButtonTapped_, 0x2000);
    -[UIView _glyphView](v6, "_glyphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    BSRectWithSize();
    -[UIView setBounds:](v6, "setBounds:");
    collapseButtonView = self->_collapseButtonView;
    self->_collapseButtonView = v6;
    v11 = v6;

    -[UIView layer](self->_collapseButtonView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E0]));
    objc_msgSend(v12, "setShadowRadius:", 5.0);
    LODWORD(v13) = 1045220557;
    objc_msgSend(v12, "setShadowOpacity:", v13);
    objc_msgSend(v12, "setShadowOffset:", 1.0, 3.0);

  }
}

- (void)_collapseButtonTapped:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NCNotificationSummarizedInlineExpandingSectionList__collapseButtonTapped___block_invoke;
  v5[3] = &unk_1E8D1B568;
  v5[4] = self;
  objc_msgSend(v4, "notificationListBaseComponent:requestsScrollingToContentOffset:withCompletion:", self, v5, 0.0);

}

uint64_t __76__NCNotificationSummarizedInlineExpandingSectionList__collapseButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collapseSection");
}

- (void)_configureLeadingPlatterViewClearControlIfNecessary
{
  void *v3;
  void *v4;
  NCToggleControl *v5;
  NCToggleControl *leadingPlatterViewClearControl;
  NCToggleControl *v7;
  void *v8;
  void *v9;

  if (!self->_leadingPlatterViewClearControl)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCToggleControl dismissControlWithMaterialRecipe:clearAllText:](NCToggleControl, "dismissControlWithMaterialRecipe:clearAllText:", 51, v4);
    v5 = (NCToggleControl *)objc_claimAutoreleasedReturnValue();
    leadingPlatterViewClearControl = self->_leadingPlatterViewClearControl;
    self->_leadingPlatterViewClearControl = v5;

    v7 = self->_leadingPlatterViewClearControl;
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGlyphControl setMaterialGroupNameBase:](v7, "setMaterialGroupNameBase:", v9);

    -[NCToggleControl setVisualStyle:](self->_leadingPlatterViewClearControl, "setVisualStyle:", 0);
    -[NCToggleControl setOverrideUserInterfaceStyle:](self->_leadingPlatterViewClearControl, "setOverrideUserInterfaceStyle:", 2);
    -[NCToggleControl addTarget:action:forControlEvents:](self->_leadingPlatterViewClearControl, "addTarget:action:forControlEvents:", self, sel__handleClearControlTouchUpInside_, 64);
    -[NCToggleControl addTarget:action:forControlEvents:](self->_leadingPlatterViewClearControl, "addTarget:action:forControlEvents:", self, sel__handleClearControlPrimaryAction_, 0x2000);
  }
}

- (void)_handleClearControlTouchUpInside:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponent:didTransitionCoalescingControlsHandler:toClearState:", self, self, -[NCToggleControl isExpanded](self->_leadingPlatterViewClearControl, "isExpanded") ^ 1);

}

- (void)_handleClearControlPrimaryAction:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing summary via leading platter clear button", (uint8_t *)&v7, 0xCu);

  }
  -[NCNotificationSummarizedSectionList clearAll](self, "clearAll");
}

- (id)_notificationGroupsForDigestRankOrderingShouldMerge:(BOOL)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__NCNotificationSummarizedInlineExpandingSectionList__notificationGroupsForDigestRankOrderingShouldMerge___block_invoke;
  v11[3] = &unk_1E8D1B5D0;
  v13 = a3;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __106__NCNotificationSummarizedInlineExpandingSectionList__notificationGroupsForDigestRankOrderingShouldMerge___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "allNotificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isGrouped"))
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "groupListsForSmartOrdering");
      v4 = v3;
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

- (id)_newAppSectionListForRequest:(id)a3
{
  id v4;
  NCNotificationAppSectionList *v5;
  void *v6;
  void *v7;
  NCNotificationAppSectionList *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [NCNotificationAppSectionList alloc];
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NCNotificationAppSectionList initWithTitle:sectionType:](v5, "initWithTitle:sectionType:", v7, 7);

  -[NCNotificationStructuredSectionList setDelegate:](v8, "setDelegate:", self);
  objc_msgSend(v4, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationAppSectionList setSectionIdentifier:](v8, "setSectionIdentifier:", v9);

  -[NCNotificationAppSectionList setDeviceAuthenticated:](v8, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
  -[NCNotificationStructuredSectionList notificationListCache](self, "notificationListCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList setNotificationListCache:](v8, "setNotificationListCache:", v10);

  -[NCNotificationStructuredSectionList setNotificationListViewRevealed:](v8, "setNotificationListViewRevealed:", 1);
  objc_msgSend(v4, "sectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList setLogDescription:](v8, "setLogDescription:", v11);

  -[NCNotificationSummarizedInlineExpandingSectionList _configureBackgroundPlatterViewIfNecessary](self, "_configureBackgroundPlatterViewIfNecessary");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NCNotificationAppSectionList requiredVisualStyleCategories](v8, "requiredVisualStyleCategories", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "integerValue");
        -[PLPlatterView visualStylingProviderForCategory:](self->_backgroundPlatterView, "visualStylingProviderForCategory:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationAppSectionList setVisualStylingProvider:forCategory:](v8, "setVisualStylingProvider:forCategory:", v18, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v8;
}

- (void)_insertNotificationRequestToAppSectionList:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *appSectionLists;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSMutableSet *appSectionListsToReloadOnCollapse;
  NSMutableSet *v14;
  NSMutableSet *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (!self->_appSectionLists)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appSectionLists = self->_appSectionLists;
    self->_appSectionLists = v5;

    v4 = v16;
  }
  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appSectionLists, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[NCNotificationSummarizedInlineExpandingSectionList _newAppSectionListForRequest:](self, "_newAppSectionListForRequest:", v16);
    -[NSMutableDictionary setValue:forKey:](self->_appSectionLists, "setValue:forKey:", v8, v7);
  }
  objc_msgSend(v8, "comparisonDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertNotificationRequest:", v16);
  objc_msgSend(v8, "comparisonDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isGrouped");

  if ((v12 & 1) != 0)
  {
    if ((objc_msgSend(v9, "isEqualToDate:", v10) & 1) == 0
      && -[NCNotificationCombinedSectionList containsSectionList:](self, "containsSectionList:", v8))
    {
      -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", v8, 0);
    }
  }
  else
  {
    appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
    if (!appSectionListsToReloadOnCollapse)
    {
      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v15 = self->_appSectionListsToReloadOnCollapse;
      self->_appSectionListsToReloadOnCollapse = v14;

      appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
    }
    -[NSMutableSet addObject:](appSectionListsToReloadOnCollapse, "addObject:", v8);
    objc_msgSend(v9, "isEqualToDate:", v10);
  }
  if (!-[NCNotificationCombinedSectionList containsSectionList:](self, "containsSectionList:", v8))
    -[NCNotificationCombinedSectionList insertNotificationSectionList:atIndex:animated:](self, "insertNotificationSectionList:atIndex:animated:", v8, 0, v12 ^ 1u);

}

- (void)_modifyNotificationRequestInAppSectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_appSectionLists)
  {
    v8 = v4;
    objc_msgSend(v4, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_appSectionLists, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "modifyNotificationRequest:", v8);

    v4 = v8;
  }

}

- (void)_removeNotificationRequestFromAppSectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSMutableDictionary *appSectionLists;
  id v11;

  v4 = a3;
  if (self->_appSectionLists)
  {
    v11 = v4;
    objc_msgSend(v4, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isGrouped");

    -[NSMutableDictionary objectForKey:](self->_appSectionLists, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "removeNotificationRequest:", v11);
      if (!objc_msgSend(v9, "notificationCount"))
      {
        -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", v9, v7 ^ 1u);
        -[NSMutableDictionary removeObjectForKey:](self->_appSectionLists, "removeObjectForKey:", v5);
      }
      if (!-[NSMutableDictionary count](self->_appSectionLists, "count"))
      {
        appSectionLists = self->_appSectionLists;
        self->_appSectionLists = 0;

      }
    }

    v4 = v11;
  }

}

- (void)_updateAppSectionsForOrderedNotificationGroupLists:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive"))
  {
    -[NCNotificationStructuredSectionList allNotificationGroups](self->_combinedAppSectionList, "allNotificationGroups");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToArray:", v5) & 1) == 0)
    {
      v6 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionList logDescription](self->_combinedAppSectionList, "logDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v8;
        v27 = 2114;
        v28 = v9;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering group lists for %{public}@", buf, 0x16u);

      }
      -[NCNotificationAppSectionList setGroupListsForSmartOrdering:](self->_combinedAppSectionList, "setGroupListsForSmartOrdering:", v4);
    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke;
    v22[3] = &unk_1E8D1B5F8;
    v22[4] = self;
    v5 = v10;
    v23 = v5;
    v13 = v11;
    v24 = v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_2;
    v21[3] = &unk_1E8D1B620;
    v21[4] = self;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v21);
    -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToArray:", v5);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering app section lists", buf, 0xCu);

      }
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_47;
      v20[3] = &unk_1E8D1B648;
      v20[4] = self;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);
      -[NCNotificationCombinedSectionList setSectionLists:](self, "setSectionLists:", v5);
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateData");

    }
  }

}

void __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "appSectionLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(a1[5], "containsObject:", v5) & 1) == 0)
    objc_msgSend(a1[5], "addObject:", v5);
  objc_msgSend(a1[6], "objectForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1[6], "setValue:forKey:", v6, v3);
  }
  objc_msgSend(v6, "addObject:", v7);

}

void __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "appSectionLists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend(v11, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering group lists for %{public}@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(v9, "setGroupListsForSmartOrdering:", v5);
  }

}

uint64_t __105__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionsForOrderedNotificationGroupLists___block_invoke_47(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeNotificationSectionList:animated:", a2, 0);
}

- (void)_appSectionListDidRemoveNotificationRequests:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  char v7;
  NSMutableSet *v8;
  NSMutableSet *appSectionListsToReloadOnCollapse;
  void *appSectionLists;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NCNotificationAppSectionList *v15;

  v15 = (NCNotificationAppSectionList *)a3;
  if (v15)
  {
    v4 = -[NCNotificationStructuredSectionList notificationCount](v15, "notificationCount");
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isGrouped");
    v7 = v6;
    if (!v4)
    {
      -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", v15, v6 ^ 1u);

      if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& self->_combinedAppSectionList == v15)
      {
        self->_combinedAppSectionList = 0;
        appSectionLists = v15;
      }
      else
      {
        -[NCNotificationSummarizedInlineExpandingSectionList appSectionLists](self, "appSectionLists");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationAppSectionList sectionIdentifier](v15, "sectionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

        if (-[NSMutableDictionary count](self->_appSectionLists, "count"))
          goto LABEL_13;
        appSectionLists = self->_appSectionLists;
        self->_appSectionLists = 0;
      }
LABEL_12:

      goto LABEL_13;
    }

    if ((v7 & 1) == 0)
    {
      if (!self->_appSectionListsToReloadOnCollapse)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        appSectionListsToReloadOnCollapse = self->_appSectionListsToReloadOnCollapse;
        self->_appSectionListsToReloadOnCollapse = v8;

      }
      -[NCNotificationSummarizedInlineExpandingSectionList appSectionListsToReloadOnCollapse](self, "appSectionListsToReloadOnCollapse");
      appSectionLists = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(appSectionLists, "addObject:", v15);
      goto LABEL_12;
    }
  }
LABEL_13:
  if (!-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& -[NCNotificationSummarizedInlineExpandingSectionList _shouldCombineAppSectionLists](self, "_shouldCombineAppSectionLists"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isGrouped");

    if (v14)
    {
      -[NCNotificationSummarizedInlineExpandingSectionList setCombinedAppSectionListActive:](self, "setCombinedAppSectionListActive:", 1);
      -[NCNotificationSummarizedInlineExpandingSectionList _combineAppSectionLists](self, "_combineAppSectionLists");
    }
    else
    {
      -[NCNotificationSummarizedInlineExpandingSectionList setReloadCombinedAppSectionListOnCollapse:](self, "setReloadCombinedAppSectionListOnCollapse:", 1);
    }
  }

}

- (void)_updateAppSectionListsOnCollapse
{
  void *v3;

  -[NCNotificationSummarizedInlineExpandingSectionList appSectionListsToReloadOnCollapse](self, "appSectionListsToReloadOnCollapse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_49);

  -[NCNotificationSummarizedInlineExpandingSectionList setAppSectionListsToReloadOnCollapse:](self, "setAppSectionListsToReloadOnCollapse:", 0);
}

void __86__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionListsOnCollapse__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "groupListsForSmartOrdering");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupListsForSmartOrdering:", v3);

}

- (void)_updateAppSectionListsOnExpand
{
  id v2;

  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_50);

}

void __84__NCNotificationSummarizedInlineExpandingSectionList__updateAppSectionListsOnExpand__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v4;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "unmergeNotificationGroupListsIfNecessary");
    v3 = v4;
  }

}

- (void)_removeAppSectionListsIfEmpty
{
  NCNotificationAppSectionList *v3;
  NCNotificationAppSectionList *combinedAppSectionList;
  void *v5;
  NCNotificationAppSectionList *v6;
  void *v7;
  NSMutableDictionary *appSectionLists;
  id v9;
  _QWORD v10[5];

  if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& (v3 = self->_combinedAppSectionList) != 0)
  {
    if (!-[NCNotificationStructuredSectionList notificationCount](v3, "notificationCount"))
    {
      combinedAppSectionList = self->_combinedAppSectionList;
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", combinedAppSectionList, objc_msgSend(v5, "isGrouped") ^ 1);

      v6 = self->_combinedAppSectionList;
      self->_combinedAppSectionList = 0;

    }
  }
  else if (!-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& -[NSMutableDictionary count](self->_appSectionLists, "count"))
  {
    -[NSMutableDictionary allValues](self->_appSectionLists, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "copy");

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__NCNotificationSummarizedInlineExpandingSectionList__removeAppSectionListsIfEmpty__block_invoke;
    v10[3] = &unk_1E8D1B6F0;
    v10[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    if (!-[NSMutableDictionary count](self->_appSectionLists, "count"))
    {
      appSectionLists = self->_appSectionLists;
      self->_appSectionLists = 0;

    }
  }
}

void __83__NCNotificationSummarizedInlineExpandingSectionList__removeAppSectionListsIfEmpty__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "notificationCount"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeNotificationSectionList:animated:", v7, objc_msgSend(v4, "isGrouped") ^ 1);

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    objc_msgSend(v7, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (id)_newCombinedAppSectionListForRequest
{
  NCNotificationAppSectionList *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NCNotificationAppSectionList initWithTitle:sectionType:]([NCNotificationAppSectionList alloc], "initWithTitle:sectionType:", 0, 7);
  -[NCNotificationStructuredSectionList setDelegate:](v3, "setDelegate:", self);
  -[NCNotificationAppSectionList setCombinedAppSectionList:](v3, "setCombinedAppSectionList:", 1);
  -[NCNotificationAppSectionList setSectionIdentifier:](v3, "setSectionIdentifier:", CFSTR("combinedAppSectionList"));
  -[NCNotificationAppSectionList setDeviceAuthenticated:](v3, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
  -[NCNotificationStructuredSectionList notificationListCache](self, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList setNotificationListCache:](v3, "setNotificationListCache:", v4);

  -[NCNotificationStructuredSectionList setNotificationListViewRevealed:](v3, "setNotificationListViewRevealed:", 1);
  -[NCNotificationStructuredSectionList setLogDescription:](v3, "setLogDescription:", CFSTR("Combined App Section"));
  -[NCNotificationSummarizedInlineExpandingSectionList _configureBackgroundPlatterViewIfNecessary](self, "_configureBackgroundPlatterViewIfNecessary");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NCNotificationAppSectionList requiredVisualStyleCategories](v3, "requiredVisualStyleCategories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue");
        -[PLPlatterView visualStylingProviderForCategory:](self->_backgroundPlatterView, "visualStylingProviderForCategory:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationAppSectionList setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)_shouldInsertNotificationRequestToCombinedAppSectionList:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = 1;
  v17 = 1;
  if (self->_combinedAppSectionList)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList allNotificationGroups](self->_combinedAppSectionList, "allNotificationGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __111__NCNotificationSummarizedInlineExpandingSectionList__shouldInsertNotificationRequestToCombinedAppSectionList___block_invoke;
    v11[3] = &unk_1E8D1B718;
    v13 = &v14;
    v9 = v7;
    v12 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

    v6 = *((_BYTE *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __111__NCNotificationSummarizedInlineExpandingSectionList__shouldInsertNotificationRequestToCombinedAppSectionList___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

- (void)_insertNotificationRequestToCombinedAppSectionList:(id)a3
{
  id v4;
  NCNotificationAppSectionList *combinedAppSectionList;
  NCNotificationAppSectionList *v6;
  NCNotificationAppSectionList *v7;
  id v8;

  v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  v8 = v4;
  if (!combinedAppSectionList)
  {
    v6 = -[NCNotificationSummarizedInlineExpandingSectionList _newCombinedAppSectionListForRequest](self, "_newCombinedAppSectionListForRequest");
    v7 = self->_combinedAppSectionList;
    self->_combinedAppSectionList = v6;

    -[NCNotificationCombinedSectionList insertNotificationSectionList:atIndex:animated:](self, "insertNotificationSectionList:atIndex:animated:", self->_combinedAppSectionList, 0, 0);
    v4 = v8;
    combinedAppSectionList = self->_combinedAppSectionList;
  }
  -[NCNotificationAppSectionList insertNotificationRequest:](combinedAppSectionList, "insertNotificationRequest:", v4);

}

- (void)_removeNotificationFromCombinedAppSectionList:(id)a3
{
  id v4;
  NCNotificationAppSectionList *combinedAppSectionList;
  _BOOL4 v6;
  unint64_t v7;
  NCNotificationAppSectionList *v8;
  id v9;

  v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    v9 = v4;
    v6 = -[NCNotificationStructuredSectionList containsNotificationRequest:](combinedAppSectionList, "containsNotificationRequest:", v4);
    v4 = v9;
    if (v6)
    {
      -[NCNotificationAppSectionList removeNotificationRequest:](self->_combinedAppSectionList, "removeNotificationRequest:", v9);
      v7 = -[NCNotificationStructuredSectionList count](self->_combinedAppSectionList, "count");
      v4 = v9;
      if (!v7)
      {
        -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", self->_combinedAppSectionList, 1);
        v8 = self->_combinedAppSectionList;
        self->_combinedAppSectionList = 0;

        v4 = v9;
      }
    }
  }

}

- (void)_modifyNotificationInCombinedAppSectionList:(id)a3
{
  id v4;
  NCNotificationAppSectionList *combinedAppSectionList;
  _BOOL4 v6;
  id v7;

  v4 = a3;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    v7 = v4;
    v6 = -[NCNotificationStructuredSectionList containsNotificationRequest:](combinedAppSectionList, "containsNotificationRequest:", v4);
    v4 = v7;
    if (v6)
    {
      -[NCNotificationAppSectionList modifyNotificationRequest:](self->_combinedAppSectionList, "modifyNotificationRequest:", v7);
      v4 = v7;
    }
  }

}

- (BOOL)_shouldCombineAppSectionLists
{
  NSMutableDictionary *appSectionLists;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  if (-[NSMutableDictionary count](self->_appSectionLists, "count"))
  {
    appSectionLists = self->_appSectionLists;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__NCNotificationSummarizedInlineExpandingSectionList__shouldCombineAppSectionLists__block_invoke;
    v6[3] = &unk_1E8D1B740;
    v6[4] = &v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appSectionLists, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __83__NCNotificationSummarizedInlineExpandingSectionList__shouldCombineAppSectionLists__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a3, "allNotificationGroups");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "notificationCount") == 1;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = v7;

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) ^ 1;

}

- (void)_combineAppSectionLists
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSMutableDictionary *appSectionLists;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  NCNotificationSummarizedInlineExpandingSectionList *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_appSectionLists, "count"))
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ combining app section lists into a combined list", buf, 0xCu);

    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    appSectionLists = self->_appSectionLists;
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke;
    v11[3] = &unk_1E8D1B768;
    v12 = v6;
    v13 = self;
    v9 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appSectionLists, "enumerateKeysAndObjectsUsingBlock:", v11);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke_2;
    v10[3] = &unk_1E8D1B4B0;
    v10[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
}

void __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "allNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 40), "removeNotificationSectionList:animated:", v6, 0);
}

uint64_t __77__NCNotificationSummarizedInlineExpandingSectionList__combineAppSectionLists__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertNotificationRequestToCombinedAppSectionList:", a2);
}

- (BOOL)_shouldSplitCombinedAppSectionList
{
  NCNotificationAppSectionList *combinedAppSectionList;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  combinedAppSectionList = self->_combinedAppSectionList;
  if (combinedAppSectionList)
  {
    -[NCNotificationStructuredSectionList allNotificationGroups](combinedAppSectionList, "allNotificationGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__NCNotificationSummarizedInlineExpandingSectionList__shouldSplitCombinedAppSectionList__block_invoke;
    v8[3] = &unk_1E8D1B790;
    v5 = v4;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __88__NCNotificationSummarizedInlineExpandingSectionList__shouldSplitCombinedAppSectionList__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) != 0
    || (unint64_t)objc_msgSend(v7, "notificationCount") >= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (void)_splitCombinedAppSectionList
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationAppSectionList *combinedAppSectionList;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_combinedAppSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ splitting combined app section list", buf, 0xCu);

    }
    -[NCNotificationStructuredSectionList allNotificationRequests](self->_combinedAppSectionList, "allNotificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self, "removeNotificationSectionList:animated:", self->_combinedAppSectionList, 0);
    combinedAppSectionList = self->_combinedAppSectionList;
    self->_combinedAppSectionList = 0;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__NCNotificationSummarizedInlineExpandingSectionList__splitCombinedAppSectionList__block_invoke;
    v9[3] = &unk_1E8D1B4B0;
    v9[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

uint64_t __82__NCNotificationSummarizedInlineExpandingSectionList__splitCombinedAppSectionList__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertNotificationRequestToAppSectionList:", a2);
}

- (void)_toggleCombinedAppSectionListIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& -[NCNotificationSummarizedInlineExpandingSectionList _shouldSplitCombinedAppSectionList](self, "_shouldSplitCombinedAppSectionList"))
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ splitting combined app section", (uint8_t *)&v9, 0xCu);

    }
    -[NCNotificationSummarizedInlineExpandingSectionList setCombinedAppSectionListActive:](self, "setCombinedAppSectionListActive:", 0);
    -[NCNotificationSummarizedInlineExpandingSectionList _splitCombinedAppSectionList](self, "_splitCombinedAppSectionList");
  }
  else if (!-[NCNotificationSummarizedInlineExpandingSectionList isCombinedAppSectionListActive](self, "isCombinedAppSectionListActive")&& -[NCNotificationSummarizedInlineExpandingSectionList _shouldCombineAppSectionLists](self, "_shouldCombineAppSectionLists"))
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ combining app sections", (uint8_t *)&v9, 0xCu);

    }
    -[NCNotificationSummarizedInlineExpandingSectionList setCombinedAppSectionListActive:](self, "setCombinedAppSectionListActive:", 1);
    -[NCNotificationSummarizedInlineExpandingSectionList _combineAppSectionLists](self, "_combineAppSectionLists");
  }
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  return (NCNotificationListCoalescingControlsHandlerDelegate *)objc_loadWeakRetained((id *)&self->handlerDelegate);
}

- (void)setHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->handlerDelegate, a3);
}

- (NSMutableDictionary)appSectionLists
{
  return self->_appSectionLists;
}

- (void)setAppSectionLists:(id)a3
{
  objc_storeStrong((id *)&self->_appSectionLists, a3);
}

- (NSMutableSet)appSectionListsToReloadOnCollapse
{
  return self->_appSectionListsToReloadOnCollapse;
}

- (void)setAppSectionListsToReloadOnCollapse:(id)a3
{
  objc_storeStrong((id *)&self->_appSectionListsToReloadOnCollapse, a3);
}

- (PLPlatterView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatterView, a3);
}

- (NCNotificationSummaryExpandedHeaderView)expandedHeaderView
{
  return self->_expandedHeaderView;
}

- (void)setExpandedHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedHeaderView, a3);
}

- (UIView)collapseButtonView
{
  return self->_collapseButtonView;
}

- (void)setCollapseButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_collapseButtonView, a3);
}

- (BOOL)reloadOrderingOnCollapse
{
  return self->_reloadOrderingOnCollapse;
}

- (void)setReloadOrderingOnCollapse:(BOOL)a3
{
  self->_reloadOrderingOnCollapse = a3;
}

- (NCToggleControl)leadingPlatterViewClearControl
{
  return self->_leadingPlatterViewClearControl;
}

- (void)setLeadingPlatterViewClearControl:(id)a3
{
  objc_storeStrong((id *)&self->_leadingPlatterViewClearControl, a3);
}

- (NCNotificationAppSectionList)combinedAppSectionList
{
  return self->_combinedAppSectionList;
}

- (void)setCombinedAppSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_combinedAppSectionList, a3);
}

- (BOOL)isCombinedAppSectionListActive
{
  return self->_combinedAppSectionListActive;
}

- (void)setCombinedAppSectionListActive:(BOOL)a3
{
  self->_combinedAppSectionListActive = a3;
}

- (BOOL)reloadCombinedAppSectionListOnCollapse
{
  return self->_reloadCombinedAppSectionListOnCollapse;
}

- (void)setReloadCombinedAppSectionListOnCollapse:(BOOL)a3
{
  self->_reloadCombinedAppSectionListOnCollapse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedAppSectionList, 0);
  objc_storeStrong((id *)&self->_leadingPlatterViewClearControl, 0);
  objc_storeStrong((id *)&self->_collapseButtonView, 0);
  objc_storeStrong((id *)&self->_expandedHeaderView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_appSectionListsToReloadOnCollapse, 0);
  objc_storeStrong((id *)&self->_appSectionLists, 0);
  objc_destroyWeak((id *)&self->handlerDelegate);
}

@end
