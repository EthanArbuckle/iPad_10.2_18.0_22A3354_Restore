@implementation NCNotificationStructuredSectionList

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  char v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, void *);
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  NCNotificationStructuredSectionList *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
  v50[3] = &unk_1E8D1C678;
  v12 = v8;
  v51 = v12;
  v13 = v9;
  v52 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v50);

  if (!v7)
  {
    v16 = 0;
    v15 = 0;
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v14 = objc_msgSend(v6, "showsInNotificationCenter");
  if (v14 == objc_msgSend(v7, "showsInNotificationCenter"))
  {
    v16 = 0;
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend(v6, "showsInNotificationCenter") ^ 1;
    v16 = objc_msgSend(v6, "showsInNotificationCenter");
  }
  v17 = objc_msgSend(v6, "notificationsEnabled");
  if (v17 == objc_msgSend(v7, "notificationsEnabled"))
    goto LABEL_8;
  v18 = objc_msgSend(v6, "notificationsEnabled") ^ 1;
LABEL_9:
  if ((v15 & 1) != 0 || v18)
  {
    v19 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v21;
      v55 = 2114;
      v56 = v12;
      _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding notifications for %{public}@ on settings change", buf, 0x16u);

    }
    v48[0] = v11;
    v48[1] = 3221225472;
    v48[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_11;
    v48[3] = &unk_1E8D1BF50;
    v49 = v12;
    -[NCNotificationStructuredSectionList _hideNotificationGroupsPassingTest:](self, "_hideNotificationGroupsPassingTest:", v48);

    if (!v16)
    {
LABEL_12:
      if (!v7)
        goto LABEL_24;
      goto LABEL_20;
    }
  }
  else if (!v16)
  {
    goto LABEL_12;
  }
  v22 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v24;
    v55 = 2114;
    v56 = v12;
    _os_log_impl(&dword_1CFC3D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ showing notifications for %{public}@ on Shows In Notification Center Turned ON", buf, 0x16u);

  }
  v46[0] = v11;
  v46[1] = 3221225472;
  v46[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_13;
  v46[3] = &unk_1E8D1BF50;
  v47 = v12;
  -[NCNotificationStructuredSectionList _showHiddenNotificationGroupsPassingTest:](self, "_showHiddenNotificationGroupsPassingTest:", v46);

  if (v7)
  {
LABEL_20:
    v25 = objc_msgSend(v6, "groupingSetting");
    if (v25 != objc_msgSend(v7, "groupingSetting"))
    {
      v26 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v28;
        v55 = 2114;
        v56 = v12;
        _os_log_impl(&dword_1CFC3D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ changed grouping setting for section %{public}@", buf, 0x16u);

      }
      v43[0] = v11;
      v43[1] = 3221225472;
      v43[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_14;
      v43[3] = &unk_1E8D1C678;
      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = self;
      v29 = v44;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v43);
      v42[0] = v11;
      v42[1] = 3221225472;
      v42[2] = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2;
      v42[3] = &unk_1E8D1B4B0;
      v42[4] = self;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v42);

    }
  }
LABEL_24:
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  v36 = 3221225472;
  v37 = __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3;
  v38 = &unk_1E8D1B5F8;
  v39 = v12;
  v40 = v6;
  v41 = v7;
  v31 = v7;
  v32 = v6;
  v33 = v12;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", &v35);

  -[NCNotificationStructuredSectionList delegate](self, "delegate", v35, v36, v37, v38);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "notificationListComponentChangedContent:", self);

}

- (unint64_t)notificationCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__NCNotificationStructuredSectionList_notificationCount__block_invoke;
  v5[3] = &unk_1E8D1C728;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSMutableArray)notificationGroups
{
  return self->_notificationGroups;
}

- (NCNotificationListComponentDelegate)delegate
{
  return (NCNotificationListComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NCNotificationStructuredSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  id v7;
  NCNotificationStructuredSectionList *v8;
  NCNotificationStructuredSectionList *v9;
  NSMutableArray *v10;
  NSMutableArray *notificationGroups;
  NSMutableSet *v12;
  NSMutableSet *hiddenNotificationGroups;
  NSMutableSet *v14;
  NSMutableSet *hiddenNotificationRequests;
  NSMutableDictionary *v16;
  NSMutableDictionary *filteredNotificationRequests;
  NSMutableDictionary *v18;
  NSMutableDictionary *preloadedNotificationGroups;
  NSMutableSet *v20;
  NSMutableSet *groupListsToSort;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NCNotificationStructuredSectionList;
  v8 = -[NCNotificationStructuredSectionList init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_sectionType = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    notificationGroups = v9->_notificationGroups;
    v9->_notificationGroups = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hiddenNotificationGroups = v9->_hiddenNotificationGroups;
    v9->_hiddenNotificationGroups = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hiddenNotificationRequests = v9->_hiddenNotificationRequests;
    v9->_hiddenNotificationRequests = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    filteredNotificationRequests = v9->_filteredNotificationRequests;
    v9->_filteredNotificationRequests = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    preloadedNotificationGroups = v9->_preloadedNotificationGroups;
    v9->_preloadedNotificationGroups = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    groupListsToSort = v9->_groupListsToSort;
    v9->_groupListsToSort = v20;

    *(_WORD *)&v9->_dynamicGroupingActive = 1;
  }

  return v9;
}

- (NCNotificationListView)listView
{
  NCNotificationListView *listView;
  NCNotificationListView *v4;
  uint64_t v5;
  void *v6;
  NCNotificationListView *v7;
  NCNotificationListView *v8;

  listView = self->_listView;
  if (!listView)
  {
    v4 = [NCNotificationListView alloc];
    v5 = objc_opt_class();
    NCNotificationListSectionTypeString(self->_sectionType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NCNotificationListView initWithModelType:purpose:](v4, "initWithModelType:purpose:", v5, v6);
    v8 = self->_listView;
    self->_listView = v7;

    -[NCNotificationStructuredSectionList _configureSectionListView:](self, "_configureSectionListView:", self->_listView);
    listView = self->_listView;
  }
  return listView;
}

- (void)setNotificationListCache:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_notificationListCache, a3);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__NCNotificationStructuredSectionList_setNotificationListCache___block_invoke;
  v8[3] = &unk_1E8D1C3A0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __64__NCNotificationStructuredSectionList_setNotificationListCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNotificationListCache:", *(_QWORD *)(a1 + 32));
}

- (NSArray)allNotificationGroups
{
  void *v2;
  void *v3;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setTitle:(id)a3
{
  NCNotificationListSectionHeaderView *headerView;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    headerView = self->_headerView;
    self->_headerView = 0;

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadHeaderView");

  }
}

- (NSArray)allNotificationRequests
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NCNotificationStructuredSectionList_allNotificationRequests__block_invoke;
  v7[3] = &unk_1E8D1C3A0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __62__NCNotificationStructuredSectionList_allNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allNotificationRequests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  NCNotificationStructuredSectionList *v23;
  id v24;
  id v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke;
  v21[3] = &unk_1E8D1C628;
  v13 = v8;
  v24 = v13;
  v14 = v9;
  v25 = v14;
  v15 = v10;
  v22 = v15;
  v23 = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

  if (v5)
  {
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_4;
    v20[3] = &unk_1E8D1C3A0;
    v20[4] = self;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
  }
  else
  {
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsInArray:", v15);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invalidateData");

  }
  -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessary](self, "_toggleDynamicGroupingIfNecessary");
  v18 = v15;

  return v18;
}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v16 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v6 = v16, v5))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v16, "allNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v16, "allNotificationRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_2;
      v20[3] = &unk_1E8D1C5D8;
      v22 = *(id *)(a1 + 56);
      v21 = v9;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);

    }
    v11 = objc_msgSend(v9, "count");
    if (v11 == objc_msgSend(v16, "notificationCount"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
    }
    else if (objc_msgSend(v9, "count"))
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v9, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "_newGroupListForNotificationRequest:", v13);

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_3;
      v17[3] = &unk_1E8D1C600;
      v18 = v16;
      v19 = v14;
      v15 = v14;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

    }
    v6 = v16;
  }

}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);

}

void __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "removeNotificationRequest:", v4);
  objc_msgSend(*(id *)(a1 + 40), "insertNotificationRequest:", v4);

}

uint64_t __125__NCNotificationStructuredSectionList_removeNotificationGroupListsForMigrationPassingTest_filterRequestsPassingTest_animate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationGroupList:", a2);
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  NCNotificationStructuredSectionList *v19;
  _QWORD v20[5];
  id v21;

  v5 = a3;
  v6 = -[NCNotificationStructuredSectionList count](self, "count");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke;
  v20[3] = &unk_1E8D1C678;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);

  v10 = -[NCNotificationStructuredSectionList count](self, "count");
  if (!v6 && v10)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadHeaderView");

  }
  v14 = v8;
  v15 = 3221225472;
  v16 = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2_8;
  v17 = &unk_1E8D1B3A0;
  v18 = v9;
  v19 = self;
  v12 = v9;
  v13 = (void (**)(_QWORD))_Block_copy(&v14);
  if (-[NCNotificationStructuredSectionList sectionType](self, "sectionType", v14, v15, v16, v17) - 1 <= 1)
    v13[2](v13);
  if (-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"))
  {
    -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
  }

}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldHideNotificationGroupList:", v3))
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v7;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding merged notification group %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_addHiddenNotificationGroupList:", v3);
    objc_msgSend(v3, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateData");

    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "notificationListCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNotificationListCache:", v10);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isPerformingDynamicGrouping"))
  {
    objc_msgSend(v3, "allNotificationRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_5;
    v33[3] = &unk_1E8D1B4B0;
    v33[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v33);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2;
    v31[3] = &unk_1E8D1C650;
    v14 = v3;
    v32 = v14;
    v15 = objc_msgSend(v12, "indexOfObjectPassingTest:", v31);

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(a1 + 32);
        v18 = v16;
        objc_msgSend(v17, "logDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2114;
        v37 = v20;
        _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting merged notification group %{public}@", buf, 0x16u);

      }
      objc_msgSend(v14, "allNotificationRequests");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_7;
      v30[3] = &unk_1E8D1B4B0;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v30);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(void **)(a1 + 32);
        v26 = v24;
        objc_msgSend(v25, "logDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        v36 = 2114;
        v37 = v28;
        _os_log_impl(&dword_1CFC3D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ merging notification group %{public}@ with existing group", buf, 0x16u);

      }
      objc_msgSend(v14, "allNotificationRequests");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "mergeNotificationRequests:", v29);

      objc_msgSend(*(id *)(a1 + 32), "_updatePositionOfGroup:atIndex:", v23, v15);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);

    }
  }

}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesGroup:", *(_QWORD *)(a1 + 32));
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

uint64_t __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_2_8(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3;
  v3[3] = &unk_1E8D1C3A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isRevealed") & 1) != 0)
  {
    objc_msgSend(v3, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "revealPercentage");
    v6 = BSFloatApproximatelyEqualToFloat();

    if ((v6 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  v7 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3_cold_1(a1, v7, v3);
  objc_msgSend(v3, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRevealed:", 1);

  objc_msgSend(v3, "listView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRevealPercentage:", 1.0);

LABEL_8:
}

- (void)regroupNotificationGroups
{
  id v2;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_4);

}

uint64_t __64__NCNotificationStructuredSectionList_regroupNotificationGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGrouped:animated:", 1, 0);
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  if (a4)
    -[NCNotificationStructuredSectionList _filterNotificationRequestsForSectionIdentifier:](self, "_filterNotificationRequestsForSectionIdentifier:", a3);
  else
    -[NCNotificationStructuredSectionList _unfilterNotificationRequestsForSectionIdentifier:](self, "_unfilterNotificationRequestsForSectionIdentifier:", a3);
}

- (void)clearAll
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is clearing all notification requests", buf, 0xCu);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__NCNotificationStructuredSectionList_clearAll__block_invoke;
  v17[3] = &unk_1E8D1B5F8;
  v17[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationListBaseComponent:requestsClearingPresentables:", self, v10);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 1)
  {
    v14 = v13 + 1;
    do
    {
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", (v14 - 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "containsObject:", v16))
        -[NCNotificationStructuredSectionList _removeNotificationGroupList:](self, "_removeNotificationGroupList:", v16);

      --v14;
    }
    while (v14 > 1);
  }
  if (!-[NCNotificationStructuredSectionList count](self, "count"))
    objc_msgSend(v11, "notificationStructuredSectionListDidClearAllNotificationRequests:", self);

}

void __47__NCNotificationStructuredSectionList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "allNotificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockScreenPriority");

  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lockScreenPersistence");

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldClearPersistentNotificationRequests") & 1) != 0 || !v8 || v6 == 100)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v11, "allNotificationRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

  }
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__NCNotificationStructuredSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E8D1C6E0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

void __88__NCNotificationStructuredSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = objc_msgSend(v9, "isLeadingNotificationRequest:", *(_QWORD *)(a1 + 32));
  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "setGrouped:animated:", 0, 1);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
    *a4 = 1;
    v7 = v9;
  }

}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__NCNotificationStructuredSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E8D1C6E0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

void __90__NCNotificationStructuredSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = objc_msgSend(v9, "isLeadingNotificationRequest:", *(_QWORD *)(a1 + 32));
  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "setGrouped:animated:", 1, 1);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
    *a4 = 1;
    v7 = v9;
  }

}

- (void)sortNotificationGroupListsIfNecessary
{
  NCNotificationStructuredSectionList *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  NCNotificationStructuredSectionList *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_t *v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NCNotificationStructuredSectionList groupListsToSort](v2, "groupListsToSort");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v27;
      v10 = (os_log_t *)MEMORY[0x1E0DC5F90];
      *(_QWORD *)&v7 = 138543618;
      v24 = v7;
      v25 = v5;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
          -[NCNotificationStructuredSectionList notificationGroups](v2, "notificationGroups", v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "indexOfObject:", v12);

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              v16 = v15;
              -[NCNotificationStructuredSectionList logDescription](v2, "logDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "logDescription");
              v18 = v2;
              v19 = v8;
              v20 = v9;
              v21 = v10;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v24;
              v31 = v17;
              v32 = 2112;
              v33 = v22;
              _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ sorting group %@", buf, 0x16u);

              v10 = v21;
              v9 = v20;
              v8 = v19;
              v2 = v18;

              v5 = v25;
            }
            -[NCNotificationStructuredSectionList _updatePositionOfGroup:atIndex:](v2, "_updatePositionOfGroup:atIndex:", v12, v14);
          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v8);
    }

    -[NCNotificationStructuredSectionList groupListsToSort](v2, "groupListsToSort");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllObjects");

  }
}

- (BOOL)hasVisibleContentToReveal
{
  NCNotificationStructuredSectionList *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NCNotificationStructuredSectionList_hasVisibleContentToReveal__block_invoke;
  v5[3] = &unk_1E8D1B790;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __64__NCNotificationStructuredSectionList_hasVisibleContentToReveal__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  char v10;
  id v11;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionSettingsForSectionIdentifier:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    v9 = objc_msgSend(v11, "contentPreviewSetting") == 1;
    v8 = v11;
    v10 = v9;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (void)setSectionListViewGroupedWithContentShown:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;

  if (self->_sectionListViewGroupedWithContentShown != a3)
  {
    v3 = a3;
    self->_sectionListViewGroupedWithContentShown = a3;
    if (a3)
      -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessaryForced:](self, "_toggleDynamicGroupingIfNecessaryForced:", 1);
    -[NCNotificationStructuredSectionList setSupportsDynamicGrouping:](self, "setSupportsDynamicGrouping:", v3 ^ 1);
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportsGrouping:", v3);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGrouped:", v3);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowContentForGroupedViews:", v3);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupedOverlapHeightMultiple:", 4.0);

    -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__NCNotificationStructuredSectionList_setSectionListViewGroupedWithContentShown___block_invoke;
    v10[3] = &__block_descriptor_33_e40_v32__0__NCNotificationGroupList_8Q16_B24l;
    v11 = v3;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

    -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
  }
}

void __81__NCNotificationStructuredSectionList_setSectionListViewGroupedWithContentShown___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "listView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowContentForGroupedViews:", *(unsigned __int8 *)(a1 + 32));

}

- (void)reloadLeadingNotificationRequestsForStackedNotificationGroupLists
{
  void *v3;
  _QWORD v4[5];

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __104__NCNotificationStructuredSectionList_reloadLeadingNotificationRequestsForStackedNotificationGroupLists__block_invoke;
  v4[3] = &unk_1E8D1C3A0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __104__NCNotificationStructuredSectionList_reloadLeadingNotificationRequestsForStackedNotificationGroupLists__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a3 > 2)
  {
    v8 = a2;
    objc_msgSend(v8, "listView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setGroupedOverlapHeightMultiple:", 1.0);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v9 = a2;
    v5 = 1.0;
    if (objc_msgSend(v4, "isSectionListCurrentlyGroupedWithContentShown"))
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationGroups");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v6, "count") <= 1)
        v5 = 1.0;
      else
        v5 = 0.0;

    }
    objc_msgSend(v9, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGroupedOverlapHeightMultiple:", v5);

    objc_msgSend(v9, "reloadLeadingNotificationRequest");
  }

}

- (BOOL)isHorizontallyDisplaced
{
  return 0;
}

- (double)expandedHeight
{
  void *v2;
  double v3;
  double v4;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateSizeForGrouped:", 0);
  v4 = v3;

  return v4;
}

- (double)collapsedHeight
{
  void *v2;
  double v3;
  double v4;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateSizeForGrouped:", 1);
  v4 = v3;

  return v4;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (NSSet)presentableTypes
{
  return +[NCNotificationGroupList presentableTypes](NCNotificationGroupList, "presentableTypes");
}

uint64_t __56__NCNotificationStructuredSectionList_notificationCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "notificationCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BYTE v52[24];
  void *v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationStructuredSectionList _shouldFilterNotificationRequest:](self, "_shouldFilterNotificationRequest:", v4))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 138543618;
      *(_QWORD *)&v52[4] = v7;
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ filtering inserted notification request %{public}@", v52, 0x16u);

    }
    -[NCNotificationStructuredSectionList _filterNotificationRequest:](self, "_filterNotificationRequest:", v4);
    goto LABEL_37;
  }
  if (-[NCNotificationStructuredSectionList _shouldHideNotificationRequest:](self, "_shouldHideNotificationRequest:", v4))
  {
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "un_logDigest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 138543618;
      *(_QWORD *)&v52[4] = v12;
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v14;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hiding inserted notification request %{public}@", v52, 0x16u);

    }
    -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v4);

    goto LABEL_37;
  }
  if (!-[NCNotificationStructuredSectionList _shouldPreloadNotificationRequest:](self, "_shouldPreloadNotificationRequest:", v4))
  {
    v22 = -[NCNotificationStructuredSectionList count](self, "count");
    v23 = -[NCNotificationStructuredSectionList existingIndexOfGroupForNotificationRequestForInsertion:](self, "existingIndexOfGroupForNotificationRequestForInsertion:", v4);
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = -[NCNotificationStructuredSectionList _newGroupListForNotificationRequest:](self, "_newGroupListForNotificationRequest:", v4);
      v25 = (void *)*MEMORY[0x1E0DC5F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v26 = v25;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "un_logDigest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 138543874;
      *(_QWORD *)&v52[4] = v27;
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v29;
      *(_WORD *)&v52[22] = 2114;
      v53 = v30;
      v31 = "%{public}@ inserting notification request %{public}@ in new group %{public}@";
      v32 = v26;
      v33 = 32;
    }
    else
    {
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndex:", v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      v35 = (void *)*MEMORY[0x1E0DC5F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v26 = v35;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "un_logDigest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 138544130;
      *(_QWORD *)&v52[4] = v27;
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v29;
      *(_WORD *)&v52[22] = 2114;
      v53 = v30;
      LOWORD(v54) = 2048;
      *(_QWORD *)((char *)&v54 + 2) = v23;
      v31 = "%{public}@ inserting notification request %{public}@ in existing group %{public}@ at index %ld";
      v32 = v26;
      v33 = 42;
    }
    _os_log_impl(&dword_1CFC3D000, v32, OS_LOG_TYPE_DEFAULT, v31, v52, v33);

LABEL_19:
    objc_msgSend(v24, "insertNotificationRequest:", v4, *(_OWORD *)v52, *(_QWORD *)&v52[16], v53, v54);
    objc_msgSend(v24, "listView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isGrouped");

    if (v37)
      -[NCNotificationStructuredSectionList _updatePositionOfGroup:atIndex:](self, "_updatePositionOfGroup:atIndex:", v24, v23);
    v38 = -[NCNotificationStructuredSectionList count](self, "count");
    if (!v22 && v38)
    {
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "reloadHeaderView");

    }
    -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessary](self, "_toggleDynamicGroupingIfNecessary");
    if (-[NCNotificationStructuredSectionList sectionType](self, "sectionType") - 1 <= 1)
    {
      objc_msgSend(v24, "listView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "isRevealed") & 1) != 0)
      {
        objc_msgSend(v24, "listView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "revealPercentage");
        v42 = BSFloatApproximatelyEqualToFloat();

        if ((v42 & 1) != 0)
        {
LABEL_36:

          goto LABEL_37;
        }
      }
      else
      {

      }
      v43 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
        -[NCNotificationStructuredSectionList insertNotificationRequest:].cold.1(v43, self, v24);
      objc_msgSend(v24, "listView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setRevealed:", 1);

      objc_msgSend(v24, "listView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setRevealPercentage:", 1.0);

    }
    if (-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"))
    {
      v46 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v47 = v46;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "leadingNotificationRequest");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "notificationIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "un_logDigest");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v52 = 138543618;
        *(_QWORD *)&v52[4] = v48;
        *(_WORD *)&v52[12] = 2114;
        *(_QWORD *)&v52[14] = v51;
        _os_log_impl(&dword_1CFC3D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ reload leading notification %{public}@", v52, 0x16u);

      }
      -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
    }
    goto LABEL_36;
  }
  v16 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "un_logDigest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v52 = 138543874;
    *(_QWORD *)&v52[4] = v18;
    *(_WORD *)&v52[12] = 2114;
    *(_QWORD *)&v52[14] = v20;
    *(_WORD *)&v52[22] = 2114;
    v53 = v21;
    _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ preloading inserted notification request %{public}@ for section %{public}@", v52, 0x20u);

  }
  -[NCNotificationStructuredSectionList _insertPreloadedNotificationRequest:](self, "_insertPreloadedNotificationRequest:", v4);
LABEL_37:

}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationStructuredSectionList _shouldFilterNotificationRequest:](self, "_shouldFilterNotificationRequest:", v4))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v7;
      v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing filtered notification request %{public}@", (uint8_t *)&v33, 0x16u);

    }
    -[NCNotificationStructuredSectionList _removeFilteredNotificationRequest:](self, "_removeFilteredNotificationRequest:", v4);
  }
  else if (-[NCNotificationStructuredSectionList _shouldHideNotificationRequest:](self, "_shouldHideNotificationRequest:", v4))
  {
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "un_logDigest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v12;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hidden notification request %{public}@", (uint8_t *)&v33, 0x16u);

    }
    -[NCNotificationStructuredSectionList _removeHiddenNotificationRequest:](self, "_removeHiddenNotificationRequest:", v4);
  }
  else if (-[NCNotificationStructuredSectionList _shouldPreloadNotificationRequest:](self, "_shouldPreloadNotificationRequest:", v4))
  {
    v15 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v17;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ removing preloaded notification request %{public}@", (uint8_t *)&v33, 0x16u);

    }
    -[NCNotificationStructuredSectionList _removePreloadedNotificationRequest:](self, "_removePreloadedNotificationRequest:", v4);
  }
  else
  {
    v20 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequestForRemoval:](self, "_existingIndexOfGroupForNotificationRequestForRemoval:", v4);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v20;
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "notificationIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "un_logDigest");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138544130;
        v34 = v26;
        v35 = 2114;
        v36 = v28;
        v37 = 2114;
        v38 = v29;
        v39 = 2048;
        v40 = v21;
        _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v33, 0x2Au);

      }
      objc_msgSend(v23, "removeNotificationRequest:", v4);
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v23, "listView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isGrouped");

        if (v31)
        {
          -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v23);

        }
      }
      else
      {
        -[NCNotificationStructuredSectionList _removeNotificationGroupList:](self, "_removeNotificationGroupList:", v23);
      }

    }
    if (-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"))
    {
      -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
    }
  }
  -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessary](self, "_toggleDynamicGroupingIfNecessary");

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationStructuredSectionList _shouldFilterNotificationRequest:](self, "_shouldFilterNotificationRequest:", v4))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v7;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying filtered notification request %{public}@", (uint8_t *)&v30, 0x16u);

    }
    -[NCNotificationStructuredSectionList _filterNotificationRequest:](self, "_filterNotificationRequest:", v4);
  }
  else if (-[NCNotificationStructuredSectionList _shouldHideNotificationRequest:](self, "_shouldHideNotificationRequest:", v4))
  {
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "un_logDigest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v12;
      v32 = 2114;
      v33 = v14;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying hidden notification request %{public}@", (uint8_t *)&v30, 0x16u);

    }
    -[NCNotificationStructuredSectionList _modifyHiddenNotificationRequest:](self, "_modifyHiddenNotificationRequest:", v4);
  }
  else if (-[NCNotificationStructuredSectionList _shouldPreloadNotificationRequest:](self, "_shouldPreloadNotificationRequest:", v4))
  {
    v15 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v17;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying preloaded notification request %{public}@", (uint8_t *)&v30, 0x16u);

    }
    -[NCNotificationStructuredSectionList _modifyPreloadedNotificationRequest:](self, "_modifyPreloadedNotificationRequest:", v4);
  }
  else
  {
    v20 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:](self, "_existingIndexOfGroupForNotificationRequest:", v4);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v20;
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "notificationIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "un_logDigest");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138544130;
        v31 = v26;
        v32 = 2114;
        v33 = v28;
        v34 = 2114;
        v35 = v29;
        v36 = 2048;
        v37 = v21;
        _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v30, 0x2Au);

      }
      objc_msgSend(v23, "modifyNotificationRequest:", v4);
      -[NCNotificationStructuredSectionList _updatePositionOfGroup:atIndex:](self, "_updatePositionOfGroup:atIndex:", v23, v21);
      if (-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"))
      {
        -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
      }

    }
  }

}

- (void)reloadNotificationRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:](self, "_existingIndexOfGroupForNotificationRequest:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2048;
      v22 = v6;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@ in existing group %{public}@ at index %ld", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(v8, "reloadNotificationRequest:", v4);

  }
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "allNotificationRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_removeNotificationGroupList:", v5);
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCacheForNotificationRequest:", v5);

  objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", v5);
}

void __97__NCNotificationStructuredSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", a1[4]);

  if (v4)
    objc_msgSend(v5, "updateNotificationSectionSettings:previousSectionSettings:", a1[5], a1[6]);

}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__NCNotificationStructuredSectionList_updateNotificationSystemSettings_previousSystemSettings___block_invoke;
  v11[3] = &unk_1E8D1C678;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __95__NCNotificationStructuredSectionList_updateNotificationSystemSettings_previousSystemSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNotificationSystemSettings:previousSystemSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didExitAlwaysOn
{
  if (-[NCNotificationStructuredSectionList isHistorySection](self, "isHistorySection"))
    -[NCNotificationListView didExitAlwaysOn](self->_listView, "didExitAlwaysOn");
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  BOOL v9;

  if (self->_deviceAuthenticated != a3)
  {
    v3 = a3;
    self->_deviceAuthenticated = a3;
    -[NCNotificationStructuredSectionList _toggleHiddenNotificationsOnAuthenticationChange:](self, "_toggleHiddenNotificationsOnAuthenticationChange:");
    if (v3)
      -[NCNotificationStructuredSectionList _showHiddenNotificationGroupsOnDeviceAuthentication](self, "_showHiddenNotificationGroupsOnDeviceAuthentication");
    else
      -[NCNotificationStructuredSectionList _hideNotificationGroupsOnDeviceReauthentication](self, "_hideNotificationGroupsOnDeviceReauthentication");
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__NCNotificationStructuredSectionList_setDeviceAuthenticated___block_invoke;
    v8[3] = &__block_descriptor_33_e40_v32__0__NCNotificationGroupList_8Q16_B24l;
    v9 = v3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationListComponentChangedContent:", self);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

uint64_t __62__NCNotificationStructuredSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCNotificationStructuredSectionList preloadsNotificationRequests](self, "preloadsNotificationRequests"))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[NCNotificationStructuredSectionList _postPreloadedNotificationRequestsForSectionIdentifier:](self, "_postPreloadedNotificationRequestsForSectionIdentifier:", v4);
  }

}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__NCNotificationStructuredSectionList_containsNotificationRequest___block_invoke;
  v8[3] = &unk_1E8D1B790;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __67__NCNotificationStructuredSectionList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (void)setLogDescription:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  NSString *logDescription;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%@]"), v5, v9);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  logDescription = self->_logDescription;
  self->_logDescription = v7;

}

- (NSDate)comparisonDate
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "comparisonDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double x;
  double y;
  double height;
  double v14;
  CGRect v16;

  -[NCNotificationStructuredSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (objc_msgSend(v7, "count") > a4)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "listView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        x = v16.origin.x;
        y = v16.origin.y;
        height = v16.size.height;
        if (CGRectGetWidth(v16) == 0.0)
          objc_msgSend(v10, "setFrame:", x, y, a5, height);
        objc_msgSend(v10, "sizeThatFits:", a5, 0.0);
        v8 = v14;

      }
    }

  }
  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[NCNotificationStructuredSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a4)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "listView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateSubviewTranslation:", 0.0);
      objc_msgSend(v8, "setShowContentForGroupedViews:", -[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"));
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NCNotificationStructuredSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)headerViewForNotificationList:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NCNotificationListSectionHeaderView *headerView;
  NCNotificationListSectionHeaderView *v8;
  NCNotificationListSectionHeaderView *v9;
  NCNotificationListSectionHeaderView *v10;
  NCNotificationListSectionHeaderView *v11;

  -[NCNotificationStructuredSectionList title](self, "title", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = (void *)v4, v6 = -[NCNotificationStructuredSectionList count](self, "count"), v5, v6))
  {
    headerView = self->_headerView;
    if (!headerView)
    {
      v8 = -[NCNotificationStructuredSectionList _newSectionHeaderView](self, "_newSectionHeaderView");
      v9 = self->_headerView;
      self->_headerView = v8;

      self->_headerViewHeightValid = 0;
      headerView = self->_headerView;
    }
    v10 = headerView;
  }
  else
  {
    v11 = self->_headerView;
    if (v11)
    {
      self->_headerView = 0;

    }
    v10 = 0;
  }
  return v10;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;

  if (!self->_headerViewHeightValid)
  {
    -[NCNotificationStructuredSectionList headerView](self, "headerView", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NCNotificationStructuredSectionList title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList headerView](self, "headerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NCNotificationListSectionHeaderView headerHeightWithWidth:title:isShowingCollapseButton:](NCNotificationListSectionHeaderView, "headerHeightWithWidth:title:isShowingCollapseButton:", v7, objc_msgSend(v8, "showCollapseButton"), a4);
      self->_headerViewHeight = v9;

    }
    else
    {
      self->_headerViewHeight = 0.0;
    }
    self->_headerViewHeightValid = 1;
  }
  return self->_headerViewHeight;
}

- (void)recycleView:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "recycleVisibleViews");

}

- (void)handleTapToWake
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NCNotificationStructuredSectionList allNotificationRequests](self, "allNotificationRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NCNotificationListCache listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:](self->_notificationListCache, "listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), 0, 0, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contentViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleTapToWake");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationStructuredSectionList;
  if (-[NCNotificationStructuredSectionList respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EFC09198)
           && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invokeWithTarget:", v6);

    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)NCNotificationStructuredSectionList;
      -[NCNotificationStructuredSectionList forwardInvocation:](&v7, sel_forwardInvocation_, v4);
    }

  }
}

- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:containerViewProviderForExpandedContentForViewController:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[NCNotificationStructuredSectionList setGroupListPresentingLongLook:](self, "setGroupListPresentingLongLook:", v10);
  objc_initWeak(&location, self);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __146__NCNotificationStructuredSectionList_notificationListComponent_shouldFinishLongLookTransitionForNotificationRequest_trigger_withCompletionBlock___block_invoke;
  v15[3] = &unk_1E8D1C750;
  objc_copyWeak(&v17, &location);
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "notificationListComponent:shouldFinishLongLookTransitionForNotificationRequest:trigger:withCompletionBlock:", self, v11, a5, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

uint64_t __146__NCNotificationStructuredSectionList_notificationListComponent_shouldFinishLongLookTransitionForNotificationRequest_trigger_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setGroupListPresentingLongLook:", 0);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  if (a4)
    v5 = a3;
  else
    v5 = 0;
  v6 = a4;
  -[NCNotificationStructuredSectionList setGroupListPresentingLongLook:](self, "setGroupListPresentingLongLook:", v5);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListComponent:isPresentingLongLookForViewController:", self, v6);

  -[NCNotificationStructuredSectionList groupListPresentingLongLook](self, "groupListPresentingLongLook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else if (-[NCNotificationStructuredSectionList deferDynamicGroupingForPresentedLongLookOnDeviceLock](self, "deferDynamicGroupingForPresentedLongLookOnDeviceLock"))
  {
    -[NCNotificationStructuredSectionList _toggleHiddenNotificationsOnAuthenticationChange:](self, "_toggleHiddenNotificationsOnAuthenticationChange:", 0);
  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList _removeNotificationGroupList:](self, "_removeNotificationGroupList:", a3);
  -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessary](self, "_toggleDynamicGroupingIfNecessary");
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponentDidRemoveAll:", self);

}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v14;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);
    }
    else
    {
      -[NCNotificationStructuredSectionList _removeNotificationGroupList:](self, "_removeNotificationGroupList:", v9);
      -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessary](self, "_toggleDynamicGroupingIfNecessary");
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
        goto LABEL_9;
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadHeaderView");
    }

  }
LABEL_9:
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationListComponent:didRemoveNotificationRequest:", self, v6);

}

- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (!-[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown"))goto LABEL_8;
  objc_opt_class();
  v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
  v9 = v8;
  if (v9
    && (v10 = v9,
        -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "indexOfObject:", v10),
        v11,
        v10,
        v12))
  {
    v13 = 0;
  }
  else
  {
LABEL_8:
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "notificationListComponent:shouldAllowInteractionsForNotificationRequest:", self, v7);

  }
  return v13;
}

- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationListBaseComponent:didTransitionActionsForSwipeInteraction:revealed:", v12, v8, v5);

  if (!v5 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v11 = v12, (isKindOfClass & 1) == 0))
    v11 = 0;
  -[NCNotificationStructuredSectionList setGroupListWithActionsRevealed:](self, "setGroupListWithActionsRevealed:", v11);

}

- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  if (-[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown"))
  {
    v8 = 0;
  }
  else
  {
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationStructuredSectionList:requestsAuxiliaryOptionsContentProviderForNotificationRequest:isLongLook:", self, v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a4;
  v6 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13)
      v13[2]();
  }
  else
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutOffsetForViewAtIndex:", v8);
    v11 = v10;

    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationListBaseComponent:requestsScrollingToContentOffset:withCompletion:", self, v13, v11);

  }
}

- (BOOL)isViewVisibleForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  char v9;

  v4 = a3;
  -[NCNotificationStructuredSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVisibleForViewAtIndex:", v6);

  return v9;
}

- (BOOL)notificationGroupListShouldReloadNotificationCells:(id)a3
{
  return 1;
}

- (BOOL)isNotificationGroupListInCollapsedStack:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationStructuredSectionList listView](self, "listView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  return v4;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 1;
}

- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3
{
  return 0;
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  if (!-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown", a3))return 0;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGrouped");

  if (!v5)
    return 0;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "handleTapOnNotificationListBaseComponent:", self))
  {
    -[NCNotificationStructuredSectionList reloadLeadingNotificationRequestsForStackedNotificationGroupLists](self, "reloadLeadingNotificationRequestsForStackedNotificationGroupLists");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = !-[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    LOBYTE(v7) = 1;
  return !v6 || v7;
}

- (BOOL)shouldAlignContentToBottomForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = -[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  return v6 < 3 && v8;
}

- (id)collapsedSectionSummaryStringForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = -[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown");
  v8 = 0;
  if (v7 && v6 == 2)
  {
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 < 4)
    {
      v8 = 0;
    }
    else
    {
      -[NCNotificationStructuredSectionList _collapsedSectionSummaryString](self, "_collapsedSectionSummaryString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (BOOL)shouldShowSummaryFooterTextForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL result;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  result = -[NCNotificationStructuredSectionList isSectionListCurrentlyGroupedWithContentShown](self, "isSectionListCurrentlyGroupedWithContentShown");
  if (v6)
    return 0;
  return result;
}

- (BOOL)shouldShowSummaryTextAsContentForLeadingNotificationRequestForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  BOOL v10;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  v9 = -[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown");
  v10 = 0;
  if (v9 && v8)
    v10 = (v8 < 2 || v6 == 3) && (unint64_t)objc_msgSend(v4, "notificationCount") > 1;

  return v10;
}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationGroupList:(id)a3
{
  unint64_t v3;

  v3 = -[NCNotificationStructuredSectionList sectionType](self, "sectionType", a3);
  if (v3 > 0xA)
    return -1;
  else
    return qword_1CFD91798[v3];
}

- (void)sectionHeaderViewDidTransitionToClearState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:didTransitionSectionHeaderView:toClearState:", self, v4, 1);

}

- (void)sectionHeaderView:(id)a3 didReceiveClearActionForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requests clearing notifications in section with identifier %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[NCNotificationStructuredSectionList clearAll](self, "clearAll");
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationListComponentChangedContent:", self);

}

- (void)sectionHeaderViewDidReceiveClearAllAction:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requests clearing all notifications", (uint8_t *)&v8, 0xCu);

  }
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListBaseComponentRequestsClearingAll:", self);

}

- (id)containerViewForHeaderViewPreviewInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sectionHeaderViewDidBeginForceTouchInteraction:(id)a3
{
  id v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponent:didBeginUserInteractionWithViewController:", self, 0);

}

- (void)sectionHeaderViewDidPresentForceTouchView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:didPresentSectionHeaderView:inForceTouchState:", self, v4, 1);

}

- (void)sectionHeaderViewDidDismissForceTouchView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:didPresentSectionHeaderView:inForceTouchState:", self, v4, 0);

  objc_msgSend(v5, "notificationListBaseComponent:didEndUserInteractionWithViewController:", self, 0);
}

- (id)legibilitySettingsForSectionHeaderView:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibilitySettingsForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__NCNotificationStructuredSectionList_adjustForLegibilitySettingsChange___block_invoke;
  v8[3] = &unk_1E8D1C3A0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  -[NCNotificationStructuredSectionList headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustForLegibilitySettingsChange:", v7);

}

uint64_t __73__NCNotificationStructuredSectionList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForLegibilitySettingsChange:", *(_QWORD *)(a1 + 32));
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_95);

  -[NCNotificationStructuredSectionList headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustForContentSizeCategoryChange");

  self->_headerViewHeightValid = 0;
  return 1;
}

uint64_t __73__NCNotificationStructuredSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (void)_insertViewToListAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertViewAtIndex:animated:", a3, v4);

}

- (void)_removeViewFromListAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeViewAtIndex:animated:isHorizontallyDisplaced:", a3, v6, v5);

}

- (BOOL)isSectionVisible
{
  void *v3;
  BOOL v4;
  void *v5;
  double v6;

  -[NCNotificationStructuredSectionList listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRevealed") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "revealPercentage");
    v4 = v6 > 0.0;

  }
  return v4;
}

- (NSArray)orderedNotificationListComponents
{
  void *v2;
  void *v3;

  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (unint64_t)_indexOfOrderedNotificationListComponent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NCNotificationStructuredSectionList orderedNotificationListComponents](self, "orderedNotificationListComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)_configureSectionListView:(id)a3
{
  _BOOL4 v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setGrouped:", 0);
  objc_msgSend(v6, "setRevealed:", -[NCNotificationStructuredSectionList isNotificationListViewRevealed](self, "isNotificationListViewRevealed"));
  v4 = -[NCNotificationStructuredSectionList isNotificationListViewRevealed](self, "isNotificationListViewRevealed");
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  objc_msgSend(v6, "setRevealPercentage:", v5);
  objc_msgSend(v6, "setShowContentForGroupedViews:", -[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"));

}

- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NCNotificationStructuredSectionList _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "groupingSetting");

  return v4;
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  id v4;
  NCNotificationGroupList *v5;
  void *v6;
  void *v7;
  NCNotificationGroupList *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = [NCNotificationGroupList alloc];
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NCNotificationGroupList initWithSectionIdentifier:threadIdentifier:](v5, "initWithSectionIdentifier:threadIdentifier:", v6, v7);

  -[NCNotificationGroupList setDeviceAuthenticated:](v8, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
  -[NCNotificationListPresentableGroup setDelegate:](v8, "setDelegate:", self);
  -[NCNotificationStructuredSectionList notificationListCache](self, "notificationListCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup setNotificationListCache:](v8, "setNotificationListCache:", v9);

  objc_msgSend(v4, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList setNotificationSectionSettings:](v8, "setNotificationSectionSettings:", v11);

  -[NCNotificationStructuredSectionList notificationSystemSettingsForNotificationListComponent:](self, "notificationSystemSettingsForNotificationListComponent:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationGroupList setNotificationSystemSettings:](v8, "setNotificationSystemSettings:", v12);

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "notificationListComponent:isClockNotificationRequest:", self, v4);

  -[NCNotificationGroupList setClockNotificationGroup:](v8, "setClockNotificationGroup:", v14);
  -[NCNotificationStructuredSectionList _backgroundGroupNameBase](self, "_backgroundGroupNameBase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup setMaterialGroupNameBase:](v8, "setMaterialGroupNameBase:", v15);

  return v8;
}

- (id)_newSectionHeaderView
{
  NCNotificationListSectionHeaderView *v3;
  NCNotificationListSectionHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = [NCNotificationListSectionHeaderView alloc];
  v4 = -[NCNotificationListSectionHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCNotificationStructuredSectionList title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSectionHeaderView setTitle:](v4, "setTitle:", v5);

  -[NCNotificationListSectionHeaderView setDelegate:](v4, "setDelegate:", self);
  -[NCNotificationStructuredSectionList _legibilitySettings](self, "_legibilitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSectionHeaderView adjustForLegibilitySettingsChange:](v4, "adjustForLegibilitySettingsChange:", v6);

  -[NCNotificationListSectionHeaderView setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
  -[NCNotificationStructuredSectionList _backgroundGroupNameBase](self, "_backgroundGroupNameBase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSectionHeaderView setMaterialGroupNameBase:](v4, "setMaterialGroupNameBase:", v7);

  return v4;
}

- (unint64_t)existingIndexOfGroupForNotificationRequestForInsertion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NCNotificationStructuredSectionList _notificationGroupsForInsertion](self, "_notificationGroupsForInsertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:inNotificationGroupLists:](self, "_existingIndexOfGroupForNotificationRequest:inNotificationGroupLists:", v4, v5);

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "indexOfObject:", v8);

  }
  return v7;
}

- (unint64_t)_existingIndexOfGroupForNotificationRequestForRemoval:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequestForRemoval___block_invoke;
  v9[3] = &unk_1E8D1C650;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __93__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequestForRemoval___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsNotificationRequest:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:inNotificationGroupLists:](self, "_existingIndexOfGroupForNotificationRequest:inNotificationGroupLists:", v4, v5);

  return v6;
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 inNotificationGroupLists:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:](self, "_existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:", v7, v8, v9, v6);

  return v10;
}

- (unint64_t)_existingIndexOfGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inNotificationGroupLists:(id)a5
{
  return -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:](self, "_existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:", 0, a3, a4, a5);
}

- (unint64_t)_existingIndexOfGroupForNotificationRequest:(id)a3 withSectionIdentifier:(id)a4 threadIdentifier:(id)a5 inNotificationGroupLists:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NCNotificationStructuredSectionList isPerformingDynamicGrouping](self, "isPerformingDynamicGrouping"))
  {
    -[NCNotificationStructuredSectionList _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contentPreviewSetting");
    v16 = -[NCNotificationStructuredSectionList _groupingSettingForSectionIdentifier:](self, "_groupingSettingForSectionIdentifier:", v11);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke;
    v26[3] = &unk_1E8D1C798;
    v30 = v15;
    v31 = v16;
    v26[4] = self;
    v27 = v10;
    v28 = v11;
    v29 = v12;
    v17 = v10;
    v18 = v12;
    v19 = v11;
    v20 = objc_msgSend(v13, "indexOfObjectPassingTest:", v26);

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke_2;
    v22[3] = &unk_1E8D1C7C0;
    v22[4] = self;
    v23 = v11;
    v24 = v12;
    v25 = v10;
    v18 = v10;
    v19 = v12;
    v14 = v11;
    v20 = objc_msgSend(v13, "indexOfObjectPassingTest:", v22);

  }
  return v20;
}

uint64_t __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4 || v4 == 1 && (objc_msgSend(*(id *)(a1 + 32), "deviceAuthenticated") & 1) != 0 || *(_QWORD *)(a1 + 72) == 2)
  {
    v5 = objc_msgSend(v3, "isLeadingNotificationRequest:", *(_QWORD *)(a1 + 40));
LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCriticalAlert"))
  {
    v5 = objc_msgSend(v3, "containsCriticalNotificationRequest:", *(_QWORD *)(a1 + 40));
    goto LABEL_6;
  }
  objc_msgSend(v3, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(v3, "threadIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 56));

  }
  else
  {
    v6 = 0;
  }

LABEL_7:
  return v6;
}

uint64_t __147__NCNotificationStructuredSectionList__existingIndexOfGroupForNotificationRequest_withSectionIdentifier_threadIdentifier_inNotificationGroupLists___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_groupingSettingForSectionIdentifier:", v5);

  if (v6 == 2)
  {
    if (!*(_QWORD *)(a1 + 56) || (objc_msgSend(v3, "isLeadingNotificationRequest:") & 1) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (v6 == 1)
  {
    objc_msgSend(v3, "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v11 & 1) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (v6)
    goto LABEL_13;
  objc_msgSend(v3, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

    goto LABEL_13;
  }
  objc_msgSend(v3, "threadIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v9 & 1) != 0)
  {
LABEL_11:
    v12 = 1;
    goto LABEL_16;
  }
LABEL_13:
  if (objc_msgSend(*(id *)(a1 + 56), "isCriticalAlert"))
    v12 = objc_msgSend(v3, "containsCriticalNotificationRequest:", *(_QWORD *)(a1 + 56));
  else
    v12 = 0;
LABEL_16:

  return v12;
}

- (void)_updatePositionOfGroup:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[NCNotificationStructuredSectionList _insertionIndexForGroup:](self, "_insertionIndexForGroup:", v6);
  if (v7 != a4 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -[NCNotificationStructuredSectionList _indexOfOrderedNotificationListComponent:](self, "_indexOfOrderedNotificationListComponent:", v6);
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v6);

      -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v10, 0, 0);
    }
    v12 = (__PAIR128__(v9, a4) - v9) >> 64;
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 > v14)
    {
      v15 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      {
        v19 = v15;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544130;
        v24 = v20;
        v25 = 2114;
        v26 = v21;
        v27 = 2048;
        v28 = v12;
        v29 = 2048;
        v30 = objc_msgSend(v22, "count");
        _os_log_error_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_ERROR, "%{public}@ attempting to insert group %{public}@ at index %ld while total group count is %ld", (uint8_t *)&v23, 0x2Au);

      }
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "count");

    }
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v6, v12);

    -[NCNotificationStructuredSectionList _insertViewToListAtIndex:animated:](self, "_insertViewToListAtIndex:animated:", -[NCNotificationStructuredSectionList _indexOfOrderedNotificationListComponent:](self, "_indexOfOrderedNotificationListComponent:", v6), 1);
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

  }
}

- (unint64_t)_insertionIndexForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v6, "count"), 1280, &__block_literal_global_97);

  return v7;
}

uint64_t __63__NCNotificationStructuredSectionList__insertionIndexForGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_removeNotificationGroupList:(id)a3
{
  -[NCNotificationStructuredSectionList _removeNotificationGroupList:animated:](self, "_removeNotificationGroupList:animated:", a3, 1);
}

- (void)_removeNotificationGroupList:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v16);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v16, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recycleVisibleViews");

    v9 = -[NCNotificationStructuredSectionList _indexOfOrderedNotificationListComponent:](self, "_indexOfOrderedNotificationListComponent:", v16);
    -[NCNotificationStructuredSectionList groupListWithActionsRevealed](self, "groupListWithActionsRevealed");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v16)
      v11 = objc_msgSend(v16, "isClearingAllNotificationRequestsForCellHorizontalSwipe");
    else
      v11 = 0;

    -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v9, v4, v11);
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", v7);

    -[NCNotificationStructuredSectionList groupListsToSort](self, "groupListsToSort");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v16);

    if (!-[NCNotificationStructuredSectionList count](self, "count"))
    {
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadHeaderView");

    }
    objc_msgSend(v16, "listView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDataSource:", 0);

  }
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListComponent:sectionSettingsForSectionIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_legibilitySettings
{
  void *v3;
  void *v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettingsForNotificationListBaseComponent:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_backgroundGroupNameBase
{
  void *v3;
  void *v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldClearPersistentNotificationRequests
{
  return -[NCNotificationStructuredSectionList sectionType](self, "sectionType") != 2;
}

- (id)_collapsedSectionSummaryString
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, unint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __69__NCNotificationStructuredSectionList__collapsedSectionSummaryString__block_invoke;
  v18 = &unk_1E8D1B718;
  v20 = &v21;
  v5 = v3;
  v19 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v15);

  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_STACK_SUMMARY"), &stru_1E8D21F60, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v9, v6, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __69__NCNotificationStructuredSectionList__collapsedSectionSummaryString__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  if (a3 >= 2)
  {
    v4 = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v4, "notificationCount");
    objc_msgSend(v4, "leadingNotificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultHeader");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
    if (v9)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9);
      v7 = (void *)v9;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        v7 = (void *)v9;
      }
    }

  }
}

- (BOOL)isSectionListCurrentlyGroupedWithContentShown
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[NCNotificationStructuredSectionList isSectionListViewGroupedWithContentShown](self, "isSectionListViewGroupedWithContentShown"))return 0;
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isGrouped"))
  {
    -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_areNotificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "notificationStructuredSectionList:areNotificationsLoadedForSectionIdentifier:", self, v4);

  return (char)self;
}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isCriticalAlert") && (objc_msgSend(v6, "criticalAlertsEnabled") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NCNotificationStructuredSectionList _shouldHideForSectionIdentifier:](self, "_shouldHideForSectionIdentifier:", v8);

  }
  return v7;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  void *v4;

  objc_msgSend(a3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NCNotificationStructuredSectionList _shouldHideForSectionIdentifier:](self, "_shouldHideForSectionIdentifier:", v4);

  return (char)self;
}

- (BOOL)_shouldHideForSectionIdentifier:(id)a3
{
  void *v4;
  BOOL v5;

  -[NCNotificationStructuredSectionList _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!-[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated")
      && !objc_msgSend(v4, "showsInLockScreen")
      || !objc_msgSend(v4, "notificationsEnabled"))
    {
      v5 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "showsInNotificationCenter") & 1) == 0)
    {
      v5 = -[NCNotificationStructuredSectionList isHistorySection](self, "isHistorySection");
      goto LABEL_9;
    }
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (void)_addHiddenNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __71__NCNotificationStructuredSectionList__addHiddenNotificationGroupList___block_invoke;
  v12 = &unk_1E8D1C828;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)v16[5];
  if (v7)
  {
    objc_msgSend(v6, "allNotificationRequests", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeNotificationRequests:", v8);
  }
  else
  {
    -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v6);
  }

  _Block_object_dispose(&v15, 8);
}

void __71__NCNotificationStructuredSectionList__addHiddenNotificationGroupList___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "matchesGroup:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_hideNotificationGroupsOnDeviceReauthentication
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__NCNotificationStructuredSectionList__hideNotificationGroupsOnDeviceReauthentication__block_invoke;
  v2[3] = &unk_1E8D1BF50;
  v2[4] = self;
  -[NCNotificationStructuredSectionList _hideNotificationGroupsPassingTest:](self, "_hideNotificationGroupsPassingTest:", v2);
}

uint64_t __86__NCNotificationStructuredSectionList__hideNotificationGroupsOnDeviceReauthentication__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldHideNotificationGroupList:", a2);
}

- (void)_showHiddenNotificationGroupsOnDeviceAuthentication
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__NCNotificationStructuredSectionList__showHiddenNotificationGroupsOnDeviceAuthentication__block_invoke;
  v3[3] = &unk_1E8D1BF50;
  v3[4] = self;
  -[NCNotificationStructuredSectionList _showHiddenNotificationGroupsPassingTest:](self, "_showHiddenNotificationGroupsPassingTest:", v3);
  -[NCNotificationStructuredSectionList _showHiddenNotificationRequestsPassingTest:](self, "_showHiddenNotificationRequestsPassingTest:", 0);
}

uint64_t __90__NCNotificationStructuredSectionList__showHiddenNotificationGroupsOnDeviceAuthentication__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sectionSettingsForSectionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "showsInNotificationCenter");
  return v5;
}

- (void)_hideNotificationGroupsPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke;
  v13[3] = &unk_1E8D1C850;
  v14 = v5;
  v15 = v4;
  v8 = v5;
  v11 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke_2;
  v12[3] = &unk_1E8D1C878;
  v12[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

}

void __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v6, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v6;
  }

}

void __74__NCNotificationStructuredSectionList__hideNotificationGroupsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setGrouped:animated:", 1, 0);
  objc_msgSend(v3, "criticalAlerts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeNotificationGroupList:", v3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "removeNotificationRequest:", v10, (_QWORD)v11);
        objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_showHiddenNotificationGroupsPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke;
  v11[3] = &unk_1E8D1C8A0;
  v12 = v5;
  v13 = v4;
  v11[4] = self;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke_106;
  v10[3] = &unk_1E8D1C3A0;
  v10[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

void __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  void *v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
  {
    v17 = v3;
    objc_msgSend(v3, "allNotificationRequests");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      v8 = (os_log_t *)MEMORY[0x1E0DC5F90];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (v10)
          {
            v11 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
            {
              v12 = *(void **)(a1 + 32);
              v13 = v11;
              objc_msgSend(v12, "logDescription");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "notificationIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "un_logDigest");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v24 = v14;
              v25 = 2114;
              v26 = v16;
              _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting hidden notification %{public}@", buf, 0x16u);

            }
            objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", v10);
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v6);
    }
    v3 = v17;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

  }
}

void __80__NCNotificationStructuredSectionList__showHiddenNotificationGroupsPassingTest___block_invoke_106(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hiddenNotificationGroups");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

- (void)_showHiddenNotificationRequestsPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke;
  v11[3] = &unk_1E8D1C8C8;
  v12 = v5;
  v13 = v4;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke_2;
  v10[3] = &unk_1E8D1C8F0;
  v10[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

void __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v6, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v6;
  }

}

void __82__NCNotificationStructuredSectionList__showHiddenNotificationRequestsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "insertNotificationRequest:", v4);
  objc_msgSend(*(id *)(a1 + 32), "hiddenNotificationRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_removeHiddenNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke;
  v25[3] = &unk_1E8D1C918;
  v7 = v4;
  v26 = v7;
  v27 = &v28;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);

  if (v29[5])
  {
    -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v29[5]);

  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v14 = 3221225472;
    v15 = __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke_2;
    v16 = &unk_1E8D1C828;
    v10 = v7;
    v17 = v10;
    v18 = &v19;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v13);

    v11 = (void *)v20[5];
    if (v11)
    {
      objc_msgSend(v11, "removeNotificationRequest:", v10, v13, v14, v15, v16);
      if (!objc_msgSend((id)v20[5], "count"))
      {
        -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v20[5]);

      }
    }

    _Block_object_dispose(&v19, 8);
  }

  _Block_object_dispose(&v28, 8);
}

void __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "matchesRequest:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __72__NCNotificationStructuredSectionList__removeHiddenNotificationRequest___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isGroupForNotificationRequest:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_modifyHiddenNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke;
  v13[3] = &unk_1E8D1C918;
  v7 = v4;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  if (v17[5])
  {
    -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v17[5]);

    -[NCNotificationStructuredSectionList hiddenNotificationRequests](self, "hiddenNotificationRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);
  }
  else
  {
    -[NCNotificationStructuredSectionList hiddenNotificationGroups](self, "hiddenNotificationGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke_2;
    v11[3] = &unk_1E8D1C878;
    v12 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    v9 = v12;
  }

  _Block_object_dispose(&v16, 8);
}

void __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "matchesRequest:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __72__NCNotificationStructuredSectionList__modifyHiddenNotificationRequest___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isGroupForNotificationRequest:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v5, "modifyNotificationRequest:", *(_QWORD *)(a1 + 32));
    *a3 = 1;
  }

}

- (BOOL)_shouldFilterNotificationRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "notificationStructuredSectionList:shouldFilterNotificationRequest:", self, v4);

  return (char)self;
}

- (void)_filterNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__NCNotificationStructuredSectionList__filterNotificationRequest___block_invoke;
    v18[3] = &unk_1E8D1C940;
    v19 = v4;
    objc_msgSend(v7, "objectsPassingTest:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v7, v5);

  }
  objc_msgSend(v7, "addObject:", v4);

}

uint64_t __66__NCNotificationStructuredSectionList__filterNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_removeFilteredNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__NCNotificationStructuredSectionList__removeFilteredNotificationRequest___block_invoke;
    v17[3] = &unk_1E8D1C940;
    v18 = v4;
    objc_msgSend(v7, "objectsPassingTest:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v10);
    }

  }
}

uint64_t __74__NCNotificationStructuredSectionList__removeFilteredNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_filterNotificationRequestsForSectionIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  NCNotificationStructuredSectionList *v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = -[NCNotificationStructuredSectionList count](self, "count");
  -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v4);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke;
  v18[3] = &unk_1E8D1C990;
  v19 = v4;
  v20 = self;
  v21 = v7;
  v16 = v9;
  v22 = v16;
  v12 = v7;
  v13 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);

  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_3;
  v17[3] = &unk_1E8D1C878;
  v17[4] = self;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);
  v14 = -[NCNotificationStructuredSectionList count](self, "count");
  if (v5 && !v14)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadHeaderView");

  }
}

void __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v9 = a2;
  objc_msgSend(v9, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v5 = v9;
  if (v4)
  {
    objc_msgSend(v9, "allNotificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_2;
    v10[3] = &unk_1E8D1C968;
    v10[4] = *(_QWORD *)(a1 + 40);
    v8 = v9;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    if (!objc_msgSend(v8, "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

    v5 = v9;
  }

}

void __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(a1[4], "_shouldFilterNotificationRequest:"))
  {
    objc_msgSend(a1[5], "removeNotificationRequest:", v3);
    objc_msgSend(a1[6], "addObject:", v3);
  }

}

uint64_t __87__NCNotificationStructuredSectionList__filterNotificationRequestsForSectionIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationGroupList:", a2);
}

- (void)_unfilterNotificationRequestsForSectionIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  v4 = -[NCNotificationStructuredSectionList count](self, "count");
  -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__NCNotificationStructuredSectionList__unfilterNotificationRequestsForSectionIdentifier___block_invoke;
    v11[3] = &unk_1E8D1C8F0;
    v11[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  }
  -[NCNotificationStructuredSectionList filteredNotificationRequests](self, "filteredNotificationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v10);

  v8 = -[NCNotificationStructuredSectionList count](self, "count");
  if (!v4 && v8)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadHeaderView");

  }
}

uint64_t __89__NCNotificationStructuredSectionList__unfilterNotificationRequestsForSectionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

- (unint64_t)dynamicGroupingThreshold
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");
  +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    v6 = objc_msgSend(v4, "dynamicGroupingThresholdPad");
  else
    v6 = objc_msgSend(v4, "dynamicGroupingThreshold");
  v7 = v6;

  return v7;
}

- (BOOL)isPerformingDynamicGrouping
{
  _BOOL4 v3;

  v3 = -[NCNotificationStructuredSectionList supportsDynamicGrouping](self, "supportsDynamicGrouping");
  if (v3)
    LOBYTE(v3) = -[NCNotificationStructuredSectionList isDynamicGroupingActive](self, "isDynamicGroupingActive");
  return v3;
}

- (void)_toggleDynamicGroupingIfNecessary
{
  -[NCNotificationStructuredSectionList _toggleDynamicGroupingIfNecessaryForced:](self, "_toggleDynamicGroupingIfNecessaryForced:", 0);
}

- (void)_toggleDynamicGroupingIfNecessaryForced:(BOOL)a3
{
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationStructuredSectionList supportsDynamicGrouping](self, "supportsDynamicGrouping"))
  {
    if (a3
      || -[NCNotificationStructuredSectionList isDynamicGroupingActive](self, "isDynamicGroupingActive")
      && (v5 = -[NCNotificationStructuredSectionList notificationCount](self, "notificationCount"),
          v5 > -[NCNotificationStructuredSectionList dynamicGroupingThreshold](self, "dynamicGroupingThreshold")))
    {
      v6 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v8;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ turning dynamic grouping OFF", buf, 0xCu);

      }
      self->_dynamicGroupingActive = 0;
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke;
      v20[3] = &unk_1E8D1B5F8;
      v20[4] = self;
      v21 = v10;
      v22 = v9;
      v13 = v9;
      v14 = v10;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_2;
      v19[3] = &unk_1E8D1C878;
      v19[4] = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_3;
      v18[3] = &unk_1E8D1C8F0;
      v18[4] = self;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);

    }
    else if (!-[NCNotificationStructuredSectionList isDynamicGroupingActive](self, "isDynamicGroupingActive")
           && !-[NCNotificationStructuredSectionList count](self, "count"))
    {
      v15 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v17;
        _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ turning dynamic grouping ON", buf, 0xCu);

      }
      self->_dynamicGroupingActive = 1;
    }
  }
}

void __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a1[4];
  objc_msgSend(v12, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "notificationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "_existingIndexOfGroupWithSectionIdentifier:threadIdentifier:inNotificationGroupLists:", v6, v7, v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != a3)
  {
    objc_msgSend(v12, "allNotificationRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "addObjectsFromArray:", v11);
    objc_msgSend(a1[6], "addObject:", v12);

  }
}

uint64_t __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationGroupList:", a2);
}

uint64_t __79__NCNotificationStructuredSectionList__toggleDynamicGroupingIfNecessaryForced___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationStructuredSectionList isPerformingDynamicGrouping](self, "isPerformingDynamicGrouping")
    && -[NCNotificationStructuredSectionList count](self, "count"))
  {
    if (v3
      || (-[NCNotificationStructuredSectionList groupListPresentingLongLook](self, "groupListPresentingLongLook"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      v9 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = CFSTR("collapsing");
        if (v3)
          v13 = CFSTR("expanding");
        *(_DWORD *)buf = 138543618;
        v32 = v11;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ notification groups for dynamic grouping on authentication change", buf, 0x16u);

      }
      self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = 0;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __88__NCNotificationStructuredSectionList__toggleHiddenNotificationsOnAuthenticationChange___block_invoke;
      v27[3] = &unk_1E8D1C9B8;
      v27[4] = self;
      v29 = v3;
      v17 = v14;
      v28 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v27);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            -[NCNotificationStructuredSectionList insertNotificationRequest:](self, "insertNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), (_QWORD)v23);
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v20);
      }

    }
    else
    {
      v6 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = (uint64_t)v8;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring dynamic grouping on authentication change while presenting long look", buf, 0xCu);

      }
      self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = 1;
    }
  }
}

void __88__NCNotificationStructuredSectionList__toggleHiddenNotificationsOnAuthenticationChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sectionSettingsForSectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "contentPreviewSetting") == 1)
  {
    objc_msgSend(v3, "allNotificationRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (*(_BYTE *)(a1 + 48))
            objc_msgSend(v3, "removeNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v15, (_QWORD)v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    if (!*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_removeNotificationGroupList:", v3);

  }
}

- (BOOL)_shouldPreloadNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;

  v4 = a3;
  if (-[NCNotificationStructuredSectionList preloadsNotificationRequests](self, "preloadsNotificationRequests"))
  {
    objc_msgSend(v4, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[NCNotificationStructuredSectionList _areNotificationsLoadedForSectionIdentifier:](self, "_areNotificationsLoadedForSectionIdentifier:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_groupListForPreloadedNotificationRequest:(id)a3 createNewIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredSectionList preloadedNotificationGroups](self, "preloadedNotificationGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[NCNotificationStructuredSectionList _existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:](self, "_existingIndexOfGroupForNotificationRequest:withSectionIdentifier:threadIdentifier:inNotificationGroupLists:", v6, v7, v8, v10);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_11;
      goto LABEL_8;
    }
  }
  else
  {
    if (!v4)
    {
      v10 = 0;
      v12 = 0;
      goto LABEL_11;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NCNotificationStructuredSectionList preloadedNotificationGroups](self, "preloadedNotificationGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v10, v7);

  }
  v12 = 0;
LABEL_8:
  if (v4)
  {
    v12 = -[NCNotificationStructuredSectionList _newGroupListForNotificationRequest:](self, "_newGroupListForNotificationRequest:", v6);
    objc_msgSend(v10, "addObject:", v12);
  }
LABEL_11:

  return v12;
}

- (void)_insertPreloadedNotificationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList _groupListForPreloadedNotificationRequest:createNewIfNecessary:](self, "_groupListForPreloadedNotificationRequest:createNewIfNecessary:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNotificationRequest:", v4);

}

- (void)_modifyPreloadedNotificationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredSectionList _groupListForPreloadedNotificationRequest:createNewIfNecessary:](self, "_groupListForPreloadedNotificationRequest:createNewIfNecessary:", v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modifyNotificationRequest:", v4);

}

- (void)_removePreloadedNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NCNotificationStructuredSectionList _groupListForPreloadedNotificationRequest:createNewIfNecessary:](self, "_groupListForPreloadedNotificationRequest:createNewIfNecessary:", v8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNotificationRequest:", v8);
  if (!objc_msgSend(v4, "count"))
  {
    -[NCNotificationStructuredSectionList preloadedNotificationGroups](self, "preloadedNotificationGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", v4);
  }

}

- (void)_postPreloadedNotificationRequestsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationStructuredSectionList preloadedNotificationGroups](self, "preloadedNotificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v10;
      v34 = 2048;
      v35 = objc_msgSend(v6, "count");
      v36 = 2114;
      v37 = v4;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting preloaded notification requests [group count:%lu] for section %{public}@", buf, 0x20u);

    }
    v25 = v6;
    v26 = v4;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v16, "count", v25))
          {
            objc_msgSend(v16, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
            v17 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "logDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = v19;
              v34 = 2114;
              v35 = (uint64_t)v20;
              _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting preload notification group %{public}@", buf, 0x16u);

            }
            v21 = -[NCNotificationStructuredSectionList count](self, "count");
            -[NCNotificationStructuredSectionList _updatePositionOfGroup:atIndex:](self, "_updatePositionOfGroup:atIndex:", v16, 0x7FFFFFFFFFFFFFFFLL);
            v22 = -[NCNotificationStructuredSectionList count](self, "count");
            if (!v21 && v22)
            {
              -[NCNotificationStructuredSectionList listView](self, "listView");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "reloadHeaderView");

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    -[NCNotificationStructuredSectionList preloadedNotificationGroups](self, "preloadedNotificationGroups");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v26;
    objc_msgSend(v24, "removeObjectForKey:", v26);

    v6 = v25;
  }

}

- (BOOL)isShowingSummarizedStackForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationStructuredSectionList_isShowingSummarizedStackForNotificationRequest___block_invoke;
  v8[3] = &unk_1E8D1B790;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __86__NCNotificationStructuredSectionList_isShowingSummarizedStackForNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isLeadingNotificationRequest:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v6, "summarizedNotificationCountForLeadingRequest"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isShowingSummaryForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__NCNotificationStructuredSectionList_isShowingSummaryForNotificationRequest___block_invoke;
  v8[3] = &unk_1E8D1B790;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __78__NCNotificationStructuredSectionList_isShowingSummaryForNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isShowingSummaryForRequest:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (NSString)logDescription
{
  return self->_logDescription;
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)supportsDynamicGrouping
{
  return self->_supportsDynamicGrouping;
}

- (void)setSupportsDynamicGrouping:(BOOL)a3
{
  self->_supportsDynamicGrouping = a3;
}

- (BOOL)isHistorySection
{
  return self->_historySection;
}

- (void)setHistorySection:(BOOL)a3
{
  self->_historySection = a3;
}

- (BOOL)isNotificationListViewRevealed
{
  return self->_notificationListViewRevealed;
}

- (void)setNotificationListViewRevealed:(BOOL)a3
{
  self->_notificationListViewRevealed = a3;
}

- (BOOL)preloadsNotificationRequests
{
  return self->_preloadsNotificationRequests;
}

- (void)setPreloadsNotificationRequests:(BOOL)a3
{
  self->_preloadsNotificationRequests = a3;
}

- (NSString)sectionListDestination
{
  return self->_sectionListDestination;
}

- (void)setSectionListDestination:(id)a3
{
  objc_storeStrong((id *)&self->_sectionListDestination, a3);
}

- (BOOL)isSectionListViewGroupedWithContentShown
{
  return self->_sectionListViewGroupedWithContentShown;
}

- (NSMutableSet)hiddenNotificationGroups
{
  return self->_hiddenNotificationGroups;
}

- (void)setHiddenNotificationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenNotificationGroups, a3);
}

- (NSMutableSet)hiddenNotificationRequests
{
  return self->_hiddenNotificationRequests;
}

- (void)setHiddenNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenNotificationRequests, a3);
}

- (NSMutableDictionary)filteredNotificationRequests
{
  return self->_filteredNotificationRequests;
}

- (void)setFilteredNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_filteredNotificationRequests, a3);
}

- (NSMutableDictionary)preloadedNotificationGroups
{
  return self->_preloadedNotificationGroups;
}

- (void)setPreloadedNotificationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedNotificationGroups, a3);
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (BOOL)isHeaderViewHeightValid
{
  return self->_headerViewHeightValid;
}

- (void)setHeaderViewHeightValid:(BOOL)a3
{
  self->_headerViewHeightValid = a3;
}

- (void)setDynamicGroupingThreshold:(unint64_t)a3
{
  self->_dynamicGroupingThreshold = a3;
}

- (void)setPerformingDynamicGrouping:(BOOL)a3
{
  self->_performingDynamicGrouping = a3;
}

- (BOOL)isDynamicGroupingActive
{
  return self->_dynamicGroupingActive;
}

- (void)setDynamicGroupingActive:(BOOL)a3
{
  self->_dynamicGroupingActive = a3;
}

- (NCNotificationListComponent)groupListPresentingLongLook
{
  return self->_groupListPresentingLongLook;
}

- (void)setGroupListPresentingLongLook:(id)a3
{
  objc_storeStrong((id *)&self->_groupListPresentingLongLook, a3);
}

- (NCNotificationListBaseComponent)groupListWithActionsRevealed
{
  return self->_groupListWithActionsRevealed;
}

- (void)setGroupListWithActionsRevealed:(id)a3
{
  objc_storeStrong((id *)&self->_groupListWithActionsRevealed, a3);
}

- (BOOL)deferDynamicGroupingForPresentedLongLookOnDeviceLock
{
  return self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock;
}

- (void)setDeferDynamicGroupingForPresentedLongLookOnDeviceLock:(BOOL)a3
{
  self->_deferDynamicGroupingForPresentedLongLookOnDeviceLock = a3;
}

- (NCNotificationListSectionHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setNotificationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_notificationGroups, a3);
}

- (NSMutableSet)groupListsToSort
{
  return self->_groupListsToSort;
}

- (void)setGroupListsToSort:(id)a3
{
  objc_storeStrong((id *)&self->_groupListsToSort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupListsToSort, 0);
  objc_storeStrong((id *)&self->_notificationGroups, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_groupListWithActionsRevealed, 0);
  objc_storeStrong((id *)&self->_groupListPresentingLongLook, 0);
  objc_storeStrong((id *)&self->_preloadedNotificationGroups, 0);
  objc_storeStrong((id *)&self->_filteredNotificationRequests, 0);
  objc_storeStrong((id *)&self->_hiddenNotificationRequests, 0);
  objc_storeStrong((id *)&self->_hiddenNotificationGroups, 0);
  objc_storeStrong((id *)&self->_sectionListDestination, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

void __89__NCNotificationStructuredSectionList_mergeNotificationGroups_reorderGroupNotifications___block_invoke_3_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "logDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "logDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 32), "sectionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isRevealed");
  objc_msgSend(a3, "listView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "revealPercentage");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1CFC3D000, v12, v13, "%{public}@ merged thread '%{public}@' in '%{public}@' is not reveal correctly; isRevealed: %{public}d; revealPercentage: %{public}f",
    v14,
    v15,
    v16,
    v17,
    v18);

  OUTLINED_FUNCTION_1_0();
}

- (void)insertNotificationRequest:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  v5 = a1;
  objc_msgSend(a2, "logDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "logDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NCNotificationListSectionTypeString(objc_msgSend(a2, "sectionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "listView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isRevealed");
  objc_msgSend(a3, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "revealPercentage");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1CFC3D000, v11, v12, "%{public}@ thread '%{public}@' in '%{public}@' is not reveal correctly; isRevealed: %{public}d; revealPercentage: %{public}f",
    v13,
    v14,
    v15,
    v16,
    v17);

  OUTLINED_FUNCTION_1_0();
}

@end
