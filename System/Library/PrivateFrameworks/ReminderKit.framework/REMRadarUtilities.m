@implementation REMRadarUtilities

+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (+[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("DisableAssertAlert"));

    if (v12)
    {
      +[REMLog utility](REMLog, "utility");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[REMRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v21 = *MEMORY[0x1E0C9B810];
      v30[0] = *MEMORY[0x1E0C9B800];
      v30[1] = v21;
      v22 = &stru_1E67FB1F0;
      if (v8)
        v22 = v8;
      v31[0] = CFSTR("Internal Reminders Bug");
      v31[1] = v22;
      v23 = *MEMORY[0x1E0C9B830];
      v30[2] = *MEMORY[0x1E0C9B838];
      v30[3] = v23;
      v31[2] = CFSTR("File Radar");
      v31[3] = CFSTR("Stop Asking");
      v30[4] = *MEMORY[0x1E0C9B868];
      v31[4] = CFSTR("Cancel");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
      block[3] = &unk_1E67F9D68;
      v26 = v24;
      v29 = a1;
      v27 = v9;
      v28 = v10;
      v13 = v24;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  __CFUserNotification *v2;
  __CFUserNotification *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  SInt32 error;
  CFOptionFlags responseFlags;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  error = 0;
  v2 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v2, 604800.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      +[REMLog utility](REMLog, "utility");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);

      +[REMLog utility](REMLog, "utility");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v14);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBool:forKey:", 1, CFSTR("DisableAssertAlert"));

    }
    else if ((responseFlags & 3) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "createRadarWithTitle:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    CFRelease(v3);
  }
  else
  {
    +[REMLog utility](REMLog, "utility");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      LODWORD(responseFlags) = 67109378;
      HIDWORD(responseFlags) = error;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_INFO, "Failed [%d] to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&responseFlags, 0x12u);
    }

  }
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
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
  void *v18;
  id v19;

  v19 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v7, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Reminders"));
  objc_msgSend(v8, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v8, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("964249"));
  objc_msgSend(v8, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  objc_msgSend(v8, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v8, "addObject:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v8, "addObject:", v14);

  if (objc_msgSend(v19, "length"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v19);
    objc_msgSend(v8, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v6);

  objc_msgSend(v8, "addObject:", v16);
  objc_msgSend(v7, "setQueryItems:", v8);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openURL:configuration:completionHandler:", v18, 0, 0);

}

+ (void)promptUserToFileBugWithAlertMessage:(uint64_t)a3 bugTitle:(uint64_t)a4 bugDescription:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, a1, a3, "Not showing alert for assertion because defaults key was set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
  OUTLINED_FUNCTION_7();
}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, a1, a3, "User decided to disable the assertion alerts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
