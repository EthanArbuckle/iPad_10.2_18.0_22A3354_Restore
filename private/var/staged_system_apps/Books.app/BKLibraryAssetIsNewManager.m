@implementation BKLibraryAssetIsNewManager

- (void)mocDidSave:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSPredicate *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *m;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSPredicate *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *n;
  id v34;
  void *v35;
  float v36;
  float v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  unsigned __int8 v61;
  id v62;
  id v63;
  uint64_t v64;
  void *j;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  BOOL v71;
  void *v72;
  NSObject *v73;
  id v74;
  uint64_t v75;
  void *k;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v97;
  void *v98;
  id v99;
  id v100;
  _QWORD v101[5];
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD block[6];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t);
  void (*v135)(uint64_t);
  id v136;

  v94 = a3;
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "object"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "persistentStoreCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager annotationProvider](self, "annotationProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));

  if (v3 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "persistentStoreCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentStoreCoordinator"));
    if (v6 != v8)
    {

      goto LABEL_103;
    }
    v41 = objc_opt_class(BKLibraryManagedObjectContext);
    v42 = BUDynamicCast(v41, v95);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = objc_msgSend(v43, "sessionContextType");

    if (v44 == 4)
      goto LABEL_103;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "userInfo"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:"));
    if (objc_msgSend(v89, "count"))
      objc_msgSend(v90, "unionSet:", v89);
    if (objc_msgSend(v88, "count"))
      objc_msgSend(v90, "unionSet:", v88);
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v90, "count"))
    {
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v45 = v90;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(_QWORD *)v112 != v47)
              objc_enumerationMutation(v45);
            v49 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "entity"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));
            v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("BKLibraryAsset"));

            if (v52)
            {
              v53 = objc_opt_class(BKLibraryAsset);
              v54 = BUDynamicCast(v53, v49);
              v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
              if (!objc_msgSend(v55, "isLocal")
                || (objc_msgSend(v55, "isAudiobook") & 1) != 0)
              {
                goto LABEL_68;
              }
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "epubID"));
              if (!v56
                || (v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "epubID")),
                    (objc_msgSend(v97, "isEqualToString:", &stru_10091C438) & 1) != 0))
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "path"));
                if (v57)
                {
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "path"));
                  v59 = objc_msgSend(v58, "length");

                  if (v56)
                  {

                    if (!v59)
                      goto LABEL_68;
LABEL_66:
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "assetID"));
                    objc_msgSend(v93, "addObject:", v56);
LABEL_67:

                  }
                  else if (v59)
                  {
                    goto LABEL_66;
                  }
LABEL_68:

                  continue;
                }
                if (!v56)
                  goto LABEL_68;
              }

              goto LABEL_67;
            }
          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
        }
        while (v46);
      }

      if (objc_msgSend(v93, "count"))
      {
        -[BKLibraryAssetIsNewManager p_processEpubIDForAssetIDs:](self, "p_processEpubIDForAssetIDs:", v93);
        -[BKLibraryAssetIsNewManager resetIsNewForAssetIDs:](self, "resetIsNewForAssetIDs:", v93);
      }
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager delegate](self, "delegate"));
    v61 = objc_msgSend(v60, "isSyncingEnabledForIsNewManager:", self);

    if ((v61 & 1) != 0)
    {
      v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:", NSUpdatedObjectsKey));
      if (!objc_msgSend(v62, "count"))
      {
LABEL_102:

        goto LABEL_103;
      }
      v99 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v62 = v62;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v104;
        do
        {
          for (j = 0; j != v63; j = (char *)j + 1)
          {
            if (*(_QWORD *)v104 != v64)
              objc_enumerationMutation(v62);
            v66 = *(id *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)j);
            v67 = objc_opt_class(BKLibraryAsset);
            v68 = BUDynamicCast(v67, v66);
            v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
            if ((objc_msgSend(v69, "isDeleted") & 1) == 0)
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "seriesID"));
              v71 = v70 == 0;

              if (!v71)
              {
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "seriesID"));
                objc_msgSend(v99, "addObject:", v72);

              }
            }

          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
        }
        while (v63);
      }

      if (objc_msgSend(v99, "count"))
      {
        v73 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager processSeriesBooksQueue](self, "processSeriesBooksQueue"));
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_10014CB08;
        v101[3] = &unk_1008E7338;
        v101[4] = self;
        v100 = v99;
        v102 = v100;
        dispatch_async(v73, v101);

        goto LABEL_102;
      }
    }
    else
    {
      v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:", NSInsertedObjectsKey));
      if (!objc_msgSend(v62, "count"))
        goto LABEL_102;
      v99 = objc_alloc_init((Class)NSMutableSet);
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v62 = v62;
      v74 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
      if (v74)
      {
        v75 = *(_QWORD *)v108;
        do
        {
          for (k = 0; k != v74; k = (char *)k + 1)
          {
            if (*(_QWORD *)v108 != v75)
              objc_enumerationMutation(v62);
            v77 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "entity"));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "name"));
            v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("BKLibraryAsset"));

            if (v80)
            {
              v81 = objc_opt_class(BKLibraryAsset);
              v82 = BUDynamicCast(v81, v77);
              v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "assetID"));

              if (v84)
              {
                v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "assetID"));
                objc_msgSend(v99, "addObject:", v85);

              }
            }
          }
          v74 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
        }
        while (v74);
      }

      if (objc_msgSend(v99, "count"))
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "allObjects"));
        -[BKLibraryAssetIsNewManager resetIsNewForAssetIDs:](self, "resetIsNewForAssetIDs:", v86);

        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "allObjects"));
        -[BKLibraryAssetIsNewManager resetProgressHighWaterMarkForAssetIDs:](self, "resetProgressHighWaterMarkForAssetIDs:", v87);

      }
    }

    goto LABEL_102;
  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKey:", NSInsertedObjectsKey));
  v10 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF isKindOfClass: %@"), objc_opt_class(AEAnnotation));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredSetUsingPredicate:", v11));

  if (objc_msgSend(v92, "count"))
  {
    v12 = objc_alloc_init((Class)NSMutableSet);
    v13 = objc_alloc_init((Class)NSMutableSet);
    v131 = 0;
    v132 = &v131;
    v133 = 0x3032000000;
    v134 = sub_10004E458;
    v135 = sub_10004E2A0;
    v136 = 0;
    v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager markedAssetsQueue](self, "markedAssetsQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014CA78;
    block[3] = &unk_1008E75B8;
    block[5] = &v131;
    block[4] = self;
    dispatch_sync(v14, block);

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v15 = v92;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v122;
      do
      {
        for (m = 0; m != v16; m = (char *)m + 1)
        {
          if (*(_QWORD *)v122 != v17)
            objc_enumerationMutation(v15);
          v19 = *(id *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)m);
          if ((objc_msgSend(v19, "isDeleted") & 1) == 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "annotationAssetID"));
            if ((objc_msgSend((id)v132[5], "containsObject:", v20) & 1) == 0)
              objc_msgSend(v12, "addObject:", v20);
            if (objc_msgSend(v19, "annotationType") == 3)
              objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
      }
      while (v16);
    }

    v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager markedAssetsQueue](self, "markedAssetsQueue"));
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_10014CAC8;
    v119[3] = &unk_1008E7338;
    v119[4] = self;
    v22 = v12;
    v120 = v22;
    dispatch_async(v21, v119);

    if (objc_msgSend(v22, "count"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
      -[BKLibraryAssetIsNewManager resetIsNewForAssetIDs:](self, "resetIsNewForAssetIDs:", v23);

    }
    if (objc_msgSend(v13, "count"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      -[BKLibraryAssetIsNewManager resetProgressHighWaterMarkForAssetIDs:](self, "resetProgressHighWaterMarkForAssetIDs:", v24);

    }
    _Block_object_dispose(&v131, 8);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKey:", NSUpdatedObjectsKey));
  v26 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF isKindOfClass: %@"), objc_opt_class(AEAnnotation));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filteredSetUsingPredicate:", v27));

  if (objc_msgSend(v28, "count"))
  {
    v29 = objc_alloc_init((Class)NSMutableSet);
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v116;
      do
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(_QWORD *)v116 != v32)
            objc_enumerationMutation(v30);
          v34 = *(id *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)n);
          if (objc_msgSend(v34, "annotationType") == 3)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "annotationAssetID"));
            objc_msgSend(v34, "readingProgress");
            if (v36 < 0.0 || (objc_msgSend(v34, "readingProgress"), v37 > 1.0))
            {
              v38 = sub_100063710();
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                sub_1006A2524((uint8_t *)&v131, v34, (double *)((char *)&v131 + 4), v39);

            }
            objc_msgSend(v29, "addObject:", v35);

          }
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
      }
      while (v31);
    }

    if (objc_msgSend(v29, "count"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allObjects"));
      -[BKLibraryAssetIsNewManager resetProgressHighWaterMarkForAssetIDs:](self, "resetProgressHighWaterMarkForAssetIDs:", v40);

    }
  }

LABEL_103:
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BKLibraryAssetIsNewManagerDelegate *)a3;
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (BKLibraryAssetIsNewManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKLibraryAssetIsNewManager *v12;
  BKLibraryAssetIsNewManager *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *markedAssetsQueue;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *processEPUBIDQueue;
  dispatch_queue_t v24;
  OS_dispatch_queue *processSeriesBooksQueue;
  NSMutableSet *v26;
  NSMutableSet *markedAssets;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  BKLibraryAssetIsNewManager *v32;
  BUCoalescingCallBlock *v33;
  BUCoalescingCallBlock *coalescedResetNextInSeries;
  NSMutableSet *v35;
  NSMutableSet *seriesIDsToResetNext;
  id v37;
  NSObject *v38;
  id v39;
  BUCoalescingCallBlock *v40;
  BUCoalescingCallBlock *coalescedMigrateAudiobookProgress;
  void *v42;
  _QWORD v44[4];
  id v45;
  uint8_t buf[16];
  _QWORD v47[4];
  BKLibraryAssetIsNewManager *v48;
  id v49;
  id location;
  objc_super v51;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v51.receiver = self;
  v51.super_class = (Class)BKLibraryAssetIsNewManager;
  v12 = -[BKLibraryAssetIsNewManager init](&v51, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workerQueue, a5);
    objc_storeStrong((id *)&v13->_libraryManager, a3);
    objc_storeStrong((id *)&v13->_annotationProvider, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager", v15);
    markedAssetsQueue = v13->_markedAssetsQueue;
    v13->_markedAssetsQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_BACKGROUND, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);

    v22 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager.processEPUBID", v21);
    processEPUBIDQueue = v13->_processEPUBIDQueue;
    v13->_processEPUBIDQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager.processSeriesBooks", v21);
    processSeriesBooksQueue = v13->_processSeriesBooksQueue;
    v13->_processSeriesBooksQueue = (OS_dispatch_queue *)v24;

    v26 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    markedAssets = v13->_markedAssets;
    v13->_markedAssets = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v13, "mocDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v13, "libraryOwnershipDidChange:", BKLibraryOwnershipDidChangeNotification, 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    objc_msgSend(v30, "addObserver:", v13);

    objc_initWeak(&location, v13);
    v31 = objc_alloc((Class)BUCoalescingCallBlock);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10014C5AC;
    v47[3] = &unk_1008EC1A8;
    objc_copyWeak(&v49, &location);
    v32 = v13;
    v48 = v32;
    v33 = (BUCoalescingCallBlock *)objc_msgSend(v31, "initWithNotifyBlock:blockDescription:", v47, CFSTR("BKLibraryAssetIsNewManager coalescedResetNextInSeries"));
    coalescedResetNextInSeries = v32->_coalescedResetNextInSeries;
    v32->_coalescedResetNextInSeries = v33;

    v35 = objc_opt_new(NSMutableSet);
    seriesIDsToResetNext = v32->_seriesIDsToResetNext;
    v32->_seriesIDsToResetNext = v35;

    if (-[BKLibraryAssetIsNewManager audiobookProgressMigrationComplete](v32, "audiobookProgressMigrationComplete"))
    {
      v37 = sub_100063710();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "No need to migrate audiobook progress, migration is complete", buf, 2u);
      }

    }
    else
    {
      v39 = objc_alloc((Class)BUCoalescingCallBlock);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10014C950;
      v44[3] = &unk_1008E8718;
      objc_copyWeak(&v45, &location);
      v40 = (BUCoalescingCallBlock *)objc_msgSend(v39, "initWithNotifyBlock:blockDescription:", v44, CFSTR("BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress"));
      coalescedMigrateAudiobookProgress = v32->_coalescedMigrateAudiobookProgress;
      v32->_coalescedMigrateAudiobookProgress = v40;

      -[BUCoalescingCallBlock setCoalescingDelay:](v32->_coalescedMigrateAudiobookProgress, "setCoalescingDelay:", 30.0);
      -[BUCoalescingCallBlock setMaximumDelay:](v32->_coalescedMigrateAudiobookProgress, "setMaximumDelay:", 300.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v42, "addObserver:selector:name:object:", v32, "_mediaLibraryDidChange:", MPMediaLibraryDidChangeNotification, 0);

      objc_destroyWeak(&v45);
    }

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  return v13;
}

- (BOOL)audiobookProgressMigrationComplete
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (uint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("AudiobookProgressMigrationGenerationCompleted"));

  return v3 > 1;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void)setAudiobookProgressMigrationComplete:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = v4;
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  objc_msgSend(v4, "setInteger:forKey:", v5, CFSTR("AudiobookProgressMigrationGenerationCompleted"));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, MPMediaLibraryDidChangeNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAssetIsNewManager;
  -[BKLibraryAssetIsNewManager dealloc](&v6, "dealloc");
}

- (void)libraryOwnershipDidChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v23;
  NSMutableArray *v24;
  id obj;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = a3;
  v26 = objc_opt_new(NSMutableArray);
  v23 = v3;
  v24 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BKLibraryOwnershipAssetsKey));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v28 = *(_QWORD *)v30;
    v27 = BKLibraryOwnershipOldDatasourceKey;
    v8 = BKLibraryOwnershipNewDatasourceKey;
    v9 = BKLibraryOwnershipAssetIDKey;
    v10 = BKLibraryOwnershipNewStateKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v27));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
        v15 = (void *)v14;
        if (v13)
          v16 = 1;
        else
          v16 = v14 == 0;
        if (!v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
          if (v17)
            -[NSMutableArray addObject:](v24, "addObject:", v17);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
        v19 = objc_msgSend(v18, "integerValue");

        v20 = v19 << 16;
        if (v19 << 16 == 0x10000 || v20 == 0x40000 || v20 == 0x20000)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
          -[NSMutableArray addObject:](v26, "addObject:", v21);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](v26, "count"))
  {
    -[BKLibraryAssetIsNewManager resetIsNewForAssetIDs:](self, "resetIsNewForAssetIDs:", v26);
    -[BKLibraryAssetIsNewManager resetSeriesContainerSortAuthorForAssetIDs:](self, "resetSeriesContainerSortAuthorForAssetIDs:", v26);
  }

}

- (void)_mediaLibraryDidChange:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress](self, "coalescedMigrateAudiobookProgress", a3));

  if (v4)
  {
    v5 = sub_100063710();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a notification that the media library did change.  Signalling the coalesced migration block", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress](self, "coalescedMigrateAudiobookProgress"));
    objc_msgSend(v7, "signalWithCompletion:", &stru_1008EC1E8);

  }
}

- (void)resetIsNewIfNeeded
{
  -[BKLibraryAssetIsNewManager resetIsNewForAssetIDs:](self, "resetIsNewForAssetIDs:", 0);
}

- (void)resetSeriesContainerSortAuthorForAssetIDs:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  BKLibraryAssetIsNewManager *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10014CF98;
    v6[3] = &unk_1008E8398;
    v7 = v4;
    v8 = self;
    objc_msgSend(v5, "performBlockOnWorkerQueue:", v6);

  }
}

- (void)resetIsNewForAssetIDs:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (!v4 || v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager workerQueue](self, "workerQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014D2EC;
    v7[3] = &unk_1008E7338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

- (void)resetProgressHighWaterMarkForAssetIDs:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (!v4 || v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager workerQueue](self, "workerQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014E0C4;
    v7[3] = &unk_1008E7338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

- (void)p_processEpubIDForLibraryAssets:(id)a3 handlingEpubID:(id)a4 foundAssetHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v8 = a3;
  v33 = a4;
  v32 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager processEPUBIDQueue](self, "processEPUBIDQueue"));
  dispatch_assert_queue_V2(v9);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v34 = AEHelperStringMetadataBookIdUrlIdentifierKey;
    v35 = v10;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          if (objc_msgSend(v18, "length"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "epubID"));

            if (!v19)
            {
              v20 = objc_autoreleasePoolPush();
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));

              v23 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pluginForURL:", v22));

              if (v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "helperForURL:withOptions:", v22, 0));
                if (v25)
                {
                  v26 = objc_opt_class(NSString);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "helperMetadataForKey:needsCoordination:", v34, 1));
                  v28 = BUDynamicCast(v26, v27);
                  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

                  if (objc_msgSend(v29, "length"))
                  {
                    objc_msgSend(v15, "setDifferentString:forKey:", v29, CFSTR("epubID"));
                    v10 = v35;
                    if (objc_msgSend(v29, "isEqualToString:", v33))
                    {
                      v30 = objc_retainBlock(v32);
                      v31 = v30;
                      if (v30)
                        (*((void (**)(id))v30 + 2))(v30);

                    }
                  }
                  else
                  {
                    objc_msgSend(v15, "setDifferentString:forKey:", &stru_10091C438, CFSTR("epubID"));
                    v10 = v35;
                  }

                }
              }

              objc_autoreleasePoolPop(v20);
            }
          }
          else
          {

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

}

- (void)p_processEpubIDForAssetIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager processEPUBIDQueue](self, "processEPUBIDQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014EC38;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateStaleEpubIDs
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014EE0C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateLibraryAssetEpubIDsHandling:(id)a3 foundAssetHandler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager processEPUBIDQueue](self, "processEPUBIDQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014EED8;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)_resetNextForSeriesID:(id)a3 inMOC:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _UNKNOWN **v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  float v37;
  _BOOL4 v38;
  BOOL v39;
  BKLibraryAssetIsNewManager *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  void *v64;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *context;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  uint64_t v83;
  id v84;
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  void *v90;
  _QWORD v91[2];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    context = objc_autoreleasePoolPush();
    v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
    v91[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predicateForLibraryAssetsWithSeriesID:", v6));
    v91[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));
    objc_msgSend(v8, "setPredicate:", v13);

    v14 = BCMutableCloudSyncVersions_ptr;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 0));
    v90 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1));
    objc_msgSend(v8, "setSortDescriptors:", v16);

    objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v8, "setFetchLimit:", 1);
    v84 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v84));
    v18 = v84;
    if (!objc_msgSend(v17, "count"))
    {
      LOBYTE(v42) = 0;
LABEL_35:

      objc_autoreleasePoolPop(context);
      v39 = v42 & 1;
      goto LABEL_36;
    }
    v71 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    v76 = v7;
    v70 = v18;
    v72 = v6;
    v73 = v19;
    if (!v19
      || (v20 = v19,
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "seriesSortKey")),
          v21,
          !v21))
    {
      v40 = self;
      v41 = 0;
      LOBYTE(v42) = 0;
      v27 = BCMutableCloudSyncVersions_ptr;
LABEL_21:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](v40, "libraryManager"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "predicateForLibraryAssetsWithSeriesID:", v6));

      v46 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForNextInSeriesLibraryAssets](BKLibraryManager, "predicateForNextInSeriesLibraryAssets"));
      v47 = v27[306];
      v67 = (void *)v46;
      v69 = (void *)v45;
      v87[0] = v45;
      v87[1] = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[298], "arrayWithObjects:count:", v87, 2));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "andPredicateWithSubpredicates:", v48));

      if (v41)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "assetID"));
        v7 = v76;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("assetID"), v50));

        v52 = v27[306];
        v86[0] = v49;
        v86[1] = v51;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[298], "arrayWithObjects:count:", v86, 2));
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "andPredicateWithSubpredicates:", v53));

        v49 = (void *)v54;
      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
      objc_msgSend(v55, "setPredicate:", v49);
      objc_msgSend(v55, "setFetchBatchSize:", 50);
      v82 = 0;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v55, &v82));
      v57 = v82;
      v58 = v57;
      if (v56)
      {
        v66 = v57;
        v75 = v41;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v59 = v56;
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(_QWORD *)v79 != v62)
                objc_enumerationMutation(v59);
              v64 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v64, "seriesNextFlag"))
              {
                objc_msgSend(v64, "setSeriesNextFlag:", 0);
                LOBYTE(v42) = 1;
              }
            }
            v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
          }
          while (v61);
        }

        v6 = v72;
        v41 = v75;
        v7 = v76;
        v58 = v66;
      }

      v18 = v70;
      v17 = v71;
      goto LABEL_35;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "predicateForLibraryAssetsWithSeriesID:", v6));
    v89[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "seriesSortKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("seriesSortKey"), v24));
    v89[1] = v25;
    v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));

    v27 = BCMutableCloudSyncVersions_ptr;
    v68 = (void *)v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v26));
    objc_msgSend(v8, "setPredicate:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 1));
    v88[0] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 1));
    v88[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
    objc_msgSend(v8, "setSortDescriptors:", v31);

    v83 = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v83));
    if (objc_msgSend(v32, "count"))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      if (v74)
      {
        v33 = v73;
        v34 = objc_msgSend(v73, "isSample");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bookHighWaterMarkProgress"));
        v6 = v72;
        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bookHighWaterMarkProgress"));
          objc_msgSend(v36, "floatValue");
          v38 = v37 > 0.8;

          v33 = v73;
        }
        else
        {
          v38 = 0;
        }

        if (objc_msgSend(v33, "isNew"))
        {
          v43 = v74;
          v42 = 0;
          v7 = v76;
          v27 = BCMutableCloudSyncVersions_ptr;
          v14 = BCMutableCloudSyncVersions_ptr;
          if ((objc_msgSend(v74, "seriesNextFlag") & 1) == 0)
          {
            v40 = self;
            goto LABEL_20;
          }
        }
        else
        {
          v43 = v74;
          v42 = v38 & ((objc_msgSend(v74, "isCloud") | v34) ^ 1);
          v7 = v76;
          v27 = BCMutableCloudSyncVersions_ptr;
          v14 = BCMutableCloudSyncVersions_ptr;
          if (objc_msgSend(v74, "seriesNextFlag") == (_DWORD)v42)
          {
            v40 = self;
            LOBYTE(v42) = 0;
            goto LABEL_20;
          }
        }
        v40 = self;
        objc_msgSend(v43, "setSeriesNextFlag:", v42);
        LOBYTE(v42) = 1;
        goto LABEL_20;
      }
    }
    v40 = self;
    v74 = 0;
    LOBYTE(v42) = 0;
    v6 = v72;
    v14 = BCMutableCloudSyncVersions_ptr;
LABEL_20:

    v41 = v74;
    goto LABEL_21;
  }
  v39 = 0;
LABEL_36:

  return v39;
}

- (void)_alternateProgressInfoForLocalAssetIDs:(id)a3 cloudAssetIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10014F8AC;
  v14[3] = &unk_1008EC2F8;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BKMediaLibraryCache sharedCache](BKMediaLibraryCache, "sharedCache"));
  v15 = v11;
  v12 = v9;
  v16 = v12;
  objc_copyWeak(&v18, &location);
  v13 = v10;
  v17 = v13;
  objc_msgSend(v11, "fetchAssetsWithIDs:type:completion:", v8, 0, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)migrateAudiobookProgressIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress](self, "coalescedMigrateAudiobookProgress"));

  if (v3)
  {
    v4 = sub_100063710();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "migrateAudiobookProgressIfNeeded signalling coalescing call block", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress](self, "coalescedMigrateAudiobookProgress"));
    objc_msgSend(v6, "signalWithCompletion:", &stru_1008EC318);

  }
}

- (void)_migrateAudiobookProgressIfNeeded
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[BKLibraryAssetIsNewManager audiobookProgressMigrationComplete](self, "audiobookProgressMigrationComplete");
  v4 = sub_100063710();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No need to migrate audiobook progress, migration is complete", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "migrateAudiobookProgressIfNeeded will check if audiobook progress can be migrated", buf, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014FF9C;
    v7[3] = &unk_1008E7DA0;
    v7[4] = self;
    -[NSObject performBlockOnWorkerQueue:](v6, "performBlockOnWorkerQueue:", v7);
  }

}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24[3];
  char v25;
  char v26;
  id location;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((unint64_t)(a5 - 3) <= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentAudiobook"));
    objc_msgSend(v7, "positionInCurrentAudiobook");
    v10 = v9;
    objc_msgSend(v8, "duration");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetIsNewManager libraryManager](self, "libraryManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "libraryAssetOnMainQueueWithAssetID:", v13));

    v16 = objc_msgSend(v15, "isNew");
    v17 = objc_msgSend(v15, "isFinished");
    v18 = objc_msgSend(v15, "isAudiobookPreview");
    objc_initWeak(&location, self);
    if (v15 && !v18 && v16 | v17 ^ 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPersistenceController sharedInstance](BKAudiobookPersistenceController, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentAudiobook"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100150A88;
      v22[3] = &unk_1008EC3E0;
      v24[1] = v10;
      v24[2] = v12;
      v25 = v16;
      v26 = v17;
      v22[4] = self;
      objc_copyWeak(v24, &location);
      v23 = v13;
      objc_msgSend(v19, "bookmarkTimeForAudiobook:completion:", v21, v22);

      objc_destroyWeak(v24);
    }
    objc_destroyWeak(&location);

  }
}

- (BKLibraryAssetIsNewManagerDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableSet)markedAssets
{
  return self->_markedAssets;
}

- (void)setMarkedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_markedAssets, a3);
}

- (NSMutableSet)seriesIDsToResetNext
{
  return self->_seriesIDsToResetNext;
}

- (void)setSeriesIDsToResetNext:(id)a3
{
  objc_storeStrong((id *)&self->_seriesIDsToResetNext, a3);
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (OS_dispatch_queue)markedAssetsQueue
{
  return self->_markedAssetsQueue;
}

- (void)setMarkedAssetsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_markedAssetsQueue, a3);
}

- (OS_dispatch_queue)processEPUBIDQueue
{
  return self->_processEPUBIDQueue;
}

- (void)setProcessEPUBIDQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processEPUBIDQueue, a3);
}

- (OS_dispatch_queue)processSeriesBooksQueue
{
  return self->_processSeriesBooksQueue;
}

- (void)setProcessSeriesBooksQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processSeriesBooksQueue, a3);
}

- (BUCoalescingCallBlock)coalescedResetNextInSeries
{
  return self->_coalescedResetNextInSeries;
}

- (void)setCoalescedResetNextInSeries:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedResetNextInSeries, a3);
}

- (BUCoalescingCallBlock)coalescedMigrateAudiobookProgress
{
  return self->_coalescedMigrateAudiobookProgress;
}

- (void)setCoalescedMigrateAudiobookProgress:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedMigrateAudiobookProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedMigrateAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_coalescedResetNextInSeries, 0);
  objc_storeStrong((id *)&self->_processSeriesBooksQueue, 0);
  objc_storeStrong((id *)&self->_processEPUBIDQueue, 0);
  objc_storeStrong((id *)&self->_markedAssetsQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_seriesIDsToResetNext, 0);
  objc_storeStrong((id *)&self->_markedAssets, 0);
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end
