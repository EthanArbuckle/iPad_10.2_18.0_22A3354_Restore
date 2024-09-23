id SPFastHiddenAppsGetNoBuild()
{
  id v0;
  uint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (runningInSpotlightUI_onceToken != -1)
    dispatch_once(&runningInSpotlightUI_onceToken, &__block_literal_global_177);
  if (runningInSpotlightUI_sInSpotlight == 1)
  {
    pthread_mutex_lock(&appsLock);
    if (!__fastApplicationNames || !objc_msgSend((id)__fastApplicationNames, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v3) = 0;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Building apps because cache is empty", (uint8_t *)&v3, 2u);
      }
      SPBuildApplicationNamesLocked();
    }
    v0 = (id)__hiddenApps;
    pthread_mutex_unlock(&appsLock);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v1 = objc_msgSend(v0, "count");
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Got %ld restricted apps", (uint8_t *)&v3, 0xCu);
    }
  }
  else if (sAppsProcessingQueue)
  {
    pthread_mutex_lock(&appsLock);
    v0 = (id)__hiddenApps;
    pthread_mutex_unlock(&appsLock);
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

id SPLogForSPLogCategoryTelemetry()
{
  if (SPLogForSPLogCategoryTelemetry_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryTelemetry_onceToken, &__block_literal_global_30);
  return (id)SPLogForSPLogCategoryTelemetry_sQueryLog;
}

uint64_t SPSuggestionDetailTextBehavior()
{
  void *v0;
  unint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("SuggestionDetailTextBehaviorType"));

  if (v1 >= 3)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213202000, v2, OS_LOG_TYPE_DEFAULT, "SuggestionDetailTextBehavior out of range", v4, 2u);
    }

    return 1;
  }
  return v1;
}

unint64_t SPBlueButtonBehavior()
{
  void *v0;
  unint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("BlueButton"));

  if (v1 >= 3)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213202000, v2, OS_LOG_TYPE_DEFAULT, "BlueButtonBehavior out of range", v4, 2u);
    }

    return 0;
  }
  return v1;
}

id SPLogForSPLogCategoryQuery()
{
  if (SPLogForSPLogCategoryQuery_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryQuery_onceToken, &__block_literal_global_24);
  return (id)SPLogForSPLogCategoryQuery_sQueryLog;
}

id SPGetDisabledDomains(int a1)
{
  void *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  void *ValueAtIndex;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  char v13;
  _DWORD v15[2];
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFArray *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledDomains"), SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v3)
  {
    v4 = v3;
    Count = CFArrayGetCount(v3);
    if (Count)
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", SPSearchDomainForKey(ValueAtIndex));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
    }
    CFRelease(v4);
  }
  SPLogForSPLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v10, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    v15[0] = 67109632;
    v15[1] = a1;
    v16 = 1024;
    v17 = SPGetInternetDomainsAvailable();
    v18 = 1024;
    v19 = _internetDomainsEnabled;
    _os_log_impl(&dword_213202000, v10, v11, "for prefs: %d, internet domains available: %d, internet domains enabled: %d", (uint8_t *)v15, 0x14u);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  v13 = objc_msgSend(v12, "BOOLForKey:", DisableParsec);

  if ((v13 & 1) != 0 || (a1 & 1) == 0 && !_internetDomainsEnabled)
    objc_msgSend(v2, "addObjectsFromArray:", &unk_24CF6FE00);
  return v2;
}

void SPSetInternetDomainsAvailable(int a1)
{
  const void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (SPGetInternetDomainsAvailable() != a1)
  {
    if (a1)
      v2 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    else
      v2 = 0;
    CFPreferencesSetAppValue(CFSTR("SBSearchInternetDomainsAvailable"), v2, SpotlightUIPrefsDomain);
    CFPreferencesSynchronize(SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kSPSearchInternetDomainsChangedNotification, 0, 0, 1u);
  }
}

BOOL SPGetInternetDomainsAvailable()
{
  int AppBooleanValue;
  int v1;
  BOOL v2;
  _QWORD block[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBSearchInternetDomainsAvailable"), SpotlightUIPrefsDomain, &keyExistsAndHasValidFormat);
  v1 = keyExistsAndHasValidFormat;
  if (!keyExistsAndHasValidFormat)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __SPGetInternetDomainsAvailable_block_invoke;
    block[3] = &unk_24CF64330;
    block[4] = &v5;
    block[5] = &v9;
    if (SPGetInternetDomainsAvailable_once != -1)
      dispatch_once(&SPGetInternetDomainsAvailable_once, block);
    if (*((_BYTE *)v10 + 24))
    {
      keyExistsAndHasValidFormat = *((_BYTE *)v10 + 24);
      AppBooleanValue = *((unsigned __int8 *)v6 + 24);
    }
    _Block_object_dispose(&v5, 8);
    _Block_object_dispose(&v9, 8);
    v1 = keyExistsAndHasValidFormat;
  }
  if (AppBooleanValue)
    v2 = v1 == 0;
  else
    v2 = 1;
  return !v2;
}

void sub_213205DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 72));
  _Unwind_Resume(a1);
}

id SPLogForSPLogCategoryDefault()
{
  if (SPLogForSPLogCategoryDefault_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryDefault_onceToken, &__block_literal_global_19);
  return (id)SPLogForSPLogCategoryDefault_sDefaultLog;
}

void sub_2132066B0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id SPGetDisabledDomainSet()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledDomains"), SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_213207A64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id SPTransactionCreate(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  os_log_type_t v6;
  __CFString *v7;
  void *v8;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count")
    && (objc_msgSend(v1, "componentsJoinedByString:", CFSTR(".")), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.spotlight.%@"), v2);

  }
  else
  {
    v4 = CFSTR("com.apple.spotlight");
  }
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_213202000, v5, v6, "SPTransactionCreate, %@", buf, 0xCu);
  }

  v7 = objc_retainAutorelease(v4);
  -[__CFString UTF8String](v7, "UTF8String");
  v8 = (void *)os_transaction_create();

  return v8;
}

id SPCopyVisibleApps()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)SBSCopyDisplayIdentifiers();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v0, "count") + 2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.downloadingicon-"), (_QWORD)v10))
        {
          objc_msgSend(v7, "substringFromIndex:", 26);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "addObject:", v8);

        }
        else
        {
          objc_msgSend(v1, "addObject:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "addObject:", CFSTR("com.apple.BarcodeScanner"));
    if ((MGGetBoolAnswer() & 1) == 0)
      objc_msgSend(v1, "addObject:", CFSTR("com.apple.TVRemoteUIService"));
  }

  return v1;
}

id SPLogForSPLogCategoryFeedback()
{
  if (SPLogForSPLogCategoryFeedback_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryFeedback_onceToken, &__block_literal_global_28);
  return (id)SPLogForSPLogCategoryFeedback_sQueryLog;
}

void SPSetAppUpdateBlock(int a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  dispatch_once_t *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a1)
  {
    if (SPApplicationsBasicInit_onceToken == -1)
      goto LABEL_7;
    v11 = &SPApplicationsBasicInit_onceToken;
    v12 = &__block_literal_global_147;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SPApplicationsInit", (uint8_t *)&v13, 2u);
  }
  if (SPApplicationsInit_onceToken != -1)
  {
    v11 = &SPApplicationsInit_onceToken;
    v12 = &__block_literal_global_175;
LABEL_14:
    dispatch_once(v11, v12);
  }
LABEL_7:
  sCoalesceUpdates = a2;
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)sAppUpdateBlock;
  sAppUpdateBlock = v6;

  pthread_mutex_lock(&appsLock);
  v8 = (id)__fastApplications;
  v9 = (id)__hiddenApps;
  pthread_mutex_unlock(&appsLock);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "count");
    v13 = 134217984;
    v14 = v10;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "set appUpdateBlock with %lu __fastApplications", (uint8_t *)&v13, 0xCu);
  }
  if (v8)
    (*(void (**)(uint64_t, id, id))(sAppUpdateBlock + 16))(sAppUpdateBlock, v8, v9);

}

void SPSetAppsChangedBlockClient(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint8_t v4[16];

  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SPSetAppsChangedBlockNoBuild", v4, 2u);
  }
  if (SPApplicationsInitClient_onceToken != -1)
    dispatch_once(&SPApplicationsInitClient_onceToken, &__block_literal_global_138);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)sAppsChangedBlock;
  sAppsChangedBlock = v2;

}

void SPBuildApplications(int a1)
{
  const char *v2;
  NSObject *v3;
  dispatch_block_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  qos_class_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (SPApplicationsBasicInit_onceToken != -1)
    dispatch_once(&SPApplicationsBasicInit_onceToken, &__block_literal_global_147);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v2 = "forced";
    else
      v2 = "uninitialized";
    v5 = 136315394;
    v6 = v2;
    v7 = 1024;
    v8 = qos_class_self();
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Build apps: %s, QoS 0x%x", (uint8_t *)&v5, 0x12u);
  }
  dispatch_source_merge_data((dispatch_source_t)sSource, 1uLL);
  v3 = sAppsProcessingQueue;
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, &__block_literal_global_137);
  dispatch_async(v3, v4);

}

void SPBuildApplicationsCancel()
{
  uint8_t v1[16];

  if (!atomic_load((unsigned int *)&fastAppsArrived))
  {
    atomic_store(1u, (unsigned int *)&fastAppsArrived);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "fastapps app update andoned", v1, 2u);
    }
  }
}

id SPFastApplicationsGetNoBuild()
{
  id v0;

  if (sAppsProcessingQueue)
  {
    pthread_mutex_lock(&appsLock);
    v0 = (id)__fastApplications;
    pthread_mutex_unlock(&appsLock);
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

uint64_t SPBuildApplicationNames()
{
  pthread_mutex_lock(&appsLock);
  SPBuildApplicationNamesLocked();
  return pthread_mutex_unlock(&appsLock);
}

void SPBuildApplicationNamesLocked()
{
  unint64_t v0;
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  __objc2_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  const char *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  __objc2_class_ro *v72;
  __objc2_class_ro *info;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  __objc2_class_ro *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  uint64_t v88;
  void *v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  id v101;
  __int128 v102;
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
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t v125[4];
  void *v126;
  __int16 v127;
  void *v128;
  float v129;
  uint64_t v130;
  uint8_t v131[4];
  void *v132;
  float v133;
  uint64_t v134;
  float v135;
  uint64_t v136;
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  void *v140;
  float v141;
  uint64_t v142;
  __int128 v143;
  void (*v144)(uint64_t, void *);
  void *v145;
  id v146;
  NSObject *v147;
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v0 = 0x24BDBC000uLL;
  v1 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(MEMORY[0x24BE16EA0], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v143 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v143 + 1) = 3221225472;
  v144 = __SPBuildClipNames_block_invoke;
  v145 = &unk_24CF63A28;
  v4 = v1;
  v146 = v4;
  v147 = v2;
  v5 = v2;
  objc_msgSend(v3, "fetchBookmarkWebClipsWithCompletionHandler:", &v143);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = SFSearchResult_Compatibility;
  v7 = (void *)__fastClipNames;
  __fastClipNames = (uint64_t)v4;
  v8 = v4;

  SPCopyVisibleApps();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "restrictedAppBundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    SPBuildApplicationNamesLocked_cold_5(v99, v10);
  objc_msgSend(MEMORY[0x24BDC1568], "sharedDatabaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0;
  v12 = objc_msgSend(v11, "startAccessingWithOptions:error:", 1, &v122);
  v13 = v122;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v143) = 138412290;
      *(_QWORD *)((char *)&v143 + 4) = v14;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "LS not availble for building application names: %@", (uint8_t *)&v143, 0xCu);
    }
    goto LABEL_106;
  }
  v93 = v13;
  v94 = v11;
  v100 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v101 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 64);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, &v143, 16);
  if (!v16)
    goto LABEL_45;
  v18 = v16;
  v19 = *(_QWORD *)v119;
  v97 = *MEMORY[0x24BDC14E8];
  v95 = *MEMORY[0x24BDC1508];
  v91 = *MEMORY[0x24BDC1518];
  v20 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v17 = 138412546;
  v90 = v17;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v119 != v19)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v21);
      objc_msgSend(v22, "bundleIdentifier", v90);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 138412290;
        v138 = v22;
        v24 = v20;
        v25 = "No app identifier for app:%@ - skipping";
        goto LABEL_22;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        SPBuildApplicationNamesLocked_cold_1(&v141, (uint64_t)v23, &v142);
      if (objc_msgSend(v10, "containsObject:", v23))
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v138 = v23;
          _os_log_impl(&dword_213202000, v20, OS_LOG_TYPE_DEFAULT, "Restricted app: %@", buf, 0xCu);
        }
        objc_msgSend(v101, "addObject:", v23);
        goto LABEL_23;
      }
      if ((objc_msgSend(v22, "isLaunchProhibited") & 1) != 0
        || (objc_msgSend(v22, "applicationState"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "isRestricted"),
            v26,
            v27))
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 138412290;
        v138 = v23;
        v24 = v20;
        v25 = "Skip restricted app %@";
        goto LABEL_22;
      }
      objc_msgSend(v22, "appClipMetadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v138 = v23;
          v24 = v20;
          v25 = "Skip app clip backing clip %@";
LABEL_22:
          _os_log_impl(&dword_213202000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        }
      }
      else
      {
        if (!v99 || (objc_msgSend(v99, "containsObject:", v23) & 1) != 0)
          goto LABEL_37;
        objc_msgSend(v22, "applicationState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isPlaceholder");

        if ((v30 & 1) != 0)
        {
          objc_msgSend(v22, "compatibilityObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "bundleType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v32, "isEqualToString:", v97) & 1) != 0
            || (objc_msgSend(v32, "isEqualToString:", v95) & 1) != 0
            || (objc_msgSend(v32, "isEqualToString:", v91) & 1) != 0)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v138 = v22;
              _os_log_impl(&dword_213202000, v20, OS_LOG_TYPE_DEFAULT, "Retaining invisible app:%@", buf, 0xCu);
            }

LABEL_37:
            objc_msgSend(v22, "localizedName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v22, "localizedName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObject:", v34);

            }
            goto LABEL_23;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v90;
            v138 = v31;
            v139 = 2112;
            v140 = v32;
            _os_log_impl(&dword_213202000, v20, OS_LOG_TYPE_DEFAULT, "Unknown bundle type for app:%@, bundleType:%@ - skipping", buf, 0x16u);
          }

        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v138 = v22;
          v24 = v20;
          v25 = "Skipping invisible app:%@";
          goto LABEL_22;
        }
      }
LABEL_23:

      ++v21;
    }
    while (v18 != v21);
    v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, &v143, 16);
    v18 = v35;
  }
  while (v35);
LABEL_45:

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend(MEMORY[0x24BDC1540], "systemPlaceholderEnumerator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v114, buf, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v115;
    v40 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v115 != v39)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_msgSend(v42, "bundleIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            SPBuildApplicationNamesLocked_cold_3(&v135, (uint64_t)v43, &v136);
          if (objc_msgSend(v10, "containsObject:", v43))
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              SPBuildApplicationNamesLocked_cold_2(&v133, (uint64_t)v43, &v134);
            objc_msgSend(v101, "addObject:", v43);
          }
          else
          {
            objc_msgSend(v42, "localizedName");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v42, "localizedName");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObject:", v45);

            }
          }
        }
        else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v131 = 138412290;
          v132 = v42;
          _os_log_impl(&dword_213202000, v40, OS_LOG_TYPE_DEFAULT, "No app identifier for %@", v131, 0xCu);
        }

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v114, buf, 16);
    }
    while (v38);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v46 = v99;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
  if (v47)
  {
    v49 = v47;
    v50 = *(_QWORD *)v111;
    v98 = *MEMORY[0x24BDC14E8];
    v96 = *MEMORY[0x24BDC1508];
    v92 = *MEMORY[0x24BDC1518];
    v51 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v48 = 138412546;
    v90 = v48;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v111 != v50)
          objc_enumerationMutation(v46);
        v53 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v52);
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v53, 1, 0);
        objc_msgSend(v54, "bundleIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v54, "bundleIdentifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            SPBuildApplicationNamesLocked_cold_1(&v129, (uint64_t)v56, &v130);
          if (objc_msgSend(v10, "containsObject:", v56, v90))
          {
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v125 = 138412290;
              v126 = v56;
              _os_log_impl(&dword_213202000, v51, OS_LOG_TYPE_DEFAULT, "Restricted app: %@", v125, 0xCu);
            }
            objc_msgSend(v101, "addObject:", v53);
            goto LABEL_80;
          }
          if ((objc_msgSend(v54, "isLaunchProhibited") & 1) != 0
            || (objc_msgSend(v54, "applicationState"),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                v58 = objc_msgSend(v57, "isRestricted"),
                v57,
                v58))
          {
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v125 = 138412290;
              v126 = v56;
              v59 = v51;
              v60 = "Skip restricted app %@";
              goto LABEL_79;
            }
LABEL_80:

            goto LABEL_81;
          }
          objc_msgSend(v54, "appClipMetadata");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              goto LABEL_80;
            *(_DWORD *)v125 = 138412290;
            v126 = v56;
            v59 = v51;
            v60 = "Skip app clip backing clip %@";
            goto LABEL_79;
          }
          if ((objc_msgSend(v46, "containsObject:", v56) & 1) != 0)
          {
LABEL_94:
            objc_msgSend(v54, "localizedName");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v66)
              goto LABEL_80;
            objc_msgSend(v54, "localizedName");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "addObject:", v64);
          }
          else
          {
            objc_msgSend(v54, "applicationState");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isPlaceholder");

            if ((v63 & 1) == 0)
            {
              if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                goto LABEL_80;
              *(_DWORD *)v125 = 138412290;
              v126 = v56;
              v59 = v51;
              v60 = "Skipping invisible app:%@";
LABEL_79:
              _os_log_impl(&dword_213202000, v59, OS_LOG_TYPE_DEFAULT, v60, v125, 0xCu);
              goto LABEL_80;
            }
            objc_msgSend(v54, "compatibilityObject");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "bundleType");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v65, "isEqualToString:", v98) & 1) != 0
              || (objc_msgSend(v65, "isEqualToString:", v96) & 1) != 0
              || (objc_msgSend(v65, "isEqualToString:", v92) & 1) != 0)
            {
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v125 = 138412290;
                v126 = v56;
                _os_log_impl(&dword_213202000, v51, OS_LOG_TYPE_DEFAULT, "Retaining invisible app:%@", v125, 0xCu);
              }

              goto LABEL_94;
            }
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v125 = v90;
              v126 = v64;
              v127 = 2112;
              v128 = v65;
              _os_log_impl(&dword_213202000, v51, OS_LOG_TYPE_DEFAULT, "Unknown bundle type for app:%@, bundleType:%@ - skipping", v125, 0x16u);
            }

          }
          goto LABEL_80;
        }
LABEL_81:

        ++v52;
      }
      while (v49 != v52);
      v67 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
      v49 = v67;
    }
    while (v67);
  }

  v11 = v94;
  objc_msgSend(v94, "stopAccessing");
  v68 = (void *)__hiddenApps;
  __hiddenApps = (uint64_t)v101;
  v69 = v101;

  v70 = (void *)__fastAppNames;
  __fastAppNames = (uint64_t)v100;

  v6 = SFSearchResult_Compatibility;
  v0 = 0x24BDBC000;
  v14 = v93;
LABEL_106:

  v71 = objc_alloc_init(*(Class *)(v0 + 3824));
  if (!v6[60].info)
  {
    v72 = (__objc2_class_ro *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    info = v6[60].info;
    v6[60].info = v72;

  }
  if (!__fastAppNames)
  {
    v74 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    v75 = (void *)__fastAppNames;
    __fastAppNames = (uint64_t)v74;

  }
  if (!__hiddenApps)
  {
    v76 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    v77 = (void *)__hiddenApps;
    __hiddenApps = (uint64_t)v76;

  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v78 = (id)__fastAppNames;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v80; ++j)
      {
        if (*(_QWORD *)v107 != v81)
          objc_enumerationMutation(v78);
        objc_msgSend(v71, "addObject:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j), v90);
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
    }
    while (v80);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v83 = v6[60].info;
  v84 = -[__objc2_class_ro countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v103;
    do
    {
      for (k = 0; k != v85; ++k)
      {
        if (*(_QWORD *)v103 != v86)
          objc_enumerationMutation(v83);
        objc_msgSend(v71, "addObject:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * k), v90);
      }
      v85 = -[__objc2_class_ro countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
    }
    while (v85);
  }

  objc_msgSend(v71, "allObjects");
  v88 = objc_claimAutoreleasedReturnValue();
  v89 = (void *)__fastApplicationNames;
  __fastApplicationNames = v88;

}

id SPFastApplicationsNamesGetNoBuild()
{
  id v0;
  uint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (runningInSpotlightUI_onceToken != -1)
    dispatch_once(&runningInSpotlightUI_onceToken, &__block_literal_global_177);
  if (runningInSpotlightUI_sInSpotlight == 1)
  {
    pthread_mutex_lock(&appsLock);
    if (!__fastApplicationNames || !objc_msgSend((id)__fastApplicationNames, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v3) = 0;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Building app names because cache is empty", (uint8_t *)&v3, 2u);
      }
      SPBuildApplicationNamesLocked();
    }
    v0 = (id)__fastApplicationNames;
    pthread_mutex_unlock(&appsLock);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v1 = objc_msgSend(v0, "count");
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Got %ld apps", (uint8_t *)&v3, 0xCu);
    }
  }
  else if (sAppsProcessingQueue)
  {
    pthread_mutex_lock(&appsLock);
    v0 = (id)__fastApplicationNames;
    pthread_mutex_unlock(&appsLock);
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

id SPFastApplicationsGetWithWait()
{
  double Current;
  void *i;
  id v2;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (sAppsProcessingQueue)
  {
    Current = CFAbsoluteTimeGetCurrent();
    pthread_mutex_lock(&appsLock);
    for (i = (void *)__fastApplications; !__fastApplications; i = (void *)__fastApplications)
      pthread_cond_wait(&appsCond, &appsLock);
    v2 = i;
    pthread_mutex_unlock(&appsLock);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = CFAbsoluteTimeGetCurrent() - Current;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "### fast apps waited %f", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id SPFastApplicationsGet()
{
  if (SPApplicationsBasicInit_onceToken != -1)
    dispatch_once(&SPApplicationsBasicInit_onceToken, &__block_literal_global_147);
  if (!__fastApplications)
    SPBuildApplications(0);
  return SPFastApplicationsGetWithWait();
}

void SPFastApplicationsSet(void *a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = a2;
  v6 = objc_msgSend(v4, "count");
  if (v6)
    atomic_store(1u, (unsigned int *)&fastAppsArrived);
  if (SPApplicationsBasicInit_onceToken != -1)
    dispatch_once(&SPApplicationsBasicInit_onceToken, &__block_literal_global_147);
  pthread_mutex_lock(&appsLock);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v22 = objc_msgSend(v4, "count");
    v23 = 2048;
    v24 = objc_msgSend((id)__fastApplications, "count");
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting apps %ld existing __fastApps %ld", buf, 0x16u);
  }
  if (v6 && (objc_msgSend((id)__fastApplications, "isEqual:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&__fastApplications, a1);
    objc_storeStrong((id *)&__hiddenApps, a2);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "allObjects");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)__fastApplicationNames;
    __fastApplicationNames = v14;

    if (sAppUpdateBlock)
      (*(void (**)(void))(sAppUpdateBlock + 16))();

  }
  pthread_mutex_unlock(&appsLock);
  pthread_cond_broadcast(&appsCond);

}

void SPAppsChangedNotificationClient()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (sAppsChangedBlock)
  {
    (*(void (**)(void))(sAppsChangedBlock + 16))();
  }
  else
  {
    v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v0)
      SPAppsChangedNotificationClient_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void sub_21320C050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void processRecord(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  SPApplication *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  char v24;
  SPApplication *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  SPApplication *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    processRecord_cold_2((uint64_t)v9, v14, v15);
  -[SPApplication bundleIdentifier](v9, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ((-[SPApplication isLaunchProhibited](v9, "isLaunchProhibited") & 1) != 0
      || (-[SPApplication applicationState](v9, "applicationState"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isRestricted"),
          v17,
          v18))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:
        objc_msgSend(v11, "addObject:", v16);
        goto LABEL_36;
      }
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      v19 = MEMORY[0x24BDACB70];
      v20 = "Skip restricted app %@";
      goto LABEL_8;
    }
    -[SPApplication appClipMetadata](v9, "appClipMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      v19 = MEMORY[0x24BDACB70];
      v20 = "Skip app clip backing clip %@";
LABEL_8:
      v21 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_213202000, v19, v21, v20, buf, 0xCu);
      goto LABEL_10;
    }
    if (v12 && (objc_msgSend(v12, "containsObject:", v16) & 1) == 0)
    {
      -[SPApplication applicationState](v9, "applicationState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isPlaceholder");

      if ((v24 & 1) == 0)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          goto LABEL_10;
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Skipping invisible app:%@";
        v21 = OS_LOG_TYPE_INFO;
        goto LABEL_9;
      }
      -[SPApplication compatibilityObject](v9, "compatibilityObject");
      v25 = (SPApplication *)objc_claimAutoreleasedReturnValue();
      -[SPApplication bundleType](v25, "bundleType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDC14E8]) & 1) == 0
        && (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDC1508]) & 1) == 0
        && (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDC1518]) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v25;
          v36 = 2112;
          v37 = v26;
          _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unknown bundle type for app:%@, bundleType:%@ - skipping", buf, 0x16u);
        }
        objc_msgSend(v11, "addObject:", v16);

        goto LABEL_35;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Retaining invisible app:%@", buf, 0xCu);
      }

    }
    v25 = objc_alloc_init(SPApplication);
    -[SPApplication setDisplayIdentifier:](v25, "setDisplayIdentifier:", v16);
    -[SPApplication iTunesMetadata](v9, "iTunesMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "itemName");
    v28 = objc_claimAutoreleasedReturnValue();

    if (v28)
      -[SPApplication setLongDisplayName:](v25, "setLongDisplayName:", v28);
    v33 = (void *)v28;
    -[SPApplication shortVersionString](v9, "shortVersionString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      -[SPApplication setShortVersion:](v25, "setShortVersion:", v29);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v16, 0, 0);
    if (v30)
    {
      -[SPApplication setIsPlaceholder:](v25, "setIsPlaceholder:", 0);
    }
    else
    {
      -[SPApplication applicationState](v9, "applicationState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPApplication setIsPlaceholder:](v25, "setIsPlaceholder:", objc_msgSend(v31, "isPlaceholder"));

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      processRecord_cold_1(v25, (uint64_t)v16);
    -[SPApplication displayIdentifier](v25, "displayIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v25, v32);

LABEL_35:
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v9;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No app identifier for app:%@ - skipping", buf, 0xCu);
  }
LABEL_36:

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void processClip(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a1;
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = objc_msgSend(v8, "webClipType");
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2 || objc_msgSend(v9, "isApplicationInstalled"))
    {
      objc_msgSend(v21, "setDisplayIdentifier:", v7);
      objc_msgSend(v9, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDisplayName:", v11);

      objc_msgSend(v9, "pageURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setURL:", v12);

      objc_msgSend(v9, "applicationBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAppBundleIdentifier:", v13);

      objc_msgSend(v21, "setWebClipType:", v10);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBCE70];
    NSHomeDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("/Library/WebClips/%@.webclip/Info.plist"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithContentsOfFile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Title"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("URL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "setDisplayName:", v18);
          objc_msgSend(v21, "setDisplayIdentifier:", v7);
          objc_msgSend(v21, "setWebClipType:", 3);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setURL:", v20);

        }
      }

    }
  }

}

void __processWebClipMetadata_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  if (a2)
  {
    processClip(*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 56));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE16EA0], "sharedStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __processWebClipMetadata_block_invoke_2;
    v5[3] = &unk_24CF639C0;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v9 = *(_BYTE *)(a1 + 56);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "getAppClipWithURLHash:completionHandler:", v4, v5);

  }
}

void __processWebClipMetadata_block_invoke_2(uint64_t a1, void *a2)
{
  processClip(*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void SPBuildApplicationsNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 134218754;
    v10 = a2;
    v11 = 2112;
    v12 = a3;
    v13 = 2048;
    v14 = a4;
    v15 = 2112;
    v16 = a5;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SPBuildApplicationsNotification: %p %@ %p %@", (uint8_t *)&v9, 0x2Au);
  }
  dispatch_source_merge_data((dispatch_source_t)sSource, 4uLL);
}

void __runningInSpotlightUI_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v2)
    runningInSpotlightUI_sInSpotlight = 1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

uint64_t OUTLINED_FUNCTION_2@<X0>(uint64_t result@<X0>, int a2@<W8>, double a3@<D0>)
{
  *(_DWORD *)(result + 4) = a2;
  *(_WORD *)(result + 8) = 2048;
  *(double *)(result + 10) = a3;
  return result;
}

float *OUTLINED_FUNCTION_3(float *result, uint64_t a2, _QWORD *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

double OUTLINED_FUNCTION_4(float *a1, double a2, double a3, float a4)
{
  double result;

  result = a2 - a3;
  *a1 = a4;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void initFeedbackTables()
{
  if (initFeedbackTables_onceToken != -1)
    dispatch_once(&initFeedbackTables_onceToken, &__block_literal_global_0);
}

uint64_t __initFeedbackTables_block_invoke()
{
  uint64_t result;

  sSPFeedbackTypeSelectorTable = 0;
  *(_QWORD *)algn_253DBC878 = sel_didErrorOccur_;
  qword_253DBC880 = (uint64_t)sel_searchViewDidAppear_;
  unk_253DBC888 = sel_searchViewDidDisappear_;
  qword_253DBC890 = (uint64_t)sel_cardViewDidDisappear_;
  unk_253DBC898 = sel_didStartSearch_;
  qword_253DBC8A0 = (uint64_t)sel_didEndSearch_;
  unk_253DBC8A8 = sel_didRankSections_;
  qword_253DBC8B0 = (uint64_t)sel_didEngageResult_;
  unk_253DBC8B8 = sel_didEngageSuggestion_;
  qword_253DBC8C0 = (uint64_t)sel_didEngageCardSection_;
  unk_253DBC8C8 = sel_sendCustomFeedback_;
  qword_253DBC8D0 = (uint64_t)sel_resultsDidBecomeVisible_;
  unk_253DBC8D8 = sel_suggestionsDidBecomeVisible_;
  qword_253DBC8E0 = (uint64_t)sel_didReceiveResultsAfterTimeout_;
  unk_253DBC8E8 = sel_didAppendLateSections_;
  qword_253DBC8F0 = (uint64_t)sel_didClearInput_;
  unk_253DBC8F8 = sel_didEngageSection_;
  qword_253DBC900 = (uint64_t)sel_sectionHeaderDidBecomeVisible_;
  unk_253DBC908 = sel_didGradeResultRelevancy_;
  qword_253DBC910 = (uint64_t)sel_cardViewDidAppear_;
  unk_253DBC918 = sel_reportFeedback_queryId_;
  qword_253DBC920 = (uint64_t)sel_didGoToSite_;
  unk_253DBC928 = sel_didGoToSearch_;
  qword_253DBC930 = (uint64_t)sel_didGradeLookupHintRelevancy_;
  unk_253DBC938 = sel_didReportUserResponseFeedback_;
  qword_253DBC940 = (uint64_t)sel_didPerformCommand_;
  unk_253DBC948 = 0;
  sSPFeedbackTypeClassTable = 0;
  qword_253DBC640 = objc_opt_class();
  qword_253DBC648 = objc_opt_class();
  qword_253DBC650 = objc_opt_class();
  qword_253DBC658 = objc_opt_class();
  qword_253DBC660 = objc_opt_class();
  qword_253DBC668 = objc_opt_class();
  qword_253DBC670 = objc_opt_class();
  qword_253DBC678 = objc_opt_class();
  qword_253DBC680 = objc_opt_class();
  qword_253DBC688 = objc_opt_class();
  qword_253DBC690 = objc_opt_class();
  qword_253DBC698 = objc_opt_class();
  qword_253DBC6A0 = objc_opt_class();
  qword_253DBC6A8 = objc_opt_class();
  qword_253DBC6B0 = objc_opt_class();
  qword_253DBC6B8 = objc_opt_class();
  qword_253DBC6C0 = objc_opt_class();
  qword_253DBC6C8 = objc_opt_class();
  qword_253DBC6D8 = objc_opt_class();
  qword_253DBC6D0 = objc_opt_class();
  qword_253DBC6E0 = objc_opt_class();
  qword_253DBC6E8 = objc_opt_class();
  qword_253DBC6F0 = objc_opt_class();
  qword_253DBC6F8 = objc_opt_class();
  qword_253DBC700 = objc_opt_class();
  result = objc_opt_class();
  qword_253DBC708 = result;
  unk_253DBC710 = 0;
  sSPFeedbackTypeDescriptionTable = (uint64_t)"None";
  *(_QWORD *)algn_253DBC798 = "Error";
  qword_253DBC7A0 = (uint64_t)"ViewAppear";
  unk_253DBC7A8 = "ViewDisappear";
  qword_253DBC7B0 = (uint64_t)"CardViewDisappear";
  unk_253DBC7B8 = "StartSearch";
  qword_253DBC7C0 = (uint64_t)"EndSearch";
  unk_253DBC7C8 = "RankSections";
  qword_253DBC7D0 = (uint64_t)"EngageResult";
  unk_253DBC7D8 = "EngageSuggestion";
  qword_253DBC7E0 = (uint64_t)"DidEngageCardSection";
  unk_253DBC7E8 = "SendCustomFeedback";
  qword_253DBC7F0 = (uint64_t)"ResultVisible";
  unk_253DBC7F8 = "SuggestionsVisible";
  qword_253DBC800 = (uint64_t)"ReceiveResultsAfterTimeout";
  unk_253DBC808 = "AppendLateSections";
  qword_253DBC810 = (uint64_t)"ClearInput";
  unk_253DBC818 = "EngageSection";
  qword_253DBC820 = (uint64_t)"SectionHeaderVisible";
  unk_253DBC828 = "GradeResult";
  qword_253DBC830 = (uint64_t)"CardViewAppear";
  unk_253DBC838 = "ReportFeedback";
  qword_253DBC840 = (uint64_t)"GoToSite";
  unk_253DBC848 = "GoToSearch";
  qword_253DBC850 = (uint64_t)"GradeLookup";
  unk_253DBC858 = "ReportUserResponse";
  qword_253DBC860 = (uint64_t)"Command";
  unk_253DBC868 = "Invalid";
  return result;
}

void sub_21320E704(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void runQuery(void *a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  dispatch_group_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  FILE *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *context;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id obj;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  NSObject *v56;
  _QWORD *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  _QWORD *v61;
  _QWORD *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  _QWORD v68[4];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  context = (void *)MEMORY[0x2199AE17C]();
  v13 = (void *)objc_opt_new();
  v14 = v9;
  v15 = v10;
  v16 = v11;
  v46 = v15;
  if ((a4 & 1) == 0)
  {
    v17 = v14;
    SSPhraseQueryEscapeString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("**=\"%@*\"cwdt"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {
      objc_msgSend(v16, "clientBundleID");
      v40 = 0;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = 0;
      v37 = v17;
      v38 = 0;
      v36 = 0;
      PRSRankingQueriesWithUserQuery();
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v16, "setRankingQueries:", v15, v36, v37, v38, v39, v40, v41);

    v14 = v17;
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2460]), "initWithQueryString:context:", v14, v16);

  v42 = v14;
  if (v20)
    objc_msgSend(v13, "addObject:", v20);
  v45 = (void *)v20;
  v43 = v16;
  objc_msgSend(v16, "fetchAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v13;
  v47 = v21;
  v50 = v12;
  v48 = v22;
  if (objc_msgSend(v22, "count"))
  {
    v23 = dispatch_group_create();
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    v67[3] = 0;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v22;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v24)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v64 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v59[0] = v25;
          v59[1] = 3221225472;
          v59[2] = ___runQueries_block_invoke;
          v59[3] = &unk_24CF63BF0;
          v61 = v68;
          v60 = v50;
          v62 = v67;
          objc_msgSend(v28, "setFoundItemsHandler:", v59);
          v55[0] = v25;
          v55[1] = 3221225472;
          v55[2] = ___runQueries_block_invoke_2;
          v55[3] = &unk_24CF63C18;
          v57 = v68;
          v58 = v28;
          v29 = v23;
          v56 = v29;
          objc_msgSend(v28, "setCompletionHandler:", v55);
          if (verbose)
          {
            v30 = (FILE *)*MEMORY[0x24BDAC8E8];
            objc_msgSend(v28, "queryString");
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v30, "Running Query (%p)for query string: %s\n", v28, (const char *)objc_msgSend(v31, "cStringUsingEncoding:", 4));

          }
          dispatch_group_enter(v29);
          objc_msgSend(v28, "start");

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v24);
    }

    dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v32 = obj;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v52 != v34)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "cancel");
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
      }
      while (v33);
    }

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v68, 8);

  }
  objc_autoreleasePoolPop(context);

}

void sub_21320FB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void ___runQueries_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%lu.log"), a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "attributeSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attributeForKey:", CFSTR("_kMDItemSDBInfo"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "writeToFile:atomically:", v4, 1);
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

void ___runQueries_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FILE *v4;
  const void *v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = (FILE *)*MEMORY[0x24BDAC8E8];
    v5 = *(const void **)(a1 + 48);
    objc_msgSend(v3, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v4, "Query (%p) failed with error: %s.\n", v5, (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4));

  }
  else
  {
    if (onlyCount)
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%lu\n", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    if (verbose)
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "Query (%p) complete, returned %lu items\n", *(const void **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void queryReissueFunction(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __queryReissueFunction_block_invoke;
  v9[3] = &unk_24CF63C90;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

void __queryReissueFunction_block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint64_t v5;
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v2, v3, "=====^^^^ Resending query!", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "gotQueryComplete") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "didReissue") & 1) != 0)
    {
      ADClientAddValueForScalarKey();
      LODWORD(v5) = 1;
      objc_msgSend(v4, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, 0.0, v5, &stru_24CF64BB0, 0, 0);
    }
    else
    {
      ADClientAddValueForScalarKey();
      objc_msgSend(*(id *)(a1 + 32), "setDidReissue:", 1);
      LODWORD(v5) = 0;
      objc_msgSend(v4, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(_QWORD *)(a1 + 32), 0, 1, 0, 0, 0, 0.0, v5, &stru_24CF64BB0, 0, 0);
      objc_msgSend(*(id *)(a1 + 40), "sendMessageForToken:", *(_QWORD *)(a1 + 32));
    }

  }
}

void sub_213212274(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21321230C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213212444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2132126C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id one_member_dict(char *a1, void *a2)
{
  xpc_object_t v2;
  xpc_object_t v4;
  char *keys;

  keys = a1;
  v4 = a2;
  v2 = xpc_dictionary_create((const char *const *)&keys, &v4, 1uLL);

  return v2;
}

void sub_213215ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void _sanitizePlistData(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          _sanitizePlistData(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "addObject:", v3);
  }

}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_7_0(id a1)
{
  return a1;
}

uint64_t SearchResultDomainCount()
{
  return 27;
}

uint64_t SPGetExtendedDomains()
{
  return MEMORY[0x24BDBD1A8];
}

__CFString *SPKeyForSearchDomain(unsigned int a1)
{
  unint64_t v2;
  __CFString *v3;
  BOOL v4;

  if (a1 > 0x1A)
    return (__CFString *)0;
  v2 = 0;
  do
  {
    if (*((_DWORD *)&__SPNativeSearchDomainToKeyMapping + 2 * v2 + 2) == a1)
    {
      v3 = *(&__SPNativeSearchDomainToKeyMapping + v2);
      if (v3)
        return v3;
    }
    else
    {
      v3 = 0;
    }
    v4 = v2 >= 0x36;
    v2 += 2;
  }
  while (!v4);
  return v3;
}

uint64_t SPSearchDomainForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = 0;
    do
    {
      if (objc_msgSend(v1, "isEqualToString:", *(&__SPNativeSearchDomainToKeyMapping + v4)))
        v5 = *((unsigned int *)&__SPNativeSearchDomainToKeyMapping + 2 * v4 + 2);
      else
        v5 = 27;
      if ((_DWORD)v5 != 27)
        break;
      v6 = v4 >= 0x36;
      v4 += 2;
    }
    while (!v6);
  }
  else
  {
    v5 = 27;
  }

  return v5;
}

uint64_t SPSearchDomainForDisplayIdentifierAndCategory(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = a1;
  v6 = objc_msgSend(v4, "length");
  v7 = CFSTR(" ");
  if (!v6)
    v7 = &stru_24CF64BB0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v5, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = SPSearchDomainForKey(v8);
  return v9;
}

id SPDisplayIdentifierForDomain(void *a1)
{
  id v2;

  v2 = 0;
  SPSearchDomainGetDisplayIdentifierAndCategory(a1, &v2, 0);
  return v2;
}

id SPSearchDomainGetDisplayIdentifierAndCategory(id result, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  unint64_t i;

  if (result <= 0x1A)
  {
    if (*(&__SPNativeSearchDomainToKeyMapping + ((2 * (_DWORD)result) | 1u)) == (_DWORD)result)
    {
      if (!a2)
        goto LABEL_13;
      v5 = *(&__SPNativeSearchDomainToKeyMapping + (2 * (_DWORD)result));
    }
    else
    {
      for (i = 0; *((_DWORD *)&__SPNativeSearchDomainToKeyMapping + 2 * i + 2) != (_DWORD)result; i += 2)
      {
        if (i >= 0x36)
          return result;
      }
      if (!a2)
        goto LABEL_13;
      v5 = *(&__SPNativeSearchDomainToKeyMapping + i);
    }
    result = objc_retainAutorelease(v5);
    *a2 = result;
LABEL_13:
    if (a3)
      *a3 = &stru_24CF64BB0;
  }
  return result;
}

const __CFString *SPCategoryForDomain(unsigned int a1)
{
  const __CFString *v1;
  uint64_t v2;
  unint64_t v3;

  if (a1 > 0x1A)
    return 0;
  if (*(&__SPNativeSearchDomainToKeyMapping + ((2 * a1) | 1)) == a1)
    return &stru_24CF64BB0;
  v2 = 1;
  v1 = &stru_24CF64BB0;
  while (*(&__SPNativeSearchDomainToKeyMapping + v2) != a1)
  {
    v3 = v2 - 1;
    v2 += 2;
    if (v3 >= 0x36)
      return 0;
  }
  return v1;
}

const __CFString *SPDisplayNameForExtendedDomain()
{
  return &stru_24CF64BB0;
}

uint64_t SPDisplayNameForDomain()
{
  return 0;
}

id SPGetDomainOrdering()
{
  return (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
}

uint64_t SPGetZKWDomainOrdering()
{
  return objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24CF6FE78, 0);
}

id SPGetDisabledAppSet()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  v13 = (id)CFPreferencesCopyValue(CFSTR("SBSearchDisabledApps"), SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v1 = (void *)v9[5];
  if (!v1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __SPCopyPrefsDisabledApps_block_invoke;
    block[3] = &unk_24CF64358;
    block[4] = &v8;
    if (SPCopyPrefsDisabledApps_onceToken != -1)
      dispatch_once(&SPCopyPrefsDisabledApps_onceToken, block);
    v1 = (void *)v9[5];
    if (!v1)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v9[5];
      v9[5] = v2;

      v1 = (void *)v9[5];
    }
  }
  v4 = v1;
  _Block_object_dispose(&v8, 8);

  objc_msgSend(v0, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_213217C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SPDomains()
{
  void *v0;
  void *v1;

  SPGetDisabledDomains(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24CF6FE18);
  if ((objc_msgSend(v0, "containsObject:", &unk_24CF6FE90) & 1) == 0)
    objc_msgSend(v1, "addObjectsFromArray:", &unk_24CF6FE30);
  if (_os_feature_enabled_impl())
    objc_msgSend(v1, "addObject:", &unk_24CF6FF50);
  if (_os_feature_enabled_impl())
    objc_msgSend(v1, "addObject:", &unk_24CF6FF68);

  return v1;
}

void *SPZKWDomains()
{
  return &unk_24CF6FE48;
}

id SPZKWSearchDomains()
{
  void *v0;
  id v1;
  void *v2;

  SPGetDisabledDomains(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "containsObject:", &unk_24CF6FE78) & 1) != 0)
  {
    v1 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24CF6FE78, 0);
    objc_msgSend(v0, "allObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectsInArray:", v2);

  }
  return v1;
}

uint64_t SPCanEnableInternetDomains()
{
  char v0;
  uint64_t result;

  v0 = _internetDomainsEnabled;
  _internetDomainsEnabled = 1;
  result = SPGetInternetDomainsEnabled();
  _internetDomainsEnabled = v0;
  return result;
}

uint64_t SPGetInternetDomainsEnabled()
{
  if (!_internetDomainsEnabled)
    return 0;
  if ((objc_msgSend(MEMORY[0x24BDBD1A8], "containsObject:", &unk_24CF6FE90) & 1) != 0)
    return 1;
  return objc_msgSend(MEMORY[0x24BDBD1A8], "containsObject:", &unk_24CF6FF98);
}

void SPSetInternetDomainsEnabled(int a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_internetDomainsEnabled != a1)
  {
    _internetDomainsEnabled = a1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kSPSearchInternetDomainsChangedNotification, 0, 0, 1u);
  }
}

void _userPrefsChanged()
{
  int v0;
  void *v1;
  id v2;

  v0 = __siriSuggestionsEnabled;
  SPGetDisabledDomainSet();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __siriSuggestionsEnabled = objc_msgSend(v1, "containsObject:", CFSTR("DOMAIN_ZKWS")) ^ 1;

  if (__siriSuggestionsEnabled != v0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("SiriSuggestionPrefChangeNotification"), 0);

  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void SPLogV()
{
  __assert_rtn("SPLogV", "SPLogging.m", 22, "0");
}

void _SPLog()
{
  __assert_rtn("_SPLog", "SPLogging.m", 26, "0");
}

id SPLogDirectory()
{
  if (SPLogDirectory_onceToken != -1)
    dispatch_once(&SPLogDirectory_onceToken, &__block_literal_global_8);
  return (id)SPLogDirectory_sSPLogDirectory;
}

void SPLogInit()
{
  if (SPLogInit_onceToken != -1)
    dispatch_once(&SPLogInit_onceToken, &__block_literal_global_10);
}

id SPLogForSPLogCategoryIndex()
{
  if (SPLogForSPLogCategoryIndex_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryIndex_onceToken, &__block_literal_global_22);
  return (id)SPLogForSPLogCategoryIndex_sIndexLog;
}

id SPLogForSPLogCategoryRanking()
{
  if (SPLogForSPLogCategoryRanking_onceToken != -1)
    dispatch_once(&SPLogForSPLogCategoryRanking_onceToken, &__block_literal_global_26);
  return (id)SPLogForSPLogCategoryRanking_sQueryLog;
}

id SPPersonalMetricManagerTransactionCreate(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.searchd.personalMetricManager.%@"), v1);

  }
  else
  {
    v3 = CFSTR("com.apple.searchd.personalMetricManager");
  }
  v4 = objc_retainAutorelease(v3);
  -[__CFString UTF8String](v4, "UTF8String");
  v5 = (void *)os_transaction_create();

  return v5;
}

id SDFeedbackTransactionCreate(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.searchd.%@"), v1);

  }
  else
  {
    v3 = CFSTR("com.apple.searchd");
  }
  v4 = objc_retainAutorelease(v3);
  -[__CFString UTF8String](v4, "UTF8String");
  v5 = (void *)os_transaction_create();

  return v5;
}

id SDFeedbackTransactionDone(id result)
{
  if (result)
    return (id)objc_opt_self();
  return result;
}

id SPSpotlightSupportDirectoryPath()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  if (SPSpotlightSupportDirectoryPath_supportPath)
  {
    v0 = (id)SPSpotlightSupportDirectoryPath_supportPath;
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Spotlight"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&SPSpotlightSupportDirectoryPath_supportPath, v3);
    v4 = (void *)SPSpotlightSupportDirectoryPath_supportPath;
    if (!SPSpotlightSupportDirectoryPath_supportPath)
    {
      SPLogForSPLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        SPSpotlightSupportDirectoryPath_cold_1(v5);

      v4 = (void *)SPSpotlightSupportDirectoryPath_supportPath;
    }
    v0 = v4;

  }
  return v0;
}

__CFString *SPSearchFrameworkPath()
{
  __CFString *v0;

  v0 = (__CFString *)SPSearchFrameworkPath_frameworkPath;
  if (!SPSearchFrameworkPath_frameworkPath)
  {
    SPSearchFrameworkPath_frameworkPath = (uint64_t)CFSTR("/System/Library/PrivateFrameworks/Search.framework");

    v0 = CFSTR("/System/Library/PrivateFrameworks/Search.framework");
  }
  return v0;
}

id enabledForPref(const __CFString *a1)
{
  int AppBooleanValue;
  BOOL v2;
  uint64_t v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(a1, SpotlightUIPrefsDomain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v2 = AppBooleanValue == 0;
  else
    v2 = 1;
  v3 = !v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id enabledNumberForPref(const __CFString *a1, const __CFString *a2)
{
  unsigned int AppIntegerValue;
  uint64_t v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(a1, a2, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppIntegerValue;
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void SPSetNumberForPref(void *a1, void *a2, const __CFString *a3)
{
  __CFString *v5;
  const void *v6;
  id v7;

  v7 = a2;
  v5 = a1;
  if (objc_msgSend(v7, "integerValue"))
    v6 = v7;
  else
    v6 = 0;
  CFPreferencesSetAppValue(v5, v6, a3);

  CFPreferencesSynchronize(a3, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

BOOL SPIsiPad()
{
  void *v0;
  _BOOL8 v1;

  -[objc_class currentDevice](NSClassFromString(CFSTR("UIDevice")), "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

id SPGetDefault(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (SPGetDefault_onceTokenB != -1)
    dispatch_once(&SPGetDefault_onceTokenB, &__block_literal_global_13);
  objc_msgSend((id)SPGetDefault_defaultCache, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)*MEMORY[0x24BDBD430];
    if (v7)
      v9 = (void *)v7;
    v5 = v9;

    objc_msgSend((id)SPGetDefault_defaultCache, "setObject:forKey:", v5, v3);
  }

  return v5;
}

uint64_t SPFilterLocalSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("FilterLocalSuggestions"));

  return v1;
}

uint64_t SPShowDebugLocalSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("ShowDebugLocalSuggestions"));

  return v1;
}

uint64_t SPShowTopHitSectionHeaderInAsYouTypeScreen()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("ShowTopHitSectionHeaderInAsYouTypeScreen"));

  return v1;
}

uint64_t SPHideSearchThroughSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("HideSearchThroughSuggestions"));

  return v1;
}

uint64_t SPEnableSafariTopHitsLogic()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("EnableSafariTopHitsLogic"));

  return v1;
}

uint64_t SPMaxCountTopHits()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxCountTopHits"));

  return v1;
}

uint64_t SPMaxSectionsBeforeShowMore()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxSectionsBeforeShowMore"));

  return v1;
}

uint64_t SPMaxSectionsBeforeShowMoreWithScopedSearch()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxSectionsBeforeShowMoreWithScopedSearch"));

  return v1;
}

uint64_t SPMaxVisibleResultsCountPerSection()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxVisibleResultsCountPerSection"));

  return v1;
}

uint64_t SPMinSectionCountThresholdForShowMore()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MinSectionCountThresholdForShowMore"));

  return v1;
}

unint64_t SPCommittedScreenMatchingBehavior()
{
  void *v0;
  unint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("CommittedScreenMatchingBehavior"));

  if (v1 >= 5)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213202000, v2, OS_LOG_TYPE_DEFAULT, "CommittedScreenMatchingBehavior out of range", v4, 2u);
    }

    return 0;
  }
  return v1;
}

uint64_t SPL1Threshold()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("L1Threshold"));

  return v1;
}

double SPL2Threshold()
{
  void *v0;
  double v1;
  double v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("L2Threshold"));
  v2 = v1;

  return v2;
}

double SPMinTopHitThresholdForBigResult()
{
  void *v0;
  double v1;
  double v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("MinTopHitThresholdForBigResult"));
  v2 = v1;

  return v2;
}

void _SPUpdateBullseyeBackendSettings(uint64_t a1)
{
  void *v2;
  char v3;
  const __CFString *v4;
  const void *v5;

  enabledForPref(CFSTR("SPBullseyePrefsChanged"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    v4 = (const __CFString *)SPSearchEnableBullseyeRanking;
    v5 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
    CFPreferencesSetAppValue(v4, v5, (CFStringRef)*MEMORY[0x24BDBD568]);
    CFPreferencesSetAppValue(CFSTR("SPBullseyeMinTopHitScore"), &unk_24CF70100, SpotlightUIPrefsDomain);
    setBOOLForPref(CFSTR("SPBullseyeFilterLocalSuggestions"), a1);
    setBOOLForPref(CFSTR("SPBullseyeThresholdSuggestions"), a1);
    setBOOLForPref(CFSTR("SPBullseyeResultNoiseReduction"), a1);
    setBOOLForPref(CFSTR("SPBullseyeAllowDictionaryTopResult"), 0);
    CFPreferencesSynchronize(CFSTR("com.apple.searchd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  }
}

uint64_t setBOOLForPref(void *a1, int a2)
{
  void *v3;
  const __CFString *v4;
  const void *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = a1;
    v5 = (const void *)objc_msgSend(v3, "numberWithBool:", 1);
    v6 = SpotlightUIPrefsDomain;
    v7 = v4;
  }
  else
  {
    v8 = SpotlightUIPrefsDomain;
    v7 = a1;
    v5 = 0;
    v6 = v8;
  }
  CFPreferencesSetAppValue(v7, v5, v6);

  return CFPreferencesSynchronize(SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

void SPDisableBullseyeBackend()
{
  _SPUpdateBullseyeBackendSettings(0);
}

void _SPUpdateBullseyeUISettings(int a1)
{
  void *v2;
  char v3;
  void *v4;

  enabledForPref(CFSTR("SPBullseyePrefsChanged"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    setBOOLForPref(CFSTR("SPUICollapseWindow"), a1);
    setBOOLForPref(CFSTR("SPUIDelayExpansion"), a1);
    setBOOLForPref(CFSTR("SPUIBullseyeSuggestions"), a1);
    if (a1)
      v4 = &unk_24CF700D0;
    else
      v4 = &unk_24CF700E8;
    SPSetNumberForPref(CFSTR("SPBlueButtonBehavior"), v4, SpotlightUIPrefsDomain);
    setBOOLForPref(CFSTR("SPUIWindowLookPref"), a1);
    setBOOLForPref(CFSTR("SPUIBullseyeShowDebugLocalSuggestions"), 0);
    setBOOLForPref(CFSTR("SPUIBullseyeShowTopHitSectionHeaderInAsYouTypeScreen"), 0);
    setBOOLForPref(CFSTR("SPHideSearchThroughSuggestions"), 0);
    SPSetNumberForPref(CFSTR("SPCommittedScreenMatchingBehavior"), &unk_24CF700D0, SpotlightUIPrefsDomain);
  }
}

void SPEnableBullseyeUI()
{
  _SPUpdateBullseyeUISettings(1);
}

void SPDisableBullseyeUI()
{
  _SPUpdateBullseyeUISettings(0);
}

uint64_t SPShowBullseyeBackend()
{
  if (SPShowBullseyeBackend_onceToken != -1)
    dispatch_once(&SPShowBullseyeBackend_onceToken, &__block_literal_global_195);
  return SPShowBullseyeBackend__useBullseyeBackend;
}

uint64_t SPShowBullseyeUI()
{
  if (SPShowBullseyeUI_onceToken != -1)
    dispatch_once(&SPShowBullseyeUI_onceToken, &__block_literal_global_198);
  return SPShowBullseyeUI__useBullseyeUI;
}

uint64_t SPGenreGroupingEnabled()
{
  if (SPGenreGroupingEnabled_onceToken != -1)
    dispatch_once(&SPGenreGroupingEnabled_onceToken, &__block_literal_global_201);
  return SPGenreGroupingEnabled__genreGroupingEnabled;
}

uint64_t SPBullseyeAllowDictionaryTopResult()
{
  if (SPBullseyeAllowDictionaryTopResult_onceToken != -1)
    dispatch_once(&SPBullseyeAllowDictionaryTopResult_onceToken, &__block_literal_global_204);
  return SPBullseyeAllowDictionaryTopResult__useBullseyeAllowDictionaryTopResult;
}

id _dayDateFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)__dayDateFormatter;
  if (!__dayDateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v2 = (void *)__dayDateFormatter;
    __dayDateFormatter = (uint64_t)v1;

    objc_msgSend((id)__dayDateFormatter, "setDateStyle:", 1);
    objc_msgSend((id)__dayDateFormatter, "setTimeStyle:", 0);
    v0 = (void *)__dayDateFormatter;
  }
  return v0;
}

id _timeDateFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)__timeDateFormatter;
  if (!__timeDateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v2 = (void *)__timeDateFormatter;
    __timeDateFormatter = (uint64_t)v1;

    objc_msgSend((id)__timeDateFormatter, "setDateStyle:", 0);
    objc_msgSend((id)__timeDateFormatter, "setTimeStyle:", 1);
    v0 = (void *)__timeDateFormatter;
  }
  return v0;
}

void _resetCalTimeZone()
{
  void *v0;

  v0 = (void *)__timeDateFormatter;
  __timeDateFormatter = 0;

}

id SPDayStringForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v1 = a1;
  v2 = (void *)__midnightThisMorning;
  if (!__midnightThisMorning)
  {
    _autoUpdatingCurrentCalendar();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 254, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setHour:", 0);
    objc_msgSend(v5, "setMinute:", 0);
    objc_msgSend(v5, "setSecond:", 0);
    objc_msgSend(v3, "dateFromComponents:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)__midnightThisMorning;
    __midnightThisMorning = v6;

    v2 = (void *)__midnightThisMorning;
  }
  v8 = v2;
  objc_msgSend(v1, "timeIntervalSinceDate:", v8);
  if (fabs(v9) >= 172800.0)
    goto LABEL_19;
  v10 = v1;
  _autoUpdatingCurrentCalendar();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:toDate:options:", 240, v8, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "day");
  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("TOMORROW");
  }
  else
  {
    if (v13)
    {
      v14 = 0;
      if (v13 != -1)
        goto LABEL_18;
      if (objc_msgSend(v12, "hour") || objc_msgSend(v12, "minute") || objc_msgSend(v12, "second"))
      {
        v14 = 0;
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    if (objc_msgSend(v12, "hour") < 0 || objc_msgSend(v12, "minute") < 0 || objc_msgSend(v12, "second") < 0)
    {
LABEL_16:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("YESTERDAY");
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("TODAY");
  }
LABEL_17:
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24CF64BB0, CFSTR("Search"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v14)
  {
LABEL_19:
    _dayDateFormatter();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromDate:", v1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

id _autoUpdatingCurrentCalendar()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__autoUpdatingCurrentCalendar;
  if (!__autoUpdatingCurrentCalendar)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__autoUpdatingCurrentCalendar;
    __autoUpdatingCurrentCalendar = v1;

    v0 = (void *)__autoUpdatingCurrentCalendar;
  }
  return v0;
}

id SPTimeStringForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _timeDateFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SPDayAndTimeStringForDate(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = a1;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TODAY_TOMORROW_YESTERDAY_DATE_FORMAT-%@-%@"), &stru_24CF64BB0, CFSTR("Search"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SPDayStringForDate(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SPTimeStringForDate(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id SPStringForDuration(double a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v7;

  v1 = floor(a1 / 1000.0);
  v2 = floor(v1 / 60.0);
  v3 = v1 - v2 * 60.0;
  v4 = floor(v2 / 60.0);
  v5 = v2 - v4 * 60.0;
  if (v4 <= 0.0)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld:%02ld"), (unint64_t)v5, (unint64_t)v3, v7);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld:%02ld:%02ld"), (unint64_t)v4, (unint64_t)v5, (unint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void SPTransactionDone(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (v1)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3)
    {
      v4 = (void *)os_transaction_copy_description();
      if (v4)
      {
        SPLogForSPLogCategoryDefault();
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v5, v6))
        {
          v7 = 136315138;
          v8 = v4;
          _os_log_impl(&dword_213202000, v5, v6, "SPTransactionDone, %s", (uint8_t *)&v7, 0xCu);
        }

      }
      free(v4);
    }
  }

}

void sub_213224410(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *_StringForXPCType(uint64_t a1)
{
  if (a1 == MEMORY[0x24BDACF88])
    return "XPC_TYPE_CONNECTION";
  if (a1 == MEMORY[0x24BDACFE0])
    return "XPC_TYPE_NULL";
  if (a1 == MEMORY[0x24BDACF80])
    return "XPC_TYPE_BOOL";
  if (a1 == MEMORY[0x24BDACFD0])
    return "XPC_TYPE_INT64";
  if (a1 == MEMORY[0x24BDACFF8])
    return "XPC_TYPE_UINT64";
  if (a1 == MEMORY[0x24BDACFA8])
    return "XPC_TYPE_DOUBLE";
  if (a1 == MEMORY[0x24BDACF98])
    return "XPC_TYPE_DATE";
  if (a1 == MEMORY[0x24BDACF90])
    return "XPC_TYPE_DATA";
  if (a1 == MEMORY[0x24BDACFF0])
    return "XPC_TYPE_STRING";
  if (a1 == MEMORY[0x24BDAD000])
    return "XPC_TYPE_UUID";
  if (a1 == MEMORY[0x24BDACFC0])
    return "XPC_TYPE_FD";
  if (a1 == MEMORY[0x24BDACFE8])
    return "XPC_TYPE_SHMEM";
  if (a1 == MEMORY[0x24BDACF78])
    return "XPC_TYPE_ARRAY";
  if (a1 == MEMORY[0x24BDACFA0])
    return "XPC_TYPE_DICTIONARY";
  if (a1 == MEMORY[0x24BDACFB8])
    return "XPC_TYPE_ERROR";
  return "Unknown type";
}

void sub_213225308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void SPBuildApplicationNamesLocked_cold_1(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], v3, "Processing app:%@", v4);
}

void SPBuildApplicationNamesLocked_cold_2(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], v3, "Restricted system app: %@", v4);
}

void SPBuildApplicationNamesLocked_cold_3(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], v3, "Processing app-%@", v4);
}

void SPBuildApplicationNamesLocked_cold_5(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "count");
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6(&dword_213202000, MEMORY[0x24BDACB70], v3, "apps count %lu, %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_8();
}

void SPAppsChangedNotificationClient_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_213202000, MEMORY[0x24BDACB70], a3, "Apps changed block was not set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void processRecord_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109378;
  v4[1] = objc_msgSend(a1, "isPlaceholder");
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1(&dword_213202000, MEMORY[0x24BDACB70], v3, "setting isPlaceholder = %d for %@", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

void processRecord_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_213202000, MEMORY[0x24BDACB70], a3, "Processing app:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void SPSpotlightSupportDirectoryPath_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213202000, log, OS_LOG_TYPE_ERROR, "Can't get spotlight support directory path!", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CPSClipsFeatureEnabled()
{
  return MEMORY[0x24BE16E80]();
}

uint64_t DMGetPreviousBuildVersion()
{
  return MEMORY[0x24BE2B600]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x24BDD0DE0](userName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

uint64_t PRSRankingQueriesWithUserQuery()
{
  return MEMORY[0x24BEB0488]();
}

uint64_t PRSRankingSDEnabledFlagState()
{
  return MEMORY[0x24BEB04B0]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x24BEB0BD0]();
}

uint64_t SBSRegisterDisplayIdentifiersChangedBlock()
{
  return MEMORY[0x24BEB0D00]();
}

uint64_t SSDefaultsGetResources()
{
  return MEMORY[0x24BEB0560]();
}

uint64_t SSGetDisabledBundleSet()
{
  return MEMORY[0x24BEB05B0]();
}

uint64_t SSPhraseQueryEscapeString()
{
  return MEMORY[0x24BEB05F8]();
}

uint64_t SSResultTypeIsServer()
{
  return MEMORY[0x24BEB0648]();
}

uint64_t SSResultTypeIsSuggestion()
{
  return MEMORY[0x24BEB0650]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t icu_ctx_release()
{
  return MEMORY[0x24BE66840]();
}

uint64_t icu_word_matcher_count()
{
  return MEMORY[0x24BE66848]();
}

uint64_t icu_word_matcher_create()
{
  return MEMORY[0x24BE66850]();
}

uint64_t icu_word_matcher_matches()
{
  return MEMORY[0x24BE66858]();
}

uint64_t icu_word_matcher_matches_string()
{
  return MEMORY[0x24BE66860]();
}

uint64_t json_writer_add_double()
{
  return MEMORY[0x24BEB0770]();
}

uint64_t json_writer_add_key()
{
  return MEMORY[0x24BEB0778]();
}

uint64_t json_writer_add_raw_value()
{
  return MEMORY[0x24BEB0780]();
}

uint64_t json_writer_add_string()
{
  return MEMORY[0x24BEB0788]();
}

uint64_t json_writer_add_uint32()
{
  return MEMORY[0x24BEB0790]();
}

uint64_t json_writer_begin_array()
{
  return MEMORY[0x24BEB0798]();
}

uint64_t json_writer_begin_dictionary()
{
  return MEMORY[0x24BEB07A0]();
}

uint64_t json_writer_create_with_path()
{
  return MEMORY[0x24BEB07A8]();
}

uint64_t json_writer_dispose()
{
  return MEMORY[0x24BEB07B0]();
}

uint64_t json_writer_end_array()
{
  return MEMORY[0x24BEB07B8]();
}

uint64_t json_writer_end_dictionary()
{
  return MEMORY[0x24BEB07C0]();
}

uint64_t json_writer_get_data()
{
  return MEMORY[0x24BEB07C8]();
}

uint64_t json_writer_init_with_buffer()
{
  return MEMORY[0x24BEB07D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x24BDAF430]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

uint64_t resolve_transcriptions_for_locale()
{
  return MEMORY[0x24BE66870]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x24BE668A8]();
}

uint64_t tracing_dispatch_sync()
{
  return MEMORY[0x24BE668B0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0668](xarray, index, length);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x24BDB0720]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x24BDB0778](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

