@implementation DMDManagedMediaManager

+ (DMDManagedMediaManager)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DD90;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB8F0 != -1)
    dispatch_once(&qword_1000EB8F0, block);
  return (DMDManagedMediaManager *)(id)qword_1000EB8E8;
}

+ (id)homeSharingCloudClient
{
  if (qword_1000EB900 != -1)
    dispatch_once(&qword_1000EB900, &stru_1000BB480);
  return (id)qword_1000EB8F8;
}

- (DMDManagedMediaManager)init
{
  DMDManagedMediaManager *v3;
  void *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *memberQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *memberQueuePersistentIDToNonStoreBook;
  NSMutableDictionary *v9;
  NSMutableDictionary *memberQueueiTunesStoreIDToStoreBook;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DMDManagedMediaManager;
  v3 = -[DMDManagedMediaManager init](&v16, "init");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDManagedMediaManager: init")));
    if ((MCHasMDMMigrated() & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DMDManagedMediaManager+iOS.m"), 130, CFSTR("Media operations cannot proceed when MDM migration is not complete."));

    }
    v5 = dispatch_queue_create("DMDManagedMediaManager Member Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    memberQueue = v3->_memberQueue;
    v3->_memberQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    memberQueuePersistentIDToNonStoreBook = v3->_memberQueuePersistentIDToNonStoreBook;
    v3->_memberQueuePersistentIDToNonStoreBook = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    memberQueueiTunesStoreIDToStoreBook = v3->_memberQueueiTunesStoreIDToStoreBook;
    v3->_memberQueueiTunesStoreIDToStoreBook = v9;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004DF90;
    v14[3] = &unk_1000BA4B0;
    v15 = v4;
    v11 = v4;
    -[DMDManagedMediaManager cleanUpWithAssertion:completionBlock:](v3, "cleanUpWithAssertion:completionBlock:", v11, v14);
    objc_msgSend(v11, "stayAliveThroughHereAtLeast");

  }
  return v3;
}

- (void)cleanUpWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E030;
  v8[3] = &unk_1000BA7F0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, v8);

}

- (void)memberQueueCleanUp
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  BOOL v19;
  id v20;
  void *v21;
  __CFString *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  __CFString *v37;
  BOOL v38;
  const __CFString *v39;
  __CFString *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *k;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *m;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  __CFString *v68;
  BOOL v69;
  const __CFString *v70;
  __CFString *v71;
  BOOL v72;
  void *v73;
  uint64_t v74;
  NSMutableArray *v75;
  void *v76;
  uint64_t v77;
  char v78;
  char v79;
  void *v80;
  id obj;
  id obja;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  id v97;
  id v98;
  _QWORD v99[6];
  uint8_t buf[8];
  uint8_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t v113[4];
  void *v114;
  __int16 v115;
  void *v116;
  _BYTE v117[128];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cleaning up media manager manifests", buf, 2u);
  }
  v2 = sub_10004EB18();
  v73 = (void *)objc_claimAutoreleasedReturnValue(v2);
  -[DMDManagedMediaManager memberQueueRereadNonStoreBooksManifest](self, "memberQueueRereadNonStoreBooksManifest");
  v75 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "downloads"));
  obj = objc_msgSend(v3, "mutableCopy");

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
  if (v5)
  {
    v79 = 0;
    v6 = *(_QWORD *)v107;
    v77 = SSDownloadPhaseFailed;
    v74 = SSDownloadPhaseFinished;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v107 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadIdentifier"));
        v12 = v11 == 0;

        if (!v12)
        {
          *(_QWORD *)buf = 0;
          v101 = buf;
          v102 = 0x3032000000;
          v103 = sub_10004EB58;
          v104 = sub_10004EB68;
          v105 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadIdentifier"));
          v14 = objc_msgSend(v13, "longLongValue");

          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472;
          v99[2] = sub_10004EB70;
          v99[3] = &unk_1000BB4D0;
          v99[4] = buf;
          v99[5] = v14;
          objc_msgSend(obj, "enumerateObjectsUsingBlock:", v99);
          v15 = (void *)*((_QWORD *)v101 + 5);
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "downloadPhaseIdentifier"));
            if (objc_msgSend(v16, "isEqualToString:", v77))
            {
              v17 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendlyName"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v101 + 5), "failureError"));
                *(_DWORD *)v113 = 138543618;
                v114 = v24;
                v115 = 2114;
                v116 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Book failed to download: %{public}@\nError: %{public}@", v113, 0x16u);

              }
              objc_msgSend(v10, "setDownloadIdentifier:", 0);
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "state"));
              v19 = v18 == CFSTR("Failed");

              if (!v19)
              {
                objc_msgSend(v10, "setState:", CFSTR("Failed"));
                v79 = 1;
              }
              -[NSMutableArray addObject:](v75, "addObject:", *((_QWORD *)v101 + 5));
            }
            else if (objc_msgSend(v16, "isEqualToString:", v74))
            {
              v20 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendlyName"));
                *(_DWORD *)v113 = 138543362;
                v114 = v21;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Book completed downloading: %{public}@", v113, 0xCu);

              }
              objc_msgSend(v10, "setDownloadIdentifier:", 0);
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "state"));
              v23 = v22 == CFSTR("Managed");

              if (!v23)
              {
                objc_msgSend(v10, "setState:", CFSTR("Managed"));
                v79 = 1;
              }
            }
            objc_msgSend(obj, "removeObjectIdenticalTo:", *((_QWORD *)v101 + 5));

          }
          _Block_object_dispose(buf, 8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
    }
    while (v5);
  }
  else
  {
    v79 = 0;
  }

  objc_msgSend(v73, "finishDownloads:", v75);
  if (objc_msgSend(obj, "count"))
  {
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10004EBDC;
    v96[3] = &unk_1000B9B40;
    v97 = v73;
    v98 = obj;
    objc_msgSend(v97, "cancelDownloads:completionBlock:", v98, v96);

  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v93;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v93 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)j);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v30));

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "fullPath"));
        if (!v33
          || (v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "fullPath")),
              v36 = objc_msgSend(v34, "fileExistsAtPath:", v35),
              v35,
              v34,
              v33,
              !v36))
        {
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "state"));
          v41 = v40 == CFSTR("ManagedButUninstalled");

          v39 = CFSTR("ManagedButUninstalled");
          if (v41)
            goto LABEL_40;
LABEL_39:
          objc_msgSend(v32, "setState:", v39);
          v79 = 1;
          goto LABEL_40;
        }
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "state"));
        v38 = v37 == CFSTR("Managed");

        v39 = CFSTR("Managed");
        if (!v38)
          goto LABEL_39;
LABEL_40:

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    }
    while (v27);
  }

  if ((v79 & 1) != 0)
    -[DMDManagedMediaManager memberQueueCommitNonStoreBooksManifest](self, "memberQueueCommitNonStoreBooksManifest");

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths purchasedBooksManifest](DMDPaths, "purchasedBooksManifest"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v42));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("Books")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v43, "count")));
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obja = v43;
  v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v89;
    do
    {
      for (k = 0; k != v45; k = (char *)k + 1)
      {
        if (*(_QWORD *)v89 != v46)
          objc_enumerationMutation(obja);
        v48 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)k);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("s")));
        v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("Path")));
        v51 = (void *)v50;
        if (v49)
          v52 = v50 == 0;
        else
          v52 = 1;
        if (!v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths purchasedBooksDirectory](DMDPaths, "purchasedBooksDirectory"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByAppendingPathComponent:", v51));
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v54, v49);

        }
      }
      v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
    }
    while (v45);
  }

  -[DMDManagedMediaManager memberQueueRereadStoreBooksManifest](self, "memberQueueRereadStoreBooksManifest");
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
  if (!v56)
  {

    goto LABEL_74;
  }
  v78 = 0;
  v57 = *(_QWORD *)v85;
  do
  {
    for (m = 0; m != v56; m = (char *)m + 1)
    {
      if (*(_QWORD *)v85 != v57)
        objc_enumerationMutation(v55);
      v59 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)m);
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v59));

      v62 = sub_10004EBE8();
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "state"));
      v65 = objc_msgSend(v63, "containsObject:", v64);

      if ((v65 & 1) == 0)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "iTunesStoreID"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v66));

        if (v67 && objc_msgSend(v80, "fileExistsAtPath:", v67))
        {
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "state"));
          v69 = v68 == CFSTR("Installed");

          v70 = CFSTR("Installed");
          if (v69)
            goto LABEL_68;
LABEL_67:
          objc_msgSend(v61, "setState:", v70);
          v78 = 1;
        }
        else
        {
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "state"));
          v72 = v71 == CFSTR("Uninstalled");

          v70 = CFSTR("Uninstalled");
          if (!v72)
            goto LABEL_67;
        }
LABEL_68:

      }
    }
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
  }
  while (v56);

  if ((v78 & 1) != 0)
    -[DMDManagedMediaManager memberQueueCommitStoreBooksManifest](self, "memberQueueCommitStoreBooksManifest");
LABEL_74:

}

- (void)memberQueueCommitNonStoreBooksManifest
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  NSFileAttributeKey v31;
  _UNKNOWN **v32;
  _BYTE v33[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11), "manifestDictionary"));
        objc_msgSend(v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, kNonStoreBooksManifestBooksKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedNonStoreBooksDirectory](DMDPaths, "managedNonStoreBooksDirectory"));
  if ((objc_msgSend(v13, "fileExistsAtPath:", v14) & 1) == 0)
  {
    v31 = NSFilePosixPermissions;
    v32 = &off_1000C3528;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, v15, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v17 = objc_msgSend(v16, "isEnterpriseBookBackupAllowed") ^ 1;

    if (!+[DMDMDMUtilities setSkipBackupAttribute:toItemAtPath:](DMDMDMUtilities, "setSkipBackupAttribute:toItemAtPath:", v17, v14))
    {
      v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v18)
        sub_100077788(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedNonStoreBooksManifestPath](DMDPaths, "managedNonStoreBooksManifestPath"));
  -[NSMutableDictionary writeToFile:atomically:](v3, "writeToFile:atomically:", v26, 1);

  MCSendManagedBooksChangedNotification();
}

- (void)memberQueueCommitStoreBooksManifest
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "manifestDictionary"));
        objc_msgSend(v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, kStoreBooksManifestBooksKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedStoreBooksManifestPath](DMDPaths, "managedStoreBooksManifestPath"));
  -[NSMutableDictionary writeToFile:atomically:](v3, "writeToFile:atomically:", v13, 1);

  MCSendManagedBooksChangedNotification();
}

- (void)memberQueueRereadNonStoreBooksManifest
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedNonStoreBooksManifestPath](DMDPaths, "managedNonStoreBooksManifestPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kNonStoreBooksManifestBooksKey));
    v7 = v6;
    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = objc_msgSend(objc_alloc((Class)MDMBook), "initWithManifestDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentID"));

            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentID"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v14);

            }
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
    }

  }
  -[DMDManagedMediaManager setMemberQueuePersistentIDToNonStoreBook:](self, "setMemberQueuePersistentIDToNonStoreBook:", v3);

}

- (void)memberQueueRereadStoreBooksManifest
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths managedStoreBooksManifestPath](DMDPaths, "managedStoreBooksManifestPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kStoreBooksManifestBooksKey));
    v7 = v6;
    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = objc_msgSend(objc_alloc((Class)MDMBook), "initWithManifestDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iTunesStoreID"));

            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iTunesStoreID"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v14);

            }
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
    }

  }
  -[DMDManagedMediaManager setMemberQueueiTunesStoreIDToStoreBook:](self, "setMemberQueueiTunesStoreIDToStoreBook:", v3);

}

- (void)rereadNonStoreBooksManifestCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F48C;
  v7[3] = &unk_1000BA7F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

- (void)rereadStoreBooksManifestCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F588;
  v7[3] = &unk_1000BA7F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

- (void)setNonStoreManagedBook:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentID"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004F6BC;
    v7[3] = &unk_1000B9BA8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(v6, v7);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000777C0();
  }

}

- (void)setStoreManagedBook:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iTunesStoreID"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004F7EC;
    v7[3] = &unk_1000B9BA8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(v6, v7);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077828();
  }

}

- (void)setState:(id)a3 forNonStoreBookWithPersistentID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F908;
  block[3] = &unk_1000B9BD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(v8, block);

}

- (void)setState:(id)a3 forStoreBookWithiTunesStoreID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FA2C;
  block[3] = &unk_1000B9BD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(v8, block);

}

- (void)cancelNonStoreDownloadsWithDownloadIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  id *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  v6 = a4;
  v7 = sub_10004EB18();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v21 = v8;
    v22 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloads"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v15, "persistentIdentifier")));
          v17 = objc_msgSend(v5, "containsObject:", v16);

          if (v17)
            -[NSMutableArray addObject:](v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v8 = v21;
    v6 = v22;
  }
  if (-[NSMutableArray count](v9, "count"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004FCF0;
    v25[3] = &unk_1000BA1F8;
    v18 = &v26;
    v26 = v6;
    objc_msgSend(v8, "cancelDownloads:completionBlock:", v9, v25);
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004FD4C;
    block[3] = &unk_1000BB4A8;
    v18 = &v24;
    v24 = v6;
    dispatch_async(v20, block);

    goto LABEL_16;
  }
LABEL_17:

}

- (void)installNonStoreBook:(id)a3 fileExtension:(id)a4 URL:(id)a5 assertion:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting installation of book: %{public}@", buf, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentID"));
  if (!v17)
    sub_1000778F8();

  v18 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004FF18;
  v24[3] = &unk_1000BB598;
  v24[4] = self;
  v25 = v12;
  v26 = v13;
  v27 = v15;
  v28 = v14;
  v29 = v16;
  v19 = v14;
  v20 = v15;
  v21 = v16;
  v22 = v13;
  v23 = v12;
  dispatch_barrier_async(v18, v24);

}

+ (BOOL)shouldBypassVPPLicenseCheck
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.managedconfiguration.mdmd"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MediaBypassVPPCheck"), CFSTR("com.apple.managedconfiguration.mdmd"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)refreshBookPurchaseHistoryCompletion:(id)a3
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Refreshing book purchase history and trying again.", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager homeSharingCloudClient](DMDManagedMediaManager, "homeSharingCloudClient"));
  objc_msgSend(v4, "updateJaliscoLibraryWithReason:completionHandler:", 8, v3);

}

- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 triesLeft:(int)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  DMDManagedMediaManager *v20;
  id v21;
  id v22;
  int v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Searching book purchase history for iTunes Store ID %{public}@", buf, 0xCu);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager homeSharingCloudClient](DMDManagedMediaManager, "homeSharingCloudClient"));
  v24 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100050C38;
  v18[3] = &unk_1000BB5E8;
  v23 = a5;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  objc_msgSend(v13, "loadBooksForStoreIDs:withCompletionHandler:", v14, v18);

}

- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  -[DMDManagedMediaManager searchBookPurchaseHistoryForiTunesStoreID:assertion:triesLeft:completionBlock:](self, "searchBookPurchaseHistoryForiTunesStoreID:assertion:triesLeft:completionBlock:", a3, a4, 1, a5);
}

- (void)installStoreBookWithiTunesStoreID:(id)a3 originator:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  DMDManagedMediaManager *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting installation of book with iTunes Store ID %{public}@", buf, 0xCu);
  }
  if (v10)
  {
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Book Installation"), &stru_1000BC2E0, CFSTR("DMFNotifications")));

    v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Sign in to iTunes to allow %@ to manage and install books."), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v11));

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000512BC;
    v23[3] = &unk_1000BB660;
    v27 = v13;
    v24 = v12;
    v25 = self;
    v26 = v10;
    -[DMDManagedAssetManager promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:](self, "promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:", v16, v20, v24, v23);

LABEL_7:
    goto LABEL_8;
  }
  if (v13)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v22 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005125C;
    block[3] = &unk_1000BB380;
    v30 = v13;
    v29 = v12;
    dispatch_async(v22, block);

    v16 = v30;
    goto LABEL_7;
  }
LABEL_8:

}

- (NSArray)storeBooks
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10004EB58;
  v11 = sub_10004EB68;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005166C;
  v6[3] = &unk_1000BA460;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)nonStoreBooks
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10004EB58;
  v11 = sub_10004EB68;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000517D0;
  v6[3] = &unk_1000BA460;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)memberQueueMoveTransientStatesForward
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  NSMutableArray *v31;
  NSMutableArray *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v31 = objc_opt_new(NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

        v11 = sub_10004EBE8();
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "state"));
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (v14)
          -[NSMutableArray addObject:](v31, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v5);
  }

  if (-[NSMutableArray count](v31, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v15 = -[NSMutableArray count](v31, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing %u non-store books because we have reported their transient state.", buf, 8u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueuePersistentIDToNonStoreBook](self, "memberQueuePersistentIDToNonStoreBook"));
    objc_msgSend(v16, "removeObjectsForKeys:", v31);

    -[DMDManagedMediaManager memberQueueCommitNonStoreBooksManifest](self, "memberQueueCommitNonStoreBooksManifest");
  }

  v32 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v22));

        v25 = sub_10004EBE8();
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "state"));
        v28 = objc_msgSend(v26, "containsObject:", v27);

        if (v28)
          -[NSMutableArray addObject:](v32, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v19);
  }

  if (-[NSMutableArray count](v32, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v29 = -[NSMutableArray count](v32, "count");
      *(_DWORD *)buf = 134217984;
      v42 = v29;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing %lu store books because we have reported their transient state.", buf, 0xCu);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueueiTunesStoreIDToStoreBook](self, "memberQueueiTunesStoreIDToStoreBook"));
    objc_msgSend(v30, "removeObjectsForKeys:", v32);

    -[DMDManagedMediaManager memberQueueCommitStoreBooksManifest](self, "memberQueueCommitStoreBooksManifest");
  }

}

- (void)moveTransientStatesForward
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051C58;
  block[3] = &unk_1000BA4B0;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

- (void)removeNonStoreBookWithPersistentID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100051D44;
  v15[3] = &unk_1000BA908;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_barrier_async(v11, v15);

}

- (void)removeStoreBookWithiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[DMDManagedMediaManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000521B0;
  block[3] = &unk_1000B9BA8;
  block[4] = self;
  v17 = v7;
  v10 = v7;
  dispatch_sync(v9, block);

  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000521EC;
  v14[3] = &unk_1000BB4A8;
  v15 = v8;
  v13 = v8;
  dispatch_async(v12, v14);

}

- (void)uprootWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  DMDManagedMediaManager *v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Canceling all book downloads.", buf, 2u);
  }
  v8 = sub_10004EB18();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100052334;
  v13[3] = &unk_1000BB688;
  v14 = (id)objc_claimAutoreleasedReturnValue(v8);
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "downloads"));
  v17 = v6;
  v18 = v7;
  v16 = self;
  v9 = v6;
  v10 = v7;
  v11 = v15;
  v12 = v14;
  objc_msgSend(v12, "cancelDownloads:completionBlock:", v11, v13);

}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSMutableDictionary)memberQueuePersistentIDToNonStoreBook
{
  return self->_memberQueuePersistentIDToNonStoreBook;
}

- (void)setMemberQueuePersistentIDToNonStoreBook:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePersistentIDToNonStoreBook, a3);
}

- (NSMutableDictionary)memberQueueiTunesStoreIDToStoreBook
{
  return self->_memberQueueiTunesStoreIDToStoreBook;
}

- (void)setMemberQueueiTunesStoreIDToStoreBook:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueiTunesStoreIDToStoreBook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueiTunesStoreIDToStoreBook, 0);
  objc_storeStrong((id *)&self->_memberQueuePersistentIDToNonStoreBook, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end
