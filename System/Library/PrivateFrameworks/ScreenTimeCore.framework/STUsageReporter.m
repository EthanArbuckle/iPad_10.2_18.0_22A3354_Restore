@implementation STUsageReporter

- (STUsageReporter)initWithUsage:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  STUsageReporter *v7;
  uint64_t v8;
  NSDateInterval *dateInterval;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *userDSID;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSFetchedResultsController *fetchedResultsController;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)STUsageReporter;
  v5 = a4;
  v6 = a3;
  v7 = -[STUsageReporter init](&v22, sel_init);
  v8 = objc_msgSend(v5, "copy", v22.receiver, v22.super_class);
  dateInterval = v7->_dateInterval;
  v7->_dateInterval = (NSDateInterval *)v8;

  objc_msgSend(v6, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  userDSID = v7->_userDSID;
  v7->_userDSID = (NSNumber *)v12;

  +[STUsageBlock fetchRequestMatchingUsage:dateInterval:](STUsageBlock, "fetchRequestMatchingUsage:dateInterval:", v6, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v16);

  objc_msgSend(v14, "setShouldRefreshRefetchedObjects:", 1);
  v17 = objc_alloc(MEMORY[0x1E0C97B68]);
  objc_msgSend(v6, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v17, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v14, v18, 0, 0);
  fetchedResultsController = v7->_fetchedResultsController;
  v7->_fetchedResultsController = (NSFetchedResultsController *)v19;

  -[NSFetchedResultsController setDelegate:](v7->_fetchedResultsController, "setDelegate:", v7);
  return v7;
}

- (BOOL)generateReport:(id *)a3
{
  void *v4;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "performFetch:", a3);

  return (char)a3;
}

- (NSFetchedResultsController)installedAppsController
{
  NSFetchedResultsController *installedAppsController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSFetchedResultsController *v14;
  NSFetchedResultsController *v15;
  NSFetchedResultsController *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  installedAppsController = self->_installedAppsController;
  if (!installedAppsController)
  {
    +[STInstalledApp fetchRequest](STInstalledApp, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReturnsDistinctResults:", 1);
    v28[0] = CFSTR("bundleIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPropertiesToFetch:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("bundleIdentifier"), 1);
    v27 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSortDescriptors:", v7);

    v8 = (void *)MEMORY[0x1E0CB3880];
    -[STUsageReporter userDSID](self, "userDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("userDeviceState.user.dsid"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v10);

    objc_msgSend(v4, "setShouldRefreshRefetchedObjects:", 1);
    v11 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSFetchedResultsController *)objc_msgSend(v11, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, v13, 0, 0);
    v15 = self->_installedAppsController;
    self->_installedAppsController = v14;

    -[NSFetchedResultsController setDelegate:](self->_installedAppsController, "setDelegate:", self);
    v16 = self->_installedAppsController;
    v26 = 0;
    LOBYTE(v12) = -[NSFetchedResultsController performFetch:](v16, "performFetch:", &v26);
    v17 = v26;
    if ((v12 & 1) == 0)
    {
      +[STLog usage](STLog, "usage");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[STUsageReporter installedAppsController].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

    }
    installedAppsController = self->_installedAppsController;
  }
  return installedAppsController;
}

- (double)totalScreenTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageBlock totalScreenTimeForUsageBlocks:](STUsageBlock, "totalScreenTimeForUsageBlocks:", v3);
  v5 = v4;

  return v5;
}

- (int64_t)totalPickups
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[STUsageBlock totalPickupsForUsageBlocks:](STUsageBlock, "totalPickupsForUsageBlocks:", v3);

  return v4;
}

- (int64_t)totalNotifications
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[STUsageBlock totalNotificationsForUsageBlocks:](STUsageBlock, "totalNotificationsForUsageBlocks:", v3);

  return v4;
}

- (NSArray)categoryUsage
{
  void *v3;
  void *v4;
  STUsageDetailItem *v5;
  double v6;

  -[STUsageReporter _categoryUsageWithoutAllUsageItem](self, "_categoryUsageWithoutAllUsageItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[STUsageReporter includeTotalUsageDetailItem](self, "includeTotalUsageDetailItem"))
  {
    v5 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 3, CFSTR("__AllCategories__"));
    -[STUsageReporter totalScreenTime](self, "totalScreenTime");
    *(float *)&v6 = v6;
    -[STUsageDetailItem setQuantity:](v5, "setQuantity:", v6);
    objc_msgSend(v4, "insertObject:atIndex:", v5, 0);

  }
  return (NSArray *)v4;
}

- (id)_categoryUsageWithoutAllUsageItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUsageCategory categoryItemsExcludingSystemCategories:](STUsageCategory, "categoryItemsExcludingSystemCategories:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("quantity"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)applicationAndWebUsage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  STUsageDetailItem *v8;
  double v9;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUsageCategory applicationAndWebItemsExcludingSystemHiddenApplications:](STUsageCategory, "applicationAndWebItemsExcludingSystemHiddenApplications:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (-[STUsageReporter includeTotalUsageDetailItem](self, "includeTotalUsageDetailItem"))
  {
    v8 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 3, CFSTR("__AllApps__"));
    -[STUsageReporter totalScreenTime](self, "totalScreenTime");
    *(float *)&v9 = v9;
    -[STUsageDetailItem setQuantity:](v8, "setQuantity:", v9);
    objc_msgSend(v7, "insertObject:atIndex:", v8, 0);

  }
  return (NSArray *)v7;
}

+ (id)keyPathsForValuesAffectingNotifications
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("installedBundleIdentifiers"));
}

- (NSArray)notifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  STUsageDetailItem *v11;
  double v12;
  _QWORD v14[4];
  id v15;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUsageCountedItem notificationItemsExcludingSystemHiddenApplications:](STUsageCountedItem, "notificationItemsExcludingSystemHiddenApplications:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[STUsageReporter installedBundleIdentifiers](self, "installedBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __32__STUsageReporter_notifications__block_invoke;
    v14[3] = &unk_1E9371D48;
    v15 = v8;
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsAtIndexes:", v10);

  }
  else
  {
    -[STUsageReporter _updateInstalledBundleIdentifiers](self, "_updateInstalledBundleIdentifiers");
  }
  if (-[STUsageReporter includeTotalUsageDetailItem](self, "includeTotalUsageDetailItem"))
  {
    v11 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 3, CFSTR("__AllApps__"));
    *(float *)&v12 = (float)-[STUsageReporter totalNotifications](self, "totalNotifications");
    -[STUsageDetailItem setQuantity:](v11, "setQuantity:", v12);
    objc_msgSend(v7, "insertObject:atIndex:", v11, 0);

  }
  return (NSArray *)v7;
}

uint64_t __32__STUsageReporter_notifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (NSArray)pickups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  STUsageDetailItem *v8;
  double v9;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STUsageCountedItem pickupItemsExcludingSystemHiddenApplications:](STUsageCountedItem, "pickupItemsExcludingSystemHiddenApplications:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (-[STUsageReporter includeTotalUsageDetailItem](self, "includeTotalUsageDetailItem"))
  {
    v8 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 3, CFSTR("__AllApps__"));
    *(float *)&v9 = (float)-[STUsageReporter totalPickups](self, "totalPickups");
    -[STUsageDetailItem setQuantity:](v8, "setQuantity:", v9);
    objc_msgSend(v7, "insertObject:atIndex:", v8, 0);

  }
  return (NSArray *)v7;
}

- (id)screenTimeUsagePerCalendarUnit:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__STUsageReporter_screenTimeUsagePerCalendarUnit___block_invoke;
  v8[3] = &unk_1E9371D70;
  v6 = v5;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a3, v8);

  return v6;
}

void __50__STUsageReporter_screenTimeUsagePerCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  STUsageDetailItem *v5;

  v3 = a2;
  v5 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, CFSTR("__AllApps__"));
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@sum.screenTimeInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "floatValue");
  -[STUsageDetailItem setQuantity:](v5, "setQuantity:");

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

- (id)categoryRatiosPerCalendarUnit:(unint64_t)a3 numberOfCategories:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[STUsageReporter _categoryUsageWithoutAllUsageItem](self, "_categoryUsageWithoutAllUsageItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 4)
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, a4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[STUsageReporter _ratiosForCategory:perCalendarUnit:useTotalScreenTime:](self, "_ratiosForCategory:perCalendarUnit:useTotalScreenTime:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), a3, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4
{
  return -[STUsageReporter _ratiosForCategory:perCalendarUnit:useTotalScreenTime:](self, "_ratiosForCategory:perCalendarUnit:useTotalScreenTime:", a3, a4, 1);
}

- (id)_ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4 useTotalScreenTime:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__STUsageReporter__ratiosForCategory_perCalendarUnit_useTotalScreenTime___block_invoke;
  v15[3] = &unk_1E9371D98;
  v18 = a5;
  v16 = v8;
  v10 = v9;
  v17 = v10;
  v11 = v8;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __73__STUsageReporter__ratiosForCategory_perCalendarUnit_useTotalScreenTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  void *v14;
  int v15;
  float v16;
  float v17;
  STUsageDetailItem *v18;
  double v19;
  STUsageDetailItem *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 0.0;
  v5 = 0.0;
  if (*(_BYTE *)(a1 + 48))
  {
    +[STUsageBlock totalScreenTimeForUsageBlocks:](STUsageBlock, "totalScreenTimeForUsageBlocks:", v3);
    v5 = v6;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = (float)objc_msgSend(v12, "totalTimeInSeconds");
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v15)
          v16 = v13;
        else
          v16 = -0.0;
        v4 = v4 + v16;
        if (*(_BYTE *)(a1 + 48))
          v17 = -0.0;
        else
          v17 = v13;
        v5 = v5 + v17;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v18 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 3, *(_QWORD *)(a1 + 32));
  v20 = v18;
  if (v5 != 0.0)
  {
    if ((float)(v4 / v5) <= 1.0)
      v5 = v4 / v5;
    else
      v5 = 1.0;
  }
  *(float *)&v19 = v5;
  -[STUsageDetailItem setQuantity:](v18, "setQuantity:", v19);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

}

- (id)ratiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__STUsageReporter_ratiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E9371DC0;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __56__STUsageReporter_ratiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  float v17;
  double v18;
  float v19;
  STUsageDetailItem *v20;
  double v21;
  STUsageDetailItem *v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = a2;
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = v3;
    v25 = *(_QWORD *)v31;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "timedItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              v14 = objc_msgSend(v13, "totalTimeInSeconds");
              objc_msgSend(v13, "bundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 32));

              v17 = (float)v14;
              if (!v16)
                v17 = -0.0;
              v5 = v5 + v17;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0.0;
  }

  +[STUsageBlock totalScreenTimeForUsageBlocks:](STUsageBlock, "totalScreenTimeForUsageBlocks:", v23);
  v19 = v18;
  v20 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, *(_QWORD *)(a1 + 32));
  v22 = v20;
  if (v19 != 0.0)
  {
    if ((float)(v5 / v19) <= 1.0)
      v19 = v5 / v19;
    else
      v19 = 1.0;
  }
  *(float *)&v21 = v19;
  -[STUsageDetailItem setQuantity:](v20, "setQuantity:", v21);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

}

- (id)ratiosForWebDomain:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__STUsageReporter_ratiosForWebDomain_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E9371DC0;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __54__STUsageReporter_ratiosForWebDomain_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  float v17;
  double v18;
  float v19;
  STUsageDetailItem *v20;
  double v21;
  STUsageDetailItem *v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = a2;
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = v3;
    v25 = *(_QWORD *)v31;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "timedItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              v14 = objc_msgSend(v13, "totalTimeInSeconds");
              objc_msgSend(v13, "domain");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 32));

              v17 = (float)v14;
              if (!v16)
                v17 = -0.0;
              v5 = v5 + v17;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0.0;
  }

  +[STUsageBlock totalScreenTimeForUsageBlocks:](STUsageBlock, "totalScreenTimeForUsageBlocks:", v23);
  v19 = v18;
  v20 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 2, *(_QWORD *)(a1 + 32));
  v22 = v20;
  if (v19 != 0.0)
  {
    if ((float)(v5 / v19) <= 1.0)
      v19 = v5 / v19;
    else
      v19 = 1.0;
  }
  *(float *)&v21 = v19;
  -[STUsageDetailItem setQuantity:](v20, "setQuantity:", v21);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

}

- (id)pickupsPerCalendarUnit:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__STUsageReporter_pickupsPerCalendarUnit___block_invoke;
  v8[3] = &unk_1E9371D70;
  v6 = v5;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a3, v8);

  return v6;
}

void __42__STUsageReporter_pickupsPerCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  STUsageDetailItem *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v7 = v7 + (float)objc_msgSend(v9, "numberOfPickupsWithoutApplicationUsage");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "countedItems", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v7 = v7 + (float)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "numberOfPickups");
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  v15 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, CFSTR("__AllApps__"));
  *(float *)&v16 = v7;
  -[STUsageDetailItem setQuantity:](v15, "setQuantity:", v16);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

- (id)pickupRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__STUsageReporter_pickupRatiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E9371DC0;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __62__STUsageReporter_pickupRatiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  float v18;
  STUsageDetailItem *v19;
  STUsageDetailItem *v20;
  double v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v3)
  {
    v4 = v3;
    v23 = *(_QWORD *)v29;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v5 = v5 + (float)objc_msgSend(v8, "numberOfPickupsWithoutApplicationUsage");
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v8, "countedItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              v15 = objc_msgSend(v14, "numberOfPickups");
              objc_msgSend(v14, "bundleIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 32));

              if (v17)
                v18 = (float)v15;
              else
                v18 = -0.0;
              v6 = v6 + v18;
              v5 = v5 + (float)v15;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v11);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  v19 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, *(_QWORD *)(a1 + 32));
  v20 = v19;
  *(float *)&v21 = v6 / v5;
  if (v5 == 0.0)
    *(float *)&v21 = v5;
  -[STUsageDetailItem setQuantity:](v19, "setQuantity:", v21);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

}

- (NSDate)firstPickup
{
  void *v3;
  void *v4;
  void *v5;

  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReporter _firstPickupFromUsageBlocks:](self, "_firstPickupFromUsageBlocks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (id)firstPickupOfIntervalWithMostPickups:(unint64_t *)a3 perCalendarUnit:(unint64_t)a4
{
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  *a3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__STUsageReporter_firstPickupOfIntervalWithMostPickups_perCalendarUnit___block_invoke;
  v6[3] = &unk_1E9371DE8;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__STUsageReporter_firstPickupOfIntervalWithMostPickups_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = +[STUsageBlock totalPickupsForUsageBlocks:](STUsageBlock, "totalPickupsForUsageBlocks:");
  v4 = *(unint64_t **)(a1 + 48);
  if (v3 > *v4)
  {
    *v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_firstPickupFromUsageBlocks:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)_firstPickupFromUsageBlocks:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_21);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstPickupDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

BOOL __47__STUsageReporter__firstPickupFromUsageBlocks___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "firstPickupDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)notificationsPerCalendarUnit:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__STUsageReporter_notificationsPerCalendarUnit___block_invoke;
  v8[3] = &unk_1E9371D70;
  v6 = v5;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a3, v8);

  return v6;
}

void __48__STUsageReporter_notificationsPerCalendarUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  STUsageDetailItem *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v7 = v7 + (float)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "numberOfNotifications");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  v9 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, CFSTR("__AllApps__"));
  *(float *)&v10 = v7;
  -[STUsageDetailItem setQuantity:](v9, "setQuantity:", v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

- (id)notificationRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__STUsageReporter_notificationRatiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E9371DC0;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  -[STUsageReporter _enumerateUsageBlocksWithUnitGranularity:block:](self, "_enumerateUsageBlocksWithUnitGranularity:block:", a4, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __68__STUsageReporter_notificationRatiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t i;
  void *v10;
  float v11;
  void *v12;
  int v13;
  float v14;
  STUsageDetailItem *v15;
  STUsageDetailItem *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (float)objc_msgSend(v10, "numberOfNotifications");
        objc_msgSend(v10, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v13)
          v14 = v11;
        else
          v14 = -0.0;
        v8 = v8 + v14;
        v7 = v7 + v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }

  v15 = -[STUsageDetailItem initWithType:identifier:]([STUsageDetailItem alloc], "initWithType:identifier:", 1, *(_QWORD *)(a1 + 32));
  v16 = v15;
  *(float *)&v17 = v8 / v7;
  if (v7 == 0.0)
    *(float *)&v17 = v7;
  -[STUsageDetailItem setQuantity:](v15, "setQuantity:", v17);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);

}

- (void)_enumerateUsageBlocksWithUnitGranularity:(unint64_t)a3 block:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, void *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = (void (**)(id, void *))a4;
  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReporter dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v23 = v8;
  objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v24 = (void *)v9;
  for (i = (void *)v9; objc_msgSend(v10, "compare:", i) == -1; i = v24)
  {
    v13 = v11;
    objc_msgSend(v25, "dateByAddingUnit:value:toDate:options:", a3, 1, v11, 512);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = v26;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      while (2)
      {
        v19 = a3;
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v21, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "compare:", v22) == 1 || objc_msgSend(v22, "compare:", v11) != -1)
          {

            a3 = v19;
            goto LABEL_14;
          }
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        a3 = v19;
        if (v17)
          continue;
        break;
      }
    }
LABEL_14:

    v27[2](v27, v14);
    objc_msgSend(v15, "removeObjectsInArray:", v14);

    v10 = v11;
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STUsageReporter fetchedResultsController](self, "fetchedResultsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("totalScreenTime"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("totalNotifications"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("totalPickups"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("categoryUsage"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("applicationAndWebUsage"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pickups"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("notifications"));
    -[STUsageReporter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("firstPickup"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("totalScreenTime"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("totalNotifications"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("totalPickups"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("categoryUsage"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("applicationAndWebUsage"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pickups"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("notifications"));
    -[STUsageReporter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("firstPickup"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("UsageReporterDidChangeContent"), self);

    goto LABEL_5;
  }
  -[STUsageReporter installedAppsController](self, "installedAppsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 == v8)
  {
    -[STUsageReporter _updateInstalledBundleIdentifiers](self, "_updateInstalledBundleIdentifiers");
LABEL_5:
    v6 = v8;
  }

}

- (void)_updateInstalledBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  STUsageReporter *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[STUsageReporter installedAppsController](self, "installedAppsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0D0D510], "sharedCategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke;
  v14[3] = &unk_1E9371210;
  v15 = v3;
  v16 = self;
  v13 = v3;
  objc_msgSend(v11, "categoriesForBundleIDs:completionHandler:", v12, v14);

}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_2;
    v21[3] = &unk_1E9371E30;
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v21);

  }
  else
  {
    +[STLog usage](STLog, "usage");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "installedBundleIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToSet:", v15);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_53;
    v19[3] = &unk_1E93719C8;
    v19[4] = *(_QWORD *)(a1 + 40);
    v20 = v15;
    objc_msgSend(v18, "addOperationWithBlock:", v19);

  }
}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "equivalentBundleIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

uint64_t __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInstalledBundleIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (BOOL)includeTotalUsageDetailItem
{
  return self->_includeTotalUsageDetailItem;
}

- (void)setIncludeTotalUsageDetailItem:(BOOL)a3
{
  self->_includeTotalUsageDetailItem = a3;
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)userDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSFetchedResultsController)fetchedResultsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstalledAppsController:(id)a3
{
  objc_storeStrong((id *)&self->_installedAppsController, a3);
}

- (NSSet)installedBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInstalledBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedAppsController, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)installedAppsController
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to fetch installed apps: %{public}@", a5, a6, a7, a8, 2u);
}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to fetch categories for installed apps: %{public}@", a5, a6, a7, a8, 2u);
}

@end
