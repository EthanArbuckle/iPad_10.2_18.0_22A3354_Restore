@implementation ICIndexRequestHandler

+ (void)initialize
{
  if ((id)objc_opt_class(ICIndexRequestHandler, a2) == a1 && qword_10000C5B0[0] != -1)
    dispatch_once(qword_10000C5B0, &stru_100008368);
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a4;
  +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 1);
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100006610();

  +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", &__kCFBooleanTrue, kICReindexOnLaunchKey);
  +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICReindexer reindexer](ICReindexer, "reindexer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003FC8;
  v8[3] = &unk_100008390;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "deleteAllSearchableItemsWithCompletionHandler:", v8);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a5;
  +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 2);
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000066D8((uint64_t)v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICReindexer reindexer](ICReindexer, "reindexer"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000415C;
  v12[3] = &unk_1000083B8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "reindexSearchableItemsWithObjectIDURIs:completionHandler:", v11, v12);

}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSString *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v21 = 138412802;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Asked for data for %@ with type %@ in %@", (uint8_t *)&v21, 0x20u);

  }
  if (-[ICIndexRequestHandler isValidItemIdentifier:typeIdentifier:](self, "isValidItemIdentifier:typeIdentifier:", v9, v10))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
    v13 = objc_msgSend(v12, "newContextsForAllDataSources");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForManagedObjectIDURI:inContexts:", v9, v13));
    if ((objc_opt_respondsToSelector(v14, "dataForTypeIdentifier:") & 1) != 0)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataForTypeIdentifier:", v10));
    else
      v15 = 0;
    v16 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_msgSend(v15, "length");
      v21 = 134218498;
      v22 = v20;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Returning %ld bytes for %@ with type %@", (uint8_t *)&v21, 0x20u);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSString *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v10 = a4;
  v11 = a5;
  v12 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v24 = NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138412802;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Asked for file URL for %@ with type %@ in %@", buf, 0x20u);

  }
  if (-[ICIndexRequestHandler isValidItemIdentifier:typeIdentifier:](self, "isValidItemIdentifier:typeIdentifier:", v10, v11))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
    v14 = objc_msgSend(v13, "newContextsForAllDataSources");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForManagedObjectIDURI:inContexts:", v10, v14));
    if ((objc_opt_respondsToSelector(v15, "fileURLForTypeIdentifier:") & 1) != 0)
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fileURLForTypeIdentifier:", v11));
    else
      v16 = 0;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v21), "reset", (_QWORD)v26);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v19);
    }

    v22 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v16;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Returning %@ for %@ with type %@", buf, 0x20u);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isValidItemIdentifier:(id)a3 typeIdentifier:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = 1;
    if (v6)
      goto LABEL_11;
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100006898();

  v7 = 0;
  if (!v6)
  {
LABEL_8:
    v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000686C();

    v7 = 0;
  }
LABEL_11:

  return v7;
}

@end
