@implementation WBTabGroup

uint64_t __35__WBTabGroup__updateTabLookupTable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

- (id)tabWithUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tabsByUUID, "objectForKeyedSubscript:", a3);
}

- (NSString)displayTitle
{
  void (**displayTitleProvider)(id, SEL);

  displayTitleProvider = (void (**)(id, SEL))self->_displayTitleProvider;
  if (displayTitleProvider)
    displayTitleProvider[2](displayTitleProvider, a2);
  else
    -[WBTabGroup title](self, "title");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  WBTabGroup *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WBTabGroup *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBTabGroup uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroup uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = WBSIsEqual();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  __objc2_class **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v4 = a4;
  v7 = (void *)-[WebBookmark copy](self->_bookmark, "copy");
  v8 = &off_24CB309C8;
  if (!v4)
    v8 = off_24CB30AC8;
  v9 = -[__objc2_class initWithBookmark:](-[__objc2_class allocWithZone:](*v8, "allocWithZone:", a3), "initWithBookmark:", v7);
  v10 = MEMORY[0x212BD4C84](self->_displayTitleProvider);
  v11 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v10;

  *(_QWORD *)(v9 + 64) = self->_kind;
  v12 = -[NSString copy](self->_lastSelectedTabUUID, "copy");
  v13 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v12;

  v14 = -[NSString copy](self->_profileIdentifier, "copy");
  v15 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v14;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "safari_arrayWithArray:copyAction:", self->_tabs, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v16;

    objc_msgSend(MEMORY[0x24BDBCE30], "safari_arrayWithArray:copyAction:", self->_overflowRemoteTabs, 2);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_isMutable)
  {
    -[WBTabGroup _updateCachedImmutableTabsIfNeeded](self, "_updateCachedImmutableTabsIfNeeded");
    objc_storeStrong((id *)(v9 + 8), self->_cachedImmutableTabs);
    v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_overflowRemoteTabs, 1);
  }
  else
  {
    objc_storeStrong((id *)(v9 + 8), self->_tabs);
    v18 = self->_overflowRemoteTabs;
  }
  v19 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v18;

  v20 = -[NSMutableArray mutableCopy](self->_deletedTabs, "mutableCopy");
  v21 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v20;

  objc_storeStrong((id *)(v9 + 24), self->_cachedImmutableTabs);
  objc_msgSend((id)v9, "_tabsDidChange");

  return (id)v9;
}

- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4
{
  return -[WBTabGroup initWithBookmark:lastSelectedTabUUID:kind:](self, "initWithBookmark:lastSelectedTabUUID:kind:", a3, a4, 2);
}

- (WBTabGroup)initWithBookmark:(id)a3
{
  return -[WBTabGroup initWithBookmark:lastSelectedTabUUID:](self, "initWithBookmark:lastSelectedTabUUID:", a3, 0);
}

- (void)_updateCachedImmutableTabsIfNeeded
{
  NSArray *cachedImmutableTabs;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD v14[5];

  cachedImmutableTabs = self->_cachedImmutableTabs;
  if (!cachedImmutableTabs)
    goto LABEL_6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__WBTabGroup__updateCachedImmutableTabsIfNeeded__block_invoke;
  v14[3] = &unk_24CB34348;
  v14[4] = self;
  -[NSArray indexesOfObjectsPassingTest:](cachedImmutableTabs, "indexesOfObjectsPassingTest:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[NSArray objectsAtIndexes:](self->_tabs, "objectsAtIndexes:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1720]), "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:", v4, v7, v4, 0);
    -[NSArray arrayByApplyingDifference:](self->_cachedImmutableTabs, "arrayByApplyingDifference:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedImmutableTabs;
    self->_cachedImmutableTabs = v9;

  }
  v11 = self->_cachedImmutableTabs;
  if (v11)
    v12 = v11;
  else
LABEL_6:
    v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_tabs, 1);
  v13 = self->_cachedImmutableTabs;
  self->_cachedImmutableTabs = v12;

}

- (void)_updateTabLookupTable
{
  NSMutableDictionary *v3;
  NSMutableDictionary *tabsByUUID;
  id v5;

  -[NSArray safari_mapObjectsUsingBlock:](self->_tabs, "safari_mapObjectsUsingBlock:", &__block_literal_global_21);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjects:forKeys:", self->_tabs, v5);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  tabsByUUID = self->_tabsByUUID;
  self->_tabsByUUID = v3;

}

- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4 kind:(int64_t)a5
{
  id v9;
  id v10;
  WBTabGroup *v11;
  void *v12;
  uint64_t v13;
  NSString *lastSelectedTabUUID;
  id *v15;
  uint64_t v16;
  NSArray *tabs;
  uint64_t v18;
  NSMutableDictionary *tabsByUUID;
  NSArray *v20;
  WBTabGroup *v21;
  NSMutableArray *v22;
  NSMutableArray *deletedTabs;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBTabGroup;
  v11 = -[WBTabGroup init](&v25, sel_init);
  if (v11 && objc_msgSend(v9, "isFolder"))
  {
    objc_opt_class();
    v11->_isMutable = objc_opt_isKindOfClass() & 1;
    v12 = (void *)objc_opt_class();
    objc_storeStrong((id *)&v11->_tabClass, v12);
    objc_storeStrong((id *)&v11->_bookmark, a3);
    v13 = objc_msgSend(v10, "copy");
    lastSelectedTabUUID = v11->_lastSelectedTabUUID;
    v11->_lastSelectedTabUUID = (NSString *)v13;

    v15 = (id *)0x24BDBCE30;
    if (v11->_isMutable)
      v15 = (id *)0x24BDBCEB8;
    objc_msgSend(*v15, "array");
    v16 = objc_claimAutoreleasedReturnValue();
    tabs = v11->_tabs;
    v11->_tabs = (NSArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    tabsByUUID = v11->_tabsByUUID;
    v11->_tabsByUUID = (NSMutableDictionary *)v18;

    if (v11->_isMutable)
      v20 = 0;
    else
      v20 = v11->_tabs;
    objc_storeStrong((id *)&v11->_cachedImmutableTabs, v20);
    v11->_kind = a5;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    deletedTabs = v11->_deletedTabs;
    v11->_deletedTabs = v22;

    objc_storeStrong((id *)&v11->_profileIdentifier, (id)*MEMORY[0x24BE82E70]);
    v21 = v11;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)isLocal
{
  return self->_kind == 0;
}

- (BOOL)hasDynamicTitle
{
  if (self->_displayTitleProvider)
    return !-[WBTabGroup isPrivateBrowsing](self, "isPrivateBrowsing");
  else
    return 0;
}

- (BOOL)isPrivateBrowsing
{
  return self->_kind == 1;
}

- (BOOL)isUnnamed
{
  return self->_kind == 3;
}

- (NSString)uuid
{
  return -[WebBookmark UUID](self->_bookmark, "UUID");
}

- (NSArray)allTabs
{
  NSUInteger v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[NSArray count](self->_overflowRemoteTabs, "count");
  -[WBTabGroup tabs](self, "tabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WBTabGroup overflowRemoteTabs](self, "overflowRemoteTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSArray *)v4;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (BOOL)usesGlobalPinnedTabs
{
  return !-[WBTabGroup isNamed](self, "isNamed");
}

- (BOOL)isNamed
{
  return self->_kind == 2;
}

- (BOOL)isShared
{
  _BOOL4 v3;

  v3 = -[WBTabGroup isSyncable](self, "isSyncable");
  if (v3)
    LOBYTE(v3) = -[WebBookmark hasShareRecord](self->_bookmark, "hasShareRecord");
  return v3;
}

- (BOOL)isSyncable
{
  return -[WebBookmark isSyncable](self->_bookmark, "isSyncable");
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_isMutable)
    return -[WBTabGroup _copyWithZone:isMutable:](self, "_copyWithZone:isMutable:", a3, 0);
  else
    return self;
}

id __25__WBTabGroup_tabsUUIDSet__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  return v6;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (NSSet)tabsUUIDSet
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_tabs, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_41_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabClass, 0);
  objc_storeStrong((id *)&self->_cachedUnpinnedTabs, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong(&self->_displayTitleProvider, 0);
  objc_storeStrong((id *)&self->_lastSelectedTabUUID, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_tabsByUUID, 0);
  objc_storeStrong((id *)&self->_deletedTabs, 0);
  objc_storeStrong((id *)&self->_cachedImmutableTabs, 0);
  objc_storeStrong((id *)&self->_overflowRemoteTabs, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (WBTabGroup)init
{

  return 0;
}

- (WBTabGroup)initWithDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  WBTabGroup *v6;

  v4 = a3;
  v5 = -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:]([WebBookmark alloc], "initFolderWithParentID:deviceIdentifier:collectionType:", 0, v4, 1);

  v6 = -[WBTabGroup initWithBookmark:](self, "initWithBookmark:", v5);
  return v6;
}

- (WBTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  WBTabGroup *v11;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBTabGroup initWithTitle:uuid:deviceIdentifier:](self, "initWithTitle:uuid:deviceIdentifier:", v8, v10, v7);

  return v11;
}

- (WBTabGroup)initWithTitle:(id)a3 uuid:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  WBTabGroup *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:]([WebBookmark alloc], "initFolderWithParentID:deviceIdentifier:collectionType:", 0, v8, 1);

  objc_msgSend(v11, "setTitle:", v10);
  objc_msgSend(v11, "_setUUID:", v9);

  v12 = -[WBTabGroup initWithBookmark:](self, "initWithBookmark:", v11);
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBTabGroup uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

uint64_t __48__WBTabGroup__updateCachedImmutableTabsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isIdentical:", v6);

  return v4 ^ 1;
}

- (void)_tabsDidChange
{
  NSArray *cachedUnpinnedTabs;

  -[WBTabGroup _updateTabLookupTable](self, "_updateTabLookupTable");
  cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  self->_cachedUnpinnedTabs = 0;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[WBTabGroup _copyWithZone:isMutable:](self, "_copyWithZone:isMutable:", a3, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBTabGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBTabGroup *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *tabs;
  NSArray *v15;
  WBTabGroup *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSelectedTabUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBTabGroup initWithBookmark:lastSelectedTabUUID:kind:](self, "initWithBookmark:lastSelectedTabUUID:kind:", v5, v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("tabs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7->_isMutable)
      v13 = objc_msgSend(v12, "mutableCopy");
    else
      v13 = objc_msgSend(v12, "copy");
    tabs = v7->_tabs;
    v7->_tabs = (NSArray *)v13;

    if (v7->_isMutable)
      v15 = 0;
    else
      v15 = v7->_tabs;
    objc_storeStrong((id *)&v7->_cachedImmutableTabs, v15);
    -[WBTabGroup _tabsDidChange](v7, "_tabsDidChange");
    v16 = v7;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  WebBookmark *bookmark;
  id v5;

  bookmark = self->_bookmark;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bookmark, CFSTR("bookmark"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tabs, CFSTR("tabs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSelectedTabUUID, CFSTR("lastSelectedTabUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_kind, CFSTR("type"));

}

- (WBTabGroup)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WebBookmark *v5;
  void *v6;
  WebBookmark *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WBTabGroup *v11;
  void *v12;
  WBTabGroup *v13;
  void *v14;
  uint64_t v15;
  NSArray *tabs;
  void *v17;
  WBTabGroup *v18;
  _QWORD v20[4];
  WBTabGroup *v21;

  v4 = a3;
  v5 = [WebBookmark alloc];
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("bookmark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WebBookmark initWithDictionaryRepresentationForInMemoryChangeTracking:](v5, "initWithDictionaryRepresentationForInMemoryChangeTracking:", v6);

  objc_msgSend(v4, "safari_stringForKey:", CFSTR("lastSelectedTabUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v11 = -[WBTabGroup initWithBookmark:lastSelectedTabUUID:kind:](self, "initWithBookmark:lastSelectedTabUUID:kind:", v7, v8, v10);
  if (v11)
  {
    objc_msgSend(v4, "safari_arrayForKey:", CFSTR("tabs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__WBTabGroup_initWithDictionaryRepresentation___block_invoke;
    v20[3] = &unk_24CB343B0;
    v13 = v11;
    v21 = v13;
    objc_msgSend(v12, "safari_mapObjectsUsingBlock:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13->_isMutable)
      v15 = objc_msgSend(v14, "mutableCopy");
    else
      v15 = objc_msgSend(v14, "copy");
    tabs = v13->_tabs;
    v13->_tabs = (NSArray *)v15;

    if (v13->_isMutable)
      v17 = 0;
    else
      v17 = v14;
    objc_storeStrong((id *)&v13->_cachedImmutableTabs, v17);
    -[WBTabGroup _tabsDidChange](v13, "_tabsDidChange");
    v18 = v13;

  }
  return v11;
}

id __47__WBTabGroup_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "_tabClass")), "initWithDictionaryRepresentation:", v3);

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *lastSelectedTabUUID;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("bookmark");
  -[WebBookmark dictionaryRepresentationForInMemoryChangeTracking](self->_bookmark, "dictionaryRepresentationForInMemoryChangeTracking");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  lastSelectedTabUUID = (const __CFString *)self->_lastSelectedTabUUID;
  if (!lastSelectedTabUUID)
    lastSelectedTabUUID = &stru_24CB35168;
  v11[0] = v3;
  v11[1] = lastSelectedTabUUID;
  v10[1] = CFSTR("lastSelectedTabUUID");
  v10[2] = CFSTR("tabs");
  -[NSArray valueForKey:](self->_tabs, "valueForKey:", CFSTR("dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_kind);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (NSString)deviceIdentifier
{
  return -[WebBookmark deviceIdentifier](self->_bookmark, "deviceIdentifier");
}

- (id)displayTitleProvider
{
  return (id)MEMORY[0x212BD4C84](self->_displayTitleProvider, a2);
}

- (BOOL)isHidden
{
  return -[WebBookmark isHidden](self->_bookmark, "isHidden");
}

- (NSString)htmlString
{
  void *v3;
  void *v4;
  NSArray *v5;
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

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 70 * -[NSArray count](self->_tabs, "count") + 52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("<html><body>"));
  if (-[WBTabGroup isSyncable](self, "isSyncable"))
  {
    -[WBTabGroup title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("<h>%@</h>"), v4);

  }
  objc_msgSend(v3, "appendString:", CFSTR("<ul>"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_tabs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(v10, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<li><a href='%@'>%@</a></li>"), v11, v12, (_QWORD)v14);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR("</ul>"));
  objc_msgSend(v3, "appendString:", CFSTR("</body></html>"));
  return (NSString *)v3;
}

- (NSSet)emptyTabsUUIDSet
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_tabs, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

id __30__WBTabGroup_emptyTabsUUIDSet__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "isBlank"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)representativeURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[WBTabGroup tabs](self, "tabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_lastSelectedTabUUID)
    goto LABEL_4;
  -[WBTabGroup tabWithUUID:](self, "tabWithUUID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {

LABEL_4:
    objc_msgSend(v3, "safari_lastObjectPassingTest:", &__block_literal_global_44);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

BOOL __31__WBTabGroup_representativeURL__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)identifier
{
  return -[WebBookmark identifier](self->_bookmark, "identifier");
}

- (BOOL)isInserted
{
  return -[WebBookmark isInserted](self->_bookmark, "isInserted");
}

- (WBTab)lastPinnedTab
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_tabs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isPinned", (_QWORD)v12))
        {
          v9 = v8;

          v5 = v9;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v10 = (void *)objc_msgSend(v5, "copy");
  return (WBTab *)v10;
}

- (id)lastPinnedTabExcluding:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  int v12;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_tabs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "isPinned", (_QWORD)v17);
        if (v11 != v4 && v12 != 0)
        {
          v14 = v11;

          v8 = v14;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (WBTab)firstUnpinnedTab
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_tabs;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v6, "isPinned", (_QWORD)v8))
        {
          v3 = (void *)objc_msgSend(v6, "copy");
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (WBTab *)v3;
}

- (WBTab)pinnedStartPage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[WBTabGroup tabs](self, "tabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_45);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  return (WBTab *)v4;
}

BOOL __29__WBTabGroup_pinnedStartPage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isPinned"))
  {
    objc_msgSend(v2, "pinnedURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)unpinnedTabs
{
  NSArray *cachedUnpinnedTabs;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  if (!cachedUnpinnedTabs)
  {
    -[WBTabGroup tabs](self, "tabs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_46);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedUnpinnedTabs;
    self->_cachedUnpinnedTabs = v5;

    cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  }
  return cachedUnpinnedTabs;
}

uint64_t __26__WBTabGroup_unpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (NSString)title
{
  return -[WebBookmark title](self->_bookmark, "title");
}

- (WBSCRDTPosition)syncPosition
{
  return -[WebBookmark syncPosition](self->_bookmark, "syncPosition");
}

- (NSString)serverID
{
  return -[WebBookmark serverID](self->_bookmark, "serverID");
}

- (BOOL)hasSameKindAsTabGroup:(id)a3
{
  int64_t kind;

  kind = self->_kind;
  return kind == objc_msgSend(a3, "kind");
}

- (BOOL)isInDefaultProfile
{
  return -[NSString isEqualToString:](self->_profileIdentifier, "isEqualToString:", *MEMORY[0x24BE82E70]);
}

- (BOOL)supportsDeviceTabs
{
  if (-[WBTabGroup isNamed](self, "isNamed") || -[WBTabGroup isLocal](self, "isLocal"))
    return 0;
  else
    return !-[WBTabGroup isPrivateBrowsing](self, "isPrivateBrowsing");
}

- (BOOL)isIdentical:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (WBSIsEqual())
  {
    -[WBTabGroup title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)tabsAreIdentical:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  NSArray *tabs;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = -[NSArray count](self->_tabs, "count");
  objc_msgSend(v4, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v6, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    tabs = self->_tabs;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __31__WBTabGroup_tabsAreIdentical___block_invoke;
    v10[3] = &unk_24CB344B8;
    v11 = v6;
    v12 = &v13;
    -[NSArray enumerateObjectsUsingBlock:](tabs, "enumerateObjectsUsingBlock:", v10);
    v8 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __31__WBTabGroup_tabsAreIdentical___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "isIdentical:");

  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (BOOL)isTabPinnable:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (objc_msgSend(v4, "canSetPinned"))
  {
    if (objc_msgSend(v4, "isBlank"))
      v5 = !-[WBTabGroup usesGlobalPinnedTabs](self, "usesGlobalPinnedTabs");
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBTabGroup identifier](self, "identifier");
  v6 = -[WBTabGroup isSyncable](self, "isSyncable");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[WBTabGroup title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBTabGroup kind](self, "kind");
  -[WBTabGroup tabs](self, "tabs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[WBTabGroup uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup serverID](self, "serverID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p; identifier = %d; syncable = %@; title = %@; kind = %ld; numberOfTabs = %zu; uuid = %@; serverID = %@>"),
    v4,
    self,
    v5,
    v8,
    v9,
    v10,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)privacyPreservingDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBTabGroup identifier](self, "identifier");
  v7 = -[WBTabGroup isSyncable](self, "isSyncable");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = v8;
  v10 = -[WBTabGroup kind](self, "kind");
  -[WBTabGroup tabs](self, "tabs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[WBTabGroup uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup serverID](self, "serverID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %d; syncable = %@; kind = %ld; numberOfTabs = %zu; uuid = %@; serverID = %@>"),
    v5,
    self,
    v6,
    v9,
    v10,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)debugSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WebBookmark *bookmark;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[WBTabGroup title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, UUID: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  bookmark = self->_bookmark;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__WBTabGroup_debugSyncDescription__block_invoke;
  v11[3] = &unk_24CB325B0;
  v12 = v6;
  v8 = v6;
  -[WebBookmark getReadOnlyCachedBookmarkSyncDataUsingBlock:](bookmark, "getReadOnlyCachedBookmarkSyncDataUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return (NSString *)v9;
}

void __34__WBTabGroup_debugSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ckShortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", recordID: %@"), v7);

  objc_msgSend(v4, "shareRecord");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v12, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ckShortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(", share recordID: %@"), v11);

    v8 = v12;
  }

}

- (NSString)debugRecursiveSyncDescription
{
  void *v3;
  void *v4;
  NSArray *v5;
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

  v17 = *MEMORY[0x24BDAC8D0];
  -[WBTabGroup debugSyncDescription](self, "debugSyncDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_tabs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "debugSyncDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (void)detectDuplicatedTabs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v5, v6, "Detected duplicated tabs: %@", v7, v8, v9, v10, 2u);

}

uint64_t __34__WBTabGroup_detectDuplicatedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

- (BOOL)isEmpty
{
  if (-[NSArray count](self->_tabs, "count"))
    return -[NSArray safari_allObjectsPassTest:](self->_tabs, "safari_allObjectsPassTest:", &__block_literal_global_63);
  else
    return 1;
}

uint64_t __21__WBTabGroup_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBlank");
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (NSString)lastSelectedTabUUID
{
  return self->_lastSelectedTabUUID;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (BOOL)_isMutable
{
  return self->_isMutable;
}

- (Class)_tabClass
{
  return self->_tabClass;
}

- (NSArray)overflowRemoteTabs
{
  return self->_overflowRemoteTabs;
}

@end
