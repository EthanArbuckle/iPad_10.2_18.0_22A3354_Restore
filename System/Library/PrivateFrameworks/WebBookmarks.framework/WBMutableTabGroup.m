@implementation WBMutableTabGroup

uint64_t __48__WBMutableTabGroup__fixLastSelectedTabIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

- (void)_fixLastSelectedTabIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[NSArray safari_setByApplyingBlock:](self->super._tabs, "safari_setByApplyingBlock:", &__block_literal_global_13);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", self->super._lastSelectedTabUUID) & 1) == 0)
  {
    -[NSArray lastObject](self->super._tabs, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBMutableTabGroup setLastSelectedTabUUID:](self, "setLastSelectedTabUUID:", v4);

  }
}

- (void)setLastSelectedTabUUID:(id)a3
{
  NSString *v4;
  NSString *lastSelectedTabUUID;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._lastSelectedTabUUID) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    lastSelectedTabUUID = self->super._lastSelectedTabUUID;
    self->super._lastSelectedTabUUID = v4;

    -[WBMutableTabGroup updateLastSelectedTab](self, "updateLastSelectedTab");
  }

}

- (void)updateLastSelectedTab
{
  id v3;

  if (self->super._lastSelectedTabUUID)
  {
    -[WBTabGroup tabWithUUID:](self, "tabWithUUID:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setLastSelectedChildID:](self->super._bookmark, "setLastSelectedChildID:", objc_msgSend(v3, "identifier"));

  }
  else
  {
    -[WebBookmark setLastSelectedChildID:](self->super._bookmark, "setLastSelectedChildID:", 0x7FFFFFFFLL);
  }
}

- (void)setTabs:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  WBMutableTabGroup *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->super._tabs) & 1) == 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__WBMutableTabGroup_setTabs___block_invoke;
    v5[3] = &unk_24CB31C30;
    v6 = v4;
    v7 = self;
    -[WBMutableTabGroup _performWithMutableTabs:](self, "_performWithMutableTabs:", v5);

  }
}

- (void)_performWithMutableTabs:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *cachedImmutableTabs;

  (*((void (**)(id, NSArray *))a3 + 2))(a3, self->super._tabs);
  if (self->super._cachedImmutableTabs)
  {
    -[NSArray differenceFromArray:](self->super._tabs, "differenceFromArray:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "differenceByTransformingChangesWithBlock:", &__block_literal_global_8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray arrayByApplyingDifference:](self->super._cachedImmutableTabs, "arrayByApplyingDifference:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedImmutableTabs = self->super._cachedImmutableTabs;
    self->super._cachedImmutableTabs = v6;

  }
  -[WBTabGroup _tabsDidChange](self, "_tabsDidChange");
}

id __29__WBMutableTabGroup_setTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __29__WBMutableTabGroup_setTabs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "differenceFromArray:withOptions:", a2, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "insertions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v10, "didInsertIntoTabGroup:", *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v10, "setMoved:", 1);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "removals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_fixLastSelectedTabIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObjectsFromArray:", v12);
  objc_msgSend(v12, "makeObjectsPerformSelector:", sel_markClean);
  v13 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 8);
  *(_QWORD *)(v14 + 8) = v13;

}

- (WBMutableTabGroup)initWithBookmark:(id)a3 tabs:(id)a4 lastSelectedTabUUID:(id)a5 kind:(int64_t)a6
{
  id v10;
  WBMutableTabGroup *v11;
  uint64_t v12;
  NSArray *tabs;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WBMutableTabGroup *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = -[WBTabGroup initWithBookmark:lastSelectedTabUUID:kind:](self, "initWithBookmark:lastSelectedTabUUID:kind:", a3, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
    tabs = v11->super._tabs;
    v11->super._tabs = (NSArray *)v12;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v11->super._tabs;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "_setPropertiesFromTabGroup:", v11, (_QWORD)v21);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    -[WBTabGroup _tabsDidChange](v11, "_tabsDidChange");
    v19 = v11;
  }

  return v11;
}

- (NSString)deviceUUIDString
{
  return self->_deviceUUIDString;
}

- (void)setDisplayTitleProvider:(id)a3
{
  void *v4;
  id displayTitleProvider;

  v4 = (void *)objc_msgSend(a3, "copy");
  displayTitleProvider = self->super._displayTitleProvider;
  self->super._displayTitleProvider = v4;

}

- (NSArray)deletedTabs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->super._deletedTabs, "copy");
}

- (void)clearDeletedTabs
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "Clearing deleted tabs", v4, 2u);
  }
  -[NSMutableArray removeAllObjects](self->super._deletedTabs, "removeAllObjects");
}

+ (id)localTabGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localTabGroupWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localTabGroupWithUUID:(id)a3
{
  id v3;
  id v4;
  WBMutableTabGroup *v5;

  v3 = a3;
  v4 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0x7FFFFFFFLL, 1);
  objc_msgSend(v4, "setTitle:", CFSTR("Local"));
  objc_msgSend(v4, "_setUUID:", v3);

  v5 = -[WBTabGroup initWithBookmark:]([WBMutableTabGroup alloc], "initWithBookmark:", v4);
  -[WBMutableTabGroup setHidden:](v5, "setHidden:", 1);
  -[WBMutableTabGroup setSyncable:](v5, "setSyncable:", 0);
  -[WBMutableTabGroup setKind:](v5, "setKind:", 0);

  return v5;
}

+ (id)privateTabGroup
{
  id v2;
  WBMutableTabGroup *v3;

  v2 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0x7FFFFFFFLL, 1);
  objc_msgSend(v2, "setTitle:", CFSTR("Private"));
  v3 = -[WBTabGroup initWithBookmark:]([WBMutableTabGroup alloc], "initWithBookmark:", v2);
  -[WBMutableTabGroup setHidden:](v3, "setHidden:", 1);
  -[WBMutableTabGroup setSyncable:](v3, "setSyncable:", 0);
  -[WBMutableTabGroup setKind:](v3, "setKind:", 1);

  return v3;
}

+ (id)unnamedTabGroupWithUUID:(id)a3 profileIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:]([WebBookmark alloc], "initFolderWithParentID:deviceIdentifier:collectionType:", 0, v8, 1);

  objc_msgSend(v11, "setTitle:", CFSTR("Unnamed"));
  objc_msgSend(v11, "_setUUID:", v10);

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:", v11);
  objc_msgSend(v12, "setKind:", 3);
  objc_msgSend(v12, "setSyncable:", 1);
  v13 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v12, "setProfileIdentifier:", v13);
  return v12;
}

+ (id)unnamedTabGroupWithDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceIdentifier:", v4);

  objc_msgSend(v5, "setKind:", 3);
  return v5;
}

- (WBMutableTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4 profileIdentifier:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WBMutableTabGroup *v14;
  WBMutableTabGroup *v15;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1880];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBTabGroup initWithTitle:uuid:deviceIdentifier:](self, "initWithTitle:uuid:deviceIdentifier:", v11, v13, v10);

  if (v14)
  {
    -[WBMutableTabGroup setProfileIdentifier:](v14, "setProfileIdentifier:", v8);
    v15 = v14;
  }

  return v14;
}

- (void)setIdentifier:(int)a3
{
  -[WebBookmark _setID:](self->super._bookmark, "_setID:", *(_QWORD *)&a3);
}

- (void)setSyncable:(BOOL)a3
{
  -[WebBookmark _setSyncable:](self->super._bookmark, "_setSyncable:", a3);
}

- (void)setKind:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;

  if (self->super._kind != a3)
  {
    self->super._kind = a3;
    v5 = -[WBTabGroup isLocal](self, "isLocal") || -[WBTabGroup isPrivateBrowsing](self, "isPrivateBrowsing");
    -[WBMutableTabGroup setHidden:](self, "setHidden:", v5);
    if (a3 == 3)
      v6 = MEMORY[0x24BDBD1C8];
    else
      v6 = 0;
    -[WebBookmark setExtraAttributesValue:forKey:](self->super._bookmark, "setExtraAttributesValue:forKey:", v6, CFSTR("IsUnnamed"));
  }
}

- (void)setTitle:(id)a3
{
  -[WebBookmark setTitle:](self->super._bookmark, "setTitle:", a3);
}

- (void)setDeletedTabs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deletedTabs;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->super._deletedTabs) & 1) == 0)
  {
    v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    deletedTabs = self->super._deletedTabs;
    self->super._deletedTabs = v4;

  }
}

- (void)setProfileIdentifier:(id)a3
{
  NSString *v4;
  NSString *profileIdentifier;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    profileIdentifier = self->super._profileIdentifier;
    self->super._profileIdentifier = v4;

  }
}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[WBTabGroup isHidden](self, "isHidden") != a3)
  {
    -[WebBookmark extraAttributes](self->super._bookmark, "extraAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WebBookmark extraAttributes](self->super._bookmark, "extraAttributes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.bookmarks.OmitFromUI"));
    -[WebBookmark setExtraAttributes:](self->super._bookmark, "setExtraAttributes:", v6);

  }
}

- (void)markBackgroundImageAsModified
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[WebBookmark backgroundImageModifiedState](self->super._bookmark, "backgroundImageModifiedState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "BOOLValue") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark setBackgroundImageModifiedState:](self->super._bookmark, "setBackgroundImageModifiedState:", v4);

}

- (WBSCRDTPosition)syncPosition
{
  return -[WebBookmark syncPosition](self->super._bookmark, "syncPosition");
}

- (void)setSyncPosition:(id)a3
{
  -[WebBookmark setSyncPosition:](self->super._bookmark, "setSyncPosition:", a3);
}

- (id)mutableTabWithUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._tabsByUUID, "objectForKeyedSubscript:", a3);
}

- (void)appendTabs:(id)a3
{
  NSArray *tabs;
  id v5;
  id v6;

  tabs = self->super._tabs;
  v5 = a3;
  -[NSArray lastObject](tabs, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WBMutableTabGroup insertTabs:afterTab:](self, "insertTabs:afterTab:", v5, v6);

}

id __45__WBMutableTabGroup__performWithMutableTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "changeType"))
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1718];
    objc_msgSend(v2, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "changeWithObject:type:index:", v6, 0, objc_msgSend(v2, "index"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)clearTabs
{
  -[WBMutableTabGroup deleteTabs:](self, "deleteTabs:", self->super._tabs);
}

- (void)insertTabs:(id)a3 afterTab:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  WBMutableTabGroup *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    *(_DWORD *)buf = 134217984;
    v31 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Inserting %zu tabs", buf, 0xCu);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v15;
          objc_msgSend(v14, "privacyPreservingDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = (uint64_t)v17;
          _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_INFO, "Tab marked as added: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v14, "didInsertIntoTabGroup:", self);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __41__WBMutableTabGroup_insertTabs_afterTab___block_invoke;
  v21[3] = &unk_24CB31C98;
  v22 = v9;
  v23 = self;
  v24 = v20;
  v18 = v20;
  v19 = v9;
  -[WBMutableTabGroup _performWithMutableTabs:](self, "_performWithMutableTabs:", v21);

}

void __41__WBMutableTabGroup_insertTabs_afterTab___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableTabWithUUID:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_insertObjects:afterObject:", v2, v6);

}

- (void)deleteTabs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __32__WBMutableTabGroup_deleteTabs___block_invoke;
  v16[3] = &unk_24CB31CC0;
  v16[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "%zu tabs deleted", buf, 0xCu);

  }
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_markClean);
  -[NSMutableArray addObjectsFromArray:](self->super._deletedTabs, "addObjectsFromArray:", v6);
  v11 = v5;
  v12 = 3221225472;
  v13 = __32__WBMutableTabGroup_deleteTabs___block_invoke_11;
  v14 = &unk_24CB31CE8;
  v15 = v6;
  v10 = v6;
  -[WBMutableTabGroup _performWithMutableTabs:](self, "_performWithMutableTabs:", &v11);
  -[WBMutableTabGroup _fixLastSelectedTabIfNeeded](self, "_fixLastSelectedTabIfNeeded", v11, v12, v13, v14);

}

id __32__WBMutableTabGroup_deleteTabs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mutableTabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __32__WBMutableTabGroup_deleteTabs___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
}

- (void)removeTab:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "privacyPreservingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Removing tab %{public}@", buf, 0xCu);

  }
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableTabGroup mutableTabWithUUID:](self, "mutableTabWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "didRemoveFromTabGroup");
  objc_msgSend(v9, "markClean");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__WBMutableTabGroup_removeTab___block_invoke;
  v11[3] = &unk_24CB31CE8;
  v12 = v9;
  v10 = v9;
  -[WBMutableTabGroup _performWithMutableTabs:](self, "_performWithMutableTabs:", v11);

}

uint64_t __31__WBMutableTabGroup_removeTab___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)reorderTab:(id)a3 afterTab:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privacyPreservingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Reordering tab %{public}@ after tab %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableTabGroup mutableTabWithUUID:](self, "mutableTabWithUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v7)
    {
      objc_msgSend(v7, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBMutableTabGroup mutableTabWithUUID:](self, "mutableTabWithUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v13, "setMoved:", 1);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __41__WBMutableTabGroup_reorderTab_afterTab___block_invoke;
    v17[3] = &unk_24CB31C30;
    v18 = v13;
    v19 = v15;
    v16 = v15;
    -[WBMutableTabGroup _performWithMutableTabs:](self, "_performWithMutableTabs:", v17);

  }
}

void __41__WBMutableTabGroup_reorderTab_afterTab___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "removeObject:", v3);
  objc_msgSend(v4, "safari_insertObject:afterObject:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)truncateToNumberOfTabs:(unint64_t)a3
{
  NSArray *v5;
  NSArray *overflowRemoteTabs;
  NSArray *v7;
  NSArray *tabs;
  NSArray *v9;
  NSArray *cachedImmutableTabs;
  id v11;

  if (-[NSArray count](self->super._tabs, "count") >= a3)
  {
    if (-[WBTabGroup isSyncable](self, "isSyncable"))
    {
      -[NSArray subarrayWithRange:](self->super._tabs, "subarrayWithRange:", 0, a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[NSArray subarrayWithRange:](self->super._tabs, "subarrayWithRange:", a3, -[NSArray count](self->super._tabs, "count") - a3);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      overflowRemoteTabs = self->super._overflowRemoteTabs;
      self->super._overflowRemoteTabs = v5;

      v7 = (NSArray *)objc_msgSend(v11, "mutableCopy");
      tabs = self->super._tabs;
      self->super._tabs = v7;

      -[NSArray subarrayWithRange:](self->super._cachedImmutableTabs, "subarrayWithRange:", 0, a3);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      cachedImmutableTabs = self->super._cachedImmutableTabs;
      self->super._cachedImmutableTabs = v9;

      -[WBTabGroup _tabsDidChange](self, "_tabsDidChange");
    }
  }
}

- (void)mergeWithTabGroup:(id)a3
{
  WebBookmark *bookmark;
  id v5;
  void *v6;
  id displayTitleProvider;
  void *v8;
  id v9;
  id v10;

  bookmark = self->super._bookmark;
  v5 = a3;
  objc_msgSend(v5, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark mergeWithBookmark:](bookmark, "mergeWithBookmark:", v6);

  objc_msgSend(v5, "displayTitleProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  displayTitleProvider = v10;
  if (!v10)
    displayTitleProvider = self->super._displayTitleProvider;
  v8 = (void *)MEMORY[0x212BD4C84](displayTitleProvider);
  v9 = self->super._displayTitleProvider;
  self->super._displayTitleProvider = v8;

}

- (void)setDeviceUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUIDString, 0);
}

@end
