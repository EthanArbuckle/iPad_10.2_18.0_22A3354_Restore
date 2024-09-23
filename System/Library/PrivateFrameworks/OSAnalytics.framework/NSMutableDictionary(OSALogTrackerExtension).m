@implementation NSMutableDictionary(OSALogTrackerExtension)

- (uint64_t)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t *v24;
  id v25;
  unint64_t *v26;
  void *v27;
  void *v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v34;
  dispatch_time_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  const std::__fs::filesystem::path *v63;
  std::error_code *v64;
  unint64_t *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  id v74;
  unint64_t *v75;
  id v76;
  unint64_t *v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v82;
  void *v83;
  void *v84;
  unint64_t v85;
  unint64_t v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("file-owner"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = a1;
  v85 = objc_msgSend(a1, "osa_logTracker_getForSubtype:forOwner:", v14, v16);
  v17 = v13;
  v18 = v15;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("set-log-limit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.osanalytics"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CountLimit"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v18;
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("210")) & 1) == 0)
  {
    v79 = v16;
    v24 = a5;
    v25 = v14;
    v26 = a6;
    v27 = v17;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("override-limit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    if ((v29 & 1) != 0)
    {
      v23 = -1;
    }
    else
    {
      if (!v22)
      {
        v17 = v27;
        if (!v19)
        {
          v42 = objc_msgSend(v27, "isEqualToString:", CFSTR("288"));
          a6 = v26;
          if ((v42 & 1) == 0)
          {
            v14 = v25;
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("187")) & 1) == 0)
            {
              a5 = v24;
              if ((objc_msgSend(v17, "hasPrefix:", CFSTR("211")) & 1) != 0)
              {
                v23 = 30;
              }
              else if (objc_msgSend(v17, "hasPrefix:", CFSTR("328")))
              {
                v23 = 250;
              }
              else
              {
                v23 = 25;
              }
              goto LABEL_11;
            }
            v23 = 100;
LABEL_10:
            a5 = v24;
LABEL_11:
            v16 = v79;
            goto LABEL_12;
          }
          v23 = 100;
LABEL_9:
          v14 = v25;
          goto LABEL_10;
        }
        v23 = objc_msgSend(v19, "unsignedIntegerValue");
LABEL_8:
        a6 = v26;
        goto LABEL_9;
      }
      v23 = objc_msgSend(v22, "integerValue");
    }
    v17 = v27;
    goto LABEL_8;
  }
  v23 = -1;
LABEL_12:

  v30 = v85;
  v31 = v23;
  if (v85 < v23
    || (v82 = v23,
        objc_msgSend(v83, "osa_logTracker_trackLogTypes_internal:forOwner:rescan:", v14, v16, osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles), v30 = objc_msgSend(v83, "osa_logTracker_getForSubtype:forOwner:", v14, v16), v31 = v23, v30 < v23))
  {
    v32 = 1;
    if (!a5)
      goto LABEL_16;
    goto LABEL_15;
  }
  v86 = v30;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Signature"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v34 = sAccountingSemaphore;
    v35 = dispatch_time(0, 1000000000);
    if (!dispatch_semaphore_wait(v34, v35))
    {
      objc_msgSend(v83, "objectForKey:", v14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:].cold.1();
      v37 = v36;
      objc_msgSend(v36, "signatures");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v78);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v39;
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "known duplicate signature", buf, 2u);
        }
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("original"));
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v83, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v41, "fileSystemRepresentation"));

        v40 = v39;
        goto LABEL_55;
      }
      v74 = v17;
      v75 = a5;
      v80 = v16;
      v76 = v14;
      v77 = a6;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      objc_msgSend(v37, "signatures");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      if (v89)
      {
        v44 = 0;
        obj = v43;
        v88 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v89; ++i)
          {
            if (*(_QWORD *)v91 != v88)
              objc_enumerationMutation(obj);
            v46 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
            objc_msgSend(v37, "signatures");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("dupes"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v37;
            v51 = objc_msgSend(v49, "count");
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("dupes"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v44;
            v54 = objc_msgSend(v52, "count");

            if (v51 <= v54)
            {
              v37 = v50;
              v44 = v53;
            }
            else
            {
              objc_msgSend(v50, "signatures");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKeyedSubscript:", v46);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = v50;
            }
          }
          v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
        }
        while (v89);

        v40 = 0;
        if (v44)
        {
          v14 = v76;
          a6 = v77;
          a5 = v75;
          v16 = v80;
          do
          {
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("dupes"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "count");

            if (v57 < 2)
              break;
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("dupes"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectAtIndex:", 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v95 = v59;
              _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "new signature found -- prioritizing over duplicate (removing %@)", buf, 0xCu);
            }
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("dupes"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "removeObjectAtIndex:", 0);

            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("original"));
            v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v83, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v61, "fileSystemRepresentation"));

            v62 = objc_retainAutorelease(v59);
            v63 = (const std::__fs::filesystem::path *)objc_msgSend(v62, "fileSystemRepresentation");
            remove(v63, v64);
            objc_msgSend(v37, "setCount:", objc_msgSend(v37, "count") - 1);

            --v86;
            v40 = 0;
          }
          while (v86 >= v82);

LABEL_54:
          v17 = v74;
LABEL_55:
          dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);

          goto LABEL_56;
        }
      }
      else
      {

      }
      v14 = v76;
      a6 = v77;
      a5 = v75;
      v16 = v80;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "new signature found -- but no room available", buf, 2u);
      }
      goto LABEL_54;
    }
  }
LABEL_56:
  if (osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles == 1)
    osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 0;
  if (v86 >= v82)
  {
    if (objc_msgSend(v83, "osa_logTracker_shouldRotateLog:", v17))
    {
      v65 = a6;
      v66 = v17;
      +[OSALogTrackerObject sharedTrackers](OSALogTrackerObject, "sharedTrackers");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKey:", v14);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v68, "oldestLogPath");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      if (v69
        && objc_msgSend(v70, "fileExistsAtPath:", v69)
        && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v72 = (void *)objc_claimAutoreleasedReturnValue(),
            v73 = objc_msgSend(v72, "removeItemAtPath:error:", v69, 0),
            v72,
            !v73))
      {
        v32 = 0;
        if (a8)
          *a8 = CFSTR("Delete oldest file failed");
      }
      else
      {
        v32 = 1;
        osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 1;
      }

      v17 = v66;
      a6 = v65;
    }
    else
    {
      v32 = 0;
      if (a8)
        *a8 = CFSTR("Log limit exceeded");
    }
  }
  else
  {
    v32 = 1;
  }

  v30 = v86;
  v31 = v82;
  if (a5)
LABEL_15:
    *a5 = v30;
LABEL_16:
  if (a6)
    *a6 = v31;

  return v32;
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setCount:", objc_msgSend(v12, "count") + 1);
  }
  else
  {
    +[OSALogTrackerObject tracker](OSALogTrackerObject, "tracker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v13, v10);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v16, "attributesOfItemAtPath:error:", v14, &v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v36;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.4((uint64_t)v14);
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2A38]);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  if (v13)
  {
    objc_msgSend(v13, "oldestDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_12;
    v21 = v20;
    if (!v15)
    {

      goto LABEL_14;
    }
    objc_msgSend(v13, "oldestDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "compare:", v15);

    if (v23 == 1)
    {
LABEL_12:
      objc_msgSend(v13, "setOldestDate:", v15);
      objc_msgSend(v13, "setOldestLogPath:", v14);
    }
  }
LABEL_14:
  v24 = objc_msgSend(v11, "length");
  if (a5 && v24)
  {
    if (!v13)
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.1();
    objc_msgSend(v13, "signatures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("dupes"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");
      objc_msgSend(v27, "addObject:", v29);

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.3();
    }
    else
    {
      v37[0] = CFSTR("original");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v35, "copy");
      v37[1] = CFSTR("dupes");
      v38[0] = v34;
      v33 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v38[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");
      objc_msgSend(v13, "signatures");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v11);

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.2();
    }

  }
}

- (void)osa_logTracker_incrementForSubtype:()OSALogTrackerExtension signature:filepath:
{
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = sAccountingSemaphore;
  v10 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    objc_msgSend(a1, "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v11, v8, a5, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
  }

}

- (uint64_t)osa_logTracker_getForSubtype:()OSALogTrackerExtension forOwner:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_getForSubtype_forOwner___block_invoke;
  block[3] = &unk_1E4DEE900;
  block[4] = a1;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  if (osa_logTracker_getForSubtype_forOwner__onceToken != -1)
    dispatch_once(&osa_logTracker_getForSubtype_forOwner__onceToken, block);
  objc_msgSend(a1, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "count");
  else
    v12 = 0;

  return v12;
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:
{
  id v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  stat v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = sAccountingSemaphore;
  v11 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v10, v11))
  {
    memset(&v34, 0, sizeof(v34));
    if (osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel)
    {
      if (stat((const char *)objc_msgSend((id)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel, "UTF8String"), &v34) == -1)
      {
        if (*__error() != 2 && (a5 & 1) == 0)
          goto LABEL_15;
      }
      else if (!a5)
      {
LABEL_15:
        dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
        goto LABEL_16;
      }
    }
    v12 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
    osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = 0;

    v13 = (void *)MEMORY[0x1A85A7FC8](objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_47));
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_trackLogTypes_internal:forOwner:rescan:].cold.1();
    v43 = CFSTR("exclude-retired");
    v44 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v9)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("file-owner"));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke_49;
    v21[3] = &unk_1E4DEE8D8;
    v25 = &v45;
    v23 = &v30;
    v21[4] = a1;
    v22 = v8;
    v24 = &v26;
    +[OSALog iterateLogsWithOptions:usingBlock:](OSALog, "iterateLogsWithOptions:usingBlock:", v15, v21);
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = v31[3];
      v19 = objc_msgSend(a1, "count");
      v20 = v27[3];
      *(_DWORD *)buf = 134218754;
      v36 = v18;
      v37 = 2048;
      v38 = v19;
      v39 = 2048;
      v40 = v20;
      v41 = 2112;
      v42 = osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "scanned %zu logs with %lu types and %zu unknowns (sentinel is %@)", buf, 0x2Au);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    objc_autoreleasePoolPop(v13);
    goto LABEL_15;
  }
LABEL_16:

}

- (uint64_t)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension
{
  __int16 value;

  value = 0;
  getxattr(path, "Multiple", &value, 2uLL, 0, 0);
  ++value;
  setxattr(path, "Multiple", &value, 2uLL, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_recordNixedDuplicate:].cold.1();
  return utimes(path, 0);
}

- (uint64_t)osa_logTracker_shouldRotateLog:()OSALogTrackerExtension
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("211"));
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.1()
{
  __assert_rtn("-[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:]", "OSALogTracking.m", 138, "obj");
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.4(uint64_t a1)
{
  int v2;
  int *v3;
  char *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5 = 138412802;
  v6 = a1;
  v7 = 1024;
  v8 = v2;
  v9 = 2080;
  v10 = v4;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to retrieve file attributes at path %@. Error: %d %s", (uint8_t *)&v5, 0x1Cu);
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

- (void)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension .cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:.cold.1()
{
  __assert_rtn("-[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:]", "OSALogTracking.m", 290, "obj");
}

@end
