@implementation NCNotificationSummaryOrderProvider

+ (id)notificationSummaryOrderProviderOfType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return objc_alloc_init(*off_1E8D1CD78[a3]);
}

- (NCNotificationSummaryOrderProvider)init
{
  NCNotificationSummaryOrderProvider *v2;
  uint64_t v3;
  UITapGestureRecognizer *summaryPlatterViewTapGestureRecognizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryOrderProvider;
  v2 = -[NCNotificationSummaryOrderProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v2, sel__tapOnSummaryPlatterView);
    summaryPlatterViewTapGestureRecognizer = v2->_summaryPlatterViewTapGestureRecognizer;
    v2->_summaryPlatterViewTapGestureRecognizer = (UITapGestureRecognizer *)v3;

  }
  return v2;
}

+ (id)atxQueue
{
  if (atxQueue_onceToken != -1)
    dispatch_once(&atxQueue_onceToken, &__block_literal_global_6);
  return (id)atxQueue___queue;
}

void __46__NCNotificationSummaryOrderProvider_atxQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationSummaryOrderProvider", v2);
  v1 = (void *)atxQueue___queue;
  atxQueue___queue = (uint64_t)v0;

}

+ (id)atxDigestGeneratorClient
{
  if (atxDigestGeneratorClient_digestGeneratorClientOnceToken != -1)
    dispatch_once(&atxDigestGeneratorClient_digestGeneratorClientOnceToken, &__block_literal_global_14);
  return (id)atxDigestGeneratorClient___digestGeneratorClient;
}

void __62__NCNotificationSummaryOrderProvider_atxDigestGeneratorClient__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CF8F98]);
  v1 = (void *)atxDigestGeneratorClient___digestGeneratorClient;
  atxDigestGeneratorClient___digestGeneratorClient = (uint64_t)v0;

}

- (void)updateSummaryOrderWithNotificationGroupLists:(id)a3 reloadDigest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");
  -[NCNotificationSummaryOrderProvider setCachedOrderedNotificationGroupLists:](self, "setCachedOrderedNotificationGroupLists:", v7);

  -[NCNotificationSummaryOrderProvider updateLeadingSummaryPlatterView](self, "updateLeadingSummaryPlatterView");
  if (v4)
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryOrderProvider atxUserNotificationsArrayForNotificationGroupLists:](self, "atxUserNotificationsArrayForNotificationGroupLists:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "atxQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke;
    block[3] = &unk_1E8D1CB40;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    v11 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke_2;
  v4[3] = &unk_1E8D1CB18;
  v4[4] = WeakRetained;
  objc_msgSend(WeakRetained, "generateDigestForATXUserNotificationArrays:withCompletionBlock:", v3, v4);

}

void __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(*(id *)(a1 + 32), "cachedOrderedNotificationGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 32), "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v5, v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") && (v7 = objc_msgSend(v6, "count"), v7 == objc_msgSend(v5, "count")))
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "summaryHeading");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "Notification digest for \"%{public}@\" updating group ordering and summary platter view", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCachedOrderedNotificationGroupLists:", v6);
    objc_msgSend(*(id *)(a1 + 32), "updateLeadingSummaryPlatterView");
    objc_msgSend(*(id *)(a1 + 32), "updatedOrderedGroupLists");
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "summaryHeading");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v15;
      v18 = 2048;
      v19 = objc_msgSend(v6, "count");
      v20 = 2048;
      v21 = objc_msgSend(v5, "count");
      _os_log_error_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_ERROR, "Notification digest for \"%{public}@\" not updating summary and order [count=%ld; expectedCount=%ld]",
        (uint8_t *)&v16,
        0x20u);

    }
  }

}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  return 0;
}

- (id)materialGroupNameBase
{
  void *v3;
  void *v4;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materialGroupNameBaseForNotificationSummaryOrderProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updatedOrderedGroupLists
{
  void *v3;
  id v4;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryOrderProvider:didUpdateOrderedNotificationGroupLists:", self, v3);

}

- (id)titlesForSectionListsInSummary
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titlesForSectionListsInSummaryForSummaryOrderProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)listComponentDelegate
{
  void *v3;
  void *v4;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listComponentDelegateForSummaryPlatterViewForNotificationSummaryOrderProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)currentNotificationCount
{
  void *v3;
  unint64_t v4;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationCountForSummaryOrderProvider:", self);

  return v4;
}

- (id)clearControlViewForLeadingSummaryPlatterView
{
  void *v3;
  void *v4;

  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "clearControlViewForLeadingSummaryPlatterViewForSummaryOrderProvider:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)notificationRequestsInNotificationGroupLists:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "allNotificationRequests", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)notificationCountForNotificationGroupLists:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "notificationCount");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)representativeNotificationRequestsForNotificationGroupLists:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "count", (_QWORD)v14))
        {
          objc_msgSend(v10, "leadingNotificationRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "leadingNotificationRequest");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)atxUserNotificationsForNotificationRequests:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v6);
  return v5;
}

uint64_t __82__NCNotificationSummaryOrderProvider_atxUserNotificationsForNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atxUserNotification");
}

- (id)atxUserNotificationsArrayForNotificationGroupLists:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__NCNotificationSummaryOrderProvider_atxUserNotificationsArrayForNotificationGroupLists___block_invoke;
  v11[3] = &unk_1E8D1C678;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __89__NCNotificationSummaryOrderProvider_atxUserNotificationsArrayForNotificationGroupLists___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "allNotificationRequests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "atxUserNotificationsForNotificationRequests:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)orderedNotificationGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4 orderGroupNotifications:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NCNotificationSummaryOrderProvider representativeNotificationGroupListInGroupLists:forATXUserNotificationDigestNotificationGroup:](self, "representativeNotificationGroupListInGroupLists:forATXUserNotificationDigestNotificationGroup:", v8, v16, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
          {
            objc_msgSend(v10, "addObject:", v17);
            if (v5)
              -[NCNotificationSummaryOrderProvider _updateNotificationOrderingForGroupList:byATXDigestNotificationGroup:](self, "_updateNotificationOrderingForGroupList:byATXDigestNotificationGroup:", v17, v16);
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)_updateNotificationOrderingForGroupList:(id)a3 byATXDigestNotificationGroup:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "rankedNotifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allNotificationRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v9, "count");
  if (v12 == objc_msgSend(v11, "count"))
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke;
    v27 = &unk_1E8D1CB88;
    v13 = v11;
    v28 = v13;
    v14 = v8;
    v29 = v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v24);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13, v24, v25, v26, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToSet:", v16))
    {
      v17 = objc_msgSend(v13, "isEqualToArray:", v14);

      if ((v17 & 1) == 0)
      {
        v18 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          objc_msgSend(v5, "logDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v20;
          _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "Ranked digest updating notification ordering for group %{public}@", buf, 0xCu);

        }
        objc_msgSend(v5, "updateOrderedNotificationRequests:", v14);
      }
    }
    else
    {

    }
  }
  else
  {
    v21 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      objc_msgSend(v5, "logDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2048;
      v33 = objc_msgSend(v9, "count");
      v34 = 2048;
      v35 = objc_msgSend(v11, "count");
      _os_log_error_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_ERROR, "Ranked notification ordering for group %{public}@ is incorrect with count %ld and actual count %ld", buf, 0x20u);

    }
  }

}

void __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke_2;
  v12[3] = &unk_1E8D1C198;
  v11 = v6;
  v13 = v11;
  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v12);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

uint64_t __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)representativeNotificationGroupListInGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "representativeNotificationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankedNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke;
  v19[3] = &unk_1E8D1CBB0;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v8, "bs_firstObjectPassingTest:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_2;
    v16[3] = &unk_1E8D1CBD8;
    v17 = v12;
    v18 = v11;
    v13 = objc_msgSend(v5, "indexOfObjectPassingTest:", v16);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_3;
    v8[3] = &unk_1E8D1BF28;
    v9 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v3, "indexOfNotificationRequestPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)filterPresentNotificationGroupsInDigestNotificationGroups:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__NCNotificationSummaryOrderProvider_filterPresentNotificationGroupsInDigestNotificationGroups___block_invoke;
  v11[3] = &unk_1E8D1CC00;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __96__NCNotificationSummaryOrderProvider_filterPresentNotificationGroupsInDigestNotificationGroups___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "cachedOrderedNotificationGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representativeNotificationGroupListInGroupLists:forATXUserNotificationDigestNotificationGroup:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)configureSummaryContentDisplaying:(id)a3 withSummaryContentProviding:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "summaryTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSummaryTitle:", v6);

  objc_msgSend(v5, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSummary:", v7);

  objc_msgSend(v5, "summaryIconSymbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v12, "setSummaryIconSymbolName:", v8);
  }
  else
  {
    objc_msgSend(v5, "summaryIconViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSummaryIconViews:", v9);

  }
  objc_msgSend(v12, "setIconViewLeading:", objc_msgSend(v5, "isIconViewLeading"));
  objc_msgSend(v5, "summaryTitleFontName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSummaryTitleFontName:", v10);

  objc_msgSend(v5, "summaryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSummaryDate:", v11);

}

- (void)_tapOnSummaryPlatterView
{
  id v3;

  if (-[NCNotificationSummaryOrderProvider _shouldAllowTapOnLeadingSummaryPlatterView](self, "_shouldAllowTapOnLeadingSummaryPlatterView"))
  {
    -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationSummaryOrderProviderDidTapOnLeadingSummaryPlatterView:", self);

  }
}

- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView
{
  return 1;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationSummaryOrderProviderDelegate)delegate
{
  return (NCNotificationSummaryOrderProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  self->_deviceAuthenticated = a3;
}

- (int64_t)atxDigestDeliveryTime
{
  return self->_atxDigestDeliveryTime;
}

- (void)setAtxDigestDeliveryTime:(int64_t)a3
{
  self->_atxDigestDeliveryTime = a3;
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)summaryHeading
{
  return self->_summaryHeading;
}

- (void)setSummaryHeading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (DNDMode)dndMode
{
  return self->_dndMode;
}

- (void)setDndMode:(id)a3
{
  objc_storeStrong((id *)&self->_dndMode, a3);
}

- (BOOL)isOnboardingSummary
{
  return self->_onboardingSummary;
}

- (void)setOnboardingSummary:(BOOL)a3
{
  self->_onboardingSummary = a3;
}

- (NSUUID)atxUUID
{
  return self->_atxUUID;
}

- (NSArray)cachedOrderedNotificationGroupLists
{
  return self->_cachedOrderedNotificationGroupLists;
}

- (void)setCachedOrderedNotificationGroupLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UITapGestureRecognizer)summaryPlatterViewTapGestureRecognizer
{
  return self->_summaryPlatterViewTapGestureRecognizer;
}

- (void)setSummaryPlatterViewTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterViewTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPlatterViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cachedOrderedNotificationGroupLists, 0);
  objc_storeStrong((id *)&self->_atxUUID, 0);
  objc_storeStrong((id *)&self->_dndMode, 0);
  objc_storeStrong((id *)&self->_summaryHeading, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
