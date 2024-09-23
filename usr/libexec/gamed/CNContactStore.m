@implementation CNContactStore

- (id)_gkContactKeysToFetch
{
  void *v2;
  void *v3;
  _QWORD v5[9];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v5[0] = v2;
  v5[1] = CNContactIdentifierKey;
  v5[2] = CNContactEmailAddressesKey;
  v5[3] = CNContactPhoneNumbersKey;
  v5[4] = CNContactGivenNameKey;
  v5[5] = CNContactFamilyNameKey;
  v5[6] = CNContactNamePrefixKey;
  v5[7] = CNContactNameSuffixKey;
  v5[8] = CNContactTypeKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 9));

  return v3;
}

- (void)_gkSyncContactsWithChangeHistoryToken:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5 changeHistoryLimit:(unint64_t)a6 cachedListVersion:(signed __int16)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  __CFString *v43;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkMeContact](self, "_gkMeContact"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/CNContactStore+GKAdditions.m", 62, "-[CNContactStore(GKAdditions) _gkSyncContactsWithChangeHistoryToken:playerProvider:batchSize:changeHistoryLimit:cachedListVersion:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16));

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001308D4;
  v41[3] = &unk_1002BB590;
  v18 = v15;
  v42 = v18;
  v43 = CFSTR("contactsSync");
  objc_msgSend(v17, "perform:", v41);
  v19 = objc_msgSend(v17, "wait");
  if (v11)
  {
    v38 = v12;
    v20 = a5;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkChangeHistoryRequestWithToken:](self, "_gkChangeHistoryRequestWithToken:", v11));
    v40 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore countForFetchRequest:error:](self, "countForFetchRequest:error:", v21, &v40));
    v23 = v40;

    if (v22 && !v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
      v25 = objc_msgSend(v24, "integerValue");

      if ((unint64_t)v25 < a6)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkChangeHistoryRequestWithToken:](self, "_gkChangeHistoryRequestWithToken:", v11));
        v39 = 0;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore enumeratorForChangeHistoryFetchRequest:error:](self, "enumeratorForChangeHistoryFetchRequest:error:", v26, &v39));
        v28 = v39;
        v37 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "value"));

        if (!v29 || v28)
        {
          v31 = v28;
          v36 = v26;
          if (!os_log_GKGeneral)
            v34 = (id)GKOSLoggers(v30);
          v35 = v20;
          v32 = v37;
          if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
            sub_1001319A8();
          v12 = v38;
          -[CNContactStore _gkSyncAllContactsWithMeContactID:playerProvider:batchSize:](self, "_gkSyncAllContactsWithMeContactID:playerProvider:batchSize:", v14, v38, v35);
          v26 = v36;
        }
        else
        {
          v31 = 0;
          v32 = v37;
          v12 = v38;
          -[CNContactStore _gkSyncWithChangeHistoryResult:playerProvider:meContactID:batchSize:](self, "_gkSyncWithChangeHistoryResult:playerProvider:meContactID:batchSize:", v37);
        }
        objc_msgSend(v18, "endTransaction:", CFSTR("contactsSync"));

        v23 = 0;
        goto LABEL_16;
      }
      v23 = 0;
    }
    a5 = v20;
    v12 = v38;
  }
  else
  {
    v23 = 0;
    v22 = 0;
  }
  if (!os_log_GKGeneral)
    v33 = (id)GKOSLoggers(v19);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_100131948();
  -[CNContactStore _gkSyncAllContactsWithMeContactID:playerProvider:batchSize:](self, "_gkSyncAllContactsWithMeContactID:playerProvider:batchSize:", v14, v12, a5);
  objc_msgSend(v18, "endTransaction:", CFSTR("contactsSync"));
LABEL_16:

}

- (id)_gkChangeHistoryRequestWithToken:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  objc_msgSend(v5, "setShouldUnifyResults:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkContactKeysToFetch](self, "_gkContactKeysToFetch"));
  objc_msgSend(v5, "setAdditionalContactKeyDescriptors:", v6);

  objc_msgSend(v5, "setStartingToken:", v4);
  return v5;
}

- (void)_gkSyncWithChangeHistoryResult:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 batchSize:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  GKContactsCacheUpdateFinishedCommand *v13;
  void *v14;
  GKContactsCacheUpdateFinishedCommand *v15;
  GKContactsChangedCommandBatcher *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v13 = [GKContactsCacheUpdateFinishedCommand alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentHistoryToken"));
  v15 = -[GKContactsCacheUpdateFinishedCommand initWithChangeHistoryToken:](v13, "initWithChangeHistoryToken:", v14);

  v16 = -[GKContactsChangedCommandBatcher initWithPlayerProvider:meContactID:batchSize:finishedCommand:]([GKContactsChangedCommandBatcher alloc], "initWithPlayerProvider:meContactID:batchSize:finishedCommand:", v10, v11, a6, v15);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v21), "acceptEventVisitor:", v16, (_QWORD)v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher error](v16, "error"));

        if (v22)
        {

          goto LABEL_11;
        }
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
        continue;
      break;
    }
  }

  -[GKContactsChangedCommandBatcher finish](v16, "finish");
LABEL_11:

}

- (id)_gkMeContact
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  NSString *v20;

  v20 = CNContactIdentifierKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v19 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](self, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v19));
  v5 = v19;

  if (v5)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v6);
    v8 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v8)
      sub_100131A6C();
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v8);
    v10 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100131A08((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    v17 = 0;
  }
  else
  {
    v17 = v4;
  }

  return v17;
}

- (void)_gkSyncAllContactsWithMeContactID:(id)a3 playerProvider:(id)a4 batchSize:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  GKContactsCacheUpdateFinishedCommand *v19;
  void *v20;
  GKContactsCacheUpdateFinishedCommand *v21;
  GKContactsChangedCommandBatcher *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  _BOOL8 v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  GKContactsCacheUpdateFinishedCommand *v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _BYTE v54[128];
  NSString *v55;

  v46 = a3;
  v8 = a4;
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localPlayerCacheGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001310F0;
  v52[3] = &unk_1002BBBD8;
  v53 = v10;
  v12 = v10;
  objc_msgSend(v11, "performBlockAndWait:", v52);

  objc_autoreleasePoolPop(v9);
  v13 = objc_alloc((Class)CNContactFetchRequest);
  v55 = CNContactIdentifierKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
  v15 = objc_msgSend(v13, "initWithKeysToFetch:", v14);

  v51 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore enumeratorForContactFetchRequest:error:](self, "enumeratorForContactFetchRequest:error:", v15, &v51));
  v17 = v51;
  v18 = v17;
  if (v17 || !v16)
  {
    if (!os_log_GKGeneral)
      v33 = (id)GKOSLoggers(v17);
    v34 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v34)
      sub_100131AFC();
    if (!os_log_GKGeneral)
      v35 = (id)GKOSLoggers(v34);
    v36 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100131A98((uint64_t)v18, v36, v37, v38, v39, v40, v41, v42);
  }
  else
  {
    v45 = v15;
    v19 = [GKContactsCacheUpdateFinishedCommand alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentHistoryToken"));
    v21 = -[GKContactsCacheUpdateFinishedCommand initWithChangeHistoryToken:](v19, "initWithChangeHistoryToken:", v20);

    v43 = v21;
    v22 = -[GKContactsChangedCommandBatcher initWithPlayerProvider:meContactID:batchSize:finishedCommand:]([GKContactsChangedCommandBatcher alloc], "initWithPlayerProvider:meContactID:batchSize:finishedCommand:", v8, v46, a5, v21);
    v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a5);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), "identifier"));
          objc_msgSend(v23, "addObject:", v29);

          if ((unint64_t)objc_msgSend(v23, "count") >= a5)
          {
            v30 = objc_msgSend(v23, "copy");
            -[CNContactStore _gkSyncWithBatchOfContactIDs:playerProvider:meContactID:commandBatcher:](self, "_gkSyncWithBatchOfContactIDs:playerProvider:meContactID:commandBatcher:", v30, v8, v46, v22);

            objc_msgSend(v23, "removeAllObjects");
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher error](v22, "error"));

            if (v31)
            {

              goto LABEL_22;
            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        if (v26)
          continue;
        break;
      }
    }

    v32 = objc_msgSend(v23, "copy");
    -[CNContactStore _gkSyncWithBatchOfContactIDs:playerProvider:meContactID:commandBatcher:](self, "_gkSyncWithBatchOfContactIDs:playerProvider:meContactID:commandBatcher:", v32, v8, v46, v22);

    -[GKContactsChangedCommandBatcher finish](v22, "finish");
LABEL_22:

    v16 = v44;
    v15 = v45;
    v18 = 0;
  }

}

- (id)_gkContactsWithContactIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc((Class)CNContactFetchRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkContactKeysToFetch](self, "_gkContactKeysToFetch"));
    v7 = objc_msgSend(v5, "initWithKeysToFetch:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v4));
    objc_msgSend(v7, "setPredicate:", v8);

    v19 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore enumeratorForContactFetchRequest:error:](self, "enumeratorForContactFetchRequest:error:", v7, &v19));
    v10 = v19;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));

    if (!v11 || v10)
    {
      if (!os_log_GKGeneral)
        v15 = (id)GKOSLoggers(v12);
      v16 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
      if (v16)
        sub_100131BC0();
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(v16);
      if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
        sub_100131B60();
      v13 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100131B28();
    v13 = 0;
  }

  return v13;
}

- (void)_gkSyncWithBatchOfContactIDs:(id)a3 playerProvider:(id)a4 meContactID:(id)a5 commandBatcher:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _gkContactsWithContactIDs:](self, "_gkContactsWithContactIDs:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localPlayerCacheGroup"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "context"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100131458;
  v20[3] = &unk_1002BC3F8;
  v21 = v13;
  v22 = v10;
  v23 = v11;
  v24 = v14;
  v16 = v14;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v15, "performBlockAndWait:", v20);

}

- (id)_gkSyncAndCollectHandlesForContacts:(id)a3 updateExistingEntries:(BOOL)a4 meContactID:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  GKContactsChangedAddOrUpdateCommand *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  GKContactsCacheUpdateBatchEndCommand *v29;
  id v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[4];
  uint64_t v40;
  _BYTE v41[128];

  v9 = a3;
  v34 = a5;
  v10 = a6;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v9, "count")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v9, "count")));
  if (a4)
  {
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkDistinctValuesForKeyPath:", CFSTR("identifier")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contactID in %@"), v13));
    v11 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkObjectsMatchingPredicate:withContext:](GKCDContactInfo, "_gkObjectsMatchingPredicate:withContext:", v14, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_gkDistinctValuesForKeyPath:", CFSTR("contactID")));

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
        v23 = objc_msgSend(v12, "containsObject:", v22);

        if ((v23 & 1) != 0)
        {
          v24 = (GKContactsChangedAddOrUpdateCommand *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_gkAllHandles"));
          objc_msgSend(v33, "unionSet:", v24);
        }
        else
        {
          v24 = -[GKContactsChangedAddOrUpdateCommand initWithContact:meContactID:]([GKContactsChangedAddOrUpdateCommand alloc], "initWithContact:meContactID:", v21, v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedAddOrUpdateCommand executeWithContext:](v24, "executeWithContext:", v11));
          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(v32, "unionSet:", v25);
          }
          else
          {
            if (!os_log_GKGeneral)
              v26 = (id)GKOSLoggers(0);
            v27 = (void *)os_log_GKContacts;
            if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
              sub_100131BEC(v39, v27, v21, &v40);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_gkAllHandles"));
            objc_msgSend(v32, "unionSet:", v28);

          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v32, "count"))
  {
    v29 = objc_alloc_init(GKContactsCacheUpdateBatchEndCommand);
    -[GKContactsCacheUpdateBatchEndCommand executeWithHandles:context:](v29, "executeWithHandles:context:", v32, v11);

  }
  objc_msgSend(v33, "unionSet:", v32);
  v30 = objc_msgSend(v33, "copy");

  return v30;
}

@end
