@implementation SPApplicationsBasicInit

void __SPApplicationsBasicInit_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.search.app_clips", v1);
  v3 = (void *)sAppClipQueue;
  sAppClipQueue = (uint64_t)v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.search.applications", v5);
  v7 = (void *)sAppsProcessingQueue;
  sAppsProcessingQueue = (uint64_t)v6;

  v8 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)sAppsProcessingQueue);
  v9 = (void *)sSource;
  sSource = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)sSource, &__block_literal_global_150);
  dispatch_activate((dispatch_object_t)sSource);
}

void __SPApplicationsBasicInit_block_invoke_2()
{
  double Current;
  NSObject *v1;
  id v2;
  double v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t i;
  void *v18;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t j;
  void *v29;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v37;
  id v38;
  double v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  SPApplication *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  SPApplication *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  SPApplication *v63;
  id v64;
  NSObject *v65;
  NSObject *v67;
  id v68;
  double v69;
  NSObject *v70;
  id v71;
  double v72;
  NSObject *v73;
  id v74;
  double v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t n;
  void *v80;
  void *v81;
  unsigned int v82;
  NSObject *v83;
  id v84;
  double v85;
  int v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  int v91;
  NSObject *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t ii;
  void *v102;
  uint64_t v103;
  void *v104;
  NSObject *v106;
  id v107;
  double v108;
  void *v109;
  void *v110;
  int v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  id v117;
  uint64_t v118;
  double v119;
  const __CFString *v120;
  int v121;
  double v122;
  dispatch_time_t v123;
  id v124;
  void *v125;
  dispatch_group_t v126;
  int v127;
  void *v128;
  void *v129;
  id v130;
  NSObject *group;
  void *v132;
  id v133;
  void *v134;
  id v135;
  uintptr_t data;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[4];
  dispatch_group_t v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint8_t v170[4];
  uint64_t v171;
  __int16 v172;
  double v173;
  __int16 v174;
  const __CFString *v175;
  float v176[32];
  _QWORD v177[4];
  SPApplication *v178;
  id v179;
  NSObject *v180;
  char v181;
  float v182[32];
  float v183[32];
  float v184;
  uint64_t v185;
  _BYTE v186[128];
  float v187;
  uint64_t v188;
  uint8_t buf[4];
  uintptr_t v190;
  __int16 v191;
  uintptr_t v192;
  uint64_t v193;

  v193 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  data = dispatch_source_get_data((dispatch_source_t)sSource);
  v1 = MEMORY[0x24BDACB70];
  v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v190 = data;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Apps Source fired data:%llx", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)sAppsProcessingQueue);
  if (data <= 1)
  {
    if (atomic_load((unsigned int *)&fastAppsArrived))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __SPApplicationsBasicInit_block_invoke_2_cold_13();
      goto LABEL_148;
    }
  }
  v4 = CFAbsoluteTimeGetCurrent();
  v133 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v135 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v130 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  group = dispatch_group_create();
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDC1568], "sharedDatabaseContext");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v129, "startAccessingWithOptions:error:", 1, 0);
  if ((v5 & 1) != 0)
  {
    SPCopyVisibleApps();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restrictedAppBundleIDs");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __SPApplicationsBasicInit_block_invoke_2_cold_12(v6);
    v8 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "LS not availble for _SPBuildApplications", buf, 2u);
    }
    v134 = 0;
    v8 = 0;
  }
  v132 = v8;
  if (!objc_msgSend(v8, "count"))
    goto LABEL_17;
  if ((data & 5) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend((id)__fastApplications, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v11, "isEqual:", v132);

    if ((_DWORD)v9)
    {
LABEL_17:
      kdebug_trace();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v132, "count");
        *(_DWORD *)buf = 134218240;
        v190 = v12;
        v191 = 2048;
        v192 = data;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skip SPBuildApplications %ld visible apps trigger:%llu", buf, 0x16u);
      }
      if (v5)
        objc_msgSend(v129, "stopAccessing");
      goto LABEL_147;
    }
  }
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v167;
    v16 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v167 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
        if (data <= 1)
        {
          if (atomic_load((unsigned int *)&fastAppsArrived))
          {
            objc_msgSend(v129, "stopAccessing");
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              __SPApplicationsBasicInit_block_invoke_2_cold_11(v4);

            goto LABEL_147;
          }
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * i), "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v134, "containsObject:", v20);

        if ((v21 & 1) != 0)
        {
          v22 = v16;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            __SPApplicationsBasicInit_block_invoke_2_cold_10(&v187, (uint64_t)v18, &v188);

          objc_msgSend(v18, "bundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "addObject:", v23);

        }
        else
        {
          processRecord(v18, v133, v135, v132, group);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
    }
    while (v14);
  }

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  objc_msgSend(MEMORY[0x24BDC1540], "systemPlaceholderEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v162, v186, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v163;
    v27 = MEMORY[0x24BDACB70];
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v163 != v26)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
        if (data <= 1)
        {
          if (atomic_load((unsigned int *)&fastAppsArrived))
          {
            objc_msgSend(v129, "stopAccessing");

            goto LABEL_147;
          }
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * j), "bundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v134, "containsObject:", v31);

        if ((v32 & 1) != 0)
        {
          v33 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            SPBuildApplicationNamesLocked_cold_2(&v184, (uint64_t)v29, &v185);

          objc_msgSend(v29, "bundleIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "addObject:", v34);

        }
        else
        {
          processRecord(v29, v133, v135, v132, group);
        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v162, v186, 16);
    }
    while (v25);
  }

  objc_msgSend(v129, "stopAccessing");
  dispatch_group_enter(group);
  v156 = 0;
  v157 = &v156;
  v158 = 0x3032000000;
  v159 = __Block_byref_object_copy_;
  v160 = __Block_byref_object_dispose_;
  v161 = 0;
  objc_msgSend(MEMORY[0x24BE16EA0], "sharedStore");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = MEMORY[0x24BDAC760];
  v153[1] = 3221225472;
  v153[2] = ___SPBuildApplications_block_invoke;
  v153[3] = &unk_24CF63958;
  v155 = &v156;
  v126 = group;
  v154 = v126;
  objc_msgSend(v35, "fetchBookmarkWebClipsWithCompletionHandler:", v153);

  v127 = CPSClipsFeatureEnabled();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v126, 0xFFFFFFFFFFFFFFFFLL);
  if (data <= 1)
  {
    if (atomic_load((unsigned int *)&fastAppsArrived))
    {
      v37 = MEMORY[0x24BDACB70];
      v38 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v39 = CFAbsoluteTimeGetCurrent();
        __SPApplicationsBasicInit_block_invoke_2_cold_8(v183, v39, v4);
      }

      goto LABEL_146;
    }
  }
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v40 = (id)v157[5];
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v149, v183, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v150;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v150 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * k);
        if (data <= 1)
        {
          if (atomic_load((unsigned int *)&fastAppsArrived))
          {
            v70 = MEMORY[0x24BDACB70];
            v71 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              v72 = CFAbsoluteTimeGetCurrent();
              __SPApplicationsBasicInit_block_invoke_2_cold_7(v182, v72, v4);
            }

            goto LABEL_146;
          }
        }
        v46 = objc_alloc_init(SPApplication);
        objc_msgSend(v44, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        processClip(v46, v47, v44, v127);

        objc_msgSend(v130, "addObject:", v46);
        objc_msgSend(v44, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v48);

      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v149, v183, 16);
    }
    while (v41);
  }

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v49 = v132;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v145, v182, 16);
  if (!v50)
    goto LABEL_84;
  v51 = *(_QWORD *)v146;
  while (2)
  {
    for (m = 0; m != v50; ++m)
    {
      if (*(_QWORD *)v146 != v51)
        objc_enumerationMutation(v49);
      v53 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * m);
      if (data <= 1)
      {
        if (atomic_load((unsigned int *)&fastAppsArrived))
        {
          v73 = MEMORY[0x24BDACB70];
          v74 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            v75 = CFAbsoluteTimeGetCurrent();
            __SPApplicationsBasicInit_block_invoke_2_cold_6((float *)v177, v75, v4);
          }

          dispatch_group_notify(v126, (dispatch_queue_t)sAppsProcessingQueue, &__block_literal_global_160);
          goto LABEL_146;
        }
      }
      objc_msgSend(v133, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * m));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        if ((objc_msgSend(v135, "containsObject:", v53) & 1) != 0)
        {
          v55 = 0;
        }
        else
        {
          if ((objc_msgSend(v128, "containsObject:", v53) & 1) != 0)
            continue;
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v53, 1, 0);
          objc_msgSend(v55, "bundleIdentifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            processRecord(v55, v133, v135, v49, v126);
          }
          else
          {
            v57 = v53;
            v58 = v126;
            v124 = v130;
            v59 = objc_alloc_init(SPApplication);
            v60 = v57;
            v61 = v58;
            dispatch_group_enter(v61);
            objc_msgSend(MEMORY[0x24BE16EA0], "sharedStore");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = sAppClipQueue;
            v177[0] = MEMORY[0x24BDAC760];
            v177[1] = 3221225472;
            v177[2] = __processWebClipMetadata_block_invoke;
            v177[3] = &unk_24CF639C0;
            v178 = v59;
            v179 = v60;
            v181 = v127;
            v180 = v61;
            v63 = v59;
            v64 = v60;
            v65 = v61;
            objc_msgSend(v125, "getAppClipWithIdentifier:receiveOnQueue:completionHandler:", v64, v62, v177);

            objc_msgSend(v124, "addObject:", v63);
          }
        }
      }

    }
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v145, v182, 16);
    if (v50)
      continue;
    break;
  }
LABEL_84:

  if (data >= 2)
  {
    dispatch_group_wait(v126, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    if (atomic_load((unsigned int *)&fastAppsArrived))
    {
      v67 = MEMORY[0x24BDACB70];
      v68 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        v69 = CFAbsoluteTimeGetCurrent();
        __SPApplicationsBasicInit_block_invoke_2_cold_5((float *)v177, v69, v4);
      }

      dispatch_group_notify(v126, (dispatch_queue_t)sAppsProcessingQueue, &__block_literal_global_162);
      goto LABEL_146;
    }
    dispatch_group_wait(v126, 0xFFFFFFFFFFFFFFFFLL);
    if (atomic_load((unsigned int *)&fastAppsArrived))
    {
      v106 = MEMORY[0x24BDACB70];
      v107 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        v108 = CFAbsoluteTimeGetCurrent();
        __SPApplicationsBasicInit_block_invoke_2_cold_4((float *)v177, v108, v4);
      }

      goto LABEL_146;
    }
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v76 = v130;
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v141, v177, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v142;
    do
    {
      for (n = 0; n != v77; ++n)
      {
        if (*(_QWORD *)v142 != v78)
          objc_enumerationMutation(v76);
        v80 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * n);
        objc_msgSend(v80, "displayIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
          objc_msgSend(v133, "setObject:forKey:", v80, v81);

      }
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v141, v177, 16);
    }
    while (v77);
  }

  pthread_mutex_lock(&appsLock);
  if (data <= 1 && (v82 = atomic_load((unsigned int *)&fastAppsArrived)) != 0)
  {
    v83 = MEMORY[0x24BDACB70];
    v84 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      v85 = CFAbsoluteTimeGetCurrent();
      __SPApplicationsBasicInit_block_invoke_2_cold_3(v176, v85, v4);
    }

    v86 = 0;
    v87 = 0;
    v88 = 0;
  }
  else
  {
    v89 = objc_msgSend(v133, "count");
    v90 = (void *)__fastApplications;
    if (v89)
    {
      v91 = objc_msgSend((id)__fastApplications, "isEqual:", v133);
      v92 = MEMORY[0x24BDACB70];
      v93 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        __SPApplicationsBasicInit_block_invoke_2_cold_2(v91, v94, v95);

      v96 = (void *)objc_msgSend(v133, "copy");
      v97 = (void *)__fastApplications;
      __fastApplications = (uint64_t)v96;

      v88 = v96;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v133, "count"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      objc_msgSend(v133, "allValues");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v137, v176, 16);
      if (v99)
      {
        v100 = *(_QWORD *)v138;
        do
        {
          for (ii = 0; ii != v99; ++ii)
          {
            if (*(_QWORD *)v138 != v100)
              objc_enumerationMutation(v98);
            objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * ii), "displayName");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            if (v102)
              objc_msgSend(v90, "addObject:", v102);

          }
          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v137, v176, 16);
        }
        while (v99);
      }

      objc_msgSend(v90, "allObjects");
      v103 = objc_claimAutoreleasedReturnValue();
      v104 = (void *)__fastApplicationNames;
      __fastApplicationNames = v103;

      v86 = v91 ^ 1;
    }
    else
    {
      v86 = 0;
      v88 = (id)MEMORY[0x24BDBD1B8];
      __fastApplications = MEMORY[0x24BDBD1B8];
    }

    if (objc_msgSend(v135, "count"))
    {
      if ((v86 & 1) != 0)
      {
        v86 = 1;
      }
      else
      {
        v111 = objc_msgSend((id)__hiddenApps, "isEqual:", v135);
        v112 = v111;
        v86 = v111 ^ 1;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          __SPApplicationsBasicInit_block_invoke_2_cold_1(v112, v113, v114);
      }
      v109 = (void *)objc_msgSend(v135, "copy");
      v115 = (void *)__hiddenApps;
      __hiddenApps = (uint64_t)v109;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = (void *)__hiddenApps;
      __hiddenApps = (uint64_t)v109;

    }
    v87 = v109;
  }
  pthread_mutex_unlock(&appsLock);
  pthread_cond_broadcast(&appsCond);
  v116 = MEMORY[0x24BDACB70];
  v117 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    v118 = objc_msgSend((id)__fastApplications, "count");
    v119 = CFAbsoluteTimeGetCurrent() - v4;
    v120 = CFSTR("NO");
    *(_DWORD *)v170 = 134218498;
    v171 = v118;
    if (v86)
      v120 = CFSTR("YES");
    v172 = 2048;
    v173 = v119;
    v174 = 2112;
    v175 = v120;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Finished getting %ld applications, took %f seconds updateApps ? %@", v170, 0x20u);
  }

  if (sAppUpdateBlock)
    v121 = v86;
  else
    v121 = 0;
  if (v121 == 1)
    (*(void (**)(void))(sAppUpdateBlock + 16))();
  kdebug_trace();

LABEL_146:
  _Block_object_dispose(&v156, 8);

LABEL_147:
LABEL_148:
  if (sCoalesceUpdates)
  {
    v122 = Current - *(double *)&SPApplicationsBasicInit_lastCall;
    if (v122 < 1.0 && v122 >= 0.0)
    {
      dispatch_suspend((dispatch_object_t)sSource);
      v123 = dispatch_time(0, (uint64_t)((1.0 - v122) * 1000000000.0));
      dispatch_after(v123, (dispatch_queue_t)sAppsProcessingQueue, &__block_literal_global_152);
    }
    SPApplicationsBasicInit_lastCall = CFAbsoluteTimeGetCurrent();
  }
}

void __SPApplicationsBasicInit_block_invoke_151()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Resume source", v0, 2u);
  }
  dispatch_resume((dispatch_object_t)sSource);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_1(char a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  if ((a1 & 1) != 0)
    v3 = CFSTR("NO");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], a3, "hiddenapps app update ? %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __SPApplicationsBasicInit_block_invoke_2_cold_2(char a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  if ((a1 & 1) != 0)
    v3 = CFSTR("NO");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], a3, "fastapps app update ? %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __SPApplicationsBasicInit_block_invoke_2_cold_3(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 623, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_4(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 577, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_5(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 570, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_6(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 553, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_7(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 541, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_8(float *a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2(v4, 535, v3);
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v5, "fastapps app update andoned at %d after %fs", v6);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_10(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], v3, "Restricted app: %@", v4);
}

void __SPApplicationsBasicInit_block_invoke_2_cold_11(double a1)
{
  uint64_t v1;
  _DWORD v2[2];
  __int16 v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109376;
  v2[1] = 495;
  v3 = 2048;
  v4 = CFAbsoluteTimeGetCurrent() - a1;
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v1, "fastapps app update andoned at %d after %fs", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

void __SPApplicationsBasicInit_block_invoke_2_cold_12(void *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], v1, "visible apps count %lu", (uint8_t *)&v2);
  OUTLINED_FUNCTION_5();
}

void __SPApplicationsBasicInit_block_invoke_2_cold_13()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "fastapps app update andoned", v0, 2u);
  OUTLINED_FUNCTION_9();
}

@end
