@implementation RTRadarUtilities

+ (void)promptUserToCreateRadarForAssertionIdentifier:(id)a3 alertMessage:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 handler:(id)a7
{
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFDictionary *v36;
  id v37;
  void *v38;
  const __CFAllocator *v39;
  CFUserNotificationRef v40;
  CFUserNotificationRef v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  const __CFAllocator *v47;
  CFUserNotificationRef v48;
  CFRunLoopSourceRef RunLoopSource;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFRunLoop *Main;
  __CFRunLoopSource *source;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  SInt32 error;
  _QWORD v63[5];
  _QWORD v64[5];
  uint8_t buf[4];
  id v66;
  __int16 v67;
  __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: assertionIdentifier";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_51;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: radarTitle";
    goto LABEL_17;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: radarDescription";
    goto LABEL_17;
  }
  if (v15)
  {
    v17 = objc_opt_new();
    if ((-[NSObject internalInstall](v17, "internalInstall") & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v11;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Suppressing alert for assertion identifier, %@, because we're not on an internal build.", buf, 0xCu);
      }
      goto LABEL_50;
    }
    v18 = objc_opt_new();
    -[NSObject objectForKey:](v18, "objectForKey:", CFSTR("DisabledAssertAlerts"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v11;
        v23 = "Suppressing alert for assertion identifier, %@, because defaults key was set.";
LABEL_23:
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
        goto LABEL_49;
      }
      goto LABEL_49;
    }
    NotificationHandlerMap();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v11;
        v23 = "Suppressing alert for assertion identifier, %@, because an alert is already showing.";
        goto LABEL_23;
      }
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    v58 = v19;
    -[NSObject objectForKey:](v18, "objectForKey:", CFSTR("RecentAssertAlerts"));
    v61 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v61, "objectForKey:", v11);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v28;
    if (v27)
    {
      v29 = v28;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = objc_msgSend(v30, "isDate:inSameDayAsDate:", v27, v29);

      if ((_DWORD)v29)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v31 = objc_claimAutoreleasedReturnValue();
        v59 = v31;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v11;
          v67 = 2112;
          v68 = v27;
          _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "Suppressing alert for assertion identifier, %@, because it was recently shown (on %@).", buf, 0x16u);
        }
        v19 = v58;
        goto LABEL_48;
      }
    }
    v57 = v27;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v11;
      v67 = 2112;
      v68 = v12;
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "Showing alert for assertion identifier, %@, to file a bug with message: \"%@\".", buf, 0x16u);
    }

    v33 = *MEMORY[0x1E0C9B810];
    v63[0] = *MEMORY[0x1E0C9B800];
    v63[1] = v33;
    v34 = CFSTR("You discovered a bug in CoreRoutine. Please file a radar.");
    if (v12)
      v34 = v12;
    v64[0] = CFSTR("CoreRoutine Bug!");
    v64[1] = v34;
    v35 = *MEMORY[0x1E0C9B830];
    v63[2] = *MEMORY[0x1E0C9B838];
    v63[3] = v35;
    v64[2] = CFSTR("File Radar");
    v64[3] = CFSTR("Stop Asking");
    v63[4] = *MEMORY[0x1E0C9B868];
    v64[4] = CFSTR("Dismiss");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 5);
    v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v61)
      v37 = -[NSObject mutableCopy](v61, "mutableCopy");
    else
      v37 = (id)objc_opt_new();
    v38 = v37;
    objc_msgSend(v37, "setObject:forKey:", v60, v11);
    v56 = v38;
    -[NSObject setObject:forKey:](v18, "setObject:forKey:", v38, CFSTR("RecentAssertAlerts"));
    error = 0;
    v39 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v59 = v36;
    v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, &error, v36);
    v19 = v58;
    if (v40)
    {
      v41 = v40;
      if (error)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v66) = error;
          _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "Failed to create CFUserNotificationRef, error %d", buf, 8u);
        }

        CFRelease(v41);
        goto LABEL_47;
      }
      v47 = v39;
      v48 = v41;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v47, v41, (CFUserNotificationCallBack)handleNotificationCallback, 0);
      if (RunLoopSource)
      {
        source = RunLoopSource;
        v50 = (void *)objc_opt_new();
        objc_msgSend(v50, "setObject:forKey:", v11, CFSTR("assertionIdentifier"));
        objc_msgSend(v50, "setObject:forKey:", v13, CFSTR("radarTitle"));
        objc_msgSend(v50, "setObject:forKeyedSubscript:", v14, CFSTR("radarDescription"));
        v51 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v50, "setObject:forKey:", v51, CFSTR("handler"));

        NotificationHandlerMap();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKey:", v50, v53);

        v19 = v58;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, source, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(source);

        goto LABEL_47;
      }
      CFRelease(v41);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v44 = "Failed to create CFRunLoopSourceRef";
        v45 = v43;
        v46 = 2;
        goto LABEL_43;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v59;
        v44 = "Failed to create CFUserNotificationRef for alertOptions: %@.";
        v45 = v43;
        v46 = 12;
LABEL_43:
        _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, v44, buf, v46);
      }
    }

LABEL_47:
    v27 = v57;
LABEL_48:
    v22 = v61;

    goto LABEL_49;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: handler";
    goto LABEL_17;
  }
LABEL_51:

}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "internalInstall"))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v8, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("527926"));
    objc_msgSend(v9, "addObject:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("CoreRoutine"));
    objc_msgSend(v9, "addObject:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("All"));
    objc_msgSend(v9, "addObject:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.CoreRoutine.RTDiagnosticExtension,com.apple.DiagnosticExtensions.Syslog,com.apple.DiagnosticExtensions.CrashLogs"));
    objc_msgSend(v9, "addObject:", v13);

    if (objc_msgSend(v5, "length"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v5);
      objc_msgSend(v9, "addObject:", v14);

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v6);
    objc_msgSend(v9, "addObject:", v15);

    objc_msgSend(v8, "setQueryItems:", v9);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "openURL:configuration:completionHandler:", v17, 0, 0);

    _rt_log_facility_get_os_log(RTLogFacilityRoutineApp);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Radar URL: %@", (uint8_t *)&v19, 0xCu);
    }

  }
}

@end
