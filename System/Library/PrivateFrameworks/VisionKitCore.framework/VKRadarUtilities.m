@implementation VKRadarUtilities

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
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("DisableAssertAlert"));

  if (v12)
  {
    v13 = os_log_create("com.apple.VisionKit", "Assert");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v21 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:].cold.2((uint64_t)v8, v21);

    v22 = *MEMORY[0x1E0C9B810];
    v31[0] = *MEMORY[0x1E0C9B800];
    v31[1] = v22;
    v23 = &stru_1E94661A8;
    if (v8)
      v23 = v8;
    v32[0] = CFSTR("Internal Notes Bug");
    v32[1] = v23;
    v24 = *MEMORY[0x1E0C9B830];
    v31[2] = *MEMORY[0x1E0C9B838];
    v31[3] = v24;
    v32[2] = CFSTR("File Radar");
    v32[3] = CFSTR("Stop Asking");
    v31[4] = *MEMORY[0x1E0C9B868];
    v32[4] = CFSTR("Cancel");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
    block[3] = &unk_1E9464198;
    v27 = v25;
    v30 = a1;
    v28 = v9;
    v29 = v10;
    v13 = v25;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  __CFUserNotification *v3;
  __CFUserNotification *v4;
  NSObject *v5;
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
  CFOptionFlags responseFlags;

  v2 = (uint64_t *)(a1 + 32);
  v3 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, *(CFDictionaryRef *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v3, 604800.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      v6 = os_log_create("com.apple.VisionKit", "Assert");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);

      v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(v14);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBool:forKey:", 1, CFSTR("DisableAssertAlert"));

    }
    else if ((responseFlags & 3) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "createRadarWithTitle:description:componentName:componentVersion:componentID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("Notes"), CFSTR("iOS"), CFSTR("568784"));
    }
    CFRelease(v4);
  }
  else
  {
    v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v2, v5);

  }
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  objc_msgSend(a1, "createRadarWithTitle:description:componentName:componentVersion:componentID:keywordIDs:attachmentURLs:includeSysdiagnose:", a3, a4, a5, a6, a7, 0, 0, v7);
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywordIDs:(id)a8 attachmentURLs:(id)a9 includeSysdiagnose:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v62 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v60 = a9;
  v20 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v20, "setScheme:", CFSTR("tap-to-radar"));
  v58 = v20;
  objc_msgSend(v20, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), v16);
  objc_msgSend(v21, "addObject:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), v17);
  objc_msgSend(v21, "addObject:", v23);

  v61 = v18;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), v18);
  objc_msgSend(v21, "addObject:", v24);

  v25 = objc_alloc(MEMORY[0x1E0CB39D8]);
  if (a10)
    v26 = CFSTR("sysdiagnose-only");
  else
    v26 = CFSTR("-1");
  v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("AutoDiagnostics"), v26);
  objc_msgSend(v21, "addObject:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v21, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v21, "addObject:", v29);

  if (objc_msgSend(v15, "length"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v15);
    objc_msgSend(v21, "addObject:", v30);

  }
  v31 = v15;
  v32 = v17;
  v33 = v16;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v62);
  objc_msgSend(v21, "addObject:", v34);

  if (objc_msgSend(v19, "count"))
  {
    v35 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v36 = v19;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v35, "initWithName:value:", CFSTR("Keywords"), v37);
    objc_msgSend(v21, "addObject:", v38);

    v19 = v36;
  }
  v39 = v60;
  v41 = v61;
  v40 = v62;
  v59 = v31;
  if (objc_msgSend(v60, "count"))
  {
    v56 = v19;
    v57 = v33;
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v60, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v43 = v60;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v64 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringByAddingPercentEncodingWithAllowedCharacters:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v50);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v45);
    }

    objc_msgSend(v42, "componentsJoinedByString:", CFSTR(","));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Attachments"), v51);
    objc_msgSend(v21, "addObject:", v52);

    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("DeleteOnAttach"), CFSTR("1"));
    objc_msgSend(v21, "addObject:", v53);

    v41 = v61;
    v40 = v62;
    v33 = v57;
    v19 = v56;
    v39 = v60;
  }
  objc_msgSend(v58, "setQueryItems:", v21);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "URL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "openURL:configuration:completionHandler:", v55, 0, 0);

}

+ (void)promptUserToFileBugWithAlertMessage:(uint64_t)a3 bugTitle:(uint64_t)a4 bugDescription:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D2E0D000, a1, a3, "Not showing alert for assertion because defaults key was set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)promptUserToFileBugWithAlertMessage:(uint64_t)a1 bugTitle:(NSObject *)a2 bugDescription:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_DEBUG, "Showing alert to file a bug with message: \"%@\", (uint8_t *)&v2, 0xCu);
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Failed to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&v3, 0xCu);
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D2E0D000, a1, a3, "User decided to disable the assertion alerts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
