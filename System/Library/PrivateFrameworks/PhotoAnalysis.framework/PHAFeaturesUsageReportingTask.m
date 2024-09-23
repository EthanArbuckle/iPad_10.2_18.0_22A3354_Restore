@implementation PHAFeaturesUsageReportingTask

+ (id)_dateFormatter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setTimeStyle:", 0);
  objc_msgSend(v2, "setDateStyle:", 0);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v4);

  return v2;
}

+ (BOOL)shouldReportSettingsWithLoggingConnection:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 24, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "day");
  if (v7 < 15)
  {
    v13 = objc_msgSend(v6, "month");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerForKey:", CFSTR("PHALastSettingsReportMonth"));

    if (v13 != v15)
    {
      v9 = 1;
      goto LABEL_9;
    }
    v9 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109120;
      v18 = v13;
      v10 = "[PHAFeaturesUsageReportingTask] skip settings - already sent this month: %d";
      v11 = v3;
      v12 = 8;
      goto LABEL_7;
    }
  }
  else
  {
    v8 = v7;
    v9 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109376;
      v18 = v8;
      v19 = 1024;
      v20 = 14;
      v10 = "[PHAFeaturesUsageReportingTask] skip settings - day of the month %d > %d";
      v11 = v3;
      v12 = 14;
LABEL_7:
      _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      v9 = 0;
    }
  }
LABEL_9:

  return v9;
}

+ (void)updateLastReportSettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "month");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", v5, CFSTR("PHALastSettingsReportMonth"));
  objc_msgSend(v6, "synchronize");

}

+ (void)_reportAlchemistSettings:(id)a3
{
  id v3;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("EnableAlchemizeButton"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat))objc_msgSend(v3, "sendEvent:withPayload:", CFSTR("com.apple.photos.alchemist.disabled"), MEMORY[0x1E0C9AA70]);

}

+ (void)_reportCameraSharingSettingsWithPhotoLibrary:(id)a3 andAnalytics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Boolean keyExistsAndHasValidFormat;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("CameraSharingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat)|| !keyExistsAndHasValidFormat)
    {
      if (CFPreferencesGetAppBooleanValue(CFSTR("CameraAutoShareEnabled"), CFSTR("com.apple.mobileslideshow"), 0))
        v11 = CFSTR("auto");
      else
        v11 = CFSTR("manual");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("mode"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFPreferencesGetAppBooleanValue(CFSTR("CameraShareFromHomeEnabled"), CFSTR("com.apple.mobileslideshow"), 0) != 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("home"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("disabled"), CFSTR("mode"));
    }
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldPrefetchCount:", 1);
    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("participantsCount"));

    objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.cpa.camera_sharing"), v10);
  }

}

+ (void)_reportSettings:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(a1, "_valueForSetting:withDefaultValue:", CFSTR("shouldModulateImages"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("view_full_hdr"));

  objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.photos.settings"), v7);
}

+ (unsigned)_valueForSetting:(__CFString *)a3 withDefaultValue:(unsigned __int8)a4
{
  unsigned __int8 result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(a3, CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return a4;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAFeaturesUsageReportingTask");
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
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  void *v4;

  objc_msgSend(a3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHAFeaturesUsageReportingTask shouldRunWithPhotoLibrary:](self, "shouldRunWithPhotoLibrary:", v4);

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

  LOBYTE(a5) = -[PHAFeaturesUsageReportingTask runWithPhotoLibrary:analytics:progressReporter:error:](self, "runWithPhotoLibrary:analytics:progressReporter:error:", v11, v12, v8, a5);
  return (char)a5;
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  BOOL v60;
  __int128 v62;
  id *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  int v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id obj;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  _BYTE v90[18];
  __int16 v91;
  double v92;
  __int16 v93;
  _BOOL4 v94;
  __int16 v95;
  _BOOL4 v96;
  __int16 v97;
  _BOOL4 v98;
  __int16 v99;
  uint64_t v100;
  _QWORD v101[4];
  _QWORD v102[4];
  _BYTE v103[128];
  const __CFString *v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = os_log_create("com.apple.PhotosGraph", "metrics");
  if (objc_msgSend(v10, "isSystemPhotoLibrary")
    && objc_msgSend((id)objc_opt_class(), "shouldReportSettingsWithLoggingConnection:", v13))
  {
    v104 = CFSTR("featured_content_allowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PLIsFeaturedContentAllowed());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.photos.cpa.featured_content"), v15);

    objc_msgSend((id)objc_opt_class(), "_reportCameraSharingSettingsWithPhotoLibrary:andAnalytics:", v10, v11);
    objc_msgSend((id)objc_opt_class(), "_reportSettings:", v11);
    objc_msgSend((id)objc_opt_class(), "updateLastReportSettings");
  }
  -[PHAFeaturesUsageReportingTask _libraryScopedWorkerFeaturesUsageForLibrary:loggingConnection:error:](self, "_libraryScopedWorkerFeaturesUsageForLibrary:loggingConnection:error:", v10, v13, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "_dateFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v66 = (void *)v20;
      objc_msgSend(v18, "dateFromString:", v20);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("firstSeenDates_V2"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v17;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("lastSeenDates_v2"));
      v79 = objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v77 = v21;
      objc_msgSend(v21, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);

      v67 = v24;
      if (objc_msgSend(v24, "count"))
      {
        v63 = a6;
        objc_msgSend(v24, "pha_shuffle");
        v25 = v24;
        v26 = objc_msgSend(v24, "count");
        v74 = v11;
        objc_msgSend(v11, "systemProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = *MEMORY[0x1E0D09810];
        objc_msgSend(v27, "propertyForKey:forEventName:payloadForSystemPropertyExtraction:");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        obj = v25;
        v28 = (void *)v79;
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
        if (v83)
        {
          v75 = 0;
          v30 = 1.0 / (double)v26;
          v82 = *(_QWORD *)v86;
          v31 = 0.0;
          *(_QWORD *)&v29 = 138412546;
          v62 = v29;
          v64 = v10;
          v71 = v13;
          v72 = v12;
          v70 = v18;
LABEL_9:
          v32 = 0;
          v33 = v77;
          while (1)
          {
            if (*(_QWORD *)v86 != v82)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v32);
            if (objc_msgSend(v12, "isCancelledWithProgress:", v31, v62))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v90 = 174;
                *(_WORD *)&v90[4] = 2080;
                *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAn"
                                     "alysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAFeaturesUsageReportingTask.m";
                _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v10 = v64;
              v11 = v74;
              v59 = v66;
              if (v63 && !*v63)
              {
                objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
                *v63 = (id)objc_claimAutoreleasedReturnValue();
              }

              v60 = 0;
              goto LABEL_71;
            }
            objc_msgSend(v33, "objectForKeyedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v90 = v34;
                _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, missing first seen date", buf, 0xCu);
              }
              goto LABEL_51;
            }
            objc_msgSend(v18, "dateFromString:", v35);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v84)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v90 = v34;
                _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, first seen date format is invalid", buf, 0xCu);
              }
              goto LABEL_50;
            }
            if (v36)
            {
              objc_msgSend(v18, "dateFromString:", v36);
              v37 = objc_claimAutoreleasedReturnValue();
              if (!v37)
              {
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v90 = v34;
                  _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, last seen date format is invalid", buf, 0xCu);
                }
                v38 = 0;
                goto LABEL_49;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v90 = v34;
                _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - no last seen date, using distant past", buf, 0xCu);
              }
            }
            objc_msgSend(v78, "timeIntervalSinceDate:", v84);
            v40 = v39 / 86400.0;
            v80 = (void *)v37;
            objc_msgSend(v78, "timeIntervalSinceDate:", v37);
            v42 = v41;
            v43 = objc_msgSend(v34, "hasPrefix:", CFSTR("com.apple.photos.cpa.active_user_feature."));
            if ((v43 & 1) != 0)
              break;
            if (PFOSVariantHasInternalDiagnostics())
              v58 = 7.0;
            else
              v58 = 30.0;
            if (v40 <= v58)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v62;
                *(_QWORD *)v90 = v34;
                *(_WORD *)&v90[8] = 2048;
                *(double *)&v90[10] = v58;
                _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature: [%@] - skip generic active_user_feature event, not seen for %f days", buf, 0x16u);
              }
            }
            else if (v75 <= 9)
            {
              break;
            }
            v28 = (void *)v79;
LABEL_48:
            v38 = v80;
LABEL_49:

LABEL_50:
LABEL_51:
            v31 = v30 + v31;

            if (v83 == ++v32)
            {
              v10 = v64;
              v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
              if (v83)
                goto LABEL_9;
              goto LABEL_53;
            }
          }
          v76 = v43;
          v44 = v42 / 86400.0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40 / 7.0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "integerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40 / 30.0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "integerValue");

          v49 = objc_alloc(MEMORY[0x1E0C99E08]);
          v102[0] = v34;
          v101[0] = CFSTR("cpa_feature_name");
          v101[1] = CFSTR("cpa_feature_daily");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44 <= 1.0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v102[1] = v50;
          v101[2] = CFSTR("cpa_feature_total_weeks");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v102[2] = v51;
          v101[3] = CFSTR("cpa_feature_total_months");
          v73 = v48;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v102[3] = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 4);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v49, "initWithDictionary:", v53);

          if (v40 >= 7.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44 <= 7.0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, CFSTR("cpa_feature_weekly"));

          }
          v13 = v71;
          if (v40 >= 30.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44 <= 30.0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v56, CFSTR("cpa_feature_monthly"));

          }
          v12 = v72;
          v33 = v77;
          if (v76)
          {
            objc_msgSend(v34, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.photos.cpa.active_user_feature."), "length"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v57, CFSTR("cpa_feature_name"));

            objc_msgSend(v54, "setObject:forKeyedSubscript:", v69, v65);
            objc_msgSend(v74, "sendEvent:withPayload:", v34, v54);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v90 = v34;
              _os_log_impl(&dword_1CAC16000, v71, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - report dedicated active_user_feature event", buf, 0xCu);
            }
            v28 = (void *)v79;
          }
          else
          {
            objc_msgSend(v74, "sendEvent:withPayload:", CFSTR("com.apple.photos.cpa.active_user_feature"), v54);
            v28 = (void *)v79;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413826;
              *(_QWORD *)v90 = v34;
              *(_WORD *)&v90[8] = 2048;
              *(double *)&v90[10] = v40;
              v91 = 2048;
              v92 = v44;
              v93 = 1024;
              v94 = v44 <= 1.0;
              v95 = 1024;
              v96 = v44 <= 7.0;
              v97 = 1024;
              v98 = v44 <= 30.0;
              v99 = 2048;
              v100 = v73;
              _os_log_impl(&dword_1CAC16000, v71, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - f[%f], l[%f], reporting: d[%d], w[%d], m[%d], tm[%ld]", buf, 0x3Cu);
            }
            ++v75;
          }

          v18 = v70;
          goto LABEL_48;
        }
LABEL_53:

        if (objc_msgSend(v12, "isCancelledWithProgress:", 1.0))
        {
          v59 = v66;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v90 = 262;
            *(_WORD *)&v90[4] = 2080;
            *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalys"
                                 "is/Framework/Storytelling/Tasks/AnalyticsTasks/PHAFeaturesUsageReportingTask.m";
            _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v74;
          if (v63 && !*v63)
          {
            objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
            v60 = 0;
            *v63 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v60 = 0;
          }
          v28 = (void *)v79;
        }
        else
        {
          v60 = 1;
          v11 = v74;
          v59 = v66;
        }
LABEL_71:

      }
      else
      {
        v60 = 1;
        v59 = v66;
        v28 = (void *)v79;
      }

      v17 = v68;
    }
    else
    {
      v60 = 1;
    }
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAFeaturesUsageReportingTask timeoutFatal:]", "PHAFeaturesUsageReportingTask.m", 268, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAFeaturesUsageReportingTask is stuck", v3, 2u);
  }
}

- (BOOL)recordFeatureUsageFromCounts:(id)a3 forPhotoLibrary:(id)a4 loggingConnection:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *oslog;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  oslog = a5;
  if (objc_msgSend(v10, "count"))
  {
    -[PHAFeaturesUsageReportingTask _libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:](self, "_libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend((id)objc_opt_class(), "_dateFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v15;
      objc_msgSend(v13, "dateFromString:", v15);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        -[PHAFeaturesUsageReportingTask _libraryScopedWorkerFeaturesUsageForLibrary:loggingConnection:error:](self, "_libraryScopedWorkerFeaturesUsageForLibrary:loggingConnection:error:", v11, oslog, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("firstSeenDates_V2"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("lastSeenDates_v2"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v19 = objc_msgSend(v17, "mutableCopy");
        else
          v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
        v21 = (void *)v19;
        if (v18)
          v22 = objc_msgSend(v18, "mutableCopy");
        else
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
        v49 = (void *)v22;
        if (v21 && v22)
        {
          v46 = v18;
          v47 = v17;
          v43 = v16;
          v44 = v12;
          v41 = a6;
          v42 = v10;
          v45 = v11;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v23 = v10;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v53;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v53 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                objc_msgSend(v21, "objectForKeyedSubscript:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "dateFromString:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v30 || (objc_msgSend(v30, "timeIntervalSinceDate:", v48), v31 > 0.0))
                {
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v28;
                    _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_INFO, "Feature [%@] - set first seen", buf, 0xCu);
                  }
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v50, v28);
                }
                objc_msgSend(v23, "objectForKeyedSubscript:", v28);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "integerValue");

                if (v33 >= 1)
                {
                  objc_msgSend(v49, "objectForKeyedSubscript:", v28);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "dateFromString:", v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v35 || (objc_msgSend(v35, "timeIntervalSinceDate:", v48), v36 != 0.0))
                  {
                    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v59 = v28;
                      _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "Feature [%@] - set last seen", buf, 0xCu);
                    }
                    objc_msgSend(v49, "setObject:forKeyedSubscript:", v50, v28);
                  }

                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            }
            while (v25);
          }

          v17 = v47;
          v18 = v46;
          if (objc_msgSend(v47, "isEqualToDictionary:", v21)
            && (objc_msgSend(v46, "isEqualToDictionary:", v49) & 1) != 0)
          {
            v20 = 1;
            v10 = v42;
            v12 = v44;
            v11 = v45;
          }
          else
          {
            v56[0] = CFSTR("firstSeenDates_V2");
            v56[1] = CFSTR("lastSeenDates_v2");
            v57[0] = v21;
            v57[1] = v49;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v37, 100, 0, v41);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            v12 = v44;
            v11 = v45;
            if (v38)
              v20 = objc_msgSend(v38, "writeToURL:options:error:", v44, 1073741825, v41);
            else
              v20 = 0;
            v10 = v42;

          }
          v16 = v43;
        }
        else if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, CFSTR("Update feature usage - first or last seen dates are nil"));
          v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }

      }
      else if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, CFSTR("Update feature usage - today's day is nil"));
        v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }

    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 9, CFSTR("Update feature usage - featuresURL is nil"));
      v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (id)_libraryScopedWorkerFeaturesUsageForLibrary:(id)a3 loggingConnection:(id)a4 error:(id *)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PHAFeaturesUsageReportingTask _libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:](self, "_libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (objc_msgSend(v11, "code") == 260)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_DEFAULT, "[PHAFeaturesUsageReportingTask] Cannot find feature usage file at path %@, error: %@", buf, 0x16u);
      }
      v12 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      v12 = v10;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "urlForApplicationDataFolderIdentifier:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  }
  else
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_1505);
    v6 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_ERROR, "Error: no persistentStorageDirectoryURL photoLibrary = %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("PhotoAnalysisServiceFeaturesAnalytics.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __85__PHAFeaturesUsageReportingTask__libraryScopedWorkerFeaturesUsageURLForPhotoLibrary___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
