@implementation RKRankLearner

- (RKRankLearner)init
{
  RKRankLearner *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKRankLearner;
  v2 = -[RKRankLearner init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)_languageRankingModel;
    _languageRankingModel = (uint64_t)v3;

  }
  return v2;
}

- (id)getDBManager:(id)a3
{
  id v3;
  void *v4;
  RKRankingDataManager *v5;

  v3 = a3;
  objc_msgSend((id)_languageRankingModel, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)_languageRankingModel, "objectForKeyedSubscript:", v3);
    v5 = (RKRankingDataManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[RKRankingDataManager initWithLanguageID:]([RKRankingDataManager alloc], "initWithLanguageID:", v3);
    objc_msgSend((id)_languageRankingModel, "setObject:forKeyedSubscript:", v5, v3);
  }

  return v5;
}

- (id)getDBManager:(id)a3 withCustomPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RKRankingDataManager *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)_languageRankingModel, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)_languageRankingModel, "objectForKeyedSubscript:", v5);
    v8 = (RKRankingDataManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v6);
    v8 = -[RKRankingDataManager initWithDatabaseFilename:]([RKRankingDataManager alloc], "initWithDatabaseFilename:", v9);
    objc_msgSend((id)_languageRankingModel, "setObject:forKeyedSubscript:", v8, v5);

  }
  return v8;
}

- (BOOL)insertRankingInfo:(id)a3 forLanguageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Unknown"));
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[RKRankLearner insertRankingInfo:forLanguageID:].cold.1();
  }
  else
  {
    -[RKRankLearner getDBManager:](self, "getDBManager:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertRankingInfoFromDictionary:", v6);

  }
  return v9 ^ 1;
}

- (id)updateFeaturesForResponse:(id)a3 selectCounts:(id)a4 inputMethodCounts:(id)a5 sourceCounts:(id)a6 currentTime:(id)a7 languageCode:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  RKResponseFeatures *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  RKResponseFeatures *v55;
  uint64_t v56;
  unsigned int v58;
  void *v59;
  id v60;
  id v61;
  id v62;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(" "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("zh-Hans")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("th")) & 1) != 0
    || objc_msgSend(v18, "isEqualToString:", CFSTR("ko")))
  {
    v21 = objc_msgSend(v13, "length");
    v22 = v21 > 0x14;
  }
  else
  {
    v22 = 0;
    v21 = v20;
  }
  v23 = 0;
  if (v20 <= 5 && !v22)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25 >= 2)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timestamp");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "timeIntervalSinceDate:", v59);
      v28 = v27 / 86400.0;
      objc_msgSend(v16, "objectForKeyedSubscript:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v15;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v30);
      v58 = v25;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v17;
      v32 = objc_msgSend(v31, "intValue");

      objc_msgSend(v16, "objectForKeyedSubscript:", v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v16;
      v36 = objc_msgSend(v35, "intValue");

      v37 = (double)v32 / (double)(v36 + v32);
      v38 = (double)v36 / (double)(v36 + v32);
      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = objc_msgSend(v41, "intValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v44, "intValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "intValue");

      v17 = v60;
      v49 = (_DWORD)v34 + (_DWORD)v35 + v48;
      v50 = (double)(int)v35 / (double)v49;
      v51 = (double)(int)v34 / (double)v49;
      v52 = (double)v48 / (double)v49;
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "hasSameRecipient");

      v15 = v62;
      v55 = [RKResponseFeatures alloc];
      v56 = v54;
      v16 = v61;
      v23 = -[RKResponseFeatures initWithFeatures:count:numOfElapsedDays:sourceAppCount:sourceNotificationCount:inputSourceCannedCount:inputSourceScribbleCount:inputSourceDictationCount:responseLength:sameRecipientCount:](v55, "initWithFeatures:count:numOfElapsedDays:sourceAppCount:sourceNotificationCount:inputSourceCannedCount:inputSourceScribbleCount:inputSourceDictationCount:responseLength:sameRecipientCount:", v13, v58, v21, v56, v28, v37, v38, v50, v51, v52);

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (id)getRankedResponses:(id)a3 forRecipientID:(id)a4 withLanguageID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  RKResponseCountTimestampRecipient *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
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
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  BOOL v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v102;
  void *v103;
  void *v104;
  void *v106;
  id obj;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD block[5];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v110 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKRankLearner getDBManager:](self, "getDBManager:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__RKRankLearner_getRankedResponses_forRecipientID_withLanguageID___block_invoke;
  block[3] = &unk_24C6AF3F0;
  block[4] = self;
  v103 = v9;
  if (getRankedResponses_forRecipientID_withLanguageID__onceToken != -1)
    dispatch_once(&getRankedResponses_forRecipientID_withLanguageID__onceToken, block);
  v102 = v11;
  v104 = v8;
  objc_msgSend(v11, "fetchRankingInfoForCategory:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v111 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v12;
  v117 = v14;
  v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
  if (v112)
  {
    v108 = *(_QWORD *)v127;
    v15 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v127 != v108)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_msgSend(v17, "recipientId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v110);

        objc_msgSend(v17, "timestamp");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "response");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v114 = v20;
        if (v22)
        {
          objc_msgSend(v17, "response");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          v26 = v20;
          objc_msgSend(v17, "response");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timestamp");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v26, "compare:", v29);

          if (v30 == -1)
          {
            objc_msgSend(v17, "response");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "timestamp");
            v33 = objc_claimAutoreleasedReturnValue();

            v26 = (id)v33;
          }
          objc_msgSend(v17, "response");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setCount:", (v25 + 1));

          objc_msgSend(v17, "response");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setTimestamp:", v26);

          objc_msgSend(v17, "response");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v19 | objc_msgSend(v39, "hasSameRecipient");
          objc_msgSend(v17, "response");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setHasSameRecipient:", v40);

          v43 = v111;
          v14 = v117;
          v15 = 0x24BDD1000;
        }
        else
        {
          v44 = -[RKResponseCountTimestampRecipient initWithCount:timestamp:hasSameRecipient:]([RKResponseCountTimestampRecipient alloc], "initWithCount:timestamp:hasSameRecipient:", 1, v20, v19);
          objc_msgSend(v17, "response");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, v45);

          v26 = (id)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v46, v47);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v48, v49);

          objc_msgSend(v17, "response");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v111;
          objc_msgSend(v111, "setObject:forKeyedSubscript:", v26, v50);

          v38 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKey:", v51, v52);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKey:", v53, v54);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKey:", v55, v56);

          objc_msgSend(v17, "response");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v38, v39);
        }

        objc_msgSend(v17, "response");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v15 + 1760), "numberWithUnsignedInteger:", objc_msgSend(v17, "source"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "intValue") + 1;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "response");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "source"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v62, v65);

        objc_msgSend(v17, "response");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "inputMethod"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "intValue") + 1;

        v71 = v70;
        v15 = 0x24BDD1000uLL;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "response");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "inputMethod"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setObject:forKeyedSubscript:", v72, v75);

      }
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
    }
    while (v112);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v76 = objc_claimAutoreleasedReturnValue();
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v77 = v13;
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v123;
    do
    {
      for (j = 0; j != v79; ++j)
      {
        if (*(_QWORD *)v123 != v80)
          objc_enumerationMutation(v77);
        v82 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
        -[RKRankLearner updateFeaturesForResponse:selectCounts:inputMethodCounts:sourceCounts:currentTime:languageCode:](self, "updateFeaturesForResponse:selectCounts:inputMethodCounts:sourceCounts:currentTime:languageCode:", v82, v77, v117, v111, v76, v106);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setObject:forKeyedSubscript:", v83, v82);

      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
    }
    while (v79);
  }
  v109 = (void *)v76;

  v113 = (void *)objc_opt_new();
  v115 = (void *)objc_opt_new();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v84 = obj;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
  v86 = v117;
  if (v85)
  {
    v87 = v85;
    v88 = *(_QWORD *)v119;
    do
    {
      for (k = 0; k != v87; ++k)
      {
        if (*(_QWORD *)v119 != v88)
          objc_enumerationMutation(v84);
        v90 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * k);
        objc_msgSend(v90, "response");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "objectForKeyedSubscript:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        if (v92)
        {
          objc_msgSend(v90, "response");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "count");

          v96 = v95 < 2;
          v86 = v117;
          if (!v96)
          {
            objc_msgSend(v90, "response");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = objc_msgSend(v115, "containsObject:", v97);

            if ((v98 & 1) == 0)
            {
              objc_msgSend(v90, "response");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "addObject:", v99);

              objc_msgSend(v113, "addObject:", v92);
            }
          }
        }

      }
      v87 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
    }
    while (v87);
  }

  -[RKRankLearner rankResponses:](self, "rankResponses:", v113);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  return v100;
}

void __66__RKRankLearner_getRankedResponses_forRecipientID_withLanguageID___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  RKResponseCollection *v3;
  RKBundleDataProvider *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("RKAssetsConstantClasses"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [RKResponseCollection alloc];
  v4 = -[RKBundleDataProvider initWithAssetPlist:]([RKBundleDataProvider alloc], "initWithAssetPlist:", v2);
  v5 = -[RKResponseCollection initWithDynamicDataURL:displayStringsProvider:](v3, "initWithDynamicDataURL:displayStringsProvider:", 0, v4);
  v6 = (void *)getRankedResponses_forRecipientID_withLanguageID__responseCollection;
  getRankedResponses_forRecipientID_withLanguageID__responseCollection = v5;

}

- (id)rankResponses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  RKRankedResponse *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v10, "response");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "responseLength");
        objc_msgSend(v10, "numOfElapsedDays");
        v39 = exp(v13 / -30.0);
        v14 = log((double)(int)(objc_msgSend(v10, "count") + 1));
        objc_msgSend(v10, "normalizedSourceAppCount");
        v16 = log(v15 + 1.0);
        objc_msgSend(v10, "normalizedSourceNotificationCount");
        v18 = log(v17 + 1.0);
        objc_msgSend(v10, "normalizedInputMethodCannedCount");
        v20 = log(v19 + 1.0);
        objc_msgSend(v10, "normalizedInputMethodScribbleCount");
        v22 = log(v21 + 1.0);
        objc_msgSend(v10, "normalizedInputMethodDictationCount");
        v24 = log(v23 + 1.0);
        v25 = log((double)(int)(objc_msgSend(v10, "sameRecipientCount") + 1));
        objc_msgSend(v10, "normalizedInputMethodDictationCount");
        if (v26 <= 0.0 && (objc_msgSend(v10, "normalizedInputMethodScribbleCount"), v27 <= 0.0))
        {
          v31 = 0;
        }
        else
        {
          objc_msgSend(v10, "normalizedInputMethodDictationCount");
          v29 = v28;
          objc_msgSend(v10, "normalizedInputMethodScribbleCount");
          if (v29 <= v30)
            v31 = 1;
          else
            v31 = 2;
        }
        v32 = -[RKRankedResponse initWithResponse:inputMethod:score:]([RKRankedResponse alloc], "initWithResponse:inputMethod:score:", v11, v31, 1.0 / sqrt((double)v12) + (v25 + v14 + v16 * 0.5 + v18 * 0.5 + v20 * 0.2 + v22 * 0.4 + v24 * 0.4) * v39);
        objc_msgSend(v4, "addObject:", v32);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v35, "count") < 4)
  {
    v36 = v35;
  }
  else
  {
    objc_msgSend(v35, "subarrayWithRange:", 0, 3);
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = v36;

  return v37;
}

- (void)flushRankingData:(id)a3
{
  id v3;

  -[RKRankLearner getDBManager:](self, "getDBManager:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flushRankingData");

}

- (void)insertRankingInfo:forLanguageID:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Category is marked as Unknown, cannot insert the messages", v0, 2u);
}

@end
