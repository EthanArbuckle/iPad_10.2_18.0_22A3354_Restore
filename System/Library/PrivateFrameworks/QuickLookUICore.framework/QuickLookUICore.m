id QLLocalizedDictionaryString(void *a1)
{
  return QLLocalizedStringFromTable(a1, CFSTR("Localizable"));
}

id QLLocalizedString(void *a1)
{
  return QLLocalizedStringFromTable(a1, CFSTR("Localizable"));
}

id QLLocalizedStringFromTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  QLFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E9EFCB88, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id QLLocalizedStringWithDefaultValue(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a1;
  QLFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, v5, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void QLRunInMainThread(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (!v1)
    QLRunInMainThread_cold_1();
  block = v1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void QLRunInMainThreadSync(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (!v1)
    QLRunInMainThreadSync_cold_1();
  block = v1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void QLRunInBackgroundThread(void *a1)
{
  void (**v1)(void);
  NSObject *v2;
  void (**block)(void);

  v1 = a1;
  if (!v1)
    QLRunInBackgroundThread_cold_1();
  block = v1;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, block);

  }
  else
  {
    block[2]();
  }

}

void sub_1D9375BC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D93765C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id QLSLogHandle()
{
  void **v0;
  void *v1;

  v0 = (void **)MEMORY[0x1E0D83678];
  v1 = (void *)*MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v1 = *v0;
  }
  return v1;
}

void sub_1D937791C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9377AA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9377DBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93785E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(exception_object);
    QLSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)(v17 - 128) = 138412546;
      *(_QWORD *)(v16 + 4) = a16;
      *(_WORD *)(v17 - 116) = 2112;
      *(_QWORD *)(v16 + 14) = v18;
      _os_log_impl(&dword_1D936E000, v19, OS_LOG_TYPE_DEFAULT, "Exception during preview computation of %@: %@ #Generic", (uint8_t *)(v17 - 128), 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x1D9377F70);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D9378C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D9379038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void QLPreviewRequestSetDataRepresentation(QLPreviewRequestRef preview, CFDataRef data, CFStringRef contentTypeUTI, CFDictionaryRef properties)
{
  -[__QLPreviewRequest startDataRepresentationWithContentType:properties:](preview, "startDataRepresentationWithContentType:properties:", contentTypeUTI, properties);
  -[__QLPreviewRequest appendData:forURL:lastChunk:](preview, "appendData:forURL:lastChunk:", data, 0, 1);
}

uint64_t QLPreviewRequestStartDataRepresentation(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "startDataRepresentationWithContentType:properties:", a2, a3);
}

CFTypeRef QLPreviewRequestCreateAttachmentURL(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  CFTypeRef v5;

  v3 = (void *)objc_msgSend(a1, "newAttachmentURLWithID:properties:", a2, a3);
  v4 = v3;
  if (v3)
    v5 = CFRetain(v3);
  else
    v5 = 0;

  return v5;
}

uint64_t QLPreviewRequestAppendDataToAttachment(void *a1, const char *a2, uint64_t a3, int a4)
{
  return objc_msgSend(a1, "appendData:forURL:lastChunk:", a3, a2, a4 != 0);
}

uint64_t QLPreviewRequestSetError(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setError:", a2);
}

Boolean QLPreviewRequestIsCancelled(QLPreviewRequestRef preview)
{
  return -[__QLPreviewRequest isCancelled](preview, "isCancelled");
}

void sub_1D937A0C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL QLPreviewControllerSupportsContentType(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v1 = a1;
  +[QLItem supportedContentTypes](QLItem, "supportedContentTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "containsObject:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __QLPreviewControllerSupportsContentType_block_invoke;
      v6[3] = &unk_1E9EFC218;
      v7 = v3;
      v8 = &v9;
      objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);
      v4 = *((_BYTE *)v10 + 24) != 0;

    }
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_1D937A528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id QLPreviewGetSupportedMIMETypes()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)QLPreviewGetSupportedMIMETypes_result;
  if (!QLPreviewGetSupportedMIMETypes_result)
  {
    +[QLPreviewConverter convertibleMIMETypes](QLPreviewConverter, "convertibleMIMETypes");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)QLPreviewGetSupportedMIMETypes_result;
    QLPreviewGetSupportedMIMETypes_result = v1;

    v0 = (void *)QLPreviewGetSupportedMIMETypes_result;
  }
  return v0;
}

uint64_t QLPreviewNeedsHelpUnzippingURL()
{
  return 0;
}

BOOL _QLLayoutIsRTL()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceLayoutDirection") == 1;

  return v1;
}

id QLItemViewControllerVendorForURL(void *a1)
{
  id v1;
  Class v2;
  id v3;

  v1 = a1;
  v2 = NSClassFromString(CFSTR("QLItemViewControllerVendor"));
  if (!v2
    || (-[objc_class performSelector:withObject:](v2, "performSelector:withObject:", sel_qlItemViewControllerForURL_, v1), (v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  }

  return v3;
}

id QLItemViewControllerVendorForItem(void *a1)
{
  id v1;
  Class v2;
  id v3;

  v1 = a1;
  v2 = NSClassFromString(CFSTR("QLItemViewControllerVendor"));
  if (!v2
    || (-[objc_class performSelector:withObject:](v2, "performSelector:withObject:", sel_qlItemViewControllerForItem_, v1), (v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  }

  return v3;
}

void *_getIWorkImportLibrary()
{
  void *result;
  NSObject *v1;
  NSObject *v2;
  NSObject **v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = (void *)__lib;
  if (!__lib)
  {
    if ((__loaded & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = dlopen("/System/Library/PrivateFrameworks/iWorkImport.framework/iWorkImport", 1);
      __lib = (uint64_t)result;
      if (!result)
      {
        v1 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          v3 = (NSObject **)MEMORY[0x1E0D83678];
          QLSInitLogging();
          v1 = *v3;
        }
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        {
          v2 = v1;
          v4 = 136315138;
          v5 = dlerror();
          _os_log_impl(&dword_1D936E000, v2, OS_LOG_TYPE_ERROR, "Cannot load iWorkImport: %s #Conversion", (uint8_t *)&v4, 0xCu);

        }
        result = (void *)__lib;
      }
      __loaded = 1;
    }
  }
  return result;
}

uint64_t QLIWPreviewStartData(uint64_t a1, const char *a2, uint64_t a3)
{
  *(_BYTE *)a1 = 1;
  return QLPreviewRequestStartDataRepresentation(*(void **)(a1 + 8), a2, a3);
}

CFTypeRef QLIWPreviewCreateAttachmentURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return QLPreviewRequestCreateAttachmentURL(*(void **)(a1 + 8), a2, a3);
}

void QLIWPreviewAppendDataToAttachment(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  NSObject **v5;
  NSObject *v6;
  const char *v7;
  uint8_t v8[16];

  if (a3 || a2 || *(_BYTE *)a1)
  {
    QLPreviewRequestAppendDataToAttachment(*(void **)(a1 + 8), a2, a3, a4);
  }
  else
  {
    v5 = (NSObject **)MEMORY[0x1E0D83678];
    v6 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D936E000, v6, OS_LOG_TYPE_DEFAULT, "QLIWPreviewAppendDataToAttachment was called but QLIWPreviewStartData was never called before. #Conversion", v8, 2u);
    }
    v7 = (const char *)CFErrorCreate(0, CFSTR("QuickLookErrorDomain"), 8, 0);
    QLPreviewRequestSetError(*(void **)(a1 + 8), v7);
    CFRelease(v7);
  }
}

BOOL QLIWPreviewShouldContinue(uint64_t a1)
{
  return QLPreviewRequestIsCancelled(*(QLPreviewRequestRef *)(a1 + 8)) == 0;
}

uint64_t QLIWPreviewRequestSetError(uint64_t a1, const char *a2)
{
  return QLPreviewRequestSetError(*(void **)(a1 + 8), a2);
}

uint64_t IWGenerateProgressivePreviewForURL(int a1, void *a2, uint64_t a3, uint64_t a4, CFDictionaryRef theDict)
{
  __CFDictionary *MutableCopy;
  const void *Value;
  uint64_t v11;
  const char *v12;
  void *IWorkImportLibrary;
  NSObject **v14;
  NSObject *v15;
  _QWORD v17[2];
  uint8_t buf[16];
  __int128 v19;
  uint64_t (*v20)(uint64_t, const char *);

  if (IWGenerateProgressivePreviewForURL_functionPointer)
    goto LABEL_2;
  IWorkImportLibrary = _getIWorkImportLibrary();
  if (!IWorkImportLibrary)
    return 0;
  IWGenerateProgressivePreviewForURL_functionPointer = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(IWorkImportLibrary, "IWorkPreviewProcessWithURLAndOptions");
  if (!IWGenerateProgressivePreviewForURL_functionPointer)
  {
    v14 = (NSObject **)MEMORY[0x1E0D83678];
    v15 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v15, OS_LOG_TYPE_ERROR, "Cannot find IWorkPreviewProcessWithURLAndOptions function #Conversion", buf, 2u);
    }
    return 0;
  }
LABEL_2:
  *(_OWORD *)buf = xmmword_1E9EFC280;
  v19 = *(_OWORD *)off_1E9EFC290;
  v20 = QLIWPreviewRequestSetError;
  v17[0] = 0;
  v17[1] = a2;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  Value = CFDictionaryGetValue(theDict, CFSTR("Password"));
  if (Value)
    CFDictionarySetValue(MutableCopy, CFSTR("Password"), Value);
  v11 = IWGenerateProgressivePreviewForURL_functionPointer(a3, a4, theDict, a2, v17, buf);
  CFRelease(MutableCopy);
  if ((_DWORD)v11 == 4)
  {
    v12 = (const char *)CFErrorCreate(0, CFSTR("QuickLookErrorDomain"), 4, 0);
    QLPreviewRequestSetError(a2, v12);
    CFRelease(v12);
  }
  return v11;
}

uint64_t IWGenerateAtomicPreviewForURL(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *Value;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFData *v17;
  BOOL v18;
  uint64_t v19;
  __CFString *v20;
  CFDictionaryRef v21;
  CFTypeRef v23;
  CFDictionaryRef properties;
  CFTypeRef cf;

  properties = 0;
  cf = 0;
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a5, "objectForKey:", CFSTR("URLBase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  Value = CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("Password"));
  v23 = 0;
  v14 = objc_msgSend(v12, "absoluteString");
  v16 = QLIWorkCalculatePreview(0, a3, a4, &cf, (CFTypeRef *)&properties, v14, 0, v15, (uint64_t)Value, (CFErrorRef *)&v23);
  v17 = (const __CFData *)cf;
  if (v16)
    v18 = cf == 0;
  else
    v18 = 1;
  if (v18)
  {
    if (cf)
      CFRelease(cf);
    if (v23)
    {
      QLPreviewRequestSetError(a2, (const char *)v23);
      CFRelease(v23);
    }
    v19 = 0xFFFFFFFFLL;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = properties;
    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v17, v20, properties);

    CFRelease(v17);
    if (v21)
      CFRelease(v21);
    v19 = 0;
  }

  return v19;
}

uint64_t QLIWorkCalculatePreview(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, CFErrorRef *a10)
{
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *);
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *);
  void *v18;
  void *IWorkImportLibrary;
  void *v20;
  unint64_t v21;
  NSObject **v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const __CFDictionary *v27;
  CFIndex v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  int v41;
  uint64_t v42;
  id v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject **v48;
  NSObject *v49;
  NSObject **v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  CFTypeRef *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[16];
  CFErrorRef err[2];
  _BYTE v71[128];
  uint64_t v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer;
  if (QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer)
  {
    v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkFileAtURLWithPassword_functionPointer;
LABEL_3:
    err[0] = 0;
    if (a1 && v16)
    {
      v18 = (void *)v16(a1, a6, a3, a9, err);
    }
    else
    {
      if (!a2 || !v17)
        goto LABEL_46;
      v18 = (void *)v17(a2, a6, a3, a9, err);
    }
    v26 = v18;
    if (err[0])
    {
      if (a10)
      {
        v72 = *MEMORY[0x1E0CB3388];
        v73[0] = err[0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
        v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (CFErrorGetCode(err[0]) == 1)
          v28 = 4;
        else
          v28 = 16;
        *a10 = CFErrorCreate(0, CFSTR("QuickLookErrorDomain"), v28, v27);

      }
LABEL_51:
      v24 = 0;
LABEL_52:

      return v24;
    }
    if (v18)
    {
      objc_msgSend(v18, "objectForKey:", CFSTR("HTMLMainContentData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29 != 0;
      if (!v29)
      {
LABEL_68:

        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", CFSTR("text/html"));
      objc_msgSend(v30, "setObject:forKey:", CFSTR("UTF-8"));
      objc_msgSend(v26, "objectForKey:", CFSTR("HTMLResources"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v62 = v31;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31 && objc_msgSend(v31, "count"))
      {
        v60 = v26;
        v61 = v30;
        v57 = v29;
        v58 = v29 != 0;
        v59 = a5;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        if (v33)
        {
          v34 = v33;
          v63 = 0;
          v35 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v66 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              objc_msgSend(v32, "objectForKey:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v37, "hasSuffix:", CFSTR(".html")) & 1) != 0)
              {
                v39 = 0;
                v40 = CFSTR("text/html");
              }
              else
              {
                v41 = objc_msgSend(v37, "hasSuffix:", CFSTR(".css"));
                v39 = v41 ^ 1;
                if (v41)
                  v40 = CFSTR("text/css");
                else
                  v40 = 0;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v38, "dataUsingEncoding:", 4);
                v42 = objc_claimAutoreleasedReturnValue();

                v38 = (void *)v42;
              }
              if (objc_msgSend(v37, "hasSuffix:", CFSTR("preview.pdf")))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v43 = v38;

                  v63 = v43;
                }
              }
              if (v39)
                v44 = 0;
              else
                v44 = CFSTR("UTF-8");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v38, CFSTR("AttachmentData"), v40, CFSTR("MimeType"), v44, CFSTR("TextEncoding"), 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "stringByAddingPercentEncodingWithAllowedCharacters:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "setObject:forKey:", v45, v47);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          }
          while (v34);
        }
        else
        {
          v63 = 0;
        }

        v30 = v61;
        v55 = v64;
        objc_msgSend(v61, "setObject:forKey:", v64, CFSTR("Attachments"));
        v56 = v63;
        if (v63)
        {
          a5 = v59;
          v26 = v60;
          v24 = v58;
          v29 = v57;
          if (objc_msgSend(v64, "count") == 1)
          {
            objc_msgSend(v61, "setObject:forKey:", CFSTR("application/pdf"), CFSTR("MimeType"));
            objc_msgSend(v61, "removeObjectForKey:", CFSTR("Attachments"));
            *a4 = CFRetain(v63);
            *v59 = CFRetain(v61);
LABEL_67:

            goto LABEL_68;
          }
        }
        else
        {
          v63 = 0;
          a5 = v59;
          v26 = v60;
          v24 = v58;
          v29 = v57;
        }
      }
      else
      {
        v63 = 0;
      }
      objc_msgSend(v30, "setObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("AllowJavascript"));
      objc_msgSend(v26, "objectForKey:", CFSTR("Width"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("Height"));
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)v53;
      if (v52)
      {
        if (v53)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v30, "setObject:forKey:", v52, CFSTR("Width"));
              objc_msgSend(v30, "setObject:forKey:", v54, CFSTR("Height"));
            }
          }
        }
      }
      *a4 = CFRetain(v29);
      *a5 = CFRetain(v30);

      v55 = v64;
      v56 = v63;
      goto LABEL_67;
    }
LABEL_46:
    v48 = (NSObject **)MEMORY[0x1E0D83678];
    v49 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v49 = *v48;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v49, OS_LOG_TYPE_DEFAULT, "iWorkImport failed to convert document #Conversion", buf, 2u);
    }
    v26 = 0;
    goto LABEL_51;
  }
  IWorkImportLibrary = _getIWorkImportLibrary();
  if (IWorkImportLibrary)
  {
    v20 = IWorkImportLibrary;
    QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer = dlsym(IWorkImportLibrary, "CopyHTMLForIWorkDataWithUTIAndPassword");
    v21 = (unint64_t)dlsym(v20, "CopyHTMLForIWorkFileAtURLWithPassword");
    QLIWorkCalculatePreview_CopyHTMLForIWorkFileAtURLWithPassword_functionPointer = (_UNKNOWN *)v21;
    v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer;
    if ((unint64_t)QLIWorkCalculatePreview_CopyHTMLForIWorkDataWithUTIAndPassword_functionPointer | v21)
    {
      v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, CFErrorRef *))v21;
      goto LABEL_3;
    }
    v22 = (NSObject **)MEMORY[0x1E0D83678];
    v23 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v23 = *v22;
    }
    v24 = 0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(err[0]) = 0;
      v25 = "Cannot find functions in iWorkImport #Conversion";
LABEL_58:
      _os_log_impl(&dword_1D936E000, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)err, 2u);
      return 0;
    }
  }
  else
  {
    v51 = (NSObject **)MEMORY[0x1E0D83678];
    v23 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v23 = *v51;
    }
    v24 = 0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(err[0]) = 0;
      v25 = "Cannot load iWorkImport framework #Conversion";
      goto LABEL_58;
    }
  }
  return v24;
}

uint64_t IWGenerateAtomicPreviewForData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *Value;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFData *v17;
  BOOL v18;
  uint64_t v19;
  const __CFDictionary *v20;
  const __CFString *v21;
  id *v22;
  __CFString *v23;
  CFTypeRef v25;
  CFDictionaryRef theDict;
  CFTypeRef cf;

  theDict = 0;
  cf = 0;
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a5, "objectForKey:", CFSTR("URLBase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  Value = CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("Password"));
  v25 = 0;
  v14 = objc_msgSend(v12, "absoluteString");
  v16 = QLIWorkCalculatePreview(a3, 0, a4, &cf, (CFTypeRef *)&theDict, v14, 0, v15, (uint64_t)Value, (CFErrorRef *)&v25);
  v17 = (const __CFData *)cf;
  if (v16)
    v18 = cf == 0;
  else
    v18 = 1;
  if (v18)
  {
    if (cf)
      CFRelease(cf);
    if (v25)
    {
      QLPreviewRequestSetError(a2, (const char *)v25);
      CFRelease(v25);
    }
    v19 = 0xFFFFFFFFLL;
  }
  else
  {
    v20 = theDict;
    v21 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("MimeType"));
    if (v21 && CFStringCompare(v21, CFSTR("application/pdf"), 1uLL) == kCFCompareEqualTo)
      v22 = (id *)MEMORY[0x1E0CEC570];
    else
      v22 = (id *)MEMORY[0x1E0CEC518];
    objc_msgSend(*v22, "identifier");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v17, v23, v20);
    CFRelease(v17);
    if (v20)
      CFRelease(v20);
    v19 = 0;
  }

  return v19;
}

BOOL PGPackageHasEmbeddedPreview(const void *a1)
{
  CFTypeRef v1;
  CFTypeRef v2;

  v1 = PGCopyPreviewURLForPackageURL(a1);
  v2 = v1;
  if (v1)
    CFRelease(v1);
  return v2 != 0;
}

CFTypeRef PGCopyPreviewURLForPackageURL(const void *a1)
{
  const __CFArray *URLsToLookForBaseURL;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  uint64_t v5;
  uint64_t v6;
  const void *ValueAtIndex;
  void *v8;
  const __CFArray *v9;
  CFTypeRef URLMatchingPrefix;

  URLsToLookForBaseURL = QLPackageCreateURLsToLookForBaseURL(a1);
  if (!URLsToLookForBaseURL)
    return 0;
  v2 = URLsToLookForBaseURL;
  Count = CFArrayGetCount(URLsToLookForBaseURL);
  if (Count < 1)
  {
    URLMatchingPrefix = 0;
  }
  else
  {
    v4 = Count;
    v5 = 1;
    v6 = MEMORY[0x1E0C9AA60];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v5 - 1);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", ValueAtIndex, v6, 0, 0);
      v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

      if (v9)
        URLMatchingPrefix = QLPackageCopyFirstURLMatchingPrefix(v9, CFSTR("Preview"), 0, 0);
      else
        URLMatchingPrefix = 0;

      if (v5 >= v4)
        break;
      ++v5;
    }
    while (!URLMatchingPrefix);
  }
  CFRelease(v2);
  return URLMatchingPrefix;
}

uint64_t PGGeneratePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, const void *a3)
{
  CFTypeRef v4;
  const void *v5;
  const __CFData *v6;
  __CFString *v7;

  v4 = PGCopyPreviewURLForPackageURL(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v4, 0, 0);
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    QLPreviewRequestSetDataRepresentation(a2, v6, v7, 0);

    CFRelease(v5);
  }
  return 0;
}

void sub_1D937D8CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D937DAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D937DD98(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromQLNetworkState(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Undefined QLNetworkState");
  else
    return off_1E9EFC390[a1];
}

void sub_1D937E100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D937E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D937E578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

uint64_t _reachabilityDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_updateNetworkStateWithFlags:", a2);
}

void sub_1D937E6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D937EB1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D937EC5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D937FCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LPDFGeneratePreviewForURL(int a1, __QLPreviewRequest *a2, CFURLRef bundleURL)
{
  CFURLRef v4;
  const __CFData *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v9;

  v9 = 0;
  v4 = LocCopyPDFURLForLocPDFBundleURL(bundleURL, &v9);
  if (v4)
  {
    v5 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v4, 0, 0);
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    QLPreviewRequestSetDataRepresentation(a2, v5, v6, 0);

    v7 = 0;
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

void sub_1D9381B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D938272C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93827F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D938288C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9382924(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93829F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9382F28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9383024(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93830BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D938314C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93831DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93832D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFURLRef LocCopyPDFURLForLocPDFBundleURL(CFURLRef bundleURL, _QWORD *a2)
{
  __CFBundle *v4;
  __CFBundle *v5;
  const __CFDictionary *InfoDictionary;
  const __CFString *v7;
  const __CFString *Value;
  const __CFString *PathComponent;
  const __CFArray *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFString *ValueAtIndex;
  CFURLRef v15;
  const __CFURL *v16;
  CFTypeRef ValueForInfoDictionaryKey;

  if (a2)
    *a2 = 0;
  v4 = CFBundleCreate(0, bundleURL);
  if (v4)
  {
    v5 = v4;
    InfoDictionary = CFBundleGetInfoDictionary(v4);
    if (InfoDictionary)
    {
      v7 = (const __CFString *)*MEMORY[0x1E0C9AE88];
      Value = (const __CFString *)CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E0C9AE88]);
      PathComponent = Value;
      if (Value)
      {
LABEL_6:
        v10 = CFBundleCopyBundleLocalizations(v5);
        if (v10)
        {
          v11 = v10;
          v12 = CFBundleCopyPreferredLocalizationsFromArray(v10);
          if (v12)
          {
            v13 = v12;
            if (CFArrayGetCount(v12) < 1)
              ValueAtIndex = 0;
            else
              ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
            v15 = CFBundleCopyResourceURLForLocalization(v5, PathComponent, CFSTR("pdf"), 0, ValueAtIndex);
            CFRelease(v13);
          }
          else
          {
            v15 = CFBundleCopyResourceURLForLocalization(v5, PathComponent, CFSTR("pdf"), 0, 0);
          }
          CFRelease(v11);
          if (a2)
          {
            if (v15)
            {
              ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v5, CFSTR("CFBundleDisplayName"));
              *a2 = ValueForInfoDictionaryKey;
              if (ValueForInfoDictionaryKey
                || (ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v5, v7),
                    (*a2 = ValueForInfoDictionaryKey) != 0))
              {
                CFRetain(ValueForInfoDictionaryKey);
              }
            }
          }
        }
        else
        {
          v15 = 0;
        }
        if (!Value)
          CFRelease(PathComponent);
        goto LABEL_25;
      }
      v16 = CFURLCreateCopyDeletingPathExtension(0, bundleURL);
      v15 = v16;
      if (!v16)
      {
LABEL_25:
        CFRelease(v5);
        return v15;
      }
      PathComponent = CFURLCopyLastPathComponent(v16);
      CFRelease(v15);
      if (PathComponent)
        goto LABEL_6;
    }
    v15 = 0;
    goto LABEL_25;
  }
  return 0;
}

void sub_1D9384EEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9385410(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D93856B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D9385A3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D9385E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void sub_1D938725C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D9387578(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t QLImageWithSizeShouldNotBeScaled()
{
  return 0;
}

CFArrayRef QLPackageCreateURLsToLookForBaseURL(const void *a1)
{
  const __CFURL *v2;
  const __CFString *v3;
  const __CFString *v4;
  CFURLRef v5;
  CFURLRef v6;
  CFURLRef v7;
  CFURLRef v8;
  CFArrayRef v9;
  const __CFURL *v11;
  void *values[3];

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  if (CFURLHasDirectoryPath((CFURLRef)a1))
  {
    v2 = (const __CFURL *)CFRetain(a1);
    if (!v2)
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  else
  {
    v3 = CFURLCopyFileSystemPath((CFURLRef)a1, kCFURLPOSIXPathStyle);
    if (!v3)
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    v4 = v3;
    v2 = CFURLCreateWithFileSystemPath(0, v3, kCFURLPOSIXPathStyle, 1u);
    CFRelease(v4);
    if (!v2)
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  v5 = CFURLCreateCopyAppendingPathComponent(0, v2, CFSTR("QuickLook"), 1u);
  if (!v5)
  {
    v11 = v2;
LABEL_12:
    CFRelease(v11);
    return 0;
  }
  v6 = v5;
  v7 = CFURLCreateCopyAppendingPathComponent(0, v2, CFSTR("Contents/QuickLook"), 1u);
  if (!v7)
  {
    CFRelease(v2);
    v11 = v6;
    goto LABEL_12;
  }
  v8 = v7;
  values[0] = v6;
  values[1] = v7;
  v9 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E0C9B378]);
  CFRelease(v6);
  CFRelease(v8);
  CFRelease(v2);
  return v9;
}

CFTypeRef QLPackageCopyFirstURLMatchingPrefix(const __CFArray *a1, const __CFString *a2, const __CFString *a3, CFTypeRef *a4)
{
  CFIndex Count;
  CFIndex v9;
  CFTypeRef v10;
  CFIndex i;
  const __CFURL *ValueAtIndex;
  const __CFString *PathComponent;
  const __CFString *v14;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v9 = Count;
  v10 = 0;
  for (i = 0; i < v9; ++i)
  {
    while (1)
    {
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(a1, i);
      PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent)
      {
        v14 = PathComponent;
        if (v10 || !CFStringHasPrefix(PathComponent, a2))
        {
          if (a3 && !*a4 && CFStringHasPrefix(v14, a3))
            *a4 = CFRetain(ValueAtIndex);
        }
        else
        {
          v10 = CFRetain(ValueAtIndex);
        }
        CFRelease(v14);
      }
      if (v10)
        break;
      if (++i >= v9)
        return 0;
    }
    if (!a3)
      break;
    if (*a4)
      break;
  }
  return v10;
}

void sub_1D938853C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double QLCGSizeFromQLItemThumbnailSize(uint64_t a1)
{
  if (a1 == 1)
    return 256.0;
  if (a1)
    return -1.0;
  return 37.0;
}

void sub_1D938B0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D938B178(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t RTFGeneratePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  char v8;
  id *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  NSObject **v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {

LABEL_4:
    v9 = (id *)MEMORY[0x1E0CEA0E8];
    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.microsoft.word.doc"));

  if ((v8 & 1) != 0)
    goto LABEL_4;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {

    v14 = 0;
    v10 = 0;
    goto LABEL_12;
  }
  v9 = (id *)MEMORY[0x1E0CEA0E0];
LABEL_5:
  v10 = *v9;

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v23 = *MEMORY[0x1E0CEA088];
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v13 = (void *)objc_msgSend(v11, "initWithURL:options:documentAttributes:error:", a3, v12, 0, &v20);
    v14 = v20;

    if (v13)
    {
      RTFGeneratePreviewForAttributedString(a2, v13);

      goto LABEL_16;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_12:
  v17 = (NSObject **)MEMORY[0x1E0D83678];
  v18 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v18 = *v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1D936E000, v18, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
  }
LABEL_16:

  return 0;
}

void RTFGeneratePreviewForAttributedString(__QLPreviewRequest *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFData *v6;
  id v7;
  const __CFDictionary *v8;
  __CFString *v9;
  NSObject **v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v17 = *MEMORY[0x1E0CEA088];
  v18[0] = CFSTR("NSWebArchive");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v4, v5, &v12);
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v6)
  {
    v15 = CFSTR("MimeType");
    v16 = CFSTR("application/x-webarchive");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    QLPreviewRequestSetDataRepresentation(a1, v6, v9, v8);

  }
  else
  {
    v10 = (NSObject **)MEMORY[0x1E0D83678];
    v11 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
    }
  }

}

uint64_t RTFGeneratePreviewForData(uint64_t a1, __QLPreviewRequest *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  +[QLTextItemTransformer attributedStringFromData:encoding:typeIdentifier:error:](QLTextItemTransformer, "attributedStringFromData:encoding:typeIdentifier:error:", a3, 0, a4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    RTFGeneratePreviewForAttributedString(a2, v5);
  }
  else
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Could not load RTF file: %@ #Conversion", buf, 0xCu);
    }
  }

  return 0;
}

void sub_1D938BC10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D938C158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OIGenerateAtomicPreviewForURL(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t result;
  NSObject **v11;
  NSObject *v12;
  const __CFData *v13;
  __CFString *v14;
  CFDictionaryRef v15;
  CFDictionaryRef properties;
  uint8_t buf[8];

  result = _QLGetOfficeFileTypeFromUTI(a4);
  if (result)
  {
    v11 = (NSObject **)MEMORY[0x1E0D83678];
    v12 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
    }
    properties = 0;
    *(_QWORD *)buf = 0;
    QLOfficeCalculatePreview(a2, 0, (uint64_t)a3, a4, (CFTypeRef *)buf, (CFTypeRef *)&properties, objc_msgSend(a5, "objectForKey:", CFSTR("URLBase")), 0);
    v13 = *(const __CFData **)buf;
    if (*(_QWORD *)buf)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = properties;
      QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v13, v14, properties);

      CFRelease(v13);
      if (v15)
        CFRelease(v15);
      return 0;
    }
    else
    {
      return OIGeneratePreviewForURLIfWrongContent(a1, (__QLPreviewRequest *)a2, a3, a4);
    }
  }
  return result;
}

BOOL QLOfficeSupportsUTI(void *a1)
{
  return _QLGetOfficeFileTypeFromUTI(a1) != 0;
}

void QLOfficeCalculatePreview(void *a1, uint64_t a2, uint64_t a3, void *a4, CFTypeRef *a5, CFTypeRef *a6, uint64_t a7, int a8)
{
  double v14;
  void *inited;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  int v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CFTypeRef *v44;
  CFTypeRef *v45;
  void *v46;
  void *v47;
  char *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  _QLGetOfficeFileTypeFromUTI(a4);
  if (a8)
  {
    if (a2)
    {
      inited = (void *)OICopyHTMLThumbnailForOfficeData_delayInitStub(v14);
      goto LABEL_10;
    }
    if (a3)
    {
      inited = (void *)OICopyHTMLThumbnailFromFileAtURL_delayInitStub(v14);
      goto LABEL_10;
    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QuickLookDomain"), 897, 0);
    v48 = (char *)objc_claimAutoreleasedReturnValue();
    QLPreviewRequestSetError(a1, v48);

    return;
  }
  if (a2)
  {
    inited = (void *)OICopyHTMLForOfficeData_delayInitStub(v14);
    goto LABEL_10;
  }
  if (!a3)
    goto LABEL_13;
  inited = (void *)OICopyHTMLFromFileAtURL_delayInitStub(v14);
LABEL_10:
  v16 = inited;
  if (!inited)
    goto LABEL_13;
  objc_msgSend(inited, "objectForKey:", CFSTR("HTMLError"));
  v17 = (char *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    QLPreviewRequestSetError(a1, v17);
  }
  else
  {
    objc_msgSend(v16, "objectForKey:", CFSTR("HTMLMainContent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && (unint64_t)objc_msgSend(v18, "length") >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", CFSTR("text/html"));
      objc_msgSend(v20, "setObject:forKey:", CFSTR("UTF-8"));
      objc_msgSend(v16, "objectForKey:", CFSTR("HTMLResources"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      if (v21)
      {
        v22 = v21;
        if (objc_msgSend(v21, "count"))
        {
          v40 = v20;
          v41 = v19;
          v42 = v18;
          v43 = v16;
          v44 = a5;
          v45 = a6;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v50 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                objc_msgSend(v23, "objectForKey:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v28, "hasSuffix:", CFSTR(".html")) & 1) != 0)
                {
                  v30 = 0;
                  v31 = CFSTR("text/html");
                }
                else
                {
                  v32 = objc_msgSend(v28, "hasSuffix:", CFSTR(".css"));
                  v30 = v32 ^ 1;
                  if (v32)
                    v31 = CFSTR("text/css");
                  else
                    v31 = 0;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v29, "dataUsingEncoding:", 4);
                  v33 = objc_claimAutoreleasedReturnValue();

                  v29 = (void *)v33;
                }
                if (v30)
                  v34 = 0;
                else
                  v34 = CFSTR("UTF-8");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v29, CFSTR("AttachmentData"), v31, CFSTR("MimeType"), v34, CFSTR("TextEncoding"), 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setObject:forKey:", v35, v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
            }
            while (v25);
          }

          v20 = v40;
          objc_msgSend(v40, "setObject:forKey:", v47, CFSTR("Attachments"));

          a5 = v44;
          a6 = v45;
          v17 = 0;
          v16 = v43;
          v19 = v41;
          v18 = v42;
        }
      }
      v36 = v20;
      objc_msgSend(v20, "setObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("AllowJavascript"));
      objc_msgSend(v16, "objectForKey:", CFSTR("HTMLWidth"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("HTMLHeight"));
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if (v37)
      {
        if (v38)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("Width"));
              objc_msgSend(v36, "setObject:forKey:", v39, CFSTR("Height"));
            }
          }
        }
      }
      *a5 = CFRetain(v19);
      *a6 = CFRetain(v36);

    }
  }

}

uint64_t OIGeneratePreviewForURLIfWrongContent(uint64_t a1, __QLPreviewRequest *a2, void *a3, void *a4)
{
  void *v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFData *v16;
  __CFString *v17;
  _OWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileHandleForReadingAtPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (NSObject **)MEMORY[0x1E0D83678];
    v12 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, " #Conversion", (uint8_t *)v19, 2u);
    }
    objc_msgSend(v10, "readDataOfLength:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "length") == 5)
    {
      v20 = 0;
      memset(v19, 0, sizeof(v19));
      objc_msgSend(v14, "getBytes:length:", v19, 5);
      if (!strncasecmp((const char *)v19, "<html", 5uLL))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, 0);
        v16 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          QLPreviewRequestSetDataRepresentation(a2, v16, v17, 0);

        }
      }
      else if (!strncasecmp((const char *)v19, "{\\rtf", 5uLL))
      {
        v15 = RTFGeneratePreviewForURL(a1, a2, (uint64_t)a3, a4);
LABEL_16:

        objc_msgSend(v10, "closeFile");
        goto LABEL_17;
      }
    }
    v15 = 0;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

void sub_1D938D200(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x1D938D1A0);
  }
  _Unwind_Resume(exception_object);
}

const void *OIGenerateAtomicPreviewForData(uint64_t a1, void *a2, const __CFData *a3, void *a4, void *a5)
{
  NSObject **v10;
  NSObject *v11;
  const __CFData *v12;
  __CFString *v13;
  const void *v14;
  char *v16;
  CFDictionaryRef properties;
  uint8_t buf[8];

  if (!_QLGetOfficeFileTypeFromUTI(a4))
    return 0;
  v10 = (NSObject **)MEMORY[0x1E0D83678];
  v11 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  properties = 0;
  *(_QWORD *)buf = 0;
  QLOfficeCalculatePreview(a2, (uint64_t)a3, 0, a4, (CFTypeRef *)buf, (CFTypeRef *)&properties, objc_msgSend(a5, "objectForKey:", CFSTR("URLBase")), 0);
  v12 = *(const __CFData **)buf;
  if (*(_QWORD *)buf)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = properties;
    QLPreviewRequestSetDataRepresentation((QLPreviewRequestRef)a2, v12, v13, properties);

    CFRelease(v12);
    if (v14)
    {
      CFRelease(v14);
      return 0;
    }
  }
  else
  {
    v14 = (const void *)OIGeneratePreviewForDataIfWrongContent(a1, (__QLPreviewRequest *)a2, a3, (uint64_t)a4);
    if ((_DWORD)v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QuickLookDomain"), 897, 0);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      QLPreviewRequestSetError(a2, v16);

    }
  }
  return v14;
}

uint64_t OIGeneratePreviewForDataIfWrongContent(uint64_t a1, __QLPreviewRequest *a2, CFDataRef theData, uint64_t a4)
{
  NSObject **v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (CFDataGetLength(theData) < 5)
    return 0xFFFFFFFFLL;
  v9 = (NSObject **)MEMORY[0x1E0D83678];
  v10 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v10, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  v18 = 0;
  *(_OWORD *)buf = 0u;
  v17 = 0u;
  -[__CFData getBytes:length:](theData, "getBytes:length:", buf, 5);
  if (!strncasecmp((const char *)buf, "<html", 5uLL))
  {
    v13 = *v9;
    if (!*v9)
    {
      QLSInitLogging();
      v13 = *v9;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D936E000, v13, OS_LOG_TYPE_DEFAULT, "It's an HTML #Conversion", v15, 2u);
    }
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    QLPreviewRequestSetDataRepresentation(a2, theData, v14, 0);

    return 0;
  }
  else
  {
    v11 = strncasecmp((const char *)buf, "{\\rtf", 5uLL);
    v12 = *v9;
    if (v11)
    {
      if (!v12)
      {
        QLSInitLogging();
        v12 = *v9;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, "Returning false #Conversion", v15, 2u);
      }
      return 0xFFFFFFFFLL;
    }
    if (!v12)
    {
      QLSInitLogging();
      v12 = *v9;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, "It's an RTF #Conversion", v15, 2u);
    }
    return RTFGeneratePreviewForData(a1, a2, (uint64_t)theData, a4);
  }
}

uint64_t _QLGetOfficeFileTypeFromUTI(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.word.doc"))
    && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.word.dot")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.wordprocessingml.document"))
      && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.wordprocessingml.template"))
      && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.wordprocessingml.document.macroenabled"))
      && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.wordprocessingml.template.macroenabled")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.excel.xls"))
        && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.excel.xlt"))
        && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.excel.xla")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.spreadsheetml.sheet"))
          && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.spreadsheetml.template"))
          && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.spreadsheetml.sheet.macroenabled"))
          && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.spreadsheetml.template.macroenabled")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.powerpoint.ppt"))
            && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.powerpoint.pps"))
            && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.microsoft.powerpoint.pot")))
          {
            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.presentation"))
              && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.template.macroenabled"))&& objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.template"))&& objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.presentation.macroenabled"))&& objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.slideshow"))&& objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("org.openxmlformats.presentationml.slideshow.macroenabled")))
            {
              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("public.comma-separated-values-text")))
                v2 = 0;
              else
                v2 = 7;
            }
            else
            {
              v2 = 6;
            }
          }
          else
          {
            v2 = 5;
          }
        }
        else
        {
          v2 = 4;
        }
      }
      else
      {
        v2 = 3;
      }
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t QLOIPreviewStartData(uint64_t a1, const char *a2, uint64_t a3)
{
  *(_BYTE *)a1 = 1;
  return QLPreviewRequestStartDataRepresentation(*(void **)(a1 + 8), a2, a3);
}

CFTypeRef QLOIPreviewCreateAttachmentURL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return QLPreviewRequestCreateAttachmentURL(*(void **)(a1 + 8), a2, a3);
}

uint64_t QLOIPreviewAppendDataToAttachment(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  return QLPreviewRequestAppendDataToAttachment(*(void **)(a1 + 8), a2, a3, a4);
}

BOOL QLOIPreviewShouldContinue(uint64_t a1)
{
  return QLPreviewRequestIsCancelled(*(QLPreviewRequestRef *)(a1 + 8)) == 0;
}

void QLOIPreviewRequestSetError(uint64_t a1, char *err)
{
  const char *v4;

  if (CFErrorGetCode((CFErrorRef)err) == 1)
  {
    v4 = (const char *)CFErrorCreate(0, CFSTR("QuickLookErrorDomain"), 4, 0);
    QLPreviewRequestSetError(*(void **)(a1 + 8), v4);
    CFRelease(v4);
  }
  else
  {
    QLPreviewRequestSetError(*(void **)(a1 + 8), err);
  }
}

uint64_t OIGenerateProgressivePreviewForURL(uint64_t a1, __QLPreviewRequest *a2, void *a3, void *a4, const __CFDictionary *a5)
{
  NSObject **v10;
  NSObject *v11;
  __CFDictionary *MutableCopy;
  double v13;
  uint64_t v14;
  const void *v15;
  int inited;
  uint8_t buf[16];
  __int128 v19;
  void (*v20)(uint64_t, char *);

  v10 = (NSObject **)MEMORY[0x1E0D83678];
  v11 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  *(_OWORD *)buf = xmmword_1E9EFC8E0;
  v19 = *(_OWORD *)off_1E9EFC8F0;
  v20 = QLOIPreviewRequestSetError;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a5);
  if (CFDictionaryGetValue(a5, CFSTR("Password")))
  {
    gotLoadHelper_x8__kOIPreviewOptionsPassphrase(v13);
    CFDictionarySetValue(MutableCopy, **(const void ***)(v14 + 192), v15);
  }
  inited = OIPreviewProcessWithURLAndOptions_delayInitStub(v13);
  CFRelease(MutableCopy);
  if (inited == 64257)
    return 4;
  else
    return OIGeneratePreviewForURLIfWrongContent(a1, a2, a3, a4);
}

uint64_t OIGenerateProgressivePreviewForData(uint64_t a1, __QLPreviewRequest *a2, const __CFData *a3, uint64_t a4, const __CFDictionary *a5)
{
  NSObject **v10;
  NSObject *v11;
  __CFDictionary *MutableCopy;
  double v13;
  uint64_t v14;
  const void *v15;
  int inited;
  uint8_t buf[16];
  __int128 v19;
  void (*v20)(uint64_t, char *);

  v10 = (NSObject **)MEMORY[0x1E0D83678];
  v11 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_DEFAULT, " #Conversion", buf, 2u);
  }
  *(_OWORD *)buf = xmmword_1E9EFC8E0;
  v19 = *(_OWORD *)off_1E9EFC8F0;
  v20 = QLOIPreviewRequestSetError;
  if (a5)
    CFDictionaryGetValue(a5, CFSTR("FileName"));
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a5);
  if (CFDictionaryGetValue(a5, CFSTR("Password")))
  {
    gotLoadHelper_x8__kOIPreviewOptionsPassphrase(v13);
    CFDictionarySetValue(MutableCopy, **(const void ***)(v14 + 192), v15);
  }
  inited = OIPreviewProcessWithDataAndOptions_delayInitStub(v13);
  CFRelease(MutableCopy);
  if (inited == 64257)
    return 4;
  else
    return OIGeneratePreviewForDataIfWrongContent(a1, a2, a3, a4);
}

id _QLRemoveSpaces(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "stringByRemovingPercentEncoding");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR(" ")) & 1) != 0 || objc_msgSend(v1, "hasSuffix:", CFSTR(" ")))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = v1;
  }

  return v3;
}

uint64_t QLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject **v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(v6, "pathExtension"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        !v8))
  {
    objc_msgSend(v3, "resourceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = v10;

      v6 = v13;
    }

  }
  v14 = _QLTypeCopyUTIForFileNameAndMimeType(v6, v4);
  v15 = (NSObject **)MEMORY[0x1E0D83678];
  v16 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v16 = *v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v3, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v18;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1D936E000, v17, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v20, 0x20u);

  }
  return v14;
}

uint64_t _QLTypeCopyUTIForFileNameAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject **v24;
  NSObject *v25;
  uint64_t v26;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _QLRemoveSpaces(v6);

  objc_msgSend(v4, "lowercaseString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("text/plain")) ^ 1;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDynamic"))
    {

      v10 = 0;
    }
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("lpdf")))
  {
    v10 = (id)*MEMORY[0x1E0CEC4B8];
    v8 = 0;
  }
  else
  {
    v10 = (id)*MEMORY[0x1E0CEC4A0];
    v9 = 0;
    v8 = CFSTR("application/octet-stream");
  }
  _QLCopyPackageExtensionIfIsArchiveFileName(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v12 = v11;

    v13 = (id)*MEMORY[0x1E0CEC588];
    if (!v12)
    {
      v7 = 0;
      goto LABEL_28;
    }
    v28 = v11;
    v14 = v12;
    goto LABEL_17;
  }
  if (!-[__CFString hasSuffix:](v8, "hasSuffix:", CFSTR("zip")))
  {
    v13 = v10;
    if (!v7)
      goto LABEL_28;
    goto LABEL_15;
  }
  v13 = (id)*MEMORY[0x1E0CEC4A0];

  if (v7)
  {
LABEL_15:
    v28 = v11;
    if (!v9)
    {
      v14 = v7;
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v16 = v15;
      if ((objc_msgSend(v15, "isDynamic") & 1) != 0)
      {
LABEL_19:

LABEL_27:
        v7 = v14;
        v11 = v28;
        goto LABEL_28;
      }
      if (v4)
      {
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_QLUTIIsScriptableMediaType((uint64_t)v17) & 1) == 0)
        {

          if (!v16)
            goto LABEL_27;
          goto LABEL_24;
        }
        objc_msgSend(v13, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = _QLUTIIsScriptableMediaType((uint64_t)v18);

        if (!v19)
          goto LABEL_19;
      }
      if (!v16)
        goto LABEL_27;
LABEL_24:

      v20 = 0;
      v7 = v14;
      v11 = v28;
LABEL_30:
      if ((objc_msgSend(v16, "isDynamic") & 1) == 0
        && (objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0CEC4A0]) & 1) == 0
        && !objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0CEC610]))
      {
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    v14 = v7;
    v12 = v7;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_28:
  v21 = v13;
  v16 = v21;
  if (v21)
  {
    v20 = v21;
    goto LABEL_30;
  }
  v20 = 0;
LABEL_35:
  v22 = (void *)_QLTypeCopyPrivateUTIFromFileNameAndMimeType(v3, v4);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v23;
  }

  if (!v16)
    v16 = (id)*MEMORY[0x1E0CEC4A0];
LABEL_39:
  v24 = (NSObject **)MEMORY[0x1E0D83678];
  v25 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v25 = *v24;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v3;
    v31 = 2112;
    v32 = v4;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_1D936E000, v25, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", buf, 0x20u);
  }
  objc_msgSend(v16, "identifier");
  v26 = objc_claimAutoreleasedReturnValue();

  return v26;
}

__CFString *QLTypeCopyBestMimeTypeForFileNameAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  NSObject **v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)_QLTypeCopyUTIForFileNameAndMimeType(v3, v4);
  v6 = _QLTypeCopyBestMimeTypeForUTI(v5);
  v7 = (NSObject **)MEMORY[0x1E0D83678];
  v8 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412802;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

__CFString *_QLTypeCopyBestMimeTypeForUTI(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  NSObject **v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("public.data")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    if (!v1
      || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v1),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "preferredMIMEType"),
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v3,
          !v2))
    {
      _QLGetMimeTypeForContentType(v1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("text/rtf")))
    {

      v2 = CFSTR("application/rtf");
    }
    v4 = (NSObject **)MEMORY[0x1E0D83678];
    v5 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v1;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1D936E000, v5, OS_LOG_TYPE_INFO, "(%@) -> %@ #UTI", (uint8_t *)&v7, 0x16u);
    }
  }

  return v2;
}

__CFString *QLTypeCopyBestMimeTypeForURLAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)QLTypeCopyUTIForURLAndMimeType(v3, v4);
  v6 = _QLTypeCopyBestMimeTypeForUTI(v5);
  v7 = (NSObject **)MEMORY[0x1E0D83678];
  v8 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v3, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_INFO, "(%@, %@) -> %@ #UTI", (uint8_t *)&v12, 0x20u);

  }
  return v6;
}

uint64_t _QLUTIIsScriptableMediaType(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC518]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC570]);

  return v2;
}

id _QLCopyArchiveExtensionIfIsArchiveFileName(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "pathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC448]))
      v3 = v1;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id _QLCopyPackageExtensionIfIsArchiveFileName(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  v2 = _QLCopyArchiveExtensionIfIsArchiveFileName(v1);
  if (objc_msgSend(v2, "length"))
  {
    v3 = objc_msgSend(v1, "rangeOfString:options:", v2, 4);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v1, "substringToIndex:", v3 - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = _QLRemoveSpaces(v6);

      if (v4)
      {
        if (objc_msgSend(v4, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v4, *MEMORY[0x1E0CEC588]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v7 && !objc_msgSend(v7, "isDynamic"))
            goto LABEL_11;

        }
        v8 = v4;
        v4 = 0;
      }
      else
      {
        v8 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  v4 = 0;
LABEL_12:

  return v4;
}

uint64_t _QLTypeCopyPrivateUTIFromFileNameAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v14 = 0;
    if (!v4)
      goto LABEL_15;
    goto LABEL_13;
  }
  objc_msgSend(v3, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _QLCopyPackageExtensionIfIsArchiveFileName(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length")
      && (v8 = objc_msgSend(v3, "rangeOfString:options:", v7, 4), v8 != 0x7FFFFFFFFFFFFFFFLL)
      && (objc_msgSend(v3, "substringFromIndex:", v8), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (void *)v9;
      _QLTypeGetKnownExtensions();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = v10;
    }
    else
    {
      _QLTypeGetKnownExtensions();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v13 = v12;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  if (v5)
  {
LABEL_13:
    if (!v14)
    {
      objc_msgSend(v5, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _QLTypeGetKnownMimeTypes();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v15);
      v14 = objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_15:

  return v14;
}

id _QLToolsGetKnownUTIs()
{
  if (_QLToolsGetKnownUTIs_onceToken != -1)
    dispatch_once(&_QLToolsGetKnownUTIs_onceToken, &__block_literal_global_4);
  return (id)_QLToolsGetKnownUTIs__knownUTIs;
}

id _QLGetMimeTypeForContentType(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  _QLToolsGetKnownUTIs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("mime type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _QLTypeGetKnownExtensions()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_knownExtensions;
  if (!_knownExtensions)
  {
    QLFrameworkBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("KnownExtensions"), CFSTR("plist"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)_knownExtensions;
      _knownExtensions = v3;

    }
    if (!_knownExtensions)
    {
      _knownExtensions = MEMORY[0x1E0C9AA70];

    }
    v0 = (void *)_knownExtensions;
  }
  return v0;
}

id _QLTypeGetKnownMimeTypes()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_knownMimeTypes;
  if (!_knownMimeTypes)
  {
    QLFrameworkBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("KnownMimeTypes"), CFSTR("plist"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)_knownMimeTypes;
      _knownMimeTypes = v3;

    }
    if (!_knownMimeTypes)
    {
      _knownMimeTypes = MEMORY[0x1E0C9AA70];

    }
    v0 = (void *)_knownMimeTypes;
  }
  return v0;
}

uint64_t _QLContentTypeConformsToContentTypeInSet(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___QLContentTypeConformsToContentTypeInSet_block_invoke;
  v8[3] = &unk_1E9EFC218;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1D938EC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLContentTypeConformsToRawImage(void *a1, const char *a2)
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC5B8]);
}

void QLRunInMainThread_cold_1()
{
  __assert_rtn("QLRunInMainThread", "QLUICUtilities.m", 31, "block != nil");
}

void QLRunInMainThreadSync_cold_1()
{
  __assert_rtn("QLRunInMainThreadSync", "QLUICUtilities.m", 42, "block != nil");
}

void QLRunInBackgroundThread_cold_1()
{
  __assert_rtn("QLRunInBackgroundThread", "QLUICUtilities.m", 54, "block != nil");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98070](locArray);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1E0C98088](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99398](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC550]();
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t QLFrameworkBundle()
{
  return MEMORY[0x1E0D83610]();
}

uint64_t QLGuessEncodingForTextFileAtURL()
{
  return MEMORY[0x1E0D83628]();
}

uint64_t QLGuessEncodingForTextFileFromData()
{
  return MEMORY[0x1E0D83630]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x1E0D83640]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1E0C82B38](s, *(_QWORD *)&flag, src);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D70](type, path, *(_QWORD *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

uint64_t BRNotificationNameForServerAvailabilityChanges_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CloudDocs))
    dlopenHelper_CloudDocs(a1);
  return MEMORY[0x1E0D10CE0]();
}

uint64_t OICopyHTMLThumbnailForOfficeData_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D650A0]();
}

uint64_t OICopyHTMLForOfficeData_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D65090]();
}

uint64_t OICopyHTMLThumbnailFromFileAtURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D650A8]();
}

uint64_t OICopyHTMLFromFileAtURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D65098]();
}

uint64_t OIPreviewProcessWithURLAndOptions_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D650B8]();
}

uint64_t OIPreviewProcessWithDataAndOptions_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    dlopenHelper_OfficeImport(a1);
  return MEMORY[0x1E0D650B0]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_OfficeImport(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/OfficeImport.framework/OfficeImport", 0);
  atomic_store(1u, &dlopenHelperFlag_OfficeImport);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUIPrivate(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/PhotosUIPrivate.framework/PhotosUIPrivate", 0);
  atomic_store(1u, &dlopenHelperFlag_PhotosUIPrivate);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CloudDocs(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_CloudDocs);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___PUProgressIndicatorView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate))
    return dlopenHelper_PhotosUIPrivate(result);
  return result;
}

double gotLoadHelper_x8__kOIPreviewOptionsPassphrase(double result)
{
  if (!atomic_load(&dlopenHelperFlag_OfficeImport))
    return dlopenHelper_OfficeImport(result);
  return result;
}

