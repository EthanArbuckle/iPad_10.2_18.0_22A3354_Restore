@implementation MIContainerLinkManager

- (void)_onQueue_migratePlaygroundsBundleMetadata
{
  MIContainerLinkManager *v2;
  NSObject *v3;
  NSMutableSet *v4;
  void *v5;
  unsigned int v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  id v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  MIContainerLinkManager *v38;
  NSMutableSet *v39;
  void *v40;
  NSMutableSet *v41;
  __CFString *v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  _BYTE v55[128];

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new(NSMutableSet);
  v54 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v53 = 0;
  v6 = objc_msgSend(v5, "isRunningInTestMode:outError:", &v54, &v53);
  v7 = v53;

  if (v6)
  {
    if (v54)
      v8 = CFSTR("com.apple.mock.Playgrounds");
    else
      v8 = CFSTR("com.apple.Playgrounds");
  }
  else
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v35 = v7;
      MOLogWrite(qword_10009E048, 5, "_PlaygroundsBundleID", CFSTR("Failed to determine if we're running in test mode: %@"));
    }
    v8 = CFSTR("com.apple.Playgrounds");
  }

  v9 = v8;
  v41 = objc_opt_new(NSMutableSet);
  v42 = v9;
  v52 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v9, 0, 0, &v52));
  v11 = v52;
  v12 = v11;
  if (v10)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MIContainerLinkManager _onQueue_migratePlaygroundsBundleMetadata]", CFSTR("Doing Swift Playgrounds' linked container migration from MCM to MI"));
    -[NSMutableSet addObject:](v4, "addObject:", v9, v35);
    v51 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleMetadataWithError:", &v51));
    v14 = v51;

    if (v13)
    {
      v50 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer containersWithClass:error:](MIBundleContainer, "containersWithClass:error:", 1, &v50));
      v12 = v50;

      if (v15)
      {
        v39 = v4;
        v40 = v13;
        v37 = v10;
        v38 = v2;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v47;
          v20 = v12;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              v22 = v20;
              if (*(_QWORD *)v47 != v19)
                objc_enumerationMutation(v16);
              v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
              v24 = objc_autoreleasePoolPush();
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
              v45 = v20;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bundleMetadataWithError:", &v45));
              v20 = v45;

              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "linkedParentBundleID"));
                v28 = objc_msgSend(v27, "isEqualToString:", v42);

                if (v28)
                  -[NSMutableSet addObject:](v41, "addObject:", v25);
              }
              else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v35 = v25;
                v36 = v20;
                MOLogWrite(qword_10009E048, 3, "-[MIContainerLinkManager _onQueue_migratePlaygroundsBundleMetadata]", CFSTR("Failed to read bundle metadata for %@: %@"));
              }

              objc_autoreleasePoolPop(v24);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v18);
        }
        else
        {
          v20 = v12;
        }

        v31 = -[NSMutableSet copy](v41, "copy");
        if (-[NSMutableSet count](v41, "count"))
        {
          objc_msgSend(v40, "setLinkedChildBundleIDs:", v31);
          v44 = v20;
          v10 = v37;
          v32 = objc_msgSend(v37, "saveBundleMetadata:withError:", v40, &v44);
          v12 = v44;

          v2 = v38;
          v4 = v39;
          if ((v32 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
              sub_1000526F4();
            goto LABEL_48;
          }
        }
        else
        {
          v12 = v20;
          v2 = v38;
          v4 = v39;
          v10 = v37;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_parentToLinkedChildrenMap, "setObject:forKeyedSubscript:", v31, v42, v35, v36);
LABEL_48:

        goto LABEL_49;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_10005268C();

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052624();
      v12 = v14;
    }
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    if (objc_msgSend(v29, "isEqualToString:", MIContainerManagerErrorDomain))
    {
      v30 = objc_msgSend(v12, "code");

      if (v30 == (id)21)
        goto LABEL_49;
    }
    else
    {

    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000525BC();
  }
LABEL_49:
  v43 = v12;
  v33 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:](v2, "_onQueue_setLinkedParentBundleIDList:error:", v4, &v43, v35);
  v34 = v43;

  if ((v33 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100052554();

}

- (MIContainerLinkManager)initWithDomain:(unint64_t)a3
{
  MIContainerLinkManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *parentToLinkedChildrenMap;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  _QWORD block[4];
  MIContainerLinkManager *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MIContainerLinkManager;
  v4 = -[MIContainerLinkManager init](&v17, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.installd.LinkedContainers", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    parentToLinkedChildrenMap = v4->_parentToLinkedChildrenMap;
    v4->_parentToLinkedChildrenMap = v7;

    v4->_domain = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v10 = sub_10002A8EC();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "itemDoesNotExistAtURL:", v11);

    if (a3 == 2)
    {
      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](v4, "internalQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002A950;
        block[3] = &unk_100084C30;
        v16 = v4;
        dispatch_sync(v13, block);

      }
    }
  }
  return v4;
}

+ (id)_sharedContainerManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A9CC;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFA0 != -1)
    dispatch_once(&qword_10009DFA0, block);
  return (id)qword_10009DFA8;
}

+ (id)_privateContainerManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA70;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFB0 != -1)
    dispatch_once(&qword_10009DFB0, block);
  return (id)qword_10009DFB8;
}

+ (id)sharedInstanceForDomain:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_class(a1);
  if (a3 == 3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_privateContainerManager"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_sharedContainerManager"));
  return v5;
}

- (id)_onQueue_linkedParentBundleIDs:(id *)a3
{
  NSObject *v5;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  NSSet *v16;
  NSSet *linkedParentBundleIDs;
  void *v18;
  id *v19;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  NSMutableSet *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  _BYTE v51[128];

  v5 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = self->_linkedParentBundleIDs;
  v7 = v6;
  if (!v6)
  {
    v9 = sub_10002A8EC();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v41 = objc_opt_new(NSMutableSet);
    v50 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v10, &v50));
    v12 = v50;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("linkedParentBundles")));
      objc_opt_class(NSArray);
      v14 = v13;
      if ((objc_opt_isKindOfClass(v14) & 1) != 0)
      {
        if (v14)
        {
          objc_opt_class(NSString);
          v15 = sub_100011190(v14);

          if ((v15 & 1) != 0)
          {
            v16 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
            linkedParentBundleIDs = self->_linkedParentBundleIDs;
            self->_linkedParentBundleIDs = v16;

            v18 = 0;
LABEL_38:
            v8 = self->_linkedParentBundleIDs;

            goto LABEL_39;
          }
        }
      }
      else
      {

      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100052830(v10);
    if ((id)-[MIContainerLinkManager domain](self, "domain") == (id)3)
    {
      v49 = v12;
      v19 = &v49;
      v20 = &v49;
      v21 = 14;
    }
    else
    {
      v48 = v12;
      v19 = &v48;
      v20 = &v48;
      v21 = 1;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer containersWithClass:error:](MIBundleContainer, "containersWithClass:error:", v21, v20));
    v22 = *v19;

    if (v18)
    {
      v38 = v11;
      v39 = a3;
      v40 = v10;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v37 = v18;
      v23 = v18;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v45;
LABEL_18:
        v27 = 0;
        v28 = v22;
        while (1)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v27);
          v30 = objc_autoreleasePoolPush();
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
          v43 = v28;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleMetadataWithError:", &v43));
          v22 = v43;

          if (!v32)
            break;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "linkedParentBundleID"));
          if (v33)
            -[NSMutableSet addObject:](v41, "addObject:", v33);

          objc_autoreleasePoolPop(v30);
          v27 = (char *)v27 + 1;
          v28 = v22;
          if (v25 == v27)
          {
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
            if (v25)
              goto LABEL_18;
            goto LABEL_26;
          }
        }
        v18 = v37;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_1000527C4();

        objc_autoreleasePoolPop(v30);
        v34 = 0;
        v10 = v40;
        v7 = 0;
        v11 = v38;
        a3 = v39;
        if (v39)
          goto LABEL_35;
        goto LABEL_37;
      }
LABEL_26:

      v42 = v22;
      v34 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:](self, "_onQueue_setLinkedParentBundleIDList:error:", v41, &v42);
      v35 = v42;

      v22 = v35;
      v10 = v40;
      v7 = 0;
      v11 = v38;
      a3 = v39;
      v18 = v37;
      if (!v39)
      {
LABEL_37:
        v12 = v22;
        goto LABEL_38;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_10005275C();
      v34 = 0;
      if (!a3)
        goto LABEL_37;
    }
LABEL_35:
    if ((v34 & 1) == 0)
    {
      v12 = objc_retainAutorelease(v22);
      *a3 = v12;
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  v8 = v6;
LABEL_39:

  return v8;
}

- (BOOL)_onQueue_setLinkedParentBundleIDList:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  NSSet *v16;
  NSSet *linkedParentBundleIDs;
  BOOL v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = sub_10002A8EC();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v6)
  {
    if ((-[NSSet isEqual:](self->_linkedParentBundleIDs, "isEqual:", v6) & 1) != 0)
    {
      v11 = 0;
      v12 = 0;
LABEL_7:
      v18 = 1;
      goto LABEL_14;
    }
    v24 = CFSTR("linkedParentBundles");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v25 = v14;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

    v23 = 0;
    v15 = objc_msgSend(v11, "MI_writeToURL:format:options:error:", v10, 200, 1, &v23);
    v12 = v23;
    if ((v15 & 1) != 0)
    {
      v16 = (NSSet *)objc_msgSend(v6, "copy");
      linkedParentBundleIDs = self->_linkedParentBundleIDs;
      self->_linkedParentBundleIDs = v16;

      goto LABEL_7;
    }
    v19 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      MOLogWrite(v19, 3, "-[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]", CFSTR("Failed to write current linked parent bundle IDs list to %@ : %@"));

    }
  }
  else
  {
    v13 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]", 290, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Updated linked parent list for linked bundles is nil"), v9, v21);
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    v11 = 0;
  }
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v18 = 0;
    *a4 = v12;
  }
  else
  {
    v18 = 0;
  }
LABEL_14:

  return v18;
}

- (BOOL)_onQueue_isValidLinkForParent:(id)a3 toChild:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v10);

  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager _onQueue_linkedParentBundleIDs:](self, "_onQueue_linkedParentBundleIDs:", &v19));
  v12 = v19;
  if (v11)
  {
    if (objc_msgSend(v11, "containsObject:", v9))
    {
      v14 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]", 331, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Existing parent app bundle ID \"%@\" can't be added as a child of \"%@\"."), v13, (uint64_t)v9);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", v8))
      {
        v17 = 1;
        goto LABEL_11;
      }
      v14 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]", 336, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Same bundle ID, \"%@\", can't be passed as a parent and child for linkage creation"), v15, (uint64_t)v9);
    }
    v16 = objc_claimAutoreleasedReturnValue(v14);

    v12 = (id)v16;
  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v17 = 0;
    *a5 = v12;
  }
  else
  {
    v17 = 0;
  }
LABEL_11:

  return v17;
}

- (BOOL)_onQueue_updateLinkForParent:(id)a3 toChild:(id)a4 operationType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  unsigned int v31;
  id v32;
  id v33;
  unsigned __int8 v34;
  unsigned int v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  NSMutableSet *v40;
  id v41;
  int v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;

  v10 = a3;
  v45 = a4;
  v11 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));

  v52 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager _onQueue_linkedParentBundleIDs:](self, "_onQueue_linkedParentBundleIDs:", &v52));
  v14 = v52;
  if (!v13)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    if (a6)
    {
LABEL_16:
      v14 = objc_retainAutorelease(v14);
      v21 = 0;
      *a6 = v14;
      goto LABEL_17;
    }
LABEL_5:
    v21 = 0;
    goto LABEL_17;
  }
  v43 = objc_msgSend(v13, "mutableCopy");
  if ((id)-[MIContainerLinkManager domain](self, "domain") == (id)3)
  {
    v51 = v14;
    v15 = &v51;
    v16 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:", v10, 0, 0, &v51));
  }
  else
  {
    v50 = v14;
    v15 = &v50;
    v16 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v10, 0, 0, &v50));
  }
  v20 = (void *)v16;
  v22 = *v15;

  if (!v20)
  {
    v28 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 376, MIInstallerErrorDomain, 162, v22, 0, CFSTR("Failed to locate installed app for requested parent bundle %@"), v23, (uint64_t)v10);
    v14 = (id)objc_claimAutoreleasedReturnValue(v28);

    v17 = 0;
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v49 = v22;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleMetadataWithError:", &v49));
  v24 = v49;

  if (!v17)
  {
    v29 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 382, MIInstallerErrorDomain, 4, v24, 0, CFSTR("Failed to read bundle metadata for requested parent bundle %@"), v25, (uint64_t)v10);
    v14 = (id)objc_claimAutoreleasedReturnValue(v29);

    goto LABEL_14;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "linkedChildBundleIDs"));
  v18 = (NSMutableSet *)objc_msgSend(v26, "mutableCopy");

  if (v44)
  {
    if ((-[NSMutableSet isEqualToSet:](v18, "isEqualToSet:") & 1) != 0)
    {
      v42 = 0;
      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000528BC();
  }
  v42 = 1;
LABEL_21:
  if (a5 == 1)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v39 = v45;
      v41 = v10;
      MOLogWrite(qword_10009E048, 5, "-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", CFSTR("Unlinking child %@ from parent %@"));
    }
    if (-[NSMutableSet containsObject:](v18, "containsObject:", v45, v39, v41))
    {
      -[NSMutableSet removeObject:](v18, "removeObject:", v45);
      v42 = 1;
    }
    if (!-[NSMutableSet count](v18, "count"))
      objc_msgSend(v43, "removeObject:", v10);
    v32 = v24;
  }
  else
  {
    if (a5)
    {
      v38 = sub_100010E50((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 443, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Container link manager invoked with invalid operation type %lu"), v27, a5);
      v14 = (id)objc_claimAutoreleasedReturnValue(v38);

      goto LABEL_15;
    }
    v48 = v24;
    v31 = -[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:](self, "_onQueue_isValidLinkForParent:toChild:error:", v10, v45, &v48);
    v32 = v48;

    if (!v31)
    {
      v14 = v32;
      goto LABEL_15;
    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v39 = v10;
      v41 = v45;
      MOLogWrite(qword_10009E048, 5, "-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", CFSTR("Linking parent %@ to child %@"));
    }
    if ((-[NSMutableSet containsObject:](v18, "containsObject:", v45, v39, v41) & 1) == 0)
    {
      if (!v18)
        v18 = objc_opt_new(NSMutableSet);
      -[NSMutableSet addObject:](v18, "addObject:", v45);
      v42 = 1;
    }
    if ((objc_msgSend(v43, "containsObject:", v10) & 1) == 0)
      objc_msgSend(v43, "addObject:", v10);
  }
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v40 = v18;
    MOLogWrite(qword_10009E048, 7, "-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", CFSTR("Linked children bundle IDs are : %@"));
  }
  v33 = -[NSMutableSet copy](v18, "copy", v40);
  objc_msgSend(v17, "setLinkedChildBundleIDs:", v33);

  if (v42)
  {
    v47 = v32;
    v34 = objc_msgSend(v20, "saveBundleMetadata:withError:", v17, &v47);
    v14 = v47;

    if ((v34 & 1) != 0)
    {
      v32 = v14;
      goto LABEL_47;
    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", CFSTR("Failed to save bundle metadata for %@ after updating linked children with: %@"));
LABEL_15:
    v19 = v43;
    if (a6)
      goto LABEL_16;
    goto LABEL_5;
  }
LABEL_47:
  v46 = v32;
  v35 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:](self, "_onQueue_setLinkedParentBundleIDList:error:", v43, &v46);
  v14 = v46;

  if (!v35)
    goto LABEL_15;
  if (v42)
  {
    v36 = -[NSMutableSet copy](v18, "copy");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v10);

  }
  v21 = 1;
  v19 = v43;
LABEL_17:

  return v21;
}

- (BOOL)preflightLinkingChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002B988;
  v25 = sub_10002B998;
  v26 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B9A0;
  block[3] = &unk_100085668;
  v19 = &v27;
  block[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v20 = &v21;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)linkChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002B988;
  v25 = sub_10002B998;
  v26 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BB90;
  block[3] = &unk_100085668;
  v19 = &v27;
  block[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v20 = &v21;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)unlinkChild:(id)a3 fromParent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10002B988;
  v25 = sub_10002B998;
  v26 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BD84;
  block[3] = &unk_100085668;
  v19 = &v27;
  block[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v20 = &v21;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)getLinkedParent:(id *)a3 forChild:(id)a4 error:(id *)a5
{
  id v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  if ((id)-[MIContainerLinkManager domain](self, "domain") == (id)3)
  {
    v22 = 0;
    v9 = (id *)&v22;
    v10 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:", v8, 0, 0, &v22));
  }
  else
  {
    v21 = 0;
    v9 = (id *)&v21;
    v10 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v8, 0, 0, &v21));
  }
  v11 = (void *)v10;

  v12 = *v9;
  v13 = v12;
  if (v11)
  {
    v20 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleMetadataWithError:", &v20));
    v15 = v20;

    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "linkedParentBundleID"));
      v17 = 1;
      if (!a3)
        goto LABEL_19;
      goto LABEL_18;
    }
    v17 = 0;
    v13 = v15;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
    if (objc_msgSend(v18, "isEqualToString:", MIContainerManagerErrorDomain))
      v17 = objc_msgSend(v13, "code") == (id)21;
    else
      v17 = 0;

  }
  v14 = 0;
  if (a5 && !v17)
  {
    v15 = objc_retainAutorelease(v13);
    v17 = 0;
    v14 = 0;
    v16 = 0;
    *a5 = v15;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  v15 = v13;
  v16 = 0;
  if (a3)
LABEL_18:
    *a3 = objc_retainAutorelease(v16);
LABEL_19:

  return v17;
}

- (id)_onQueue_childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSSet *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *v15;
  NSSet *v16;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager _onQueue_linkedParentBundleIDs:](self, "_onQueue_linkedParentBundleIDs:", &v22));
  v9 = v22;
  if (!v8)
  {
    v14 = 0;
LABEL_8:
    v15 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    v14 = objc_opt_new(NSSet);
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

  if (v11)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v21 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v6, 0, 0, &v21));
    v18 = v21;

    if (!v13)
    {
      v14 = 0;
      v15 = 0;
      v12 = 0;
      v9 = v18;
      goto LABEL_9;
    }
    v20 = v18;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleMetadataWithError:", &v20));
    v9 = v20;

    if (!v12)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "linkedChildBundleIDs"));
    if (!v11)
      v11 = objc_opt_new(NSSet);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, v6);

  }
  v14 = v11;
  v15 = v14;
LABEL_9:
  if (a4 && !v14)
    *a4 = objc_retainAutorelease(v9);
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "-[MIContainerLinkManager _onQueue_childrenForParentBundleID:error:]", CFSTR("Children for parent bundle %@ : %@"));
  v16 = v14;

  return v16;
}

- (id)childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10002B988;
  v26 = sub_10002B998;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10002B988;
  v20 = sub_10002B998;
  v21 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C350;
  v12[3] = &unk_100084EF0;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)_onQueue_removeParent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  BOOL v14;
  id v16;
  id v17;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager _onQueue_linkedParentBundleIDs:](self, "_onQueue_linkedParentBundleIDs:", &v17));
  v9 = v17;
  if (!v8)
  {
    v10 = 0;
    if (!a4)
    {
LABEL_12:
      v14 = 0;
      goto LABEL_13;
    }
LABEL_6:
    v9 = objc_retainAutorelease(v9);
    v14 = 0;
    *a4 = v9;
    goto LABEL_13;
  }
  if (!objc_msgSend(v8, "containsObject:", v6))
  {
    v10 = 0;
    v14 = 1;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "removeObject:", v6);
  v16 = v9;
  v11 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:](self, "_onQueue_setLinkedParentBundleIDList:error:", v10, &v16);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
      MOLogWrite(qword_10009E048, 7, "-[MIContainerLinkManager _onQueue_removeParent:error:]", CFSTR("Failed to save linked parent bundle list: %@"));
    v9 = v12;
    if (!a4)
      goto LABEL_12;
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  objc_msgSend(v13, "removeObjectForKey:", v6);

  v14 = 1;
  v9 = v12;
LABEL_13:

  return v14;
}

- (BOOL)removeParent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10002B988;
  v20 = sub_10002B998;
  v21 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C6BC;
  v12[3] = &unk_100084EF0;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((unsigned __int8 *)v23 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)parentToLinkedChildrenMap
{
  return self->_parentToLinkedChildrenMap;
}

- (void)setParentToLinkedChildrenMap:(id)a3
{
  objc_storeStrong((id *)&self->_parentToLinkedChildrenMap, a3);
}

- (NSSet)linkedParentBundleIDs
{
  return self->_linkedParentBundleIDs;
}

- (void)setLinkedParentBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_linkedParentBundleIDs, a3);
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(unint64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentBundleIDs, 0);
  objc_storeStrong((id *)&self->_parentToLinkedChildrenMap, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
