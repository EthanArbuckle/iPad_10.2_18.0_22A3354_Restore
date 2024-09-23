id getLPLinkMetadataClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLPLinkMetadataClass_softClass_1;
  v7 = getLPLinkMetadataClass_softClass_1;
  if (!getLPLinkMetadataClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLPLinkMetadataClass_block_invoke_1;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E41A9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2)
{
  return a2;
}

Class __getFBDisplayManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  FrontBoardLibrary();
  result = objc_getClass("FBDisplayManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFBDisplayManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getFBDisplayManagerClass_block_invoke_cold_1();
    return (Class)__getFBDisplayManagerClass_block_invoke_0(v3);
  }
  return result;
}

void __getFBDisplayManagerClass_block_invoke_0(uint64_t a1)
{
  FrontBoardLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FBDisplayManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFBDisplayManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFBDisplayManagerClass_block_invoke_cold_1();
    FrontBoardLibrary();
  }
}

void FrontBoardLibrary()
{
  void *v0;

  if (!FrontBoardLibraryCore_frameworkLibrary)
    FrontBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void FrontBoardLibrary_0()
{
  void *v0;

  if (!FrontBoardLibraryCore_frameworkLibrary_0)
    FrontBoardLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!FrontBoardLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void initSFUILinkMetadataSerializationForLocalUseOnly(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (SharingUILibraryCore_frameworkLibrary)
  {
    v5 = (void *)SharingUILibraryCore_frameworkLibrary;
  }
  else
  {
    SharingUILibraryCore_frameworkLibrary = _sl_dlopen();
    v5 = (void *)SharingUILibraryCore_frameworkLibrary;
    if (!SharingUILibraryCore_frameworkLibrary)
    {
      v6 = (void *)abort_report_np();
      free(v6);
    }
  }
  softLinkSFUILinkMetadataSerializationForLocalUseOnly = (uint64_t (*)())dlsym(v5, "SFUILinkMetadataSerializationForLocalUseOnly");
  ((void (*)(id, id))softLinkSFUILinkMetadataSerializationForLocalUseOnly)(v3, v4);

}

uint64_t SHSheetIsCollaborationItemEligibleForActivity(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if ((!v4 || objc_msgSend((id)objc_opt_class(), "activityCategory") == 1 || (objc_opt_respondsToSelector() & 1) != 0)
    && !objc_msgSend(v3, "type"))
  {
    v6 = v3;
    if ((objc_msgSend(v6, "isiCloudDrive") & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v6, "isCollaborativeURL"))
    {
      objc_msgSend(v4, "activityType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message"));

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

id SHSheetCollaborativeItemNotSupportedAlertController(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = a1;
  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move to iCloud Title"), CFSTR("Move to iCloud"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Move to iCloud Body"), CFSTR("This item isn't stored in iCloud. You'll need to move it to iCloud or another supported cloud source before you can collaborate."), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Move to iCloud OK"), CFSTR("OK"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v6, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 1, &__block_literal_global);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  return v9;
}

id SHSheetModeRestrictionAlertController(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "alertTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v5, "alertDismissButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __SHSheetModeRestrictionAlertController_block_invoke;
  v29[3] = &unk_1E40012D0;
  v15 = v7;
  v30 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  objc_msgSend(v5, "alertRecoverySuggestionButtonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(v5, "alertRecoverySuggestionButtonTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    v23 = 3221225472;
    v24 = __SHSheetModeRestrictionAlertController_block_invoke_2;
    v25 = &unk_1E40012F8;
    v26 = v5;
    v27 = v6;
    v28 = v15;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v20, v22, v23, v24, v25);

  }
  return v11;
}

void _UIDICArchiveEnumerateFilePaths(void *a1, void *a2, char a3)
{
  objc_class *v5;
  void (**v6)(id, id, id);
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = (objc_class *)MEMORY[0x1E0DC4018];
  v6 = a2;
  v7 = a1;
  v8 = [v5 alloc];
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithArchivePath:", v9);
  objc_msgSend(v10, "setExcludeDotFilesFromResults:", a3 & 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___UIDICArchiveEnumerateFilePaths_block_invoke;
  v15[3] = &unk_1E4001320;
  v16 = v11;
  v12 = v11;
  objc_msgSend(v10, "enumerateLogicalItemsWithBlock:error:", v15, &v14);
  v13 = v14;
  v6[2](v6, v12, v13);

}

void _UIDICArchiveExtractArchiveSubpathToRoot(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, void *, void *, id);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int shouldExcludePath;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  _BYTE buf[24];
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    objc_msgSend(v10, "path");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  else
  {
    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v17;
    v13 = v12;
  }
  v18 = objc_alloc(MEMORY[0x1E0DC4010]);
  objc_msgSend(v8, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithSourceArchivePath:destinationExtractionRootPath:", v19, v12);

  objc_msgSend(v20, "setSourceArchiveExtractionRootPath:", v9);
  v48 = 0;
  v21 = objc_msgSend(v20, "extractArchiveContent:", &v48);
  v22 = v48;
  v47 = v8;
  if (!v21)
    goto LABEL_7;
  if (!v9)
  {
    v42 = v10;
    v43 = v20;
    objc_msgSend(v8, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingPathExtension");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pathExtension");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lowercaseString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v33;
    if (objc_msgSend(v33, "length"))
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___payloadItemURLByExtensionMatchingHeuristicInExtractionController_block_invoke;
      v50 = &unk_1E4001348;
      v52 = a5;
      v51 = v33;
      objc_msgSend(v43, "extractedContentAbsolutePathsMatchingPredicate:", buf);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      v8 = v47;

      v34 = v33;
    }
    else
    {
      v25 = 0;
      v8 = v47;
    }

    v10 = v42;
    if (v25)
      goto LABEL_25;
    v44 = (void *)objc_opt_new();
    objc_msgSend(v44, "contentsOfDirectoryAtPath:error:", v12, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count") == 1
      && (objc_msgSend(v37, "firstObject"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          shouldExcludePath = _shouldExcludePath(v38, a5),
          v38,
          v8 = v47,
          !shouldExcludePath))
    {
      v40 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v37, "firstObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", v46);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fileURLWithPath:", v41);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v47;
      if (v25)
        goto LABEL_25;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_7;
LABEL_25:
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    goto LABEL_28;
  }
  v23 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fileURLWithPath:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v47;
  if (v25)
    goto LABEL_25;
LABEL_7:
  share_sheet_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_DEFAULT, "ERROR: Unable to load archive: %@ (extraction subpath = %@)", buf, 0x16u);

    v8 = v47;
  }

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeItemAtPath:error:", v13, 0);

    v8 = v47;
    v29 = 0;
    v25 = 0;
    v13 = 0;
  }
  else
  {
    v29 = 0;
    v25 = 0;
  }
LABEL_28:
  v11[2](v11, v25, v29, v22);

}

uint64_t _shouldExcludePath(void *a1, char a2)
{
  void *v3;
  uint64_t v4;

  if ((a2 & 1) == 0)
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("."));

  return v4;
}

BOOL ___payloadItemURLByExtensionMatchingHeuristicInExtractionController_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v5 = a2;
  if ((_shouldExcludePath(v5, *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    v6 = *a3 != 0;
  }

  return v6;
}

void sub_19E41FF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E420178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationFooterViewModelClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SocialLayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SLCollaborationFooterViewModel");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSLCollaborationFooterViewModelClass_block_invoke_cold_1();
    free(v3);
  }
  getSLCollaborationFooterViewModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLPLinkMetadataClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LinkPresentationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LPLinkMetadata");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLPLinkMetadataClass_block_invoke_cold_1();
    free(v3);
  }
  getLPLinkMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SHSheetContentSectionTypeDescription(char a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a1 & 1) != 0)
  {
    _SHSheetAddContentSectionTypeToDescription(CFSTR("SHSheetContentSectionTypeCustomView"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = 0;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    _SHSheetAddContentSectionTypeToDescription(CFSTR("SHSheetContentSectionTypePeople"), v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
LABEL_6:
  if ((a1 & 4) == 0)
  {
    if ((a1 & 8) == 0)
      goto LABEL_8;
LABEL_12:
    _SHSheetAddContentSectionTypeToDescription(CFSTR("SHSheetContentSectionTypeActions"), v2);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
    if ((a1 & 0x10) == 0)
      return v2;
    goto LABEL_9;
  }
  _SHSheetAddContentSectionTypeToDescription(CFSTR("SHSheetContentSectionTypeApps"), v2);
  v6 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)v6;
  if ((a1 & 8) != 0)
    goto LABEL_12;
LABEL_8:
  if ((a1 & 0x10) != 0)
  {
LABEL_9:
    _SHSheetAddContentSectionTypeToDescription(CFSTR("SHSheetContentSectionTypeActionsHero"), v2);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

id _SHSheetAddContentSectionTypeToDescription(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("|"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
    {
      v6 = &stru_1E4004990;
      goto LABEL_6;
    }
    v5 = objc_msgSend(v4, "copy");
  }
  v6 = (__CFString *)v5;
LABEL_6:
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_19E422B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_19E42539C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E426194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _convertToSingleLine(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "newlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

Class __getSFUIActivityImageProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingUILibraryCore_frameworkLibrary_0)
  {
    SharingUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SharingUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFUIActivityImageProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFUIActivityImageProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getSFUIActivityImageProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E429414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPLinkMetadataClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    LinkPresentationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!LinkPresentationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LPLinkMetadata");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLPLinkMetadataClass_block_invoke_cold_1();
    free(v3);
  }
  getLPLinkMetadataClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E429D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E42A854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initMCProfileConnection()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_34);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

Class initWKWebView()
{
  Class result;

  if (WebKitLibrary_sOnce != -1)
    dispatch_once(&WebKitLibrary_sOnce, &__block_literal_global_37);
  result = objc_getClass("WKWebView");
  classWKWebView = (uint64_t)result;
  getWKWebViewClass = (uint64_t (*)())WKWebViewFunction;
  return result;
}

id WKWebViewFunction()
{
  return (id)classWKWebView;
}

Class initSFAddToHomeScreenViewController()
{
  Class result;

  if (SafariServicesLibrary_sOnce != -1)
    dispatch_once(&SafariServicesLibrary_sOnce, &__block_literal_global_40);
  result = objc_getClass("SFAddToHomeScreenViewController");
  classSFAddToHomeScreenViewController = (uint64_t)result;
  getSFAddToHomeScreenViewControllerClass = (uint64_t (*)())SFAddToHomeScreenViewControllerFunction;
  return result;
}

id SFAddToHomeScreenViewControllerFunction()
{
  return (id)classSFAddToHomeScreenViewController;
}

void sub_19E42B6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSFUIShareSheetRemoteSettingsHelperClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSFUIShareSheetRemoteSettingsHelperClass_softClass;
  v7 = getSFUIShareSheetRemoteSettingsHelperClass_softClass;
  if (!getSFUIShareSheetRemoteSettingsHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E42E32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingUILibraryCore_frameworkLibrary_1)
  {
    SharingUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!SharingUILibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFUIShareSheetRemoteSettingsHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFUIShareSheetRemoteSettingsHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getSFUIShareSheetRemoteSettingsHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getSFUIShareSheetActivityCellSpecClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSFUIShareSheetActivityCellSpecClass_softClass;
  v7 = getSFUIShareSheetActivityCellSpecClass_softClass;
  if (!getSFUIShareSheetActivityCellSpecClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSFUIShareSheetActivityCellSpecClass_block_invoke;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getSFUIShareSheetActivityCellSpecClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E431048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E433290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4333C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E433540(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetActivityCellSpecClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingUILibraryCore_frameworkLibrary_2)
  {
    SharingUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!SharingUILibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFUIShareSheetActivityCellSpec");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1();
    free(v3);
  }
  getSFUIShareSheetActivityCellSpecClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E437240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _cacheKeyWithMatchingAttributes(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtensionPointName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = v5;
  if (v2)
  {
    v21 = v3;
    v22 = v5;
    v23 = v2;
    v24 = v1;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("extensionItems"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "objectForKeyedSubscript:", CFSTR("attachments"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "objectForKeyedSubscript:", CFSTR("registeredTypeIdentifiers"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObjectsFromArray:", v16);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    v2 = v23;
    v1 = v24;
    v3 = v21;
    v6 = v22;
  }
  objc_msgSend(v4, "sortUsingSelector:", sel_caseInsensitiveCompare_);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v17);

  objc_msgSend(v6, "appendString:", CFSTR("/"));
  if (v3)
  {
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR("|"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v19);

  }
  return v6;
}

void sub_19E4378D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E437BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

_UIMatchingExtensionsResult *_syncGetExtensionsResultWithMatchingAttributes(void *a1, int a2, const void *a3)
{
  id v5;
  _UIMatchingExtensionsResult *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = objc_alloc_init(_UIMatchingExtensionsResult);
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Started extension discovery", buf, 2u);
  }

  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, a3);

  if (a2)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      v11 = "PreheatInitialExtensionDiscovery";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_19E419000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, v11, " enableTelemetry=YES ", buf, 2u);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    v11 = "InitialExtensionDiscovery";
    goto LABEL_10;
  }

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v5, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v22;
  -[_UIMatchingExtensionsResult setExtensions:](v6, "setExtensions:", v12);

  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, a3);

  if (a2)
  {
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      v17 = "PreheatInitialExtensionDiscovery";
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_19E419000, v14, OS_SIGNPOST_INTERVAL_END, v16, v17, " enableTelemetry=YES ", buf, 2u);
    }
  }
  else if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    v17 = "InitialExtensionDiscovery";
    goto LABEL_18;
  }

  share_sheet_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIMatchingExtensionsResult extensions](v6, "extensions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134349056;
    v24 = v20;
    _os_log_impl(&dword_19E419000, v18, OS_LOG_TYPE_DEFAULT, "Finished extension discovery (matched %{public}ld extensions)", buf, 0xCu);

  }
  -[_UIMatchingExtensionsResult setError:](v6, "setError:", v13);

  return v6;
}

void sub_19E438428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
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

void *__getDMPerformMigrationIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (DataMigrationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
  }
  else
  {
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
    if (!DataMigrationLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "DMPerformMigrationIfNeeded");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getDMPerformMigrationIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E438D64(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, uint64_t a15, __int128 a16)
{
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;

  if (a2)
  {
    if (a2 == 2)
    {
      v16 = objc_begin_catch(a1);
      share_sheet_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "name");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reason");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 136447234;
        *(_QWORD *)((char *)&buf + 4) = "-[UIMailActivity _saveDraft:]";
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v18;
        a14 = 2114;
        LOWORD(a16) = 2114;
        *(_QWORD *)((char *)&a16 + 2) = v19;
        WORD5(a16) = 2114;
        *(_QWORD *)((char *)&a16 + 12) = v20;
        _os_log_error_impl(&dword_19E419000, v17, OS_LOG_TYPE_ERROR, "%{public}s: Warning: Exception %{public}@ trying to archive mail draft identifier %{public}@: %{public}@.\nUser info = %{public}@", (uint8_t *)&buf, 0x34u);

      }
      objc_end_catch();
      JUMPOUT(0x19E438D0CLL);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x19E438D10);
  }
  _Unwind_Resume(a1);
}

void sub_19E439260(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19E43ADA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

Class initMFMailComposeViewController()
{
  Class result;

  if (MessageUILibrary_sOnce != -1)
    dispatch_once(&MessageUILibrary_sOnce, &__block_literal_global_7);
  result = objc_getClass("MFMailComposeViewController");
  classMFMailComposeViewController = (uint64_t)result;
  getMFMailComposeViewControllerClass = (uint64_t (*)())MFMailComposeViewControllerFunction;
  return result;
}

id MFMailComposeViewControllerFunction()
{
  return (id)classMFMailComposeViewController;
}

Class initMCProfileConnection_0()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce_0 != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce_0, &__block_literal_global_278);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_0 = (uint64_t)result;
  getMCProfileConnectionClass_0 = (uint64_t (*)())MCProfileConnectionFunction_0;
  return result;
}

id MCProfileConnectionFunction_0()
{
  return (id)classMCProfileConnection_0;
}

uint64_t initQLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = QuickLookLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_281);
  softLinkQLTypeCopyUTIForURLAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyUTIForURLAndMimeType");
  v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType)(v5, v4);

  return v6;
}

uint64_t initQLTypeCopyBestMimeTypeForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = QuickLookLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_281);
  softLinkQLTypeCopyBestMimeTypeForURLAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyBestMimeTypeForURLAndMimeType");
  v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyBestMimeTypeForURLAndMimeType)(v5, v4);

  return v6;
}

uint64_t initQLTypeCopyBestMimeTypeForFileNameAndMimeType(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = QuickLookLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&QuickLookLibrary_sOnce, &__block_literal_global_281);
  softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib, "QLTypeCopyBestMimeTypeForFileNameAndMimeType");
  v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType)(v5, v4);

  return v6;
}

id initValMCFeatureAccountModificationAllowed()
{
  id *v0;

  if (ManagedConfigurationLibrary_sOnce_0 != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce_0, &__block_literal_global_278);
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib_0, "MCFeatureAccountModificationAllowed");
  if (v0)
    objc_storeStrong((id *)&constantValMCFeatureAccountModificationAllowed, *v0);
  getMCFeatureAccountModificationAllowed = (uint64_t (*)())MCFeatureAccountModificationAllowedFunction;
  return (id)constantValMCFeatureAccountModificationAllowed;
}

id MCFeatureAccountModificationAllowedFunction()
{
  return (id)constantValMCFeatureAccountModificationAllowed;
}

uint64_t _UIActivityOpenInApplicationTypeForActivityType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication-InPlace")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication-ByCopy")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication"));
  }

  return v2;
}

id imageLoadingQueue()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)imageLoadingQueue_imageLoadingQueue;
  if (!imageLoadingQueue_imageLoadingQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.ActivityImageLoading", v1);
    v3 = (void *)imageLoadingQueue_imageLoadingQueue;
    imageLoadingQueue_imageLoadingQueue = (uint64_t)v2;

    v0 = (void *)imageLoadingQueue_imageLoadingQueue;
  }
  return v0;
}

void _loadItemProvidersFromActivityItemsStartingAtIndex(void *a1, unint64_t a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  objc_class *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  id *v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  id v71;
  id v72;
  char v73;
  void *v74;
  _QWORD *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  _QWORD block[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  _QWORD v96[2];
  id v97;
  id v98;
  id v99;
  unint64_t v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  unint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  id v115;
  unint64_t v116;
  _QWORD v117[4];
  id v118;
  id v119;
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  id v124;
  id v125;
  id v126;
  unint64_t v127;
  char v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint8_t v133[128];
  uint8_t v134[8];
  __int128 v135;
  void *v136;
  _QWORD *v137;
  objc_class *v138;
  uint8_t buf[4];
  int v140;
  __int16 v141;
  void *v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  _itemLoaderQueue();
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  v19 = MEMORY[0x1E0C809B0];
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke;
  v122[3] = &unk_1E4001C30;
  v20 = v13;
  v123 = v20;
  v127 = a2;
  v128 = a4;
  v21 = v15;
  v124 = v21;
  v22 = v16;
  v125 = v22;
  v23 = v17;
  v126 = v23;
  v80 = (void *)MEMORY[0x1A1AE9514](v122);
  v24 = objc_msgSend(v20, "count");
  share_sheet_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (v24 > a2)
  {
    if (v26)
    {
      *(_DWORD *)buf = 67240192;
      v140 = a2;
      _os_log_impl(&dword_19E419000, v25, OS_LOG_TYPE_INFO, "Examining item at index %{public}d", buf, 8u);
    }

    objc_msgSend(v20, "objectAtIndexedSubscript:", a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      share_sheet_log();
      v32 = objc_claimAutoreleasedReturnValue();
      v31 = v80;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        v140 = a2;
        _os_log_impl(&dword_19E419000, v32, OS_LOG_TYPE_INFO, "Adding item at index %{public}d as-is.", buf, 8u);
      }

      (*((void (**)(id, void *, void *))v22 + 2))(v22, v27, v27);
      _itemLoaderQueue();
      v33 = objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_471;
      v84[3] = &unk_1E4001D98;
      v86 = v80;
      v85 = v14;
      dispatch_async(v33, v84);

      v34 = v86;
      goto LABEL_71;
    }
    v78 = v23;
    v28 = v27;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message")) & 1) != 0)
      v29 = 0;
    else
      v29 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail")) ^ 1;
    v79 = v28;
    objc_msgSend(v28, "registeredTypeIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("com.apple.group-activities.activity"));

    if (v36 && v29)
    {
      _itemLoaderQueue();
      v37 = objc_claimAutoreleasedReturnValue();
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_454;
      v117[3] = &unk_1E4001C58;
      v120 = v22;
      v38 = v79;
      v118 = v79;
      v31 = v80;
      v121 = v80;
      v119 = v14;
      dispatch_async(v37, v117);

      v39 = v120;
LABEL_22:
      v23 = v78;
LABEL_70:

      v34 = v38;
LABEL_71:

      goto LABEL_72;
    }
    if (a4 && objc_msgSend(MEMORY[0x1E0D97420], "hasiWorkSendCopyRepresentationForItemProvider:", v79))
    {
      share_sheet_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        v140 = a2;
        _os_log_impl(&dword_19E419000, v40, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as URL for copy type identifier", buf, 8u);
      }

      v41 = (void *)MEMORY[0x1E0D97420];
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_456;
      v111[3] = &unk_1E4001CA8;
      v116 = a2;
      v114 = v22;
      v38 = v79;
      v112 = v79;
      v115 = v80;
      v113 = v14;
      v31 = v80;
      objc_msgSend(v41, "loadiWorkCopyRepresentationURLForItemProvider:completionHandler:", v112, v111);

      v39 = v114;
      goto LABEL_22;
    }
    v42 = v79;
    v76 = v21;
    v77 = v14;
    if ((objc_msgSend(v42, "canLoadObjectOfClass:", objc_opt_class()) & 1) != 0
      || (objc_msgSend(v42, "canLoadObjectOfClass:", objc_opt_class()) & 1) == 0
      && ((objc_msgSend(v42, "canLoadObjectOfClass:", objc_opt_class()) & 1) != 0
       || !objc_msgSend(v42, "canLoadObjectOfClass:", objc_opt_class())))
    {
      v44 = objc_msgSend(v42, "preferredPresentationStyle");

      if (v44 == 1)
      {
LABEL_39:
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_3;
        v90[3] = &unk_1E4001D70;
        v93 = v22;
        v91 = v42;
        v31 = v80;
        v72 = v80;
        v94 = v72;
        v71 = v14;
        v92 = v71;
        v34 = v91;
        v23 = v78;
        v75 = v90;
        if (_loadItemProviderInline_onceToken != -1)
          dispatch_once(&_loadItemProviderInline_onceToken, &__block_literal_global_477);
        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v51 = (id)_loadItemProviderInline_loadableClasses;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v130;
          while (2)
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v130 != v54)
                objc_enumerationMutation(v51);
              v56 = *(objc_class **)(*((_QWORD *)&v129 + 1) + 8 * i);
              if (objc_msgSend(v34, "canLoadObjectOfClass:", v56, v71, v72))
              {
                share_sheet_log();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                {
                  NSStringFromClass(v56);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v134 = 67240450;
                  *(_DWORD *)&v134[4] = MEMORY[0x1E0C83948];
                  LOWORD(v135) = 2114;
                  *(_QWORD *)((char *)&v135 + 2) = v58;
                  _os_log_impl(&dword_19E419000, v57, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as class %{public}@", v134, 0x12u);

                }
                *(_QWORD *)v134 = MEMORY[0x1E0C809B0];
                *(_QWORD *)&v135 = 3221225472;
                *((_QWORD *)&v135 + 1) = ___loadItemProviderInline_block_invoke_478;
                v136 = &unk_1E4001DE0;
                v138 = v56;
                v59 = v75;
                v137 = v75;
                v60 = (id)objc_msgSend(v34, "loadObjectOfClass:completionHandler:", v56, v134);

                v73 = 1;
                v21 = v76;
                v23 = v78;
                v31 = v80;
                goto LABEL_65;
              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v129, buf, 16);
            if (v53)
              continue;
            break;
          }
          v73 = 0;
          v21 = v76;
          v23 = v78;
          v31 = v80;
        }
        else
        {
          v73 = 0;
        }
        v59 = v75;
LABEL_65:

        v14 = v77;
        if ((v73 & 1) != 0)
          goto LABEL_71;
        share_sheet_log();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          _loadItemProvidersFromActivityItemsStartingAtIndex_cold_1(a2, v69);

        _itemLoaderQueue();
        v70 = objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_470;
        v87[3] = &unk_1E4001D98;
        v89 = v72;
        v88 = v71;
        dispatch_async(v70, v87);

        v39 = v89;
LABEL_69:
        v38 = v79;
        goto LABEL_70;
      }
    }
    else
    {
      v43 = objc_msgSend(v42, "preferredPresentationStyle");

      if (v43 != 2)
        goto LABEL_39;
    }
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v74 = v42;
    objc_msgSend(v42, "registeredContentTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v108;
      v48 = *MEMORY[0x1E0CEC4A0];
      while (2)
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v108 != v47)
            objc_enumerationMutation(v39);
          v50 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
          if (objc_msgSend(v50, "conformsToType:", v48))
          {
            if (objc_msgSend(v50, "conformsToType:", *MEMORY[0x1E0CEC618])
              && (objc_msgSend(v50, "conformsToType:", *MEMORY[0x1E0CEC4E0]) & 1) == 0
              && objc_msgSend(v74, "canLoadObjectOfClass:", objc_opt_class()))
            {
              share_sheet_log();
              v61 = objc_claimAutoreleasedReturnValue();
              v21 = v76;
              v23 = v78;
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67240192;
                v140 = a2;
                _os_log_impl(&dword_19E419000, v61, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as a URL", buf, 8u);
              }

              v62 = objc_opt_class();
              v101[0] = MEMORY[0x1E0C809B0];
              v101[1] = 3221225472;
              v101[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_459;
              v101[3] = &unk_1E4001CA8;
              v106 = a2;
              v63 = &v104;
              v104 = v22;
              v102 = v74;
              v105 = v80;
              v103 = v77;
              v31 = v80;
              v64 = (id)objc_msgSend(v102, "loadObjectOfClass:completionHandler:", v62, v101);

              v65 = v102;
            }
            else
            {
              share_sheet_log();
              v66 = objc_claimAutoreleasedReturnValue();
              v21 = v76;
              v23 = v78;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67240450;
                v140 = a2;
                v141 = 2114;
                v142 = v50;
                _os_log_impl(&dword_19E419000, v66, OS_LOG_TYPE_INFO, "Attempting to load item at index %{public}d as a file of type %{public}@", buf, 0x12u);
              }

              v95[0] = MEMORY[0x1E0C809B0];
              v95[1] = 3221225472;
              v95[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_461;
              v95[3] = &unk_1E4001D48;
              v63 = (id *)v96;
              v67 = v77;
              v100 = a2;
              v96[0] = v67;
              v96[1] = v50;
              v31 = v80;
              v98 = v80;
              v99 = v22;
              v97 = v74;
              v68 = (id)objc_msgSend(v97, "loadFileRepresentationForContentType:openInPlace:completionHandler:", v50, 1, v95);

              v65 = v98;
            }

            v14 = v77;
            goto LABEL_69;
          }
        }
        v46 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
        if (v46)
          continue;
        break;
      }
    }

    v21 = v76;
    v14 = v77;
    v42 = v74;
    goto LABEL_39;
  }
  if (v26)
  {
    *(_DWORD *)buf = 67240192;
    v140 = a2;
    _os_log_impl(&dword_19E419000, v25, OS_LOG_TYPE_INFO, "Finished examining all %{public}d items.", buf, 8u);
  }

  _itemLoaderQueue();
  v30 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_472;
  block[3] = &unk_1E4001D98;
  v83 = v23;
  v82 = v14;
  dispatch_async(v30, block);

  v27 = v83;
  v31 = v80;
LABEL_72:

}

void _updateActivityItemMappingWithResolvedActivityItem(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[_UIActivityItemMapping _originalActivityItemForActivityItem:](_UIActivityItemMapping, "_originalActivityItemForActivityItem:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_UIActivityItemMapping _activityViewControllerForActivityItem:](_UIActivityItemMapping, "_activityViewControllerForActivityItem:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v3, v5, v4);

  }
}

void sub_19E43F460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E43F590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _UIActivityImageForBundleIdentifier(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isInstalled");

    if (v6)
    {
      v7 = (id *)MEMORY[0x1E0D3A870];
      if (a2 != 10)
        v7 = (id *)MEMORY[0x1E0D3A890];
      v8 = (objc_class *)MEMORY[0x1E0D3A820];
      v9 = *v7;
      v10 = (void *)objc_msgSend([v8 alloc], "initWithBundleIdentifier:", v3);
      objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "imageForImageDescriptor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0DC3870];
      v14 = objc_msgSend(v12, "CGImage");
      objc_msgSend(v12, "scale");
      objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_19E4403FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _UIActivityItemTypesSet(void *a1)
{
  __activityItemTypes = 0;
  ItemTypesSet(a1);
}

void ItemTypesSet(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int16 v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((~(_WORD)__activityItemTypes & 0x10C2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v6, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        v8 = __activityItemTypes;
        if ((__activityItemTypes & 1) == 0)
        {
          v9 = IsString(v6);
          v8 = __activityItemTypes;
          if (v9)
          {
            v8 = __activityItemTypes | 1;
            __activityItemTypes |= 1uLL;
          }
        }
        if ((v8 & 2) == 0)
        {
          v10 = IsImage(v6, v7);
          v8 = __activityItemTypes;
          if (v10)
          {
            v8 = __activityItemTypes | 2;
            __activityItemTypes |= 2uLL;
          }
        }
        if ((v8 & 4) == 0)
        {
          v11 = IsURL(v6);
          v8 = __activityItemTypes;
          if (v11)
          {
            v8 = __activityItemTypes | 4;
            __activityItemTypes |= 4uLL;
          }
        }
        if ((v8 & 8) == 0)
        {
          v12 = IsFileURL(v6);
          v8 = __activityItemTypes;
          if (v12)
          {
            v8 = __activityItemTypes | 8;
            __activityItemTypes |= 8uLL;
          }
        }
        if ((v8 & 0x10) == 0)
        {
          v13 = IsCopyable(v6);
          v8 = __activityItemTypes;
          if (v13)
          {
            v8 = __activityItemTypes | 0x10;
            __activityItemTypes |= 0x10uLL;
          }
        }
        if ((v8 & 0x20) == 0)
        {
          v14 = IsPrintable(v6);
          v8 = __activityItemTypes;
          if (v14)
          {
            v8 = __activityItemTypes | 0x20;
            __activityItemTypes |= 0x20uLL;
          }
        }
        if ((v8 & 0x40) == 0)
        {
          v15 = IsVideo(v6, v7);
          v8 = __activityItemTypes;
          if (v15)
          {
            v8 = __activityItemTypes | 0x40;
            __activityItemTypes |= 0x40uLL;
          }
        }
        if ((v8 & 0x80) == 0)
        {
          v16 = IsPDF(v6, v7);
          v8 = __activityItemTypes;
          if (v16)
          {
            v8 = __activityItemTypes | 0x80;
            __activityItemTypes |= 0x80uLL;
          }
        }
        if ((v8 & 0x100) == 0)
        {
          v17 = IsDictionary(v6);
          v8 = __activityItemTypes;
          if (v17)
          {
            v8 = __activityItemTypes | 0x100;
            __activityItemTypes |= 0x100uLL;
          }
        }
        if ((v8 & 0x200) == 0)
        {
          v18 = IsPassbook(v6);
          v8 = __activityItemTypes;
          if (v18)
          {
            v8 = __activityItemTypes | 0x200;
            __activityItemTypes |= 0x200uLL;
          }
        }
        if ((v8 & 0x400) == 0)
        {
          v19 = IsContact(v6);
          v8 = __activityItemTypes;
          if (v19)
          {
            v8 = __activityItemTypes | 0x400;
            __activityItemTypes |= 0x400uLL;
          }
        }
        if ((v8 & 0x800) == 0)
        {
          v20 = IsData(v6);
          v8 = __activityItemTypes;
          if (v20)
          {
            v8 = __activityItemTypes | 0x800;
            __activityItemTypes |= 0x800uLL;
          }
        }
        if ((v8 & 0x1000) == 0)
        {
          v21 = IsAudio(v6, v7);
          v8 = __activityItemTypes;
          if (v21)
          {
            v8 = __activityItemTypes | 0x1000;
            __activityItemTypes |= 0x1000uLL;
          }
        }
        if ((v8 & 0x4000) == 0 && IsItemProvider(v6))
          __activityItemTypes |= 0x4000uLL;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "allValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          ItemTypesSet();

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v3);
  }

}

uint64_t _UIActivityItemTypes()
{
  return __activityItemTypes;
}

id _UIActivityItemsWithTypes(void *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  char isKindOfClass;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    v27 = a5;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "allValues");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          _UIActivityItemsWithTypes(v14, a2, a3, a4, a5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "addObjectsFromArray:", v15);

        }
        else
        {
          if (!IsItemProvider(v13))
          {
            if ((a2 & 0x10C2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v13, 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((a2 & 1) != 0)
                goto LABEL_19;
LABEL_22:
              v17 = 0;
              if ((a2 & 2) != 0)
                goto LABEL_23;
            }
            else
            {
              v16 = 0;
              if ((a2 & 1) == 0)
                goto LABEL_22;
LABEL_19:
              v17 = IsString(v13);
              if ((a2 & 2) != 0)
              {
LABEL_23:
                if ((v17 & 1) == 0)
                  v17 = IsImage(v13, v16);
              }
            }
            if ((a2 & 4) != 0 && (v17 & 1) == 0)
              v17 = IsURL(v13);
            if ((a2 & 8) != 0 && (v17 & 1) == 0)
              v17 = IsFileURL(v13);
            if ((a2 & 0x10) != 0 && (v17 & 1) == 0)
              v17 = IsCopyable(v13);
            if ((a2 & 0x20) != 0 && (v17 & 1) == 0)
              v17 = IsPrintable(v13);
            if ((a2 & 0x40) != 0 && (v17 & 1) == 0)
              v17 = IsVideo(v13, v16);
            if ((a2 & 0x80) != 0 && (v17 & 1) == 0)
              v17 = IsPDF(v13, v16);
            if ((a2 & 0x100) != 0 && (v17 & 1) == 0)
              v17 = IsDictionary(v13);
            if ((a2 & 0x200) != 0 && (v17 & 1) == 0)
              v17 = IsPassbook(v13);
            if ((a2 & 0x400) != 0 && (v17 & 1) == 0)
              v17 = IsContact(v13);
            if ((a2 & 0x800) != 0 && (v17 & 1) == 0)
              v17 = IsData(v13);
            if ((a2 & 0x1000) != 0 && (v17 & 1) == 0)
              v17 = IsAudio(v13, v16);
            v18 = v7;
            if ((a2 & 0x2000) == 0 || (v17 & 1) != 0)
            {
              if (!v17)
              {
LABEL_71:

                v7 = v18;
                continue;
              }
            }
            else
            {
              v19 = v13;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              a5 = v27;
              if ((isKindOfClass & 1) == 0)
                goto LABEL_71;
            }
            v21 = v13;
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if ((a3 & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v21, "string");
                v22 = objc_claimAutoreleasedReturnValue();

                v21 = (id)v22;
                a5 = v27;
              }
            }
            ImageForItem(v21, a4, a5);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              v25 = v23;

              v21 = v25;
              a5 = v27;
            }
            objc_msgSend(v10, "addObject:", v21);

            goto LABEL_71;
          }
          if ((a2 & 0x4000) != 0 && IsItemProvider(v13))
          {
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v10, "addObject:", v13);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v9)
        goto LABEL_76;
    }
  }
  v10 = 0;
LABEL_76:

  return v10;
}

uint64_t IsItemProvider(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t IsString(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsImage(void *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  int v10;

  v6 = a1;
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = IsALAsset();
      if (v10
        && (getALAssetPropertyType(),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "valueForProperty:", v2),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            getALAssetTypePhoto(),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0))
      {
        v8 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((IsImageFile((uint64_t)v6) & 1) != 0 || (IsPhotoAssetURL(v6) & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && IsImageData(v6, v7)
          || (_UIActivityItemIsLivePhoto(v6) & 1) != 0)
        {
          v8 = 1;
          if (!v10)
            goto LABEL_4;
        }
        else
        {
          v8 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5B90], v6);
          if ((v10 & 1) == 0)
            goto LABEL_4;
        }
      }

      goto LABEL_4;
    }
  }
  v8 = 1;
LABEL_4:

  return v8;
}

uint64_t IsURL(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
LABEL_10:
      v5 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5C90], v1);
      goto LABEL_11;
    }
    objc_msgSend(v1, "URL");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  if (!v2)
    goto LABEL_10;
  if ((objc_msgSend(v2, "isFileURL") & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  v6 = objc_msgSend(v4, "compare:options:", CFSTR("assets-library"), 1);

  if (!v6)
    goto LABEL_10;
LABEL_11:

  return v5;
}

uint64_t IsFileURL(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "isFileURL");
  else
    v2 = 0;

  return v2;
}

uint64_t IsCopyable(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsPrintable(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t IsVideo(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  uint64_t IsCompatibleWithSavedPhotosAlbum;
  char isKindOfClass;
  void *v11;

  v3 = a1;
  v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "fileExistsAtPath:", v7))
      {
        objc_msgSend(v3, "path");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v8);

      }
      else
      {
        IsCompatibleWithSavedPhotosAlbum = 1;
      }

    }
    else
    {
      IsCompatibleWithSavedPhotosAlbum = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (IsVideoAssetURL(v3) & 1) != 0
      || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v11 = (void *)*MEMORY[0x1E0CA5BF8], v4)
      && (isKindOfClass & 1) != 0
      && UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
    {
      IsCompatibleWithSavedPhotosAlbum = 1;
    }
    else
    {
      IsCompatibleWithSavedPhotosAlbum = IsConformingToTypeFromItemProvider(v11, v3);
    }
  }

  return IsCompatibleWithSavedPhotosAlbum;
}

uint64_t IsPDF(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  CGImageSource *v8;
  CGImageSource *v9;
  const __CFString *Type;

  v3 = a1;
  v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E0CA5C00]) != 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4)
      {
        v6 = UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5C00]) != 0;
      }
      else
      {
        v8 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
        if (v8)
        {
          v9 = v8;
          Type = CGImageSourceGetType(v8);
          if (Type)
            v6 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E0CA5C00]) != 0;
          else
            v6 = 0;
          CFRelease(v9);
        }
        else
        {
          v6 = 0;
        }
      }
    }
    else
    {
      v6 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5C00], v3);
    }
  }

  return v6;
}

uint64_t IsDictionary(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t IsPassbook(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "isFileURL"))
  {
    _UIActivityUTIForURL(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA5A58]);

  }
  else
  {
    v3 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5A58], v1);
  }

  return v3;
}

uint64_t IsContact(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "isFileURL"))
  {
    _UIActivityUTIForURL(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA5CB0]);

  }
  else
  {
    v3 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5CB0], v1);
  }

  return v3;
}

uint64_t IsData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = 1;
  else
    v2 = IsConformingToTypeFromItemProvider((void *)*MEMORY[0x1E0CA5B20], v1);

  return v2;
}

uint64_t IsAudio(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;

  v3 = a1;
  v4 = a2;
  if (IsFileURL(v3))
  {
    _UIActivityUTIForURL(v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E0CA5AC8]) != 0;

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = (void *)*MEMORY[0x1E0CA5AC8];
    if (v4 && (isKindOfClass & 1) != 0 && UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5AC8]))
      v6 = 1;
    else
      v6 = IsConformingToTypeFromItemProvider(v8, v3);
  }

  return v6;
}

id ImageForItem(void *a1, int a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
LABEL_21:
    v13 = v6;
    goto LABEL_22;
  }
  if (_UIActivityItemIsLivePhoto(v5))
  {
    objc_msgSend(v5, "image");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (IsALAsset())
  {
    getALAssetPropertyType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getALAssetTypePhoto();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      if (!a2)
      {
        NewRepresentationFromPhotoAsset(v5, 0);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v11 = v5;
      v12 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __ImageForItem_block_invoke;
      v29[3] = &unk_1E4001E28;
      v30 = v11;
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __ImageForItem_block_invoke_2;
      v27[3] = &unk_1E4001E50;
      v28 = v30;
      +[UIActivityItemImageRep activityItemImageRepWithAsset:thumbnailProvider:dataProvider:](UIActivityItemImageRep, "activityItemImageRepWithAsset:thumbnailProvider:dataProvider:", v30, v29, v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v30;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCIImage:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "scheme");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v5, "scheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "compare:options:", CFSTR("assets-library"), 1))
      {

      }
      else
      {
        v19 = IsPhotoAssetURL(v5);

        if (v19)
        {
          if (!a2)
          {
            RepresentationFromPhotoAssetURL(v5, 0);
            v6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          v20 = MEMORY[0x1E0C809B0];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __ImageForItem_block_invoke_3;
          v25[3] = &unk_1E4001E28;
          v26 = v5;
          v23[0] = v20;
          v23[1] = 3221225472;
          v23[2] = __ImageForItem_block_invoke_4;
          v23[3] = &unk_1E4001E50;
          v24 = v26;
          +[UIActivityItemImageRep activityItemImageRepWithAsset:thumbnailProvider:dataProvider:](UIActivityItemImageRep, "activityItemImageRepWithAsset:thumbnailProvider:dataProvider:", v24, v25, v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v26;
LABEL_9:

          goto LABEL_22;
        }
      }
    }
    if (a3 && objc_msgSend(v5, "isFileURL") && IsImageFile((uint64_t)v5))
    {
      v21 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v5, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageWithContentsOfFile:", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    v13 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a3)
      {
        v13 = 0;
        if (IsImageData(v5, 0))
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
      }
    }
  }
LABEL_22:

  return v13;
}

BOOL _UIActivityHasAtMoreThan(void *a1, uint64_t a2, uint64_t a3)
{
  return NumberOfItems(a1, a3, a2) > a3;
}

uint64_t NumberOfItems(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_31;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v11, 0, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += NumberOfItems(v13, a2, a3);

        v14 = v8;
        if (v8 > a2)
          goto LABEL_29;
      }
      else
      {
        if (a3 > 63)
        {
          if (a3 == 64)
          {
            if ((IsVideo(v11, v12) & 1) == 0)
              goto LABEL_26;
          }
          else if (a3 != 4096 || !IsAudio(v11, v12))
          {
            goto LABEL_26;
          }
        }
        else if (a3 == 2)
        {
          if ((IsImage(v11, v12) & 1) == 0)
            goto LABEL_26;
        }
        else if (a3 != 4 || (IsURL(v11) & 1) == 0)
        {
          goto LABEL_26;
        }
        v14 = v8 + 1;
        if (v8++ >= a2)
        {
LABEL_29:

          v8 = v14;
          goto LABEL_31;
        }
      }
LABEL_26:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
      continue;
    break;
  }
LABEL_31:

  return v8;
}

uint64_t _UIActivityItemCountOfType(void *a1, uint64_t a2)
{
  return NumberOfItems(a1, 0x7FFFFFFFLL, a2);
}

id _UIActivityItemsGetStrings(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_26;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _UIActivityItemsGetStringsAndURLs(v10, a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "addObjectsFromArray:", v11);
        }
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((_DWORD)a2)
        {
LABEL_12:
          v12 = v9;
        }
        else
        {
          objc_msgSend(v9, "string");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v12;
        if (!v12)
          goto LABEL_18;
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "addObject:", v11);
LABEL_17:

      }
LABEL_18:
      ++v8;
    }
    while (v5 != v8);
    v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    v5 = v13;
  }
  while (v13);
LABEL_26:

  return v6;
}

id _UIActivityItemsGetStringsAndURLs(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_33;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v19;
  v8 = 0x1E0C99000uLL;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "allValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _UIActivityItemsGetStringsAndURLs(v11, a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          if (!v6)
          {
            objc_msgSend(*(id *)(v8 + 3560), "array");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "addObjectsFromArray:", v12);
        }
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((_DWORD)a2)
        {
LABEL_12:
          v13 = v10;
        }
        else
        {
          objc_msgSend(v10, "string");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v13;
        if (!v13)
          goto LABEL_24;
LABEL_14:
        if (!v6)
        {
          objc_msgSend(*(id *)(v8 + 3560), "array");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v10, "isFileURL") & 1) != 0)
      {
        v12 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v10, "scheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "compare:options:", CFSTR("assets-library"), 1);

      if (!v15)
      {
        v12 = 0;
        v8 = 0x1E0C99000;
        goto LABEL_24;
      }
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0x1E0C99000;
      if (v12)
        goto LABEL_14;
LABEL_24:

      ++v9;
    }
    while (v5 != v9);
    v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v5 = v16;
  }
  while (v16);
LABEL_33:

  return v6;
}

id _UIActivityItemsGetWebURLs(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "allValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _UIActivityItemsGetWebURLs(v11, a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "count"))
            objc_msgSend(v4, "addObjectsFromArray:", v12);
LABEL_9:

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "isFileURL", (_QWORD)v18) & 1) == 0)
        {
          objc_msgSend(v10, "scheme");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "compare:options:", CFSTR("assets-library"), 1);

          if (v14)
          {
            v15 = v10;
            v12 = v15;
            if ((_DWORD)a2)
            {
              objc_msgSend(v15, "absoluteString");
              v16 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v16;
            }
            objc_msgSend(v4, "addObject:", v12);
            goto LABEL_9;
          }
        }
LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

id _UIActivityItemsGetImages(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "allValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          _UIActivityItemsGetImages(v12, a2, a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "count"))
          {
            if (!v8)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v8, "addObjectsFromArray:", v13);
          }
        }
        else
        {
          ImageForItem(v11, a2, a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if (!v8)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v8, "addObject:", v13);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id _UIActivityItemsGetImagesAndVideos(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsCompatibleWithSavedPhotosAlbum;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v2)
  {
    v4 = 0;
    goto LABEL_41;
  }
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v19;
  v6 = 0x1E0C99000uLL;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(v1);
      v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _UIActivityItemsGetImagesAndVideos();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "count"))
        {
          if (!v4)
          {
            objc_msgSend(*(id *)(v6 + 3560), "array");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v4, "addObjectsFromArray:", v10);
        }
        goto LABEL_20;
      }
      if (!_UIActivityItemIsLivePhoto(v8))
      {
        ImageForItem(v8, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v4)
          {
            objc_msgSend(*(id *)(v6 + 3560), "array");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v11 = v4;
          v12 = v10;
LABEL_19:
          objc_msgSend(v11, "addObject:", v12);
LABEL_20:

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && IsImageData(v8, 0))
        {
          if (!v4)
            goto LABEL_26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !IsFileURL(v8))
            goto LABEL_20;
          objc_msgSend(v8, "path");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v13);

          if (IsCompatibleWithSavedPhotosAlbum)
          {
            v6 = 0x1E0C99000uLL;
            if (!v4)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v8, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v15);

            goto LABEL_20;
          }
          v6 = 0x1E0C99000;
          if (!IsImageFile((uint64_t)v8))
            goto LABEL_20;
          if (!v4)
          {
LABEL_26:
            objc_msgSend(*(id *)(v6 + 3560), "array");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v11 = v4;
        v12 = v8;
        goto LABEL_19;
      }
      if (!v4)
      {
        objc_msgSend(*(id *)(v6 + 3560), "array");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "addObject:", v8);
LABEL_21:
      ++v7;
    }
    while (v3 != v7);
    v16 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v3 = v16;
  }
  while (v16);
LABEL_41:

  return v4;
}

uint64_t _UIActivityItemIsLivePhoto(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  if (NSClassFromString(CFSTR("PHLivePhoto")))
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;

  return isKindOfClass & 1;
}

BOOL IsImageData(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  const __CFData *v5;
  _BOOL8 v6;
  CGImageSource *v8;
  CGImageSource *v9;
  const __CFString *Type;

  v3 = a1;
  v4 = a2;
  +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:](_UIActivityPlaceholderItemProxy, "unproxiedItemForItem:", v3);
  v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (+[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v3, 0), (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;

  }
  else
  {
    v8 = CGImageSourceCreateWithData(v5, 0);
    if (v8)
    {
      v9 = v8;
      Type = CGImageSourceGetType(v8);
      if (Type)
        v6 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;
      else
        v6 = 0;
      CFRelease(v9);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t IsImageFile(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  __CFString *v3;
  CGImageSourceRef v4;
  uint64_t v5;

  +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:](_UIActivityPlaceholderItemProxy, "unproxiedItemForItem:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isFileURL"))
  {
    _UIActivityUTIForURL(v1);
    v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v3 = (__CFString *)v2;
    if (v2
      && UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B90])
      && (v4 = CGImageSourceCreateWithURL((CFURLRef)v1, 0)) != 0)
    {
      CFRelease(v4);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _UIActivityItemsGetAttachments(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v2)
  {
    v4 = 0;
    goto LABEL_30;
  }
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v13;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v1);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _UIActivityItemsGetAttachments();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          if (!v4)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v4, "addObjectsFromArray:", v9);
        }
LABEL_11:

        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (((objc_opt_isKindOfClass() & 1) == 0
           || (IsFileURL(v7) & 1) == 0 && (IsPhotoAssetURL(v7) & 1) == 0 && !IsVideoAssetURL(v7))
          && !IsItemProvider(v7))
        {
          ImageForItem(v7, 0, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            if (!v4)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v4, "addObject:", v9);
          }
          goto LABEL_11;
        }
      }
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "addObject:", v7);
LABEL_21:
      ++v6;
    }
    while (v3 != v6);
    v10 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    v3 = v10;
  }
  while (v10);
LABEL_30:

  return v4;
}

uint64_t IsPhotoAssetURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  v1 = a1;
  +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:](_UIActivityPlaceholderItemProxy, "unproxiedItemForItem:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, "compare:options:", CFSTR("assets-library"), 1), v4, !v5))
  {
    +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v1, 0);
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v7;
    if (v7)
    {
      v6 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;
    }
    else
    {
      getALAssetTypePhoto();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = IsAssetURL(v1, v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t IsVideoAssetURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  v1 = a1;
  +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:](_UIActivityPlaceholderItemProxy, "unproxiedItemForItem:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, "compare:options:", CFSTR("assets-library"), 1), v4, !v5))
  {
    +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v1, 0);
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v7;
    if (v7)
    {
      v6 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5BF8]) != 0;
    }
    else
    {
      getALAssetTypeVideo();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = IsAssetURL(v1, v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id _UIActivityItemsGetUTIs(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, _BYTE *);
  uint64_t i;
  void *v13;
  id v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, _BYTE *);
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v24 = a2;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v23 = (void *)*MEMORY[0x1E0CA5C90];
    v9 = *MEMORY[0x1E0CA5C20];
    v10 = MEMORY[0x1E0C809B0];
    v11 = ___UIActivityItemsGetUTIs_block_invoke;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25[0] = v10;
          v25[1] = 3221225472;
          v25[2] = v11;
          v25[3] = &unk_1E4001BE8;
          v26 = v4;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "addObject:", v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v5;
              v15 = v11;
              v16 = v10;
              v17 = v9;
              v18 = v13;
              if (objc_msgSend(v18, "isFileURL"))
              {
                _UIActivityUTIForURL(v18);
                v19 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v19 = v23;
              }
              v21 = v19;
              if (v19)
                objc_msgSend(v4, "addObject:", v19);

              v9 = v17;
              v10 = v16;
              v11 = v15;
              v5 = v14;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v13, v24);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                  objc_msgSend(v4, "addObject:", v20);

              }
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  return v4;
}

__CFString *_UIActivityUTIForURL(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  const __CFString *PreferredIdentifierForTag;
  __CFString *v6;
  __CFString *v7;

  v1 = a1;
  objc_msgSend(v1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("log")))
  {
    v4 = (__CFString *)*MEMORY[0x1E0CA5C20];
  }
  else
  {
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v3, 0);
    v6 = (__CFString *)PreferredIdentifierForTag;
    if (PreferredIdentifierForTag && UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E0CA5AC0]))
      v7 = (__CFString *)softLinkQLTypeCopyUTIForURLAndMimeType_0(v1, 0);
    else
      v7 = v6;
    v4 = v7;

  }
  return v4;
}

id _itemLoaderQueue()
{
  if (_itemLoaderQueue_onceToken != -1)
    dispatch_once(&_itemLoaderQueue_onceToken, &__block_literal_global_449);
  return (id)_itemLoaderQueue_queue;
}

void ___itemLoaderQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.ShareSheet.itemLoaderQueue", v2);
  v1 = (void *)_itemLoaderQueue_queue;
  _itemLoaderQueue_queue = (uint64_t)v0;

}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke(uint64_t a1, uint64_t a2)
{
  return _loadItemProvidersFromActivityItemsStartingAtIndex(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64) + 1, a2, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_454(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_456(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_456_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 67240192;
    v19 = v9;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as URL for copy type identifier", buf, 8u);
  }

  _itemLoaderQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_457;
  block[3] = &unk_1E4001C80;
  v13 = v5;
  v16 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_457(_QWORD *a1)
{
  if (a1[4])
    (*(void (**)(void))(a1[7] + 16))();
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_459(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_459_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 67240192;
    v19 = v9;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as a URL", buf, 8u);
  }

  _itemLoaderQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_460;
  block[3] = &unk_1E4001C80;
  v13 = v5;
  v16 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_460(_QWORD *a1)
{
  if (a1[4])
    (*(void (**)(void))(a1[7] + 16))();
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_461(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint8_t *v30;
  uint64_t v31;
  char v32;
  id obj;
  _QWORD block[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[8];
  __int128 v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  v38 = 0;
  v38 = *(id *)(a1 + 32);
  if (v8)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_461_cold_1();

    _itemLoaderQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_462;
    block[3] = &unk_1E4001CD0;
    v35 = *(id *)(a1 + 56);
    v36 = v37;
    dispatch_async(v10, block);

  }
  else
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 72);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)&buf[4] = v12;
      LOWORD(v40) = 2114;
      *(_QWORD *)((char *)&v40 + 2) = v13;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as a file of type %{public}@", buf, 0x12u);
    }

    if (v7)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&v40 = buf;
      *((_QWORD *)&v40 + 1) = 0x3032000000;
      v41 = __Block_byref_object_copy__1;
      v42 = __Block_byref_object_dispose__1;
      v43 = 0;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
      v15 = v40;
      obj = *(id *)(v40 + 40);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_464;
      v23[3] = &unk_1E4001D20;
      v16 = v7;
      v32 = a3;
      v29 = v37;
      v30 = buf;
      v17 = *(void **)(a1 + 64);
      v31 = *(_QWORD *)(a1 + 72);
      v18 = *(_QWORD *)(a1 + 40);
      v24 = v16;
      v25 = v18;
      v27 = v17;
      v26 = *(id *)(a1 + 48);
      v28 = *(id *)(a1 + 56);
      objc_msgSend(v14, "coordinateReadingItemAtURL:options:error:byAccessor:", v16, 1, &obj, v23);
      objc_storeStrong((id *)(v15 + 40), obj);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      _itemLoaderQueue();
      v19 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_2;
      v20[3] = &unk_1E4001CD0;
      v21 = *(id *)(a1 + 56);
      v22 = v37;
      dispatch_async(v19, v20);

    }
  }
  _Block_object_dispose(v37, 8);

}

void sub_19E443F08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_462(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_464(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id obj;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = *(id *)(a1 + 32);
    if (!v5)
      goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 96))
  {
    -[NSObject lastPathComponent](v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "temporaryDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = _newTempDir(v9, CFSTR("com.apple.ShareSheet.Activity"));
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
    v13 = (void *)_newTempDir(v7, CFSTR("com.apple.ShareSheet.representation"));
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v16 + 40);
    v17 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v5, v14, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);

    if (v17)
    {
      v18 = v5;
      v5 = v14;
    }
    else
    {
      share_sheet_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_464_cold_1();
    }

  }
LABEL_12:
  _itemLoaderQueue();
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_467;
  v23[3] = &unk_1E4001CF8;
  v24 = v5;
  v26 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v27 = v20;
  v28 = v21;
  v22 = v5;
  dispatch_async(v19, v23);

}

uint64_t _newTempDir(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  char v16[1025];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@.XXXXXX"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
  v9 = v15;
  v10 = 0;
  if (v8)
  {
    bzero(v16, 0x401uLL);
    objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v16, 1024);
    if (mkdtemp(v16))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 1);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      share_sheet_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        _newTempDir_cold_2(v11);
      v10 = 0;
    }

  }
  if (v9)
  {
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      _newTempDir_cold_1((uint64_t)v9, v12, v13);

  }
  return v10;
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_467(_QWORD *a1)
{
  if (a1[4])
    (*(void (**)(void))(a1[6] + 16))();
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  _itemLoaderQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_4;
  block[3] = &unk_1E4001C80;
  v7 = v3;
  v10 = a1[6];
  v8 = a1[4];
  v11 = a1[7];
  v9 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_4(_QWORD *a1)
{
  if (a1[4])
    (*(void (**)(void))(a1[7] + 16))();
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_470(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_471(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_472(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void ___loadItemProviderInline_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_loadItemProviderInline_loadableClasses;
  _loadItemProviderInline_loadableClasses = v0;

}

void ___loadItemProviderInline_block_invoke_478(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___loadItemProviderInline_block_invoke_478_cold_1(a1, (uint64_t)v5, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromClass(*(Class *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67240450;
    v10[1] = MEMORY[0x1E0C83948];
    v11 = 2114;
    v12 = v9;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_INFO, "Successfully loaded item at index %{public}d as class %{public}@", (uint8_t *)v10, 0x12u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t IsALAsset()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("ALAsset"));

  return v2;
}

uint64_t IsConformingToTypeFromItemProvider(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (IsItemProvider(v4))
    v5 = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v3);
  else
    v5 = 0;

  return v5;
}

id initValALAssetPropertyType()
{
  id *v0;

  if (AssetsLibraryLibrary_sOnce != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_487);
  v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetPropertyType");
  if (v0)
    objc_storeStrong((id *)&constantValALAssetPropertyType, *v0);
  getALAssetPropertyType = (uint64_t (*)())ALAssetPropertyTypeFunction;
  return (id)constantValALAssetPropertyType;
}

id ALAssetPropertyTypeFunction()
{
  return (id)constantValALAssetPropertyType;
}

id initValALAssetTypePhoto()
{
  id *v0;

  if (AssetsLibraryLibrary_sOnce != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_487);
  v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetTypePhoto");
  if (v0)
    objc_storeStrong((id *)&constantValALAssetTypePhoto, *v0);
  getALAssetTypePhoto = (uint64_t (*)())ALAssetTypePhotoFunction;
  return (id)constantValALAssetTypePhoto;
}

id ALAssetTypePhotoFunction()
{
  return (id)constantValALAssetTypePhoto;
}

id NewRepresentationFromPhotoAsset(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  float v13;
  id v14;
  uint64_t v15;
  float v16;
  UIImage *v17;
  const __CFString *v18;

  v3 = a1;
  getALAssetPropertyType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getALAssetTypePhoto();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v3, "defaultRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      switch(a2)
      {
        case 0:
          v11 = objc_alloc(MEMORY[0x1E0DC3870]);
          v12 = objc_msgSend(v8, "fullScreenImage");
          objc_msgSend(v8, "scale");
          v9 = objc_msgSend(v11, "initWithCGImage:scale:orientation:", v12, 0, v13);
          goto LABEL_10;
        case 2:
          v14 = objc_alloc(MEMORY[0x1E0DC3870]);
          v15 = objc_msgSend(v8, "fullScreenImage");
          objc_msgSend(v8, "scale");
          v17 = (UIImage *)objc_msgSend(v14, "initWithCGImage:scale:orientation:", v15, 0, v16);
          v18 = (const __CFString *)objc_msgSend(v8, "UTI");
          if (UTTypeConformsTo(v18, (CFStringRef)*MEMORY[0x1E0CA5BA8]))
            UIImageJPEGRepresentation(v17, 0.8);
          else
            UIImagePNGRepresentation(v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        case 1:
          v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", objc_msgSend(v3, "thumbnail"));
LABEL_10:
          v10 = (void *)v9;
          goto LABEL_15;
      }
    }
    v10 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

id RepresentationFromPhotoAssetURL(void *a1, int a2)
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v4 = objc_alloc_init(getALAssetsLibraryClass());
  v5 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __RepresentationFromPhotoAssetURL_block_invoke;
  block[3] = &unk_1E4001EC8;
  v14 = v4;
  v15 = v3;
  v18 = a2;
  v16 = v5;
  v17 = &v19;
  v7 = v5;
  v8 = v3;
  v9 = v4;
  dispatch_async(v6, block);

  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v10);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void sub_19E444D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initALAssetsLibrary()
{
  Class result;

  if (AssetsLibraryLibrary_sOnce != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_487);
  result = objc_getClass("ALAssetsLibrary");
  classALAssetsLibrary = (uint64_t)result;
  getALAssetsLibraryClass = (uint64_t (*)(void))ALAssetsLibraryFunction;
  return result;
}

id ALAssetsLibraryFunction()
{
  return (id)classALAssetsLibrary;
}

uint64_t IsAssetURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  dispatch_time_t v13;
  uint64_t v14;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  dispatch_semaphore_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v3 = a1;
  v4 = a2;
  +[_UIActivityPlaceholderItemProxy unproxiedItemForItem:](_UIActivityPlaceholderItemProxy, "unproxiedItemForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v6 = objc_alloc_init((Class)getALAssetsLibraryClass());
  v7 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IsAssetURL_block_invoke;
  block[3] = &unk_1E4001F18;
  v17 = v6;
  v18 = v5;
  v20 = v7;
  v21 = &v22;
  v19 = v4;
  v9 = v7;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  dispatch_async(v8, block);

  v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v13);
  v14 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void sub_19E445050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initValALAssetTypeVideo()
{
  id *v0;

  if (AssetsLibraryLibrary_sOnce != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce, &__block_literal_global_487);
  v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib, "ALAssetTypeVideo");
  if (v0)
    objc_storeStrong((id *)&constantValALAssetTypeVideo, *v0);
  getALAssetTypeVideo = (uint64_t (*)())ALAssetTypeVideoFunction;
  return (id)constantValALAssetTypeVideo;
}

id ALAssetTypeVideoFunction()
{
  return (id)constantValALAssetTypeVideo;
}

uint64_t initQLTypeCopyUTIForURLAndMimeType_0(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = QuickLookLibrary_sOnce_0;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_0, &__block_literal_global_502);
  softLinkQLTypeCopyUTIForURLAndMimeType_0 = (uint64_t (*)())dlsym((void *)QuickLookLibrary_sLib_0, "QLTypeCopyUTIForURLAndMimeType");
  v6 = ((uint64_t (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType_0)(v5, v4);

  return v6;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void sub_19E4464FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4469C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _UIActivityIsAirdrop(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activityType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

  return v2;
}

Class initLPLinkMetadata()
{
  Class result;

  if (LinkPresentationLibrary_sOnce != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata = (uint64_t)result;
  getLPLinkMetadataClass_0 = (uint64_t (*)())LPLinkMetadataFunction;
  return result;
}

id LPLinkMetadataFunction()
{
  return (id)classLPLinkMetadata;
}

Class initIMSharedMessageSendingUtilities()
{
  Class result;

  if (IMSharedUtilitiesLibrary_sOnce != -1)
    dispatch_once(&IMSharedUtilitiesLibrary_sOnce, &__block_literal_global_169);
  result = objc_getClass("IMSharedMessageSendingUtilities");
  classIMSharedMessageSendingUtilities = (uint64_t)result;
  getIMSharedMessageSendingUtilitiesClass = (uint64_t (*)())IMSharedMessageSendingUtilitiesFunction;
  return result;
}

id IMSharedMessageSendingUtilitiesFunction()
{
  return (id)classIMSharedMessageSendingUtilities;
}

Class initMCProfileConnection_1()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce_1 != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce_1, &__block_literal_global_172);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_1 = (uint64_t)result;
  getMCProfileConnectionClass_1 = (uint64_t (*)())MCProfileConnectionFunction_1;
  return result;
}

id MCProfileConnectionFunction_1()
{
  return (id)classMCProfileConnection_1;
}

Class initMFMessageComposeViewController()
{
  Class result;

  if (MessageUILibrary_sOnce_0 != -1)
    dispatch_once(&MessageUILibrary_sOnce_0, &__block_literal_global_175);
  result = objc_getClass("MFMessageComposeViewController");
  classMFMessageComposeViewController = (uint64_t)result;
  getMFMessageComposeViewControllerClass = (uint64_t (*)())MFMessageComposeViewControllerFunction;
  return result;
}

id MFMessageComposeViewControllerFunction()
{
  return (id)classMFMessageComposeViewController;
}

Class initLPSharingMetadataWrapper()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_0 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_0, &__block_literal_global_178);
  result = objc_getClass("LPSharingMetadataWrapper");
  classLPSharingMetadataWrapper = (uint64_t)result;
  getLPSharingMetadataWrapperClass = (uint64_t (*)())LPSharingMetadataWrapperFunction;
  return result;
}

id LPSharingMetadataWrapperFunction()
{
  return (id)classLPSharingMetadataWrapper;
}

void sub_19E44A7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E44A99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

UIActivityContentViewController *__getFBSceneWorkspaceClass_block_invoke(uint64_t a1)
{
  UIActivityContentViewController *result;
  UIActivityContentViewController *v3;
  SEL v4;

  FrontBoardLibrary();
  result = (UIActivityContentViewController *)objc_getClass("FBSceneWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFBSceneWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (UIActivityContentViewController *)__getFBSceneWorkspaceClass_block_invoke_cold_1();
    return -[UIActivityContentViewController init](v3, v4);
  }
  return result;
}

void sub_19E44CB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E44E564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E45320C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E454AE4(_Unwind_Exception *a1)
{
  id *v1;
  int v2;
  uint64_t v3;

  if (v2)
    objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_19E4553D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initSFUIActivityImageProvider()
{
  Class result;

  if (SharingUILibrary_sOnce != -1)
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_659);
  result = objc_getClass("SFUIActivityImageProvider");
  classSFUIActivityImageProvider = (uint64_t)result;
  getSFUIActivityImageProviderClass = (uint64_t (*)())SFUIActivityImageProviderFunction;
  return result;
}

id SFUIActivityImageProviderFunction()
{
  return (id)classSFUIActivityImageProvider;
}

Class initSFUIPeopleSuggestionImageProvider()
{
  Class result;

  if (SharingUILibrary_sOnce != -1)
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_659);
  result = objc_getClass("SFUIPeopleSuggestionImageProvider");
  classSFUIPeopleSuggestionImageProvider = (uint64_t)result;
  getSFUIPeopleSuggestionImageProviderClass = (uint64_t (*)())SFUIPeopleSuggestionImageProviderFunction;
  return result;
}

id SFUIPeopleSuggestionImageProviderFunction()
{
  return (id)classSFUIPeopleSuggestionImageProvider;
}

Class initLPLinkView()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_1 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_1, &__block_literal_global_663);
  result = objc_getClass("LPLinkView");
  classLPLinkView = (uint64_t)result;
  getLPLinkViewClass = (uint64_t (*)())LPLinkViewFunction;
  return result;
}

id LPLinkViewFunction()
{
  return (id)classLPLinkView;
}

Class initPUCarouselSharingViewController()
{
  Class result;

  if (PhotosUIPrivateLibrary_sOnce != -1)
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_666);
  result = objc_getClass("PUCarouselSharingViewController");
  classPUCarouselSharingViewController = (uint64_t)result;
  getPUCarouselSharingViewControllerClass = (uint64_t (*)())PUCarouselSharingViewControllerFunction;
  return result;
}

id PUCarouselSharingViewControllerFunction()
{
  return (id)classPUCarouselSharingViewController;
}

Class initSFUITTRReporter()
{
  Class result;

  if (SharingUILibrary_sOnce != -1)
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_659);
  result = objc_getClass("SFUITTRReporter");
  classSFUITTRReporter = (uint64_t)result;
  getSFUITTRReporterClass = (uint64_t (*)())SFUITTRReporterFunction;
  return result;
}

id SFUITTRReporterFunction()
{
  return (id)classSFUITTRReporter;
}

Class initLPLinkRendererSizeClassParameters()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_1 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_1, &__block_literal_global_663);
  result = objc_getClass("LPLinkRendererSizeClassParameters");
  classLPLinkRendererSizeClassParameters = (uint64_t)result;
  getLPLinkRendererSizeClassParametersClass = (uint64_t (*)())LPLinkRendererSizeClassParametersFunction;
  return result;
}

id LPLinkRendererSizeClassParametersFunction()
{
  return (id)classLPLinkRendererSizeClassParameters;
}

Class initRPTTestRunner()
{
  Class result;

  if (RecapPerformanceTestingLibrary_sOnce != -1)
    dispatch_once(&RecapPerformanceTestingLibrary_sOnce, &__block_literal_global_671);
  result = objc_getClass("RPTTestRunner");
  classRPTTestRunner = (uint64_t)result;
  getRPTTestRunnerClass = (uint64_t (*)())RPTTestRunnerFunction;
  return result;
}

id RPTTestRunnerFunction()
{
  return (id)classRPTTestRunner;
}

Class initRPTScrollViewTestParameters()
{
  Class result;

  if (RecapPerformanceTestingLibrary_sOnce != -1)
    dispatch_once(&RecapPerformanceTestingLibrary_sOnce, &__block_literal_global_671);
  result = objc_getClass("RPTScrollViewTestParameters");
  classRPTScrollViewTestParameters = (uint64_t)result;
  getRPTScrollViewTestParametersClass = (uint64_t (*)())RPTScrollViewTestParametersFunction;
  return result;
}

id RPTScrollViewTestParametersFunction()
{
  return (id)classRPTScrollViewTestParameters;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

Class initLPLinkMetadata_0()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_2 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_2, &__block_literal_global_13);
  result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata_0 = (uint64_t)result;
  getLPLinkMetadataClass_1 = (uint64_t (*)())LPLinkMetadataFunction_0;
  return result;
}

id LPLinkMetadataFunction_0()
{
  return (id)classLPLinkMetadata_0;
}

uint64_t initPLLogRegisteredEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (PowerLogLibrary_sOnce != -1)
    dispatch_once(&PowerLogLibrary_sOnce, &__block_literal_global_567);
  softLinkPLLogRegisteredEvent = (uint64_t (*)())dlsym((void *)PowerLogLibrary_sLib, "PLLogRegisteredEvent");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogRegisteredEvent)(a1, a2, a3, a4);
}

id _ShareSheetBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_ShareSheetBundle_sharingUIBundle;
  if (!_ShareSheetBundle_sharingUIBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_ShareSheetBundle_sharingUIBundle;
    _ShareSheetBundle_sharingUIBundle = v1;

    v0 = (void *)_ShareSheetBundle_sharingUIBundle;
  }
  return v0;
}

uint64_t _SharingUIAuditTokenForCurrentProcess@<X0>(uint64_t a1@<X8>)
{
  mach_msg_type_number_t task_info_outCnt;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)a1, &task_info_outCnt);
}

id _ShareSheetBundleIDFromAuditToken()
{
  void *v0;

  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
    v0 = 0;
  else
    v0 = (void *)CPCopyBundleIdentifierFromAuditToken();
  if (!v0)
    NSLog(CFSTR("Cannot get bundle ID from audit token."));
  return v0;
}

uint64_t _ShareSheetCurrentDeviceClassFromPresentationStyle(int a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  BOOL v11;
  NSObject *v12;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;

  if (!_ShareSheetPlatformPrefersPopover())
  {
    if (v6 == 568.0 && v4 == 320.0)
      return 0;
    v11 = v6 == 693.0 && v4 == 320.0;
    if (!v11 && (v6 != 667.0 || v4 != 375.0))
    {
      if (v6 == 736.0 && v4 == 414.0)
        return 2;
      if (v6 == 812.0 && v4 == 375.0)
        return 3;
      if (v6 == 844.0 && v4 == 390.0 || v6 == 852.0 && v4 == 393.0)
        return 4;
      if (v6 == 896.0 && v4 == 414.0)
        return 5;
      if (v6 == 926.0 && v4 == 428.0 || v6 == 932.0 && v4 == 430.0)
        return 6;
      share_sheet_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        _ShareSheetCurrentDeviceClassFromPresentationStyle_cold_1(v12, v4, v6);

    }
    return 1;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 6)
  {
    if (a1)
      return 9;
    else
      return 10;
  }
  else if (v4 == 768.0)
  {
    return 7;
  }
  else
  {
    return 8;
  }
}

BOOL _ShareSheetPlatformPrefersPopover()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return (v1 & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

id share_sheet_log()
{
  if (share_sheet_log_onceToken != -1)
    dispatch_once(&share_sheet_log_onceToken, &__block_literal_global_7);
  return (id)share_sheet_log___logger;
}

id magic_head_log()
{
  if (magic_head_log_onceToken != -1)
    dispatch_once(&magic_head_log_onceToken, &__block_literal_global_14);
  return (id)magic_head_log___logger;
}

void __magic_head_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sharing", "MagicHead");
  v1 = (void *)magic_head_log___logger;
  magic_head_log___logger = (uint64_t)v0;

}

void __share_sheet_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ShareSheet", "ShareSheet");
  v1 = (void *)share_sheet_log___logger;
  share_sheet_log___logger = (uint64_t)v0;

}

id _UIKitUserDefaults()
{
  if (_UIKitUserDefaults_onceToken != -1)
    dispatch_once(&_UIKitUserDefaults_onceToken, &__block_literal_global_10);
  return (id)_UIKitUserDefaults_result;
}

uint64_t _ShareSheetIsAppleApp()
{
  if (_ShareSheetIsAppleApp_onceToken != -1)
    dispatch_once(&_ShareSheetIsAppleApp_onceToken, &__block_literal_global_14);
  return _ShareSheetIsAppleApp_isAppleApp;
}

BOOL _ShareSheetCanAccessContactsInCurrentProcess()
{
  return objc_msgSend(getCNContactStoreClass(), "authorizationStatusForEntityType:", 0) == 3;
}

id getCNContactStoreClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNContactStoreClass_softClass;
  v7 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNContactStoreClass_block_invoke;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getCNContactStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E45BA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _ShareSheetDeviceScreenScale()
{
  if (_ShareSheetDeviceScreenScale_didCheck != -1)
    dispatch_once(&_ShareSheetDeviceScreenScale_didCheck, &__block_literal_global_17_0);
  return *(double *)&_ShareSheetDeviceScreenScale_scale;
}

uint64_t _ShareSheetIsCamera()
{
  if (_ShareSheetIsCamera_didCheck != -1)
    dispatch_once(&_ShareSheetIsCamera_didCheck, &__block_literal_global_18);
  return _ShareSheetIsCamera_isCamera;
}

uint64_t _ShareSheetIsSafari()
{
  if (_ShareSheetIsSafari_didCheck != -1)
    dispatch_once(&_ShareSheetIsSafari_didCheck, &__block_literal_global_21);
  return _ShareSheetIsSafari_isSafari;
}

uint64_t _ShareSheetIsBrowser()
{
  if (_ShareSheetIsBrowser_onceToken != -1)
    dispatch_once(&_ShareSheetIsBrowser_onceToken, &__block_literal_global_26);
  return _ShareSheetIsBrowser_hostHasEntitlement;
}

uint64_t _ShareSheetIsRealityLauncher()
{
  if (_ShareSheetIsRealityLauncher_onceToken != -1)
    dispatch_once(&_ShareSheetIsRealityLauncher_onceToken, &__block_literal_global_29);
  return _ShareSheetIsRealityLauncher_isRealityLauncher;
}

uint64_t _ShareSheetPrefersModernRemoteScene()
{
  return _os_feature_enabled_impl();
}

uint64_t _ShareSheetPlatformWantsRemoteOptions()
{
  return 0;
}

uint64_t _ShareSheetImageAnalysisAllowed()
{
  if (_ShareSheetIsMessagesApp_didCheck != -1)
    dispatch_once(&_ShareSheetIsMessagesApp_didCheck, &__block_literal_global_60);
  return _ShareSheetIsMessagesApp_isMessages;
}

uint64_t _ShareSheetHostCanRenderInProcess()
{
  if (_ShareSheetHostCanUseCustomViewController_onceToken != -1)
    dispatch_once(&_ShareSheetHostCanUseCustomViewController_onceToken, &__block_literal_global_63);
  return _ShareSheetHostCanUseCustomViewController_hostHasEntitlement;
}

BOOL _ShareSheetCanUseCustomViewController()
{
  if (_ShareSheetIsPhotos_didCheck != -1)
    dispatch_once(&_ShareSheetIsPhotos_didCheck, &__block_literal_global_66);
  if (_ShareSheetIsPhotos_isPhotos)
    return 1;
  if (_ShareSheetIsPhotosMessagesApp_didCheck != -1)
    dispatch_once(&_ShareSheetIsPhotosMessagesApp_didCheck, &__block_literal_global_69);
  if (_ShareSheetIsPhotosMessagesApp_isPhotos)
    return 1;
  if (_ShareSheetIsCamera_didCheck != -1)
    dispatch_once(&_ShareSheetIsCamera_didCheck, &__block_literal_global_18);
  if (_ShareSheetIsCamera_isCamera)
    return 1;
  if (_ShareSheetIsClips_didCheck != -1)
    dispatch_once(&_ShareSheetIsClips_didCheck, &__block_literal_global_72);
  if (_ShareSheetIsClips_IsClips)
    return 1;
  if (_ShareSheetIsMusic_didCheck != -1)
    dispatch_once(&_ShareSheetIsMusic_didCheck, &__block_literal_global_75);
  if (_ShareSheetIsMusic_IsMusic)
    return 1;
  if (_ShareSheetIsTV_didCheck != -1)
    dispatch_once(&_ShareSheetIsTV_didCheck, &__block_literal_global_78);
  if (_ShareSheetIsTV_IsTV)
    return 1;
  if (_ShareSheetIsFaceTime_didCheck != -1)
    dispatch_once(&_ShareSheetIsFaceTime_didCheck, &__block_literal_global_81);
  if (_ShareSheetIsFaceTime_IsFaceTime)
    return 1;
  if (_ShareSheetIsInCallService_didCheck != -1)
    dispatch_once(&_ShareSheetIsInCallService_didCheck, &__block_literal_global_84);
  if (_ShareSheetIsInCallService_IsInCallService)
    return 1;
  if (_ShareSheetHostCanUseCustomViewController_onceToken != -1)
    dispatch_once(&_ShareSheetHostCanUseCustomViewController_onceToken, &__block_literal_global_63);
  return _ShareSheetHostCanUseCustomViewController_hostHasEntitlement != 0;
}

uint64_t _ShareSheetIsSupportedPrintActivity(void *a1)
{
  id v1;
  int isKindOfClass;
  int v3;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v3 = objc_opt_isKindOfClass();

  return v3 & ~isKindOfClass & 1;
}

double _ShareSheetPopoverSize()
{
  void *v0;
  _BOOL4 v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 6;

  return dbl_19E4D35F0[v1];
}

double _ShareSheetFormSheetSize()
{
  void *v0;
  uint64_t v1;
  double v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 6)
    return 480.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v2 = 540.0;

  return v2;
}

double _ShareSheetDefaultSheetSize()
{
  return 568.0;
}

uint64_t _ShareSheetCanAccessPeopleSuggestions(_BYTE *a1)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  uint64_t result;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;

  if (_ShareSheetCanAccessPeopleSuggestions_onceToken != -1)
    dispatch_once(&_ShareSheetCanAccessPeopleSuggestions_onceToken, &__block_literal_global_36);
  if (!_ShareSheetCanAccessPeopleSuggestions_hostHasEntitlement)
  {
    v3 = 0;
    if (a1)
      *a1 = 1;
    return v3;
  }
  v2 = objc_msgSend(getCNContactStoreClass(), "authorizationStatusForEntityType:", 0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v3 = v2 == 3;
  v33 = v2 == 3;
  if (v2)
  {
LABEL_27:
    if (a1)
    {
      if (!v3)
        *a1 = 0;
    }
    _Block_object_dispose(&v30, 8);
    return v3;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v4 = (uint64_t *)getkTCCServiceAddressBookSymbolLoc_ptr;
  v37 = (void *)getkTCCServiceAddressBookSymbolLoc_ptr;
  if (!getkTCCServiceAddressBookSymbolLoc_ptr)
  {
    v5 = (void *)TCCLibrary();
    v4 = (uint64_t *)dlsym(v5, "kTCCServiceAddressBook");
    v35[3] = (uint64_t)v4;
    getkTCCServiceAddressBookSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v34, 8);
  if (!v4)
    goto LABEL_36;
  v6 = *v4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v7 = gettcc_service_singleton_for_CF_nameSymbolLoc_ptr;
  v37 = gettcc_service_singleton_for_CF_nameSymbolLoc_ptr;
  if (!gettcc_service_singleton_for_CF_nameSymbolLoc_ptr)
  {
    v8 = (void *)TCCLibrary();
    v7 = dlsym(v8, "tcc_service_singleton_for_CF_name");
    v35[3] = (uint64_t)v7;
    gettcc_service_singleton_for_CF_nameSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v34, 8);
  if (!v7)
    goto LABEL_36;
  ((void (*)(uint64_t))v7)(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v10 = gettcc_message_options_createSymbolLoc_ptr;
  v37 = gettcc_message_options_createSymbolLoc_ptr;
  if (!gettcc_message_options_createSymbolLoc_ptr)
  {
    v11 = (void *)TCCLibrary();
    v10 = dlsym(v11, "tcc_message_options_create");
    v35[3] = (uint64_t)v10;
    gettcc_message_options_createSymbolLoc_ptr = v10;
  }
  _Block_object_dispose(&v34, 8);
  if (!v10)
    goto LABEL_36;
  ((void (*)(void))v10)();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v13 = gettcc_message_options_set_reply_handler_policySymbolLoc_ptr;
  v37 = gettcc_message_options_set_reply_handler_policySymbolLoc_ptr;
  if (!gettcc_message_options_set_reply_handler_policySymbolLoc_ptr)
  {
    v14 = (void *)TCCLibrary();
    v13 = dlsym(v14, "tcc_message_options_set_reply_handler_policy");
    v35[3] = (uint64_t)v13;
    gettcc_message_options_set_reply_handler_policySymbolLoc_ptr = v13;
  }
  _Block_object_dispose(&v34, 8);
  if (!v13)
    goto LABEL_36;
  ((void (*)(id, uint64_t))v13)(v12, 1);

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v15 = gettcc_credential_singleton_for_selfSymbolLoc_ptr;
  v37 = gettcc_credential_singleton_for_selfSymbolLoc_ptr;
  if (!gettcc_credential_singleton_for_selfSymbolLoc_ptr)
  {
    v16 = (void *)TCCLibrary();
    v15 = dlsym(v16, "tcc_credential_singleton_for_self");
    v35[3] = (uint64_t)v15;
    gettcc_credential_singleton_for_selfSymbolLoc_ptr = v15;
  }
  _Block_object_dispose(&v34, 8);
  if (v15)
  {
    ((void (*)(void))v15)();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v18 = gettcc_server_singleton_defaultSymbolLoc_ptr;
    v37 = gettcc_server_singleton_defaultSymbolLoc_ptr;
    if (!gettcc_server_singleton_defaultSymbolLoc_ptr)
    {
      v19 = (void *)TCCLibrary();
      v18 = dlsym(v19, "tcc_server_singleton_default");
      v35[3] = (uint64_t)v18;
      gettcc_server_singleton_defaultSymbolLoc_ptr = v18;
    }
    _Block_object_dispose(&v34, 8);
    if (v18)
    {
      ((void (*)(void))v18)();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2;
      v29[3] = &unk_1E4002670;
      v29[4] = &v30;
      v29[5] = v6;
      v21 = v20;
      v22 = v12;
      v23 = v17;
      v24 = v9;
      v25 = v29;
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v26 = gettcc_server_message_request_authorizationSymbolLoc_ptr;
      v37 = gettcc_server_message_request_authorizationSymbolLoc_ptr;
      if (!gettcc_server_message_request_authorizationSymbolLoc_ptr)
      {
        v27 = (void *)TCCLibrary();
        v26 = dlsym(v27, "tcc_server_message_request_authorization");
        v35[3] = (uint64_t)v26;
        gettcc_server_message_request_authorizationSymbolLoc_ptr = v26;
      }
      _Block_object_dispose(&v34, 8);
      if (v26)
      {
        ((void (*)(id, id, id, id, _QWORD, _QWORD *))v26)(v21, v22, v23, v24, 0, v25);

        v3 = *((_BYTE *)v31 + 24) != 0;
        goto LABEL_27;
      }
    }
    dlerror();
    result = abort_report_np();
  }
  else
  {
LABEL_36:
    dlerror();
    result = abort_report_np();
  }
  __break(1u);
  return result;
}

void sub_19E45C678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E45C8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _ShareSheetSupportsSharePlayStartFromApp()
{
  if (_ShareSheetSupportsSharePlayStartFromApp_onceToken != -1)
    dispatch_once(&_ShareSheetSupportsSharePlayStartFromApp_onceToken, &__block_literal_global_43);
  return _ShareSheetSupportsSharePlayStartFromApp_hostEntitledForSharePlay;
}

uint64_t _ShareSheetHostCanPerformActivitySkippingShareSheet()
{
  if (_ShareSheetHostCanPerformActivitySkippingShareSheet_onceToken != -1)
    dispatch_once(&_ShareSheetHostCanPerformActivitySkippingShareSheet_onceToken, &__block_literal_global_46);
  return _ShareSheetHostCanPerformActivitySkippingShareSheet_hostEntitledForPerformActivity;
}

id _ShareSheetRegisteredTypeIdentifiers(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v19 = *(_QWORD *)v27;
    v20 = v3;
    do
    {
      v7 = 0;
      v21 = v5;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("attachments"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v10 = v9;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v23;
              do
              {
                v14 = 0;
                do
                {
                  if (*(_QWORD *)v23 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v15, "objectForKey:", CFSTR("registeredTypeIdentifiers"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v16)
                      objc_msgSend(v2, "addObjectsFromArray:", v16);

                  }
                  ++v14;
                }
                while (v12 != v14);
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v12);
            }

            v6 = v19;
            v3 = v20;
            v5 = v21;
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  v17 = (void *)objc_msgSend(v2, "copy");
  return v17;
}

id _ShareSheetOpenInSupportedTypeIdentifiers(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ShareSheetRegisteredTypeIdentifiers(a1);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if (!SFIsImage())
        {

          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }

  v6 = v1;
LABEL_11:

  return v6;
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ContactsLibraryCore_frameworkLibrary)
  {
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ContactsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CNContactStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCNContactStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TCCLibrary()
{
  uint64_t v0;
  void *v2;

  if (!TCCLibraryCore_frameworkLibrary)
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = TCCLibraryCore_frameworkLibrary;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id __ItemsFromUIActivityItems(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[6];
  int8x16_t v36;
  void (*v37)(int8x16_t *, uint64_t, uint64_t, unsigned int);
  void *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[7];

  v57[5] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2;
  v52 = __Block_byref_object_dispose__2;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v1);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend((id)v49[5], "copy");
  v3 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = ____ItemsFromUIActivityItems_block_invoke;
  v41[3] = &unk_1E4002790;
  v41[4] = &v42;
  v41[5] = &v48;
  objc_msgSend(v2, "enumerateObjectsWithOptions:usingBlock:", 2, v41);

  v36.i64[0] = v3;
  v36.i64[1] = 3221225472;
  v37 = ____ItemsFromUIActivityItems_block_invoke_2;
  v38 = &unk_1E40027B8;
  v39 = &v48;
  v40 = &v42;
  ____ItemsFromUIActivityItems_block_invoke_2(&v36, 1024, v4, 0);
  v37(&v36, 512, *MEMORY[0x1E0CA5A58], 0);
  v37(&v36, 128, *MEMORY[0x1E0CA5C00], 0);
  v5 = *MEMORY[0x1E0CA5B90];
  v37(&v36, 2, *MEMORY[0x1E0CA5B90], 1u);
  v37(&v36, 64, *MEMORY[0x1E0CA5BF8], 1u);
  v37(&v36, 4096, *MEMORY[0x1E0CA5AC8], 1u);
  _UIActivityItemsWithTypes((void *)v49[5], 1, 1u, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v3;
  v35[1] = 3221225472;
  v35[2] = ____ItemsFromUIActivityItems_block_invoke_4;
  v35[3] = &unk_1E4002790;
  v35[4] = &v42;
  v35[5] = &v48;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v35);
  v37(&v36, 8, *MEMORY[0x1E0CA5B48], 0);
  v7 = *MEMORY[0x1E0CA5B20];
  v37(&v36, 2048, *MEMORY[0x1E0CA5B20], 0);
  v57[0] = *MEMORY[0x1E0CA5C90];
  v57[1] = v5;
  v8 = *MEMORY[0x1E0CA5C20];
  v57[2] = *MEMORY[0x1E0CA5C40];
  v57[3] = v8;
  v57[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = *MEMORY[0x1E0CB2CA8];
  v56 = *MEMORY[0x1E0CB2CA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIActivityItemsWithTypes((void *)v49[5], 0x4000, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v3;
  v30[1] = 3221225472;
  v30[2] = ____ItemsFromUIActivityItems_block_invoke_5;
  v30[3] = &unk_1E4002808;
  v12 = v9;
  v31 = v12;
  v13 = v10;
  v32 = v13;
  v33 = &v42;
  v34 = &v48;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);
  v14 = (void *)MEMORY[0x1E0C99DE8];
  _UIActivityItemsWithTypes((void *)v49[5], 4, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v25 = v6;
    v17 = v1;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v54, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend((id)v43[5], "addObject:", v22);
          objc_msgSend((id)v49[5], "removeObjectIdenticalTo:", v22);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v54, 16);
      }
      while (v19);
    }

    v6 = v25;
    v1 = v17;
  }
  v23 = (id)v43[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v23;
}

void sub_19E45D7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id __NSExtensionItemsFromUIActivityItems(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  char v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  _QWORD v63[2];
  void (*v64)(uint64_t, uint64_t, void *, unsigned int);
  void *v65;
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  uint64_t *v73;
  _QWORD v74[4];
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__2;
  v86 = __Block_byref_object_dispose__2;
  v87 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__2;
  v80 = __Block_byref_object_dispose__2;
  v81 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke;
  v74[3] = &unk_1E4002830;
  v33 = v5;
  v75 = v33;
  if ((____NSExtensionItemsFromUIActivityItems_block_invoke((uint64_t)v74) & 1) != 0)
    v34 = 1;
  else
    v34 = objc_msgSend(v6, "sourceAppIsManaged");
  v8 = (void *)objc_msgSend((id)v77[5], "copy");
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_2;
  v70[3] = &unk_1E4002858;
  v72 = &v82;
  v9 = v7;
  v71 = v9;
  v73 = &v76;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v70);

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v64 = ____NSExtensionItemsFromUIActivityItems_block_invoke_3;
  v65 = &unk_1E40028A8;
  v68 = &v76;
  v10 = v6;
  v66 = v10;
  v69 = &v82;
  v11 = v9;
  v67 = v11;
  ____NSExtensionItemsFromUIActivityItems_block_invoke_3((uint64_t)v63, 1024, (void *)*MEMORY[0x1E0CA5CB0], 0);
  v64((uint64_t)v63, 512, (void *)*MEMORY[0x1E0CA5A58], 0);
  v64((uint64_t)v63, 128, (void *)*MEMORY[0x1E0CA5C00], 0);
  v64((uint64_t)v63, 2, (void *)*MEMORY[0x1E0CA5B90], 1u);
  v64((uint64_t)v63, 64, (void *)*MEMORY[0x1E0CA5BF8], 1u);
  v64((uint64_t)v63, 4096, (void *)*MEMORY[0x1E0CA5AC8], 1u);
  _UIActivityItemsWithTypes((void *)v77[5], 1, 1u, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_5;
  v58[3] = &unk_1E40028F8;
  v12 = v10;
  v59 = v12;
  v61 = &v82;
  v13 = v11;
  v60 = v13;
  v62 = &v76;
  objc_msgSend(v36, "enumerateObjectsUsingBlock:", v58);
  v64((uint64_t)v63, 8, (void *)*MEMORY[0x1E0CA5B48], 0);
  v64((uint64_t)v63, 2048, (void *)*MEMORY[0x1E0CA5B20], 0);
  _UIActivityItemsWithTypes((void *)v77[5], 0x4000, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_7;
  v54[3] = &unk_1E4002920;
  v56 = &v82;
  v15 = v13;
  v55 = v15;
  v57 = &v76;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v54);
  v32 = v14;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2;
  v52 = __Block_byref_object_dispose__2;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  _UIActivityItemsWithTypes((void *)v77[5], 0x2000, 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99DE8];
  _UIActivityItemsWithTypes((void *)v77[5], 4, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_8;
  v43[3] = &unk_1E4002970;
  v19 = v18;
  v44 = v19;
  v20 = v15;
  v45 = v20;
  v46 = &v48;
  v47 = &v76;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v43);
  if (objc_msgSend(v19, "count"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v88, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v40;
      v24 = (void *)*MEMORY[0x1E0CA5C90];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          _NSItemProviderForUIActivityItem(v26, v24, v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend((id)v83[5], "addObject:", v27);
            if (v20)
              (*((void (**)(id, void *, void *))v20 + 2))(v20, v27, v26);
            objc_msgSend((id)v77[5], "removeObjectIdenticalTo:", v26);
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v88, 16);
      }
      while (v22);
    }

  }
  if (objc_msgSend((id)v83[5], "count"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    objc_msgSend(v28, "setAttachments:", v83[5]);
    objc_msgSend((id)v49[5], "insertObject:atIndex:", v28, 0);

  }
  v29 = (void *)v49[5];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_10;
  v37[3] = &__block_descriptor_33_e32_v32__0__NSExtensionItem_8Q16_B24l;
  v38 = v34;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v37);
  v30 = (id)v49[5];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  return v30;
}

void sub_19E45E35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

id _NSItemProviderForUIActivityItem(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char isKindOfClass;
  id v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void (**)(_QWORD, _QWORD, _QWORD));
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v9 = v7;
    v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v11 = *MEMORY[0x1E0CA5B90];
    v12 = MEMORY[0x1E0C809B0];
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = ___NSItemProviderForUIActivityItemImageRep_block_invoke;
    v39 = &unk_1E40028D0;
    v13 = v8;
    v40 = v13;
    objc_msgSend(v10, "registerItemForTypeIdentifier:loadHandler:", v11, &v36);
    objc_msgSend(v13, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v13, "asset");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) == 0)
    {
      getALAssetClass();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        v16 = 0;
LABEL_13:
        v41[0] = v12;
        v41[1] = 3221225472;
        v41[2] = ___NSItemProviderForUIActivityItemImageRep_block_invoke_3;
        v41[3] = &unk_1E40028D0;
        v42 = v13;
        v28 = v13;
        objc_msgSend(v10, "setPreviewImageHandler:", v41);

        goto LABEL_14;
      }
      objc_msgSend(v13, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      getALAssetPropertyAssetURL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForProperty:", v19);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v16)
    {
      v20 = *MEMORY[0x1E0CA5C90];
      v30 = v12;
      v31 = 3221225472;
      v32 = ___NSItemProviderForUIActivityItemImageRep_block_invoke_2;
      v33 = &unk_1E40029B8;
      v34 = v9;
      v16 = v16;
      v35 = v16;
      objc_msgSend(v10, "registerItemForTypeIdentifier:loadHandler:", v20, &v30);

    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "activityType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UIActivityGetTypeIdentifier(v5, v6, (uint64_t)v27);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "activityType");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thumbnailSize");
    +[_UIActivityItemMapping _itemProviderForActivityItem:typeIdentifier:thumbnailSize:activityType:](_UIActivityItemMapping, "_itemProviderForActivityItem:typeIdentifier:thumbnailSize:activityType:", v5, v9, v28);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v21 = v5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v22 = *MEMORY[0x1E0CA5C90];
  v23 = MEMORY[0x1E0C809B0];
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = ___NSItemProviderForUIActivityItemURLRep_block_invoke;
  v33 = &unk_1E40028D0;
  v24 = v21;
  v34 = v24;
  objc_msgSend(v10, "registerItemForTypeIdentifier:loadHandler:", v22, &v30);
  v36 = v23;
  v37 = 3221225472;
  v38 = ___NSItemProviderForUIActivityItemURLRep_block_invoke_2;
  v39 = &unk_1E40028D0;
  v9 = v24;
  v40 = v9;
  objc_msgSend(v10, "setPreviewImageHandler:", &v36);
  if (objc_msgSend(v9, "attachmentURLType"))
  {
    v43[0] = CFSTR("SLAttachmentURLType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "attachmentURLType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInfo:", v26);

  }
LABEL_15:

  return v10;
}

id _UIActivityGetTypeIdentifier(void *a1, void *a2, uint64_t a3)
{
  const __CFData *v5;
  id v6;
  void *v7;
  CGImageSource *v8;
  CGImageSource *v9;
  CFStringRef Type;
  const __CFData *v11;
  void *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  uint64_t v15;
  id v16;

  v5 = a1;
  v6 = a2;
  +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = CGImageSourceCreateWithData(v5, 0);
      if (v8)
      {
        v9 = v8;
        Type = CGImageSourceGetType(v8);
        CFRelease(v9);
      }
      else
      {
        Type = 0;
      }

      v7 = (void *)Type;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFData isFileURL](v5, "isFileURL"))
      {
        v11 = v5;
        _UIActivityUTIForURL(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "length"))
        {
          v13 = CGImageSourceCreateWithURL(v11, 0);
          v14 = v13;
          if (!v13)
          {
LABEL_13:

            v7 = v14;
            goto LABEL_14;
          }
          CGImageSourceGetType(v13);
          v15 = objc_claimAutoreleasedReturnValue();

          CFRelease(v14);
          v12 = (void *)v15;
        }
        v14 = v12;
        v12 = v14;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  if (!objc_msgSend(v7, "length"))
  {
    v16 = v6;

    v7 = v16;
  }

  return v7;
}

void sub_19E45F308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _NSExtensionItemsFromActivityItemValues(void *a1)
{
  return __NSExtensionItemsFromUIActivityItems(a1, 0, 0);
}

id _NSExtensionItemsFromActivityItemValuesWithProcessingBlock(void *a1, void *a2)
{
  return __NSExtensionItemsFromUIActivityItems(a1, 0, a2);
}

id _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(void *a1, void *a2)
{
  return __NSExtensionItemsFromUIActivityItems(a1, a2, 0);
}

uint64_t _UICanExcludeExtensionActivities()
{
  if (_UICanExcludeExtensionActivities_onceToken != -1)
    dispatch_once(&_UICanExcludeExtensionActivities_onceToken, &__block_literal_global_15);
  return _UICanExcludeExtensionActivities_hostHasEntitlement;
}

BOOL _UIExtensionElectionStateIsIgnore(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "applicationExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_plugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userElection");

  return v3 == 2;
}

uint64_t _UIShouldExcludeExtensionWithActivityType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ExtensionTester.NullPlugin")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ExtensionTester.NullShareSheet")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ist.AppleDirectory.extension")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.contextkit.ProofOfContext.ContentExtractionActionExtension")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.GuiTestApp.LANonUIActionExtension.LANonUIActionExtension"));
  }

  return v2;
}

Class initALAsset()
{
  Class result;

  if (AssetsLibraryLibrary_sOnce_0 != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_37_0);
  result = objc_getClass("ALAsset");
  classALAsset = (uint64_t)result;
  getALAssetClass = (uint64_t (*)())ALAssetFunction;
  return result;
}

id ALAssetFunction()
{
  return (id)classALAsset;
}

id initValALAssetPropertyAssetURL()
{
  id *v0;

  if (AssetsLibraryLibrary_sOnce_0 != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_37_0);
  v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib_0, "ALAssetPropertyAssetURL");
  if (v0)
    objc_storeStrong((id *)&constantValALAssetPropertyAssetURL, *v0);
  getALAssetPropertyAssetURL = (uint64_t (*)())ALAssetPropertyAssetURLFunction;
  return (id)constantValALAssetPropertyAssetURL;
}

id ALAssetPropertyAssetURLFunction()
{
  return (id)constantValALAssetPropertyAssetURL;
}

id initValALAssetsLibraryErrorDomain()
{
  id *v0;

  if (AssetsLibraryLibrary_sOnce_0 != -1)
    dispatch_once(&AssetsLibraryLibrary_sOnce_0, &__block_literal_global_37_0);
  v0 = (id *)dlsym((void *)AssetsLibraryLibrary_sLib_0, "ALAssetsLibraryErrorDomain");
  if (v0)
    objc_storeStrong((id *)&constantValALAssetsLibraryErrorDomain, *v0);
  getALAssetsLibraryErrorDomain = (uint64_t (*)())ALAssetsLibraryErrorDomainFunction;
  return (id)constantValALAssetsLibraryErrorDomain;
}

id ALAssetsLibraryErrorDomainFunction()
{
  return (id)constantValALAssetsLibraryErrorDomain;
}

void sub_19E460324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19E460884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSAddParticipantsViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCSAddParticipantsViewControllerClass_softClass;
  v7 = getCSAddParticipantsViewControllerClass_softClass;
  if (!getCSAddParticipantsViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCSAddParticipantsViewControllerClass_block_invoke;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getCSAddParticipantsViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E460BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFAirDropViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingUILibraryCore_frameworkLibrary_3)
  {
    SharingUILibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!SharingUILibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFAirDropViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFAirDropViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getSFAirDropViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCSSharingOptionsViewControllerClass_block_invoke(uint64_t a1)
{
  CloudSharingUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CSSharingOptionsViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCSSharingOptionsViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCSSharingOptionsViewControllerClass_block_invoke_cold_1();
    CloudSharingUILibrary();
  }
}

void CloudSharingUILibrary()
{
  void *v0;

  if (!CloudSharingUILibraryCore_frameworkLibrary)
    CloudSharingUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CloudSharingUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCSAddParticipantsViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CloudSharingUILibrary();
  result = objc_getClass("CSAddParticipantsViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCSAddParticipantsViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCSAddParticipantsViewControllerClass_block_invoke_cold_1();
    return (Class)-[NSItemProvider(SHSheetGroupActivity) loadGroupActivityMetadataWithCompletion:](v3);
  }
  return result;
}

Class initLPLinkMetadata_1()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_3 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_3, &__block_literal_global_16);
  result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata_1 = (uint64_t)result;
  getLPLinkMetadataClass_2 = (uint64_t (*)())LPLinkMetadataFunction_1;
  return result;
}

id LPLinkMetadataFunction_1()
{
  return (id)classLPLinkMetadata_1;
}

id SHSheetCustomHeaderButtonTitle(int a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _ShareSheetBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_SHAREPLAY_BUTTON_TITLE"), CFSTR("SharePlay"), CFSTR("Localizable"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v5;
    v24[1] = *MEMORY[0x1E0DC32A0];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithString:attributes:", v4, v7);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("shareplay"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
    objc_msgSend(v15, "setImage:", v14);
    if (UIAccessibilityIsInvertColorsEnabled())
    {
      objc_msgSend(v8, "size");
      v17 = v16 + 2.0;
      objc_msgSend(v14, "size");
      v19 = v18;
      objc_msgSend(v14, "size");
      objc_msgSend(v15, "setBounds:", 0.0, -2.0, v19 * (v17 / v20), v17);
    }
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "appendAttributedString:", v8);
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

id SHSheetCustomHeaderButtonColor(int a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "resolvedColorWithTraitCollection:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id SHSheetCollaborationModeTitle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "BOOLValue") & 1) == 0)
  {
    _ShareSheetBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEND_LINK"), CFSTR("Send Link"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SHSheetTintColor()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "isEqual:", v5))
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v2, "isEqual:", v6);

        if (!v7)
          return v2;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v8;
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

Class initQLPreviewController()
{
  Class result;

  if (QuickLookLibrary_sOnce_1 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_1, &__block_literal_global_214);
  result = objc_getClass("QLPreviewController");
  classQLPreviewController = (uint64_t)result;
  getQLPreviewControllerClass = (uint64_t (*)())QLPreviewControllerFunction;
  return result;
}

id QLPreviewControllerFunction()
{
  return (id)classQLPreviewController;
}

Class initQLDismissAction()
{
  Class result;

  if (QuickLookLibrary_sOnce_1 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_1, &__block_literal_global_214);
  result = objc_getClass("QLDismissAction");
  classQLDismissAction = (uint64_t)result;
  getQLDismissActionClass = (uint64_t (*)())QLDismissActionFunction;
  return result;
}

id QLDismissActionFunction()
{
  return (id)classQLDismissAction;
}

id canonicalPathForPath(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByResolvingSymlinksInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByStandardizingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

Class initFPSandboxingURLWrapper()
{
  Class result;

  if (FileProviderLibrary_sOnce != -1)
    dispatch_once(&FileProviderLibrary_sOnce, &__block_literal_global_19);
  result = objc_getClass("FPSandboxingURLWrapper");
  classFPSandboxingURLWrapper = (uint64_t)result;
  getFPSandboxingURLWrapperClass = (uint64_t (*)())FPSandboxingURLWrapperFunction;
  return result;
}

id FPSandboxingURLWrapperFunction()
{
  return (id)classFPSandboxingURLWrapper;
}

Class ___isUnitTesting_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  _isUnitTesting_isUnitTesting = result != 0;
  return result;
}

void sub_19E4699CC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_19E469B40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_19E46A0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46ABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46ADA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46AFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19E46B9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

Class initCKContainerSetupInfo()
{
  Class result;

  if (CloudKitLibrary_sOnce != -1)
    dispatch_once(&CloudKitLibrary_sOnce, &__block_literal_global_297);
  result = objc_getClass("CKContainerSetupInfo");
  classCKContainerSetupInfo = (uint64_t)result;
  getCKContainerSetupInfoClass = (uint64_t (*)())CKContainerSetupInfoFunction;
  return result;
}

id CKContainerSetupInfoFunction()
{
  return (id)classCKContainerSetupInfo;
}

Class initCKShare()
{
  Class result;

  if (CloudKitLibrary_sOnce != -1)
    dispatch_once(&CloudKitLibrary_sOnce, &__block_literal_global_297);
  result = objc_getClass("CKShare");
  classCKShare = (uint64_t)result;
  getCKShareClass = (uint64_t (*)())CKShareFunction;
  return result;
}

id CKShareFunction()
{
  return (id)classCKShare;
}

uint64_t _UIActivityHelperActivityItemsIncludeICloudDriveURL(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isFileURL", (_QWORD)v9))
        {
          if (CloudDocsLibrary_sOnce != -1)
            dispatch_once(&CloudDocsLibrary_sOnce, &__block_literal_global_23);
          if ((objc_msgSend(v6, "br_isInMobileDocuments") & 1) != 0)
          {
            v7 = 1;
            goto LABEL_15;
          }
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_15:

  return v7;
}

void sub_19E46F4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E46F860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E46FC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E471B58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19E473C30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19E47510C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4754B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4762D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E47A5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIActivityFromApplicationExtension(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionExcludedFromShareSheet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v1;
      v17 = 2112;
      v18 = CFSTR("NSExtensionExcludedFromShareSheet");
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Excluded extension:%@ reason:%@", (uint8_t *)&v15, 0x16u);
    }

    v6 = 0;
  }
  else
  {
    objc_msgSend(v1, "extensionPointIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.share-services"));

    if (v8
      || (objc_msgSend(v1, "identifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("net.box.BoxNet.collaborateShareExtension")),
          v9,
          v10))
    {
      v11 = (objc_class *)objc_opt_class();
    }
    else
    {
      objc_msgSend(v1, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "valueForKey:", CFSTR("UIApplicationExtensionIsFileProviderSpecific"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();

    }
    v6 = (void *)objc_msgSend([v11 alloc], "initWithApplicationExtension:", v1);
  }

  return v6;
}

id _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(void *a1, int a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a1;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("extensionItems");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("NSExtensionActivationRule"));
  if (a2)
  {
    objc_msgSend(&unk_1E403FC90, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("NSUserElection"));

  }
  return v5;
}

Class initMCProfileConnection_2()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce_2 != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce_2, &__block_literal_global_138);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_2 = (uint64_t)result;
  getMCProfileConnectionClass_2 = (uint64_t (*)())MCProfileConnectionFunction_2;
  return result;
}

id MCProfileConnectionFunction_2()
{
  return (id)classMCProfileConnection_2;
}

id _UIQLPreviewUTIForURLAndMimeType(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = InitializeQuickLookFunctions_onceToken;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_88);
  v6 = (void *)QLTypeCopyUTIForURLAndMimeTypeFx(v5, v4);

  return v6;
}

Class _UIQLPreviewControllerClass()
{
  return getQLPreviewControllerClass_0();
}

Class _UIQLDismissActionClass()
{
  return getQLDismissActionClass_0();
}

uint64_t _UIQLCanPreviewContentWithUTI(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = InitializeQuickLookFunctions_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_88);
  v3 = QLPreviewControllerSupportsContentTypeFx(v2);

  return v3;
}

uint64_t _UIQLCanPreviewItem(void *a1)
{
  Class (__cdecl *v1)();
  id v2;
  uint64_t v3;

  v1 = (Class (__cdecl *)())getQLPreviewControllerClass_0;
  v2 = a1;
  v3 = -[objc_class canPreviewItem:](v1(), "canPreviewItem:", v2);

  return v3;
}

uint64_t _UIQLPreviewNeedsHelpDecompressingURL(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = InitializeQuickLookFunctions_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&InitializeQuickLookFunctions_onceToken, &__block_literal_global_88);
  v3 = QLPreviewNeedsHelpUnzippingURLFx(v2);

  return v3;
}

Class initQLPreviewController_0()
{
  Class result;

  if (QuickLookLibrary_sOnce_2 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_26);
  result = objc_getClass("QLPreviewController");
  classQLPreviewController_0 = (uint64_t)result;
  getQLPreviewControllerClass_0 = (uint64_t (*)())QLPreviewControllerFunction_0;
  return result;
}

id QLPreviewControllerFunction_0()
{
  return (id)classQLPreviewController_0;
}

Class initQLDismissAction_0()
{
  Class result;

  if (QuickLookLibrary_sOnce_2 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_26);
  result = objc_getClass("QLDismissAction");
  classQLDismissAction_0 = (uint64_t)result;
  getQLDismissActionClass_0 = (uint64_t (*)())QLDismissActionFunction_0;
  return result;
}

id QLDismissActionFunction_0()
{
  return (id)classQLDismissAction_0;
}

void sub_19E47C0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E47C2A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19E47CC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E47CF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SHQuickNoteLog()
{
  if (SHQuickNoteLog_onceToken != -1)
    dispatch_once(&SHQuickNoteLog_onceToken, &__block_literal_global_28);
  return (id)SHQuickNoteLog___logger;
}

void sub_19E47DAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ExtensionKitLibrary()
{
  void *v0;

  if (!ExtensionKitLibraryCore_frameworkLibrary)
    ExtensionKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ExtensionKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

uint64_t SynapseLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SynapseLibraryCore_frameworkLibrary)
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SynapseLibraryCore_frameworkLibrary;
  if (!SynapseLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSYNotesActivationRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SynapseLibrary();
  result = objc_getClass("SYNotesActivationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSYNotesActivationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSYNotesActivationRequestClass_block_invoke_cold_1();
    return (Class)__getSYNotesActivationCommandClass_block_invoke(v3);
  }
  return result;
}

Class __getSYNotesActivationCommandClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  SynapseLibrary();
  result = objc_getClass("SYNotesActivationCommand");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSYNotesActivationCommandClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getSYNotesActivationCommandClass_block_invoke_cold_1();
    return (Class)+[UISUIActivityExtensionItemData supportsSecureCoding](v3, v4);
  }
  return result;
}

void sub_19E47EFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id SHSheetUISpecPlaceholderColor(uint64_t a1)
{
  double v1;
  double v2;
  double v3;

  if (a1 == 2)
  {
    v1 = 1.0;
    v2 = 1.0;
    v3 = 1.0;
  }
  else
  {
    v1 = 0.0;
    v2 = 0.0;
    v3 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v1, v2, v3, 0.05);
  return (id)objc_claimAutoreleasedReturnValue();
}

id UIActivityContentHelperOptionsButtonAction(int a1, void *a2, void *a3)
{
  Class (__cdecl *v5)();
  id v6;
  id v7;
  Class v8;
  void *v9;
  void *v10;

  v5 = (Class (__cdecl *)())getLPButtonActionClass;
  v6 = a3;
  v7 = a2;
  v8 = v5();
  UIActivityContentHelperOptionsButtonText(a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class actionWithTitle:image:handler:](v8, "actionWithTitle:image:handler:", v9, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id UIActivityContentHelperOptionsButtonText(int a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      _ShareSheetBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Options"), CFSTR("Options"), CFSTR("Localizable"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id UIActivityContentHelperCollaborationButtonAction(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    _ShareSheetBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Collaborative"), CFSTR("Collaborative"), CFSTR("Localizable"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_alloc(getLPImageClass());
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithPlatformImage:", v10);

  v12 = objc_alloc(getLPImageClass());
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPlatformImage:", v13);

  -[objc_class actionWithTitle:image:handler:](getLPButtonActionClass(), "actionWithTitle:image:handler:", v7, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setVisibleImage:", v11);
  objc_msgSend(v15, "setSelected:", a1);

  return v15;
}

id UIActivityContentHelperCopyButtonAction(int a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  _ShareSheetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Send Copy"), CFSTR("Send Copy"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(getLPImageClass());
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPlatformImage:", v7);

  v9 = objc_alloc(getLPImageClass());
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithPlatformImage:", v10);

  -[objc_class actionWithTitle:image:handler:](getLPButtonActionClass(), "actionWithTitle:image:handler:", v5, v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setVisibleImage:", v8);
  objc_msgSend(v12, "setSelected:", a1 ^ 1u);

  return v12;
}

id UIActivityContentHelperCollaborationSubtitle(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
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
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    _ShareSheetBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("COLLABORATION_HEADER_SUBTITLE"), CFSTR("Collaboration"), CFSTR("Localizable"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v26[1] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v9);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithHierarchicalColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("person.2.fill"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
  objc_msgSend(v17, "setImage:", v16);
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    objc_msgSend(v10, "size");
    v19 = v18 + 2.0;
    objc_msgSend(v16, "size");
    v21 = v20;
    objc_msgSend(v16, "size");
    objc_msgSend(v17, "setBounds:", 0.0, -2.0, v21 * (v19 / v22), v19);
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "appendAttributedString:", v10);
  return v24;
}

Class initLPButtonAction()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_4 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_4, &__block_literal_global_29);
  result = objc_getClass("LPButtonAction");
  classLPButtonAction = (uint64_t)result;
  getLPButtonActionClass = (uint64_t (*)())LPButtonActionFunction;
  return result;
}

id LPButtonActionFunction()
{
  return (id)classLPButtonAction;
}

Class initLPImage()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_4 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_4, &__block_literal_global_29);
  result = objc_getClass("LPImage");
  classLPImage = (uint64_t)result;
  getLPImageClass = (uint64_t (*)())LPImageFunction;
  return result;
}

id LPImageFunction()
{
  return (id)classLPImage;
}

void sub_19E480D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4832E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4833C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19E483614(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_19E48410C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v3);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(void *a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = a1;
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Attempt to invoke -%@ on %@, which is not supported for proxies to out-of-process activities."), v6, v5);

}

id _UIActivityGetBuiltinActivities()
{
  UISaveToCameraRollActivity *v0;
  UICopyToPasteboardActivity *v1;
  UIAssignToContactActivity *v2;
  UIPrintActivity *v3;
  _UICloudSharingActivity *v4;
  UIMessageActivity *v5;
  UIMailActivity *v6;
  SHQuickNoteActivity *v7;
  UIAddToHomeScreenActivity *v8;
  void *v9;
  UIAddToReadingListActivity *v11;
  SUIShareActivity *v12;
  UICollaborationCopyLinkActivity *v13;
  UICollaborationInviteWithLinkActivity *v14;
  UISharePlayActivity *v15;
  UIAirDropActivity *v16;
  _QWORD v17[17];

  v17[15] = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(UIAirDropActivity);
  v17[0] = v16;
  v15 = objc_alloc_init(UISharePlayActivity);
  v17[1] = v15;
  v14 = objc_alloc_init(UICollaborationInviteWithLinkActivity);
  v17[2] = v14;
  v13 = objc_alloc_init(UICollaborationCopyLinkActivity);
  v17[3] = v13;
  v12 = objc_alloc_init(SUIShareActivity);
  v17[4] = v12;
  v11 = objc_alloc_init(UIAddToReadingListActivity);
  v17[5] = v11;
  v0 = objc_alloc_init(UISaveToCameraRollActivity);
  v17[6] = v0;
  v1 = objc_alloc_init(UICopyToPasteboardActivity);
  v17[7] = v1;
  v2 = objc_alloc_init(UIAssignToContactActivity);
  v17[8] = v2;
  v3 = objc_alloc_init(UIPrintActivity);
  v17[9] = v3;
  v4 = objc_alloc_init(_UICloudSharingActivity);
  v17[10] = v4;
  v5 = objc_alloc_init(UIMessageActivity);
  v17[11] = v5;
  v6 = objc_alloc_init(UIMailActivity);
  v17[12] = v6;
  v7 = objc_alloc_init(SHQuickNoteActivity);
  v17[13] = v7;
  v8 = objc_alloc_init(UIAddToHomeScreenActivity);
  v17[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _UIActivityGetPrintingBasedActivities()
{
  if (_UIActivityGetPrintingBasedActivities_once != -1)
    dispatch_once(&_UIActivityGetPrintingBasedActivities_once, &__block_literal_global_30);
  return (id)_UIActivityGetPrintingBasedActivities___printingBasedActivities;
}

id _UIActivityGetOrderedBuiltinActivitiesFromActivities(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    +[_UIActivityUserDefaults builtinActivityOrder](_UIActivityUserDefaults, "builtinActivityOrder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___UIActivityGetOrderedBuiltinActivitiesFromActivities_block_invoke;
    v6[3] = &unk_1E4003298;
    v7 = v2;
    v3 = v2;
    objc_msgSend(v1, "sortedArrayWithOptions:usingComparator:", 16, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

uint64_t _UIActivityCanDisplayActivityForApplicationProxy(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "appState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "isInstalled"))
    v3 = objc_msgSend(v2, "isRestricted") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t _UIActivityCanDisplayActivityForApplicationWithBundleID(uint64_t a1)
{
  void *v1;
  uint64_t CanDisplayActivityForApplicationProxy;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CanDisplayActivityForApplicationProxy = _UIActivityCanDisplayActivityForApplicationProxy(v1);

  return CanDisplayActivityForApplicationProxy;
}

void sub_19E486E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E487E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E48853C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E488AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E489748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ScanForPrintingItems(void *a1, void *a2, char *a3, char *a4, BOOL *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CGImageSource *v16;
  CGImageSource *v17;
  const __CFString *Type;
  BOOL v19;
  const __CFString *v20;
  CGImageSourceRef v21;
  char v22;
  void *v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          ScanForPrintingItems(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v10, a3, a4, a5);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }
LABEL_9:

    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintData:", v9))
    {
      objc_msgSend(v10, "addObject:", v9);
      v16 = CGImageSourceCreateWithData((CFDataRef)v9, 0);
      if (v16)
      {
        v17 = v16;
        Type = CGImageSourceGetType(v16);
        if (Type)
          v19 = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;
        else
          v19 = 0;
        CFRelease(v17);
      }
      else
      {
        v19 = 0;
      }
      if (*a3)
        v25 = 1;
      else
        v25 = v19;
      *a3 = v25;
      if (*a4)
        v26 = 1;
      else
        v26 = !v19;
      *a4 = v26;
      *a5 = !v19;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isFileURL"))
    {
      if (!objc_msgSend(MEMORY[0x1E0D80C28], "canPrintURL:", v9))
        goto LABEL_38;
      objc_msgSend(v10, "addObject:", v9);
      _UIActivityUTIForURL(v9);
      v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)v20;
      if (v20
        && UTTypeConformsTo(v20, (CFStringRef)*MEMORY[0x1E0CA5B90])
        && (v21 = CGImageSourceCreateWithURL((CFURLRef)v9, 0)) != 0)
      {
        CFRelease(v21);
        v22 = 1;
      }
      else
      {
        v22 = 0;
      }
      if (*a3)
        v27 = 1;
      else
        v27 = v22;
      *a3 = v27;
      v28 = v22 ^ 1;
      if (*a4)
        v29 = 1;
      else
        v29 = v28;
      *a4 = v29;
      *a5 = v28;
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "scheme");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "compare:options:", CFSTR("assets-library"), 1);

      if (!v24)
      {
        if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintURL:", v9))
        {
LABEL_16:
          objc_msgSend(v10, "addObject:", v9);
          *a3 = 1;
        }
      }
    }
  }
LABEL_38:

}

void initSFUILinkMetadataSerializationForLocalUseOnly_0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (SharingUILibraryCore_frameworkLibrary_4)
  {
    v5 = (void *)SharingUILibraryCore_frameworkLibrary_4;
  }
  else
  {
    SharingUILibraryCore_frameworkLibrary_4 = _sl_dlopen();
    v5 = (void *)SharingUILibraryCore_frameworkLibrary_4;
    if (!SharingUILibraryCore_frameworkLibrary_4)
    {
      v6 = (void *)abort_report_np();
      free(v6);
    }
  }
  softLinkSFUILinkMetadataSerializationForLocalUseOnly_0 = (uint64_t (*)())dlsym(v5, "SFUILinkMetadataSerializationForLocalUseOnly");
  ((void (*)(id, id))softLinkSFUILinkMetadataSerializationForLocalUseOnly_0)(v3, v4);

}

void sub_19E48F894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t _UISecureStandardPropertyListClasses()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v14 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return objc_msgSend(v14, "setWithObjects:", v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

id _UISecureDecodeExtensionItemsWithKey(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB35E0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "valueForKey:", CFSTR("_extensionContextHostProtocolAllowedClassesForItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  _UISecureStandardPropertyListClasses();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void _UISecureEncodeCGSizeWithKey(void *a1, void *a2, double a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a2;
  v9 = a1;
  objc_msgSend(v7, "valueWithCGSize:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v10, v8);

}

double _UISecureDecodeCGSizeWithKeyAndDefaultSize(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;

  v5 = a2;
  v6 = a1;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "CGSizeValue");
    a3 = v8;
  }

  return a3;
}

void sub_19E490374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke_1(uint64_t a1)
{
  LinkPresentationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary();
  }
}

void LinkPresentationLibrary()
{
  void *v0;

  if (!LinkPresentationLibraryCore_frameworkLibrary_1)
    LinkPresentationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!LinkPresentationLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getLPImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  LinkPresentationLibrary();
  result = objc_getClass("LPImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getLPImageClass_block_invoke_cold_1();
    return (Class)+[UIAddToReadingListActivity _xpcAttributes](v3, v4);
  }
  return result;
}

Class initSSReadingList()
{
  Class result;

  if (SafariServicesLibrary_sOnce_0 != -1)
    dispatch_once(&SafariServicesLibrary_sOnce_0, &__block_literal_global_35);
  result = objc_getClass("SSReadingList");
  classSSReadingList = (uint64_t)result;
  getSSReadingListClass = (uint64_t (*)())SSReadingListFunction;
  return result;
}

id SSReadingListFunction()
{
  return (id)classSSReadingList;
}

void sub_19E494544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initPHPhotoLibrary()
{
  Class result;

  if (PhotosLibrary_sOnce != -1)
    dispatch_once(&PhotosLibrary_sOnce, &__block_literal_global_140);
  result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary = (uint64_t)result;
  getPHPhotoLibraryClass = (uint64_t (*)())PHPhotoLibraryFunction;
  return result;
}

id PHPhotoLibraryFunction()
{
  return (id)classPHPhotoLibrary;
}

void sub_19E49576C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E495E10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E495E80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E495F40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E496074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E496140(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E496200(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id iconsToIncludeInIconArrayForDocumentProxy(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v1, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v1, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "addObject:", v4);
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v1, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v2, "addObject:", v5);
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v1, 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v2, "addObject:", v4);
  }

  return v2;
}

void sub_19E4968A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19E497684(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(void *a1, uint64_t a2)
{
  id *v3;
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id *v27;

  v3 = a1;
  v4 = v3[10];
  v27 = v3;
  v5 = _UIAppUseModernRotationAndPresentationBehaviors();
  if (v4)
  {
    if ((v5 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceIdiom"),
          v6,
          (v7 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v9 = v3[10];
      objc_msgSend(v27[19], "popoverPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarButtonItem:", v9);

      objc_msgSend(v3[10], "view");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v11)
      {
        v12 = v11;
        do
        {
          objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            break;
          objc_msgSend(v12, "superview");
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
        }
        while (v14);

      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v13, "presentViewController:animated:completion:", v27[19], a2, 0);

    }
    else
    {
      objc_msgSend(v27, "popoverController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v3[10], 15, a2);
    }
  }
  else if ((v5 & 1) != 0
         || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
             v15 = (void *)objc_claimAutoreleasedReturnValue(),
             v16 = objc_msgSend(v15, "userInterfaceIdiom"),
             v15,
             (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    v17 = *((double *)v27 + 5);
    v18 = *((double *)v27 + 6);
    v19 = *((double *)v27 + 7);
    v20 = *((double *)v27 + 8);
    objc_msgSend(v27[19], "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceRect:", v17, v18, v19, v20);

    v22 = v27[9];
    objc_msgSend(v27[19], "popoverPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSourceView:", v22);

    v24 = v27[9];
    if (v24)
    {
      v25 = v24;
      do
      {
        objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          break;
        objc_msgSend(v25, "superview");
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v26;
      }
      while (v26);

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "presentViewController:animated:completion:", v27[19], a2, 0);
  }
  else
  {
    objc_msgSend(v27, "popoverController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v27[9], 15, a2, *((double *)v27 + 5), *((double *)v27 + 6), *((double *)v27 + 7), *((double *)v27 + 8));
  }

}

void sub_19E497D54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19E498228(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_19E498A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_19E4991E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void sub_19E4996A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19E499854(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19E499CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E49A178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __genericDocumentIcons_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CA58C8];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/tmp/content"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "documentProxyForURL:isContentManaged:sourceAuditToken:", v1, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  iconsToIncludeInIconArrayForDocumentProxy(v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)genericDocumentIcons_icons;
  genericDocumentIcons_icons = v2;

}

void __passKitIconsIfIsPassKitDocument_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (PassKitLibrary_sOnce != -1)
    dispatch_once(&PassKitLibrary_sOnce, &__block_literal_global_424);
  if (PassKitUILibrary_sOnce != -1)
    dispatch_once(&PassKitUILibrary_sOnce, &__block_literal_global_426);
  v2 = objc_alloc_init(NSClassFromString(CFSTR("PKPass")));
  objc_msgSend(v2, "mailAttachmentIcon");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)passKitIconsIfIsPassKitDocument_genericPassIcon;
  passKitIconsIfIsPassKitDocument_genericPassIcon = v0;

}

void initFPExtendBookmarkForDocumentURL(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = FileProviderLibrary_sOnce_0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&FileProviderLibrary_sOnce_0, &__block_literal_global_431);
  softLinkFPExtendBookmarkForDocumentURL = (uint64_t (*)())dlsym((void *)FileProviderLibrary_sLib_0, "FPExtendBookmarkForDocumentURL");
  ((void (*)(uint64_t, uint64_t, id))softLinkFPExtendBookmarkForDocumentURL)(a1, a2, v6);

}

void sub_19E49C82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id tempURLForJobName(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("%2F"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "length") >= 0x51)
  {
    objc_msgSend(v1, "substringToIndex:", 80);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@.pdf"), v4, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

Class initMCProfileConnection_3()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce_3 != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce_3, &__block_literal_global_38);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection_3 = (uint64_t)result;
  getMCProfileConnectionClass_3 = (uint64_t (*)())MCProfileConnectionFunction_3;
  return result;
}

id MCProfileConnectionFunction_3()
{
  return (id)classMCProfileConnection_3;
}

void sh_dispatch_on_main_queue(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      block[2]();
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
    v1 = block;
  }

}

void sub_19E49D4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19E49D7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19E49DB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19E49EC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_19E4A0DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19E4A158C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initSFUILoadedMetadataCollection()
{
  Class result;

  if (SharingUILibrary_sOnce_0 != -1)
    dispatch_once(&SharingUILibrary_sOnce_0, &__block_literal_global_39);
  result = objc_getClass("SFUILoadedMetadataCollection");
  classSFUILoadedMetadataCollection = (uint64_t)result;
  getSFUILoadedMetadataCollectionClass = (uint64_t (*)())SFUILoadedMetadataCollectionFunction;
  return result;
}

id SFUILoadedMetadataCollectionFunction()
{
  return (id)classSFUILoadedMetadataCollection;
}

void _UIShimSetIsContentManaged(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setIsContentManaged:", a2);
  else
    objc_msgSend(v3, "setSourceIsManaged:", a2);

}

void _UIShimSetUnderbarIsContentManaged(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setIsContentManaged:", a2);
  else
    objc_msgSend(v3, "_setSourceIsManaged:", a2);

}

Class initTUCallCenter()
{
  Class result;

  if (TelephonyUtilitiesLibrary_sOnce != -1)
    dispatch_once(&TelephonyUtilitiesLibrary_sOnce, &__block_literal_global_53);
  result = objc_getClass("TUCallCenter");
  classTUCallCenter = (uint64_t)result;
  getTUCallCenterClass = (uint64_t (*)())TUCallCenterFunction;
  return result;
}

id TUCallCenterFunction()
{
  return (id)classTUCallCenter;
}

void sub_19E4A252C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4A2AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFBSceneWorkspaceClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  FrontBoardLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FBSceneWorkspace");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFBSceneWorkspaceClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)__getFBSceneWorkspaceClass_block_invoke_cold_1();
    __UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v2, v3);
  }
}

void __UIEnumerateApplicationsInPreferredOrderForOpeningDocument(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, uint64_t, uint64_t, char *);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = *MEMORY[0x1E0CA59C8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CA59C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationsAvailableForOpeningWithHandlerRanks:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v3, "applicationsAvailableForOpeningWithError:", 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
      v16 = objc_msgSend(v9, "containsObject:", v15);
      v17 = 0;
      v4[2](v4, v15, v16, &v17);
      if (v17)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

void _UIEnumerateApplicationsInPreferredOrderForOpeningDocument(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "containerOwnerApplicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___UIEnumerateApplicationsInPreferredOrderForOpeningDocument_block_invoke;
  v13[3] = &unk_1E4003A48;
  v14 = v6;
  v15 = v8;
  v16 = v5;
  v17 = v7;
  v9 = v7;
  v10 = v5;
  v11 = v8;
  v12 = v6;
  __UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v10, v13);

}

uint64_t _UISUIActivityRealActivityTypeForOpeningDocumentWithApplicationID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.UIKit.activity.OpenWithApp-%@"), a1);
}

id _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("applicationIdentifier");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x1E0C99D80];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _UISUIActivityExtensionItemDataRequestForOpeningDocumentWithApplicationByCopy(void *a1, int a2)
{
  __CFString **v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = UIActivityTypeRemoteOpenInApplicationUsingByCopyOpeningMethod;
  if (!a2)
    v3 = UIActivityTypeRemoteOpenInApplicationUsingInPlaceOpeningMethod;
  v4 = *v3;
  _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  +[UISUIActivityExtensionItemDataRequest requestForActivity:activityType:activitySpecificMetadata:](UISUIActivityExtensionItemDataRequest, "requestForActivity:activityType:activitySpecificMetadata:", v6, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(void *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a1;
  if (objc_msgSend(a2, "ui_canOpenInPlace"))
  {
    objc_msgSend(v3, "dataContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t _UIApplicationCanOpenInPlaceByReferenceOriginalFile(void *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if (objc_msgSend(a2, "ui_canOpenInPlace"))
    v4 = objc_msgSend(v3, "supportsOpenInPlace");
  else
    v4 = 0;

  return v4;
}

BOOL _UIIsArchiveExtension(void *a1)
{
  __CFString *v1;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v3;
  _BOOL8 v4;

  v1 = a1;
  if (v1
    && (PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v1, 0)) != 0)
  {
    v3 = PreferredIdentifierForTag;
    v4 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E0CA5CE0])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5B70])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5AF0])
      || UTTypeConformsTo(v3, CFSTR("org.gnu.gnu-tar-archive")) != 0;
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _UIIsIWorkArchiveURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *PreferredIdentifierForTag;
  void *v11;
  uint64_t v12;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "pathExtension"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = _UIIsArchiveExtension(v3),
        v3,
        v4))
  {
    objc_msgSend(v2, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIStringByDeletingArchiveExtensions(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = (const __CFString *)*MEMORY[0x1E0CA5A88];
      objc_msgSend(v6, "pathExtension");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v8, v9, 0);

      -[__CFString lowercaseString](PreferredIdentifierForTag, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.iwork"));

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id _UIStringByDeletingArchiveExtensions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    while (_UIIsArchiveExtension(v3))
    {
      objc_msgSend(v2, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", v3);

      if ((v5 & 1) == 0)
        objc_msgSend(v2, "insertObject:atIndex:", v3, 0);
      objc_msgSend(v1, "stringByDeletingPathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v7;
      v1 = v6;
      if (!objc_msgSend(v7, "length"))
        goto LABEL_8;
    }
  }
  v6 = v1;
  v7 = v3;
LABEL_8:

  return v6;
}

id _UIActivityDefaultOpenApplicationLaunchServiceOptions()
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D22DA8];
  v2[0] = *MEMORY[0x1E0D22D88];
  v2[1] = v0;
  v3[0] = MEMORY[0x1E0C9AAB0];
  v3[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void _setIsContentManagedIfResctrictableActivity(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE52FA60))
    objc_msgSend(v3, "setIsContentManaged:", a2);

}

uint64_t _canPerformActivityWithItems(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  id v15;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE52FA60))
    objc_msgSend(v7, "setSourceApplicationBundleID:", v9);
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v7, "canPerformWithCollaborationItem:activityItems:", v10, v8);
LABEL_8:
    v12 = v11;
    goto LABEL_9;
  }
  if (objc_msgSend((id)objc_opt_class(), "activityCategory"))
  {
LABEL_7:
    v11 = objc_msgSend(v7, "canPerformWithActivityItems:", v8);
    goto LABEL_8;
  }
  objc_msgSend(v10, "sendCopyItemPlaceholderValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _UIActivityItemTypesSet(v14);
  if (v14)
    v15 = v14;
  else
    v15 = v8;
  v12 = objc_msgSend(v7, "canPerformWithActivityItems:", v15);
  if (v14)
  {
    _UIActivityItemTypesSet(v8);

  }
LABEL_9:

  return v12;
}

id _mapArray(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

void sub_19E4A6C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void PeopleSuggesterLibrary()
{
  void *v0;

  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
    PeopleSuggesterLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

Class initCNContactPickerViewController()
{
  Class result;

  if (ContactsUILibrary_sOnce != -1)
    dispatch_once(&ContactsUILibrary_sOnce, &__block_literal_global_44);
  result = objc_getClass("CNContactPickerViewController");
  classCNContactPickerViewController = (uint64_t)result;
  getCNContactPickerViewControllerClass = (uint64_t (*)())CNContactPickerViewControllerFunction;
  return result;
}

id CNContactPickerViewControllerFunction()
{
  return (id)classCNContactPickerViewController;
}

Class initCNContactViewController()
{
  Class result;

  if (ContactsUILibrary_sOnce != -1)
    dispatch_once(&ContactsUILibrary_sOnce, &__block_literal_global_44);
  result = objc_getClass("CNContactViewController");
  classCNContactViewController = (uint64_t)result;
  getCNContactViewControllerClass = (uint64_t (*)())CNContactViewControllerFunction;
  return result;
}

id CNContactViewControllerFunction()
{
  return (id)classCNContactViewController;
}

id initValCNContactThumbnailImageDataKey()
{
  id *v0;

  if (ContactsLibrary_sOnce != -1)
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_139);
  v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactThumbnailImageDataKey");
  if (v0)
    objc_storeStrong((id *)&constantValCNContactThumbnailImageDataKey, *v0);
  getCNContactThumbnailImageDataKey = (uint64_t (*)())CNContactThumbnailImageDataKeyFunction;
  return (id)constantValCNContactThumbnailImageDataKey;
}

id CNContactThumbnailImageDataKeyFunction()
{
  return (id)constantValCNContactThumbnailImageDataKey;
}

id initValCNContactCropRectKey()
{
  id *v0;

  if (ContactsLibrary_sOnce != -1)
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_139);
  v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactCropRectKey");
  if (v0)
    objc_storeStrong((id *)&constantValCNContactCropRectKey, *v0);
  getCNContactCropRectKey = (uint64_t (*)())CNContactCropRectKeyFunction;
  return (id)constantValCNContactCropRectKey;
}

id CNContactCropRectKeyFunction()
{
  return (id)constantValCNContactCropRectKey;
}

id initValCNContactFullscreenImageDataKey()
{
  id *v0;

  if (ContactsLibrary_sOnce != -1)
    dispatch_once(&ContactsLibrary_sOnce, &__block_literal_global_139);
  v0 = (id *)dlsym((void *)ContactsLibrary_sLib, "CNContactFullscreenImageDataKey");
  if (v0)
    objc_storeStrong((id *)&constantValCNContactFullscreenImageDataKey, *v0);
  getCNContactFullscreenImageDataKey = (uint64_t (*)())CNContactFullscreenImageDataKeyFunction;
  return (id)constantValCNContactFullscreenImageDataKey;
}

id CNContactFullscreenImageDataKeyFunction()
{
  return (id)constantValCNContactFullscreenImageDataKey;
}

void sub_19E4AA280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SHSheetIsPresentedInPopover(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = 1;
  objc_msgSend(v1, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v1, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v1, "_popoverController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v5 != 0;

    }
  }

  return v2;
}

uint64_t SHSheetPresentationControllerPresentationStyle(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "presentationStyle");

  return v2;
}

void sub_19E4AB80C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19E4ABB3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

Class initSFAirDropViewController()
{
  Class result;

  if (SharingUILibrary_sOnce_1 != -1)
    dispatch_once(&SharingUILibrary_sOnce_1, &__block_literal_global_46);
  result = objc_getClass("SFAirDropViewController");
  classSFAirDropViewController = (uint64_t)result;
  getSFAirDropViewControllerClass = (uint64_t (*)())SFAirDropViewControllerFunction;
  return result;
}

id SFAirDropViewControllerFunction()
{
  return (id)classSFAirDropViewController;
}

void sub_19E4ADFC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  id v10;
  NSObject *v11;

  if (a2 == 1)
  {
    v10 = objc_begin_catch(exception_object);
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SHSheetImageIdentificationUtilities personIdResultsFromImage:].cold.2((uint64_t)v10, v11);

    objc_end_catch();
    JUMPOUT(0x19E4ADFA0);
  }
  _Unwind_Resume(exception_object);
}

id getMADPersonIdentificationRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMADPersonIdentificationRequestClass_softClass;
  v7 = getMADPersonIdentificationRequestClass_softClass;
  if (!getMADPersonIdentificationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMADPersonIdentificationRequestClass_block_invoke;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getMADPersonIdentificationRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E4AE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMADPersonIdentificationRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADPersonIdentificationRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADPersonIdentificationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADPersonIdentificationRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary();
  }
}

void MediaAnalysisServicesLibrary()
{
  void *v0;

  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getMADServiceClass_block_invoke(uint64_t a1)
{
  _UIActivityGroupViewFlowLayout *v2;
  SEL v3;
  id v4;

  MediaAnalysisServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (_UIActivityGroupViewFlowLayout *)__getMADServiceClass_block_invoke_cold_1();
    -[_UIActivityGroupViewFlowLayout setEditingGestureRecognizer:](v2, v3, v4);
  }
}

void sub_19E4AF064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4B0D58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19E4B0F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPiTunesMediaPlaylistMetadataClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LinkPresentationLibraryCore_frameworkLibrary_2)
  {
    LinkPresentationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!LinkPresentationLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LPiTunesMediaPlaylistMetadata");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1();
    free(v3);
  }
  getLPiTunesMediaPlaylistMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E4B16B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initSLComposeViewController()
{
  Class result;

  if (SocialLibrary_sOnce != -1)
    dispatch_once(&SocialLibrary_sOnce, &__block_literal_global_48);
  result = objc_getClass("SLComposeViewController");
  classSLComposeViewController = (uint64_t)result;
  getSLComposeViewControllerClass = (uint64_t (*)())SLComposeViewControllerFunction;
  return result;
}

id SLComposeViewControllerFunction()
{
  return (id)classSLComposeViewController;
}

Class initSSVMediaSocialShareExtension()
{
  Class result;

  if (StoreServicesLibrary_sOnce != -1)
    dispatch_once(&StoreServicesLibrary_sOnce, &__block_literal_global_111);
  result = objc_getClass("SSVMediaSocialShareExtension");
  classSSVMediaSocialShareExtension = (uint64_t)result;
  getSSVMediaSocialShareExtensionClass = (uint64_t (*)())SSVMediaSocialShareExtensionFunction;
  return result;
}

id SSVMediaSocialShareExtensionFunction()
{
  return (id)classSSVMediaSocialShareExtension;
}

void sub_19E4B3650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

UISUISecurityContext *airdropSupplementalSecurityContextForURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UISUISecurityContext *v7;

  v1 = a1;
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("/var/tmp"), CFSTR("/var/mobile"), CFSTR("/var/root"), CFSTR("/var"), CFSTR("/"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISUISecurityScopedResource scopedResourcesForAncestorsOfItemWithAbsolutePath:traversalStopPaths:allowedAccess:](UISUIAirDropSecurityScopedResource, "scopedResourcesForAncestorsOfItemWithAbsolutePath:traversalStopPaths:allowedAccess:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISUISecurityScopedResource scopedResourceWithURL:allowedAccess:](UISUIAirDropSecurityScopedResource, "scopedResourceWithURL:allowedAccess:", v1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = -[UISUISecurityContext initWithSecurityScopedResources:]([UISUISecurityContext alloc], "initWithSecurityScopedResources:", v4);

  return v7;
}

void sub_19E4B3FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4B761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4B78E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E4B7A58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19E4B7CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E4B91A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIActivityGroupActivityCellFont(void *a1, void *a2)
{
  NSString *v3;
  id v4;
  NSString *v5;
  NSComparisonResult v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = a1;
  v4 = a2;
  if (v3 && UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    maximumSizeCategory(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = UIContentSizeCategoryCompareToCategory(v3, v5);

    if (v6 != NSOrderedAscending)
    {
      maximumSizeCategory(v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v7;
    }
    v8 = (void *)MEMORY[0x1E0DC37F0];
    v9 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v12, 0.0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_scaledValueForValue:", 11.0);
    objc_msgSend(v14, "systemFontOfSize:");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  return v15;
}

_UIActivityGroupActivityCellTitleLabel *createTitleLabel()
{
  _UIActivityGroupActivityCellTitleLabel *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(_UIActivityGroupActivityCellTitleLabel);
  objc_msgSend(MEMORY[0x1E0DC3658], "darkTextColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCellTitleLabel setTextColor:](v0, "setTextColor:", v1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCellTitleLabel setBackgroundColor:](v0, "setBackgroundColor:", v2);

  -[_UIActivityGroupActivityCellTitleLabel setMinimumScaleFactor:](v0, "setMinimumScaleFactor:", 0.75);
  -[_UIActivityGroupActivityCellTitleLabel setTextAlignment:](v0, "setTextAlignment:", 1);
  return v0;
}

double getChickletSize()
{
  void *v0;
  double v1;
  double v2;

  +[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;

  return v2;
}

double getTitleLabelHeightForWidthTextAndSizeCategory(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;

  v5 = a1;
  v6 = a2;
  v7 = (void *)sTitleLabel;
  if (!sTitleLabel)
  {
    createTitleLabel();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)sTitleLabel;
    sTitleLabel = v8;

    v7 = (void *)sTitleLabel;
  }
  objc_msgSend(v7, "setText:", v5);
  objc_msgSend((id)sTitleLabel, "sizeThatFits:sizeCategory:", v6, a3, 1.79769313e308);
  v11 = v10;
  NSLog(CFSTR("Returning this height for now %f"), *(_QWORD *)&v10);

  return v11;
}

id getTitleLabelFontForWidthTextAndSizeCategory(void *a1, double a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  v3 = a1;
  v4 = (void *)sTitleLabel;
  if (!sTitleLabel)
  {
    createTitleLabel();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)sTitleLabel;
    sTitleLabel = v5;

    v4 = (void *)sTitleLabel;
  }
  objc_msgSend(v4, "setText:", CFSTR("\n"));
  objc_msgSend((id)sTitleLabel, "sizeThatFits:sizeCategory:", v3, a2, 1.79769313e308);
  objc_msgSend((id)sTitleLabel, "setFrame:", 0.0, 0.0, a2, v7);
  objc_msgSend((id)sTitleLabel, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id maximumSizeCategory(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v7;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __maximumSizeCategory_block_invoke;
  block[3] = &unk_1E4001608;
  v7 = v1;
  v2 = maximumSizeCategory_onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&maximumSizeCategory_onceToken, block);
  v4 = (id)maximumSizeCategory_maxCategory;

  return v4;
}

void __maximumSizeCategory_block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id *v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = (id *)MEMORY[0x1E0DC48D8];
  if (v2 >= v1)
    v4 = v1;
  else
    v4 = v2;
  if (v4 > 320.0)
    v3 = (id *)MEMORY[0x1E0DC48D0];
  objc_storeStrong((id *)&maximumSizeCategory_maxCategory, *v3);
}

id getSFUIShareSheetActivityCellSpecClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSFUIShareSheetActivityCellSpecClass_softClass_0;
  v7 = getSFUIShareSheetActivityCellSpecClass_softClass_0;
  if (!getSFUIShareSheetActivityCellSpecClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSFUIShareSheetActivityCellSpecClass_block_invoke_0;
    v3[3] = &unk_1E4001370;
    v3[4] = &v4;
    __getSFUIShareSheetActivityCellSpecClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19E4BB248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFUIShareSheetActivityCellSpecClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingUILibraryCore_frameworkLibrary_5)
  {
    SharingUILibraryCore_frameworkLibrary_5 = _sl_dlopen();
    if (!SharingUILibraryCore_frameworkLibrary_5)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFUIShareSheetActivityCellSpec");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1();
    free(v3);
  }
  getSFUIShareSheetActivityCellSpecClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19E4C0638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SHSheetContentHelperFindScrollView(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3880];
  v2 = a1;
  objc_msgSend(v1, "predicateWithBlock:", &__block_literal_global_53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filteredArrayUsingPredicate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __getSLCollaborationFooterViewModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLPLinkMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SHSheetContentDataSourceManager _updateCurrentStateWithChangeRequest:].cold.1(v0);
}

uint64_t __getSFUIActivityImageProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_SWCollaborationShareOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getSFUIShareSheetRemoteSettingsHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1(v0);
}

uint64_t __getSFUIShareSheetActivityCellSpecClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1(v0);
}

void _loadItemProvidersFromActivityItemsStartingAtIndex_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Could not load any suitable representation of item at index %{public}d. Dropping it.", (uint8_t *)v2, 8u);
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_456_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_19E419000, v0, (uint64_t)v0, "Loading item at index %{public}d as  URL for copy type identifier caused an error: %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_459_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_19E419000, v0, (uint64_t)v0, "Loading item at index %{public}d as a URL caused an error: %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_461_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[18];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_4_0(&dword_19E419000, v2, (uint64_t)v2, "Loading item at index %{public}d as a data object of type %{public}@ caused an error: %{public}@", v3);
}

void ___loadItemProvidersFromActivityItemsStartingAtIndex_block_invoke_464_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_19E419000, v0, v1, "Could not move file representation of item at index %{public}d of type %{public}@ to a temporary location.", v2);
  OUTLINED_FUNCTION_1_0();
}

void _newTempDir_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_19E419000, a2, a3, "Could not create temporary directory. Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void _newTempDir_cold_2(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_19E419000, a1, v4, "Could not create temporary directory. Error: %s", (uint8_t *)&v5);
}

void ___loadItemProviderInline_block_invoke_478_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(*(Class *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67240706;
  v7[1] = MEMORY[0x1E0C83948];
  v8 = 2114;
  v9 = v5;
  v10 = 2114;
  v11 = a2;
  OUTLINED_FUNCTION_4_0(&dword_19E419000, a3, v6, "Loading item at index %{public}d as class %{public}@ caused an error: %{public}@", (uint8_t *)v7);

}

uint64_t __getFBSceneWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFBDisplayManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getFBDisplayManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[UIActivityContentViewController _configureAirDropCell:withChange:].cold.1(v0);
}

void _ShareSheetCurrentDeviceClassFromPresentationStyle_cold_1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_19E419000, a1, OS_LOG_TYPE_ERROR, "Screen size %{public}@ not recognized, falling back to 4.7\" iPhone specs", (uint8_t *)&v5, 0xCu);

}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:request:delegate:].cold.1(v0);
}

uint64_t __getSFAirDropViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCSSharingOptionsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSSharingOptionsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCSAddParticipantsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSAddParticipantsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_UIHostActivityProxy initWithCoder:].cold.1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_EXQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getSYNotesActivationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSYNotesActivationCommandClass_block_invoke_cold_1(v0);
}

uint64_t __getSYNotesActivationCommandClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SHSheetServiceManager update].cold.1(v0);
}

uint64_t __getLPImageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:].cold.1(v0);
}

uint64_t __getMADPersonIdentificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMADServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPiTunesMediaPlaylistMetadataClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return -[UISocialActivity initWithActivityType:].cold.1(v0, v1, v2);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
  MEMORY[0x1E0C9BFF8](c, mediaBox);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEndPage(CGContextRef c)
{
  MEMORY[0x1E0C9C1F8](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x1E0C9CEC8](context);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9CED8](url, mediaBox, auxiliaryInfo);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x1E0CFA248]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  CGFloat result;

  MEMORY[0x1E0CA7EE8](line, charIndex, secondaryOffset);
  return result;
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1E0D1AFF8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1E0D1B130]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSDirectionalEdgeInsets NSDirectionalEdgeInsetsFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSDirectionalEdgeInsets result;

  MEMORY[0x1E0DC3290](string);
  result.trailing = v4;
  result.bottom = v3;
  result.leading = v2;
  result.top = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC32F8](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t SFAirDropDeviceNameIsSuspicious()
{
  return MEMORY[0x1E0D97488]();
}

uint64_t SFAirDropTransferChangeStateDescription()
{
  return MEMORY[0x1E0D97490]();
}

uint64_t SFFilterStringsFromList()
{
  return MEMORY[0x1E0D97508]();
}

uint64_t SFGenerateTypeList()
{
  return MEMORY[0x1E0D97510]();
}

uint64_t SFIsImage()
{
  return MEMORY[0x1E0D97518]();
}

uint64_t SFLocalizedStringForKey()
{
  return MEMORY[0x1E0D97520]();
}

uint64_t SFNonBreakingStringFromDeviceName()
{
  return MEMORY[0x1E0D975A0]();
}

uint64_t SFSandboxExtensionDataByFileURLPathForURLs()
{
  return MEMORY[0x1E0D975A8]();
}

uint64_t SFSuggestedAirDropThumbnailSize()
{
  return MEMORY[0x1E0D975C0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1E0DC4540]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

uint64_t UIImageDataWriteToSavedPhotosAlbum()
{
  return MEMORY[0x1E0DC4C18]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0DC4CE8](image, completionTarget, completionSelector, contextInfo);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0DC5300](videoPath, completionTarget, completionSelector, contextInfo);
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1E0DC55E0](videoPath);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5960](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1E0CA5970](inUTI, inTagClass);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFArrayRef)MEMORY[0x1E0CA5978](inTagClass, inTag, inConformingToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1E0D1B7F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _UIAppUseModernRotationAndPresentationBehaviors()
{
  return MEMORY[0x1E0DC5708]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

uint64_t sf_dispatch_on_main_queue()
{
  return MEMORY[0x1E0D975F0]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

