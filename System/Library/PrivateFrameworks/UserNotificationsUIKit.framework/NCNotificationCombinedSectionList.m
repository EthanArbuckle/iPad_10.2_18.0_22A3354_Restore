@implementation NCNotificationCombinedSectionList

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList updateNotificationSectionSettings:previousSectionSettings:](&v13, sel_updateNotificationSectionSettings_previousSectionSettings_, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__NCNotificationCombinedSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
  v10[3] = &unk_1E8D1E770;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v10);

}

- (void)_performOperationOnAllSectionLists:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[NCNotificationCombinedSectionList _allSectionLists](self, "_allSectionLists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)_allSectionLists
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  return v5;
}

- (NSMutableArray)sectionLists
{
  return self->_sectionLists;
}

- (NSMutableArray)chronologicalSectionLists
{
  return self->_chronologicalSectionLists;
}

- (NCNotificationCombinedSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  NCNotificationCombinedSectionList *v4;
  NSMutableArray *v5;
  NSMutableArray *sectionLists;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  v4 = -[NCNotificationStructuredSectionList initWithTitle:sectionType:](&v8, sel_initWithTitle_sectionType_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sectionLists = v4->_sectionLists;
    v4->_sectionLists = v5;

  }
  return v4;
}

- (void)insertNotificationSectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= a4)
  {
    v10 = -[NCNotificationCombinedSectionList count](self, "count");
    -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v16, a4);

    -[NCNotificationStructuredSectionList _insertViewToListAtIndex:animated:](self, "_insertViewToListAtIndex:animated:", a4, v5);
    objc_msgSend(v16, "listView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRevealPercentage:", 1.0);

    objc_msgSend(v16, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRevealed:", 1);

    v14 = -[NCNotificationCombinedSectionList count](self, "count");
    if (!v10)
    {
      if (v14)
      {
        -[NCNotificationStructuredSectionList listView](self, "listView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reloadHeaderView");

      }
    }
  }

}

- (void)insertNotificationSectionListChronologically:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  NSMutableArray *chronologicalSectionLists;
  NSMutableArray *v8;
  NSMutableArray *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (!-[NCNotificationCombinedSectionList containsSectionList:](self, "containsSectionList:"))
  {
    v6 = -[NCNotificationCombinedSectionList count](self, "count");
    chronologicalSectionLists = self->_chronologicalSectionLists;
    if (!chronologicalSectionLists)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = self->_chronologicalSectionLists;
      self->_chronologicalSectionLists = v8;

      chronologicalSectionLists = self->_chronologicalSectionLists;
    }
    -[NSMutableArray addObject:](chronologicalSectionLists, "addObject:", v12);
    -[NCNotificationStructuredSectionList _insertViewToListAtIndex:animated:](self, "_insertViewToListAtIndex:animated:", -[NCNotificationStructuredSectionList _indexOfOrderedNotificationListComponent:](self, "_indexOfOrderedNotificationListComponent:", v12), v4);
    v10 = -[NCNotificationCombinedSectionList count](self, "count");
    if (!v6 && v10)
    {
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadHeaderView");

    }
  }

}

- (void)removeNotificationSectionList:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  NSMutableArray *chronologicalSectionLists;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  v6 = -[NCNotificationCombinedSectionList count](self, "count");
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v18);

  if (v8)
  {
    -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v18);

    -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v18);

    -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v10, v4, objc_msgSend(v18, "isHorizontallyDisplaced"));
  }
  else
  {
    -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v18);

    if (v13)
    {
      v14 = -[NCNotificationStructuredSectionList _indexOfOrderedNotificationListComponent:](self, "_indexOfOrderedNotificationListComponent:", v18);
      -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v18);

      -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v14, v4, objc_msgSend(v18, "isHorizontallyDisplaced"));
      if (!-[NSMutableArray count](self->_chronologicalSectionLists, "count"))
      {
        chronologicalSectionLists = self->_chronologicalSectionLists;
        self->_chronologicalSectionLists = 0;

      }
    }
  }
  if (v6 && !-[NCNotificationCombinedSectionList count](self, "count"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadHeaderView");

  }
}

- (id)sectionListAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NCNotificationCombinedSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v6 = v5;
    else
      v6 = 0;

  }
  return v6;
}

- (BOOL)containsSectionList:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v4);

  }
  return v6;
}

- (void)clearAll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList clearAll](&v3, sel_clearAll);
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", &__block_literal_global_30);
}

uint64_t __45__NCNotificationCombinedSectionList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearAll");
}

- (BOOL)hasVisibleContentToReveal
{
  BOOL v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned __int8 v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationCombinedSectionList;
  v11 = -[NCNotificationStructuredSectionList hasVisibleContentToReveal](&v7, sel_hasVisibleContentToReveal);
  if (*((_BYTE *)v9 + 24))
  {
    v3 = 1;
  }
  else
  {
    -[NCNotificationCombinedSectionList _allSectionLists](self, "_allSectionLists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__NCNotificationCombinedSectionList_hasVisibleContentToReveal__block_invoke;
    v6[3] = &unk_1E8D1C170;
    v6[4] = &v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    v3 = *((_BYTE *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

uint64_t __62__NCNotificationCombinedSectionList_hasVisibleContentToReveal__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasVisibleContentToReveal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  v6 = a3;
  -[NCNotificationStructuredSectionList mergeNotificationGroups:reorderGroupNotifications:](&v8, sel_mergeNotificationGroups_reorderGroupNotifications_, v6, v4);
  v7 = objc_msgSend(v6, "count", v8.receiver, v8.super_class);

  if (v7)
  {
    if (v4)
      -[NCNotificationCombinedSectionList _invalidateSectionListViewForChronologicalSectionsIfNecessary](self, "_invalidateSectionListViewForChronologicalSectionsIfNecessary");
  }
}

- (void)sortNotificationGroupListsIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_10_2);

    v6.receiver = self;
    v6.super_class = (Class)NCNotificationCombinedSectionList;
    -[NCNotificationStructuredSectionList sortNotificationGroupListsIfNecessary](&v6, sel_sortNotificationGroupListsIfNecessary);
    -[NCNotificationCombinedSectionList _invalidateSectionListViewForChronologicalSectionsIfNecessary](self, "_invalidateSectionListViewForChronologicalSectionsIfNecessary");
  }
}

uint64_t __74__NCNotificationCombinedSectionList_sortNotificationGroupListsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateComparisonDate");
}

- (unint64_t)count
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationCombinedSectionList;
  v7 = (char *)-[NCNotificationStructuredSectionList count](&v9, sel_count) + v6;

  return (unint64_t)v7;
}

- (unint64_t)notificationCount
{
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NCNotificationCombinedSectionList;
  v3 = -[NCNotificationStructuredSectionList notificationCount](&v14, sel_notificationCount);
  -[NCNotificationCombinedSectionList _allSectionLists](self, "_allSectionLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "notificationCount");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  return (unint64_t)v3;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList setDeviceAuthenticated:](&v7, sel_setDeviceAuthenticated_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__NCNotificationCombinedSectionList_setDeviceAuthenticated___block_invoke;
  v5[3] = &__block_descriptor_33_e45_v16__0__NCNotificationStructuredSectionList_8l;
  v6 = a3;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v5);
}

uint64_t __60__NCNotificationCombinedSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

- (void)reloadNotificationRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList reloadNotificationRequest:](&v8, sel_reloadNotificationRequest_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__NCNotificationCombinedSectionList_reloadNotificationRequest___block_invoke;
  v6[3] = &unk_1E8D1E748;
  v7 = v4;
  v5 = v4;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v6);

}

uint64_t __63__NCNotificationCombinedSectionList_reloadNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadNotificationRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __95__NCNotificationCombinedSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNotificationSectionSettings:previousSectionSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList notificationsLoadedForSectionIdentifier:](&v8, sel_notificationsLoadedForSectionIdentifier_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NCNotificationCombinedSectionList_notificationsLoadedForSectionIdentifier___block_invoke;
  v6[3] = &unk_1E8D1E748;
  v7 = v4;
  v5 = v4;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v6);

}

uint64_t __77__NCNotificationCombinedSectionList_notificationsLoadedForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationsLoadedForSectionIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList toggleFilteringForSectionIdentifier:shouldFilter:](&v11, sel_toggleFilteringForSectionIdentifier_shouldFilter_, v6, v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationCombinedSectionList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke;
  v8[3] = &unk_1E8D1E798;
  v9 = v6;
  v10 = v4;
  v7 = v6;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v8);

}

uint64_t __86__NCNotificationCombinedSectionList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleFilteringForSectionIdentifier:shouldFilter:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)allNotificationRequests
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList allNotificationRequests](&v16, sel_allNotificationRequests);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationCombinedSectionList _allSectionLists](self, "_allSectionLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "allNotificationRequests");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList expandGroupForNotificationRequest:withCompletion:](&v13, sel_expandGroupForNotificationRequest_withCompletion_, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__NCNotificationCombinedSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E8D1E7C0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v10);

}

uint64_t __86__NCNotificationCombinedSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "expandGroupForNotificationRequest:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList collapseGroupForNotificationRequest:withCompletion:](&v13, sel_collapseGroupForNotificationRequest_withCompletion_, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__NCNotificationCombinedSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E8D1E7C0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v10);

}

uint64_t __88__NCNotificationCombinedSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collapseGroupForNotificationRequest:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unsigned __int8 v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationCombinedSectionList;
  v15 = -[NCNotificationStructuredSectionList containsNotificationRequest:](&v11, sel_containsNotificationRequest_, v4);
  if (*((_BYTE *)v13 + 24))
  {
    v5 = 1;
  }
  else
  {
    -[NCNotificationCombinedSectionList _allSectionLists](self, "_allSectionLists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__NCNotificationCombinedSectionList_containsNotificationRequest___block_invoke;
    v8[3] = &unk_1E8D1C1E0;
    v9 = v4;
    v10 = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    v5 = *((_BYTE *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);

  return v5;
}

uint64_t __65__NCNotificationCombinedSectionList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsNotificationRequest:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  -[NCNotificationCombinedSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a4)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "listView");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NCNotificationCombinedSectionList;
      -[NCNotificationStructuredSectionList notificationListView:viewForItemAtIndex:](&v12, sel_notificationListView_viewForItemAtIndex_, v6, a4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;

  }
  return v10;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  objc_super v16;

  v8 = a3;
  -[NCNotificationCombinedSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  if (objc_msgSend(v9, "count") > a4)
  {
    objc_msgSend(v9, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "listView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeThatFits:", a5, 0.0);
      v10 = v13;

    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)NCNotificationCombinedSectionList;
      -[NCNotificationStructuredSectionList notificationListView:heightForItemAtIndex:withWidth:](&v16, sel_notificationListView_heightForItemAtIndex_withWidth_, v8, a4, a5);
      v10 = v14;
    }

  }
  return v10;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList notificationListComponent:didRemoveNotificationRequest:](&v6, sel_notificationListComponent_didRemoveNotificationRequest_, a3, a4);
  if (!-[NCNotificationCombinedSectionList count](self, "count"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadHeaderView");

  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList notificationListBaseComponentDidRemoveAll:](&v5, sel_notificationListBaseComponentDidRemoveAll_, a3);
  if (!-[NCNotificationCombinedSectionList count](self, "count"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadHeaderView");

  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList adjustForContentSizeCategoryChange](&v4, sel_adjustForContentSizeCategoryChange);
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", &__block_literal_global_45);
  return 1;
}

uint64_t __71__NCNotificationCombinedSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList adjustForLegibilitySettingsChange:](&v8, sel_adjustForLegibilitySettingsChange_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NCNotificationCombinedSectionList_adjustForLegibilitySettingsChange___block_invoke;
  v6[3] = &unk_1E8D1E748;
  v7 = v4;
  v5 = v4;
  -[NCNotificationCombinedSectionList _performOperationOnAllSectionLists:](self, "_performOperationOnAllSectionLists:", v6);

}

uint64_t __71__NCNotificationCombinedSectionList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForLegibilitySettingsChange:", *(_QWORD *)(a1 + 32));
}

- (id)orderedNotificationListComponents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke;
  v12[3] = &unk_1E8D1B648;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NCNotificationCombinedSectionList sectionLists](self, "sectionLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend(v10, "addObjectsFromArray:", v7);
  return v10;
}

void __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke_2;
  v8[3] = &unk_1E8D1E808;
  v9 = v3;
  v7 = v3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);
  v6 = *(void **)(a1 + 32);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "addObject:", v7);
  else
    objc_msgSend(v6, "insertObject:atIndex:", v7);

}

BOOL __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "comparisonDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "comparisonDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4) == -1;

  return v5;
}

- (void)_invalidateSectionListViewForChronologicalSectionsIfNecessary
{
  void *v3;
  uint64_t v4;
  id v5;

  -[NCNotificationCombinedSectionList chronologicalSectionLists](self, "chronologicalSectionLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateData");

  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void)setSectionLists:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLists, a3);
}

- (void)setChronologicalSectionLists:(id)a3
{
  objc_storeStrong((id *)&self->_chronologicalSectionLists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chronologicalSectionLists, 0);
  objc_storeStrong((id *)&self->_sectionLists, 0);
}

@end
