@implementation ICFixNotesWithoutFoldersLaunchTask

- (void)runLaunchTask
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E3D84;
  v3[3] = &unk_10054FE80;
  v3[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v2 = v4;
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

- (void)fixNotesWithNilFolderWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint8_t v49[4];
  uint64_t v50;
  _BYTE v51[128];
  _QWORD v52[2];

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10040B100(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("folder == nil")));
  v52[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudSyncingObject predicateForVisibleObjects](ICCloudSyncingObject, "predicateForVisibleObjects"));
  v52[1] = v13;
  v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2));

  v36 = (void *)v14;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:"));
  v16 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_10040B090(v15);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = v15;
  obj = objc_msgSend(v15, "copy");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    v37 = v3;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "account"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "defaultFolder"));
        if (!v22)
        {
          v24 = os_log_create("com.apple.notes", "LaunchTask");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            sub_10040B01C(v49, v21, &v50, v24);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v3));
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "defaultFolder"));

          v23 = (void *)v25;
        }
        v26 = os_log_create("com.apple.notes", "LaunchTask");
        v27 = v26;
        if (v23)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_loggingDescription"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            *(_DWORD *)buf = 138412802;
            v44 = v29;
            v45 = 2112;
            v46 = v30;
            v47 = 2112;
            v48 = v31;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Moving note %@ without a folder to the default folder %@ in account %@.", buf, 0x20u);

            v3 = v37;
          }

          objc_msgSend(v21, "setFolder:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v21, "setFolderModificationDate:", v28);

          objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Moved to default folder"));
        }
        else
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_loggingDescription"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
            *(_DWORD *)buf = 138412546;
            v44 = v32;
            v45 = 2112;
            v46 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Couldn't move note %@ without a folder because default folder is nil in account %@.", buf, 0x16u);

            v3 = v37;
          }

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v18);
  }

  objc_msgSend(v3, "ic_save");
}

- (void)fixNotesWithPlaceholderFoldersWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10040B1A4(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("folder != nil")));
  v47[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("folder.needsInitialFetchFromCloud == YES")));
  v47[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("markedForDeletion == NO")));
  v47[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("needsInitialFetchFromCloud == NO")));
  v47[3] = v15;
  v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));

  v33 = (void *)v16;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));
  v34 = v3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:"));
  v18 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_10040B134(v17);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v17;
  v19 = objc_msgSend(v17, "copy");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    v35 = v19;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "account"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "folder"));
        v27 = os_log_create("com.apple.notes", "LaunchTask");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ic_loggingDescription"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
          *(_DWORD *)buf = 138412802;
          v41 = v28;
          v42 = 2112;
          v43 = v29;
          v44 = 2112;
          v45 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Fetching note %@ and its placeholder folder %@ in account %@.", buf, 0x20u);

          v19 = v35;
        }

        objc_msgSend(v26, "setNeedsToBeFetchedFromCloud:", 1);
        objc_msgSend(v24, "setNeedsToBeFetchedFromCloud:", 1);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v21);
  }

  objc_msgSend(v34, "ic_save");
}

@end
