@implementation MSDApplicationDataPrepareOperation

- (MSDApplicationDataPrepareOperation)initWithContext:(id)a3
{
  MSDApplicationDataPrepareOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDApplicationDataPrepareOperation;
  v3 = -[MSDOperation initWithContext:](&v8, "initWithContext:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDApplicationDataPrepareOperation setDataContainerPaths:](v3, "setDataContainerPaths:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDApplicationDataPrepareOperation setPlugInContainerPaths:](v3, "setPlugInContainerPaths:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDApplicationDataPrepareOperation setGroupContainerPaths:](v3, "setGroupContainerPaths:", v6);

  }
  return v3;
}

- (id)methodSelectors
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_lookupContainerPathsOnDevice"));
  v4 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_associateContainerPathWithContext"));
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_purgeContainerizedDataNotInManifest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v5, v7, 0));

  }
  return v6;
}

- (BOOL)_lookupContainerPathsOnDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataContainerURL"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataContainerURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationIdentifier"));
    objc_msgSend(v7, "setObject:forKey:", v9, v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupContainerURLs"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002500C;
  v31[3] = &unk_10013DEB0;
  v31[4] = self;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v31);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "plugInKitPlugins"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataContainerURL"));
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataContainerURL"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pluginIdentifier"));
          objc_msgSend(v19, "setObject:forKey:", v21, v22);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupContainerURLs"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10002508C;
        v26[3] = &unk_10013DEB0;
        v26[4] = self;
        objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v26);

        v16 = (char *)v16 + 1;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return 1;
}

- (BOOL)_associateContainerPathWithContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation allDependentOperations](self, "allDependentOperations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "demoUserHomePath"));

  v41 = v6;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PseudoContainers")));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "context"));
        v15 = objc_opt_class(MSDContentFilesContext, v14);
        isKindOfClass = objc_opt_isKindOfClass(v13, v15);

        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "context"));
          objc_msgSend(v3, "addObject:", v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v9);
  }
  v40 = v7;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v46;
    v42 = *(_QWORD *)v46;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier", v40));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containerType"));
        if (!objc_msgSend(v22, "containerized"))
        {
          v26 = 0;
          v28 = 0;
          goto LABEL_33;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueName"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingPathComponent:", v25));

        if (objc_msgSend(v24, "isEqualToString:", CFSTR("AppData")))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v23));

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
          goto LABEL_23;
        }
        if (objc_msgSend(v24, "isEqualToString:", CFSTR("ExtensionData")))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v23));

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          goto LABEL_23;
        }
        if (objc_msgSend(v24, "isEqualToString:", CFSTR("GroupData")))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", v23));

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
LABEL_23:
          v32 = v29;
          objc_msgSend(v29, "removeObjectForKey:", v23);

          v20 = v42;
          if (v26)
            goto LABEL_24;
          goto LABEL_27;
        }
        v28 = 0;
        if (v26)
        {
LABEL_24:
          v33 = sub_1000604F0();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v22;
            v55 = 2114;
            v56 = v26;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Container '%{public}@' assigned with pseudo content root path: %{public}@", buf, 0x16u);
          }

          objc_msgSend(v22, "setPseudoContentRootPath:", v26);
        }
LABEL_27:
        if (v28)
        {
          if (objc_msgSend(v28, "hasPrefix:", CFSTR("/private")))
          {
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length")));

            v28 = (void *)v35;
          }
          v36 = sub_1000604F0();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v22;
            v55 = 2114;
            v56 = v28;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Container '%{public}@' assigned with content root path: %{public}@", buf, 0x16u);
          }

          objc_msgSend(v22, "setContentRootPath:", v28);
        }
LABEL_33:

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      v19 = v38;
    }
    while (v38);
  }

  return 1;
}

- (BOOL)_purgeContainerizedDataNotInManifest
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000256E8;
  v9[3] = &unk_10013DED8;
  v9[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000257C8;
  v8[3] = &unk_10013DED8;
  v8[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000258A8;
  v7[3] = &unk_10013DED8;
  v7[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  return 1;
}

- (void)_createUninstallOperationForContainer:(id)a3 ofType:(id)a4 containerPath:(id)a5 isContainerized:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v16 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext defaultContextForContainerizedAppDataItem:](MSDContentFilesContext, "defaultContextForContainerizedAppDataItem:", v11));

    objc_msgSend(v14, "setContentRootPath:", v16);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:](MSDContentFilesContext, "defaultContextForNonContainerizedAppDataItem:", v11));

  }
  objc_msgSend(v14, "setContainerType:", v10);

  objc_msgSend(v14, "setAppIdentifier:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", CFSTR("MSDContentFilesUninstallOperation"), v14));
  -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v15, 0);

}

- (NSMutableDictionary)dataContainerPaths
{
  return self->_dataContainerPaths;
}

- (void)setDataContainerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainerPaths, a3);
}

- (NSMutableDictionary)plugInContainerPaths
{
  return self->_plugInContainerPaths;
}

- (void)setPlugInContainerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_plugInContainerPaths, a3);
}

- (NSMutableDictionary)groupContainerPaths
{
  return self->_groupContainerPaths;
}

- (void)setGroupContainerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_groupContainerPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContainerPaths, 0);
  objc_storeStrong((id *)&self->_plugInContainerPaths, 0);
  objc_storeStrong((id *)&self->_dataContainerPaths, 0);
}

@end
