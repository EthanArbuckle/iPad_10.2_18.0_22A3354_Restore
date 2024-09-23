@implementation TTSSynthesisProviderVoiceManager

+ (NSArray)allSynthesisProviderVoices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_opt_class();
  objc_msgSend_componentCache(v6, v7, v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v13)
  {
    v18 = v13;
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v11);
        objc_msgSend_voices(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v20), v14, v15, v16, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v5, v22, (uint64_t)v21, v23, v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v18);
  }

  return (NSArray *)v5;
}

- (TTSSynthesisProviderVoiceManager)init
{
  TTSSynthesisProviderVoiceManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *operationQueue;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *componentQueryQueue;
  TTSSynthesisProviderVoiceManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TTSSynthesisProviderVoiceManager;
  v2 = -[TTSSynthesisProviderVoiceManager init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("auspmanager.voiceloading", v3);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, -1);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("auspmanager.componentquery", v7);
    componentQueryQueue = v2->_componentQueryQueue;
    v2->_componentQueryQueue = (OS_dispatch_queue *)v8;

    v10 = v2;
  }

  return v2;
}

+ (NSArray)componentCache
{
  void *v2;
  CFPropertyListRef v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8597054](a1, a2);
  v3 = TTSPreferencesCopyValueForKey(CFSTR("TTSSynthesisProviderCachedComponentsKey"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_alloc(MEMORY[0x1E0CB3710]);
    v24 = 0;
    v8 = (void *)objc_msgSend_initForReadingFromData_error_(v5, v6, (uint64_t)v4, (uint64_t)&v24, v7);
    v9 = v24;
    if (v9)
    {
      AXTTSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1A3AB16C0(v10);

    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v25, 3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_decodeObjectOfClasses_forKey_(v8, v19, (uint64_t)v18, *MEMORY[0x1E0CB2CD0], v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v2);
    v22 = v21;
  }
  else
  {
    objc_autoreleasePoolPop(v2);
    v22 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v22;
}

+ (id)sharedInstance
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = sub_1A3972224;
  v8 = sub_1A3972234;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

+ (void)freeSharedInstance
{
  AX_PERFORM_WITH_LOCK();
}

+ (void)registerFirstPartyInProcessAudioUnits
{
  if (qword_1EE6D4910 != -1)
    dispatch_once(&qword_1EE6D4910, &unk_1E4AA0458);
}

- (void)reconcileCachedComponents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_operationQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39725AC;
  block[3] = &unk_1E4A9FAD0;
  block[4] = self;
  dispatch_sync(v6, block);

}

- (void)reloadVoicesForBundleIdentifierPrefix:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  objc_msgSend_operationQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A397268C;
  block[3] = &unk_1E4A9FB48;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(v9, block);

}

- (void)reloadVoicesForBundleIdentifierHash:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  objc_msgSend_operationQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3972730;
  block[3] = &unk_1E4A9FB48;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(v9, block);

}

- (void)_reloadVoiceForBundleIdentifierPrefix:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_componentCache(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A39727F0;
  v19[3] = &unk_1E4AA0480;
  v20 = v4;
  v11 = v4;
  objc_msgSend_ax_filteredArrayUsingBlock_(v10, v12, (uint64_t)v19, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__reconcileCachedComponents_(self, v16, (uint64_t)v15, v17, v18);
}

- (void)_reloadVoiceForBundleIdentifierHash:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  if (objc_msgSend_intValue(v4, v5, v6, v7, v8))
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend_componentCache(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1A3972924;
    v26[3] = &unk_1E4AA0480;
    v27 = v4;
    objc_msgSend_ax_filteredArrayUsingBlock_(v14, v15, (uint64_t)v26, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__reconcileCachedComponents_(self, v19, (uint64_t)v18, v20, v21);
  }
  else
  {
    AXTTSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_1A3AB1190(v22);

    objc_msgSend__reconcileCachedComponents_(self, v23, MEMORY[0x1E0C9AA60], v24, v25);
  }

}

- (void)purgeAndReloadAllComponents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_operationQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3972A28;
  block[3] = &unk_1E4A9FAD0;
  block[4] = self;
  dispatch_sync(v6, block);

}

- (void)_reconcileCachedComponents:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  _BOOL4 v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  _QWORD v165[4];
  id v166;
  _QWORD v167[5];
  id v168;
  __int128 *p_buf;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[4];
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _DWORD v180[3];
  _BYTE v181[10];
  __int16 v182;
  void *v183;
  uint8_t v184[128];
  __int128 buf;
  uint64_t v186;
  uint64_t (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  id v189;
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  v163 = a3;
  AXTTSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend_count(v163, v4, v5, v6, v7);
    _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_INFO, "TTSVoiceProvider::Reconcile records: Source cache: %ld", (uint8_t *)&buf, 0xCu);
  }

  AXTTSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v14 = v163;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v176, (uint64_t)v190, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v177;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v177 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * v18);
          AXTTSLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v19;
            _os_log_debug_impl(&dword_1A3940000, v20, OS_LOG_TYPE_DEBUG, "  - %@", (uint8_t *)&buf, 0xCu);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v21, (uint64_t)&v176, (uint64_t)v190, 16);
      }
      while (v16);
    }

  }
  v161 = (void *)objc_msgSend_mutableCopy(v163, v10, v11, v12, v13);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedAudioUnitComponentManager(MEMORY[0x1E0C89B20], v26, v27, v28, v29);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v186 = 0x3032000000;
  v187 = sub_1A3972224;
  v188 = sub_1A3972234;
  strcpy((char *)v180, "psua");
  *(_QWORD *)v181 = 0;
  BYTE1(v180[1]) = 0;
  HIWORD(v180[1]) = 0;
  v180[2] = 0;
  objc_msgSend_componentsMatchingDescription_(v162, v30, (uint64_t)v180, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (id)objc_msgSend_mutableCopy(v33, v34, v35, v36, v37);

  objc_msgSend_set(MEMORY[0x1E0C99E20], v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v174[0] = MEMORY[0x1E0C809B0];
  v174[1] = 3221225472;
  v174[2] = sub_1A3973190;
  v174[3] = &unk_1E4AA04A8;
  v159 = v42;
  v175 = v159;
  objc_msgSend_ax_filteredArrayUsingBlock_(v43, v44, (uint64_t)v174, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_mutableCopy(v47, v48, v49, v50, v51);
  v53 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v52;

  AXTTSLogCommon();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    v59 = objc_msgSend_count(*(void **)(*((_QWORD *)&buf + 1) + 40), v55, v56, v57, v58);
    v180[0] = 134217984;
    *(_QWORD *)&v180[1] = v59;
    _os_log_impl(&dword_1A3940000, v54, OS_LOG_TYPE_INFO, "AVAudioUnitComponentManager did complete scan, finding %ld components", (uint8_t *)v180, 0xCu);
  }

  AXTTSLogCommon();
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG);

  if (v61)
  {
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v62 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v170, (uint64_t)v184, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v171;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v171 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v66);
          AXTTSLogCommon();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_name(v67, v69, v70, v71, v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_typeName(v67, v75, v76, v77, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v180[0] = 138412802;
            *(_QWORD *)&v180[1] = v67;
            *(_WORD *)v181 = 2112;
            *(_QWORD *)&v181[2] = v74;
            v182 = 2112;
            v183 = v79;
            _os_log_debug_impl(&dword_1A3940000, v68, OS_LOG_TYPE_DEBUG, "  %@ - %@ %@", (uint8_t *)v180, 0x20u);

          }
          ++v66;
        }
        while (v64 != v66);
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v73, (uint64_t)&v170, (uint64_t)v184, 16);
      }
      while (v64);
    }

  }
  v167[0] = MEMORY[0x1E0C809B0];
  v167[1] = 3221225472;
  v167[2] = sub_1A3973220;
  v167[3] = &unk_1E4AA04F8;
  p_buf = &buf;
  v167[4] = self;
  v80 = v160;
  v168 = v80;
  objc_msgSend_ax_filteredArrayUsingBlock_(v161, v81, (uint64_t)v167, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend_mutableCopy(v84, v85, v86, v87, v88);

  objc_msgSend_ax_mappedArrayUsingBlock_(*(void **)(*((_QWORD *)&buf + 1) + 40), v90, (uint64_t)&unk_1E4AA0538, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend_mutableCopy(v93, v94, v95, v96, v97);

  objc_msgSend__loadVoicesForComponents_(self, v99, (uint64_t)v98, v100, v101);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v102, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = MEMORY[0x1E0C809B0];
  v165[1] = 3221225472;
  v165[2] = sub_1A397346C;
  v165[3] = &unk_1E4AA0480;
  v107 = v106;
  v166 = v107;
  objc_msgSend_ax_filteredArrayUsingBlock_(v98, v108, (uint64_t)v165, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend_mutableCopy(v111, v112, v113, v114, v115);

  objc_msgSend_addObjectsFromArray_(v89, v117, (uint64_t)v116, v118, v119);
  v120 = (void *)objc_opt_class();
  objc_msgSend_setComponentCache_(v120, v121, (uint64_t)v89, v122, v123);
  AXTTSLogCommon();
  v124 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
  {
    v129 = (void *)MEMORY[0x1E0CB37E8];
    v130 = objc_msgSend_count(v116, v125, v126, v127, v128);
    objc_msgSend_numberWithUnsignedInteger_(v129, v131, v130, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = (void *)MEMORY[0x1E0CB37E8];
    v140 = objc_msgSend_count(v80, v136, v137, v138, v139);
    objc_msgSend_numberWithUnsignedInteger_(v135, v141, v140, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v180[0] = 138412546;
    *(_QWORD *)&v180[1] = v134;
    *(_WORD *)v181 = 2112;
    *(_QWORD *)&v181[2] = v144;
    _os_log_impl(&dword_1A3940000, v124, OS_LOG_TYPE_INFO, "TTSVoiceProvider::Component cache updated with %@ additions and %@ evictions.", (uint8_t *)v180, 0x16u);

  }
  objc_msgSend_delegate(self, v145, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)objc_opt_class();
  objc_msgSend_allSynthesisProviderVoices(v150, v151, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synthesisProviderVoicesDidChange_(v149, v156, (uint64_t)v155, v157, v158);

  _Block_object_dispose(&buf, 8);
}

- (void)_loadVoicesForComponents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_group_create();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend__loadVoicesForComponentRecord_dispatchGroup_(self, v9, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (uint64_t)v5, v10, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_loadVoicesForComponentRecord:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  NSObject *v17;

  v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  objc_msgSend_componentQueryQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39736A4;
  block[3] = &unk_1E4AA0560;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (BOOL)_loadVoicesForComponentWithTimeout:(id)a3 timeout:(double)a4 timedOut:(BOOL *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  dispatch_time_t v18;
  intptr_t v19;
  NSObject *v20;
  BOOL v21;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  TTSSynthesisProviderVoiceManager *v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[2];
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v8 = a3;
  v13 = dispatch_semaphore_create(0);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v14 = (void *)MEMORY[0x1E0C89B18];
  if (v8)
  {
    objc_msgSend_componentDescription(v8, v9, v10, v11, v12);
  }
  else
  {
    v29[0] = 0;
    v29[1] = 0;
    v30 = 0;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1A3973B98;
  v23[3] = &unk_1E4AA05B0;
  v27 = &v35;
  v28 = &v31;
  v15 = v13;
  v24 = v15;
  v16 = v8;
  v25 = v16;
  v26 = self;
  objc_msgSend_instantiateWithComponentDescription_options_completionHandler_(v14, v17, (uint64_t)v29, 1, (uint64_t)v23);
  v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v19 = dispatch_semaphore_wait(v15, v18);
  *((_BYTE *)v36 + 24) = v19 != 0;
  if (v19)
  {
    AXTTSLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1A3AB12E8();

  }
  if (a5)
    *a5 = *((_BYTE *)v36 + 24);
  if (*((_BYTE *)v32 + 24))
    v21 = 0;
  else
    v21 = *((_BYTE *)v36 + 24) == 0;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

- (void)fetchAudioUnitInstanceForVoice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  TTSSynthesisProviderVoiceManager *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend_componentQueryQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3974268;
  block[3] = &unk_1E4AA0600;
  v17 = self;
  v18 = v7;
  v16 = v6;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

+ (void)setComponentCache:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((AXProcessIsAXAssetsd() & 1) == 0)
    sub_1A3AB1638();
  v43 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)v3, 1, (uint64_t)&v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v43;
  if (v10)
  {
    AXTTSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1A3AB15D8();

  }
  else
  {
    objc_msgSend_sharedInstance(TTSAXResourceManager, v6, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_purgeLegacyResourceCache(v12, v13, v14, v15, v16);

    v21 = objc_msgSend_length(v5, v17, v18, v19, v20);
    AXTTSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 <= 0x7A120)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v28 = (void *)MEMORY[0x1E0CB37E8];
        v29 = objc_msgSend_length(v5, v24, v25, v26, v27);
        objc_msgSend_numberWithUnsignedInteger_(v28, v30, v29, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v33;
        _os_log_impl(&dword_1A3940000, v23, OS_LOG_TYPE_INFO, "Writing %@ bytes to the component cache", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      sub_1A3AB156C();
    }

    TTSPreferencesSetValueForKey(CFSTR("TTSSynthesisProviderCachedComponentsKey"), v5);
    v38 = objc_msgSend_defaultCStringEncoding(MEMORY[0x1E0CB3940], v34, v35, v36, v37);
    v42 = (const char *)objc_msgSend_cStringUsingEncoding_(CFSTR("com.apple.TTS.synthProviderVoicesDidUpdate"), v39, v38, v40, v41);
    notify_post(v42);
  }

}

+ (BOOL)synthesizerHasEntitlement:(id)a3 entitlement:(const char *)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL value;

  v4 = a3;
  v9 = v4;
  if (v4)
    objc_msgSend_remoteProcessAuditToken(v4, v5, v6, v7, v8, (unsigned __int128)0, (unsigned __int128)0);
  v10 = (void *)xpc_copy_entitlement_for_token();
  v11 = v10;
  if (v10)
    value = xpc_BOOL_get_value(v10);
  else
    value = 0;

  return value;
}

+ (BOOL)_componentIsEqual:(AudioComponentDescription *)a3 to:(AudioComponentDescription *)a4
{
  return a3->componentType == a4->componentType
      && a3->componentManufacturer == a4->componentManufacturer
      && a3->componentSubType == a4->componentSubType;
}

- (TTSSynthesisProviderVoiceManagerDelegate)delegate
{
  return (TTSSynthesisProviderVoiceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (OS_dispatch_queue)componentQueryQueue
{
  return self->_componentQueryQueue;
}

- (void)setComponentQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_componentQueryQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentQueryQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
