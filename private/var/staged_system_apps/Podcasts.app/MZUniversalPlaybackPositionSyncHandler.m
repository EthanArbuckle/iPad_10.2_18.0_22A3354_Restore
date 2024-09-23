@implementation MZUniversalPlaybackPositionSyncHandler

- (MZUniversalPlaybackPositionSyncHandler)initWithDataSource:(id)a3 bagContext:(id)a4 andTask:(id)a5
{
  id v8;
  id v9;
  id v10;
  MZUniversalPlaybackPositionSyncHandler *v11;
  MZUniversalPlaybackPositionSyncHandler *v12;
  MZUppSyncProcessor *v13;
  MZKeyValueStoreController *v14;
  void *v15;
  void *v16;
  void *v17;
  MZKeyValueStoreController *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  dispatch_queue_t v21;
  OS_dispatch_queue *syncOperationQueue;
  NSObject *v23;
  dispatch_queue_global_t global_queue;
  NSObject *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MZUniversalPlaybackPositionSyncHandler;
  v11 = -[MZUniversalPlaybackPositionSyncHandler init](&v27, "init");
  v12 = v11;
  if (v11)
  {
    -[MZUniversalPlaybackPositionSyncHandler setDataSource:](v11, "setDataSource:", v8);
    -[MZUniversalPlaybackPositionSyncHandler setBagContext:](v12, "setBagContext:", v9);
    v13 = -[MZUppSyncProcessor initWithStorageProviderDelegate:]([MZUppSyncProcessor alloc], "initWithStorageProviderDelegate:", v12);
    -[MZUniversalPlaybackPositionSyncHandler setTransactionProcessor:](v12, "setTransactionProcessor:", v13);

    -[MZUniversalPlaybackPositionSyncHandler setTask:](v12, "setTask:", v10);
    v14 = [MZKeyValueStoreController alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseURLForGETAll"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseURLForPUTAll"));
    v18 = -[MZKeyValueStoreController initWithDomain:baseURLForGETAll:baseURLForPUTAll:](v14, "initWithDomain:baseURLForGETAll:baseURLForPUTAll:", v15, v16, v17);

    -[MZKeyValueStoreController setDelegate:](v18, "setDelegate:", v12);
    -[MZUniversalPlaybackPositionSyncHandler setKvsController:](v12, "setKvsController:", v18);
    v19 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.queue", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v19;

    v21 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.syncOperationQueue", 0);
    syncOperationQueue = v12->_syncOperationQueue;
    v12->_syncOperationQueue = (OS_dispatch_queue *)v21;

    v23 = v12->_syncOperationQueue;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v25 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v23, v25);

  }
  return v12;
}

- (void)_resetState
{
  MZUppSyncProcessor *v3;

  -[MZUniversalPlaybackPositionSyncHandler setDataSourceTransactionContext:](self, "setDataSourceTransactionContext:", 0);
  -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", 0);
  v3 = -[MZUppSyncProcessor initWithStorageProviderDelegate:]([MZUppSyncProcessor alloc], "initWithStorageProviderDelegate:", self);
  -[MZUniversalPlaybackPositionSyncHandler setTransactionProcessor:](self, "setTransactionProcessor:", v3);

}

- (void)_dataSourceCancelTransaction
{
  void *v3;
  id v4;

  -[MZUniversalPlaybackPositionSyncHandler _resetState](self, "_resetState");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v4, "cancelUniversalPlaybackPositionTransaction:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
    objc_msgSend(v4, "cancelUniversalPlaybackPositionTransaction:", v3);

  }
}

- (BOOL)_synchronize:(id *)a3
{
  NSObject *queue;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_signpost_id_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *i;
  void *v80;
  id v81;
  _BOOL8 v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  unsigned int v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_signpost_id_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  _BOOL8 v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  _BOOL8 v140;
  uint64_t v141;
  uint64_t v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSObject *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  NSObject *v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  NSObject *v163;
  os_signpost_id_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  NSObject *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  NSObject *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  void *v193;
  _BOOL4 v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  NSObject *v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  NSObject *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  NSObject *v209;
  NSObject *v210;
  uint64_t v211;
  uint64_t v212;
  NSObject *v213;
  os_signpost_id_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  NSObject *v218;
  NSObject *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  NSObject *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  uint64_t v242;
  uint64_t v243;
  NSObject *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  NSObject *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  NSObject *v252;
  NSObject *v253;
  id *v254;
  id *v255;
  os_signpost_id_t spid;
  _QWORD v257[4];
  id v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  _QWORD v263[4];
  id v264;
  id location;
  _QWORD block[6];
  uint64_t v267;
  uint64_t *v268;
  uint64_t v269;
  char v270;
  uint8_t buf[4];
  _BYTE v272[18];
  _BYTE v273[128];

  v267 = 0;
  v268 = &v267;
  v269 = 0x2020000000;
  v270 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085B08;
  block[3] = &unk_1004A6F38;
  block[4] = self;
  block[5] = &v267;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v268 + 24))
  {
    -[MZUniversalPlaybackPositionSyncHandler _fillEmptyMetadataIdentifiersIfNeeded](self, "_fillEmptyMetadataIdentifiersIfNeeded");
    v7 = kdebug_trace(723517700, 0, 0, 0, 0);
    v9 = _MTLogCategoryUPPSync(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v254 = a3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
    }

    v13 = _MTLogCategoryUPPSync(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Begin STEP 0. Gather local items to sync from data source.", buf, 2u);
    }

    v16 = _MTLogCategoryCloudSync(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    spid = os_signpost_id_generate(v17);

    v20 = _MTLogCategoryUPPSync(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "UPP.Sync.Step.0.Begin", ", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metrics"));
    objc_msgSend(v24, "setLatestUPPSubtask:", 1);

    objc_initWeak(&location, self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSource](self, "dataSource"));
    v263[0] = _NSConcreteStackBlock;
    v263[1] = 3221225472;
    v263[2] = sub_100085B40;
    v263[3] = &unk_1004A8270;
    v255 = &v264;
    objc_copyWeak(&v264, &location);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "beginTransactionWithItemsToSyncEnumerationBlock:", v263));
    -[MZUniversalPlaybackPositionSyncHandler setDataSourceTransactionContext:](self, "setDataSourceTransactionContext:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metadataItemsFromDataSource"));
    v29 = objc_msgSend(v28, "count");
    v30 = objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30, "metrics"));
    objc_msgSend(v31, "setNumMetadataItemsFromDataSource:", v29);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
    LOBYTE(v30) = v32 == 0;

    if ((v30 & 1) != 0)
      goto LABEL_13;
    v33 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
    if (v33)
    {
      -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
LABEL_13:
      v6 = 0;
LABEL_76:
      objc_destroyWeak(v255);
      objc_destroyWeak(&location);
      goto LABEL_77;
    }
    v35 = _MTLogCategoryUPPSync(v33, v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "metadataItemsFromDataSource"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "allKeys"));
      v40 = objc_msgSend(v39, "count");
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "metadataItemsFromDataSource"));
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allKeys"));
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v272 = v40;
      *(_WORD *)&v272[4] = 2114;
      *(_QWORD *)&v272[6] = v43;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Gathered local %{public}d items to sync from dataSource: %{public}@", buf, 0x12u);

    }
    v46 = _MTLogCategoryUPPSync(v44, v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v272 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "dataSource transaction context = %{public}@", buf, 0xCu);

    }
    v49 = kdebug_trace(723517704, 0, 0, 0, 0);
    v51 = _MTLogCategoryUPPSync(v49, v50);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Finish STEP 0.", buf, 2u);
    }

    v55 = _MTLogCategoryUPPSync(v53, v54);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = v56;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, spid, "UPP.Sync.Step.0.End", ", buf, 2u);
    }

    v59 = _MTLogCategoryCloudSync(v58);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    v61 = os_signpost_id_generate(v60);

    v64 = _MTLogCategoryUPPSync(v62, v63);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    v66 = v65;
    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_BEGIN, v61, "UPP.Sync.Step.1.Begin", ", buf, 2u);
    }

    v67 = kdebug_trace(723517708, 0, 0, 0, 0);
    v69 = _MTLogCategoryUPPSync(v67, v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Begin STEP 1. Perform iTMS-kvs getAll to update new items.", buf, 2u);
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "metrics"));
    objc_msgSend(v72, "setLatestUPPSubtask:", 2);

    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v261 = 0u;
    v262 = 0u;
    v259 = 0u;
    v260 = 0u;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "metadataItemsFromDataSource"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "allValues"));

    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v259, v273, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v260;
      do
      {
        for (i = 0; i != v77; i = (char *)i + 1)
        {
          if (*(_QWORD *)v260 != v78)
            objc_enumerationMutation(v76);
          v80 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v80, "isNew", v254, v255))
            objc_msgSend(v73, "addObject:", v80);
        }
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v259, v273, 16);
      }
      while (v77);
    }

    if (objc_msgSend(v73, "count"))
    {
      v81 = -[MZUniversalPlaybackPositionSyncHandler newKVSGetAllTransactionWithMetadataItems:](self, "newKVSGetAllTransactionWithMetadataItems:", v73);
      -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v81);

      v82 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
      if (v82)
      {
LABEL_60:
        -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction", v254);
        v6 = 0;
LABEL_75:

        goto LABEL_76;
      }
      v84 = _MTLogCategoryUPPSync(v82, v83);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = objc_msgSend(v73, "count");
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v272 = v86;
        *(_WORD *)&v272[4] = 2112;
        *(_QWORD *)&v272[6] = v73;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Requesting remote items for %{public}d new Items: %{pubic}@", buf, 0x12u);
      }

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler _synchronouslyRunKVSTransaction:](self, "_synchronouslyRunKVSTransaction:", v87));

      if (v88)
      {
        if (!v254)
          goto LABEL_73;
        goto LABEL_71;
      }
      if (-[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop"))
        goto LABEL_73;
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      objc_msgSend(v89, "mergeMetadataItemsFromGetResponse");

    }
    v90 = kdebug_trace(723517712, 0, 0, 0, 0);
    v92 = _MTLogCategoryUPPSync(v90, v91);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Finish STEP 1.", buf, 2u);
    }

    v96 = _MTLogCategoryUPPSync(v94, v95);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    v98 = v97;
    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, OS_SIGNPOST_INTERVAL_END, v61, "UPP.Sync.Step.1.End", ", buf, 2u);
    }

    v100 = _MTLogCategoryCloudSync(v99);
    v101 = objc_claimAutoreleasedReturnValue(v100);
    v102 = os_signpost_id_generate(v101);

    v105 = _MTLogCategoryUPPSync(v103, v104);
    v106 = objc_claimAutoreleasedReturnValue(v105);
    v107 = v106;
    if (v102 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v107, OS_SIGNPOST_INTERVAL_BEGIN, v102, "UPP.Sync.Step.2.Begin", ", buf, 2u);
    }

    v108 = kdebug_trace(723517716, 0, 0, 0, 0);
    v110 = _MTLogCategoryUPPSync(v108, v109);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Begin STEP 2.1. Perform iTMS-kvs getAll for remote changes.", buf, 2u);
    }

    v114 = _MTLogCategoryUPPSync(v112, v113);
    v115 = objc_claimAutoreleasedReturnValue(v114);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "      Start newKVSGetAllTransactionSinceDomainVersion...", buf, 2u);
    }

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "metrics"));
    objc_msgSend(v117, "setLatestUPPSubtask:", 3);

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "lastSyncedDomainVersion"));
    v120 = -[MZUniversalPlaybackPositionSyncHandler newKVSGetAllTransactionSinceDomainVersion:](self, "newKVSGetAllTransactionSinceDomainVersion:", v119);
    -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v120);

    v121 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
    if (v121)
      goto LABEL_60;
    v123 = _MTLogCategoryUPPSync(v121, v122);
    v124 = objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "      Finish newKVSGetAllTransactionSinceDomainVersion.", buf, 2u);
    }

    v127 = _MTLogCategoryUPPSync(v125, v126);
    v128 = objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      v130 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "sinceDomainVersion"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v272 = v130;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "Requesting remote items from server -since domain-version = %{public}@", buf, 0xCu);

    }
    v133 = _MTLogCategoryUPPSync(v131, v132);
    v134 = objc_claimAutoreleasedReturnValue(v133);
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "      Start _synchronouslyRunKVSTransaction...", buf, 2u);
    }

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler _synchronouslyRunKVSTransaction:](self, "_synchronouslyRunKVSTransaction:", v135));

    v138 = _MTLogCategoryUPPSync(v136, v137);
    v139 = objc_claimAutoreleasedReturnValue(v138);
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "      Finish _synchronouslyRunKVSTransaction.", buf, 2u);
    }

    if (v88)
    {
      if (!v254)
      {
LABEL_73:
        -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction", v254);
        v6 = 0;
LABEL_74:

        goto LABEL_75;
      }
LABEL_71:
      *v254 = objc_retainAutorelease(v88);
      goto LABEL_73;
    }
    v140 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
    if (v140)
      goto LABEL_73;
    v143 = _MTLogCategoryUPPSync(v140, v141);
    v144 = objc_claimAutoreleasedReturnValue(v143);
    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "Finish STEP 2.1.", buf, 2u);
    }

    v147 = _MTLogCategoryUPPSync(v145, v146);
    v148 = objc_claimAutoreleasedReturnValue(v147);
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "Begin STEP 2.2. Merge local and remote deltas.", buf, 2u);
    }

    v149 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "metrics"));
    objc_msgSend(v150, "setLatestUPPSubtask:", 4);

    v151 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    objc_msgSend(v151, "mergeMetadataItemsFromGetResponse");

    v152 = kdebug_trace(723517720, 0, 0, 0, 0);
    v154 = _MTLogCategoryUPPSync(v152, v153);
    v155 = objc_claimAutoreleasedReturnValue(v154);
    if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "Finish STEP 2.2.", buf, 2u);
    }

    v158 = _MTLogCategoryUPPSync(v156, v157);
    v159 = objc_claimAutoreleasedReturnValue(v158);
    v160 = v159;
    if (v102 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v159))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v160, OS_SIGNPOST_INTERVAL_END, v102, "UPP.Sync.Step.2.End", ", buf, 2u);
    }

    v162 = _MTLogCategoryCloudSync(v161);
    v163 = objc_claimAutoreleasedReturnValue(v162);
    v164 = os_signpost_id_generate(v163);

    v167 = _MTLogCategoryUPPSync(v165, v166);
    v168 = objc_claimAutoreleasedReturnValue(v167);
    v169 = v168;
    if (v164 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v169, OS_SIGNPOST_INTERVAL_BEGIN, v164, "UPP.Sync.Step.3.Begin", ", buf, 2u);
    }

    v170 = kdebug_trace(723517724, 0, 0, 0, 0);
    v172 = _MTLogCategoryUPPSync(v170, v171);
    v173 = objc_claimAutoreleasedReturnValue(v172);
    if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "Begin STEP 3. Push changes to server.", buf, 2u);
    }

    v174 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "metrics"));
    objc_msgSend(v175, "setLatestUPPSubtask:", 5);

    v176 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "metadataItemsToCommitToKVSStorage"));
    v178 = objc_msgSend(v177, "count");

    if (v178)
    {
      v181 = _MTLogCategoryUPPSync(v179, v180);
      v182 = objc_claimAutoreleasedReturnValue(v181);
      if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
      {
        v183 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
        v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "metadataItemsToCommitToKVSStorage"));
        v185 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "allKeys"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v272 = v185;
        _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_DEFAULT, "Sending merged items to server: %{public}@", buf, 0xCu);

      }
      v186 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "metadataItemsToCommitToKVSStorage"));
      v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "allValues"));
      v189 = -[MZUniversalPlaybackPositionSyncHandler newKVSPutAllTransactionWithMetadataItems:](self, "newKVSPutAllTransactionWithMetadataItems:", v188);
      -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v189);

      v190 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      v191 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler _synchronouslyRunKVSTransaction:](self, "_synchronouslyRunKVSTransaction:", v190));

      if (v191)
      {
        if (v254)
          *v254 = objc_retainAutorelease(v191);
        goto LABEL_99;
      }
      if (-[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop"))
      {
LABEL_99:
        -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction", v254);
        v6 = 0;
LABEL_124:

        goto LABEL_74;
      }
    }
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor", v254));
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "responseDomainVersion"));
    v194 = v193 == 0;

    if (v194)
    {
      v197 = _MTLogCategoryUPPSync(v195, v196);
      v198 = objc_claimAutoreleasedReturnValue(v197);
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] ERROR: expected to get a domainVersion in server response", buf, 2u);
      }

      v199 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
      v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "lastSyncedDomainVersion"));
      v201 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      objc_msgSend(v201, "setResponseDomainVersion:", v200);

    }
    v202 = kdebug_trace(723517728, 0, 0, 0, 0);
    v204 = _MTLogCategoryUPPSync(v202, v203);
    v205 = objc_claimAutoreleasedReturnValue(v204);
    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "Finish STEP 3.", buf, 2u);
    }

    v208 = _MTLogCategoryUPPSync(v206, v207);
    v209 = objc_claimAutoreleasedReturnValue(v208);
    v210 = v209;
    if (v164 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v209))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v210, OS_SIGNPOST_INTERVAL_END, v164, "UPP.Sync.Step.3.End", ", buf, 2u);
    }

    v212 = _MTLogCategoryCloudSync(v211);
    v213 = objc_claimAutoreleasedReturnValue(v212);
    v214 = os_signpost_id_generate(v213);

    v217 = _MTLogCategoryUPPSync(v215, v216);
    v218 = objc_claimAutoreleasedReturnValue(v217);
    v219 = v218;
    if (v214 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v218))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v219, OS_SIGNPOST_INTERVAL_BEGIN, v214, "UPP.Sync.Step.4.Begin", ", buf, 2u);
    }

    v220 = kdebug_trace(723517732, 0, 0, 0, 0);
    v222 = _MTLogCategoryUPPSync(v220, v221);
    v223 = objc_claimAutoreleasedReturnValue(v222);
    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, "Begin STEP 4. Commit changes to data source.", buf, 2u);
    }

    v226 = _MTLogCategoryUPPSync(v224, v225);
    v227 = objc_claimAutoreleasedReturnValue(v226);
    if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
    {
      v228 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "responseDomainVersion"));
      v230 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "metadataItemsToCommitToDataSource"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v272 = v229;
      *(_WORD *)&v272[8] = 2114;
      *(_QWORD *)&v272[10] = v231;
      _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "Committing merged items with domainRevision: %{public}@ to local database: %{public}@", buf, 0x16u);

    }
    v232 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "metrics"));
    objc_msgSend(v233, "setLatestUPPSubtask:", 6);

    v234 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "metadataItemsToCommitToDataSource"));
    v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "objectEnumerator"));

    v237 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSource](self, "dataSource"));
    v238 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext](self, "dataSourceTransactionContext"));
    v239 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "responseDomainVersion"));
    v257[0] = _NSConcreteStackBlock;
    v257[1] = 3221225472;
    v257[2] = sub_100085C90;
    v257[3] = &unk_1004A8298;
    v191 = v236;
    v258 = v191;
    objc_msgSend(v237, "commitUniversalPlaybackPositionTransaction:domainVersion:metadataEnumerationBlock:", v238, v240, v257);

    v241 = -[MZUniversalPlaybackPositionSyncHandler _resetState](self, "_resetState");
    v243 = _MTLogCategoryUPPSync(v241, v242);
    v244 = objc_claimAutoreleasedReturnValue(v243);
    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "Finished synchronization", buf, 2u);
    }

    v245 = kdebug_trace(723517736, 0, 0, 0, 0);
    v247 = _MTLogCategoryUPPSync(v245, v246);
    v248 = objc_claimAutoreleasedReturnValue(v247);
    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "Finish STEP 4.", buf, 2u);
    }

    v251 = _MTLogCategoryUPPSync(v249, v250);
    v252 = objc_claimAutoreleasedReturnValue(v251);
    v253 = v252;
    if (v214 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v252))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v253, OS_SIGNPOST_INTERVAL_END, v214, "UPP.Sync.Step.4.End", ", buf, 2u);
    }

    v6 = 1;
    goto LABEL_124;
  }
  v6 = 1;
LABEL_77:
  _Block_object_dispose(&v267, 8);
  return v6;
}

- (void)_fillEmptyMetadataIdentifiersIfNeeded
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085D58;
  v6[3] = &unk_1004A6640;
  v7 = v3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForNilValueOrEmptyStringForKey:](NSPredicate, "predicateForNilValueOrEmptyStringForKey:", kEpisodeMetadataIdentifier));
  v4 = v8;
  v5 = v3;
  objc_msgSend(v5, "performBlockAndWaitWithSave:", v6);

}

- (BOOL)_shouldStop
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100086010;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_canRequestStoreSignIn = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  objc_msgSend(v4, "setCanRequestStoreSignIn:", v3);

}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MZUniversalPlaybackPositionSyncHandler setCanceled:](self, "setCanceled:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  if (objc_msgSend(v4, "isIdle"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));

    if (!v5)
      goto LABEL_7;
    if (!v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionCancelledErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", v6, 0));

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", v4, v8);
  }

LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  if (v8)
    objc_msgSend(v7, "cancelAllTransactionsCancelCode:", objc_msgSend(v8, "code"));
  else
    objc_msgSend(v7, "cancelAllTransactions");

}

- (void)timeout
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionTimeoutErrorWithTransaction:underlyingError:", v4, 0));
  -[MZUniversalPlaybackPositionSyncHandler cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancel
{
  -[MZUniversalPlaybackPositionSyncHandler cancelWithError:](self, "cancelWithError:", 0);
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *syncOperationQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[6];
  _QWORD v11[3];
  char v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008634C;
  block[3] = &unk_1004A6F38;
  block[4] = self;
  block[5] = v11;
  dispatch_sync(queue, block);
  syncOperationQueue = self->_syncOperationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008637C;
  v8[3] = &unk_1004A63C8;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  dispatch_async(syncOperationQueue, v8);
  kdebug_trace(723517692, 0, 0, 0, 0);

  _Block_object_dispose(v11, 8);
}

- (id)newKVSTransactionWithType:(int)a3 keys:(id)a4
{
  uint64_t v4;
  MZKeyValueStoreController *kvsController;
  id v7;
  void *v8;
  MZKeyValueStoreController *v9;
  uint64_t v10;
  void *v11;
  MZKeyValueStoreTransaction *v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  kvsController = self->_kvsController;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](kvsController, "defaultDomain"));
  v9 = self->_kvsController;
  if ((_DWORD)v4 == 1)
    v10 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](v9, "defaultGetURL"));
  else
    v10 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](v9, "defaultSetURL"));
  v11 = (void *)v10;
  v12 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:]([MZKeyValueStoreTransaction alloc], "initWithType:domain:URL:keys:", v4, v8, v10, v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
  -[MZKeyValueStoreTransaction setProcessor:](v12, "setProcessor:", v13);

  v14 = objc_msgSend(objc_alloc((Class)NSConditionLock), "initWithCondition:", 0);
  -[MZKeyValueStoreTransaction setUserInfoValue:forKey:](v12, "setUserInfoValue:forKey:", v14, CFSTR("completionConditionLock"));

  return v12;
}

- (id)newKVSPutAllTransactionWithMetadataItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  MZUniversalPlaybackPositionSyncHandler *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v5 = 0;
    goto LABEL_32;
  }
  v34 = self;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (!v7)
    goto LABEL_30;
  v8 = v7;
  v9 = *(_QWORD *)v37;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v10);
      if (objc_msgSend(v11, "isNew", v34))
      {
        v12 = objc_msgSend(v11, "bookmarkTime");
        v14 = v13;
        v15 = os_feature_enabled_skip_empty_upp_sync(v12);
        if ((v15 & 1) == 0)
        {
          if (v14 > 0.0)
            goto LABEL_22;
          goto LABEL_10;
        }
      }
      else if (!((uint64_t (*)(void))os_feature_enabled_skip_empty_upp_sync)())
      {
        goto LABEL_22;
      }
      objc_msgSend(v11, "bookmarkTime");
      if (v23 > 0.0
        || (objc_msgSend(v11, "hasBeenPlayed") & 1) != 0
        || objc_msgSend(v11, "playCount")
        || (objc_msgSend(v11, "lastDatePlayed"), v24 > 0.0)
        || (objc_msgSend(v11, "lastUserMarkedAsPlayedDate"), v25 > 0.0)
        || (v15 = (uint64_t)objc_msgSend(v11, "playStateManuallySet"), (v15 & 1) != 0))
      {
LABEL_22:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemIdentifier"));
        objc_msgSend(v5, "addObject:", v26);

        v29 = _MTLogCategoryUPPSync(v27, v28);
        v20 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 138543362;
        v41 = v11;
        v21 = v20;
        v22 = "Adding UPP sync item...%{public}@";
        goto LABEL_24;
      }
LABEL_10:
      v16 = (id)os_feature_enabled_skip_empty_upp_sync(v15);
      if ((_DWORD)v16)
      {
        v16 = objc_msgSend(v11, "isNew");
        if (!(_DWORD)v16 || (v16 = objc_msgSend(v11, "bookmarkTime"), v18 > 0.0))
        {
          v19 = _MTLogCategoryUPPSync(v16, v17);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          *(_DWORD *)buf = 138543362;
          v41 = v11;
          v21 = v20;
          v22 = "Preventing UPP sync item...%{public}@";
          goto LABEL_24;
        }
      }
      v30 = _MTLogCategoryUPPSync(v16, v17);
      v20 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v11;
        v21 = v20;
        v22 = "Skipping UPP sync item...%{public}@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
LABEL_25:

      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    v31 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    v8 = v31;
  }
  while (v31);
LABEL_30:

  self = v34;
  v4 = v35;
LABEL_32:
  v32 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:](self, "newKVSTransactionWithType:keys:", 2, v5, v34);

  return v32;
}

- (id)newKVSGetAllTransactionWithMetadataItems:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("itemIdentifier")));
  v5 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:](self, "newKVSTransactionWithType:keys:", 1, v4);

  return v5;
}

- (id)newKVSGetAllTransactionSinceDomainVersion:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  id v6;

  v4 = CFSTR("0");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  v6 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:](self, "newKVSTransactionWithType:keys:", 1, 0);
  objc_msgSend(v6, "setSinceDomainVersion:", v5);

  return v6;
}

- (id)_synchronouslyRunKVSTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  objc_msgSend(v5, "scheduleTransaction:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfoValueForKey:", CFSTR("completionConditionLock")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
  v8 = objc_msgSend(v6, "lockWhenCondition:beforeDate:", 1, v7);

  if (v8)
  {
    objc_msgSend(v6, "unlock");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionTimeoutErrorWithTransaction:underlyingError:", v9, 0));
    -[MZUniversalPlaybackPositionSyncHandler setFatalSyncError:](self, "setFatalSyncError:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler fatalSyncError](self, "fatalSyncError"));

  return v11;
}

- (void)_signalKVSTransactionCompletion:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfoValueForKey:", CFSTR("completionConditionLock")));
  objc_msgSend(v3, "lock");
  objc_msgSend(v3, "unlockWithCondition:", 1);

}

- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    if (v6)
    {
      v12 = _MTLogCategoryUPPSync(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "transaction is being canceled.  error = %{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[MZUniversalPlaybackPositionSyncHandler setFatalSyncError:](self, "setFatalSyncError:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:](self, "_signalKVSTransactionCompletion:", v14);

  }
}

- (BOOL)keyValueStoreController:(id)a3 shouldScheduleTransaction:(id)a4
{
  return 1;
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "isAccountsChangedError");
  if ((_DWORD)v11)
  {
    v13 = _MTLogCategoryUPPSync(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sinceDomainVersion"));
      v22 = 138543362;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected account change.  Getting remote items since version 0 instead of %{public}@\n", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v9, "setSinceDomainVersion:", CFSTR("0"));
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "isAuthenticationError"))
  {
    v16 = -[MZUniversalPlaybackPositionSyncHandler canRequestStoreSignIn](self, "canRequestStoreSignIn");
    if (!v16)
    {
      v19 = _MTLogCategoryUPPSync(v16, v17);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138543362;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Detected authentication error (%{public}@) -- Bailing out", (uint8_t *)&v22, 0xCu);
      }

      objc_msgSend(v8, "resolveError:transaction:resolution:", v10, v9, 2);
      goto LABEL_12;
    }
  }
  if ((objc_msgSend(v10, "isRecoverableError") & 1) == 0)
  {
LABEL_12:
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", v9, v10);
    v18 = 1;
    goto LABEL_13;
  }
LABEL_8:
  v18 = 0;
LABEL_13:

  return v18;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", a4, a5);
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:](self, "_signalKVSTransactionCompletion:", a4);
}

- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metrics"));
  objc_msgSend(v4, "setNumMetadataItemsFromKVSStorage:", a3);

}

- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metrics"));
  objc_msgSend(v4, "setNumMetadataItemsToCommitToDataSource:", a3);

}

- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metrics"));
  objc_msgSend(v4, "setNumMetadataItemsToCommitToKVSStorage:", a3);

}

- (MZKeyValueStoreController)kvsController
{
  return (MZKeyValueStoreController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKvsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return (MZUniversalPlaybackPositionDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MZUniversalPlaybackPositionTransactionContext)dataSourceTransactionContext
{
  return (MZUniversalPlaybackPositionTransactionContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSourceTransactionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MZUPPBagContext)bagContext
{
  return (MZUPPBagContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBagContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (MZUPPAsynchronousTask)task
{
  return (MZUPPAsynchronousTask *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (MZKeyValueStoreTransaction)currentKVSTransaction
{
  return (MZKeyValueStoreTransaction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentKVSTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSError)fatalSyncError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFatalSyncError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MZUppSyncProcessor)transactionProcessor
{
  return (MZUppSyncProcessor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTransactionProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_fatalSyncError, 0);
  objc_storeStrong((id *)&self->currentKVSTransaction, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_bagContext, 0);
  objc_storeStrong((id *)&self->_dataSourceTransactionContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_kvsController, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
