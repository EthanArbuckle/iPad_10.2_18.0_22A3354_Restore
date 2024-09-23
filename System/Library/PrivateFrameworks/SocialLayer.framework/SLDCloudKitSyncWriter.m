@implementation SLDCloudKitSyncWriter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_15);
  return (id)sharedInstance_sharedInstance;
}

void __39__SLDCloudKitSyncWriter_sharedInstance__block_invoke()
{
  void *v0;
  SLDCloudKitSyncWriter *v1;
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.SocialLayer"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContainer:", v0);

  objc_msgSend(v3, "setName:", CFSTR("ckwriter"));
  v1 = -[SLDCloudKitSyncBase initWithConfiguration:]([SLDCloudKitSyncWriter alloc], "initWithConfiguration:", v3);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (void)initializeState
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLDCloudKitSyncWriter;
  -[SLDCloudKitSyncBase initializeState](&v6, sel_initializeState);
  *(&self->super._saltLocked + 1) = 0;
  *(&self->super._saltLocked + 2) = 0;
  v3 = *(void **)&self->_freshHighlightsGenerated;
  *(_QWORD *)&self->_freshHighlightsGenerated = 0;

  -[SLDCloudKitSyncWriter checkForAppChangesNow](self, "checkForAppChangesNow");
  -[SLDCloudKitSyncBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SLDCloudKitSyncWriter_initializeState__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __40__SLDCloudKitSyncWriter_initializeState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextTask");
}

- (unint64_t)versionOfSavedIDString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("savedIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)recordIDStringOfSavedIDString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("savedIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v14[0] = v4;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("!"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)_batchNumberOfRecordIDString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("!"), 6);
  objc_msgSend(v3, "substringFromIndex:", v4 + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longLongValue");
  return v7;
}

- (id)_idForRecordIDString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:options:", CFSTR("!"), 6));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchAndProcessFreshHighlights
{
  SLDCloudKitSyncWriter *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void (**v43)(void *, _QWORD, id);
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __CFString *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  const __CFString *v55;
  NSObject *v56;
  void *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  SLDCloudKitSyncWriter *v114;
  uint64_t v115;
  id obj;
  id v117;
  __CFString *v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[4];
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  id v136;
  SLDCloudKitSyncWriter *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  _QWORD v144[5];
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD v149[4];
  id v150;
  id v151;
  SLDCloudKitSyncWriter *v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  SLDCloudKitSyncWriter *v162;
  id v163;
  id v164;
  id v165;
  id v166;
  _QWORD v167[5];
  id v168;
  id v169;
  id v170;
  _QWORD v171[5];
  id v172;
  _QWORD v173[5];
  _QWORD aBlock[5];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  void *v180;
  uint8_t v181[128];
  uint8_t buf[4];
  const __CFString *v183;
  __int16 v184;
  __CFString *v185;
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;

  v2 = self;
  v188 = *MEMORY[0x1E0C80C00];
  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v106 = (void *)os_transaction_create();
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "#SLDCK beginning fetchAndProcessFreshHighlights", buf, 2u);
  }

  v5 = objc_opt_new();
  v6 = *(void **)&v2->_freshHighlightsGenerated;
  *(_QWORD *)&v2->_freshHighlightsGenerated = v5;

  -[SLDCloudKitSyncBase persistence](v2, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("savedIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v175, v187, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v176;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v176 != v13)
          objc_enumerationMutation(v10);
        -[SLDCloudKitSyncWriter recordIDStringOfSavedIDString:](v2, "recordIDStringOfSavedIDString:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v175, v187, 16);
    }
    while (v12);
  }
  v105 = v10;

  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v20 = -[SLDCloudKitSyncBase getIncrementedBatchNumber](v2, "getIncrementedBatchNumber");
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke;
  aBlock[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  aBlock[4] = v20;
  v22 = _Block_copy(aBlock);
  v173[0] = v21;
  v173[1] = 3221225472;
  v173[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2;
  v173[3] = &unk_1E3795AB8;
  v173[4] = v2;
  v23 = _Block_copy(v173);
  v171[0] = v21;
  v171[1] = 3221225472;
  v171[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3;
  v171[3] = &unk_1E3795AE0;
  v171[4] = v2;
  v24 = v16;
  v172 = v24;
  v25 = _Block_copy(v171);
  v167[0] = v21;
  v167[1] = 3221225472;
  v167[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_4;
  v167[3] = &unk_1E3795B08;
  v167[4] = v2;
  v96 = v9;
  v168 = v96;
  v111 = v24;
  v169 = v111;
  v26 = v22;
  v170 = v26;
  v27 = _Block_copy(v167);
  v160[0] = v21;
  v160[1] = 3221225472;
  v160[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_5;
  v160[3] = &unk_1E3795B30;
  v104 = v17;
  v161 = v104;
  v162 = v2;
  v28 = v27;
  v163 = v28;
  v29 = v26;
  v164 = v29;
  v30 = v23;
  v165 = v30;
  v31 = v25;
  v166 = v31;
  v158[0] = v21;
  v158[1] = 3221225472;
  v158[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6;
  v158[3] = &unk_1E3795B58;
  v101 = _Block_copy(v160);
  v159 = v101;
  v149[0] = v21;
  v149[1] = 3221225472;
  v149[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7;
  v149[3] = &unk_1E3795BA8;
  v100 = _Block_copy(v158);
  v153 = v100;
  v103 = v18;
  v150 = v103;
  v102 = v19;
  v151 = v102;
  v152 = v2;
  v32 = v28;
  v154 = v32;
  v33 = v29;
  v155 = v33;
  v34 = v30;
  v156 = v34;
  v35 = v31;
  v157 = v35;
  v36 = _Block_copy(v149);
  v144[0] = v21;
  v144[1] = 3221225472;
  v144[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_381;
  v144[3] = &unk_1E3795BD0;
  v144[4] = v2;
  v37 = v32;
  v145 = v37;
  v38 = v33;
  v146 = v38;
  v39 = v34;
  v147 = v39;
  v40 = v35;
  v148 = v40;
  v41 = _Block_copy(v144);
  v42 = (void *)objc_opt_new();
  v135[0] = v21;
  v135[1] = 3221225472;
  v135[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_391;
  v135[3] = &unk_1E3795BF8;
  v98 = v41;
  v138 = v98;
  v97 = v42;
  v136 = v97;
  v99 = v36;
  v139 = v99;
  v137 = v2;
  v110 = v37;
  v140 = v110;
  v109 = v38;
  v141 = v109;
  v108 = v39;
  v142 = v108;
  v107 = v40;
  v143 = v107;
  v43 = (void (**)(void *, _QWORD, id))_Block_copy(v135);
  v44 = (void *)objc_opt_new();
  -[SLDCloudKitSyncBase persistence](v2, "persistence");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("lastKnownApps"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v46;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v186, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v132;
    v112 = *MEMORY[0x1E0D70F20];
    v113 = *(_QWORD *)v132;
    v114 = v2;
    do
    {
      v50 = 0;
      v115 = v48;
      do
      {
        if (*(_QWORD *)v132 != v49)
          objc_enumerationMutation(obj);
        v51 = *(__CFString **)(*((_QWORD *)&v131 + 1) + 8 * v50);
        v52 = (void *)MEMORY[0x19AEC48EC]();
        if ((objc_msgSend(&unk_1E37AA040, "containsObject:", v51) & 1) != 0)
        {
          v53 = (void *)objc_opt_new();
          v54 = v51;
          v55 = v54;
          if (objc_msgSend(CFSTR("com.apple.TVWatchList"), "isEqual:", v54))
          {

            v55 = CFSTR("com.apple.tv");
          }
          v119 = v52;
          SLDaemonLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v183 = v55;
            v184 = 2112;
            v185 = v54;
            _os_log_debug_impl(&dword_199EFF000, v56, OS_LOG_TYPE_DEBUG, "#SLDCK Asking Portrait for %@ highlights (requested app identifier: %@)", buf, 0x16u);
          }

          v57 = (void *)objc_opt_new();
          v130 = 0;
          v128[0] = MEMORY[0x1E0C809B0];
          v128[1] = 3221225472;
          v128[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_414;
          v128[3] = &unk_1E3795C20;
          v58 = v53;
          v129 = v58;
          v118 = (__CFString *)v55;
          objc_msgSend(v57, "iterRankedHighlightsWithLimit:client:variant:error:block:", 100, v55, v112, &v130, v128);
          v117 = v130;

          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v59 = v58;
          v60 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v124, v181, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v125;
            do
            {
              for (j = 0; j != v61; ++j)
              {
                if (*(_QWORD *)v125 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j);
                v65 = (void *)MEMORY[0x19AEC48EC]();
                v43[2](v43, v64, v54);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (v66)
                  objc_msgSend(v44, "addObject:", v66);

                objc_autoreleasePoolPop(v65);
              }
              v61 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v124, v181, 16);
            }
            while (v61);
          }

          v49 = v113;
          v2 = v114;
          v48 = v115;
          v52 = v119;
        }
        else
        {
          SLDaemonLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v183 = v51;
            v184 = 2112;
            v185 = (__CFString *)&unk_1E37AA040;
            _os_log_error_impl(&dword_199EFF000, v59, OS_LOG_TYPE_ERROR, "#SLDCK Ignoring sync request for app identifier not in allowlist: %@ (allowed: %@)", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v52);
        ++v50;
      }
      while (v50 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v186, 16);
    }
    while (v48);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "sortedArrayUsingDescriptors:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "arrayByAddingObjectsFromArray:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncBase idStringForType:uniqueString:](v2, "idStringForType:uniqueString:", CFSTR("index"), v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *))v110 + 2))(v110, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v73)
  {
    (*((void (**)(id, void *))v109 + 2))(v109, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_alloc(MEMORY[0x1E0C95048]);
    -[SLDCloudKitSyncWriter recordZoneID](v2, "recordZoneID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(v74, "initWithRecordType:zoneID:", CFSTR("index"), v75);

    (*((void (**)(id, void *))v108 + 2))(v108, v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setRecordID:", v77);

    objc_msgSend(v76, "encryptedValues");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v69, CFSTR("recordIDs"));

    objc_msgSend(v76, "encryptedValues");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v44, CFSTR("highlights"));

    (*((void (**)(id, void *))v107 + 2))(v107, v76);
  }

  -[SLDCloudKitSyncBase persistence](v2, "persistence");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("savedIDs"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (!v81)
    v81 = (void *)MEMORY[0x1E0C9AA70];
  v83 = (void *)objc_msgSend(v81, "mutableCopy");

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v84 = v96;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v120, v179, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v121;
    do
    {
      for (k = 0; k != v86; ++k)
      {
        if (*(_QWORD *)v121 != v87)
          objc_enumerationMutation(v84);
        -[SLDCloudKitSyncWriter _idForRecordIDString:](v2, "_idForRecordIDString:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setObject:forKeyedSubscript:", 0, v89);

      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v120, v179, 16);
    }
    while (v86);
  }

  -[SLDCloudKitSyncBase persistence](v2, "persistence");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKeyedSubscript:", v83, CFSTR("savedIDs"));

  -[SLDCloudKitSyncBase syncEngine](v2, "syncEngine");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&v2->_freshHighlightsGenerated, "allKeys");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncWriter _recordIDsFromStrings:](v2, "_recordIDsFromStrings:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "allObjects");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncWriter _recordIDsFromStrings:](v2, "_recordIDsFromStrings:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addRecordIDsToSave:recordIDsToDelete:", v93, v95);

  *(&v2->super._saltLocked + 1) = 1;
  -[SLDCloudKitSyncWriter nextTask](v2, "nextTask");

}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@!%tu"), v4, *(_QWORD *)(a1 + 32));

  return v5;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "recordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v6);

  return v7;
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addMetadataToRecord:", v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(v4, "recordID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v9);

}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "versionOfSavedIDString:", v4) == 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordIDStringOfSavedIDString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
LABEL_4:
    v6 = v5;
    v5 = v6;
    goto LABEL_5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
LABEL_5:

  return v6;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  CGImageSource *v8;
  CGImageSource *v9;
  CGImage *ImageAtIndex;
  double Width;
  double Height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGColorSpace *RGB;
  CGContext *v18;
  CGContext *v19;
  CGImage *Image;
  __CFData *v21;
  CGImageDestinationRef v22;
  CGImageDestination *v23;
  void *v24;
  const __CFDictionary *v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38[32];
  CC_SHA256_CTX c;
  uint64_t v40;
  CGRect v41;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v4 = objc_retainAutorelease(v3);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    CC_SHA256_Final(v38, &c);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v38, 16);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    goto LABEL_22;
  }
  v8 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
  if (!v8)
    goto LABEL_21;
  v9 = v8;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
  CFRelease(v9);
  if (!ImageAtIndex)
    goto LABEL_21;
  Width = (double)CGImageGetWidth(ImageAtIndex);
  Height = (double)CGImageGetHeight(ImageAtIndex);
  if (Width * Height <= 16384.0)
  {
    Image = CGImageRetain(ImageAtIndex);
  }
  else
  {
    v13 = Width / Height;
    v14 = sqrt(16384.0 / v13);
    v15 = fmax(round(v13 * v14), 1.0);
    v16 = fmax(round(v14), 1.0);
    RGB = (CGColorSpace *)CGColorSpaceGetRGB();
    v18 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, 0, RGB, 1u);
    if (!v18)
    {
      CFRelease(ImageAtIndex);
      goto LABEL_21;
    }
    v19 = v18;
    CGContextSetInterpolationQuality(v18, kCGInterpolationHigh);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = v15;
    v41.size.height = v16;
    CGContextDrawImage(v19, v41, ImageAtIndex);
    Image = CGBitmapContextCreateImage(v19);
    CFRelease(v19);
  }
  CGImageRelease(ImageAtIndex);
  if (!Image)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  v21 = (__CFData *)objc_opt_new();
  v22 = CGImageDestinationCreateWithData(v21, CFSTR("public.jpeg"), 1uLL, 0);
  if (!v22)
  {
    CGImageRelease(Image);
    goto LABEL_19;
  }
  v23 = v22;
  *(_QWORD *)v38 = *MEMORY[0x1E0CBC780];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.8, *(_QWORD *)v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)c.count = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &c, v38, 1);
  v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImage(v23, Image, v25);

  CFRelease(Image);
  v26 = CGImageDestinationFinalize(v23);
  CFRelease(v23);
  if (!v26)
  {
LABEL_19:

    goto LABEL_21;
  }
  v27 = (void *)-[__CFData copy](v21, "copy");

  if (!v27)
    goto LABEL_21;
  objc_msgSend(*(id *)(a1 + 40), "idStringForType:uniqueData:", CFSTR("image"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v29, v5);
    v7 = v30;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x1E0C95048]);
    objc_msgSend(*(id *)(a1 + 40), "recordZoneID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithRecordType:zoneID:", CFSTR("image"), v34);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRecordID:", v36);

    objc_msgSend(v35, "encryptedValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, CFSTR("compressed"));

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v32, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v7 = v32;

  }
LABEL_22:

  return v7;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v10);

      if ((v12 & 1) != 0)
      {
        v13 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6_cold_1();
        v13 = v10;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x19AEC48EC]();
      v9[2](v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v7);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v7);

        v13 = 0;
      }

      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7(_QWORD *a1, void *a2)
{
  id v3;
  SLPerson *v4;
  void *v5;
  SLPerson *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  _QWORD *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  NSObject *v83;
  id v84;
  _QWORD v85[11];

  v85[9] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [SLPerson alloc];
  objc_msgSend(v3, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  v6 = -[SLPerson initWithPortraitPerson:error:](v4, "initWithPortraitPerson:error:", v5, &v84);
  v7 = v84;

  if (v7)
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7_cold_1();
    v9 = 0;
  }
  else
  {
    -[SLPerson contact](v6, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[7];
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[4];
    v14 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_346;
    v82[3] = &unk_1E3795B80;
    v77 = v10;
    v83 = v77;
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD *))(v11 + 16))(v11, v12, v13, v82);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = a1[7];
    objc_msgSend(v3, "groupPhotoPath");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v3;
    v19 = (void *)v17;
    v20 = a1[5];
    v79 = v18;
    v80[0] = v14;
    v80[1] = 3221225472;
    v80[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2_348;
    v80[3] = &unk_1E3795B80;
    v21 = v18;
    v81 = v21;
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD *))(v16 + 16))(v16, v19, v20, v80);
    v76 = a1;
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_1E3797070;
    v85[0] = v25;
    objc_msgSend(v21, "sourceAppDisplayName");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = &stru_1E3797070;
    v85[1] = v28;
    if (objc_msgSend(v21, "isStarred"))
      v29 = CFSTR("1");
    else
      v29 = CFSTR("0");
    v85[2] = v29;
    v75 = v21;
    if (objc_msgSend(v21, "isFromMe"))
      v30 = CFSTR("1");
    else
      v30 = CFSTR("0");
    v85[3] = v30;
    -[SLPerson handle](v6, "handle");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = &stru_1E3797070;
    v85[4] = v33;
    -[SLPerson displayName](v6, "displayName");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = (const __CFString *)v34;
    else
      v36 = &stru_1E3797070;
    v85[5] = v36;
    -[SLPerson shortDisplayName](v6, "shortDisplayName");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = (const __CFString *)v37;
    else
      v39 = &stru_1E3797070;
    v78 = (void *)v15;
    if (v15)
      v40 = (const __CFString *)v15;
    else
      v40 = &stru_1E3797070;
    v41 = (void *)v22;
    v85[6] = v39;
    v85[7] = v40;
    if (v22)
      v42 = (const __CFString *)v22;
    else
      v42 = &stru_1E3797070;
    v85[8] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 9);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)v76[6];
    objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "idStringForType:uniqueString:", CFSTR("attribution"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(v76[8] + 16))();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v9 = v47;
      v48 = v78;
    }
    else
    {
      (*(void (**)(void))(v76[9] + 16))();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_alloc(MEMORY[0x1E0C95048]);
      objc_msgSend((id)v76[6], "recordZoneID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v49, "initWithRecordType:zoneID:", CFSTR("attribution"), v50);

      (*(void (**)(void))(v76[10] + 16))();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setRecordID:", v52);

      objc_msgSend(v75, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("identifier"));

      objc_msgSend(v75, "sourceAppDisplayName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("sourceAppDisplayName"));

      v57 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v75, "timestamp");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeIntervalSinceReferenceDate");
      objc_msgSend(v57, "numberWithDouble:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, CFSTR("timestamp"));

      -[SLPerson handle](v6, "handle");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("handle"));

      -[SLPerson displayName](v6, "displayName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setObject:forKeyedSubscript:", v63, CFSTR("displayName"));

      -[SLPerson shortDisplayName](v6, "shortDisplayName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("shortDisplayName"));

      objc_msgSend(v51, "encryptedValues");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v78;
      objc_msgSend(v67, "setObject:forKeyedSubscript:", v78, CFSTR("contactPhoto"));

      objc_msgSend(v51, "encryptedValues");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v22, CFSTR("groupPhoto"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v75, "isStarred"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("starred"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v75, "isFromMe"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "encryptedValues");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setObject:forKeyedSubscript:", v71, CFSTR("fromMe"));

      (*(void (**)(void))(v76[11] + 16))();
      v9 = v74;

    }
    v7 = 0;
    v3 = v79;
    v8 = v77;
  }

  return v9;
}

uint64_t __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_346(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "thumbnailImageData");
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2_348(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "groupPhotoPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataWithContentsOfURL:options:error:", v2, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_381(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v28;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idStringForType:uniqueData:", CFSTR("entity"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C95048]);
    objc_msgSend(*(id *)(a1 + 32), "recordZoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithRecordType:zoneID:", CFSTR("entity"), v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecordID:", v14);

    objc_msgSend(v3, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("identifier"));

    objc_msgSend(v3, "resourceURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encryptedValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("resourceURL"));

    objc_msgSend(v3, "supplementaryData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = SLDValidateSupplementaryData(v20);

    if ((_DWORD)v18)
    {
      v21 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v3, "supplementaryData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;

      if (v24)
      {
        SLDaemonLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_381_cold_1();

        v10 = 0;
      }
      else
      {
        objc_msgSend(v13, "encryptedValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v23, CFSTR("supplementaryData"));

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v10 = v9;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_391(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v53 = v7;
    v55 = v6;
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "attributionIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v54 = v5;
    objc_msgSend(v5, "attributionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v59;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v59 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v15);
          v17 = *(void **)(a1 + 32);
          v57 = 0;
          objc_msgSend(v17, "attributionForIdentifier:error:", v16, &v57);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v57;
          if (v19)
          {
            SLDaemonLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v64 = v16;
              v65 = 2112;
              v66 = v19;
              _os_log_fault_impl(&dword_199EFF000, v20, OS_LOG_TYPE_FAULT, "#SLDCK portrait store couldn't retrieve attribution %@ (err: %@)", buf, 0x16u);
            }
LABEL_10:

            goto LABEL_11;
          }
          if (v18)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v10, "addObject:", v20);
            goto LABEL_10;
          }
LABEL_11:

          ++v15;
        }
        while (v13 != v15);
        v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        v13 = v21;
      }
      while (v21);
    }

    objc_msgSend(v54, "timestamp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v24 = v23;

    objc_msgSend(v54, "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setUsesSignificantDigits:", 1);
    objc_msgSend(v26, "setMaximumSignificantDigits:", 14);
    objc_msgSend(v26, "setMinimumSignificantDigits:", 14);
    if (v25)
      v27 = v25;
    else
      v27 = &unk_1E37A9FD8;
    objc_msgSend(v26, "stringFromNumber:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v62[0] = v53;
    v62[1] = v55;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v30;
    v62[3] = v28;
    v56 = (void *)v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = *(void **)(a1 + 40);
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "idStringForType:uniqueString:", CFSTR("highlight"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = v37;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v52 = v33;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_alloc(MEMORY[0x1E0C95048]);
      objc_msgSend(*(id *)(a1 + 40), "recordZoneID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v40, "initWithRecordType:zoneID:", CFSTR("highlight"), v41);

      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setRecordID:", v43);

      objc_msgSend(v42, "encryptedValues");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v53, CFSTR("entity"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "encryptedValues");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("timestamp"));

      objc_msgSend(v42, "encryptedValues");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v10, CFSTR("attributions"));

      objc_msgSend(v42, "encryptedValues");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, CFSTR("applicationIdentifier"));

      objc_msgSend(v42, "encryptedValues");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v25, CFSTR("score"));

      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      v50 = v39;
      v33 = v52;
      v38 = v50;

    }
    v5 = v54;
    v6 = v55;
    v7 = v53;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

uint64_t __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_414(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_recordIDsFromStrings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[SLDCloudKitSyncWriter recordZoneID](self, "recordZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v14 = objc_alloc(MEMORY[0x1E0C95070]);
            v15 = (void *)objc_msgSend(v14, "initWithRecordName:zoneID:", v13, v7, (_QWORD)v19);
            objc_msgSend(v6, "addObject:", v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      v16 = v6;
    }
    else
    {
      SLDaemonLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[SLDCloudKitSyncWriter _recordIDsFromStrings:].cold.1();

      v16 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)recordZoneID
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C95098]);
    v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94730]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reset
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  SLDaemonLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK RESET RESET RESET!", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SLDCloudKitSyncWriter;
  -[SLDCloudKitSyncBase reset](&v4, sel_reset);
  -[SLDCloudKitSyncWriter nextTask](self, "nextTask");
}

- (void)accountStatusChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLDCloudKitSyncWriter;
  -[SLDCloudKitSyncBase accountStatusChanged](&v3, sel_accountStatusChanged);
  -[SLDCloudKitSyncWriter nextTask](self, "nextTask");
}

- (void)handleMetadataSizeBecomingEligibleForSync
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLDCloudKitSyncWriter;
  -[SLDCloudKitSyncBase handleMetadataSizeBecomingEligibleForSync](&v5, sel_handleMetadataSizeBecomingEligibleForSync);
  SLDaemonLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK nextTask: sync engine metadata should be small enough now", v4, 2u);
  }

  -[SLDCloudKitSyncWriter nextTask](self, "nextTask");
}

- (void)nextTask
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK nextTask: do nothing due to no account available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)checkForAppChanges
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!*(&self->super._saltLocked + 2))
  {
    *(&self->super._saltLocked + 2) = 1;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 10000000000);
    -[SLDCloudKitSyncBase queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__SLDCloudKitSyncWriter_checkForAppChanges__block_invoke;
    v6[3] = &unk_1E3794220;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __43__SLDCloudKitSyncWriter_checkForAppChanges__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[59])
  {
    WeakRetained[59] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "checkForAppChangesNow");
    WeakRetained = v2;
  }

}

- (void)checkForAppChangesNow
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
  v30 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("lastKnownApps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v14);

  if ((v17 & 1) == 0)
  {
    SLDaemonLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SLDCloudKitSyncBase persistence](self, "persistence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("lastKnownApps"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_199EFF000, v18, OS_LOG_TYPE_DEFAULT, "#SLDCK app list changed (prev %@, now %@)", buf, 0x16u);

    }
    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("lastKnownApps"));

    -[SLDCloudKitSyncWriter invalidateHighlightsInternal](self, "invalidateHighlightsInternal");
  }

}

- (void)invalidateHighlightsInternal
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK highlights invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __53__SLDCloudKitSyncWriter_invalidateHighlightsInternal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextTask");
}

- (BOOL)_didHandleSyncError:(id)a3 retryBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C947D8]))
  {

  }
  else
  {
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0C94878]);

    if (!v11)
    {
      objc_msgSend(v6, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0CB28A8]);

      if (!v18 || (objc_msgSend(v6, "code") | 2) != 0x1003 || !v7)
        goto LABEL_24;
      SLDaemonLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  v12 = objc_msgSend(v6, "code");
  if (v12 != 18)
  {
    if (v12 != 34)
    {
      if (v12 == 112)
      {
        SLDaemonLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SLDCloudKitSyncWriter _didHandleSyncError:retryBlock:].cold.1();

        -[SLDCloudKitSyncWriter recordZoneID](self, "recordZoneID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDCloudKitSyncWriter reset](self, "reset");
        if (v14)
        {
          -[SLDCloudKitSyncBase syncEngine](self, "syncEngine");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addRecordZonesToSave:recordZoneIDsToDelete:", 0, v16);

        }
        -[SLDCloudKitSyncWriter nextTask](self, "nextTask");

        goto LABEL_23;
      }
LABEL_24:
      v21 = 0;
      goto LABEL_25;
    }
    if (!v7)
      goto LABEL_24;
    SLDaemonLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
LABEL_20:
    -[SLDCloudKitSyncWriter _didHandleSyncError:retryBlock:].cold.2();
LABEL_21:

    v7[2](v7);
    goto LABEL_22;
  }
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("incompatibleVersion"));

LABEL_22:
  -[SLDCloudKitSyncWriter nextTask](self, "nextTask");
LABEL_23:
  v21 = 1;
LABEL_25:

  return v21;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLDCloudKitSyncWriter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke;
  block[3] = &unk_1E3795A70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;

  v2 = (id *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    v7 = a1 + 48;
    objc_msgSend(v8, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*v2, "persistence");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("recordZoneIDSaved"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if ((v14 & 1) == 0)
      {
        SLDaemonLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_1();

        objc_msgSend(*v2, "persistence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("recordZoneIDSaved"));

        objc_msgSend(*v2, "nextTask");
      }
    }
    else
    {
      SLDaemonLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_2(v7, v2, v17);

    }
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncWriter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordZoneIDSaved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "persistence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqual:", v10);

      if (v11)
      {
        SLDaemonLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_cold_1();

        v13 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_440;
        v21[3] = &unk_1E37942C0;
        v14 = *(void **)(a1 + 48);
        v15 = *(_QWORD *)(a1 + 56);
        v22 = *(id *)(a1 + 40);
        v23 = v14;
        if ((objc_msgSend(v22, "_didHandleSyncError:retryBlock:", v15, v21) & 1) == 0)
        {
          v16 = (void *)*MEMORY[0x1E0C947D8];
          objc_msgSend(*(id *)(a1 + 56), "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v16, "isEqual:", v17);

          if ((_DWORD)v16 && ((v18 = objc_msgSend(*(id *)(a1 + 56), "code"), v18 == 32) || v18 == 9))
          {
            v19 = *(void **)(a1 + 40);
            v20[0] = v13;
            v20[1] = 3221225472;
            v20[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_2;
            v20[3] = &unk_1E3794360;
            v20[4] = v19;
            objc_msgSend(v19, "checkForAccountChangesNowWithCompletion:", v20);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "nextTask");
          }
        }

      }
    }
  }
}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_440(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecordZonesToSave:recordZoneIDsToDelete:", v3, 0);

}

uint64_t __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 32), "nextTask");
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  SLDCloudKitSyncWriter *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke;
  v13[3] = &unk_1E3795C70;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    if (v4)
    {
      v6 = *(void **)(a1 + 48);
      v5 = a1 + 48;
      objc_msgSend(v6, "recordName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 40);
      SLDaemonLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
          __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_3();
      }
      else if (v13)
      {
        __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_2();
      }
    }
    else
    {
      SLDaemonLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_1();
    }

  }
}

- (void)_savedRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncWriter _savedRecord:].cold.4(v4, v8);

  objc_msgSend(*(id *)&self->_freshHighlightsGenerated, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)&self->_freshHighlightsGenerated, "setObject:forKeyedSubscript:", 0, v7);
    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("savedIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = (void *)MEMORY[0x1E0C9AA70];
    v13 = (void *)objc_msgSend(v11, "mutableCopy");

    v14 = -[SLDCloudKitSyncWriter _batchNumberOfRecordIDString:](self, "_batchNumberOfRecordIDString:", v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDCloudKitSyncWriter _idForRecordIDString:](self, "_idForRecordIDString:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v18);

    -[SLDCloudKitSyncBase persistence](self, "persistence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("savedIDs"));

    SLDaemonLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[SLDCloudKitSyncWriter _savedRecord:].cold.3(v4, v20);

    -[SLDCloudKitSyncWriter nextTask](self, "nextTask");
  }
  else
  {
    -[SLDCloudKitSyncWriter recordIDStringOfSavedIDString:](self, "recordIDStringOfSavedIDString:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    if (v21 && (objc_msgSend(v21, "isEqual:", v7) & 1) != 0)
    {
      SLDaemonLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[SLDCloudKitSyncWriter _savedRecord:].cold.2(v4, v22);
    }
    else
    {
      SLDaemonLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[SLDCloudKitSyncWriter _savedRecord:].cold.1(v4, v23);

      -[SLDCloudKitSyncBase syncEngine](self, "syncEngine");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addRecordIDsToSave:recordIDsToDelete:](v22, "addRecordIDsToSave:recordIDsToDelete:", MEMORY[0x1E0C9AA60], v25);

    }
  }

}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLDCloudKitSyncWriter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SLDCloudKitSyncWriter_syncEngine_didSaveRecord___block_invoke;
  block[3] = &unk_1E3795A70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __50__SLDCloudKitSyncWriter_syncEngine_didSaveRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_savedRecord:", *(_QWORD *)(a1 + 48));
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncWriter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if ((v9 & 1) != 0)
    {
      if (v11)
        __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_1(a1 + 48, v10);

      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_441;
      v27 = &unk_1E37942C0;
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v28 = *(id *)(a1 + 40);
      v29 = v12;
      if ((objc_msgSend(v28, "_didHandleSyncError:retryBlock:", v13, &v24) & 1) != 0)
        goto LABEL_22;
      v14 = (void *)*MEMORY[0x1E0C947D8];
      objc_msgSend(*(id *)(a1 + 56), "domain", v24, v25, v26, v27, v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v14, "isEqual:", v15);

      if ((_DWORD)v14)
      {
        v16 = objc_msgSend(*(id *)(a1 + 56), "code");
        if (v16 <= 25)
        {
          if (v16 != 9)
          {
            if (v16 == 14)
              objc_msgSend(*(id *)(a1 + 40), "_savedRecord:", *(_QWORD *)(a1 + 48));
            goto LABEL_21;
          }
          goto LABEL_19;
        }
        if (v16 != 26 && v16 != 28)
        {
          if (v16 != 32)
            goto LABEL_21;
LABEL_19:
          objc_msgSend(*(id *)(a1 + 40), "checkForAccountChanges");
          v17 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
          objc_msgSend(*(id *)(a1 + 48), "recordID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recordName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(*(id *)(a1 + 40), "syncEngine");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "recordID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = v22;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addRecordIDsToSave:recordIDsToDelete:", v23, 0);

          }
          goto LABEL_21;
        }
        objc_msgSend(*(id *)(a1 + 40), "reset");
      }
LABEL_21:
      objc_msgSend(*(id *)(a1 + 40), "nextTask");
LABEL_22:

      return;
    }
    if (v11)
      __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_2(a1 + 48, v10);

  }
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_441(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "syncEngine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addRecordIDsToSave:recordIDsToDelete:", v8, 0);

    }
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncWriter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "zoneID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      SLDaemonLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_cold_1();

      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_442;
      v25 = &unk_1E37942C0;
      v10 = *(void **)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v26 = *(id *)(a1 + 40);
      v27 = v10;
      if ((objc_msgSend(v26, "_didHandleSyncError:retryBlock:", v11, &v22) & 1) != 0)
        goto LABEL_17;
      objc_msgSend(*(id *)(a1 + 56), "domain", v22, v23, v24, v25, v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0C947D8]);

      if (v13)
      {
        v14 = objc_msgSend(*(id *)(a1 + 56), "code");
        if (v14 <= 27)
        {
          if (v14 != 9)
          {
            if (v14 != 26)
              goto LABEL_16;
LABEL_13:
            objc_msgSend(*(id *)(a1 + 48), "zoneID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "zoneName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "persistence");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v16, "isEqual:", v18);

            if (v19)
              objc_msgSend(*(id *)(a1 + 40), "reset");
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        if (v14 == 32)
        {
LABEL_15:
          objc_msgSend(*(id *)(a1 + 40), "checkForAccountChanges");
          objc_msgSend(*(id *)(a1 + 40), "syncEngine");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addRecordIDsToSave:recordIDsToDelete:", 0, v21);

          goto LABEL_16;
        }
        if (v14 == 28)
          goto LABEL_13;
      }
LABEL_16:
      objc_msgSend(*(id *)(a1 + 40), "nextTask");
LABEL_17:

    }
  }
}

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_442(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecordIDsToSave:recordIDsToDelete:", 0, v3);

}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SLDCloudKitSyncWriter *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SLDCloudKitSyncWriter_syncEngine_shouldFetchChangesForZoneID___block_invoke;
  v12[3] = &unk_1E3795C98;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

void __64__SLDCloudKitSyncWriter_syncEngine_shouldFetchChangesForZoneID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(CFSTR("readers"), "isEqual:", v5);

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v6)
    {
      *(_BYTE *)(v4 + 24) = 1;
      return;
    }
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v4 + 24) = 0;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLDCloudKitSyncWriter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke;
  block[3] = &unk_1E3795A70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "#SLDCK fetched %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(CFSTR("readers"), "isEqual:", v8);

    if (v9)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "recordSupportsOurVersion:", *(_QWORD *)(a1 + 48)))
      {
        objc_msgSend(*(id *)(a1 + 48), "recordType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(CFSTR("reader"), "isEqual:", v10);

        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "persistence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("readers"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (!v13)
            v13 = (void *)MEMORY[0x1E0C9AA70];
          v15 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(*(id *)(a1 + 48), "encryptedValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("applicationIdentifiers"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "recordID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recordName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v19);

          SLDaemonLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke_cold_1((id *)(a1 + 48));

          objc_msgSend(*(id *)(a1 + 40), "persistence");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("readers"));

          objc_msgSend(*(id *)(a1 + 40), "checkForAppChanges");
        }
      }
    }
  }
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncWriter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "zoneID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("readers"), "isEqual:", v4))
    {
      v5 = objc_msgSend(CFSTR("reader"), "isEqual:", *(_QWORD *)(a1 + 56));

      if (v5)
      {
        SLDaemonLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke_cold_1();

        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("readers"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8)
          v8 = (void *)MEMORY[0x1E0C9AA70];
        v10 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 48), "recordName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

        objc_msgSend(*(id *)(a1 + 40), "persistence");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("readers"));

        objc_msgSend(*(id *)(a1 + 40), "checkForAppChanges");
      }
    }
    else
    {

    }
  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SLDCloudKitSyncWriter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke;
  block[3] = &unk_1E3795C48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "#SLDCK Failed to fetch changes for zone %@: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0C947D8]))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0C94878]);

      if (!v9)
        return;
    }
    if (objc_msgSend(*(id *)(a1 + 56), "code") == 112)
    {
      objc_msgSend(*(id *)(a1 + 48), "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(CFSTR("readers"), "isEqual:", v10);

      if (v11)
      {
        SLDaemonLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1();

        objc_msgSend(*(id *)(a1 + 40), "syncEngine");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRecordZonesToSave:recordZoneIDsToDelete:", 0, v14);

      }
    }
  }
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_25(&dword_199EFF000, v0, v1, "#SLDCK Dellocating while writes are pending! This should never happen!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)invalidateHighlights
{
  NSObject *v3;
  _QWORD block[5];

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD handler[4];
  id v14;
  id v15;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  if (v3)
  {
    dispatch_suspend(v3);
  }
  else
  {
    objc_initWeak(&location, v2);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v5;

    v8 = (void *)os_transaction_create();
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke_2;
    handler[3] = &unk_1E3795508;
    v14 = v8;
    v10 = v8;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, handler);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v12 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
}

void __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke_2(uint64_t a1)
{
  id v2;
  dispatch_source_t v3;
  dispatch_source_t *WeakRetained;

  v2 = *(id *)(a1 + 32);
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_source_cancel(WeakRetained[9]);
    v3 = WeakRetained[9];
    WeakRetained[9] = 0;

    -[dispatch_source_t invalidateHighlightsInternal](WeakRetained, "invalidateHighlightsInternal");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsToUpload, 0);
  objc_storeStrong((id *)&self->_freshHighlightsGenerated, 0);
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6_cold_1()
{
  __assert_rtn("-[SLDCloudKitSyncWriter fetchAndProcessFreshHighlights]_block_invoke_6", "SLDCloudKitSync.m", 1002, "[cached isKindOfClass:[NSString class]]");
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK failed to make SLPerson from Portrait person (err: %@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_381_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(&dword_199EFF000, v0, OS_LOG_TYPE_FAULT, "#SLDCK error encoding supplementaryData: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_recordIDsFromStrings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_25(&dword_199EFF000, v0, v1, "#SLDCK recordIDFromStrings returning empty array because we don't have a record zone yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didHandleSyncError:retryBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "#SLDCK missing manatee identity, resetting and then deleting the condemned zone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didHandleSyncError:retryBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK retrying for error %@", v2);
  OUTLINED_FUNCTION_5();
}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "#SLDCK record zone saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recordZoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v6;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v9, "#SLDCK unexpected record zone saved (was %@, expected %@)", (uint8_t *)&v10);

}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK error when trying to save record zone: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK sync engine wants %@ but we don't have any record contents available, returnin nil", v2);
  OUTLINED_FUNCTION_5();
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK sync engine wants contents of %@ but we no longer need to upload it. returning nil.", v2);
  OUTLINED_FUNCTION_5();
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK providing contents of %@ to sync engine for upload", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_savedRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK deleting record %@ that was just uploaded as it is no longer needed", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_savedRecord:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK ignoring double-notification of upload for %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_savedRecord:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK updated persistence state for uploaded record %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_savedRecord:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "#SLDCK sync engine saved record %@ to server", v5);

  OUTLINED_FUNCTION_6();
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "#SLDCK error saving record %@", v5);

  OUTLINED_FUNCTION_6();
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v6, "#SLDCK ignoring failed record uploaded in unexpected zone %@", v7);

  OUTLINED_FUNCTION_9();
}

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK error deleting record %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke_cold_1(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((id)OUTLINED_FUNCTION_18((uint64_t)a1), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "encryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("applicationIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v5, v6, "#SLDCK reader record %@ has application identifiers %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

void __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK reader record %@ was deleted", v2);
  OUTLINED_FUNCTION_5();
}

void __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "#SLDCK Deleting readers zone due to missing manatee identity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
