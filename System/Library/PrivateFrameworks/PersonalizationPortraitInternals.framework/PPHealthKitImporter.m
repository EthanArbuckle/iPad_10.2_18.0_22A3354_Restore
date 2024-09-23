@implementation PPHealthKitImporter

- (PPHealthKitImporter)initWithDatabase:(id)a3
{
  id v5;
  PPHealthKitImporter *v6;
  void *v7;
  id v8;
  uint64_t v9;
  HKHealthStore *healthStore;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPHealthKitImporter;
  v6 = -[PPHealthKitImporter init](&v12, sel_init);
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v7 = (void *)getHKHealthStoreClass_softClass_20014;
    v17 = getHKHealthStoreClass_softClass_20014;
    if (!getHKHealthStoreClass_softClass_20014)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getHKHealthStoreClass_block_invoke_20015;
      v13[3] = &unk_1E7E1F798;
      v13[4] = &v14;
      __getHKHealthStoreClass_block_invoke_20015((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v14, 8);
    v9 = objc_opt_new();
    healthStore = v6->_healthStore;
    v6->_healthStore = (HKHealthStore *)v9;

    objc_storeStrong((id *)&v6->_db, a3);
  }

  return v6;
}

- (void)importHealthKitData
{
  -[PPHealthKitImporter importHealthKitDataWithShouldContinueBlock:](self, "importHealthKitDataWithShouldContinueBlock:", &__block_literal_global_20011);
}

- (void)importHealthKitDataWithShouldContinueBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  dispatch_semaphore_t v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  PPSQLDatabase *db;
  id v13;
  uint64_t (**v14)(_QWORD);
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  NSObject *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint8_t *v31;
  uint8_t buf[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = (uint64_t (**)(_QWORD))a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v5 = dispatch_semaphore_create(0);
  if (*((_BYTE *)v24 + 24))
  {
    while (2)
    {
      v27 = 0;
      v28 = (uint64_t)&v27;
      v29 = 0x2050000000;
      v6 = (void *)getHKAnchoredObjectQueryClass_softClass;
      v30 = (void *)getHKAnchoredObjectQueryClass_softClass;
      if (!getHKAnchoredObjectQueryClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v33 = 3221225472;
        v34 = 0x1C3A80000;
        v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7E1F798;
        v36 = (void (*)(uint64_t))&v27;
        __getHKAnchoredObjectQueryClass_block_invoke((uint64_t)buf);
        v6 = *(void **)(v28 + 24);
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v27, 8);
      v8 = [v7 alloc];
      v27 = 0;
      v28 = (uint64_t)&v27;
      v29 = 0x2050000000;
      v9 = (void *)getHKObjectTypeClass_softClass;
      v30 = (void *)getHKObjectTypeClass_softClass;
      if (!getHKObjectTypeClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v33 = 3221225472;
        v34 = (uint64_t)__getHKObjectTypeClass_block_invoke;
        v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7E1F798;
        v36 = (void (*)(uint64_t))&v27;
        __getHKObjectTypeClass_block_invoke((uint64_t)buf);
        v9 = *(void **)(v28 + 24);
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v10, "workoutType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        *(_QWORD *)buf = 0;
        v33 = (uint64_t)buf;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__20004;
        v36 = __Block_byref_object_dispose__20005;
        v37 = 0;
        db = self->_db;
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = (uint64_t)__38__PPHealthKitImporter__getSavedAnchor__block_invoke;
        v30 = &unk_1E7E1DEE8;
        v31 = buf;
        -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 6, &v27);
        v13 = *(id *)(v33 + 40);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v13 = 0;
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__PPHealthKitImporter_importHealthKitDataWithShouldContinueBlock___block_invoke;
      v19[3] = &unk_1E7E1DE80;
      v22 = &v23;
      v14 = v4;
      v21 = v14;
      v19[4] = self;
      v15 = v5;
      v20 = v15;
      v16 = (void *)objc_msgSend(v8, "initWithType:predicate:anchor:limit:resultsHandler:", v11, 0, v13, 50, v19);

      -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v16);
      while (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v15, 1.0) == 1)
      {
        if ((v4[2](v14) & 1) == 0)
        {
          pp_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: HealthKitImporter: deferring", buf, 2u);
          }

          -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", v16);
          goto LABEL_18;
        }
      }

      if (*((_BYTE *)v24 + 24))
        continue;
      break;
    }
  }
LABEL_18:

  _Block_object_dispose(&v23, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __66__PPHealthKitImporter_importHealthKitDataWithShouldContinueBlock___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  void *v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *context;
  void *v78;
  id v79;
  void *v80;
  uint64_t i;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *v90;
  void **v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  __int128 buf;
  void (*v168)(uint64_t, void *);
  void *v169;
  id v170;
  void **v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
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
  void *v241;
  void *v242;
  _BYTE v243[24];
  uint64_t v244;

  v244 = *MEMORY[0x1E0C80C00];
  v65 = a2;
  v68 = a3;
  v67 = a4;
  v66 = a5;
  v70 = a6;
  objc_opt_self();
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = *MEMORY[0x1E0D70DE8];
  LOBYTE(a5) = objc_msgSend(v10, "bundleIdentifierIsEnabledForDonation:");

  if ((a5 & 1) == 0)
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter disabled due to settings.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v70)
  {
    if (!objc_msgSend(v68, "count") && !objc_msgSend(v67, "count"))
    {
      pp_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: All Workouts have been imported", (uint8_t *)&buf, 2u);
      }
      goto LABEL_8;
    }
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0)
      goto LABEL_9;
    if (a1[4])
    {
      v90 = 0;
      objc_msgSend(v67, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v86 = 0;
      v15 = objc_msgSend(v14, "deleteAllTopicsFromSourcesWithBundleId:documentIds:deletedCount:error:", v76, v13, &v90, &v86);
      v16 = (id)v86;

      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v90;
          _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: deleted %tu workouts", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: failed to delete workouts, %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0)
      goto LABEL_9;
    v19 = a1[4];
    v64 = v68;
    if (v19)
    {
      pp_default_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_msgSend(v64, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Received donation of %tu workout(s)", (uint8_t *)&buf, 0xCu);
      }

      objc_opt_self();
      v90 = &unk_1E7E59E70;
      v91 = (void **)&unk_1E7E59E88;
      *(_QWORD *)&buf = &unk_1E7E5B5F0;
      *((_QWORD *)&buf + 1) = &unk_1E7E5B608;
      v92 = (uint64_t)&unk_1E7E59EA0;
      v93 = &unk_1E7E59EB8;
      v168 = (void (*)(uint64_t, void *))&unk_1E7E5B620;
      v169 = &unk_1E7E5B638;
      v94 = &unk_1E7E59ED0;
      v95 = &unk_1E7E59EE8;
      v170 = &unk_1E7E5B650;
      v171 = (void **)&unk_1E7E5B668;
      v96 = &unk_1E7E59F00;
      v97 = &unk_1E7E59F18;
      v172 = &unk_1E7E5B680;
      v173 = &unk_1E7E5B698;
      v98 = &unk_1E7E59F30;
      v99 = &unk_1E7E59F48;
      v174 = &unk_1E7E5B6B0;
      v175 = &unk_1E7E5B6C8;
      v100 = &unk_1E7E59F60;
      v101 = &unk_1E7E59F78;
      v176 = &unk_1E7E5B6E0;
      v177 = &unk_1E7E5B6F8;
      v102 = &unk_1E7E59F90;
      v103 = &unk_1E7E59FA8;
      v178 = &unk_1E7E5B710;
      v179 = &unk_1E7E5B728;
      v104 = &unk_1E7E59FC0;
      v105 = &unk_1E7E59FD8;
      v180 = &unk_1E7E5B740;
      v181 = &unk_1E7E5B758;
      v106 = &unk_1E7E59FF0;
      v107 = &unk_1E7E5A008;
      v182 = &unk_1E7E5B770;
      v183 = &unk_1E7E5B788;
      v108 = &unk_1E7E5A020;
      v109 = &unk_1E7E5A038;
      v184 = &unk_1E7E5B7A0;
      v185 = &unk_1E7E5B7B8;
      v110 = &unk_1E7E5A050;
      v111 = &unk_1E7E5A068;
      v186 = &unk_1E7E5B7D0;
      v187 = &unk_1E7E5B7E8;
      v112 = &unk_1E7E5A080;
      v113 = &unk_1E7E5A098;
      v188 = &unk_1E7E5B800;
      v189 = &unk_1E7E5B818;
      v114 = &unk_1E7E5A0B0;
      v115 = &unk_1E7E5A0C8;
      v190 = &unk_1E7E5B830;
      v191 = &unk_1E7E5B848;
      v116 = &unk_1E7E5A0E0;
      v117 = &unk_1E7E5A0F8;
      v192 = &unk_1E7E5B860;
      v193 = &unk_1E7E5B878;
      v118 = &unk_1E7E5A110;
      v119 = &unk_1E7E5A128;
      v194 = &unk_1E7E5B890;
      v195 = &unk_1E7E5B8A8;
      v120 = &unk_1E7E5A140;
      v121 = &unk_1E7E5A158;
      v196 = &unk_1E7E5B8C0;
      v197 = &unk_1E7E5B8D8;
      v122 = &unk_1E7E5A170;
      v123 = &unk_1E7E5A188;
      v198 = &unk_1E7E5B8F0;
      v199 = &unk_1E7E5B908;
      v124 = &unk_1E7E5A1A0;
      v125 = &unk_1E7E5A1B8;
      v200 = &unk_1E7E5B920;
      v201 = &unk_1E7E5B938;
      v126 = &unk_1E7E5A1D0;
      v127 = &unk_1E7E5A1E8;
      v202 = &unk_1E7E5B950;
      v203 = &unk_1E7E5B968;
      v128 = &unk_1E7E5A200;
      v129 = &unk_1E7E5A218;
      v204 = &unk_1E7E5B980;
      v205 = &unk_1E7E5B998;
      v130 = &unk_1E7E5A230;
      v131 = &unk_1E7E5A248;
      v206 = &unk_1E7E5B9B0;
      v207 = &unk_1E7E5B9C8;
      v132 = &unk_1E7E5A260;
      v133 = &unk_1E7E5A278;
      v208 = &unk_1E7E5B9E0;
      v209 = &unk_1E7E5B9F8;
      v134 = &unk_1E7E5A290;
      v135 = &unk_1E7E5A2A8;
      v210 = &unk_1E7E5BA10;
      v211 = &unk_1E7E5BA28;
      v136 = &unk_1E7E5A2C0;
      v137 = &unk_1E7E5A2D8;
      v212 = &unk_1E7E5BA40;
      v213 = &unk_1E7E5BA58;
      v138 = &unk_1E7E5A2F0;
      v139 = &unk_1E7E5A308;
      v214 = &unk_1E7E5BA70;
      v215 = &unk_1E7E5BA88;
      v140 = &unk_1E7E5A320;
      v141 = &unk_1E7E5A338;
      v216 = &unk_1E7E5BAA0;
      v217 = &unk_1E7E5BAB8;
      v142 = &unk_1E7E5A350;
      v143 = &unk_1E7E5A368;
      v218 = &unk_1E7E5BAD0;
      v219 = &unk_1E7E5BAE8;
      v144 = &unk_1E7E5A380;
      v145 = &unk_1E7E5A398;
      v220 = &unk_1E7E5BB00;
      v221 = &unk_1E7E5BB18;
      v146 = &unk_1E7E5A3B0;
      v147 = &unk_1E7E5A3C8;
      v222 = &unk_1E7E5BB30;
      v223 = &unk_1E7E5BB48;
      v148 = &unk_1E7E5A3E0;
      v149 = &unk_1E7E5A3F8;
      v224 = &unk_1E7E5BB60;
      v225 = &unk_1E7E5BB78;
      v150 = &unk_1E7E5A410;
      v151 = &unk_1E7E5A428;
      v226 = &unk_1E7E5BB90;
      v227 = &unk_1E7E5BBA8;
      v152 = &unk_1E7E5A440;
      v153 = &unk_1E7E5A458;
      v228 = &unk_1E7E5BBC0;
      v229 = &unk_1E7E5BBD8;
      v154 = &unk_1E7E5A470;
      v230 = &unk_1E7E5BBF0;
      v155 = &unk_1E7E5A488;
      v231 = &unk_1E7E5BC08;
      v156 = &unk_1E7E5A4A0;
      v232 = &unk_1E7E5BC20;
      v157 = &unk_1E7E5A4B8;
      v233 = &unk_1E7E5BC38;
      v158 = &unk_1E7E5A4D0;
      v234 = &unk_1E7E5BC50;
      v159 = &unk_1E7E5A4E8;
      v235 = &unk_1E7E5BC68;
      v160 = &unk_1E7E5A500;
      v236 = &unk_1E7E5BC80;
      v161 = &unk_1E7E5A518;
      v237 = &unk_1E7E5BC98;
      v162 = &unk_1E7E5A530;
      v238 = &unk_1E7E5BCB0;
      v163 = &unk_1E7E5A548;
      v239 = &unk_1E7E5BCC8;
      v164 = &unk_1E7E5A560;
      v240 = &unk_1E7E5BCE0;
      v165 = &unk_1E7E5A578;
      v241 = &unk_1E7E5BCF8;
      v166 = &unk_1E7E5A590;
      v242 = &unk_1E7E5BD10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v90, 77);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = v64;
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, &v90, 16);
      if (v75)
      {
        v72 = *MEMORY[0x1E0D70EB8];
        v73 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v75; ++i)
          {
            if (*(_QWORD *)v83 != v73)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            context = (void *)MEMORY[0x1C3BD6630]();
            pp_default_log_handle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = objc_msgSend(v22, "workoutActivityType");
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v24;
              _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Workout Type %tu", (uint8_t *)&buf, 0xCu);
            }

            v25 = v22;
            v79 = v74;
            v26 = (void *)objc_opt_new();
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "workoutActivityType"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v86, &buf, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v87;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v87 != v30)
                    objc_enumerationMutation(v28);
                  v32 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j);
                  if (v32)
                  {
                    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v32);
                    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v33, 0.5);
                    objc_msgSend(v26, "addObject:", v34);

                  }
                  else
                  {
                    pp_default_log_handle();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      v35 = objc_msgSend(v25, "workoutActivityType");
                      *(_DWORD *)v243 = 134217984;
                      *(_QWORD *)&v243[4] = v35;
                      _os_log_impl(&dword_1C392E000, v33, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: No unmapping found for workout activity type to QID: %tu", v243, 0xCu);
                    }
                  }

                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v86, &buf, 16);
              }
              while (v29);
            }

            v36 = v25;
            v37 = v26;
            objc_msgSend(v36, "workoutEvents");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              objc_msgSend(v38, "lastObject");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "dateInterval");
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v42 = objc_alloc(MEMORY[0x1E0D70C80]);
              objc_msgSend(v41, "duration");
              LODWORD(v44) = vcvtad_u64_f64(v43);
              v80 = (void *)objc_msgSend(v42, "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, v44, 0, 1, 0, 0);
              objc_msgSend(v41, "endDate");
              v78 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v78 = 0;
              v80 = 0;
            }
            v45 = objc_alloc(MEMORY[0x1E0D70C78]);
            objc_msgSend(v36, "UUID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "UUIDString");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              v48 = (void *)objc_msgSend(v45, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v76, v72, v47, v78, 0, 0, 0, v80);
            }
            else
            {
              v49 = (void *)objc_opt_new();
              v48 = (void *)objc_msgSend(v45, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v76, v72, v47, v49, 0, 0, 0, v80);

            }
            +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v86 = 0;
            v51 = objc_msgSend(v50, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v37, v48, 9, 0, 0, &v86, 0.0);

            v52 = (id)v86;
            if ((v51 & 1) != 0)
            {
              +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)v243 = 0;
              v54 = objc_msgSend(v53, "flushDonationsWithError:", v243);
              v55 = *(id *)v243;

              if ((v54 & 1) == 0)
              {
                pp_default_log_handle();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v55;
                  _os_log_impl(&dword_1C392E000, v56, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: HealthKitImporter: Warning: failed to flush: %@", (uint8_t *)&buf, 0xCu);
                }

              }
              pp_default_log_handle();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                v58 = objc_msgSend(v36, "workoutActivityType");
                LODWORD(buf) = 134217984;
                *(_QWORD *)((char *)&buf + 4) = v58;
                _os_log_impl(&dword_1C392E000, v57, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Donated topics for workout activity type: %tu", (uint8_t *)&buf, 0xCu);
              }

            }
            else
            {
              pp_default_log_handle();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v52;
                _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: Error donating topics %@", (uint8_t *)&buf, 0xCu);
              }
            }

            objc_autoreleasePoolPop(context);
          }
          v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, &v90, 16);
        }
        while (v75);
      }

    }
    if (v66)
    {
      v59 = a1[4];
      v60 = v66;
      if (v59)
      {
        v90 = 0;
        v91 = &v90;
        v92 = 0x2020000000;
        LOBYTE(v93) = 0;
        v61 = *(void **)(v59 + 16);
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v168 = __35__PPHealthKitImporter__saveAnchor___block_invoke;
        v169 = &unk_1E7E1F148;
        v62 = v60;
        v170 = v62;
        v171 = &v90;
        objc_msgSend(v61, "writeTransactionWithClient:block:", 6, &buf);
        LODWORD(v61) = *((_BYTE *)v91 + 24) == 0;

        _Block_object_dispose(&v90, 8);
        if ((_DWORD)v61)
        {
          pp_default_log_handle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1C392E000, v63, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: saved new anchor", (uint8_t *)&buf, 2u);
          }
          goto LABEL_73;
        }
      }
      else
      {

      }
    }
    pp_default_log_handle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1C392E000, v63, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: failed to save new anchor", (uint8_t *)&buf, 2u);
    }
LABEL_73:

    v12 = a1;
    goto LABEL_10;
  }
  pp_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v70;
    _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_8:

LABEL_9:
  v12 = a1;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
LABEL_10:
  dispatch_semaphore_signal((dispatch_semaphore_t)v12[5]);

}

void __35__PPHealthKitImporter__saveAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v5, CFSTR("workoutQueryAnchorIdentifiers"), v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: _workoutQueryAnchorIdentifiers: failed to serialize HKQueryAnchor: %@", buf, 0xCu);
    }

  }
}

id __46__PPHealthKitImporter__removeDeletedWorkouts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __38__PPHealthKitImporter__getSavedAnchor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", CFSTR("workoutQueryAnchorIdentifiers"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)getHKQueryAnchorClass_softClass;
    v17 = getHKQueryAnchorClass_softClass;
    if (!getHKQueryAnchorClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v19 = __getHKQueryAnchorClass_block_invoke;
      v20 = &unk_1E7E1F798;
      v21 = &v14;
      __getHKQueryAnchorClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v13 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v7, v4, &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v8;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: _workoutQueryAnchorIdentifiers: failed to deserialize HKQueryAnchor: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }

}

uint64_t __42__PPHealthKitImporter_importHealthKitData__block_invoke()
{
  return 1;
}

@end
