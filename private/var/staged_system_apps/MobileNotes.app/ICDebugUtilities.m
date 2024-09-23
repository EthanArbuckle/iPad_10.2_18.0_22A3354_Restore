@implementation ICDebugUtilities

+ (void)purgeEverythingWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000900A0;
  v6[3] = &unk_10054FFA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "cancelAllOperationsWithCompletionHandler:", v6);

}

+ (void)deleteEverythingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

  objc_msgSend(v6, "performBlockAndWait:", &stru_1005527F8);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000903B0;
  v9[3] = &unk_100552868;
  v12 = v14;
  v13 = a1;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", v6));
  v10 = v7;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  _Block_object_dispose(v14, 8);
}

+ (void)deleteZonesWithZoneIDs:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100090700;
  v17[3] = &unk_1005528E0;
  v18 = v11;
  v19 = v8;
  v21 = v10;
  v22 = a1;
  v20 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  objc_msgSend(v12, "cancelAllOperationsWithCompletionHandler:", v17);

}

+ (void)showAlertForError:(id)a3 title:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  objc_msgSend(a1, "showAlertWithTitle:description:", v6, v7);

}

+ (void)showAlertWithTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100090B50;
  v7[3] = &unk_10054FE80;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

+ (void)startFreshWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  uint8_t *v17;
  id v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  id v22;

  v4 = (void (**)(_QWORD))a3;
  v5 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100409534(v5);

  v6 = objc_msgSend(v4, "copy");
  +[ICMigrationController setDidChooseToMigrateLocalAccount:](ICMigrationController, "setDidChooseToMigrateLocalAccount:", 0);
  +[ICMigrationController setDidMigrateLocalAccount:](ICMigrationController, "setDidMigrateLocalAccount:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", ICMigrationStateWillChangeNotification, 0);

  +[ICStartupController setHasShownWelcomeScreen:](ICStartupController, "setHasShownWelcomeScreen:", 0);
  +[ICNoteContext setLegacyNotesDisabled:](ICNoteContext, "setLegacyNotesDisabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allCloudKitAccountsInContext:](ICAccount, "allCloudKitAccountsInContext:", v9));

  if (objc_msgSend(v10, "count"))
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v22 = objc_msgSend(v10, "count");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100090EE4;
    v12[3] = &unk_100552A08;
    v17 = buf;
    v18 = a1;
    v13 = v8;
    v14 = v10;
    v15 = v4;
    v16 = v6;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v12);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Trying to reset migration without a CloudKit account", buf, 2u);
    }

    objc_msgSend(a1, "showAlertWithTitle:description:", CFSTR("No CloudKit account to reset"), CFSTR("Cannot reset migration without a CloudKit account."));
    if (v4)
      v4[2](v4);
  }

}

+ (void)pushEverythingToCloud
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "snapshotManagedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100091860;
  v6[3] = &unk_100550110;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "performBlockAndWait:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v4, "processAllCloudObjectsWithCompletionHandler:", 0);

}

+ (void)markEverythingNeedToBeFetched
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v2, "performSnapshotBackgroundTask:", &stru_100552A68);

}

+ (id)stateOfTheWorld
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICDatabaseStateHandler stateDictionary](ICDatabaseStateHandler, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

+ (void)deleteInvalidObjects
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Deleting invalid objects", buf, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100091B38;
  v6[3] = &unk_100550110;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

+ (void)deleteMigratedDuplicatesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting duplicate legacy notes", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  global_queue = dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091E5C;
  block[3] = &unk_100552AD8;
  v13 = v4;
  v14 = a1;
  v12 = v6;
  v9 = v4;
  v10 = v6;
  dispatch_async(v8, block);

}

@end
