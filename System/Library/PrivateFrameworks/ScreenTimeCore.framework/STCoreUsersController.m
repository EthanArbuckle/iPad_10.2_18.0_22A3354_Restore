@implementation STCoreUsersController

- (STCoreUsersController)initWithManagedObjectContext:(id)a3
{
  NSManagedObjectContext *v4;
  STCoreUsersController *v5;
  NSManagedObjectContext *managedObjectContext;
  objc_super v8;

  v4 = (NSManagedObjectContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCoreUsersController;
  v5 = -[STCoreUsersController init](&v8, sel_init);
  managedObjectContext = v5->_managedObjectContext;
  v5->_managedObjectContext = v4;

  return v5;
}

+ (id)keyPathsForValuesAffectingLocalUser
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("localUserController"));
}

- (STCoreUser)localUser
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v9;

  -[STCoreUsersController localUserController](self, "localUserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCoreUsersController.m"), 54, CFSTR("No local user in database"));

  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    +[STLog screentime](STLog, "screentime");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[STCoreUsersController localUser].cold.1((uint64_t)v5, v6);

  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (STCoreUser *)v7;
}

- (NSFetchedResultsController)localUserController
{
  NSFetchedResultsController *localUserController;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSFetchedResultsController *v10;
  NSFetchedResultsController *v11;
  NSFetchedResultsController *v12;
  id v13;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  localUserController = self->_localUserController;
  if (!localUserController)
  {
    +[STCoreUser fetchRequestMatchingLocalUser](STCoreUser, "fetchRequestMatchingLocalUser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("givenName"), 1);
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v7);

    objc_msgSend(v5, "setShouldRefreshRefetchedObjects:", 1);
    v8 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[STCoreUsersController managedObjectContext](self, "managedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (NSFetchedResultsController *)objc_msgSend(v8, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v9, 0, 0);
    v11 = self->_localUserController;
    self->_localUserController = v10;

    -[NSFetchedResultsController setDelegate:](self->_localUserController, "setDelegate:", self);
    v12 = self->_localUserController;
    v16 = 0;
    LOBYTE(v9) = -[NSFetchedResultsController performFetch:](v12, "performFetch:", &v16);
    v13 = v16;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCoreUsersController.m"), 76, CFSTR("Failed to fetch the local user: %@"), v13);

    }
    localUserController = self->_localUserController;
  }
  return localUserController;
}

+ (id)keyPathsForValuesAffectingUsers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("localUser.isParent"), CFSTR("localUser.isFamilyOrganizer"), CFSTR("childUserController"), 0);
}

- (NSArray)users
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[STCoreUsersController localUser](self, "localUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUsersController managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__STCoreUsersController_users__block_invoke;
  v10[3] = &unk_1E93714A0;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v10);

  if (*((_BYTE *)v14 + 24))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
    -[STCoreUsersController childUserController](self, "childUserController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  else
  {
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v6;
}

uint64_t __30__STCoreUsersController_users__block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isParent") & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(*(id *)(a1 + 32), "isFamilyOrganizer");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSFetchedResultsController)childUserController
{
  NSFetchedResultsController *childUserController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSFetchedResultsController *v11;
  NSFetchedResultsController *v12;
  NSFetchedResultsController *v13;
  id v14;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  childUserController = self->_childUserController;
  if (!childUserController)
  {
    +[STCoreUser fetchRequest](STCoreUser, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == YES) || (%K == %@) || (%K == %@)"), CFSTR("familySettings.isManaged"), CFSTR("familyMemberType"), CFSTR("Child"), CFSTR("familyMemberType"), CFSTR("Teen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v6);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("givenName"), 1);
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v8);

    objc_msgSend(v5, "setShouldRefreshRefetchedObjects:", 1);
    v9 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[STCoreUsersController managedObjectContext](self, "managedObjectContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (NSFetchedResultsController *)objc_msgSend(v9, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v10, 0, 0);
    v12 = self->_childUserController;
    self->_childUserController = v11;

    -[NSFetchedResultsController setDelegate:](self->_childUserController, "setDelegate:", self);
    v13 = self->_childUserController;
    v17 = 0;
    LOBYTE(v10) = -[NSFetchedResultsController performFetch:](v13, "performFetch:", &v17);
    v14 = v17;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCoreUsersController.m"), 131, CFSTR("Failed to fetch child users: %@"), v14);

    }
    childUserController = self->_childUserController;
  }
  return childUserController;
}

+ (id)keyPathsForValuesAffectingSelectedUser
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("users"), CFSTR("selectedIndex"), 0);
}

- (STCoreUser)selectedUser
{
  void *v3;
  void *v4;

  -[STCoreUsersController users](self, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[STCoreUsersController selectedIndex](self, "selectedIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (STCoreUser *)v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  void *v6;
  unint64_t v7;
  void *v8;

  -[STCoreUsersController users](self, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCoreUsersController.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedIndex < self.users.count"));

  }
  self->_selectedIndex = a3;
}

- (BOOL)updateSelectedIndexForDSID:(id)a3
{
  return -[STCoreUsersController _updateSelectedIndexForDSID:isManaged:](self, "_updateSelectedIndexForDSID:isManaged:", a3, 0);
}

- (BOOL)updateSelectedIndexForChildDSID:(id)a3
{
  return -[STCoreUsersController _updateSelectedIndexForDSID:isManaged:](self, "_updateSelectedIndexForDSID:isManaged:", a3, 1);
}

- (BOOL)_updateSelectedIndexForDSID:(id)a3 isManaged:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  BOOL v17;

  v6 = a3;
  -[STCoreUsersController users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke;
  v15 = &unk_1E9371518;
  v8 = v6;
  v16 = v8;
  v17 = a4;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", &v12);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[STLog screentime](STLog, "screentime", v12, v13, v14, v15);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STCoreUsersController _updateSelectedIndexForDSID:isManaged:].cold.1((uint64_t)v8, self, v10);

  }
  else
  {
    -[STCoreUsersController setSelectedIndex:](self, "setSelectedIndex:", v9, v12, v13, v14, v15);
  }

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[3];
  char v19;

  v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke_40;
  v8[3] = &unk_1E93714F0;
  v10 = v18;
  v5 = v3;
  v9 = v5;
  v11 = &v12;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = objc_msgSend((id)v13[5], "isEqualToNumber:", *(_QWORD *)(a1 + 32));
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v18, 8);
  return v6;
}

void __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isManaged");
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)refresh
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[STCoreUsersController setLocalUserController:](self, "setLocalUserController:", 0);
  -[STCoreUsersController setChildUserController:](self, "setChildUserController:", 0);
  +[STScreenTimeSettings fetchRequest](STScreenTimeSettings, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("screenTimeEnabled"), 1);
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(v4, "setShouldRefreshRefetchedObjects:", 1);
  v7 = objc_alloc(MEMORY[0x1E0C97B68]);
  -[STCoreUsersController managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, v8, 0, 0);

  objc_msgSend(v9, "setDelegate:", self);
  -[STCoreUsersController setSettingsController:](self, "setSettingsController:", v9);
  v13 = 0;
  v10 = objc_msgSend(v9, "performFetch:", &v13);
  v11 = v13;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STCoreUsersController.m"), 204, CFSTR("Failed to fetch the local Screen Time settings: %@"), v11);

  }
}

- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3 forUser:(id)a4
{
  objc_msgSend(a4, "notifyServerOfScreenTimeEnabled:", a3);
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  -[STCoreUsersController localUserController](self, "localUserController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    v8 = CFSTR("localUser");
    goto LABEL_7;
  }
  -[STCoreUsersController childUserController](self, "childUserController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    v8 = CFSTR("users");
    goto LABEL_7;
  }
  -[STCoreUsersController settingsController](self, "settingsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    -[STCoreUsersController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localUser.screenTimeEnabled"));
    v8 = CFSTR("localUser.syncingEnabled");
LABEL_7:
    -[STCoreUsersController willChangeValueForKey:](self, "willChangeValueForKey:", v8);
    v7 = v9;
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  -[STCoreUsersController localUserController](self, "localUserController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    v8 = CFSTR("localUser");
    goto LABEL_7;
  }
  -[STCoreUsersController childUserController](self, "childUserController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    v8 = CFSTR("users");
    goto LABEL_7;
  }
  -[STCoreUsersController settingsController](self, "settingsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    -[STCoreUsersController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localUser.screenTimeEnabled"));
    v8 = CFSTR("localUser.syncingEnabled");
LABEL_7:
    -[STCoreUsersController didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    v7 = v9;
  }

}

- (void)setUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSelectedUser:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUser, a3);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalUserController:(id)a3
{
  objc_storeStrong((id *)&self->_localUserController, a3);
}

- (void)setChildUserController:(id)a3
{
  objc_storeStrong((id *)&self->_childUserController, a3);
}

- (NSFetchedResultsController)settingsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettingsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_childUserController, 0);
  objc_storeStrong((id *)&self->_localUserController, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_selectedUser, 0);
  objc_storeStrong((id *)&self->_users, 0);
}

- (void)localUser
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_FAULT, "Fetched more than one local user: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSelectedIndexForDSID:(NSObject *)a3 isManaged:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D22E7000, a3, OS_LOG_TYPE_ERROR, "Could not find user with dsid: %{public}@ in users: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
