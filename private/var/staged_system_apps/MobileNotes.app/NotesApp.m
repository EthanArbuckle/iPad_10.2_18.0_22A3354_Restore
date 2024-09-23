@implementation NotesApp

- (void)setupApplication
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (!-[NotesApp didSetupApplication](self, "didSetupApplication"))
  {
    self->_didSetupApplication = 1;
    +[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
    -[NotesApp setNoteContext:](self, "setNoteContext:");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesApp noteContext](self, "noteContext"));
    objc_msgSend(v3, "enableChangeLogging:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesApp noteContext](self, "noteContext"));
    objc_msgSend(v4, "setHasPriorityInSaveConflicts:", 1);

    v5 = objc_msgSend(objc_alloc((Class)NoteContext), "initWithPrivateQueue");
    -[NotesApp setBackgroundNoteContext:](self, "setBackgroundNoteContext:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesApp backgroundNoteContext](self, "backgroundNoteContext"));
    v7 = objc_msgSend(v6, "newFRCForAccountsWithDelegate:", self);
    -[NotesApp setAccountsFetchedResultsController:](self, "setAccountsFetchedResultsController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesApp backgroundNoteContext](self, "backgroundNoteContext"));
    v9 = objc_msgSend(v8, "newFRCForStoresWithDelegate:", self);
    -[NotesApp setStoresFetchedResultsController:](self, "setStoresFetchedResultsController:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities"));
    objc_msgSend(v10, "startKeepingAccountInfosUpToDate");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = objc_msgSend(v11, "applicationState");

    if (v12 != (id)2)
    {
      -[NotesApp refreshOrphanedAccountsIfNeeded](self, "refreshOrphanedAccountsIfNeeded");
      -[NotesApp refreshStoresListIfNeeded](self, "refreshStoresListIfNeeded");
    }

  }
}

- (void)setupApplicationIfNecessary
{
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[NotesApp setShouldSetupApplicationWhenEnteringForeground:](self, "setShouldSetupApplicationWhenEnteringForeground:", 1);
  }
  else if (!-[NotesApp didSetupApplication](self, "didSetupApplication"))
  {
    -[NotesApp setupApplication](self, "setupApplication");
  }
}

- (void)setStoresFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_storesFetchedResultsController, a3);
}

- (void)setNoteContext:(id)a3
{
  objc_storeStrong((id *)&self->_noteContext, a3);
}

- (void)setBackgroundNoteContext:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundNoteContext, a3);
}

- (void)setAccountsFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_accountsFetchedResultsController, a3);
}

- (void)refreshStoresListIfNeeded
{
  if (!-[NotesApp _refreshIsPendingForStoresList](self, "_refreshIsPendingForStoresList"))
  {
    -[NotesApp _markRefreshAsPendingForStoresList](self, "_markRefreshAsPendingForStoresList");
    -[NotesApp performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_performRefreshIfNeededForStoresList", 0, 3.0);
  }
}

- (NoteContext)noteContext
{
  -[NotesApp setupApplicationIfNecessary](self, "setupApplicationIfNecessary");
  return self->_noteContext;
}

- (BOOL)didSetupApplication
{
  return self->_didSetupApplication;
}

- (NoteContext)backgroundNoteContext
{
  return self->_backgroundNoteContext;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if ((+[ICNoteContext legacyNotesDisabled](ICNoteContext, "legacyNotesDisabled", a3, a4) & 1) == 0)
    -[NotesApp setupApplication](self, "setupApplication");
  +[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
  return 1;
}

- (BOOL)_refreshIsPendingForStoresList
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)_markRefreshAsPendingForStoresList
{
  *((_BYTE *)self + 8) |= 2u;
}

+ (id)sharedNotesApp
{
  if (qword_1005DDFC0 != -1)
    dispatch_once(&qword_1005DDFC0, &stru_100554D78);
  return (id)qword_1005DDFB8;
}

- (void)dealloc
{
  objc_super v3;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)NotesApp;
  -[NotesApp dealloc](&v3, "dealloc");
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  return CFSTR("Default");
}

- (void)applicationDidEnterBackground:(id)a3
{
  -[NotesApp _cancelAllPendingRefreshes](self, "_cancelAllPendingRefreshes", a3);
}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v4;

  *((_BYTE *)self + 8) &= ~1u;
  if (-[NotesApp shouldSetupApplicationWhenEnteringForeground](self, "shouldSetupApplicationWhenEnteringForeground", a3))
  {
    -[NotesApp setupApplication](self, "setupApplication");
    -[NotesApp setShouldSetupApplicationWhenEnteringForeground:](self, "setShouldSetupApplicationWhenEnteringForeground:", 0);
  }
  if (-[NotesApp didSetupApplication](self, "didSetupApplication"))
  {
    -[NotesApp refreshOrphanedAccountsIfNeeded](self, "refreshOrphanedAccountsIfNeeded");
    -[NotesApp refreshStoresListIfNeeded](self, "refreshStoresListIfNeeded");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesApp noteContext](self, "noteContext"));
    objc_msgSend(v4, "resetNotificationCount");

    -[NotesApp updateAccountMigrationStates](self, "updateAccountMigrationStates");
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9;
  _QWORD v10[4];
  id v11;
  NotesApp *v12;
  unint64_t v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F8CDC;
  v10[3] = &unk_100554DA0;
  v11 = a3;
  v12 = self;
  v13 = a6;
  v9 = v11;
  performBlockOnMainThread(v10);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  NotesApp *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F8DF4;
  v5[3] = &unk_10054FE80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  performBlockOnMainThread(v5);

}

- (void)_unmarkRefreshAsPendingForCollectionWithId:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_collectionIDsPendingRefresh, "removeObject:");
  else
    *((_BYTE *)self + 8) &= ~4u;
}

- (void)_performRefreshIfNeededForCollectionWithId:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NotesApp _unmarkRefreshAsPendingForCollectionWithId:](self, "_unmarkRefreshAsPendingForCollectionWithId:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NotesRefreshController sharedInstance](NotesRefreshController, "sharedInstance"));
  v5 = v4;
  if (v6)
  {
    if (objc_msgSend(v4, "notesNeedRefreshForCollectionWithID:", v6))
      objc_msgSend(v5, "refreshNotesForCollectionWithID:", v6);
  }
  else
  {
    objc_msgSend(v4, "refreshAllNotesIfNeeded");
  }

}

- (BOOL)_refreshIsPendingForCollectionWithId:(id)a3
{
  int v3;

  if (a3)
    LOBYTE(v3) = -[NSMutableSet containsObject:](self->_collectionIDsPendingRefresh, "containsObject:");
  else
    return (*((unsigned __int8 *)self + 8) >> 2) & 1;
  return v3;
}

- (void)_markRefreshAsPendingForCollectionWithId:(id)a3
{
  id v4;
  NSMutableSet *collectionIDsPendingRefresh;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    collectionIDsPendingRefresh = self->_collectionIDsPendingRefresh;
    v8 = v4;
    if (!collectionIDsPendingRefresh)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_collectionIDsPendingRefresh;
      self->_collectionIDsPendingRefresh = v6;

      collectionIDsPendingRefresh = self->_collectionIDsPendingRefresh;
    }
    -[NSMutableSet addObject:](collectionIDsPendingRefresh, "addObject:", v8);
    v4 = v8;
  }
  else
  {
    *((_BYTE *)self + 8) |= 4u;
  }

}

- (void)refreshNotesIfNeededForCollection:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectID"));
  if (!-[NotesApp _refreshIsPendingForCollectionWithId:](self, "_refreshIsPendingForCollectionWithId:"))
  {
    -[NotesApp _markRefreshAsPendingForCollectionWithId:](self, "_markRefreshAsPendingForCollectionWithId:", v4);
    -[NotesApp performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_performRefreshIfNeededForCollectionWithId:", v4, 3.0);
  }

}

- (void)_unmarkRefreshAsPendingForStoresList
{
  *((_BYTE *)self + 8) &= ~2u;
}

- (void)_performRefreshIfNeededForStoresList
{
  id v2;

  -[NotesApp _unmarkRefreshAsPendingForStoresList](self, "_unmarkRefreshAsPendingForStoresList");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NotesRefreshController sharedInstance](NotesRefreshController, "sharedInstance"));
  if (objc_msgSend(v2, "storesListNeedsRefresh"))
    objc_msgSend(v2, "refreshStoresList");

}

- (void)_performRefreshIfNeededForOrphanedAccounts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NotesRefreshController sharedInstance](NotesRefreshController, "sharedInstance"));
  objc_msgSend(v2, "refreshOrphanedAccounts");

}

- (void)refreshOrphanedAccountsIfNeeded
{
  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_performRefreshIfNeededForOrphanedAccounts", 0);
  -[NotesApp performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_performRefreshIfNeededForOrphanedAccounts", 0, 3.0);
}

- (void)updateAccountMigrationStates
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_100554DC0);

}

- (void)_cancelAllPendingRefreshes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[NotesApp _refreshIsPendingForCollectionWithId:](self, "_refreshIsPendingForCollectionWithId:", 0))
  {
    objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_performRefreshIfNeededForCollectionWithId:", 0);
    -[NotesApp _unmarkRefreshAsPendingForCollectionWithId:](self, "_unmarkRefreshAsPendingForCollectionWithId:", 0);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", self->_collectionIDsPendingRefresh));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_performRefreshIfNeededForCollectionWithId:", v8);
        -[NotesApp _unmarkRefreshAsPendingForCollectionWithId:](self, "_unmarkRefreshAsPendingForCollectionWithId:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  if (-[NotesApp _refreshIsPendingForStoresList](self, "_refreshIsPendingForStoresList"))
  {
    objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_performRefreshIfNeededForStoresList", 0);
    -[NotesApp _unmarkRefreshAsPendingForStoresList](self, "_unmarkRefreshAsPendingForStoresList");
  }
  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_performRefreshIfNeededForOrphanedAccounts", 0);

}

- (UINavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (NSFetchedResultsController)accountsFetchedResultsController
{
  return self->_accountsFetchedResultsController;
}

- (NSFetchedResultsController)storesFetchedResultsController
{
  return self->_storesFetchedResultsController;
}

- (BOOL)shouldSetupApplicationWhenEnteringForeground
{
  return self->_shouldSetupApplicationWhenEnteringForeground;
}

- (void)setShouldSetupApplicationWhenEnteringForeground:(BOOL)a3
{
  self->_shouldSetupApplicationWhenEnteringForeground = a3;
}

- (BOOL)accountsListNeedsUpdate
{
  return self->_accountsListNeedsUpdate;
}

- (void)setAccountsListNeedsUpdate:(BOOL)a3
{
  self->_accountsListNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_accountsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_backgroundNoteContext, 0);
  objc_storeStrong((id *)&self->_noteContext, 0);
  objc_storeStrong((id *)&self->_detailNavigationController, 0);
  objc_storeStrong((id *)&self->_collectionIDsPendingRefresh, 0);
}

@end
