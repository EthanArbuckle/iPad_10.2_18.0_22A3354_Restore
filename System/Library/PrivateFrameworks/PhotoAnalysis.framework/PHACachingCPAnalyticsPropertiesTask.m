@implementation PHACachingCPAnalyticsPropertiesTask

+ (id)_fetchLibrarySummaryForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[15];
  _QWORD v56[15];
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start caching CPAnalytics library summary", buf, 2u);
  }
  if (v7)
  {
    v10 = v9;
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v11, "setShouldPrefetchCount:", 1);
    objc_msgSend(v11, "setIsExclusivePredicate:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    if (objc_msgSend(v10, "isCancelledWithProgress:", 0.1))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 187;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v14 = (id)MEMORY[0x1E0C9AA70];
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 2, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (objc_msgSend(v10, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 191;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v14 = (id)MEMORY[0x1E0C9AA70];
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v11);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShouldPrefetchCount:", 1);
    objc_msgSend(v17, "setPersonContext:", 1);
    v53 = v17;
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isCancelledWithProgress:", 0.3))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 201;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        v19 = MEMORY[0x1E0C81028];
LABEL_19:
        _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      objc_msgSend(v7, "ratioOfAssetsWithScenesProcessed");
      v21 = v20;
      objc_msgSend(v7, "ratioOfAssetsWithFacesProcessed");
      v23 = v22;
      objc_msgSend(v7, "ratioOfAssetsWithMediaAnalysisVideoProcessed");
      v25 = v24;
      objc_msgSend(v7, "ratioOfAssetsWithMediaAnalysisImageProcessed");
      v27 = v26;
      if (!objc_msgSend(v10, "isCancelledWithProgress:", 0.5))
      {
        v52 = v18;
        v41 = objc_msgSend(v7, "isCloudPhotoLibraryEnabled");
        v50 = v15;
        if (v41)
        {
          objc_msgSend(v7, "librarySpecificFetchOptions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setShouldPrefetchCount:", 1);
          objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v29, "count") != 0;

        }
        else
        {
          v46 = 0;
        }
        objc_msgSend(v7, "cplStatus");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = *MEMORY[0x1E0D098C8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v49;
        v55[1] = *MEMORY[0x1E0D098D8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v48;
        v55[2] = *MEMORY[0x1E0D09880];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 + v13);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v47;
        v55[3] = *MEMORY[0x1E0D098A8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v56[3] = v45;
        v55[4] = *MEMORY[0x1E0D098B8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v56[4] = v44;
        v55[5] = *MEMORY[0x1E0D098D0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v56[5] = v43;
        v55[6] = *MEMORY[0x1E0D09888];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v56[6] = v40;
        v55[7] = *MEMORY[0x1E0D098A0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v56[7] = v39;
        v55[8] = *MEMORY[0x1E0D09898];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v56[8] = v38;
        v55[9] = *MEMORY[0x1E0D098E8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v56[9] = v42;
        v55[10] = *MEMORY[0x1E0D098F0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v51, "isExceedingQuota"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56[10] = v37;
        v55[11] = *MEMORY[0x1E0D09900];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v51, "lowDiskSpace"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56[11] = v36;
        v55[12] = *MEMORY[0x1E0D09908];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v51, "veryLowDiskSpace"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v56[12] = v30;
        v55[13] = *MEMORY[0x1E0D098F8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v51, "hasChangesToProcess"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v56[13] = v31;
        v55[14] = *MEMORY[0x1E0D098E0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v56[14] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
        {
          v34 = v33;
          v15 = v50;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v58 = 241;
            v59 = 2080;
            v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/St"
                  "orytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
            _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v14 = (id)MEMORY[0x1E0C9AA70];
        }
        else
        {
          v34 = v33;
          v14 = v33;
          v15 = v50;
        }
        v18 = v52;

        goto LABEL_30;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 207;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        v19 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
    v14 = (id)MEMORY[0x1E0C9AA70];
LABEL_30:

LABEL_31:
LABEL_32:

    goto LABEL_33;
  }
  v14 = (id)MEMORY[0x1E0C9AA70];
LABEL_33:

  return v14;
}

+ (id)_fetchDemographicsSummaryWithLoggingConnection:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  v4 = a3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start caching CPAnalytics demographics summary", v13, 2u);
  }
  objc_msgSend(a1, "_meContactWithLoggingConnection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "birthday");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_ageRangeDescriptionFromBirthday:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D09698]);

    objc_msgSend(v5, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_genderDescriptionFromGivenName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D096A0]);

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Unknown"), *MEMORY[0x1E0D09698]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Unknown"), *MEMORY[0x1E0D096A0]);
  }

  return v7;
}

+ (id)_meContactWithLoggingConnection:(id)a3
{
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  id v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start fetching Me contact card", buf, 2u);
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) > 1)
  {
    v6 = *MEMORY[0x1E0C96670];
    v14[0] = *MEMORY[0x1E0C966D0];
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v9)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_error_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Error fetching the me Contact Card (%@)", buf, 0xCu);
      }
      v5 = 0;
    }
    else
    {
      v5 = v8;
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Not authorized to get meContact", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)_genderDescriptionFromGivenName:(id)a3
{
  id v3;
  id v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    v5 = CFSTR("Unknown");
    if (objc_msgSend(v4, "UTF8String"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D17538]);
      v7 = objc_msgSend(v6, "genderMajorityForGivenName:", v4);
      v8 = CFSTR("Male");
      if (v7 != 2)
        v8 = CFSTR("Unknown");
      if (v7 == 1)
        v5 = CFSTR("Female");
      else
        v5 = v8;

    }
  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return (id)v5;
}

+ (id)_ageRangeDescriptionFromBirthday:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  v3 = a3;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "year") < 1900 || objc_msgSend(v4, "day") == 1 && objc_msgSend(v4, "month") == 1)
  {
    v5 = CFSTR("Unknown");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCalendar:", v6);
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:toDate:options:", 4, v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "year");
    v11 = CFSTR("<18");
    v12 = CFSTR("18-25");
    v13 = CFSTR("26-35");
    v14 = CFSTR("36-45");
    v15 = CFSTR("46-55");
    v16 = CFSTR(">65");
    if (v10 < 0x42)
      v16 = CFSTR("56-65");
    if (v10 >= 0x38)
      v15 = v16;
    if (v10 >= 0x2E)
      v14 = v15;
    if (v10 >= 0x24)
      v13 = v14;
    if (v10 >= 0x1A)
      v12 = v13;
    if (v10 >= 0x12)
      v11 = v12;
    if ((uint64_t)v10 >= 1)
      v5 = v11;
    else
      v5 = CFSTR("Unknown");

  }
  return (id)v5;
}

+ (BOOL)_hasAppleMusicSubscriptionWithLoggingConnection:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  char v10;
  uint8_t v12[8];
  _QWORD v13[4];
  NSObject *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a3;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = (void *)MEMORY[0x1E0D76110];
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PHACachingCPAnalyticsPropertiesTask__hasAppleMusicSubscriptionWithLoggingConnection___block_invoke;
  v13[3] = &unk_1E8520260;
  v16 = &v17;
  v7 = v3;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v5, "checkMusicCatalogEligibilityWithProgressReporter:completionHandler:", v6, v13);

  v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9) && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Checking Apple Music Catalog Timeout", v12, 2u);
  }
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __87__PHACachingCPAnalyticsPropertiesTask__hasAppleMusicSubscriptionWithLoggingConnection___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 & a3;
  if ((a2 & 1) == 0)
  {
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_DEFAULT, "[PHACachingCPAnalyticsPropertiesTask] Error checking Apple Music Catalog eligibility (%@)", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (NSString)name
{
  return (NSString *)CFSTR("PHACachingCPAnalyticsPropertiesTask");
}

- (double)period
{
  return 86400.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)priority
{
  return 0;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  void *v4;

  objc_msgSend(a3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHACachingCPAnalyticsPropertiesTask shouldRunWithPhotoLibrary:](self, "shouldRunWithPhotoLibrary:", v4);

  return (char)self;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  return 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[PHACachingCPAnalyticsPropertiesTask runWithPhotoLibrary:analytics:progressReporter:error:](self, "runWithPhotoLibrary:analytics:progressReporter:error:", v11, v12, v8, a5);
  return (char)a5;
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint32_t denom;
  uint32_t numer;
  NSObject *v26;
  NSObject *v27;
  char v28;
  id v29;
  id v30;
  uint64_t v31;
  uint32_t v32;
  uint32_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  float v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v54[18];
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    v12 = os_log_create("com.apple.PhotosGraph", "metrics");
    v13 = os_signpost_id_generate(v12);
    info = 0;
    mach_timebase_info(&info);
    v14 = v12;
    v15 = v14;
    v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CacheCPAnalyticsProperties", ", buf, 2u);
    }

    v17 = mach_absolute_time();
    objc_msgSend(v10, "childProgressReporterFromStart:toEnd:", 0.0, 0.5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHACachingCPAnalyticsPropertiesTask _buildPropertyCacheForPhotoLibrary:loggingConnection:progressReporter:](self, "_buildPropertyCacheForPhotoLibrary:loggingConnection:progressReporter:", v9, v15);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlForApplicationDataFolderIdentifier:", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D09870];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("temp-%@"), *MEMORY[0x1E0D09870]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v18;
    objc_msgSend(v18, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v23 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v26 = v15;
      v27 = v26;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v27, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", ", buf, 2u);
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v54 = "CacheCPAnalyticsProperties";
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = (float)((float)((float)((float)(v23 - v17) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] CPAnalytics TemporaryCacheFile URL is nil", buf, 2u);
      }
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
LABEL_27:
      v11 = 0;
      goto LABEL_76;
    }
    if (objc_msgSend(v10, "isCancelledWithProgress:", 0.6))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v54 = 112;
        *(_WORD *)&v54[4] = 2080;
        *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
        v11 = 0;
        *a6 = v22;
LABEL_76:

        goto LABEL_77;
      }
      goto LABEL_27;
    }
    v51 = 0;
    v46 = v21;
    v28 = objc_msgSend(v49, "writeToURL:error:", v21, &v51);
    v29 = v51;
    if ((v28 & 1) != 0)
    {
      if (objc_msgSend(v10, "isCancelledWithProgress:", 0.7))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 125;
          *(_WORD *)&v54[4] = 2080;
          *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis"
                               "/Framework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
          _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v30 = v29;
        if (a6)
        {
          v21 = v46;
          if (*a6)
          {
            v11 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
            v11 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_75;
        }
        v11 = 0;
        goto LABEL_71;
      }
      objc_msgSend(v48, "URLByAppendingPathComponent:", v19);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v29;
      v45 = (void *)v36;
      LOBYTE(v36) = objc_msgSend(v37, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v36, v46, 0, 1, 0, &v50);
      v44 = v50;

      v38 = (float)((float)((float)(mach_absolute_time() - v17) * (float)info.numer) / (float)info.denom) / 1000000.0;
      v39 = v15;
      v40 = v39;
      if ((v36 & 1) != 0)
      {
        if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CAC16000, v40, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", ", buf, 2u);
        }

        v30 = v44;
        v21 = v46;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v54 = "CacheCPAnalyticsProperties";
          *(_WORD *)&v54[8] = 2048;
          *(double *)&v54[10] = v38;
          _os_log_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Successfully cached CPAnalytics system properties", buf, 2u);
        }
        v41 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
        if (v41)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v54 = 142;
            *(_WORD *)&v54[4] = 2080;
            *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalys"
                                 "is/Framework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
            _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          if (a6 && !*a6)
          {
            objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        v11 = v41 ^ 1;
        v42 = v45;
        goto LABEL_74;
      }
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v40, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", ", buf, 2u);
      }

      v30 = v44;
      v42 = v45;
      v21 = v46;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v54 = "CacheCPAnalyticsProperties";
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = v38;
        _os_log_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v54 = v46;
        *(_WORD *)&v54[8] = 2112;
        *(_QWORD *)&v54[10] = v45;
        v55 = 2112;
        v56 = v44;
        _os_log_error_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Failed replacing %@ to %@, error: %@", buf, 0x20u);
        if (a6)
          goto LABEL_66;
      }
      else if (a6)
      {
LABEL_66:
        v11 = 0;
        *a6 = objc_retainAutorelease(v44);
LABEL_74:

        goto LABEL_75;
      }
      v11 = 0;
      goto LABEL_74;
    }
    v31 = mach_absolute_time();
    v33 = info.numer;
    v32 = info.denom;
    v34 = v15;
    v35 = v34;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v35, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", ", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v54 = "CacheCPAnalyticsProperties";
      *(_WORD *)&v54[8] = 2048;
      *(double *)&v54[10] = (float)((float)((float)((float)(v31 - v17) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v29;
      _os_log_error_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Failed writing cached CPAnalytics properties, error: %@", buf, 0xCu);
      if (a6)
        goto LABEL_43;
    }
    else if (a6)
    {
LABEL_43:
      v30 = objc_retainAutorelease(v29);
      v11 = 0;
      *a6 = v30;
LABEL_71:
      v21 = v46;
LABEL_75:

      goto LABEL_76;
    }
    v11 = 0;
    v30 = v29;
    goto LABEL_71;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v54 = 92;
    *(_WORD *)&v54[4] = 2080;
    *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Frame"
                         "work/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
    _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a6 && !*a6)
  {
    objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_77:

  return v11;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHACachingCPAnalyticsPropertiesTask timeoutFatal:]", "PHACachingCPAnalyticsPropertiesTask.m", 148, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHACachingCPAnalyticsPropertiesTask is stuck", v3, 2u);
  }
}

- (id)_buildPropertyCacheForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "childProgressReporterFromStart:toEnd:", 0.0, 0.3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "_fetchLibrarySummaryForPhotoLibrary:loggingConnection:progressReporter:", v9, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D09690]);
  objc_msgSend((id)objc_opt_class(), "_fetchDemographicsSummaryWithLoggingConnection:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D09680]);

  if (objc_msgSend(v8, "isCancelledWithProgress:", 0.6))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v19 = 67109378;
      v20 = 164;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      v14 = MEMORY[0x1E0C81028];
LABEL_7:
      _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v19, 0x12u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_hasAppleMusicSubscriptionWithLoggingConnection:", v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D09810]);

    if (!objc_msgSend(v8, "isCancelledWithProgress:", 1.0))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D09688]);

      v16 = v11;
      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v19 = 67109378;
      v20 = 167;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_7;
    }
  }
  v16 = (id)MEMORY[0x1E0C9AA70];
LABEL_10:

  return v16;
}

@end
