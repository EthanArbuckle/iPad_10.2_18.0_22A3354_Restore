@implementation ICFixTombstonesWithoutAccountsLaunchTask

- (void)runLaunchTask
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E5D58;
  v3[3] = &unk_10054FE80;
  v3[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v2 = v4;
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

- (void)fixTombstonesWithNilAccountWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _QWORD v38[2];

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10040B480(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("account == nil")));
  v38[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("markedForDeletion == NO")));
  v38[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyTombstone ic_objectsMatchingPredicate:context:](ICLegacyTombstone, "ic_objectsMatchingPredicate:context:", v8, v3));
  v10 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10040B410(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", v3));
  if (objc_msgSend(v11, "count") == (id)1)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    if (v12)
    {
      v13 = (void *)v12;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = (os_log_t)objc_msgSend(v9, "copy");
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v15)
      {
        v16 = v15;
        v24 = v11;
        v25 = v9;
        v26 = v8;
        v27 = v7;
        v28 = v3;
        v17 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "account"));
            if (!v20)
            {
              v21 = os_log_create("com.apple.notes", "LaunchTask");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ic_loggingDescription"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "identifier"));
                *(_DWORD *)buf = 138412546;
                v34 = v22;
                v35 = 2112;
                v36 = v23;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found tombstone %@ without an account, will move to account %@.", buf, 0x16u);

              }
              objc_msgSend(v19, "setAccount:", v13);
            }

          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v16);
        v7 = v27;
        v3 = v28;
        v9 = v25;
        v8 = v26;
        v11 = v24;
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    v14 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_10040B3A0(v9);
    v13 = v14;
    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v3, "ic_save");

}

@end
