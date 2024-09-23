@implementation OSATasking

+ (id)proxyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  id v17;
  const __CFString *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  uint64_t v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v12, "length") != 0;
  if (v13 != -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("-1")))
  {
    if (objc_msgSend(v12, "length"))
    {
      if (v12)
      {
        v14 = 0;
LABEL_9:
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("ca1")))
        {
          v17 = v12;
          v34 = 0;
          v44[0] = CFSTR("taskingID");
          v18 = v10;
          if ((v14 & 1) == 0)
            goto LABEL_25;
          goto LABEL_24;
        }
        v35 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v35);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v35;
        v20 = v19;
        if (v17)
          v21 = 1;
        else
          v21 = v14;
        if (v21 == 1)
        {
          v34 = v19;
          v44[0] = CFSTR("taskingID");
          v18 = v10;
          if (!v14)
            goto LABEL_25;
          goto LABEL_24;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v20;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Tasking blob was not encodable: %@", buf, 0xCu);
        }
        +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "appleInternal");

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "identifier");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("/tmp/bad_%@_%@.blob"), v17, v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "writeToFile:atomically:", v25, 1);
          v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_30:

LABEL_33:
          goto LABEL_34;
        }
LABEL_32:
        v15 = (void *)MEMORY[0x1E0C9AA70];
        goto LABEL_33;
      }
    }
    else
    {
      v16 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("-1"));
      v14 = v16;
      if (v12)
        goto LABEL_9;
      if (v16)
      {
        v17 = 0;
        v34 = 0;
        v44[0] = CFSTR("taskingID");
        LOBYTE(v14) = 1;
LABEL_24:
        v18 = CFSTR("-1");
LABEL_25:
        v45[0] = v18;
        v44[1] = CFSTR("proxyingDeviceTimeAtReceipt");
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        objc_msgSend(v26, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v29, "mutableCopy");

        if ((v14 & 1) == 0)
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, CFSTR("payload"));
        objc_msgSend(v11, "logPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tasking.%@.proxy"), v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByAppendingPathComponent:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v32;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "saving proxy tasking as %@", buf, 0xCu);
        }
        objc_msgSend(v25, "writeToFile:atomically:", v32, 1);
        v42[0] = CFSTR("action");
        v42[1] = CFSTR("taskId");
        v43[0] = CFSTR("staged");
        v43[1] = v10;
        v42[2] = CFSTR("blob");
        v43[2] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v34;
        goto LABEL_30;
      }
    }
    v20 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    v40 = 2048;
    v41 = objc_msgSend(v12, "length");
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "proxy %@ taskId %@ with rawblob (%lu bytes) is inconsistent", buf, 0x20u);
  }
  v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_34:

  return v15;
}

+ (id)applyTasking:(id)a3 taskId:(id)a4 fromBlob:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id *v27;
  char v28;
  __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __CFString *v69;
  void *v70;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v72;
  void *v73;
  char v74;
  id v75;
  uint64_t *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  __int128 v83;
  char v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  int v97;
  _BOOL4 v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __CFNotificationCenter *v106;
  id v107;
  __int128 v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  int v120;
  id v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  _QWORD v132[8];
  id obj;
  _QWORD v134[7];
  id v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  void (*v140)(uint64_t);
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  const __CFString *v146;
  void *v147;
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[3];
  _QWORD v151[3];
  _QWORD v152[2];
  _QWORD v153[2];
  const __CFString *v154;
  __CFString *v155;
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[3];
  _QWORD v159[3];
  _QWORD v160[2];
  _QWORD v161[2];
  const __CFString *v162;
  void *v163;
  _QWORD v164[3];
  _QWORD v165[3];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint8_t v170[4];
  void *v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  id v175;
  __int16 v176;
  void *v177;
  _BYTE buf[24];
  __int128 v179;
  id v180;
  uint8_t v181[32];
  __int128 v182;
  __int128 v183;
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v127 = a3;
  v7 = a4;
  v8 = a5;
  v136 = 0;
  v137 = &v136;
  v138 = 0x3032000000;
  v139 = __Block_byref_object_copy_;
  v140 = __Block_byref_object_dispose_;
  v141 = (id)MEMORY[0x1E0C9AA70];
  v126 = v8;
  v9 = objc_msgSend(v8, "length");
  v125 = v7;
  if ((v9 != 0) != objc_msgSend(v7, "isEqualToString:", CFSTR("-1")))
  {
    if (objc_msgSend(v126, "length"))
      v123 = 0;
    else
      v123 = objc_msgSend(v7, "isEqualToString:", CFSTR("-1"));
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v126, "length");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v127;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v179) = v16;
      WORD2(v179) = 1024;
      *(_DWORD *)((char *)&v179 + 6) = v123;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "applyTasking routing %@ id %@ length %d; untasked %d",
        buf,
        0x22u);
    }

    if (objc_msgSend(v127, "isEqualToString:", CFSTR("da3")))
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
      if ((v123 & 1) != 0)
      {
        v18 = 0;
        v19 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v135 = 0;
        selectConfigFromBlob((uint64_t)v126, &v135);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v135;
        v18 = v30;
        if (!v19)
        {
          if (v30)
          {
            v162 = CFSTR("error");
            objc_msgSend(v30, "localizedDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = v60;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = (void *)v137[5];
            v137[5] = v61;

          }
          else
          {
            v18 = (void *)v137[5];
            v137[5] = (uint64_t)&unk_1E4DFEA08;
          }
LABEL_30:

          goto LABEL_120;
        }
      }
      +[OSATasking getDefaultTasking](OSATasking, "getDefaultTasking");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
        v17 = (void *)v31;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        +[OSATasking applyTasking:taskId:fromBlob:].cold.3((uint64_t)v17, v32, v33);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        +[OSATasking applyTasking:taskId:fromBlob:].cold.2((uint64_t)v19, v34, v35);
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v19);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSATasking normalizeInstructions:](OSATasking, "normalizeInstructions:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        +[OSATasking applyTasking:taskId:fromBlob:].cold.1((uint64_t)v37, v38, v39);
      v165[0] = v125;
      v164[0] = CFSTR("TaskingID");
      v164[1] = CFSTR("TaskingOS");
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "buildVersion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v164[2] = CFSTR("TaskingPayload");
      v165[1] = v41;
      v165[2] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v134[0] = MEMORY[0x1E0C809B0];
      v134[1] = 3221225472;
      v134[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke;
      v134[3] = &unk_1E4DEDAE0;
      v43 = v42;
      v134[4] = v43;
      v134[6] = &v136;
      v44 = v125;
      v134[5] = v44;
      __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(v134);

      goto LABEL_30;
    }
    if (objc_msgSend(v127, "isEqualToString:", CFSTR("ca1")))
    {
      *(_QWORD *)&v166 = 0;
      *((_QWORD *)&v166 + 1) = &v166;
      *(_QWORD *)&v167 = 0x2020000000;
      BYTE8(v167) = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&v179 = __Block_byref_object_copy_;
      *((_QWORD *)&v179 + 1) = __Block_byref_object_dispose_;
      v180 = 0;
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pathCATasking");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("taskedConfig.json"));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v181 = 138543362;
        *(_QWORD *)&v181[4] = v22;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "The location of the CA taskedConfig is %{public}@", v181, 0xCu);
      }
      v23 = v125;
      if (v22)
      {
        if (v123)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "fileExistsAtPath:", v22);

          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (id *)(*(_QWORD *)&buf[8] + 40);
            obj = *(id *)(*(_QWORD *)&buf[8] + 40);
            v28 = objc_msgSend(v26, "removeItemAtPath:error:", v22, &obj);
            objc_storeStrong(v27, obj);
            *(_BYTE *)(*((_QWORD *)&v166 + 1) + 24) = v28;

            v29 = v22;
            v22 = CFSTR("untasked");
          }
          else
          {
            v160[0] = CFSTR("action");
            v160[1] = CFSTR("taskId");
            v161[0] = CFSTR("n/a");
            v161[1] = v125;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
            v66 = objc_claimAutoreleasedReturnValue();
            v29 = (__CFString *)v137[5];
            v137[5] = v66;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v181 = 138412290;
            *(_QWORD *)&v181[4] = v22;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "saving ca1 tasking as %@", v181, 0xCu);
          }
          v132[0] = MEMORY[0x1E0C809B0];
          v132[1] = 3221225472;
          v132[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71;
          v132[3] = &unk_1E4DEDB08;
          v132[6] = &v166;
          v29 = (__CFString *)v126;
          v132[4] = v29;
          v22 = v22;
          v132[5] = v22;
          v132[7] = buf;
          __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71(v132);

        }
        v23 = v125;
      }
      if (*(_BYTE *)(*((_QWORD *)&v166 + 1) + 24))
      {
        v158[0] = CFSTR("action");
        v158[1] = CFSTR("taskId");
        v159[0] = CFSTR("saved");
        v159[1] = v23;
        v158[2] = CFSTR("blob");
        v159[2] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 3);
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = (void *)v137[5];
        v137[5] = v67;

        v156[0] = CFSTR("TaskingID");
        v156[1] = CFSTR("savedAs");
        v157[0] = v125;
        v157[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setPrefsKey:value:forDomain:withSync:", CFSTR("CATaskingID"), v69, CFSTR("com.apple.OTACrashCopier"), 1);

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.OSA.Submissions.tasking.ca.changed"), 0, 0, 0);
      }
      else
      {
        if (v137[5])
          goto LABEL_64;
        v154 = CFSTR("error");
        v72 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        if (v72)
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = CFSTR("unknown failure to apply ca1 tasking");
        }
        v155 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
        v95 = objc_claimAutoreleasedReturnValue();
        v96 = (void *)v137[5];
        v137[5] = v95;

        if (!v72)
          goto LABEL_64;
      }

LABEL_64:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v166, 8);
      goto LABEL_120;
    }
    if (!objc_msgSend(v127, "isEqualToString:", CFSTR("awd")))
      __assert_rtn("+[OSATasking applyTasking:taskId:fromBlob:]", "OSATasking.m", 410, "0 && \"Unsupported routing used in tasking\");
    if ((v123 & 1) != 0)
    {
      v112 = 0;
      v113 = 0;
    }
    else
    {
      v131 = 0;
      selectConfigFromBlob((uint64_t)v126, &v131);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v131;
      v112 = (void *)v45;
      if (!v45)
      {
        if (v46)
        {
          v146 = CFSTR("error");
          v114 = v46;
          objc_msgSend(v46, "localizedDescription");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)v137[5];
          v137[5] = v64;

          goto LABEL_120;
        }
        v113 = (void *)v137[5];
        v137[5] = (uint64_t)&unk_1E4DFEA80;
LABEL_119:

        goto LABEL_120;
      }
      v113 = v46;
    }
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pathAWDTasking");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringByAppendingPathComponent:", v127);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringByAppendingPathExtension:", CFSTR("plist"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v118)
      goto LABEL_76;
    v121 = v118;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isConfigValid(v50) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D64EB0], "sharedClient");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = 0u;
      v169 = 0u;
      v166 = 0u;
      v167 = 0u;
      v129 = v50;
      v52 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v167;
        v54 = 1;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v167 != v53)
              objc_enumerationMutation(v129);
            v56 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
            objc_msgSend(v56, "objectForKey:", CFSTR("Key"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKey:", CFSTR("User"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKey:", CFSTR("Domain"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v51, "deletePreference:forUser:inDomain:", v57, v58, v59) & 1) == 0)
            {
              v54 = 0;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v181 = 138412546;
                *(_QWORD *)&v181[4] = v59;
                *(_WORD *)&v181[12] = 2112;
                *(_QWORD *)&v181[14] = v57;
                _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Could not delete preference for domain,key: %@, %@", v181, 0x16u);
                v54 = 0;
              }
            }

          }
          v52 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
        }
        while (v52);

        if ((v54 & 1) == 0)
        {

LABEL_76:
          v76 = v137;
          v77 = (void *)v137[5];
          v78 = &unk_1E4DFEA58;
LABEL_77:
          v76[5] = (uint64_t)v78;
LABEL_118:

          goto LABEL_119;
        }
      }
      else
      {

        v54 = 1;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "fileExistsAtPath:", v121))
      {
        *(_QWORD *)&v142 = 0;
        v74 = objc_msgSend(v73, "removeItemAtPath:error:", v121, &v142);
        v75 = (id)v142;
        if ((v74 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v181 = 138412546;
            *(_QWORD *)&v181[4] = v121;
            *(_WORD *)&v181[12] = 2112;
            *(_QWORD *)&v181[14] = v75;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't delete file for awd task at %@: %@", v181, 0x16u);
          }
          v54 = 0;
        }
      }
      else
      {
        v75 = 0;
      }

      if ((v54 & 1) == 0)
        goto LABEL_76;
    }
    else
    {

    }
    if (v123)
    {
      v152[0] = CFSTR("action");
      v152[1] = CFSTR("taskId");
      v153[0] = CFSTR("n/a");
      v153[1] = v125;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
      v79 = objc_claimAutoreleasedReturnValue();
      v77 = (void *)v137[5];
      v137[5] = v79;
      goto LABEL_118;
    }
    v80 = v112;
    v81 = v121;
    v110 = v81;
    if (!v80)
    {

LABEL_117:
      v150[0] = CFSTR("action");
      v150[1] = CFSTR("taskId");
      v151[0] = CFSTR("installed");
      v151[1] = v125;
      v150[2] = CFSTR("blob");
      v151[2] = v110;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 3);
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = (void *)v137[5];
      v137[5] = v101;

      v148[0] = CFSTR("TaskingID");
      v148[1] = CFSTR("TaskingOS");
      v149[0] = v125;
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "buildVersion");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v149[1] = v104;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setPrefsKey:value:forDomain:withSync:", CFSTR("AWDTaskingID"), v77, CFSTR("com.apple.OTACrashCopier"), 1);

      v106 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v106, CFSTR("logging tasks have changed"), 0, 0, 0);
      goto LABEL_118;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = 0u;
    v183 = 0u;
    memset(v181, 0, sizeof(v181));
    v111 = v80;
    v82 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v181, buf, 16);
    if (v82)
    {
      v115 = v82;
      v116 = **(_QWORD **)&v181[16];
      v84 = 1;
      *(_QWORD *)&v83 = 138413058;
      v109 = v83;
LABEL_83:
      v119 = 0;
      while (1)
      {
        if (**(_QWORD **)&v181[16] != v116)
          objc_enumerationMutation(v111);
        v85 = *(void **)(*(_QWORD *)&v181[8] + 8 * v119);
        objc_msgSend(v85, "objectForKey:", CFSTR("User"), v109);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", CFSTR("Key"));
        v130 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", CFSTR("Domain"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", CFSTR("Value"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v170 = v109;
          v171 = v128;
          v172 = 2112;
          v173 = v124;
          v174 = 2112;
          v175 = v130;
          v176 = 2112;
          v177 = v122;
          _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "writing %@@%@:%@=%@", v170, 0x2Au);
        }
        objc_msgSend(MEMORY[0x1E0D64EB0], "sharedClient");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = objc_msgSend(v86, "setPreference:forUser:inDomain:toValue:", v130, v128, v124, v122);
        if (v120)
        {
          objc_msgSend(v117, "addObject:", v85);
        }
        else
        {
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v87 = v117;
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v142, &v166, 16);
          if (v88)
          {
            v89 = *(_QWORD *)v143;
            do
            {
              for (j = 0; j != v88; ++j)
              {
                if (*(_QWORD *)v143 != v89)
                  objc_enumerationMutation(v87);
                v91 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
                objc_msgSend(v91, "objectForKey:", CFSTR("Key"));
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectForKey:", CFSTR("User"));
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectForKey:", CFSTR("Domain"));
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "deletePreference:forUser:inDomain:", v92, v93, v94);

              }
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v142, &v166, 16);
            }
            while (v88);
          }

          v84 = 0;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v170 = 0;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Applying awd task failed", v170, 2u);
            v84 = 0;
          }
        }

        if (!v120)
          break;
        if (++v119 == v115)
        {
          v115 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v181, buf, 16);
          if (v115)
            goto LABEL_83;
          break;
        }
      }

      if ((v84 & 1) == 0)
      {

        v76 = v137;
        v77 = (void *)v137[5];
        v78 = &unk_1E4DFEA30;
        goto LABEL_77;
      }
    }
    else
    {

    }
    v97 = objc_msgSend(v117, "writeToFile:atomically:", v110, 1);
    v98 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v97)
    {
      if (v98)
      {
        *(_DWORD *)v170 = 138412290;
        v171 = v110;
        v99 = MEMORY[0x1E0C81028];
        v100 = "awd task successfully applied and saved as %@";
LABEL_115:
        _os_log_impl(&dword_1A4D21000, v99, OS_LOG_TYPE_DEFAULT, v100, v170, 0xCu);
      }
    }
    else if (v98)
    {
      *(_DWORD *)v170 = 138412290;
      v171 = v110;
      v99 = MEMORY[0x1E0C81028];
      v100 = "Could not write task blob to file: %@";
      goto LABEL_115;
    }

    goto LABEL_117;
  }
  v10 = (void *)v137[5];
  v137[5] = (uint64_t)&unk_1E4DFEAA8;

  v11 = MEMORY[0x1E0C81028];
  v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v126, "length");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v127;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&v179 = v13;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ taskId %@ with rawblob (%lu bytes) is inconsistent", buf, 0x20u);
  }

LABEL_120:
  v107 = (id)v137[5];
  _Block_object_dispose(&v136, 8);

  return v107;
}

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[8];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "setPrefsKey:value:forDomain:withSync:", CFSTR("ScheduledTasking"), a1[4], CFSTR("com.apple.OTACrashCopier"), 1);

  if (v3)
  {
    v14[0] = CFSTR("action");
    v14[1] = CFSTR("taskId");
    v4 = a1[5];
    v15[0] = CFSTR("scheduled");
    v15[1] = v4;
    v14[2] = CFSTR("blob");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("defaults://%@/%@"), CFSTR("com.apple.OTACrashCopier"), CFSTR("ScheduledTasking"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Saved da3 tasking for deferred installation";
  }
  else
  {
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = &unk_1E4DFE9E0;

    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "deferring da3 task failed";
  }
  _os_log_impl(&dword_1A4D21000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
}

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "writeToFile:options:error:", v3, 1, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

+ (void)checkTaskingRelevance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPrefsKey:forDomain:withOptions:", CFSTR("ScheduledTasking"), CFSTR("com.apple.OTACrashCopier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TaskingOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buildVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "removing outdated da tasking (and restoring hotship) %@ -> %@", (uint8_t *)&v11, 0x16u);

    }
    v10 = +[OSATasking applyTasking:taskId:fromBlob:](OSATasking, "applyTasking:taskId:fromBlob:", CFSTR("da3"), CFSTR("-1"), 0);
  }

}

+ (id)getInstalledTaskIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPrefsKey:forDomain:withOptions:", CFSTR("ScheduledTasking"), CFSTR("com.apple.OTACrashCopier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TaskingID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("da3"));

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("-1"), CFSTR("da3"));
  }
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPrefsKey:forDomain:withOptions:", CFSTR("AWDTaskingID"), CFSTR("com.apple.OTACrashCopier"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TaskingID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("awd"));

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("-1"), CFSTR("awd"));
  }
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getPrefsKey:forDomain:withOptions:", CFSTR("CATaskingID"), CFSTR("com.apple.OTACrashCopier"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TaskingID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("ca1"));

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("-1"), CFSTR("ca1"));
  }

  return v2;
}

+ (id)getAvailableTaskingRoutings
{
  return &unk_1E4DFEE40;
}

+ (BOOL)shouldApplyPreference:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  uLong v10;
  uLong v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Sample"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "count") != 2)
    goto LABEL_6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
    goto LABEL_15;
  if (v7 == 1)
  {
LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  if (v5 >= v7)
  {
LABEL_15:
    v8 = 0;
    goto LABEL_7;
  }
  v10 = crc32(0, 0, 0);
  v11 = crc32(v10, (const Bytef *)samplingKeyCString, 8u);
  v12 = 0xFFFFFFFF / v7 * v5;
  v14 = v11 >= v12;
  v13 = v11 - v12;
  v14 = !v14 || v13 >= 0xFFFFFFFF / v7;
  v8 = !v14;
LABEL_7:

  return v8;
}

+ (id)getDefaultTasking
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "appleInternal") & 1) != 0)
  {
    v3 = CFSTR("/AppleInternal/Library/OSAnalytics/defaultTasking.plist");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("defaultTasking"), CFSTR("plist"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfFile:", v3);

  return v5;
}

+ (id)normalizeInstructions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t i;
  uint64_t v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crashReporterKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)samplingKey;
  samplingKey = v5;

  if (objc_msgSend((id)samplingKey, "hasPrefix:", CFSTR("baadbaadbaaadbaaaadbaadbaadbaaadbaaaad")))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[OSATasking normalizeInstructions:].cold.3();
    +[OSATasking setCRKeyToRandomValue](OSATasking, "setCRKeyToRandomValue");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "samplingKey is good", buf, 2u);
    }
    samplingKeyCString = objc_msgSend((id)samplingKey, "UTF8String");
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v3;
  objc_msgSend(v3, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (+[OSATasking shouldApplyPreference:](OSATasking, "shouldApplyPreference:", v14))
        {
          if (+[OSATasking preference:alreadySetInInstructions:](OSATasking, "preference:alreadySetInInstructions:", v14, v7))
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              +[OSATasking normalizeInstructions:].cold.1(buf, v14, &v24);
          }
          else
          {
            objc_msgSend(v7, "insertObject:atIndex:", v14, 0);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          +[OSATasking normalizeInstructions:].cold.2(v21, v14, &v22);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)preference:(id)a3 alreadySetInInstructions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v23 = *(_QWORD *)v25;
    v20 = v6;
    v21 = v5;
    do
    {
      v10 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("User"), v20, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("User"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v13))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Domain"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Domain"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v15))
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Key"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Key"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToString:", v17);

            v6 = v20;
            v5 = v21;
          }
          else
          {
            v18 = 0;
          }

          v8 = v22;
        }
        else
        {
          v18 = 0;
        }

        v9 |= v18;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

+ (id)selectConfigFromBlob:(id)a3 withError:(id *)a4
{
  return selectConfigFromBlob((uint64_t)a3, a4);
}

+ (void)setCRKeyToRandomValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 md[8];
  uint64_t v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)md = 0;
  v11 = 0;
  v12 = 0;
  v7 = objc_retainAutorelease(v6);
  CC_SHA1((const void *)objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v11, BYTE1(v11), BYTE2(v11), BYTE3(v11), BYTE4(v11), BYTE5(v11), BYTE6(v11), HIBYTE(v11),
    v12,
    BYTE1(v12),
    BYTE2(v12),
    HIBYTE(v12));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)samplingKey;
  samplingKey = v8;

  samplingKeyCString = objc_msgSend((id)samplingKey, "UTF8String");
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "After normalization, combinedConfig is %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "task_config is %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "defaultConfig is %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)normalizeInstructions:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1A4D21000, MEMORY[0x1E0C81028], (uint64_t)a3, "Not applying %@ as it has already been set", a1);
}

+ (void)normalizeInstructions:(_QWORD *)a3 .cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1A4D21000, MEMORY[0x1E0C81028], (uint64_t)a3, "Not applying %@ as it is sampled and this device isn't IN", a1);
}

+ (void)normalizeInstructions:.cold.3()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 138543362;
  v1 = samplingKey;
  _os_log_fault_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "samplingKey [randomizing due to failure] was %{public}@", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
