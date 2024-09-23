@implementation CKKSScanLocalItemsOperation

- (CKKSScanLocalItemsOperation)init
{

  return 0;
}

- (CKKSScanLocalItemsOperation)initWithDependencies:(id)a3 intending:(id)a4 errorState:(id)a5 ckoperationGroup:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSScanLocalItemsOperation *v15;
  CKKSScanLocalItemsOperation *v16;
  uint64_t v17;
  NSMutableSet *viewsWithNewCKKSEntries;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKKSScanLocalItemsOperation;
  v15 = -[CKKSResultOperation init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_ckoperationGroup, a6);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    viewsWithNewCKKSEntries = v16->_viewsWithNewCKKSEntries;
    v16->_viewsWithNewCKKSEntries = (NSMutableSet *)v17;

    v16->_recordsFound = 0;
    v16->_recordsAdded = 0;
  }

  return v16;
}

- (id)queryPredicatesForViewMapping:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  const char *v33;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  const __CFString **v54;
  CFStringRef *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  unsigned int v64;
  void *v65;
  __CFString *v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __CFString *v73;
  const __CFString *v74;
  CFStringRef v75;
  const __CFString *v76;
  CFStringRef v77;
  void *v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") <= 1 && objc_msgSend(v4, "count"))
  {
    v67 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "syncingPolicy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyViewMapping"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v10)
    {
      v11 = v10;
      v68 = 0;
      v12 = *(_QWORD *)v70;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v6, "zoneID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          if (v18)
          {
            if (v68)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v6, "zoneID"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneName"));
              v23 = sub_10000BDF4(CFSTR("ckksscan"), v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);

              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v6, "zoneID"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
                *(_DWORD *)buf = 138412290;
                v81 = v26;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Too many policy rules for view %@", buf, 0xCu);

              }
              v20 = &__NSDictionary0__struct;
              v4 = v67;
              goto LABEL_34;
            }
            v68 = v14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v68 = 0;
    }

    v4 = v67;
    if (!objc_msgSend(v68, "hasMatchingRule"))
      goto LABEL_30;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    if (objc_msgSend(v27, "andsCount"))
      goto LABEL_29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    if (objc_msgSend(v28, "orsCount"))
    {
LABEL_28:

LABEL_29:
LABEL_30:
      v31 = sub_10000BDF4(CFSTR("ckksscan"), 0);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

        v20 = &__NSDictionary0__struct;
LABEL_34:

        goto LABEL_35;
      }
      *(_DWORD *)buf = 138412290;
      v81 = v68;
      v33 = "Policy view rule is complex: %@";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
      goto LABEL_33;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    if ((objc_msgSend(v29, "hasNot") & 1) != 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    if ((objc_msgSend(v30, "hasExists") & 1) != 0)
    {

      goto LABEL_27;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    v36 = objc_msgSend(v35, "hasMatch");

    if (!v36)
      goto LABEL_30;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "match"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fieldName"));
    if ((-[__CFString isEqualToString:]((id)kSecAttrSyncViewHint, "isEqualToString:", v39) & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "match"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "regex"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneID](v6, "zoneID"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneName"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("^%@$"), v43));
      v64 = objc_msgSend(v41, "isEqualToString:", v44);

      if (v64)
      {
        v77 = kSecAttrSyncViewHint;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneName](v6, "zoneName"));
        v78 = v45;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));

        goto LABEL_34;
      }
    }
    else
    {

    }
    v46 = (__CFString *)kSecAttrAccessGroup;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "match"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "fieldName"));
    if ((-[__CFString isEqualToString:]((id)kSecAttrAccessGroup, "isEqualToString:", v49) & 1) != 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "match"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "regex"));
      v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("^com\\.apple\\.cfnetwork$"));

      v46 = (__CFString *)kSecAttrAccessGroup;
      if (v53)
      {
        v75 = kSecAttrAccessGroup;
        v76 = CFSTR("com.apple.cfnetwork");
        v54 = &v76;
        v55 = &v75;
LABEL_48:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v55, 1));
        goto LABEL_34;
      }
    }
    else
    {

    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "match"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "fieldName"));
    if ((-[__CFString isEqualToString:](v46, "isEqualToString:", v58) & 1) != 0)
    {
      v66 = v46;
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "matchingRule"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "match"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "regex"));
      v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("^com\\.apple\\.safari\\.credit-cards$"));

      if (v62)
      {
        v73 = v66;
        v74 = CFSTR("com.apple.safari.credit-cards");
        v54 = &v74;
        v55 = (CFStringRef *)&v73;
        goto LABEL_48;
      }
    }
    else
    {

    }
    v63 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v32 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_DWORD *)buf = 138412290;
    v81 = v68;
    v33 = "Policy view rule is not a match against viewhint: %@";
    goto LABEL_32;
  }
  v19 = sub_10000BDF4(CFSTR("ckksscan"), 0);
  v6 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not acting on exactly one view; not limiting query: %@",
      buf,
      0xCu);
  }
  v20 = &__NSDictionary0__struct;
LABEL_35:

  return v20;
}

- (BOOL)executeQuery:(id)a3 readWrite:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  _BOOL4 v8;
  const __CFDictionary *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  BOOL v19;
  const void **v20;
  int v21;
  char v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString **v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  __CFString *v37;

  v8 = a4;
  v10 = (const __CFDictionary *)a3;
  v11 = a6;
  v32 = 0;
  v33 = (__CFString **)&v32;
  v34 = 0x2020000000;
  v35 = 0;
  v12 = -[CKKSOperationDependencies keychainMusrForCurrentAccount](self->_deps, "keychainMusrForCurrentAccount");
  v13 = sub_1000112B0(v10, v12, -1, 0, v33 + 3);
  v14 = (uint64_t)(v33 + 3);
  if (v33[3])
  {
    v15 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v33[3];
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    v18 = v33[3];
    if (a5)
    {
      v19 = 0;
      *a5 = v18;
    }
    else
    {
      if (v18)
      {
        v33[3] = 0;
        CFRelease(v18);
      }
      v19 = 0;
    }
  }
  else
  {
    v20 = (const void **)v13;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000BBC10;
    v28[3] = &unk_1002DCE50;
    v30 = &v32;
    v31 = v13;
    v29 = v11;
    v21 = sub_100011A30(v8, 1, 0, v14, (uint64_t)v28);
    if (v8)
      v22 = sub_10001CAF8((uint64_t)v20, v21, (CFErrorRef *)v33 + 3);
    else
      v22 = sub_100011108(v20, (CFErrorRef *)v33 + 3);
    if (v33[3])
      v19 = 0;
    else
      v19 = v22;
    if (!v19)
    {
      v23 = sub_10000BDF4(CFSTR("ckksscan"), 0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = v33[3];
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "couldn't execute query: %@", buf, 0xCu);
      }

      v26 = v33[3];
      if (a5)
      {
        *a5 = v26;
      }
      else if (v26)
      {
        v33[3] = 0;
        CFRelease(v26);
      }
    }

  }
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (BOOL)onboardItemToCKKS:(SecDbItem *)a3 viewState:(id)a4 keyCache:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SecDbItem *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  SecDbItem *v32;
  __int16 v33;
  id v34;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v30 = 0;
  v15 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:](CKKSOutgoingQueueEntry, "withItem:action:contextID:zoneID:keyCache:error:", a3, CFSTR("add"), v13, v14, v11, &v30));

  v16 = v30;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
  v19 = sub_10000BDF4(CFSTR("ckksscan"), v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);

  if (!v16)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Syncing new item: %@", buf, 0xCu);
    }

    v29 = 0;
    -[SecDbItem saveToDatabase:](v15, "saveToDatabase:", &v29);
    v22 = v29;
    if (!v22)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](self, "viewsWithNewCKKSEntries"));
      objc_msgSend(v27, "addObject:", v10);

      -[CKKSScanLocalItemsOperation setRecordsAdded:](self, "setRecordsAdded:", (char *)-[CKKSScanLocalItemsOperation recordsAdded](self, "recordsAdded") + 1);
      v16 = 0;
      v21 = 1;
      goto LABEL_14;
    }
    v16 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
    v25 = sub_10000BDF4(CFSTR("ckksscan"), v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Need to upload %@, but can't save to database: %@", buf, 0x16u);
    }

    -[CKKSResultOperation setError:](self, "setError:", v16);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    v32 = a3;
    v33 = 2112;
    v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Need to upload %{private}@, but can't create outgoing entry: %@", buf, 0x16u);
  }

  if (!a6)
  {
LABEL_12:
    v21 = 0;
    goto LABEL_14;
  }
  v16 = objc_retainAutorelease(v16);
  v21 = 0;
  *a6 = v16;
LABEL_14:

  return v21;
}

- (void)onboardItemsInView:(id)a3 uuids:(id)a4 itemClass:(id)a5 databaseProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  CKKSScanLocalItemsOperation *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
  v16 = sub_10000BDF4(CFSTR("ckksscan"), v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v36 = objc_msgSend(v10, "count");
    v37 = 2112;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %d missing %@ items", buf, 0x12u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v21);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000BB878;
        v25[3] = &unk_1002E9048;
        v26 = v11;
        v27 = v22;
        v28 = v13;
        v29 = self;
        objc_msgSend(v12, "dispatchSyncWithSQLTransaction:", v25);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v19);
  }

}

- (void)fixUUIDlessItemsInZone:(id)a3 primaryKeys:(id)a4 databaseProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CKKSScanLocalItemsOperation *v18;
  uint8_t buf[4];
  unsigned int v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
  v13 = sub_10000BDF4(CFSTR("ckksscan"), v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v20 = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found %d items missing UUIDs", buf, 8u);
  }

  if (objc_msgSend(v9, "count"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BAEB0;
    v15[3] = &unk_1002E9150;
    v16 = v9;
    v17 = v8;
    v18 = self;
    objc_msgSend(v10, "dispatchSyncWithSQLTransaction:", v15);

  }
}

- (void)retriggerMissingMirrorEntries:(id)a3 databaseProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t v10[16];
  _QWORD v11[4];
  NSObject *v12;
  CKKSScanLocalItemsOperation *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BAAEC;
    v11[3] = &unk_1002E9418;
    v12 = v6;
    v13 = self;
    objc_msgSend(v7, "dispatchSyncWithSQLTransaction:", v11);
    v8 = v12;
  }
  else
  {
    v9 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No missing local items found", v10, 2u);
    }
  }

}

- (void)main
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  AAFAnalyticsEventSecurity *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  AAFAnalyticsEventSecurity *v38;
  AAFAnalyticsEventSecurity *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  unsigned int v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *k;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *m;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *n;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  AAFAnalyticsEventSecurity *v104;
  AAFAnalyticsEventSecurity *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id obj;
  AAFAnalyticsEventSecurity *v111;
  uint64_t v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  AAFAnalyticsEventSecurity *v119;
  CKKSScanLocalItemsOperation *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[5];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD v143[4];
  id v144;
  CKKSScanLocalItemsOperation *v145;
  id v146;
  id v147;
  id v148;
  AAFAnalyticsEventSecurity *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  const __CFString *v154;
  void *v155;
  _BYTE v156[128];
  _BYTE v157[128];
  uint8_t v158[128];
  uint8_t buf[4];
  _BYTE v160[14];
  __int16 v161;
  void *v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  const __CFString *v166;
  void *v167;

  v109 = (void *)os_transaction_create("com.apple.securityd.ckks.scan");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));

  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = sub_10000BDF4(CFSTR("ckksscan"), 0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeManagedViews"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v160 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scanning for views: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v119 = [AAFAnalyticsEventSecurity alloc];
  v166 = CFSTR("numViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeManagedViews"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
  v167 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "altDSID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v111 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v119, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v12, v15, CFSTR("com.apple.security.ckks.scanLocalItems"), 0, &off_10030AF70, objc_msgSend(v16, "sendMetric"));

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v120 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeManagedViews"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v150, v165, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v151 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
        objc_msgSend(v8, "addObject:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewKeyHierarchyState"));
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("ready"));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "launch"));
          objc_msgSend(v27, "addEvent:", CFSTR("scan-local-items-begin"));

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v150, v165, 16);
    }
    while (v20);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "overallLaunch"));
  objc_msgSend(v29, "addEvent:", CFSTR("scan-local-items-begin"));

  v143[0] = _NSConcreteStackBlock;
  v143[1] = 3221225472;
  v143[2] = sub_1000B9310;
  v143[3] = &unk_1002DCF40;
  v30 = v114;
  v144 = v30;
  v145 = v120;
  v31 = v8;
  v146 = v31;
  v32 = v116;
  v147 = v32;
  v113 = v118;
  v148 = v113;
  v33 = v111;
  v149 = v33;
  objc_msgSend(v121, "dispatchSyncWithReadOnlySQLTransaction:", v143);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v120, "error"));

  if (v34)
  {
    v35 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v120, "error"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v160 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Exiting due to previous error: %@", buf, 0xCu);

    }
    v38 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v120, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v33, 0, v38);
  }
  else
  {
    v105 = v33;
    v106 = v31;
    v107 = v32;
    v108 = v30;
    v39 = [AAFAnalyticsEventSecurity alloc];
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "activeAccount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "altDSID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
    v104 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v39, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v42, CFSTR("com.apple.security.ckks.scanLocalItems.onboardMissingItems"), 0, &off_10030AF70, objc_msgSend(v43, "sendMetric"));

    v44 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_msgSend(v113, "count");
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "activeManagedViews"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v160 = v46;
      *(_WORD *)&v160[4] = 2112;
      *(_QWORD *)&v160[6] = v48;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Found %d views with missing items for %@", buf, 0x12u);

    }
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "allKeys"));
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
    if (v115)
    {
      v112 = *(_QWORD *)v140;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v140 != v112)
            objc_enumerationMutation(obj);
          v117 = v49;
          v50 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "objectForKeyedSubscript:", v50));
          v135 = 0u;
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "allKeys"));
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v136;
            do
            {
              for (j = 0; j != v54; j = (char *)j + 1)
              {
                if (*(_QWORD *)v136 != v55)
                  objc_enumerationMutation(v52);
                v57 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)j);
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v57));
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "zoneName"));
                v60 = sub_10000BDF4(CFSTR("ckksscan"), v59);
                v61 = objc_claimAutoreleasedReturnValue(v60);

                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  v62 = objc_msgSend(v58, "count");
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v160 = v62;
                  *(_WORD *)&v160[4] = 2112;
                  *(_QWORD *)&v160[6] = v57;
                  v161 = 2112;
                  v162 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Found %d missing %@ items for %@", buf, 0x1Cu);
                }

                -[CKKSScanLocalItemsOperation onboardItemsInView:uuids:itemClass:databaseProvider:](v120, "onboardItemsInView:uuids:itemClass:databaseProvider:", v50, v58, v57, v121);
              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
            }
            while (v54);
          }

          v49 = v117 + 1;
        }
        while ((id)(v117 + 1) != v115);
        v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
      }
      while (v115);
    }

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "allKeys"));
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v131, v158, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v132;
      do
      {
        for (k = 0; k != v65; k = (char *)k + 1)
        {
          if (*(_QWORD *)v132 != v66)
            objc_enumerationMutation(v63);
          v68 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)k);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", v68));
          -[CKKSScanLocalItemsOperation fixUUIDlessItemsInZone:primaryKeys:databaseProvider:](v120, "fixUUIDlessItemsInZone:primaryKeys:databaseProvider:", v68, v69, v121);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v131, v158, 16);
      }
      while (v65);
    }

    -[CKKSScanLocalItemsOperation retriggerMissingMirrorEntries:databaseProvider:](v120, "retriggerMissingMirrorEntries:databaseProvider:", v108, v121);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "activeManagedViews"));

    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v128;
      do
      {
        for (m = 0; m != v73; m = (char *)m + 1)
        {
          if (*(_QWORD *)v128 != v74)
            objc_enumerationMutation(v71);
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)m), "zoneID"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "zoneName"));
          +[CKKSPowerCollection CKKSPowerEvent:zone:count:](CKKSPowerCollection, "CKKSPowerEvent:zone:count:", CFSTR("scanLocalItems"), v77, -[CKKSScanLocalItemsOperation processedItems](v120, "processedItems"));

        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
      }
      while (v73);
    }

    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_1000B9C20;
    v126[3] = &unk_1002EA880;
    v126[4] = v120;
    objc_msgSend(v121, "dispatchSyncWithSQLTransaction:", v126);
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v120, "viewsWithNewCKKSEntries"));
    v79 = objc_msgSend(v78, "count");

    v33 = v105;
    v31 = v106;
    v38 = v104;
    if (v79)
    {
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v120, "viewsWithNewCKKSEntries"));
      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v122, v156, 16);
      if (v81)
      {
        v82 = v81;
        v83 = *(_QWORD *)v123;
        do
        {
          for (n = 0; n != v82; n = (char *)n + 1)
          {
            if (*(_QWORD *)v123 != v83)
              objc_enumerationMutation(v80);
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)n), "notifyViewChangedScheduler"));
            objc_msgSend(v85, "trigger");

          }
          v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v122, v156, 16);
        }
        while (v82);
      }

      v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v120, "ckoperationGroup"));
      if (v86)
      {
        v87 = sub_10000BDF4(CFSTR("ckksscan"), 0);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v120, "ckoperationGroup"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v160 = v89;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Transferring ckoperation group %@", buf, 0xCu);

        }
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v120, "ckoperationGroup"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
        objc_msgSend(v91, "setCurrentOutgoingQueueOperationGroup:", v90);

      }
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "flagHandler"));
      objc_msgSend(v93, "handleFlag:", CFSTR("process_outgoing_queue"));

    }
    v154 = CFSTR("numViewsWithNewEntries");
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v120, "viewsWithNewCKKSEntries"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v94, "count")));
    v155 = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
    -[AAFAnalyticsEventSecurity addMetrics:](v104, "addMetrics:", v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v120, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v104, 1, v97);

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v120, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v105, 1, v98);

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation intendedState](v120, "intendedState"));
    -[CKKSScanLocalItemsOperation setNextState:](v120, "setNextState:", v99);

    if (-[CKKSScanLocalItemsOperation missingLocalItemsFound](v120, "missingLocalItemsFound"))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v120, "deps"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "flagHandler"));
      objc_msgSend(v101, "handleFlag:", CFSTR("process_incoming_queue"));

    }
    v102 = sub_10000BDF4(CFSTR("ckksscan"), 0);
    v103 = objc_claimAutoreleasedReturnValue(v102);
    v32 = v107;
    v30 = v108;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Completed scan", buf, 2u);
    }

  }
}

- (BOOL)areEquivalent:(SecDbItem *)a3 ckksItem:(id)a4 keyCache:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  __CFDictionary *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __CFString *v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  __CFString *v47;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v44 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:](CKKSIncomingQueueOperation, "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:", v8, v9, v10, &v44));
  v12 = (__CFString *)v44;
  v13 = objc_msgSend(v11, "mutableCopy");

  v38 = v13;
  if (v13)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    v43 = 0;
    v20 = sub_10001904C(a3, 0x10000, 0, &v43);
    v21 = v20;
    v12 = v43;
    if (!v20 || v43)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
      v34 = sub_10000BDF4(CFSTR("ckksscan"), v33);
      v22 = objc_claimAutoreleasedReturnValue(v34);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v12;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not get item contents for comparison: %@", buf, 0xCu);
      }
      v19 = 0;
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v22 = v20;
      v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v23)
      {
        v24 = v23;
        v36 = v21;
        v37 = v9;
        v25 = *(_QWORD *)v40;
        v26 = kSecAttrSHA1;
        while (2)
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v25)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v28, "isEqual:", kSecAttrCreationDate) & 1) == 0
              && (objc_msgSend(v28, "isEqual:", kSecAttrModificationDate) & 1) == 0
              && (objc_msgSend(v28, "isEqual:", v26) & 1) == 0)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v28));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v28));
              v31 = objc_msgSend(v29, "isEqual:", v30);

              if (!v31)
              {
                v19 = 0;
                goto LABEL_26;
              }
            }
          }
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v24)
            continue;
          break;
        }
        v19 = 1;
LABEL_26:
        v9 = v37;
        v21 = v36;
        v12 = 0;
      }
      else
      {
        v19 = 1;
      }
    }

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
    v17 = sub_10000BDF4(CFSTR("ckksscan"), v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not decrypt item for comparison: %@", buf, 0xCu);
    }

    v19 = 1;
  }

  return v19;
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCkoperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)recordsFound
{
  return self->_recordsFound;
}

- (void)setRecordsFound:(unint64_t)a3
{
  self->_recordsFound = a3;
}

- (unint64_t)recordsAdded
{
  return self->_recordsAdded;
}

- (void)setRecordsAdded:(unint64_t)a3
{
  self->_recordsAdded = a3;
}

- (unint64_t)missingLocalItemsFound
{
  return self->_missingLocalItemsFound;
}

- (void)setMissingLocalItemsFound:(unint64_t)a3
{
  self->_missingLocalItemsFound = a3;
}

- (unint64_t)processedItems
{
  return self->_processedItems;
}

- (void)setProcessedItems:(unint64_t)a3
{
  self->_processedItems = a3;
}

- (NSMutableSet)viewsWithNewCKKSEntries
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setViewsWithNewCKKSEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsWithNewCKKSEntries, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
