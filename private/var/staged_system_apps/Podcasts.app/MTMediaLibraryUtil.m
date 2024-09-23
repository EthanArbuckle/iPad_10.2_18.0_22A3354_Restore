@implementation MTMediaLibraryUtil

+ (void)updateMediaLibraryItem:(unint64_t)a3 playhead:(double)a4 playState:(int64_t)a5 playCount:(int64_t)a6
{
  void *v10;
  _QWORD v11[8];

  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryTransactionManager sharedInstance](MTMediaLibraryTransactionManager, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B15F4;
    v11[3] = &unk_1004A9560;
    v11[4] = a3;
    *(double *)&v11[5] = a4;
    v11[6] = a5;
    v11[7] = a6;
    objc_msgSend(v10, "requestMediaLibraryReadTransaction:", v11);

  }
}

+ (id)pendingDeletionPersistentIds
{
  if (qword_100567410 != -1)
    dispatch_once(&qword_100567410, &stru_1004A9580);
  return (id)qword_100567408;
}

+ (BOOL)isDeletingPersistentId:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  unint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v11 = _MTLogCategoryDownload(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isDeletingPersistentId %llu", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_sync_exit(v5);

  return v8;
}

+ (void)willDeletePersistentId:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  unint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_msgSend(v6, "addObject:", v7);

  v10 = _MTLogCategoryDownload(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "willDeletePersistentId %llu", (uint8_t *)&v12, 0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)didDeletePersistentId:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  unint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pendingDeletionPersistentIds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_msgSend(v6, "removeObject:", v7);

  v10 = _MTLogCategoryDownload(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "didDeletePersistentId %llu", (uint8_t *)&v12, 0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)deleteMediaItems:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = _MTLogCategoryMediaLibrary(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = objc_msgSend(v5, "count");
    v27 = 2114;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting %lu pids %{public}@ from MediaLibrary", buf, 0x16u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        +[MTMediaLibraryUtil willDeletePersistentId:](MTMediaLibraryUtil, "willDeletePersistentId:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "unsignedLongLongValue"));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryTransactionManager sharedInstance](MTMediaLibraryTransactionManager, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B1F1C;
  v17[3] = &unk_1004A95D0;
  v18 = v9;
  v19 = v6;
  v15 = v6;
  v16 = v9;
  objc_msgSend(v14, "requestMediaLibraryReadTransaction:", v17);

}

@end
