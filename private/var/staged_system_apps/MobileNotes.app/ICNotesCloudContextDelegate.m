@implementation ICNotesCloudContextDelegate

- (ICQInAppMessage)syncMessage
{
  return self->_syncMessage;
}

- (ICNotesCloudContextDelegate)init
{
  ICNotesCloudContextDelegate *v2;
  uint64_t v3;
  NSMutableSet *quotaExceededRecordIDs;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNotesCloudContextDelegate;
  v2 = -[ICNotesCloudContextDelegate init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    quotaExceededRecordIDs = v2->_quotaExceededRecordIDs;
    v2->_quotaExceededRecordIDs = (NSMutableSet *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "accountsDidChange:", ICAccountsDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNotesCloudContextDelegate;
  -[ICNotesCloudContextDelegate dealloc](&v4, "dealloc");
}

- (void)registerForSyncMessages
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_msgSend(sub_10006BF6C(), "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "observeUpdates");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v6 = (_QWORD *)qword_1005DDD70;
  v12 = qword_1005DDD70;
  if (!qword_1005DDD70)
  {
    v7 = (void *)sub_10006F108();
    v6 = dlsym(v7, "ICQCurrentInAppMessageChangedNotification");
    v10[3] = (uint64_t)v6;
    qword_1005DDD70 = (uint64_t)v6;
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
  {
    v8 = (_Unwind_Exception *)sub_100406714();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "updateSyncMessage", *v6, 0, v9);

}

- (void)cloudContext:(id)a3 didExceedQuotaForRecordID:(id)a4 accountID:(id)a5
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesCloudContextDelegate quotaExceededRecordIDs](self, "quotaExceededRecordIDs"));
  objc_msgSend(v7, "addObject:", v6);

  -[ICNotesCloudContextDelegate updateSyncMessage](self, "updateSyncMessage");
}

- (void)cloudContext:(id)a3 didPushRecordID:(id)a4 accountID:(id)a5
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesCloudContextDelegate quotaExceededRecordIDs](self, "quotaExceededRecordIDs"));
  objc_msgSend(v7, "removeObject:", v6);

  -[ICNotesCloudContextDelegate updateSyncMessage](self, "updateSyncMessage");
}

- (BOOL)hasExceededQuota
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotesCloudContextDelegate quotaExceededRecordIDs](self, "quotaExceededRecordIDs"));
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &stru_100551B78);

  return v3;
}

- (void)updateSyncMessage
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  if (+[ICAccount isCloudKitAccountAvailable](ICAccount, "isCloudKitAccountAvailable")
    && !+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
  {
    objc_initWeak(&location, self);
    v3 = objc_msgSend(sub_10006BF6C(), "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006C214;
    v5[3] = &unk_100551BC8;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    objc_msgSend(v4, "fetchMessageWithCompletion:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ICNotesCloudContextDelegate setSyncMessage:](self, "setSyncMessage:", 0);
  }
}

- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  ICNotesCloudContextDelegate *v25;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext notesZoneID](ICCloudContext, "notesZoneID"));
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshotManagedObjectContext"));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006C7B4;
    v22[3] = &unk_100550020;
    v23 = v8;
    v24 = v12;
    v25 = self;
    v13 = v12;
    objc_msgSend(v13, "performBlockAndWait:", v22);

    v14 = v23;
LABEL_5:

    goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext metadataZoneID](ICCloudContext, "metadataZoneID"));
  v16 = objc_msgSend(v7, "isEqual:", v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "managedObjectContext"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006C9D0;
    v19[3] = &unk_10054FE80;
    v20 = v8;
    v21 = v17;
    v13 = v17;
    objc_msgSend(v18, "performBlock:", v19);

    v14 = v20;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) != 0)
  {
LABEL_13:
    v10 = 1;
    goto LABEL_19;
  }
  if ((objc_msgSend(v4, "hasSuccessfullyPushedLatestVersionToCloud") & 1) != 0
    || (objc_msgSend(v4, "markedForDeletion") & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsToBeDeletedBeforeThisObject", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          if (!-[ICNotesCloudContextDelegate deleteCloudObjectIfFullyPushed:](self, "deleteCloudObjectIfFullyPushed:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)))
          {

            goto LABEL_18;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "deleteFromLocalDatabase");
    goto LABEL_13;
  }
  v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100406880(v4);

LABEL_18:
  v10 = 0;
LABEL_19:

  return v10;
}

- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a5;
  v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100406924(v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006CE6C;
  v14[3] = &unk_100550020;
  v15 = v7;
  v16 = v9;
  v17 = v6;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  objc_msgSend(v10, "performBlock:", v14);

}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v6 = a4;
  v7 = a5;
  v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %@: %@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotManagedObjectContext"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D3DC;
  v15[3] = &unk_100550020;
  v16 = v6;
  v17 = v11;
  v18 = v7;
  v12 = v7;
  v13 = v11;
  v14 = v6;
  objc_msgSend(v13, "performBlockAndWait:", v15);

}

- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotManagedObjectContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006D7B8;
  v13[3] = &unk_100550020;
  v14 = v7;
  v15 = v9;
  v16 = v6;
  v10 = v6;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v11, "performBlockAndWait:", v13);

}

- (void)cloudContext:(id)a3 didFetchShare:(id)a4 accountID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  if (a4)
  {
    v7 = a5;
    v8 = a4;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "ic_setNonNilObject:forNonNilKey:", v8, ICNotesCloudContextDidFetchShareNotificationShareKey);

    objc_msgSend(v12, "ic_setNonNilObject:forNonNilKey:", v7, ICNotesCloudContextDidFetchShareNotificationAccountIDKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = ICNotesCloudContextDidFetchShareNotification;
    v11 = objc_msgSend(v12, "copy");
    objc_msgSend(v9, "postNotificationName:object:userInfo:", v10, self, v11);

  }
}

- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10006DC20;
  v20 = sub_10006DC30;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10006DC38;
  v13 = &unk_100550298;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v7, "performBlockAndWait:", &v10);
  v8 = objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)persistentStoreCoordinatorForCloudContext:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));

  return v4;
}

- (id)viewContextForCloudContext:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  return v4;
}

- (id)backgroundContextForCloudContext:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  return v4;
}

- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  LOBYTE(a4) = objc_msgSend(v5, "hasContextOptions:", a4);

  return a4;
}

- (void)syncPasswordProtectedNotesIfNecessary
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[8];
  _QWORD v15[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100406B44();

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("lastKnownOperatingSystemVersion")));

  v5 = os_log_create("com.apple.notes", "Cloud");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100406AE0();

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No previous OS version dictionary", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006E104;
    v15[3] = &unk_100550C10;
    v15[4] = buf;
    objc_msgSend(v8, "performBlockAndWait:", v15);
    v9 = v17[24];
    v10 = os_log_create("com.apple.notes", "Cloud");
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetching user record to check if we need to re-sync", v14, 2u);
      }

      v11 = objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v8));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v11, "identifier"));
      objc_msgSend(v12, "fetchUserRecordWithAccountID:completionHandler:", v13, &stru_100551C08);

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      sub_100406AB4();
    }

    _Block_object_dispose(buf, 8);
  }

}

- (void)updateAppleAccountBags
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DidUpdateAppleAccountProperties"));

  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100406BFC();
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("DidUpdateAppleAccountProperties"));

    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100406C28();

    v4 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accountTypeWithAccountTypeIdentifier:](v4, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierAppleAccount));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accountsWithAccountType:](v4, "accountsWithAccountType:"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "ic_isNotesMigrated") & 1) == 0
            && (objc_msgSend(v12, "ic_isPrimaryAppleAccount") & 1) == 0)
          {
            v13 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating account bag for %@", buf, 0xCu);
            }

            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_10006E7A0;
            v15[3] = &unk_100551C90;
            v15[4] = v12;
            -[NSObject aa_updatePropertiesForAppleAccount:completion:](v4, "aa_updatePropertiesForAppleAccount:completion:", v12, v15);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v9);
    }

  }
}

- (void)fixGallerySubAttachmentsIfNecessary
{
  void *v3;
  unsigned __int8 v4;
  NSObject *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DidFixGallerySubAttachments"));

  if ((v4 & 1) != 0)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100406CC0();

  }
  else
  {
    -[ICNotesCloudContextDelegate fixGallerySubAttachments](self, "fixGallerySubAttachments");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("DidFixGallerySubAttachments"));

  }
}

- (void)fixGallerySubAttachments
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100406CEC();

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006EA34;
  v6[3] = &unk_100550110;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)accountsDidChange:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  id *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  void *v12;
  _QWORD v13[4];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext", a3));
  objc_msgSend(v3, "clearContainers");
  objc_msgSend(v3, "setNeedsToUpdateSubscriptions:", 1);
  objc_msgSend(v3, "clearSubscribedSubscriptionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operationQueue"));
  if (!objc_msgSend(v4, "operationCount"))
  {

    goto LABEL_7;
  }
  v5 = +[ICAccount isCloudKitAccountAvailable](ICAccount, "isCloudKitAccountAvailable");

  if ((v5 & 1) != 0)
  {
LABEL_7:
    global_queue = dispatch_get_global_queue(-2, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006EEA8;
    v11[3] = &unk_100550110;
    v7 = &v12;
    v12 = v3;
    v10 = v3;
    dispatch_async(v9, v11);

    goto LABEL_8;
  }
  v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100406E34();

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006EEA0;
  v13[3] = &unk_100550110;
  v7 = &v14;
  v14 = v3;
  objc_msgSend(v3, "cancelEverythingWithCompletionHandler:", v13);
LABEL_8:

}

- (void)updateLastOSVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v10[0] = CFSTR("majorVersion");
  v10[1] = CFSTR("minorVersion");
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = CFSTR("patchVersion");
  v11[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("lastKnownOperatingSystemVersion"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "synchronize");

}

- (void)setSyncMessage:(id)a3
{
  objc_storeStrong((id *)&self->_syncMessage, a3);
}

- (NSMutableSet)quotaExceededRecordIDs
{
  return self->_quotaExceededRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaExceededRecordIDs, 0);
  objc_storeStrong((id *)&self->_syncMessage, 0);
}

@end
