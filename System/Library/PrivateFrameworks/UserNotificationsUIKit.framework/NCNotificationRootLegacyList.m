@implementation NCNotificationRootLegacyList

- (NCNotificationRootLegacyList)initWithListView:(id)a3
{
  id v4;
  NCNotificationRootLegacyList *v5;
  NCNotificationListRevealCoordinator *v6;
  NCNotificationListRevealCoordinator *revealCoordinator;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NCNotificationListInteractiveTransitionCoordinator *v15;
  NCNotificationListInteractiveTransitionCoordinator *interactiveTransitionCoordinator;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationRootLegacyList;
  v5 = -[NCNotificationRootList initWithListView:](&v19, sel_initWithListView_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(NCNotificationListRevealCoordinator);
    revealCoordinator = v5->_revealCoordinator;
    v5->_revealCoordinator = v6;

    -[NCNotificationListRevealCoordinator setDelegate:](v5->_revealCoordinator, "setDelegate:", v5);
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationRootList logDescription](v5, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ configuring interactive transition coordinator", buf, 0xCu);

    }
    -[NCNotificationRootList incomingSectionList](v5, "incomingSectionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "listView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationRootList historySectionList](v5, "historySectionList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "listView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[NCNotificationListInteractiveTransitionCoordinator initWithParentListView:interactiveListView:revealListView:]([NCNotificationListInteractiveTransitionCoordinator alloc], "initWithParentListView:interactiveListView:revealListView:", v4, v12, v14);
    interactiveTransitionCoordinator = v5->_interactiveTransitionCoordinator;
    v5->_interactiveTransitionCoordinator = v15;

    -[NCNotificationListInteractiveTransitionCoordinator setDelegate:](v5->_interactiveTransitionCoordinator, "setDelegate:", v5);
    -[NCNotificationListInteractiveTransitionCoordinator setCurrentListDisplayStyleSetting:](v5->_interactiveTransitionCoordinator, "setCurrentListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](v5, "currentListDisplayStyleSetting"));
    -[NCNotificationRootList rootListView](v5, "rootListView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v5);

  }
  return v5;
}

- (void)_setForceRevealed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceRevealed:", v3);

}

- (void)_updateIndexForReveal
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexForReveal");

  -[NCNotificationRootList notificationListSections](self, "notificationListSections");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "indexOfObject:", v4);

  if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
  {
    if (-[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))
    {
      -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "indexOfObject:", v6);

    }
  }
  else
  {
    ++v5;
  }
  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIndexForReveal:", v5);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndexForReveal:", v5);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (unint64_t)_indexForReveal
{
  void *v2;
  unint64_t v3;

  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexForReveal");

  return v3;
}

- (void)_updateRevealCoordinator
{
  void *v3;
  void *v4;
  id v5;

  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootLegacyList subListsForNotificationListRevealCoordinator:](self, "subListsForNotificationListRevealCoordinator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubLists:", v4);

}

- (void)_currentDisplayListStyleSettingsChanged:(int64_t)a3
{
  -[NCNotificationListInteractiveTransitionCoordinator setCurrentListDisplayStyleSetting:](self->_interactiveTransitionCoordinator, "setCurrentListDisplayStyleSetting:", a3);
}

- (BOOL)_isAdditionalPanGestureActive
{
  return -[NCNotificationListInteractiveTransitionCoordinator isPanGestureRecognizerActive](self->_interactiveTransitionCoordinator, "isPanGestureRecognizerActive");
}

- (void)_setRevealed:(BOOL)a3 forSection:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v4 = a3;
  v5 = a4;
  objc_msgSend(v5, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRevealed:", v4);

  objc_msgSend(v5, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (v4)
    v7 = 1.0;
  objc_msgSend(v8, "setRevealPercentage:", v7);

}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void (**scrollCompletionBlock)(void);
  id v34;
  void *v35;
  double v36;
  double v37;
  double scrollCompletionBlockOffsetThreshold;
  void *v39;
  void *v40;
  id v41;
  id v42;

  v42 = a3;
  v8 = (void (**)(_QWORD))a5;
  -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v42;
  if (v9 == v42)
    goto LABEL_6;
  -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v42)
  {

    v10 = v9;
LABEL_6:

    goto LABEL_7;
  }
  v12 = (void *)v11;
  -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v42)
  {

LABEL_10:
    -[NCNotificationRootList notificationListSections](self, "notificationListSections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v26, "indexOfObject:", v42);

    goto LABEL_11;
  }
  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "containsSectionList:", v24);

  if ((v25 & 1) == 0)
    goto LABEL_10;
LABEL_7:
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "indexOfObject:", v15);

  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "indexOfSectionList:", v42);

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NCNotificationRootList historySectionList](self, "historySectionList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "listView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutOffsetForViewAtIndex:", v18);
    v22 = v21;

    a4 = v22 + a4;
  }
LABEL_11:
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    -[NCNotificationRootList rootListView](self, "rootListView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutOffsetForViewAtIndex:", v16);
    v29 = v28;

    v30 = a4 + v29;
    -[NCNotificationRootList rootListView](self, "rootListView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contentOffset");
    if (v30 <= v32)
      v30 = v30 + -100.0;

    scrollCompletionBlock = (void (**)(void))self->_scrollCompletionBlock;
    if (scrollCompletionBlock)
    {
      scrollCompletionBlock[2]();
      v34 = self->_scrollCompletionBlock;
      self->_scrollCompletionBlock = 0;

    }
    self->_scrollCompletionBlockOffsetThreshold = v30 + 10.0;
    -[NCNotificationRootList rootListView](self, "rootListView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentOffset");
    v37 = v36;
    scrollCompletionBlockOffsetThreshold = self->_scrollCompletionBlockOffsetThreshold;

    if (v37 >= scrollCompletionBlockOffsetThreshold)
    {
      -[NCNotificationRootList rootListView](self, "rootListView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "_setContentOffsetWithDecelerationAnimation:", 0.0, v30);

      v40 = (void *)objc_msgSend(v8, "copy");
      v41 = self->_scrollCompletionBlock;
      self->_scrollCompletionBlock = v40;

      goto LABEL_21;
    }
  }
  v8[2](v8);
LABEL_21:

}

- (void)notificationListInteractiveTransitionCoordinator:(id)a3 didUpdateListDisplaySetting:(int64_t)a4 isPersistentSetting:(BOOL)a5 hideRevealedList:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v7 = a5;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "regroupNotificationGroups");

  -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"));

  if (v7)
  {
    -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("NCNotificationListDisplayStyleReasonSystemSetting"));

    -[NCNotificationRootLegacyList _updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:](self, "_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:", a4);
  }
  -[NCNotificationRootList _updateNotificationListDisplayStyleSetting](self, "_updateNotificationListDisplayStyleSetting");
  if (v6 && -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"))
  {
    -[NCNotificationRootList historySectionList](self, "historySectionList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "regroupNotificationGroups");

    -[NCNotificationRootList _setNotificationHistoryWasRevealed:](self, "_setNotificationHistoryWasRevealed:", 0);
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setForceRevealed:", 0);

  }
  if (a4 == 2)
    -[NCNotificationRootList _setListDisplayStyleWasHiddenForUserInteraction:](self, "_setListDisplayStyleWasHiddenForUserInteraction:", 1);
}

- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsCountForInteractiveListView:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  unint64_t v10;

  v5 = a4;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
    return 0;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (void)notificationListInteractiveTransitionCoordinatorRequestsMigratingProminentNotificationsForHiddenSetting:(id)a3
{
  void *v4;
  uint64_t v5;

  if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting", a3) == 2)
  {
    -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "notificationCount");

    if (v5)
    {
      -[NCNotificationRootList _migrateNotificationsFromProminentIncomingSectionToIncomingSection](self, "_migrateNotificationsFromProminentIncomingSectionToIncomingSection");
      -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
    }
  }
}

- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsIndexForInteractiveListView:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = a4;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[NCNotificationRootList notificationListSections](self, "notificationListSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  return v11;
}

- (BOOL)notificationListRevealCoordinatorShouldAllowReveal:(id)a3
{
  NCNotificationRootLegacyList *v3;
  void *v4;

  v3 = self;
  -[NCNotificationRootList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "notificationRootListShouldAllowNotificationHistoryReveal:", v3);

  return (char)v3;
}

- (BOOL)notificationListRevealCoordinatorShouldAllowRevealTransition:(id)a3
{
  void *v3;
  BOOL v4;

  -[NCNotificationRootList historySectionList](self, "historySectionList", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationCount") != 0;

  return v4;
}

- (id)subListsForNotificationListRevealCoordinator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationRootList supplementaryViewsSections](self, "supplementaryViewsSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke;
  v15[3] = &unk_1E8D1B830;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke_2;
  v13[3] = &unk_1E8D1B648;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "listView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "listView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)notificationListRevealCoordinator:(id)a3 updatedRevealState:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a4;
  -[NCNotificationRootList _setNotificationHistoryWasRevealed:](self, "_setNotificationHistoryWasRevealed:", a4);
  -[NCNotificationRootList rootListView](self, "rootListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", objc_msgSend(v8, "userInterfaceIdiom") != 1);

    -[NCNotificationRootList rootListView](self, "rootListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSublistsRevealed:", 1);

    if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"))
      -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 0, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"), 0);
  }
  else
  {
    objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);

    -[NCNotificationRootList rootListView](self, "rootListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSublistsRevealed:", 0);

  }
  -[NCNotificationRootList delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationListComponentChangedContent:", self);

  if (v4)
  {
    if (-[NCNotificationRootList isUpcomingDigestVisible](self, "isUpcomingDigestVisible"))
    {
      -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "notificationCount");

      if (v13)
      {
        -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "summaryOrderProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "atxLogSummaryPlatterShownIsUpcoming:", 1);

      }
    }
    -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "notificationCount");

    if (v17)
    {
      -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "summaryOrderProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "atxLogSummaryPlatterShownIsUpcoming:", 1);

    }
  }
}

- (void)revealCoordinatorDidScrollToReveal:(id)a3
{
  id v4;

  -[NCNotificationRootList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRootListDidScrollToRevealNotificationHistory:", self);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isDecelerating") & 1) == 0)
  {
    v5 = *MEMORY[0x1E0DC5F90];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_BEGIN", " enableTelemetry=YES ", v10, 2u);
    }
    kdebug_trace();
  }
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRootList:scrollViewWillBeginDragging:", self, v4);

  -[NCNotificationListInteractiveTransitionCoordinator interactiveTranslationWillBegin](self->_interactiveTransitionCoordinator, "interactiveTranslationWillBegin");
  -[NCNotificationRootLegacyList setPerformingExclusiveScrollInteractiveTranslation:](self, "setPerformingExclusiveScrollInteractiveTranslation:", -[NCNotificationListInteractiveTransitionCoordinator isPerformingExclusiveScrollInteractiveTranslation](self->_interactiveTransitionCoordinator, "isPerformingExclusiveScrollInteractiveTranslation"));
  if (objc_msgSend(v6, "notificationRootListShouldAllowNotificationHistoryReveal:", self))
    v7 = !-[NCNotificationRootLegacyList isPerformingExclusiveScrollInteractiveTranslation](self, "isPerformingExclusiveScrollInteractiveTranslation");
  else
    LOBYTE(v7) = 0;
  self->_shouldAllowNotificationHistoryReveal = v7;
  if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal"))
  {
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList rootListView](self, "rootListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationListWillBeginDragging:", v9);

  }
  -[NCNotificationRootList _cancelTouchesOnLiveActivities:](self, "_cancelTouchesOnLiveActivities:", 1);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id scrollCompletionBlock;
  double v28;
  void *v29;
  id v30;

  v30 = a3;
  -[NCNotificationRootList delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRootList:scrollViewDidScroll:", self, v30);

  objc_msgSend(v30, "contentOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v30, "panGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "velocityInView:", v30);
  v11 = v10;
  objc_msgSend(v9, "translationInView:", v30);
  v13 = v12;
  -[NCNotificationRootList rootListView](self, "rootListView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentLayoutOffset");
  v16 = v15;

  if (v16 > 0.0)
  {
    -[NCNotificationRootList historySectionList](self, "historySectionList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
      v18 = 1;
    else
      v18 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") != 0;

    if (objc_msgSend(v30, "isTracking"))
    {
      v19 = v11 != 0.0 || v18;
      if (v11 < 0.0 || !v19)
      {
        objc_msgSend(v30, "contentInset");
        v8 = -v20;
        -[NCNotificationRootList rootListView](self, "rootListView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setInteractionTranslation:", v13);

        v6 = 0.0;
      }
    }
    if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal")&& objc_msgSend(v30, "isTracking"))
    {
      -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setInteractionTranslation:", -v13);

    }
    objc_msgSend(v30, "setContentOffset:", v6, v8);
  }
  -[NCNotificationRootList rootListView](self, "rootListView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  -[NCNotificationRootList _updateVisibleRectForContentOffset:size:](self, "_updateVisibleRectForContentOffset:size:", v6, v8);

  if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal"))
  {
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList rootListView](self, "rootListView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "notificationListDidScroll:", v25);

  }
  if (self->_scrollCompletionBlock)
  {
    -[NCNotificationRootLegacyList scrollCompletionBlockOffsetThreshold](self, "scrollCompletionBlockOffsetThreshold");
    if (v8 < v26)
    {
      (*((void (**)(void))self->_scrollCompletionBlock + 2))();
      scrollCompletionBlock = self->_scrollCompletionBlock;
      self->_scrollCompletionBlock = 0;

    }
  }
  if (objc_msgSend(v30, "isTracking"))
    -[NCNotificationListInteractiveTransitionCoordinator updateScrollInteractiveTranslation](self->_interactiveTransitionCoordinator, "updateScrollInteractiveTranslation");
  objc_msgSend(v30, "contentInset");
  if (v8 + v28 <= 24.0)
  {
    -[NCNotificationRootList rootListView](self, "rootListView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNeedsLayout");

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[NCNotificationRootList delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationRootList:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, v9, a5, x, y);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentLayoutOffset");
  v13 = v12;

  if (v13 != 0.0)
  {
    -[NCNotificationRootList rootListView](self, "rootListView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentInset");
    a5->x = 0.0;
    a5->y = -v15;

  }
  if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal"))
  {
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList rootListView](self, "rootListView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notificationListViewWillEndDragging:withTargetContentOffset:", v17, a5);

  }
  -[NCNotificationRootList rootListView](self, "rootListView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActiveRevealTransitioning:", 0);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInteractionTranslation:", 0.0);

  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInteractionTranslation:", 0.0);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  v5 = *MEMORY[0x1E0DC5F90];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_END", " enableTelemetry=YES ", v13, 2u);
  }
  kdebug_trace();
  -[NCNotificationRootLegacyList setPerformingExclusiveScrollInteractiveTranslation:](self, "setPerformingExclusiveScrollInteractiveTranslation:", 0);
  -[NCNotificationRootList rootListView](self, "rootListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteractionTranslation:", 0.0);

  -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteractionTranslation:", 0.0);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  -[NCNotificationRootList updateListViewVisibleRectForSize:](self, "updateListViewVisibleRectForSize:", v9, v10);

  if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal"))
  {
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList rootListView](self, "rootListView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationListViewDidEndDecelerating:", v12);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  if (!v4)
  {
    v7 = *MEMORY[0x1E0DC5F90];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_END", " enableTelemetry=YES ", v10, 2u);
    }
    kdebug_trace();
  }
  if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal"))
  {
    -[NCNotificationRootLegacyList revealCoordinator](self, "revealCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList rootListView](self, "rootListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationListViewDidEndDragging:willDecelerate:", v9, v4);

  }
  -[NCNotificationListInteractiveTransitionCoordinator interactiveTranslationDidEnd](self->_interactiveTransitionCoordinator, "interactiveTranslationDidEnd");
  -[NCNotificationRootList _cancelTouchesOnLiveActivities:](self, "_cancelTouchesOnLiveActivities:", 0);

}

- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NCNotificationRootList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "notificationSystemSettingsForNotificationListComponent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "listDisplayStyleSetting") != a3)
    {
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v7, "setListDisplayStyleSetting:", a3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "notificationListComponent:setNotificationSystemSettings:", self, v7);

    }
  }
  else
  {
    v6 = 0;
  }

}

- (NCNotificationListRevealCoordinator)revealCoordinator
{
  return self->_revealCoordinator;
}

- (void)setRevealCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_revealCoordinator, a3);
}

- (NCNotificationListInteractiveTransitionCoordinator)interactiveTransitionCoordinator
{
  return self->_interactiveTransitionCoordinator;
}

- (void)setInteractiveTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionCoordinator, a3);
}

- (BOOL)shouldAllowNotificationHistoryReveal
{
  return self->_shouldAllowNotificationHistoryReveal;
}

- (void)setShouldAllowNotificationHistoryReveal:(BOOL)a3
{
  self->_shouldAllowNotificationHistoryReveal = a3;
}

- (id)scrollCompletionBlock
{
  return self->_scrollCompletionBlock;
}

- (void)setScrollCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (double)scrollCompletionBlockOffsetThreshold
{
  return self->_scrollCompletionBlockOffsetThreshold;
}

- (void)setScrollCompletionBlockOffsetThreshold:(double)a3
{
  self->_scrollCompletionBlockOffsetThreshold = a3;
}

- (BOOL)isPerformingExclusiveScrollInteractiveTranslation
{
  return self->_performingExclusiveScrollInteractiveTranslation;
}

- (void)setPerformingExclusiveScrollInteractiveTranslation:(BOOL)a3
{
  self->_performingExclusiveScrollInteractiveTranslation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollCompletionBlock, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_revealCoordinator, 0);
}

@end
