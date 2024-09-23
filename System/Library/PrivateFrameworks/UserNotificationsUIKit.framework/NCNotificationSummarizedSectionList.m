@implementation NCNotificationSummarizedSectionList

- (NSUUID)atxUUID
{
  return -[NCNotificationSummaryOrderProvider atxUUID](self->_summaryOrderProvider, "atxUUID");
}

- (void)setSummaryOrderProvider:(id)a3
{
  void *v5;
  void *v6;
  NCNotificationSummaryOrderProvider *v7;

  v7 = (NCNotificationSummaryOrderProvider *)a3;
  if (self->_summaryOrderProvider != v7)
  {
    objc_storeStrong((id *)&self->_summaryOrderProvider, a3);
    -[NCNotificationSummaryOrderProvider setDelegate:](v7, "setDelegate:", self);
    -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateData");

    -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    -[NCNotificationSummarizedSectionList _configureSummaryPlatterViewSwipeInteractionIfNecessary](self, "_configureSummaryPlatterViewSwipeInteractionIfNecessary");
  }

}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList mergeNotificationGroups:reorderGroupNotifications:](&v5, sel_mergeNotificationGroups_reorderGroupNotifications_, a3, a4);
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList updateNotificationSectionSettings:previousSectionSettings:](&v5, sel_updateNotificationSectionSettings_previousSectionSettings_, a3, a4);
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 0);
}

- (void)clearAll
{
  objc_super v3;

  -[NCNotificationSummarizedSectionList setPerformingClearAll:](self, "setPerformingClearAll:", 1);
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList clearAll](&v3, sel_clearAll);
  -[NCNotificationSummarizedSectionList setPerformingClearAll:](self, "setPerformingClearAll:", 0);
}

- (void)insertNotificationRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationStructuredSectionList insertNotificationRequest:](&v4, sel_insertNotificationRequest_, a3);
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 1);
  -[NCNotificationSummarizedSectionList _configureSummaryPlatterViewSwipeInteractionIfNecessary](self, "_configureSummaryPlatterViewSwipeInteractionIfNecessary");
}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[NCNotificationCombinedSectionList containsNotificationRequest:](self, "containsNotificationRequest:", v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationSummarizedSectionList;
    -[NCNotificationStructuredSectionList removeNotificationRequest:](&v5, sel_removeNotificationRequest_, v4);
    -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 0);
  }

}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](self->_summaryOrderProvider, "setDeviceAuthenticated:");
  if (-[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated") != v3)
  {
    if (v3)
    {
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPerformingContentRevealAnimation:", 1);

    }
    else
    {
      -[NCNotificationSummarizedSectionList _collapseSection](self, "_collapseSection");
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList setDeviceAuthenticated:](&v6, sel_setDeviceAuthenticated_, v3);
}

- (id)comparisonDate
{
  void *v2;
  void *v3;

  -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  id v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v8 = a3;
  v9 = -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex");
  v10 = -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex");
  if (a4 || !v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)NCNotificationSummarizedSectionList;
    -[NCNotificationCombinedSectionList notificationListView:heightForItemAtIndex:withWidth:](&v16, sel_notificationListView_heightForItemAtIndex_withWidth_, v8, a4 - v9, a5);
    v13 = v14;
  }
  else
  {
    -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", a5, 0.0);
    v13 = v12;

  }
  return v13;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex");
  v8 = -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex");
  if (a4 || !v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationSummarizedSectionList;
    -[NCNotificationCombinedSectionList notificationListView:viewForItemAtIndex:](&v12, sel_notificationListView_viewForItemAtIndex_, v6, a4 - v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummarizedSectionList;
  v4 = -[NCNotificationStructuredSectionList notificationListViewNumberOfItems:](&v6, sel_notificationListViewNumberOfItems_, a3);
  return (unint64_t)v4 + -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex");
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 40.0;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList notificationListComponent:didRemoveNotificationRequest:](&v10, sel_notificationListComponent_didRemoveNotificationRequest_, a3, a4);
  if (!-[NCNotificationCombinedSectionList notificationCount](self, "notificationCount"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGrouped:", 1);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadHeaderView");

    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NCNotificationStructuredSectionList sectionType](self, "sectionType");
    -[NCNotificationSummarizedSectionList atxUUID](self, "atxUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissedSectionType:withUUID:", v8, v9);

  }
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 0);
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList notificationListBaseComponentDidRemoveAll:](&v9, sel_notificationListBaseComponentDidRemoveAll_, a3);
  if (!-[NCNotificationCombinedSectionList notificationCount](self, "notificationCount"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGrouped:", 1);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadHeaderView");

    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NCNotificationStructuredSectionList sectionType](self, "sectionType");
    -[NCNotificationSummarizedSectionList atxUUID](self, "atxUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissedSectionType:withUUID:", v7, v8);

  }
  -[NCNotificationSummarizedSectionList _updateSectionForRankOrderedIfNecessaryAndReloadDigest:](self, "_updateSectionForRankOrderedIfNecessaryAndReloadDigest:", 0);
}

- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationStructuredSectionList listView](self, "listView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped") ^ 1;

  return v4;
}

- (void)sectionHeaderViewDidRequestCollapsing:(id)a3
{
  -[NCNotificationSummarizedSectionList _didPerformSignificantUserInteraction](self, "_didPerformSignificantUserInteraction", a3);
  -[NCNotificationSummarizedSectionList _collapseSection](self, "_collapseSection");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationCombinedSectionList adjustForContentSizeCategoryChange](&v5, sel_adjustForContentSizeCategoryChange);
  -[NCNotificationSummaryOrderProvider adjustForContentSizeCategoryChange](self->_summaryOrderProvider, "adjustForContentSizeCategoryChange");
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadViewAtIndex:", 0);

  return 1;
}

- (void)notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[NCNotificationStructuredSectionList listView](self, "listView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGrouped");

  if (v5)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadViewAtIndex:", 0);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (id)materialGroupNameBaseForNotificationSummaryOrderProvider:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notificationSummaryOrderProvider:(id)a3 requestsPerformingDefaultActionForNotificationRequest:(id)a4 inGroupList:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v9, CFSTR("NCNotificationActionDeferClearForNotificationSummaryKey"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationListComponent:requestsExecuteAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v11, v8, 1, v12, 0);

}

- (void)notificationSummaryOrderProvider:(id)a3 didUpdateOrderedNotificationGroupLists:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isGrouped") & 1) == 0)
    goto LABEL_8;
  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 != objc_msgSend(v5, "count"))
  {

LABEL_8:
    goto LABEL_9;
  }
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToArray:", v5);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reordering notification group lists", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList setNotificationGroups:](self, "setNotificationGroups:", v14);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidateData");

  }
LABEL_9:

}

- (id)titlesForSectionListsInSummaryForSummaryOrderProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__NCNotificationSummarizedSectionList_titlesForSectionListsInSummaryForSummaryOrderProvider___block_invoke;
  v8[3] = &unk_1E8D1B648;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __93__NCNotificationSummarizedSectionList_titlesForSectionListsInSummaryForSummaryOrderProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4
{
  return a4 == 1;
}

- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationStructuredSectionList listView](self, "listView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  return v4;
}

- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a4 != 1)
    return 0;
  -[NCNotificationSummarizedSectionList _clearAction](self, "_clearAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewToMoveForSwipeInteraction:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryPlatterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3
{
  return 23.5;
}

- (void)swipeInteractionDidSignificantUserInteraction:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

- (void)swipeInteractionDidBeginRevealingActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationSummarizedSectionList setHorizontallyDisplaced:](self, "setHorizontallyDisplaced:", 1);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didTransitionActionsForSwipeInteraction:revealed:", self, v4, 1);

}

- (void)swipeInteractionDidBeginHidingActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationSummarizedSectionList setHorizontallyDisplaced:](self, "setHorizontallyDisplaced:", 0);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didTransitionActionsForSwipeInteraction:revealed:", self, v4, 0);

}

- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4
{
  if (a4 == 0.0)
    -[NCNotificationSummarizedSectionList _resetSwipeClipping](self, "_resetSwipeClipping", a3);
  else
    -[NCNotificationSummarizedSectionList _configureSwipeClippingIfNecessary](self, "_configureSwipeClippingIfNecessary", a3);
}

- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationStructuredSectionList _insertViewToListAtIndex:animated:](&v4, sel__insertViewToListAtIndex_animated_, a3 + -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex"), a4);
}

- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummarizedSectionList;
  -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](&v5, sel__removeViewFromListAtIndex_animated_isHorizontallyDisplaced_, a3 + -[NCNotificationSummarizedSectionList shouldAdjustIndex](self, "shouldAdjustIndex"), a4, a5);
}

- (id)_newSectionHeaderView
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  v2 = -[NCNotificationStructuredSectionList _newSectionHeaderView](&v4, sel__newSectionHeaderView);
  objc_msgSend(v2, "setShowCollapseButton:", 1);
  return v2;
}

- (void)_configureSectionListView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummarizedSectionList;
  v3 = a3;
  -[NCNotificationStructuredSectionList _configureSectionListView:](&v4, sel__configureSectionListView_, v3);
  objc_msgSend(v3, "setSupportsGrouping:", 1, v4.receiver, v4.super_class);

}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (id)_notificationGroupsForDigestRankOrdering
{
  void *v2;
  void *v3;

  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)shouldAdjustIndex
{
  void *v2;
  char v3;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGrouped");

  return v3;
}

- (NCNotificationSummaryPlatterContainingView)summaryPlatterContainingView
{
  void *v3;
  void *v4;
  void *v5;
  NCNotificationSummaryPlatterContainingView *v6;
  NCNotificationSummaryPlatterContainingView *summaryPlatterContainingView;

  if (!self->_summaryPlatterContainingView)
  {
    v6 = objc_alloc_init(NCNotificationSummaryPlatterContainingView);
    summaryPlatterContainingView = self->_summaryPlatterContainingView;
    self->_summaryPlatterContainingView = v6;

    -[NCNotificationSummaryOrderProvider leadingSummaryPlatterView](self->_summaryOrderProvider, "leadingSummaryPlatterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[NCNotificationSummaryOrderProvider leadingSummaryPlatterView](self->_summaryOrderProvider, "leadingSummaryPlatterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryPlatterContainingView summaryPlatterView](self->_summaryPlatterContainingView, "summaryPlatterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v3)
  {
    -[NCNotificationSummaryPlatterContainingView summaryPlatterView](self->_summaryPlatterContainingView, "summaryPlatterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

LABEL_5:
    -[NCNotificationSummaryPlatterContainingView addSubview:](self->_summaryPlatterContainingView, "addSubview:", v3);
    -[NCNotificationSummaryPlatterContainingView setSummaryPlatterView:](self->_summaryPlatterContainingView, "setSummaryPlatterView:", v3);
  }

  return self->_summaryPlatterContainingView;
}

- (void)_hideSummaryPlatterView
{
  id v2;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeViewAtIndex:animated:", 0, 1);

}

- (void)_showSummaryPlatterView
{
  id v2;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertViewAtIndex:animated:", 0, 1);

}

- (void)_expandSection
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NCNotificationSummarizedSectionList *v17;
  id v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NCNotificationSummarizedSectionList _didPerformSignificantUserInteraction](self, "_didPerformSignificantUserInteraction");
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  if (-[NCNotificationCombinedSectionList count](self, "count") && v4)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Expanding summarized section %@", buf, 0xCu);

    }
    -[NCNotificationSummarizedSectionList _prepareForExpand](self, "_prepareForExpand");
    v8 = -[NCNotificationStructuredSectionList sectionType](self, "sectionType") == 3
      || -[NCNotificationStructuredSectionList sectionType](self, "sectionType") == 5;
    -[NCNotificationSummarizedSectionList summaryOrderProvider](self, "summaryOrderProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "atxLogSummaryPlatterExpandedIsUpcoming:", v8);

    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NCNotificationStructuredSectionList sectionType](self, "sectionType");
    -[NCNotificationSummarizedSectionList atxUUID](self, "atxUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "expandedSectionType:withUUID:", v11, v12);

    objc_initWeak((id *)buf, self);
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__NCNotificationSummarizedSectionList__expandSection__block_invoke;
    v15[3] = &unk_1E8D1E430;
    objc_copyWeak(&v18, (id *)buf);
    v19 = v4;
    v14 = v13;
    v16 = v14;
    v17 = self;
    objc_msgSend(v14, "notificationListComponent:requestsAuthenticationAndPerformBlock:", self, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

void __53__NCNotificationSummarizedSectionList__expandSection__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_reloadGroupListLeadingNotificationRequests");
    objc_msgSend(WeakRetained, "listView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGrouped:", *(_BYTE *)(a1 + 56) == 0);

    objc_msgSend(WeakRetained, "_hideSummaryPlatterView");
    objc_msgSend(*(id *)(a1 + 32), "notificationStructuredSectionList:transitionedGroupedStateIsGrouped:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(WeakRetained, "summaryPlatterViewSwipeInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);

  }
}

- (void)_collapseSection
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Collapsing summarized section %@", (uint8_t *)&v10, 0xCu);

    }
    -[NCNotificationSummarizedSectionList _collapseAllGroupListViews](self, "_collapseAllGroupListViews");
    -[NCNotificationSummarizedSectionList _collapseAllSectionListViews](self, "_collapseAllSectionListViews");
    -[NCNotificationSummarizedSectionList _showSummaryPlatterView](self, "_showSummaryPlatterView");
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGrouped:", 1);

    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationStructuredSectionList:transitionedGroupedStateIsGrouped:", self, 1);

  }
}

- (void)_collapseAllSectionListViews
{
  id v2;

  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_27);

}

void __67__NCNotificationSummarizedSectionList__collapseAllSectionListViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "collapseSummarizedSectionList");

}

- (void)_collapseAllGroupListViews
{
  id v2;

  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_54);

}

void __65__NCNotificationSummarizedSectionList__collapseAllGroupListViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "listView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGrouped:", 1);

}

- (void)_reloadGroupListLeadingNotificationRequests
{
  void *v3;
  id v4;

  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_55);

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

uint64_t __82__NCNotificationSummarizedSectionList__reloadGroupListLeadingNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadLeadingNotificationRequestIfNecessary");
}

- (void)_didPerformSignificantUserInteraction
{
  id v3;

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

- (void)_updateSectionForRankOrderedIfNecessaryAndReloadDigest:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[NCNotificationSummarizedSectionList _notificationGroupsForDigestRankOrdering](self, "_notificationGroupsForDigestRankOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NCNotificationSummarizedSectionList isPerformingClearAll](self, "isPerformingClearAll")
    && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_59);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      || (-[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self->_summaryOrderProvider, "cachedOrderedNotificationGroupLists"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v6, "isEqualToArray:", v7), v7, (v8 & 1) == 0))
    {
      v9 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v11;
        v14 = 1024;
        v15 = v3;
        _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ updating summary and section rank ordering [reloadDigest=%{BOOL}d]", (uint8_t *)&v12, 0x12u);

      }
      -[NCNotificationSummaryOrderProvider updateSummaryOrderWithNotificationGroupLists:reloadDigest:](self->_summaryOrderProvider, "updateSummaryOrderWithNotificationGroupLists:reloadDigest:", v6, v3);
    }

  }
}

BOOL __94__NCNotificationSummarizedSectionList__updateSectionForRankOrderedIfNecessaryAndReloadDigest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

- (void)_configureSummaryPlatterViewSwipeInteractionIfNecessary
{
  void *v3;
  void *v4;
  PLSwipeInteraction *summaryPlatterViewSwipeInteraction;
  PLSwipeInteraction *v6;
  PLSwipeInteraction *v7;
  void *v8;
  PLSwipeInteraction *v9;
  void *v10;
  void *v11;
  id v12;

  -[NCNotificationSummarizedSectionList summaryPlatterViewSwipeInteraction](self, "summaryPlatterViewSwipeInteraction");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      objc_msgSend(v3, "removeInteraction:", v12);
      -[NCNotificationSummarizedSectionList setSummaryPlatterViewSwipeInteraction:](self, "setSummaryPlatterViewSwipeInteraction:", 0);
    }
  }
  summaryPlatterViewSwipeInteraction = self->_summaryPlatterViewSwipeInteraction;
  if (summaryPlatterViewSwipeInteraction)
  {
    -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](summaryPlatterViewSwipeInteraction, "hideActionsAnimated:fastAnimation:completion:", 0, 0, 0);
  }
  else
  {
    v6 = (PLSwipeInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F8]), "initWithDelegate:", self);
    v7 = self->_summaryPlatterViewSwipeInteraction;
    self->_summaryPlatterViewSwipeInteraction = v6;

    -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInteraction:", self->_summaryPlatterViewSwipeInteraction);

    v9 = self->_summaryPlatterViewSwipeInteraction;
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSwipeInteraction setMaterialGroupNameBase:](v9, "setMaterialGroupNameBase:", v11);

  }
}

- (id)_clearAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__NCNotificationSummarizedSectionList__clearAction__block_invoke;
  v11 = &unk_1E8D1B1C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("NCNotificationSummarizedSectionListActionIdentifierClear"), &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPl_defaultAction:", 1, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __51__NCNotificationSummarizedSectionList__clearAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notificationStructuredSectionListRequestsClearingSection:", v3);

    WeakRetained = v3;
  }

}

- (void)_configureSwipeClippingIfNecessary
{
  if (-[NCNotificationSummarizedSectionList _shouldPerformSwipeClipping](self, "_shouldPerformSwipeClipping"))
    -[NCNotificationSummarizedSectionList _setupSwipeClipping](self, "_setupSwipeClipping");
  else
    -[NCNotificationSummarizedSectionList _resetSwipeClipping](self, "_resetSwipeClipping");
}

- (void)_setupSwipeClipping
{
  void *v2;
  id v3;

  -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaskedCorners:", 15);

  objc_msgSend(v3, "_setContinuousCornerRadius:", 23.5);
  objc_msgSend(v3, "setClipsToBounds:", 1);

}

- (void)_resetSwipeClipping
{
  void *v2;
  id v3;

  -[NCNotificationSummarizedSectionList summaryPlatterContainingView](self, "summaryPlatterContainingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaskedCorners:", 0);

  objc_msgSend(v3, "setClipsToBounds:", 0);
}

- (BOOL)_shouldPerformSwipeClipping
{
  uint64_t v2;
  void *v3;
  BOOL v5;

  v2 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "userInterfaceIdiom") == 1 || (unint64_t)(v2 - 3) < 2;

  return v5;
}

- (BOOL)isHorizontallyDisplaced
{
  return self->_horizontallyDisplaced;
}

- (void)setHorizontallyDisplaced:(BOOL)a3
{
  self->_horizontallyDisplaced = a3;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationSummaryOrderProvider)summaryOrderProvider
{
  return self->_summaryOrderProvider;
}

- (void)setSummaryPlatterContainingView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterContainingView, a3);
}

- (void)setShouldAdjustIndex:(BOOL)a3
{
  self->_shouldAdjustIndex = a3;
}

- (PLSwipeInteraction)summaryPlatterViewSwipeInteraction
{
  return self->_summaryPlatterViewSwipeInteraction;
}

- (void)setSummaryPlatterViewSwipeInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterViewSwipeInteraction, a3);
}

- (BOOL)isPerformingClearAll
{
  return self->_performingClearAll;
}

- (void)setPerformingClearAll:(BOOL)a3
{
  self->_performingClearAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPlatterViewSwipeInteraction, 0);
  objc_storeStrong((id *)&self->_summaryPlatterContainingView, 0);
  objc_storeStrong((id *)&self->_summaryOrderProvider, 0);
}

@end
