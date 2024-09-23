@implementation MBATCBundlesPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7;

  v7 = objc_msgSend(a3, "stringByStandardizingPath");
  if (!objc_msgSend(v7, "isAbsolutePath"))
    return v7;
  if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(a4, "rootPath")) & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBATCBundlesPlugin.m"), 44, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), objc_msgSend(a4, "rootPath"), v7);
  return objc_msgSend(v7, "substringFromIndex:", (char *)objc_msgSend(objc_msgSend(a4, "rootPath"), "length") + 1);
}

- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5 allBackupPaths:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56[11];
  int v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;

  v10 = -[ATClientController clientForDataclass:](+[ATClientController sharedInstance](ATClientController, "sharedInstance"), "clientForDataclass:", a5);
  v11 = objc_msgSend(objc_msgSend(a3, "domainManager"), "domainForName:", a4);
  v12 = objc_alloc_init((Class)NSMutableSet);
  v13 = objc_alloc_init((Class)NSMutableSet);
  if ((objc_opt_respondsToSelector(v10, "enumeratePathsForBackupType:usingBlock:") & 1) != 0)
  {
    v14 = objc_autoreleasePoolPush();
    if ((objc_msgSend(a3, "isDeviceTransferEngine") & 1) != 0)
    {
      v15 = 3;
    }
    else if ((objc_msgSend(a3, "isDriveEngine") & 1) != 0)
    {
      v15 = 2;
    }
    else
    {
      if ((objc_msgSend(a3, "isServiceEngine") & 1) == 0)
        sub_1000880D0();
      v15 = 1;
    }
    v56[1] = _NSConcreteStackBlock;
    v56[2] = (id)3221225472;
    v56[3] = sub_10003A374;
    v56[4] = &unk_1000D97A0;
    v57 = v15;
    v56[5] = v10;
    v56[6] = self;
    v56[7] = v11;
    v56[8] = a6;
    v56[9] = v12;
    v56[10] = v13;
    objc_msgSend(v10, "enumeratePathsForBackupType:usingBlock:");
  }
  else
  {
    if ((objc_opt_respondsToSelector(v10, "pathsToBackup:pathsNotToBackup:") & 1) == 0)
      goto LABEL_36;
    v46 = v13;
    v43 = objc_autoreleasePoolPush();
    v55 = 0;
    v56[0] = 0;
    v16 = objc_msgSend(v10, "pathsToBackup:pathsNotToBackup:", v56, &v55);
    v18 = MBGetDefaultLog(v16, v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v56[0], "count");
      v20 = objc_msgSend(v55, "count");
      *(_DWORD *)buf = 138412802;
      v61 = v10;
      v62 = 2048;
      v63 = v19;
      v64 = 2048;
      v65 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: pathsToBackup.count:%lu, pathsNotToBackup.count:%lu", buf, 0x20u);
      v21 = objc_msgSend(v56[0], "count");
      _MBLog(CFSTR("DEFAULT"), "%@: pathsToBackup.count:%lu, pathsNotToBackup.count:%lu", v10, v21, objc_msgSend(v55, "count"));
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v12;
    obj = v56[0];
    v22 = objc_msgSend(v56[0], "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v27 = objc_autoreleasePoolPush();
          v29 = MBGetDefaultLog(v27, v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v10;
            v62 = 2112;
            v63 = v26;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: pathToBackup:%@", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "%@: pathToBackup:%@", v10, v26);
          }
          v30 = -[MBATCBundlesPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v26, v11);
          v31 = objc_msgSend(a6, "containsObject:", v30);
          if ((_DWORD)v31)
          {
            v33 = MBGetDefaultLog(v31, v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v61 = v10;
              v62 = 2112;
              v63 = v26;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: Skipping duplicate path: %@", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), "%@: Skipping duplicate path: %@", v10, v26);
            }
          }
          else
          {
            objc_msgSend(a6, "addObject:", v30);
            objc_msgSend(v44, "addObject:", v30);
          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v23);
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = v55;
    v35 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
          v40 = objc_autoreleasePoolPush();
          v42 = MBGetDefaultLog(v40, v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v10;
            v62 = 2112;
            v63 = v39;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: pathNotToBackup:%@", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "%@: pathNotToBackup:%@", v10, v39);
          }
          objc_msgSend(v46, "addObject:", -[MBATCBundlesPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v39, v11));
          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      }
      while (v36);
    }
    v13 = v46;
    v14 = v43;
    v12 = v44;
  }
  objc_autoreleasePoolPop(v14);
LABEL_36:
  if (objc_msgSend(v12, "count"))
  {
    if (objc_msgSend(v11, "relativePathsToBackupAndRestore"))
      objc_msgSend(v12, "unionSet:", objc_msgSend(v11, "relativePathsToBackupAndRestore"));
    objc_msgSend(v11, "setRelativePathsToBackupAndRestore:", v12);
  }

  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v11, "relativePathsNotToBackup"))
      objc_msgSend(v13, "unionSet:", objc_msgSend(v11, "relativePathsNotToBackup"));
    objc_msgSend(v11, "setRelativePathsNotToBackup:", v13);
  }

}

- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5
{
  -[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:allBackupPaths:](self, "_populatePathsForEngine:domain:dataclass:allBackupPaths:", a3, a4, a5, 0);
}

- (void)_populateAccountsForEngine:(id)a3 dataClasses:(id)a4 accountsTracker:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v50;
  ATClientController *v51;
  id v52;
  void *v53;
  void *context;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];

  if (!a5)
    sub_100088120();
  if (objc_msgSend(a3, "isDeviceTransferEngine"))
    v7 = objc_msgSend(a3, "preflightProperties");
  else
    v7 = objc_msgSend(a3, "properties");
  v56 = v7;
  v51 = +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v52 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v67;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v67 != v50)
          objc_enumerationMutation(a4);
        v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v8);
        v10 = objc_autoreleasePoolPush();
        v57 = v9;
        v11 = -[ATClientController clientForDataclass:](v51, "clientForDataclass:", v9);
        v12 = objc_opt_respondsToSelector(v11, "accountsForAssets");
        context = v10;
        v55 = v8;
        v53 = v11;
        if ((v12 & 1) != 0)
        {
          v14 = objc_msgSend(v11, "accountsForAssets");
          v16 = MBGetDefaultLog(v14, v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v73 = v11;
            v74 = 2112;
            v75 = v57;
            v76 = 2112;
            v77 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: dataClass:\"%@\", -accountsForAssets returned: %@", buf, 0x20u);
            _MBLog(CFSTR("INFO"), "%@: dataClass:\"%@\", -accountsForAssets returned: %@", v11, v57, v14);
          }
        }
        else
        {
          if (v11)
          {
            v17 = MBGetDefaultLog(v12, v13);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v11;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ doesn't implement -accountsForAssets", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "%@ doesn't implement -accountsForAssets", v11);
            }
          }
          v14 = 0;
        }
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v63 != v20)
                objc_enumerationMutation(v14);
              v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
              v24 = objc_msgSend(v22, "appleID");
              if (!v24)
              {
                v25 = MBGetDefaultLog(0, v23);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found nil appleID for %@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), "Found nil appleID for %@", v22);
                }
              }
              v27 = objc_msgSend(v22, "DSID");
              if (!v27)
              {
                v28 = MBGetDefaultLog(0, v26);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found nil DSID for %@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), "Found nil DSID for %@", v22);
                }
              }
              v30 = objc_msgSend(v22, "altDSID");
              if (!v30)
              {
                v31 = MBGetDefaultLog(0, v29);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Found nil altDSID for %@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), "Found nil altDSID for %@", v22);
                }
              }
              v32 = objc_msgSend(a5, "addAccountWithDSID:", v27);
              if ((v32 & 1) != 0)
              {
                objc_msgSend(v56, "addAppleID:DSID:altDSID:dataClass:", v24, objc_msgSend(v27, "stringValue"), v30, v57);
              }
              else
              {
                v34 = MBGetDefaultLog(v32, v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v73 = v24;
                  v74 = 2112;
                  v75 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Skipping account: %@/%@", buf, 0x16u);
                  _MBLog(CFSTR("INFO"), "Skipping account: %@/%@", v24, v27);
                }
              }
            }
            v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          }
          while (v19);
        }
        if ((objc_opt_respondsToSelector(v53, "appleIDsForAssets") & 1) != 0)
        {
          v35 = objc_msgSend(v53, "appleIDsForAssets");
          v37 = MBGetDefaultLog(v35, v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v73 = v53;
            v74 = 2112;
            v75 = v57;
            v76 = 2112;
            v77 = v35;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@: dataClass:\"%@\", -appleIDsForAssets returned: %@", buf, 0x20u);
            _MBLog(CFSTR("INFO"), "%@: dataClass:\"%@\", -appleIDsForAssets returned: %@", v53, v57, v35);
          }
          v38 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v35, "count"));
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v39 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v40; j = (char *)j + 1)
              {
                if (*(_QWORD *)v59 != v41)
                  objc_enumerationMutation(v35);
                v43 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(a5, "isIgnoredAppleID:", v43) & 1) == 0)
                  objc_msgSend(v38, "addObject:", v43);
              }
              v40 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
            }
            while (v40);
          }
          if (objc_msgSend(v38, "count"))
            objc_msgSend(v56, "addAppleIDsFromSet:dataClass:", v38, v57);

        }
        objc_autoreleasePoolPop(context);
        v8 = v55 + 1;
      }
      while ((id)(v55 + 1) != v52);
      v52 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v52);
  }
  v44 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if (v44)
  {
    v45 = objc_msgSend(v44, "accountName");
    v46 = objc_msgSend(a5, "isIgnoredAppleID:", v45);
    if ((v46 & 1) == 0)
    {
      v48 = MBGetDefaultLog(v46, v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v45;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Found active store account: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Found active store account: %@", v45);
      }
      objc_msgSend(v56, "setActiveAppleID:", v45);
    }
  }
}

- (void)_populateAccountsAndAssetsForEngine:(id)a3 accountsTracker:(id)a4
{
  unsigned int v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[9];
  char v18;
  uint8_t buf[4];
  id v20;

  if (!a4)
    sub_100088148();
  v6 = objc_msgSend(a3, "isDeviceTransferEngine");
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(a3, "preflightProperties");
  else
    v8 = objc_msgSend(a3, "properties");
  v9 = v8;
  v10 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  if (!v10)
    sub_100088170();
  v11 = v10;
  v12 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v13 = objc_alloc_init((Class)NSMutableSet);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003AEEC;
  v17[3] = &unk_1000D97C8;
  v17[4] = v13;
  v17[5] = a4;
  v17[6] = v12;
  v17[7] = v9;
  v18 = v7;
  v17[8] = v11;
  v14 = objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 0, v17);
  v16 = MBGetDefaultLog(v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found accounts: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Found accounts: %@", v13);
  }

}

- (void)_populateBuddyStashForEngine:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;

  v3 = objc_msgSend(a3, "properties");
  v4 = (void *)BYDataStashCreate();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "length");
    if ((unint64_t)v6 > 0x8000)
    {
      v8 = MBGetDefaultLog(v6, v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = objc_msgSend(v5, "length");
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "buddyStash exceeds 32k (%ld)", buf, 0xCu);
        _MBLog(CFSTR("FAULT"), "buddyStash exceeds 32k (%ld)", objc_msgSend(v5, "length"));
      }
    }
    objc_msgSend(v3, "setBuddyStashData:", v5);
  }
}

- (id)startingBackupWithEngine:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (objc_msgSend(a3, "backsUpPrimaryAccount"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[ATClientController allClients](+[ATClientController sharedInstance](ATClientController, "sharedInstance", 0), "allClients");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v10, "prepareForBackup") & 1) != 0)
            objc_msgSend(v10, "prepareForBackup");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    if (objc_msgSend(a3, "isDriveEngine"))
      -[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:](self, "_populatePathsForEngine:domain:dataclass:", a3, CFSTR("TonesDomain"), CFSTR("Ringtone"));
  }
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (objc_msgSend(a3, "backsUpPrimaryAccount"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = -[ATClientController allClients](+[ATClientController sharedInstance](ATClientController, "sharedInstance", 0), "allClients");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v8, "backupEnded") & 1) != 0)
            objc_msgSend(v8, "backupEnded");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
  }
  return 0;
}

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  return 1;
}

- (BOOL)shouldBackgroundRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  return 0;
}

@end
