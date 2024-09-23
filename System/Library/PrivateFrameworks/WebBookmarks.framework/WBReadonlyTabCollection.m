@implementation WBReadonlyTabCollection

- (WBReadonlyTabCollection)init
{
  WBReadonlyTabCollection *v2;
  WBTabCollection *v3;
  void *v4;
  uint64_t v5;
  WBTabCollection *collection;
  WBReadonlyTabCollection *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBReadonlyTabCollection;
  v2 = -[WBReadonlyTabCollection init](&v9, sel_init);
  if (v2)
  {
    v3 = [WBTabCollection alloc];
    +[WBCollectionConfiguration readonlySafariTabCollectionConfiguration](WBCollectionConfiguration, "readonlySafariTabCollectionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBTabCollection initWithConfiguration:openDatabase:](v3, "initWithConfiguration:openDatabase:", v4, 1);
    collection = v2->_collection;
    v2->_collection = (WBTabCollection *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)hasCompletedMigration
{
  return -[WBTabCollection hasCompletedMigration](self->_collection, "hasCompletedMigration");
}

- (BOOL)isPersistent
{
  return -[WBTabCollection isPersistent](self->_collection, "isPersistent");
}

- (WBBrowserState)browserState
{
  return -[WBTabCollection browserState](self->_collection, "browserState");
}

- (WBBrowserState)lastSessionBrowserState
{
  return -[WBTabCollection lastSessionBrowserState](self->_collection, "lastSessionBrowserState");
}

- (NSArray)windowStates
{
  return -[WBTabCollection windowStates](self->_collection, "windowStates");
}

- (id)windowStateWithUUID:(id)a3
{
  return -[WBTabCollection windowStateWithUUID:](self->_collection, "windowStateWithUUID:", a3);
}

- (NSArray)profiles
{
  return -[WBTabCollection profiles](self->_collection, "profiles");
}

- (int)pinnedTabsFolderID
{
  return -[WBTabCollection pinnedTabsFolderID](self->_collection, "pinnedTabsFolderID");
}

- (int)privatePinnedTabsFolderID
{
  return -[WBTabCollection privatePinnedTabsFolderID](self->_collection, "privatePinnedTabsFolderID");
}

- (NSArray)namedTabGroupsInDefaultProfile
{
  return -[WBTabCollection namedTabGroupsInDefaultProfile](self->_collection, "namedTabGroupsInDefaultProfile");
}

- (NSArray)allNamedTabGroupsUnsorted
{
  return -[WBTabCollection allNamedTabGroupsUnsorted](self->_collection, "allNamedTabGroupsUnsorted");
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  return -[WBTabCollection namedTabGroupsForProfileWithIdentifier:](self->_collection, "namedTabGroupsForProfileWithIdentifier:", a3);
}

- (id)devicesForProfile:(id)a3
{
  return -[WBTabCollection devicesForProfile:](self->_collection, "devicesForProfile:", a3);
}

- (id)tabsForTabGroup:(id)a3
{
  return -[WBTabCollection tabsForTabGroup:](self->_collection, "tabsForTabGroup:", a3);
}

- (id)tabGroupWithUUID:(id)a3
{
  return -[WBTabCollection tabGroupWithUUID:](self->_collection, "tabGroupWithUUID:", a3);
}

- (id)tabWithUUID:(id)a3
{
  return -[WBTabCollection tabWithUUID:](self->_collection, "tabWithUUID:", a3);
}

- (void)disableSuddenTerminationForPendingChanges
{
  -[WBTabCollection disableSuddenTerminationForPendingChanges](self->_collection, "disableSuddenTerminationForPendingChanges");
}

- (void)waitForPendingChanges
{
  -[WBTabCollection waitForPendingChanges](self->_collection, "waitForPendingChanges");
}

- (unint64_t)maximumTabsPerGroup
{
  return -[WBTabCollection maximumTabsPerGroup](self->_collection, "maximumTabsPerGroup");
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
  -[WBTabCollection setMaximumTabsPerGroup:](self->_collection, "setMaximumTabsPerGroup:", a3);
}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  return -[WBTabCollection tabCollectionDataSummaryLogHidingSensitiveData:](self->_collection, "tabCollectionDataSummaryLogHidingSensitiveData:", a3);
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  return -[WBTabCollection copyTabsDatabase:hidingSensitiveData:error:](self->_collection, "copyTabsDatabase:hidingSensitiveData:error:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
