@implementation NCNotificationGroupList

- (NCNotificationGroupList)initWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4
{
  id v7;
  id v8;
  NCNotificationGroupList *v9;
  NCNotificationGroupList *v10;
  NSMutableArray *v11;
  NSMutableArray *orderedRequests;
  NSMutableDictionary *v13;
  NSMutableDictionary *contentProviders;
  NSMutableDictionary *v15;
  NSMutableDictionary *clockSnoozeAlarmContentProviders;
  NCNotificationSummaryBuilder *v17;
  NCNotificationSummaryBuilder *summaryBuilder;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationGroupList;
  v9 = -[NCNotificationGroupList init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_threadIdentifier, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedRequests = v10->_orderedRequests;
    v10->_orderedRequests = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentProviders = v10->_contentProviders;
    v10->_contentProviders = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clockSnoozeAlarmContentProviders = v10->_clockSnoozeAlarmContentProviders;
    v10->_clockSnoozeAlarmContentProviders = v15;

    v17 = objc_alloc_init(NCNotificationSummaryBuilder);
    summaryBuilder = v10->_summaryBuilder;
    v10->_summaryBuilder = v17;

    v10->_individualCellBackgroundAlpha = 1.0;
  }

  return v10;
}

- (NSArray)allNotificationRequests
{
  void *v2;
  void *v3;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)persistentNotificationRequests
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NCNotificationGroupList allNotificationRequests](self, "allNotificationRequests", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_msgSend(v9, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "lockScreenPersistence");

      if (!v11)
        break;
      objc_msgSend(v3, "addObject:", v9);
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  return (NSArray *)v3;
}

- (NSArray)criticalAlerts
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationGroupList notificationSectionSettings](self, "notificationSectionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "criticalAlertsEnabled");

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NCNotificationGroupList allNotificationRequests](self, "allNotificationRequests", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isCriticalAlert"))
            objc_msgSend(v3, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingNotificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NCNotificationGroupList _compareNotificationRequest:withNotificationRequest:](self, "_compareNotificationRequest:withNotificationRequest:", v5, v6);
  return v7;
}

- (BOOL)matchesGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[NCNotificationGroupList notificationSectionSettings](self, "notificationSectionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "groupingSetting");

  -[NCNotificationGroupList sectionIdentifier](self, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);
  if (v6 == 2)
    v10 = 0;
  else
    v10 = v9;

  if (v10 == 1 && !v6)
  {
    -[NCNotificationGroupList threadIdentifier](self, "threadIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v12);

  }
  return v10;
}

- (void)mergeNotificationRequests:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *comparisonDate;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__NCNotificationGroupList_mergeNotificationRequests___block_invoke;
  v11[3] = &unk_1E8D1B4B0;
  v11[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  comparisonDate = self->_comparisonDate;
  self->_comparisonDate = v6;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:](self, "_updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:", v8, v10);

  -[NCNotificationListPresentableGroup listView](self, "listView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateData");

}

void __53__NCNotificationGroupList_mergeNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_existingIndexForNotificationRequest:");
  v4 = *(void **)(a1 + 32);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(v4, "_insertionIndexForNotificationRequest:", v7);
    objc_msgSend(*(id *)(a1 + 32), "orderedRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v7, v5);

  }
  else
  {
    objc_msgSend(v4, "modifyNotificationRequest:", v7);
  }

}

- (BOOL)containsNonPersistentNotificationRequests
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "options");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "lockScreenPersistence");

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsPersistentNotificationRequests
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "options");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "lockScreenPersistence");

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isGroupForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[NCNotificationGroupList notificationSectionSettings](self, "notificationSectionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "groupingSetting");

  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList sectionIdentifier](self, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    if (v6)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "threadIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationGroupList threadIdentifier](self, "threadIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0
        || -[NCNotificationGroupList _existingIndexForCriticalNotificationRequest:](self, "_existingIndexForCriticalNotificationRequest:", v4) != 0x7FFFFFFFFFFFFFFFLL;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsCriticalNotificationRequest:(id)a3
{
  return -[NCNotificationGroupList _existingIndexForCriticalNotificationRequest:](self, "_existingIndexForCriticalNotificationRequest:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isLeadingNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesRequest:", v4);

  return v6;
}

- (NCNotificationRequest)leadingNotificationRequest
{
  void *v2;
  void *v3;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v3;
}

- (void)reloadLeadingNotificationRequest
{
  void *v3;
  id v4;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCachedHeightsForNotificationRequest:", v4);

  -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v4);
}

- (void)reloadLeadingNotificationRequestIfNecessary
{
  if (-[NCNotificationGroupList shouldReloadLeadingNotificationRequest](self, "shouldReloadLeadingNotificationRequest"))
  {
    -[NCNotificationGroupList reloadLeadingNotificationRequest](self, "reloadLeadingNotificationRequest");
    -[NCNotificationGroupList setShouldReloadLeadingNotificationRequest:](self, "setShouldReloadLeadingNotificationRequest:", 0);
  }
}

- (unint64_t)indexOfNotificationRequestPassingTest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__NCNotificationGroupList_indexOfNotificationRequestPassingTest___block_invoke;
    v8[3] = &unk_1E8D1E2C0;
    v9 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __65__NCNotificationGroupList_indexOfNotificationRequestPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateOrderedNotificationRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  if (v9)
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToArray:", v4) & 1) != 0)
    {

    }
    else
    {
      v12 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");

      if (v12)
      {
        v13 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          -[NCNotificationGroupList logDescription](self, "logDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v15;
          _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification request ordering", (uint8_t *)&v18, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationGroupList setOrderedRequests:](self, "setOrderedRequests:", v16);

        -[NCNotificationListPresentableGroup listView](self, "listView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "invalidateData");

      }
    }
  }
  else
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationGroupList updateOrderedNotificationRequests:].cold.1(v11, self, v4);
  }

}

- (void)updateComparisonDate
{
  void *v3;
  NSDate *v4;
  NSDate *comparisonDate;
  id v6;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v4;

  }
}

- (void)setIndividualCellBackgroundAlpha:(double)a3
{
  void *v5;
  _QWORD v6[6];

  if (self->_individualCellBackgroundAlpha != a3)
  {
    self->_individualCellBackgroundAlpha = a3;
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__NCNotificationGroupList_setIndividualCellBackgroundAlpha___block_invoke;
    v6[3] = &unk_1E8D1E2E8;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

void __60__NCNotificationGroupList_setIndividualCellBackgroundAlpha___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:", a2, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundAlpha:", *(double *)(a1 + 40));

}

- (BOOL)containsTimeSensitiveNotificationRequests
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "interruptionLevel") == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsCommunicationTypeNotificationRequests
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "content");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isCommunicationType");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasNewTimeSensitiveNotificationRequestsWithMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "interruptionLevel") == 2 && !objc_msgSend(v4, "containsObject:", v9))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)headerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultHeader");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SECTION_GENERAL_TITLE"), &stru_1E8D21F60, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)clearAllText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (NSSet)presentableTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (void)clearAll
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "copy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__NCNotificationGroupList_clearAll__block_invoke;
  v8[3] = &unk_1E8D1C600;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListBaseComponent:requestsClearingPresentables:", self, v5);
  objc_msgSend(v6, "notificationListBaseComponentDidRemoveAll:", self);

}

void __35__NCNotificationGroupList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "removeNotificationRequest:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (unint64_t)notificationCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *comparisonDate;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationGroupList _existingIndexForNotificationRequest:](self, "_existingIndexForNotificationRequest:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationGroupList _insertionIndexForNotificationRequest:](self, "_insertionIndexForNotificationRequest:", v4);
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationGroupList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v9;
      v20 = 2114;
      v21 = v11;
      v22 = 2048;
      v23 = v6;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting notification request %{public}@ at index %ld", (uint8_t *)&v18, 0x20u);

    }
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v4, v6);

    -[NCNotificationListPresentableGroup listView](self, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertViewAtIndex:animated:", v6, 1);

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timestamp");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v15;

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList _updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:](self, "_updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:", v17, v5);

    -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
  }
  else
  {
    -[NCNotificationGroupList modifyNotificationRequest:](self, "modifyNotificationRequest:", v4);
  }

}

- (void)updateStackSummariesIfNeeded
{
  BOOL v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  if (UNCCatchMe())
  {
    v3 = -[NCNotificationGroupList count](self, "count") > 1;
    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__NCNotificationGroupList_updateStackSummariesIfNeeded__block_invoke;
    v11[3] = &unk_1E8D1E310;
    v12 = v3;
    v11[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationGroupList summarizedNotificationCountForLeadingRequest](self, "summarizedNotificationCountForLeadingRequest");
    if (v6)
    {
      v7 = v6;
      v8 = -[NCNotificationGroupList summarizedNotificationsAllHaveMatchingPrimaryText](self, "summarizedNotificationsAllHaveMatchingPrimaryText");
      -[NCNotificationGroupList contentProviders](self, "contentProviders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "summarizedNotificationsCount") != v7
        || v8 != objc_msgSend(v10, "summarizedNotificationsAllHaveMatchingPrimaryText"))
      {
        objc_msgSend(v10, "setSummarizedNotificationsCount:", v7);
        objc_msgSend(v10, "setSummarizedNotificationsAllHaveMatchingPrimaryText:", v8);
        -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v5);
      }

    }
  }
}

void __55__NCNotificationGroupList_updateStackSummariesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "summarizedNotificationsCount");
  v7 = v6 != 0;
  if (v6)
    objc_msgSend(v5, "setSummarizedNotificationsCount:", 0);
  if (objc_msgSend(v5, "summarizedNotificationsAllHaveMatchingPrimaryText"))
  {
    objc_msgSend(v5, "setSummarizedNotificationsAllHaveMatchingPrimaryText:", 0);
    v7 = 1;
  }
  v8 = objc_msgSend(v5, "isDisplayingInStack");
  v9 = *(unsigned __int8 *)(a1 + 40);
  if (v9 == v8)
  {
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(v5, "setDisplayingInStack:", v9 != 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_reloadNotificationViewForNotificationRequest:", v10);
LABEL_10:

}

- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        +[NCNotificationRequestContentProvider defaultPrimaryTextForRequest:](NCNotificationRequestContentProvider, "defaultPrimaryTextForRequest:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5)
          v5 = v8;
        v10 = objc_msgSend(v9, "isEqualToString:", v5);

        if (!v10)
        {
          v11 = 0;
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (unint64_t)summarizedNotificationCountForLeadingRequest
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NCNotificationGroupList count](self, "count");
  if (v4 < 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = v4;
    objc_msgSend(v3, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NCNotificationGroupList notificationSystemSettings](self, "notificationSystemSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isSummarizationEnabled")
        && -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
      {
        objc_msgSend(v3, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "contentPreviewSetting") == 2)
          v5 = 0;

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)isShowingSummaryForRequest:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NSMutableDictionary objectForKey:](self->_contentProviders, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSummaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCNotificationGroupList _existingIndexForNotificationRequest:](self, "_existingIndexForNotificationRequest:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationGroupList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v9;
      v24 = 2114;
      v25 = v11;
      v26 = 2048;
      v27 = v6;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ at index %ld", (uint8_t *)&v22, 0x20u);

    }
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v14);

    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", v6);

    -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = -[NCNotificationListPresentableGroup actionsRevealedForNotificationListCell:](self, "actionsRevealedForNotificationListCell:", v17);
    else
      v18 = 0;
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeViewAtIndex:animated:isHorizontallyDisplaced:", v6, 1, v18);

    -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clearCacheForNotificationRequest:", v4);

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList _updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:](self, "_updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:", v21, v12);

    -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
  }
  if (-[NCNotificationGroupList count](self, "count") == 1)
    -[NCNotificationGroupList _setGrouped:](self, "_setGrouped:", 1);
  if (-[NCNotificationGroupList isClockNotificationGroup](self, "isClockNotificationGroup"))
    -[NCNotificationGroupList _invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:](self, "_invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:", v4);

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSDate *v24;
  NSDate *comparisonDate;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCNotificationGroupList _existingIndexForNotificationRequest:](self, "_existingIndexForNotificationRequest:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationGroupList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v9;
      v29 = 2114;
      v30 = v11;
      v31 = 2048;
      v32 = v6;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@ at index %ld", (uint8_t *)&v27, 0x20u);

    }
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v14);

    -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateNotificationRequest:", v4);

    v17 = -[NCNotificationGroupList _insertionIndexForNotificationRequest:](self, "_insertionIndexForNotificationRequest:", v4);
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 == v6)
    {
      objc_msgSend(v18, "replaceObjectAtIndex:withObject:", v6, v4);
    }
    else
    {
      objc_msgSend(v18, "removeObjectAtIndex:", v6);

      -[NCNotificationListPresentableGroup listView](self, "listView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeViewAtIndex:animated:", v6, 0);

      v21 = (__PAIR128__(v17, v6) - v17) >> 64;
      -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "insertObject:atIndex:", v4, v21);

      -[NCNotificationListPresentableGroup listView](self, "listView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertViewAtIndex:animated:", v21, 1);
    }

    -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v4);
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timestamp");
    v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
    comparisonDate = self->_comparisonDate;
    self->_comparisonDate = v24;

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList _updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:](self, "_updateSummariesForNewLeadingNotificationRequest:oldLeadingNotificationRequest:", v26, v12);

    -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
  }

}

- (void)reloadNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationGroupList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v4);

}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_notificationSectionSettings, a3);
  if (v8)
  {
    v9 = objc_msgSend(v7, "contentPreviewSetting");
    if (v9 != objc_msgSend(v8, "contentPreviewSetting")
      || (v10 = objc_msgSend(v7, "isUserConfigurable"), v10 != objc_msgSend(v8, "isUserConfigurable")))
    {
      v11 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
      v12 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        -[NCNotificationGroupList logDescription](self, "logDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationGroupList sectionIdentifier](self, "sectionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v15;
        _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ changed content preview settings for section %{public}@", buf, 0x16u);

      }
      -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
      v17[3] = &unk_1E8D1E338;
      v18 = v11;
      v17[4] = self;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

    }
  }

}

uint64_t __85__NCNotificationGroupList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 < 3 || !*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "reloadNotificationRequest:", a2);
  return result;
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_notificationSystemSettings, a3);
  if (v8)
  {
    v9 = objc_msgSend(v7, "isSummarizationEnabled");
    if (v9 != objc_msgSend(v8, "isSummarizationEnabled"))
    {
      v10 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        -[NCNotificationGroupList logDescription](self, "logDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "isSummarizationEnabled");
        v14 = CFSTR("NO");
        if (v13)
          v14 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v27 = v12;
        v28 = 2114;
        v29 = v14;
        _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ changed system summarization setting to isEnabled %{public}@", buf, 0x16u);

      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[NCNotificationGroupList contentProviders](self, "contentProviders", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v22;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "setSummarizationEnabled:", objc_msgSend(v7, "isSummarizationEnabled"));
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v18);
      }

      -[NCNotificationGroupList _reloadAllNotificationRequests](self, "_reloadAllNotificationRequests");
      -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
    }
  }

}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_deviceAuthenticated != a3)
  {
    v3 = a3;
    self->_deviceAuthenticated = a3;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setDeviceAuthenticated:", v3);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    if (-[NCNotificationGroupList count](self, "count"))
    {
      -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "contentPreviewSetting");

      if (v13 == 1)
      {
        -[NCNotificationListPresentableGroup listView](self, "listView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPerformingContentRevealAnimation:", 1);

        -[NCNotificationListPresentableGroup delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "notificationGroupListShouldReloadNotificationCells:", self);

        if (v16)
        {
          if (-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
          {
            -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v11);
          }
          else
          {
            -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __50__NCNotificationGroupList_setDeviceAuthenticated___block_invoke;
            v19[3] = &unk_1E8D1B4B0;
            v19[4] = self;
            objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);

          }
          -[NCNotificationListPresentableGroup listView](self, "listView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setNeedsLayout");

        }
        else
        {
          -[NCNotificationGroupList setShouldReloadLeadingNotificationRequest:](self, "setShouldReloadLeadingNotificationRequest:", 1);
        }
      }

    }
  }
}

uint64_t __50__NCNotificationGroupList_setDeviceAuthenticated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNotificationViewForNotificationRequest:", a2);
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__NCNotificationGroupList_containsNotificationRequest___block_invoke;
  v9[3] = &unk_1E8D1C198;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __55__NCNotificationGroupList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

- (NSString)logDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NCNotificationGroupList sectionIdentifier](self, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList threadIdentifier](self, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Group List [%@:%@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  void *v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a4)
    return 0.0;
  if (!a4)
    -[NCNotificationGroupList _loadLeadingNotificationRequestCellIfNecessary](self, "_loadLeadingNotificationRequestCellIfNecessary");
  v10 = a4 == 0;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationGroupList _cachedHeightForNotificationRequest:isLeadingNotificationRequest:withWidth:](self, "_cachedHeightForNotificationRequest:isLeadingNotificationRequest:withWidth:", v12, v10, a5);
  v14 = v13;

  return v14;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v12 = 0;
  }
  else
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = !-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
    if (a4)
      v11 = v10;
    else
      v11 = 1;
    -[NCNotificationGroupList _cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:](self, "_cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:", v9, 1, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isHiddenBelowStack"))
    {
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "showContentForGroupedViews") ^ 1;

    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(v12, "notificationViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setNotificationContentViewHidden:", v11 ^ 1 | v15);
  }
  return v12;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)recycleView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationGroupList;
  -[NCNotificationListPresentableGroup recycleView:](&v11, sel_recycleView_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "notificationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasCommittedToPresentingCustomContentProvidingViewController"))
    {
      -[NCNotificationGroupList setCellRecycledWhilePresentingLongLook:](self, "setCellRecycledWhilePresentingLongLook:", v5);
    }
    else
    {
      objc_msgSend(v5, "hideActionButtonsAnimated:fastAnimation:completion:", 0, 0, 0);
      -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "recycleNotificationListCell:", v5);

      objc_msgSend(v6, "removeObserver:", self);
      if ((v8 & 1) == 0)
      {
        -[NCNotificationListPresentableGroup delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "notificationListBaseComponent:didRemoveViewController:", self, v6);

      }
      objc_msgSend(v6, "notificationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NCNotificationGroupList isClockNotificationGroup](self, "isClockNotificationGroup"))
        -[NCNotificationGroupList _invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:](self, "_invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:", v10);

    }
  }

}

- (void)notificationListDidLayoutSubviews
{
  id v3;

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "groupListDidLayout:", self);

}

- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  NCNotificationRequestCoalescingContentProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (!objc_msgSend(v11, "isShortLook"))
  {
    v14 = 0;
    goto LABEL_27;
  }
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "containsObject:", v7))
  {

LABEL_12:
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v7);
    v14 = (NCNotificationRequestCoalescingContentProvider *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(v15, "notificationGroupList:requestsContentProviderForNotificationRequest:", self, v7),
            (v14 = (NCNotificationRequestCoalescingContentProvider *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v14 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:]([NCNotificationRequestCoalescingContentProvider alloc], "initWithNotificationRequest:", v7);
      }
      -[NCNotificationGroupList contentProviders](self, "contentProviders");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bs_setSafeObject:forKey:", v14, v7);

    }
    -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v14, "setDeviceAuthenticated:", -[NCNotificationGroupList deviceAuthenticated](self, "deviceAuthenticated"));
    -[NCNotificationGroupList notificationSystemSettings](self, "notificationSystemSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequestCoalescingContentProvider setSummarizationEnabled:](v14, "setSummarizationEnabled:", objc_msgSend(v18, "isSummarizationEnabled"));

    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 == v7)
    {
      -[NCNotificationRequestCoalescingContentProvider setShowSummaryFooterText:](v14, "setShowSummaryFooterText:", objc_msgSend(v15, "shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:", self));
      -[NCNotificationRequestCoalescingContentProvider setShowSummaryTextAsContent:](v14, "setShowSummaryTextAsContent:", objc_msgSend(v15, "shouldShowSummaryTextAsContentForLeadingNotificationRequestForNotificationGroupList:", self));
      -[NCNotificationRequestContentProvider setSummarizedNotificationsCount:](v14, "setSummarizedNotificationsCount:", -[NCNotificationGroupList summarizedNotificationCountForLeadingRequest](self, "summarizedNotificationCountForLeadingRequest"));
      -[NCNotificationRequestContentProvider setSummarizedNotificationsAllHaveMatchingPrimaryText:](v14, "setSummarizedNotificationsAllHaveMatchingPrimaryText:", -[NCNotificationGroupList summarizedNotificationsAllHaveMatchingPrimaryText](self, "summarizedNotificationsAllHaveMatchingPrimaryText"));
      objc_msgSend(v15, "collapsedSectionSummaryStringForLeadingNotificationRequestForNotificationGroupList:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NCNotificationRequestCoalescingContentProvider setCollapsedSectionSummaryString:](v14, "setCollapsedSectionSummaryString:", 0);
      -[NCNotificationRequestCoalescingContentProvider setShowSummaryFooterText:](v14, "setShowSummaryFooterText:", 0);
      -[NCNotificationRequestCoalescingContentProvider setShowSummaryTextAsContent:](v14, "setShowSummaryTextAsContent:", 0);
      v20 = 0;
    }
    -[NCNotificationRequestCoalescingContentProvider setCollapsedSectionSummaryString:](v14, "setCollapsedSectionSummaryString:", v20);
    if ((objc_msgSend(v7, "matchesRequest:", v19) & 1) != 0)
    {
      -[NCNotificationGroupList summaryBuilder](self, "summaryBuilder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequestCoalescingContentProvider setOverridenSummaryBuilder:](v14, "setOverridenSummaryBuilder:", v21);

      if (!v20 && -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
      {
        objc_msgSend(v19, "content");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "threadSummary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRequestCoalescingContentProvider setThreadContentSummaryText:](v14, "setThreadContentSummaryText:", v23);

LABEL_26:
        -[NCNotificationRequestCoalescingContentProvider setDisplayingInStack:](v14, "setDisplayingInStack:", -[NCNotificationGroupList count](self, "count") > 1);
        -[NCNotificationRequestContentProvider setDelegate:](v14, "setDelegate:", v11);

        goto LABEL_27;
      }
    }
    else
    {
      -[NCNotificationRequestCoalescingContentProvider setOverridenSummaryBuilder:](v14, "setOverridenSummaryBuilder:", 0);
    }
    -[NCNotificationRequestCoalescingContentProvider setThreadContentSummaryText:](v14, "setThreadContentSummaryText:", 0);
    goto LABEL_26;
  }
  v13 = -[NCNotificationGroupList isClockNotificationGroup](self, "isClockNotificationGroup");

  if (!v13)
    goto LABEL_12;
  -[NCNotificationGroupList _clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:viewController:](self, "_clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:viewController:", v7, v11);
  v14 = (NCNotificationRequestCoalescingContentProvider *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v14;
}

- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v11 = objc_opt_class();
  v16 = v9;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v16;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "notificationListComponent:shouldFinishLongLookTransitionForNotificationRequest:trigger:withCompletionBlock:", self, v15, a5, v10);
}

- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  _QWORD v23[4];
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_opt_class();
  v15 = v10;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  objc_msgSend(v17, "notificationRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultAction");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 != v11)
    goto LABEL_9;
  objc_msgSend(v17, "presentedExpandedPlatterViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

    v20 = v11;
LABEL_9:

LABEL_10:
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __96__NCNotificationGroupList_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke;
    v23[3] = &unk_1E8D1B170;
    v24 = v13;
    objc_msgSend(v19, "notificationListComponent:requestsExecuteAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v11, v18, 1, v12, v23);

    goto LABEL_11;
  }
  v22 = objc_msgSend(v19, "shouldHintDefaultActionForNotificationListBaseComponent:", self);

  if (!v22)
    goto LABEL_10;
  -[NCNotificationGroupList _hintSideSwipeForDefaultActionForNotificationRequest:](self, "_hintSideSwipeForDefaultActionForNotificationRequest:", v18);
  if (v13)
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_11:

}

uint64_t __96__NCNotificationGroupList_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationUsageTrackingStateForNotificationListComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "notificationListComponent:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", self, v12, v14, v11, v10);
}

- (void)notificationViewControllerWillDismissForCancelAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:willDismissLongLookForCancelActionForViewController:", self, v4);

}

- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3
{
  return 1;
}

- (int64_t)notificationViewControllerDateFormatStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  objc_msgSend(a3, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDateInToday:", v5);

  return v6;
}

- (BOOL)showAdditionalMessageLinesForNotificationViewController:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[NCNotificationGroupList _shouldAllowInteractionWithNotificationViewController:](self, "_shouldAllowInteractionWithNotificationViewController:", v4))
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "notificationListComponent:shouldAllowInteractionsForNotificationRequest:", self, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)notificationViewControllerShouldAllowClickPresentationInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[NCNotificationGroupList _shouldAllowInteractionWithNotificationViewController:](self, "_shouldAllowInteractionWithNotificationViewController:", v4))
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "notificationListComponent:shouldAllowInteractionsForNotificationRequest:", self, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:containerViewProviderForExpandedContentForViewController:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)notificationViewController:(id)a3 initialFrameForPresentingLongLookFromView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  v6 = a4;
  objc_msgSend(a3, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (v8)
  {
    objc_msgSend(v8, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;

    objc_msgSend(v8, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    v26 = 0.0;
    v27 = v20;
    v28 = v22;
    v29 = v24;
  }
  else
  {
    v25 = v9;
    v26 = v11;
    v27 = v13;
    v28 = v15;
    v29 = v17;
  }
  objc_msgSend(v25, "convertRect:toView:", 0, v26, v27, v28, v29);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)notificationViewController:(id)a3 finalFrameForDismissingLongLookFromView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_longLookDismissalFinalFrameCalculatedWithoutWindow = v9 == 0;

  objc_msgSend(v7, "notificationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    objc_msgSend(v12, "convertRect:toView:", 0);
    v14 = v13;
    v16 = v15;

    objc_msgSend(v11, "frame");
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v38), 1.79769313e308);
    v18 = v17;
    v20 = v19;
  }
  else
  {
    objc_msgSend(v6, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    objc_msgSend(v21, "convertRect:toView:", 0, v23, v25, v27, v29);
    v14 = v30;
    v16 = v31;
    v18 = v32;
    v20 = v33;
    v6 = v21;
  }

  v34 = v14;
  v35 = v16;
  v36 = v18;
  v37 = v20;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)notificationViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:keyboardAssertionForGestureWindow:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideHomeAffordanceAnimationSettingsForNotificationListComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationViewController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unhideHomeAffordanceAnimationSettingsForNotificationListComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationViewController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settleHomeAffordanceAnimationBehaviorDescriptionForNotificationListComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)notificationViewControllerShouldAllowLongPressGesture:(id)a3
{
  NCNotificationGroupList *v3;
  void *v4;

  v3 = self;
  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "notificationListComponentShouldAllowLongPressGesture:", v3);

  return (char)v3;
}

- (void)notificationViewController:(id)a3 isPerformingHoverHighlighting:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  BOOL v13;

  v6 = a3;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
  v9 = v11;
  if ((_DWORD)v7 && v11 == v6)
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke;
    v12[3] = &unk_1E8D1E338;
    v12[4] = self;
    v13 = a4;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

    v9 = v11;
  }

}

void __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v7 = a2;
  v8 = v7;
  if (a3 - 1 <= 1)
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke_2;
    v10[3] = &unk_1E8D1E360;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v9, "animateWithDuration:animations:", v10, 0.2);

  }
  *a4 = a3 > 2;

}

void __84__NCNotificationGroupList_notificationViewController_isPerformingHoverHighlighting___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_currentCellForNotificationRequest:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlatterHighlighted:", *(unsigned __int8 *)(a1 + 48));

}

- (void)notificationViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4
{
  double height;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  height = a4.height;
  v6 = a3;
  objc_msgSend(v6, "notificationRequest");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = -[NCNotificationGroupList containsNotificationRequest:](self, "containsNotificationRequest:", v7);
  if ((_DWORD)v6)
  {
    -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "invalidateCachedHeightIfNecessaryForNotificationRequest:updatedHeight:isContentRevealed:", v11, -[NCNotificationGroupList _isContentRevealedForNotificationRequest:](self, "_isContentRevealedForNotificationRequest:", v11), height);

    if (v9)
    {
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

    }
  }

}

- (BOOL)isRichNotificationContentViewForNotificationViewController:(id)a3
{
  NCNotificationGroupList *v3;
  void *v4;

  v3 = self;
  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isRichNotificationContentViewForNotificationGroupList:", v3);

  return (char)v3;
}

- (BOOL)isAttachmentImageFeaturedForNotificationViewController:(id)a3
{
  NCNotificationGroupList *v3;
  void *v4;

  v3 = self;
  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isAttachmentImageFeaturedForNotificationGroupList:", v3);

  return (char)v3;
}

- (BOOL)handleTapOnNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponentDidSignificantUserInteraction:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "handleTapOnNotificationListBaseComponent:", self) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationGroupList _handleTapToExpandGroupForNotificationRequest:](self, "_handleTapToExpandGroupForNotificationRequest:", v7);

  }
  return v6;
}

- (BOOL)shouldAlignContentToBottomForNotificationViewController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "shouldAlignContentToBottomForLeadingNotificationRequestForNotificationGroupList:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3
{
  void *v4;
  unint64_t v5;

  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "importantAdornmentEligibleOptionsForNotificationGroupList:", self);

  return v5;
}

- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v5 = a5;
  v7 = a4;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
    goto LABEL_4;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "matchesRequest:", v7) & 1) == 0)
  {

    goto LABEL_6;
  }
  v10 = objc_msgSend(v8, "isNotificationGroupListInCollapsedStack:", self);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend(v8, "notificationGroupList:requestsAuxiliaryOptionsContentProviderForNotificationRequest:isLongLook:", self, v7, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a5;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationListComponent:requestsPresentingManagementViewForNotificationRequest:managementViewType:withPresentingView:completion:", self, v10, a4, v9, 0);

}

- (void)notificationViewControllerWillBeginUserInteraction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didBeginUserInteractionWithViewController:", self, v4);

}

- (void)notificationViewControllerDidEndUserInteraction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListBaseComponent:didEndUserInteractionWithViewController:", self, v4);

}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:isPresentingLongLookForViewController:", self, v4);

}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "shouldRestorePresentingShortLookOnDismiss");
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5 ^ 1u);

  objc_msgSend(v4, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) == 0 && -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
  {
    -[NCNotificationGroupList _reloadNotificationCellAtIndex:](self, "_reloadNotificationCellAtIndex:", 1);
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "revealNotificationContentBelowGroupedViewIfNecessary:", v9);

  }
}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationGroupList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did dismiss long look for notification request %{public}@", (uint8_t *)&v15, 0x16u);

  }
  -[NCNotificationGroupList cellRecycledWhilePresentingLongLook](self, "cellRecycledWhilePresentingLongLook");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[NCNotificationGroupList recycleView:](self, "recycleView:", v11);
    -[NCNotificationGroupList setCellRecycledWhilePresentingLongLook:](self, "setCellRecycledWhilePresentingLongLook:", 0);
  }
  else if (self->_longLookDismissalFinalFrameCalculatedWithoutWindow)
  {
    objc_msgSend(v4, "notificationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList reloadNotificationRequest:](self, "reloadNotificationRequest:", v13);

    self->_longLookDismissalFinalFrameCalculatedWithoutWindow = 0;
  }
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationListComponent:isPresentingLongLookForViewController:", self, 0);

}

- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL4 v7;

  v4 = a3;
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    LOBYTE(v7) = 1;
  else
    v7 = !-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");

  return v7;
}

- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3
{
  void *v4;
  BOOL v5;

  -[NCNotificationGroupList _requestForListCell:](self, "_requestForListCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationGroupList _allowPanningForRequest:](self, "_allowPanningForRequest:", v4))
    v5 = -[NCNotificationGroupList _shouldShowOptionsActionForRequest:](self, "_shouldShowOptionsActionForRequest:", v4)
      || -[NCNotificationGroupList _shouldShowViewActionForRequest:](self, "_shouldShowViewActionForRequest:", v4)
      || -[NCNotificationGroupList _shouldShowClearActionForRequest:](self, "_shouldShowClearActionForRequest:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)supplementaryActionsForNotificationListCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  -[NCNotificationGroupList _requestForListCell:](self, "_requestForListCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NCNotificationGroupList _shouldShowOptionsActionForRequest:](self, "_shouldShowOptionsActionForRequest:", v4))
  {
    -[NCNotificationGroupList _optionsActionForRequest:](self, "_optionsActionForRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (-[NCNotificationGroupList _shouldShowViewActionForRequest:](self, "_shouldShowViewActionForRequest:", v4))
  {
    -[NCNotificationGroupList _presentLongLookActionWithViewTitleForRequest:](self, "_presentLongLookActionWithViewTitleForRequest:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (-[NCNotificationGroupList _shouldShowClearActionForRequest:](self, "_shouldShowClearActionForRequest:", v4))
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isGrouped"))
      v9 = -[NCNotificationGroupList notificationCount](self, "notificationCount") > 1;
    else
      v9 = 0;

    -[NCNotificationGroupList _clearActionForRequest:clearAll:](self, "_clearActionForRequest:clearAll:", v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  return v5;
}

- (id)defaultActionForNotificationListCell:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationGroupList _requestForListCell:](self, "_requestForListCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationGroupList _shouldShowOpenActionToPerformLongLookPresentationForRequest:](self, "_shouldShowOpenActionToPerformLongLookPresentationForRequest:", v4))
  {
    -[NCNotificationGroupList _presentLongLookActionWithOpenTitleForRequest:](self, "_presentLongLookActionWithOpenTitleForRequest:", v4);
  }
  else
  {
    -[NCNotificationGroupList _openActionForRequest:](self, "_openActionForRequest:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3
{
  void *v4;
  BOOL v5;

  -[NCNotificationGroupList _requestForListCell:](self, "_requestForListCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationGroupList _allowPanningForRequest:](self, "_allowPanningForRequest:", v4))
    v5 = -[NCNotificationGroupList _shouldShowOpenActionToPerformDefaultActionForRequest:](self, "_shouldShowOpenActionToPerformDefaultActionForRequest:", v4)|| -[NCNotificationGroupList _shouldShowOpenActionToPerformLongLookPresentationForRequest:](self, "_shouldShowOpenActionToPerformLongLookPresentationForRequest:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3
{
  NCNotificationGroupList *v3;
  void *v4;

  v3 = self;
  -[NCNotificationListPresentableGroup delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isAttachmentImageFeaturedForNotificationGroupList:", v3);

  return (char)v3;
}

- (void)_loadLeadingNotificationRequestCellIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[NCNotificationGroupList _cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:](self, "_cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:", v6, 1, 1);

  }
}

- (void)_reloadAllNotificationRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_reloadNotificationViewForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationGroupList *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (v4)
  {
    -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "hideActionButtonsAnimated:fastAnimation:completion:", 1, 0, 0);
      objc_msgSend(v6, "notificationViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (NCNotificationGroupList *)objc_claimAutoreleasedReturnValue();

      if (v8 != self)
        objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "notificationRequest");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v4)
        objc_msgSend(v7, "invalidateContentProviders");
      else
        objc_msgSend(v7, "setNotificationRequest:", v4);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__NCNotificationGroupList__reloadNotificationViewForNotificationRequest___block_invoke;
      v13[3] = &unk_1E8D1B568;
      v14 = v7;
      v10 = v7;
      +[NCMigrationGatewayFromCAtoC2 animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:](NCMigrationGatewayFromCAtoC2, "animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:", 1, v13, 0, 0.25, 240.0, 20.0);
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadViewAtIndex:", objc_msgSend(v12, "indexOfObject:", v4));

    }
  }

}

uint64_t __73__NCNotificationGroupList__reloadNotificationViewForNotificationRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContent");
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
  v5 = objc_msgSend(v4, "shouldScrollToTopForNotificationListBaseComponent:", self);
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVisibleForViewAtIndex:", 0);

  if (!v7 || v5)
  {
    objc_msgSend(v4, "notificationListPresentableGroup:requestsScrollToTopOfCollectionWithCompletion:", self, v8);
  }
  else if (v8)
  {
    v8[2]();
  }

}

- (id)purpose
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle:%@;Thread:%@"),
               self->_sectionIdentifier,
               self->_threadIdentifier);
}

- (void)toggleGroupedState
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  NSObject *log;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    v7 = v4;
  else
    v7 = 1;
  if (v6 > 1 || (v7 & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationGroupList logDescription](self, "logDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("GROUPED");
      if (v4)
        v12 = CFSTR("NOT GROUPED");
      *(_DWORD *)buf = 138543618;
      v43 = v10;
      v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ toggling notification group state to %@", buf, 0x16u);

    }
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4 ^ 1u;
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toggledGroupState:withLeadingNotificationRequest:", v14, v15);

    -[NCNotificationGroupList contentProviders](self, "contentProviders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __45__NCNotificationGroupList_toggleGroupedState__block_invoke;
    v40[3] = &unk_1E8D1E388;
    v40[4] = self;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v40);

    if ((v14 & 1) == 0)
    {
      v33 = v14;
      -[NCNotificationGroupList _reloadRecycledGroupedNotificationCells](self, "_reloadRecycledGroupedNotificationCells");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            -[NCNotificationGroupList _cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:](self, "_cachedCellForNotificationRequest:createNewIfNecessary:shouldConfigure:", v22, 1, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "notificationViewController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "notificationRequest");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "matchesRequest:", v22);

            if ((v26 & 1) == 0)
            {
              v27 = (void *)*MEMORY[0x1E0DC5F90];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
              {
                log = v27;
                -[NCNotificationGroupList logDescription](self, "logDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "notificationIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "un_logDigest");
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v43 = (uint64_t)v34;
                v44 = 2112;
                v45 = v29;
                _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "%{public}@ Reloading stale cell for request %@ prior to expansion", buf, 0x16u);

              }
              -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v22);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v19);
      }

      v14 = v33;
    }
    -[NCNotificationGroupList _setGrouped:](self, "_setGrouped:", v14);
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hideActionButtonsAnimated:fastAnimation:completion:", 1, 0, 0);

    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v32, "notificationListPresentableGroupDidChangeGroupedState:", self);

  }
}

void __45__NCNotificationGroupList_toggleGroupedState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "isDeviceAuthenticated");
  if (v6 != objc_msgSend(*(id *)(a1 + 32), "deviceAuthenticated"))
  {
    objc_msgSend(v5, "setDeviceAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "deviceAuthenticated"));
    objc_msgSend(*(id *)(a1 + 32), "_reloadNotificationViewForNotificationRequest:", v7);
  }

}

- (void)_hintSideSwipeForDefaultActionForNotificationRequest:(id)a3
{
  void *v3;
  id v4;

  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "hintSideSwipeForDefaultAction");
    v3 = v4;
  }

}

- (void)_updateSummariesForNewLeadingNotificationRequest:(id)a3 oldLeadingNotificationRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList summaryBuilder](self, "summaryBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithNotificationRequests:", v9);

  if ((objc_msgSend(v7, "shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:", self) & 1) != 0)
    v10 = 1;
  else
    v10 = UNCCatchMe();
  if (v17)
  {
    v11 = v17;
    if (v6)
    {
      if (v6 != v17)
      {
        -[NCNotificationGroupList contentProviders](self, "contentProviders");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setOverridenSummaryBuilder:", 0);

        -[NCNotificationGroupList contentProviders](self, "contentProviders");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setThreadContentSummaryText:", 0);

        v11 = v17;
        if (v10)
        {
          -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "clearCachedHeightsForNotificationRequest:", v6);

          -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v6);
          v11 = v17;
        }
      }
    }
    -[NCNotificationGroupList _updateSummariesForLeadingNotificationRequest:](self, "_updateSummariesForLeadingNotificationRequest:", v11);
  }

}

- (void)_updateSummariesForLeadingNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCachedHeightsForNotificationRequest:", v13);

  -[NCNotificationGroupList contentProviders](self, "contentProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList summaryBuilder](self, "summaryBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverridenSummaryBuilder:", v7);

  -[NCNotificationGroupList contentProviders](self, "contentProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "threadSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThreadContentSummaryText:", v12);

  -[NCNotificationGroupList _reloadNotificationViewForNotificationRequest:](self, "_reloadNotificationViewForNotificationRequest:", v13);
}

- (id)_cachedCellForNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4 shouldConfigure:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:", v8, self, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NCNotificationGroupList cellRecycledWhilePresentingLongLook](self, "cellRecycledWhilePresentingLongLook");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v11)
    {
      -[NCNotificationGroupList setCellRecycledWhilePresentingLongLook:](self, "setCellRecycledWhilePresentingLongLook:", 0);
      goto LABEL_8;
    }
    v12 = (void *)v11;
    objc_msgSend(v10, "notificationViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", self);
    -[NCNotificationListPresentableGroup materialGroupNameBase](self, "materialGroupNameBase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaterialGroupNameBase:", v14);
    objc_msgSend(v13, "parentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[NCNotificationListPresentableGroup delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "notificationListBaseComponent:didAddViewController:", self, v13);

    }
    v17 = objc_msgSend(v13, "isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController") ^ 1;
    objc_msgSend(v13, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", v17);

    objc_msgSend(v10, "setActionProvider:", self);
    objc_msgSend(v10, "setActionHandler:", self);
    objc_msgSend(v10, "setMaterialGroupNameBase:", v14);
    objc_msgSend(v10, "setMaterialRecipe:", objc_msgSend(v13, "materialRecipe"));
    objc_msgSend(v10, "setBackgroundAlpha:", self->_individualCellBackgroundAlpha);

  }
  v19 = v10;
LABEL_8:

  return v10;
}

- (id)_currentCellForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:", v4, self, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_cachedHeightForNotificationRequest:(id)a3 isLeadingNotificationRequest:(BOOL)a4 withWidth:(double)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;

  v6 = a4;
  v8 = a3;
  v9 = -[NCNotificationGroupList _isContentRevealedForNotificationRequest:](self, "_isContentRevealedForNotificationRequest:", v8);
  v10 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped") ^ 1 | v6;
  -[NCNotificationListPresentableGroup notificationListCache](self, "notificationListCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightForNotificationRequest:withFrameWidth:isContentRevealed:shouldCalculateHeight:", v8, v9, v10, a5);
  v13 = v12;

  return v13;
}

- (id)_requestForListCell:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "notificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_allowPanningForRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldNotificationGroupListPanHorizontally:", self);

  if (v6)
  {
    if (-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
    {
      -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "matchesRequest:", v7);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v4, "notificationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "un_logDigest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
    -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "un_logDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v12;
    v20 = 1024;
    v21 = v6;
    v22 = 1024;
    v23 = v13;
    v24 = 2114;
    v25 = v16;
    v26 = 1024;
    v27 = v8;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "Group list determining pan eligibility = %{public}@ delegateCheck: %{BOOL}d isGrouped: %{BOOL}d leadingNotificationRequest: %{public}@ [ shouldPanHorizontally = %{BOOL}d ]", (uint8_t *)&v18, 0x28u);

  }
  return v8;
}

- (BOOL)_shouldShowOptionsActionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "notificationListComponent:sectionSettingsForSectionIdentifier:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isUserConfigurable");
  return (char)v4;
}

- (BOOL)_shouldShowViewActionForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "notificationListComponent:shouldAllowInteractionsForNotificationRequest:", self, v4);

  return self ^ 1;
}

- (BOOL)_shouldShowClearActionForRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hideClearActionInList") ^ 1;

  return v4;
}

- (BOOL)_shouldShowOpenActionToPerformDefaultActionForRequest:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldHintDefaultActionForNotificationListBaseComponent:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowOpenActionToPerformLongLookPresentationForRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "defaultAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "revealsAdditionalContentIfNoDefaultAction"))
    {
      -[NCNotificationListPresentableGroup delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "shouldHintDefaultActionForNotificationListBaseComponent:", self);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)_openActionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_OPEN"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__NCNotificationGroupList__openActionForRequest___block_invoke;
  v12[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v13 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, CFSTR("NCNotificationGroupListActionIdentifierOpen"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v10, "isAttachmentImageFeaturedForNotificationGroupList:", self);

  if ((self & 1) == 0)
    objc_msgSend(v9, "setPl_defaultAction:", 1);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __49__NCNotificationGroupList__openActionForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_performAction:forNotificationRequest:withCompletion:", v2, *(_QWORD *)(a1 + 32), 0);

  }
}

- (id)_optionsActionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_OPTIONS"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__NCNotificationGroupList__optionsActionForRequest___block_invoke;
  v11[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, CFSTR("NCNotificationGroupListActionIdentifierOptions"), v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __52__NCNotificationGroupList__optionsActionForRequest___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_executeOptionsActionForRequest:action:", *(_QWORD *)(a1 + 32), v5);

}

- (void)_executeOptionsActionForRequest:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke;
  v10[3] = &unk_1E8D1E3D8;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "notificationListComponent:requestsPresentingOptionsMenuForNotificationRequest:presentingViewProvider:optionsForSection:completion:", self, v9, v10, 0, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_currentCellForNotificationRequest:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke_2;
    v8[3] = &unk_1E8D1E3B0;
    v9 = v6;
    v10 = v3;
    v7 = v6;
    objc_msgSend(v7, "revealSupplementaryActionsWithCompletion:", v8);

  }
}

void __66__NCNotificationGroupList__executeOptionsActionForRequest_action___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "senderForActionWithIdentifier:", CFSTR("NCNotificationGroupListActionIdentifierOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = v3;
  }

}

- (id)_presentLongLookActionWithOpenTitleForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  NCUserNotificationsUIKitFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_OPEN"), &stru_1E8D21F60, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _presentLongLookActionForRequest:title:identifier:](self, "_presentLongLookActionForRequest:title:identifier:", v4, v6, CFSTR("NCNotificationGroupListActionIdentifierOpen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_presentLongLookActionWithViewTitleForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  NCUserNotificationsUIKitFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_VIEW"), &stru_1E8D21F60, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _presentLongLookActionForRequest:title:identifier:](self, "_presentLongLookActionForRequest:title:identifier:", v4, v6, CFSTR("NCNotificationGroupListActionIdentifierView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_presentLongLookActionForRequest:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3428];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__NCNotificationGroupList__presentLongLookActionForRequest_title_identifier___block_invoke;
  v15[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v17, &location);
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v9, 0, v10, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __77__NCNotificationGroupList__presentLongLookActionForRequest_title_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_executeViewActionForRequest:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_executeViewActionForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NCNotificationGroupList__executeViewActionForRequest___block_invoke;
  v7[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v9, &location);
  v6 = v5;
  v8 = v6;
  objc_msgSend(v6, "hideActionButtonsAnimated:fastAnimation:completion:", 1, 1, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__NCNotificationGroupList__executeViewActionForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notificationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationListBaseComponent:didBeginUserInteractionWithViewController:", v6, v4);

    objc_msgSend(*(id *)(a1 + 32), "notificationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentLongLookAnimated:trigger:completion:", 1, 3, 0);

    WeakRetained = v6;
  }

}

- (id)_clearActionForRequest:(id)a3 clearAll:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a4;
  v6 = a3;
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = CFSTR("NOTIFICATION_LIST_CLEAR_ALL_CELL");
  else
    v9 = CFSTR("NOTIFICATION_LIST_CLEAR");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E8D21F60, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3428];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__NCNotificationGroupList__clearActionForRequest_clearAll___block_invoke;
  v17[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v19, &location);
  v12 = v6;
  v18 = v12;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v10, 0, CFSTR("NCNotificationGroupListActionIdentifierClear"), v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAttachmentImageFeaturedForNotificationGroupList:", self);

  if ((v15 & 1) == 0)
    objc_msgSend(v13, "setPl_defaultAction:", 1);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __59__NCNotificationGroupList__clearActionForRequest_clearAll___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_executeClearActionForRequest:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_executeClearActionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  NCNotificationGroupList *v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationUsageTrackingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortLookClearedForNotificationRequest:withState:", v4, v8);

  v9 = *MEMORY[0x1E0DC5F90];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
  {
    -[NCNotificationGroupList setClearingAllNotificationRequestsForCellHorizontalSwipe:](self, "setClearingAllNotificationRequestsForCellHorizontalSwipe:", 1);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__NCNotificationGroupList__executeClearActionForRequest___block_invoke;
    v18 = &unk_1E8D1C600;
    v19 = self;
    v20 = v11;
    v14 = v11;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v15);
    objc_msgSend(v10, "notificationListBaseComponentDidRemoveAll:", self, v15, v16, v17, v18, v19);
    objc_msgSend(v10, "notificationListBaseComponent:requestsClearingPresentables:", self, v14);

  }
  else
  {
    if (-[NCNotificationGroupList count](self, "count") == 1)
      -[NCNotificationGroupList setClearingAllNotificationRequestsForCellHorizontalSwipe:](self, "setClearingAllNotificationRequestsForCellHorizontalSwipe:", 1);
    -[NCNotificationGroupList removeNotificationRequest:](self, "removeNotificationRequest:", v4);
    objc_msgSend(v10, "notificationListComponent:didRemoveNotificationRequest:", self, v4);
    objc_msgSend(v4, "clearAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationGroupList _performAction:forNotificationRequest:withCompletion:](self, "_performAction:forNotificationRequest:withCompletion:", v13, v4, 0);
  }

  objc_msgSend(v10, "notificationListComponentChangedContent:", self);
}

void __57__NCNotificationGroupList__executeClearActionForRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "removeNotificationRequest:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (void)_performAction:(id)a3 forNotificationRequest:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__NCNotificationGroupList__performAction_forNotificationRequest_withCompletion___block_invoke;
  v13[3] = &unk_1E8D1B170;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "notificationListComponent:requestsExecuteAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v10, v9, 1, MEMORY[0x1E0C9AA70], v13);

}

uint64_t __80__NCNotificationGroupList__performAction_forNotificationRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_clockSnoozeAlarmNotificationStaticContentProviderForNotificationRequest:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NCSnoozeAlarmNotificationStaticContentProvider *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[NCNotificationGroupList clockSnoozeAlarmContentProviders](self, "clockSnoozeAlarmContentProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(v9, "viewController"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 != v7))
  {
    objc_msgSend(v9, "invalidateTimer");
    v11 = -[NCSnoozeAlarmNotificationStaticContentProvider initWithNotificationRequest:viewController:]([NCSnoozeAlarmNotificationStaticContentProvider alloc], "initWithNotificationRequest:viewController:", v6, v7);

    -[NCNotificationGroupList clockSnoozeAlarmContentProviders](self, "clockSnoozeAlarmContentProviders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_setSafeObject:forKey:", v11, v6);

    v9 = v11;
  }

  return v9;
}

- (void)_invalidateSnoozeAlarmNotificationStaticContentProviderTimerForNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NCNotificationGroupList clockSnoozeAlarmContentProviders](self, "clockSnoozeAlarmContentProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "invalidateTimer");
    -[NCNotificationGroupList clockSnoozeAlarmContentProviders](self, "clockSnoozeAlarmContentProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (unint64_t)_lockScreenPersistenceForNotificationRequest:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockScreenPersistence");

  return v4;
}

- (unint64_t)_lockScreenPriorityForNotificationRequest:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockScreenPriority");

  return v4;
}

- (unint64_t)_existingIndexForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__NCNotificationGroupList__existingIndexForNotificationRequest___block_invoke;
  v9[3] = &unk_1E8D1C198;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "isCriticalAlert"))
      v7 = -[NCNotificationGroupList _existingIndexForCriticalNotificationRequest:](self, "_existingIndexForCriticalNotificationRequest:", v6);
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __64__NCNotificationGroupList__existingIndexForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

- (unint64_t)_existingIndexForCriticalNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isCriticalAlert")
    && (-[NCNotificationGroupList sectionIdentifier](self, "sectionIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "sectionIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__NCNotificationGroupList__existingIndexForCriticalNotificationRequest___block_invoke;
    v11[3] = &unk_1E8D1C198;
    v12 = v4;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __72__NCNotificationGroupList__existingIndexForCriticalNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (unint64_t)_insertionIndexForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[5];

  v4 = a3;
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__NCNotificationGroupList__insertionIndexForNotificationRequest___block_invoke;
  v10[3] = &unk_1E8D1E400;
  v10[4] = self;
  v8 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v7, 1280, v10);

  return v8;
}

uint64_t __65__NCNotificationGroupList__insertionIndexForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareNotificationRequest:withNotificationRequest:", a2, a3);
}

- (int64_t)_compareNotificationRequest:(id)a3 withNotificationRequest:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = -[NCNotificationGroupList _lockScreenPriorityForNotificationRequest:](self, "_lockScreenPriorityForNotificationRequest:", v6);
  v9 = -[NCNotificationGroupList _lockScreenPriorityForNotificationRequest:](self, "_lockScreenPriorityForNotificationRequest:", v7);
  v10 = -[NCNotificationGroupList _lockScreenPersistenceForNotificationRequest:](self, "_lockScreenPersistenceForNotificationRequest:", v6);
  v11 = -[NCNotificationGroupList _lockScreenPersistenceForNotificationRequest:](self, "_lockScreenPersistenceForNotificationRequest:", v7);
  if (v8 == v9)
  {
    if (v10 == v11)
    {
      objc_msgSend(v7, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

    }
    else if (v10 == 2)
    {
      v14 = -1;
    }
    else
    {
      v14 = 1;
    }
  }
  else if (v8 > v9)
  {
    v14 = -1;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)_isContentRevealedForNotificationRequest:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentPreviewSetting");

  if (!v5)
    return 1;
  if (v5 == 1)
    return -[NCNotificationGroupList deviceAuthenticated](self, "deviceAuthenticated");
  return 0;
}

- (void)_reloadNotificationCellAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  if (-[NCNotificationGroupList count](self, "count") > a3)
  {
    -[NCNotificationGroupList orderedRequests](self, "orderedRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NCNotificationGroupList _reloadRecycledNotificationCellForRequest:](self, "_reloadRecycledNotificationCellForRequest:", v6);

    }
  }
}

- (void)_reloadRecycledGroupedNotificationCells
{
  uint64_t i;

  for (i = 1; i != 3; ++i)
    -[NCNotificationGroupList _reloadNotificationCellAtIndex:](self, "_reloadNotificationCellAtIndex:", i);
}

- (void)_reloadRecycledNotificationCellForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationGroupList *v8;
  id v9;
  id v10;

  v10 = a3;
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "notificationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotificationContentViewHidden:", objc_msgSend(v7, "isHiddenBelowStack"));

    objc_msgSend(v6, "setPlatterHighlighted:", 0);
    objc_msgSend(v6, "addObserver:", self);
    objc_msgSend(v6, "delegate");
    v8 = (NCNotificationGroupList *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
      objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "notificationRequest");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      objc_msgSend(v6, "invalidateContentProviders");
    else
      objc_msgSend(v6, "setNotificationRequest:");
    objc_msgSend(v6, "updateContent");

  }
}

- (BOOL)_shouldAllowInteractionWithNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isViewVisibleForNotificationGroupList:", self);

  -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList _currentCellForNotificationRequest:](self, "_currentCellForNotificationRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v9 == v4;
  if (v6)
  {
    if (!-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped")
      && -[NCNotificationGroupList count](self, "count") > 1)
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    -[NCNotificationGroupList logDescription](self, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v19 = v12;
    v20 = 2114;
    v21 = v15;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
    v26 = 2048;
    v27 = -[NCNotificationGroupList count](self, "count");
    v28 = 1024;
    v29 = v9 == v4;
    v30 = 1024;
    v31 = v10;
    _os_log_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ should allow interaction with request %{public}@: [visible=%{BOOL}d \t grouped=%{BOOL}d \t count=%ld \t leadingRequest=%{BOOL}d] = %{BOOL}d", buf, 0x38u);

  }
  return v10;
}

- (BOOL)_handleTapToExpandGroupForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contentPreviewSetting");

  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLocked");
  objc_msgSend(v4, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "coalescesWhenLocked");
  if (v6 == 2)
    v12 = v9;
  else
    v12 = 1;
  if (v11 || !v12)
  {

    goto LABEL_12;
  }
  v13 = -[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");

  if (!v13)
  {
LABEL_12:
    v22 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "contentPreviewSetting");

  if (v15)
  {
    v16 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[NCNotificationGroupList logDescription](self, "logDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "un_logDigest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "Expanding notification group %{public}@ for tap on request %{public}@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__NCNotificationGroupList__handleTapToExpandGroupForNotificationRequest___block_invoke;
    v24[3] = &unk_1E8D1B350;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v21, "notificationListComponent:requestsAuthenticationAndPerformBlock:", self, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[NCNotificationGroupList toggleGroupedState](self, "toggleGroupedState");
  }
  v22 = 1;
LABEL_15:

  return v22;
}

void __73__NCNotificationGroupList__handleTapToExpandGroupForNotificationRequest___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "toggleGroupedState");

  }
}

- (void)_setGrouped:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGrouped:", v3);

  -[NCNotificationGroupList updateStackSummariesIfNeeded](self, "updateStackSummariesIfNeeded");
  if (UNCCatchMe())
  {
    -[NCNotificationGroupList notificationSystemSettings](self, "notificationSystemSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSummarizationEnabled");

    if (v7)
    {
      -[NCNotificationGroupList leadingNotificationRequest](self, "leadingNotificationRequest");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[NCNotificationGroupList _updateSummariesForLeadingNotificationRequest:](self, "_updateSummariesForLeadingNotificationRequest:", v8);

    }
  }
}

- (void)setLogDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NCNotificationSectionSettings)notificationSectionSettings
{
  return self->_notificationSectionSettings;
}

- (void)setNotificationSectionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSectionSettings, a3);
}

- (NCNotificationSystemSettings)notificationSystemSettings
{
  return self->_notificationSystemSettings;
}

- (void)setNotificationSystemSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSystemSettings, a3);
}

- (BOOL)isClockNotificationGroup
{
  return self->_clockNotificationGroup;
}

- (void)setClockNotificationGroup:(BOOL)a3
{
  self->_clockNotificationGroup = a3;
}

- (void)setLeadingNotificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_leadingNotificationRequest, a3);
}

- (BOOL)isClearingAllNotificationRequestsForCellHorizontalSwipe
{
  return self->_clearingAllNotificationRequestsForCellHorizontalSwipe;
}

- (void)setClearingAllNotificationRequestsForCellHorizontalSwipe:(BOOL)a3
{
  self->_clearingAllNotificationRequestsForCellHorizontalSwipe = a3;
}

- (double)individualCellBackgroundAlpha
{
  return self->_individualCellBackgroundAlpha;
}

- (NSMutableArray)orderedRequests
{
  return self->_orderedRequests;
}

- (void)setOrderedRequests:(id)a3
{
  objc_storeStrong((id *)&self->_orderedRequests, a3);
}

- (NSMutableDictionary)contentProviders
{
  return self->_contentProviders;
}

- (void)setContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->_contentProviders, a3);
}

- (NSMutableDictionary)clockSnoozeAlarmContentProviders
{
  return self->_clockSnoozeAlarmContentProviders;
}

- (void)setClockSnoozeAlarmContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->_clockSnoozeAlarmContentProviders, a3);
}

- (NCNotificationSummaryBuilder)summaryBuilder
{
  return self->_summaryBuilder;
}

- (void)setSummaryBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_summaryBuilder, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (NCNotificationListCell)cellRecycledWhilePresentingLongLook
{
  return self->_cellRecycledWhilePresentingLongLook;
}

- (void)setCellRecycledWhilePresentingLongLook:(id)a3
{
  objc_storeStrong((id *)&self->_cellRecycledWhilePresentingLongLook, a3);
}

- (BOOL)longLookDismissalFinalFrameCalculatedWithoutWindow
{
  return self->_longLookDismissalFinalFrameCalculatedWithoutWindow;
}

- (void)setLongLookDismissalFinalFrameCalculatedWithoutWindow:(BOOL)a3
{
  self->_longLookDismissalFinalFrameCalculatedWithoutWindow = a3;
}

- (BOOL)shouldReloadLeadingNotificationRequest
{
  return self->_shouldReloadLeadingNotificationRequest;
}

- (void)setShouldReloadLeadingNotificationRequest:(BOOL)a3
{
  self->_shouldReloadLeadingNotificationRequest = a3;
}

- (NSDate)comparisonDate
{
  return self->_comparisonDate;
}

- (void)setComparisonDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonDate, 0);
  objc_storeStrong((id *)&self->_cellRecycledWhilePresentingLongLook, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_summaryBuilder, 0);
  objc_storeStrong((id *)&self->_clockSnoozeAlarmContentProviders, 0);
  objc_storeStrong((id *)&self->_contentProviders, 0);
  objc_storeStrong((id *)&self->_orderedRequests, 0);
  objc_storeStrong((id *)&self->_leadingNotificationRequest, 0);
  objc_storeStrong((id *)&self->_notificationSystemSettings, 0);
  objc_storeStrong((id *)&self->_notificationSectionSettings, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_logDescription, 0);
}

- (void)updateOrderedNotificationRequests:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "logDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a3, "count");
  objc_msgSend(a2, "orderedRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = objc_msgSend(v8, "count");
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ updating ordered notification requests failed because mismatch with count %lu while expected count is %lu", (uint8_t *)&v9, 0x20u);

}

@end
