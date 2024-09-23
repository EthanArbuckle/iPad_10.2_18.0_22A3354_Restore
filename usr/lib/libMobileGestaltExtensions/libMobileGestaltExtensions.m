uint64_t _MGSSetLazyFuncs(uint64_t a1, void *a2, pthread_mutex_t *a3)
{
  _QWORD *v3;

  qword_1ECDA0C28 = a1;
  off_1ECDA0C18 = a2;
  qword_1ECDA0C20 = (uint64_t)a3;
  pthread_mutex_lock(a3);
  v3 = (_QWORD *)qword_1ECDA0C28;
  *(_QWORD *)(qword_1ECDA0C28 + 208) = sub_1A40C3520;
  v3[27] = sub_1A40C3A54;
  v3[28] = sub_1A40C2A24;
  v3[29] = sub_1A40C0980;
  v3[30] = sub_1A40C0FA4;
  v3[31] = _MGSCopyLocalizedString;
  v3[32] = sub_1A40C341C;
  v3[33] = sub_1A40C19F4;
  v3[34] = sub_1A40C2CA8;
  v3[35] = j__objc_msgSend_processIdentifier;
  v3[36] = sub_1A40C2FC8;
  v3[37] = sub_1A40C2E60;
  v3[38] = sub_1A40C198C;
  v3[39] = sub_1A40C2EC8;
  v3[40] = sub_1A40C2B78;
  v3[41] = sub_1A40C0684;
  v3[42] = sub_1A40C3F90;
  v3[43] = sub_1A40C42D4;
  v3[44] = sub_1A40C2F30;
  v3[45] = sub_1A40C4248;
  v3[46] = sub_1A40C1950;
  v3[47] = sub_1A40C3E58;
  v3[48] = sub_1A40C2F88;
  v3[49] = j__objc_msgSend_start;
  v3[50] = sub_1A40C4274;
  v3[51] = sub_1A40C30C8;
  return pthread_mutex_unlock((pthread_mutex_t *)qword_1ECDA0C20);
}

void *sub_1A40C0684(int a1, int a2)
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  void *v11;

  pthread_mutex_lock((pthread_mutex_t *)qword_1ECDA0C20);
  v4 = *(void **)(qword_1ECDA0C28 + 8 * a1);
  if (!v4)
  {
    v5 = off_1E4BA1198[2 * a1];
    v6 = dlopen(v5, 1);
    if (!v6
      || (a2 != 3
        ? (v11 = dlsym(v6, off_1E4BA1198[2 * a1 + 1]))
        : (v10 = (NSString *)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, (uint64_t)off_1E4BA1198[2 * a1 + 1], v8, v9), v11 = NSClassFromString(v10)), (v4 = v11) == 0))
    {
      sub_1A40C51A4(a1, (uint64_t)v5);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)qword_1ECDA0C20);
  return v4;
}

void sub_1A40C0884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFAllocator *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFIndex Length;
  CFIndex v13;
  char *v14;

  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("libMobileGestalt %s:%d: %@"), a1, a2, a3, 0);
  v11 = CFStringCreateWithFormatAndArguments(v9, 0, v10, &a9);
  Length = CFStringGetLength(v11);
  v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v14 = (char *)malloc_type_calloc(1uLL, v13, 0xBF105376uLL);
  if (v14)
  {
    if (CFStringGetCString(v11, v14, v13, 0x8000100u) == 1 && off_1EE7023B0 != 0)
      off_1EE7023B0(v14);
  }
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  free(v14);
}

id sub_1A40C0980(uint64_t a1)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void (*v34)(uint64_t);
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  _QWORD v50[5];
  __int128 buf;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A859AD80]();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3052000000;
  v53 = sub_1A40C1940;
  v54 = sub_1A40C1924;
  v55 = 0;
  v3 = (void *)MEMORY[0x1A859AD80]();
  v8 = (void *)objc_msgSend_proxy(MobileGestaltHelperProxy, v4, v5, v6, v7);
  v13 = (void *)objc_msgSend_helper(v8, v9, v10, v11, v12);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1A40C1908;
  v50[3] = &unk_1E4BA1178;
  v50[4] = &buf;
  objc_msgSend_getServerAnswerForQuestion_reply_(v13, v14, a1, (uint64_t)v50, v15);
  if (objc_msgSend_error(v8, v16, v17, v18, v19))
  {
    v24 = (void (*)(uint64_t))off_1ECDA0C18;
    if (off_1ECDA0C18)
    {
      v25 = objc_msgSend_error(v8, v20, v21, v22, v23);
      v24(v25);
    }
  }
  objc_msgSend_invalidate(v8, v20, v21, v22, v23);
  objc_autoreleasePoolPop(v3);
  v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  if (v26)
  {
    v33 = (id)objc_msgSend_objectForKey_(v26, v27, (uint64_t)CFSTR("answer"), v28, v29);
    v34 = (void (*)(uint64_t))off_1ECDA0C18;
    if (off_1ECDA0C18)
    {
      v35 = (void *)objc_msgSend_objectForKey_(v26, v30, (uint64_t)CFSTR("error"), v31, v32);
      v40 = objc_msgSend_intValue(v35, v36, v37, v38, v39);
      v34(v40);
    }
    v41 = objc_msgSend_objectForKeyedSubscript_(v26, v30, (uint64_t)CFSTR("logString"), v31, v32);
    if (v41)
    {
      v42 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
      if (v42)
        v48 = v42 + 1;
      else
        v48 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
      sub_1A40C0884((uint64_t)v48, 87, (uint64_t)CFSTR("%@"), v43, v44, v45, v46, v47, v41);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
    }

  }
  else
  {
    v33 = 0;
  }
  objc_autoreleasePoolPop(v2);
  return v33;
}

void sub_1A40C0BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _MGSCopyLocalizedString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  id v49;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1A859AD80]();
  v9 = (void *)MEMORY[0x1E0CB34D0];
  v13 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, a1, v11, v12);
  v17 = (void *)objc_msgSend_bundleWithPath_(v9, v14, v13, v15, v16);
  if (v17)
  {
    v22 = v17;
    v51 = a3;
    v23 = objc_msgSend_localizations(v17, v18, v19, v20, v21);
    if (v23)
    {
      v27 = v23;
      v28 = (void *)objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v24, (uint64_t)CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"), v25, v26);
      v32 = objc_msgSend_objectForKey_(v28, v29, (uint64_t)CFSTR("AppleLanguages"), v30, v31);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v32 = objc_msgSend_objectForKey_(v28, v33, (uint64_t)CFSTR("NSLanguages"), v34, v35);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = (void *)objc_msgSend_preferredLocalizationsFromArray_forPreferences_(MEMORY[0x1E0CB34D0], v24, v27, v32, v36);
        if (objc_msgSend_count(v37, v38, v39, v40, v41))
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v24, (uint64_t)&v52, (uint64_t)v56, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v53;
LABEL_9:
            v45 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v44)
                objc_enumerationMutation(v37);
              v46 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v45);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v48 = (void *)objc_msgSend_localizedStringForKey_value_table_localization_(v22, v47, a2, 0, a4, v46);
                if (v48)
                  break;
              }
              if (v43 == ++v45)
              {
                v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v47, (uint64_t)&v52, (uint64_t)v56, 16);
                if (v43)
                  goto LABEL_9;
                goto LABEL_19;
              }
            }
            v49 = v48;
            if (v49)
              goto LABEL_20;
          }
        }
      }
    }
LABEL_19:
    v49 = (id)objc_msgSend_localizedStringForKey_value_table_(v22, v24, a2, v51, a4);
  }
  else
  {
    v49 = 0;
  }
LABEL_20:
  objc_autoreleasePoolPop(v8);
  return v49;
}

id sub_1A40C0FA4(void *a1, uint64_t a2)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = (void *)MEMORY[0x1A859AD80]();
  v8 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, a2, v6, v7);
  v12 = (id)objc_msgSend_valueForEntitlement_(a1, v9, v8, v10, v11);
  objc_autoreleasePoolPop(v4);
  return v12;
}

id sub_1A40C1908(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return a2;
}

void sub_1A40C1918(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1A40C1924(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1A40C1930(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1A40C1940(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t sub_1A40C1950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel_registerForNotification_argument_question_, a2, a3, a4);
}

dispatch_queue_t sub_1A40C1960()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.MobileGestalt.observers", 0);
  qword_1ECDA0C00 = (uint64_t)result;
  return result;
}

BOOL sub_1A40C198C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;

  v5 = *(void **)(qword_1ECDA0C28 + 752);
  if (!v5)
    v5 = sub_1A40C0684(94, 3);
  v9 = (void *)objc_msgSend_sharedConnection(v5, a2, a3, a4, a5);
  v10 = *(uint64_t **)(qword_1ECDA0C28 + 736);
  if (!v10)
    v10 = (uint64_t *)sub_1A40C0684(92, 1);
  return objc_msgSend_effectiveBoolValueForSetting_(v9, v6, *v10, v7, v8) == 2;
}

uint64_t sub_1A40C19F4(uint64_t a1, uint64_t a2)
{
  MGNotificationRegistration *v4;
  uint64_t v5;

  v4 = [MGNotificationRegistration alloc];
  return MEMORY[0x1E0DE7D20](v4, sel_initWithQueue_block_, a1, a2, v5);
}

uint64_t sub_1A40C1A60(uint64_t a1, void *a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = a2;
    _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IPC error %@", (uint8_t *)&v23, 0xCu);
  }
  objc_msgSend_setError_(*(void **)(a1 + 32), v4, 10, v5, v6);
  v11 = (void *)objc_msgSend_domain(a2, v7, v8, v9, v10);
  result = objc_msgSend_isEqual_(v11, v12, *MEMORY[0x1E0CB28A8], v13, v14);
  if ((_DWORD)result)
  {
    result = objc_msgSend_code(a2, v16, v17, v18, v19);
    if (result == 4097)
      return objc_msgSend_setError_(*(void **)(a1 + 32), v20, 11, v21, v22);
  }
  return result;
}

void sub_1A40C1BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A40C1C00(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_1A40C1CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A40C1CC8(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t sub_1A40C1EE4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_updateWatcher(*(void **)(a1 + 32), a2, a3, a4, a5);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
  return result;
}

uint64_t sub_1A40C1F24(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_1A40C214C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_updateWatcher(*(void **)(a1 + 32), a2, a3, a4, a5);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
  return result;
}

uint64_t sub_1A40C218C(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_1A40C2194(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_updateWatcher(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_1A40C21F4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(NSObject **)(v2 + 48);
  if (v4)
    dispatch_source_cancel(v4);
}

uint64_t sub_1A40C22E4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  result = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, a2, (uint64_t)&v8, (uint64_t)v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      result = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v7, (uint64_t)&v8, (uint64_t)v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_1A40C23D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1E0DE7D20](a3, sel_invokeBlocks, a3, a4, a5);
}

uint64_t sub_1A40C23E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

void sub_1A40C23E8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a2 & 2) != 0)
    MEMORY[0x1E0DE7D20](a3, sel_invokeBlocks, a3, a4, a5);
}

uint64_t sub_1A40C23F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

uint64_t sub_1A40C2400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

void sub_1A40C2818(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[6];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v2 = *(NSObject **)(v1 + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1A40C2880;
    v4[3] = &unk_1E4BA10E0;
    v3 = *(_QWORD *)(a1 + 40);
    v4[4] = v1;
    v4[5] = v3;
    dispatch_async(v2, v4);
  }
}

uint64_t sub_1A40C2880(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

uint64_t sub_1A40C2910(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, a2, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v4)
  {
    v9 = v4;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v5, (uint64_t)v12, v7, v8);
        objc_msgSend__removeBlock_(v12, v14, v13, v15, v16);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v9);
  }
  return objc_msgSend_removeAllObjects(*(void **)(*(_QWORD *)(a1 + 32) + 8), v5, v6, v7, v8);
}

void sub_1A40C2A24(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_cancel(a1, a2, a3, a4, a5);

}

void sub_1A40C2A48(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  MGNotificationObserver *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A859AD80]();
  if (!qword_1ECDA0C08)
    qword_1ECDA0C08 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v2, *(unsigned int *)(a1 + 56), v3, v4);
  v7 = *(_QWORD *)(a1 + 32);
  v24[0] = v6;
  v24[1] = v7;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v24, 2, v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend_objectForKey_((void *)qword_1ECDA0C08, v11, v10, v12, v13);
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    v19 = [MGNotificationObserver alloc];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend_initWithType_argument_(v19, v20, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32), v21);
    objc_msgSend_setObject_forKey_((void *)qword_1ECDA0C08, v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10, v23);
  }
  objc_msgSend__addBlock_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v16, *(_QWORD *)(a1 + 40), v17, v18);
  objc_autoreleasePoolPop(v5);
}

uint64_t sub_1A40C2B78(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_1A40C1940;
  v36 = sub_1A40C1924;
  v37 = 0;
  v2 = (void *)MEMORY[0x1A859AD80]();
  v7 = (void *)objc_msgSend_proxy(MobileGestaltHelperProxy, v3, v4, v5, v6);
  v12 = (void *)objc_msgSend_helper(v7, v8, v9, v10, v11);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1A40C2C98;
  v31[3] = &unk_1E4BA1150;
  v31[4] = &v32;
  objc_msgSend_getSpringboardRegionOverride_reply_(v12, v13, a1, (uint64_t)v31, v14);
  if (objc_msgSend_error(v7, v15, v16, v17, v18))
  {
    v23 = (void (*)(uint64_t))off_1ECDA0C18;
    if (off_1ECDA0C18)
    {
      v24 = objc_msgSend_error(v7, v19, v20, v21, v22);
      v23(v24);
    }
  }
  objc_msgSend_invalidate(v7, v19, v20, v21, v22);
  objc_autoreleasePoolPop(v2);
  v25 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  return objc_msgSend_BOOLValue(v25, v26, v27, v28, v29);
}

void sub_1A40C2C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1A40C2C98(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return a2;
}

uint64_t sub_1A40C2CA8(_DWORD *a1, _DWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  uint64_t v56;

  v4 = (void *)MEMORY[0x1A859AD80]();
  v5 = 0;
  if (MGGetSInt32Answer() == 4)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3052000000;
    v54 = sub_1A40C1940;
    v55 = sub_1A40C1924;
    v56 = 0;
    v6 = (void *)MEMORY[0x1A859AD80]();
    v11 = (void *)objc_msgSend_proxy(MobileGestaltHelperProxy, v7, v8, v9, v10);
    v16 = (void *)objc_msgSend_helper(v11, v12, v13, v14, v15);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1A40C2E50;
    v50[3] = &unk_1E4BA1178;
    v50[4] = &v51;
    objc_msgSend_getAppleTVMode_(v16, v17, (uint64_t)v50, v18, v19);
    if (objc_msgSend_error(v11, v20, v21, v22, v23))
    {
      v28 = (void (*)(uint64_t))off_1ECDA0C18;
      if (off_1ECDA0C18)
      {
        v29 = objc_msgSend_error(v11, v24, v25, v26, v27);
        v28(v29);
      }
    }
    objc_msgSend_invalidate(v11, v24, v25, v26, v27);
    objc_autoreleasePoolPop(v6);
    v30 = (void *)v52[5];
    _Block_object_dispose(&v51, 8);
    v31 = v30;
    v35 = (void *)objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)CFSTR("width"), v33, v34);
    v39 = objc_msgSend_objectForKeyedSubscript_(v30, v36, (uint64_t)CFSTR("height"), v37, v38);
    v5 = 0;
    if (v35)
    {
      v44 = (void *)v39;
      if (v39)
      {
        *a1 = objc_msgSend_intValue(v35, v40, v41, v42, v43);
        *a2 = objc_msgSend_intValue(v44, v45, v46, v47, v48);
        v5 = 1;
      }
    }
  }
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_1A40C2E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1A40C2E50(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return a2;
}

BOOL sub_1A40C2E60(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;

  v5 = *(void **)(qword_1ECDA0C28 + 752);
  if (!v5)
    v5 = sub_1A40C0684(94, 3);
  v9 = (void *)objc_msgSend_sharedConnection(v5, a2, a3, a4, a5);
  v10 = *(uint64_t **)(qword_1ECDA0C28 + 728);
  if (!v10)
    v10 = (uint64_t *)sub_1A40C0684(91, 1);
  return objc_msgSend_effectiveBoolValueForSetting_(v9, v6, *v10, v7, v8) == 2;
}

BOOL sub_1A40C2EC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;

  v5 = *(void **)(qword_1ECDA0C28 + 752);
  if (!v5)
    v5 = sub_1A40C0684(94, 3);
  v9 = (void *)objc_msgSend_sharedConnection(v5, a2, a3, a4, a5);
  v10 = *(uint64_t **)(qword_1ECDA0C28 + 744);
  if (!v10)
    v10 = (uint64_t *)sub_1A40C0684(93, 1);
  return objc_msgSend_effectiveBoolValueForSetting_(v9, v6, *v10, v7, v8) == 2;
}

uint64_t sub_1A40C2F30()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v0 = (void *)MEMORY[0x1A859AD80]();
  v5 = (void *)objc_msgSend_proxy(MobileGestaltHelperProxy, v1, v2, v3, v4);
  v10 = objc_msgSend_proxyRebuildCache(v5, v6, v7, v8, v9);
  objc_msgSend_invalidate(v5, v11, v12, v13, v14);
  _MGClearInProcessCache();
  objc_autoreleasePoolPop(v0);
  return v10;
}

uint64_t sub_1A40C2F88()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = (void *)MEMORY[0x1A859AD80]();
  v5 = (void *)objc_msgSend_proxy(MobileGestaltHelperProxy, v1, v2, v3, v4);
  v10 = objc_msgSend_proxySetCacheSentinel(v5, v6, v7, v8, v9);
  objc_autoreleasePoolPop(v0);
  return v10;
}

uint64_t sub_1A40C2FC8()
{
  void *v0;
  int v1;
  int v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unsigned int v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1A859AD80]();
  v12 = 0;
  v1 = sub_1A40C4D90((int *)&v12);
  if (v1)
  {
    v2 = v1;
    v3 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
    if (v3)
      v9 = v3 + 1;
    else
      v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
    sub_1A40C0884((uint64_t)v9, 259, (uint64_t)CFSTR("getSensorProvisioningState returned error %ld"), v4, v5, v6, v7, v8, v2);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v2;
      _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState returned error %ld", buf, 0xCu);
    }
  }
  v10 = v12;
  objc_autoreleasePoolPop(v0);
  return v10;
}

void sub_1A40C30C8(uint64_t a1, uint64_t a2)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A859AD80]();
  v40 = 0;
  v6 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v5, a1, 200, 0, &v40);
  if (v6)
  {
    v10 = (void *)v6;
    v39 = 0;
    v11 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, a2, v8, v9);
    objc_msgSend_writeToFile_options_error_(v10, v12, v11, 268435457, (uint64_t)&v39);
    if (v39)
    {
      v13 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
      v14 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
      if (v14)
        v13 = v14 + 1;
      objc_msgSend_localizedDescription(v39, v15, v16, v17, v18);
      sub_1A40C0884((uint64_t)v13, 288, (uint64_t)CFSTR("Failed to persist file %s with reason: %@"), v19, v20, v21, v22, v23, a2);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend_localizedDescription(v39, v24, v25, v26, v27);
        *(_DWORD *)buf = 136315394;
        v42 = a2;
        v43 = 2112;
        v44 = v28;
        v29 = MEMORY[0x1E0C81028];
        v30 = "Failed to persist file %s with reason: %@";
        v31 = 22;
LABEL_12:
        _os_log_impl(&dword_1A40BF000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, v31);
      }
    }
  }
  else
  {
    v32 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
    if (v32)
      v38 = v32 + 1;
    else
      v38 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
    sub_1A40C0884((uint64_t)v38, 279, (uint64_t)CFSTR("failed to write cache: %@"), v33, v34, v35, v36, v37, v40);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v40;
      v29 = MEMORY[0x1E0C81028];
      v30 = "failed to write cache: %@";
      v31 = 12;
      goto LABEL_12;
    }
  }
  objc_autoreleasePoolPop(v4);
}

uint64_t sub_1A40C32B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v19;
  uint8_t buf[2];

  v5 = (void *)sub_1A40C3358(a1, a2, a3, a4, a5);
  v10 = (void *)objc_msgSend_sharedClient(v5, v6, v7, v8, v9);
  if (v10)
  {
    result = objc_msgSend_crashreporterKey(v10, v11, v12, v13, v14);
    if (result)
      return result;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Valid OTATaskAgentClient but failed to get CrashReporterID.";
      v18 = (uint8_t *)&v19;
LABEL_7:
      _os_log_impl(&dword_1A40BF000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Failed to get OTATaskAgentClient for CrashReporterID.";
    v18 = buf;
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_1A40C3358(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_1A40C1940;
  v12 = sub_1A40C1924;
  v5 = qword_1EE7023A8;
  v13 = qword_1EE7023A8;
  if (!qword_1EE7023A8)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1A40C4334;
    v7[3] = &unk_1E4BA1840;
    v7[4] = &v8;
    sub_1A40C4334((uint64_t)v7, a2, a3, a4, a5);
    v5 = v9[5];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1A40C3404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A40C341C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1EE702398 != -1)
    dispatch_once(&qword_1EE702398, &unk_1E4BA0FB0);
  return objc_msgSend_copy((void *)qword_1EE702390, a2, a3, a4, a5);
}

uint64_t sub_1A40C345C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = sub_1A40C32B0(a1, a2, a3, a4, a5);
  qword_1EE702390 = result;
  return result;
}

uint64_t sub_1A40C3478(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v19;
  uint8_t buf[2];

  v5 = (void *)sub_1A40C3358(a1, a2, a3, a4, a5);
  v10 = (void *)objc_msgSend_sharedClient(v5, v6, v7, v8, v9);
  if (v10)
  {
    result = objc_msgSend_awdKey(v10, v11, v12, v13, v14);
    if (result)
      return result;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Valid OTATaskAgentClient but failed to get CrashReporterID.";
      v18 = (uint8_t *)&v19;
LABEL_7:
      _os_log_impl(&dword_1A40BF000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Failed to get OTATaskAgentClient for AWDID.";
    v18 = buf;
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_1A40C3520(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1EE702380 != -1)
    dispatch_once(&qword_1EE702380, &unk_1E4BA1818);
  return objc_msgSend_copy((void *)qword_1EE702388, a2, a3, a4, a5);
}

uint64_t sub_1A40C3560(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = sub_1A40C3478(a1, a2, a3, a4, a5);
  qword_1EE702388 = result;
  return result;
}

SEL sub_1A40C357C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  SEL result;
  uint8_t v4[16];
  uint64_t v5;
  uint64_t v6;

  switch(a1)
  {
    case 1:
      result = NSSelectorFromString(CFSTR("ICCID"));
      break;
    case 2:
      result = NSSelectorFromString(CFSTR("IMEI"));
      break;
    case 3:
      result = NSSelectorFromString(CFSTR("MEID"));
      break;
    case 4:
      result = NSSelectorFromString(CFSTR("baseId"));
      break;
    case 5:
      result = NSSelectorFromString(CFSTR("baseProfile"));
      break;
    case 6:
      result = NSSelectorFromString(CFSTR("baseVersion"));
      break;
    case 7:
      result = NSSelectorFromString(CFSTR("displayCSN"));
      break;
    case 8:
      result = NSSelectorFromString(CFSTR("CSN"));
      break;
    default:
      v5 = v1;
      v6 = v2;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Key not recognized", v4, 2u);
      }
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_1A40C365C(void *a1, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    LOWORD(v12) = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Invalid equipmentInfo";
LABEL_13:
    v10 = 2;
    goto LABEL_14;
  }
  if (!a2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    LOWORD(v12) = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Invalid CT selector";
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    LOWORD(v12) = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "EquipmentInfo doesn't respond to target selector";
    goto LABEL_13;
  }
  v7 = objc_msgSend_performSelector_(a1, v4, a2, v5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = objc_opt_class();
      v8 = MEMORY[0x1E0C81028];
      v9 = "Target selector returned unexpected class %@";
      v10 = 12;
LABEL_14:
      _os_log_impl(&dword_1A40BF000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v10);
    }
    return 0;
  }
  return v7;
}

uint64_t sub_1A40C37F4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = (int)a2;
  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_msgSend_meInfoList(a1, a2, a3, a4, a5, 0);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v9)
  {
    v14 = v9;
    v15 = *(_QWORD *)v26;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v7);
      v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
      v18 = objc_msgSend_slotId(v17, v10, v11, v12, v13);
      if (!v6 && v18 == 1)
        break;
      v23 = objc_msgSend_slotId(v17, v19, v20, v21, v22);
      if (v6 == 1 && v23 == 2)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v25, (uint64_t)v29, 16);
        v17 = 0;
        if (v14)
          goto LABEL_3;
        return sub_1A40C365C(v17, a3);
      }
    }
  }
  else
  {
    v17 = 0;
  }
  return sub_1A40C365C(v17, a3);
}

uint64_t sub_1A40C3924(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  const char *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend_meInfoList(a1, a2, a3, a4, a5);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v6);
      result = sub_1A40C365C(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v11), (uint64_t)a2);
      if (result)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v15, (uint64_t)v19, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "All slots had nil at desired property", v14, 2u);
    }
    return 0;
  }
  return result;
}

const void *sub_1A40C3A54(int a1, const char *a2)
{
  const char *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *MobileEquipmentInfo;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  const void *v21;
  const void *v23;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = sub_1A40C357C(a1);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "getSelectorForKey failed. No selector found.", buf, 2u);
  }
  v25 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CA6E38]);
  MobileEquipmentInfo = (void *)objc_msgSend_getMobileEquipmentInfo_(v4, v5, (uint64_t)&v25, v6, v7);
  v12 = v25;
  if (v25)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      v21 = 0;
      goto LABEL_9;
    }
    v17 = objc_msgSend_localizedDescription(v12, v13, v14, v15, v16);
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    v18 = MEMORY[0x1E0C81028];
    v19 = "MobileEquipmentInfo failed with error %@";
    v20 = 12;
LABEL_7:
    _os_log_impl(&dword_1A40BF000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
    goto LABEL_8;
  }
  if (a2 >= 2)
  {
    if ((_DWORD)a2 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
      v19 = "invalid index selected";
      v20 = 2;
      goto LABEL_7;
    }
    v23 = (const void *)sub_1A40C3924(MobileEquipmentInfo, v3, v9, v10, v11);
  }
  else
  {
    v23 = (const void *)sub_1A40C37F4(MobileEquipmentInfo, a2, (uint64_t)v3, v10, v11);
  }
  v21 = v23;
  if (v23)
    CFRetain(v23);
LABEL_9:
  if (v4)

  return v21;
}

uint64_t sub_1A40C3BF8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  void *SubscriptionInfoWithError;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  uint64_t SIMStatus_error;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v5 = (int)a2;
  v52 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  SubscriptionInfoWithError = (void *)objc_msgSend_getSubscriptionInfoWithError_(a1, a2, (uint64_t)&v48, a4, a5);
  v12 = v48;
  if (!SubscriptionInfoWithError || v48)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend_localizedDescription(v12, v28, v29, v30, v31);
      *(_DWORD *)buf = 138412290;
      v51 = v32;
      v33 = MEMORY[0x1E0C81028];
      v34 = "Failed to get subscription info with error %@";
      v35 = 12;
LABEL_23:
      _os_log_impl(&dword_1A40BF000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
    }
    return 0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = (void *)objc_msgSend_subscriptions(SubscriptionInfoWithError, v8, v9, v10, v11, 0);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v44, (uint64_t)v49, 16);
  if (!v15)
  {
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v5;
      v33 = MEMORY[0x1E0C81028];
      v34 = "No subscription context found for slot %d";
      v35 = 8;
      goto LABEL_23;
    }
    return 0;
  }
  v20 = v15;
  v21 = *(_QWORD *)v45;
LABEL_5:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v21)
      objc_enumerationMutation(v13);
    v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v22);
    v24 = objc_msgSend_slotID(v23, v16, v17, v18, v19);
    if (!v5 && v24 == 1)
      break;
    v27 = objc_msgSend_slotID(v23, v16, v25, v26, v19);
    if (v5 == 1 && v27 == 2)
      break;
    if (v20 == ++v22)
    {
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v44, (uint64_t)v49, 16);
      if (v20)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  if (!v23)
    goto LABEL_21;
  SIMStatus_error = objc_msgSend_getSIMStatus_error_(a1, v16, (uint64_t)v23, (uint64_t)&v48, v19);
  v37 = v48;
  if (v48 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_msgSend_localizedDescription(v37, v38, v39, v40, v41);
    *(_DWORD *)buf = 138412290;
    v51 = v42;
    _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "getSimStatus failed with error %@", buf, 0xCu);
  }
  return SIMStatus_error;
}

const void *sub_1A40C3E58(int a1, const char *a2)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  const void *SIMTrayStatusOrError;
  const __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CA6E38]);
  v9 = v4;
  if (a1 != 2)
  {
    v10 = 0;
    if (a1 != 1)
      goto LABEL_10;
    SIMTrayStatusOrError = (const void *)sub_1A40C3BF8(v4, a2, v6, v7, v8);
    goto LABEL_8;
  }
  SIMTrayStatusOrError = (const void *)objc_msgSend_getSIMTrayStatusOrError_(v4, v5, (uint64_t)&v19, v7, v8);
  if (!v19)
  {
LABEL_8:
    v10 = SIMTrayStatusOrError;
    if (SIMTrayStatusOrError)
      CFRetain(SIMTrayStatusOrError);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = sub_1A40C4410(2);
    v17 = objc_msgSend_localizedDescription(v19, v13, v14, v15, v16);
    *(_DWORD *)buf = 138412546;
    v21 = v12;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Query for %@ returned error %@", buf, 0x16u);
  }
  v10 = 0;
LABEL_10:
  if (v9)

  return v10;
}

id sub_1A40C3F90(int a1)
{
  uint64_t v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *SubscriptionInfoWithError;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *PhoneNumber_error;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  id v36;
  void *v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  if (a1)
  {
    if (a1 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v47) = a1;
        v30 = MEMORY[0x1E0C81028];
        v31 = "Invalid index: %d";
        v32 = 8;
LABEL_22:
        _os_log_impl(&dword_1A40BF000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
      }
LABEL_23:
      v7 = 0;
      goto LABEL_31;
    }
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CA6E38]);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v30 = MEMORY[0x1E0C81028];
      v31 = "Failed to alloc telephony client.";
      v32 = 2;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v7 = v3;
  SubscriptionInfoWithError = (void *)objc_msgSend_getSubscriptionInfoWithError_(v3, v4, (uint64_t)&v44, v5, v6);
  if (!SubscriptionInfoWithError)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v44;
      v33 = MEMORY[0x1E0C81028];
      v34 = "Failed to retrieve subscription info: %@";
      v35 = 12;
LABEL_30:
      _os_log_impl(&dword_1A40BF000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
    }
LABEL_31:
    v37 = 0;
    v38 = 0;
    goto LABEL_32;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = (void *)objc_msgSend_subscriptions(SubscriptionInfoWithError, v9, v10, v11, v12, 0);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, (uint64_t)v45, 16);
  if (!v15)
  {
LABEL_28:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = MEMORY[0x1E0C81028];
      v34 = "Failed to retrieve phone number.";
      v35 = 2;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v18 = v15;
  v19 = *(_QWORD *)v41;
LABEL_9:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v19)
      objc_enumerationMutation(v13);
    v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
    PhoneNumber_error = (void *)objc_msgSend_getPhoneNumber_error_(v7, v16, (uint64_t)v21, 0, v17);
    if (PhoneNumber_error)
    {
      v25 = PhoneNumber_error;
      if (objc_msgSend_isPresent(PhoneNumber_error, v16, v23, v24, v17))
      {
        if (objc_msgSend_slotID(v21, v16, v26, v27, v17) == v2)
          break;
      }
    }
    if (v18 == ++v20)
    {
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v40, (uint64_t)v45, 16);
      if (v18)
        goto LABEL_9;
      goto LABEL_28;
    }
  }
  v36 = (id)objc_msgSend_number(v25, v16, v28, v29, v17);
  if (!v36)
    goto LABEL_28;
  v37 = v36;
  v38 = v36;
LABEL_32:

  return v38;
}

uint64_t sub_1A40C4248()
{
  uint64_t (*v0)(void);

  v0 = *(uint64_t (**)(void))(qword_1ECDA0C28 + 768);
  if (!v0)
    v0 = (uint64_t (*)(void))sub_1A40C0684(96, 2);
  return v0();
}

CFPropertyListRef sub_1A40C4274()
{
  uint64_t v0;
  CFPropertyListRef v1;
  CFPropertyListRef v2;
  CFTypeID v3;

  v0 = *MEMORY[0x1E0C9AE40];
  v1 = CFPreferencesCopyAppValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"));
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID())
      return v2;
  }
  return (CFPropertyListRef)v0;
}

CFPropertyListRef sub_1A40C42D4()
{
  uint64_t v0;
  CFPropertyListRef v1;
  CFPropertyListRef v2;
  CFTypeID v3;

  v0 = *MEMORY[0x1E0C9AE40];
  v1 = CFPreferencesCopyAppValue(CFSTR("PressDemoMode"), CFSTR("com.apple.demo-settings"));
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID())
      return v2;
  }
  return (CFPropertyListRef)v0;
}

Class sub_1A40C4334(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Class result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  if (!qword_1EE7023A0)
  {
    v12 = xmmword_1E4BA1860;
    v13 = 0;
    qword_1EE7023A0 = _sl_dlopen();
  }
  if (!qword_1EE7023A0)
    sub_1A40C5288(&v11, a2, a3, a4, a5);
  result = objc_getClass("OTATaskingAgentClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_1A40C52EC((uint64_t)result, v7, v8, v9, v10);
  qword_1EE7023A8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

const __CFString *sub_1A40C4410(int a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("MGS_SIM_NULL_STATUS");
  if (a1 == 2)
    v1 = CFSTR("MGS_SIM_TRAY_STATUS");
  if (a1 == 1)
    v2 = CFSTR("MGS_SIM_STATUS");
  else
    v2 = v1;
  CFRetain(v2);
  return v2;
}

os_log_t sub_1A40C445C()
{
  os_log_t result;
  NSObject *v1;

  result = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  qword_1EE7023B8 = (uint64_t)result;
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1A40C50B0(&v1);
      result = v1;
    }
    else
    {
      result = 0;
    }
  }
  qword_1EE7023C0 = (uint64_t)result;
  return result;
}

uint64_t sub_1A40C44C4(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v7;
  _BOOL8 v8;
  _WORD *v16;
  void *v17;
  uint64_t v18;
  NSObject *v20;
  NSObject *v21;
  _BYTE v22[12];
  __int16 v23;
  _BOOL8 v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a5 + 8;
  v8 = a5 >= 0xFFFFFFFFFFFFFFF8;
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023B8)
      v20 = qword_1EE7023B8;
    else
      v20 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v22 = 136316162;
      *(_QWORD *)&v22[4] = "err == 0 ";
      v23 = 2048;
      v24 = v8;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v29 = 1024;
      v30 = 64;
      _os_log_impl(&dword_1A40BF000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
    }
    return 1;
  }
  else
  {
    v16 = malloc_type_malloc(a5 + 8, 0x6EB58E55uLL);
    if (v16)
    {
      v17 = v16;
      *v16 = 19778;
      v16[1] = a2;
      v16[2] = 1;
      v16[3] = a3;
      if (a5)
        memmove(v16 + 4, a4, a5);
      if (a7)
      {
        *(_QWORD *)v22 = *a7;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
        *a7 = *(_QWORD *)v22;
      }
      else
      {
        *(_QWORD *)v22 = 0;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
      }
      free(v17);
    }
    else
    {
      if (qword_1EE702378 != -1)
        dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
      if (qword_1EE7023B8)
        v21 = qword_1EE7023B8;
      else
        v21 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = "cmd";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = "";
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v29 = 1024;
        v30 = 67;
        _os_log_impl(&dword_1A40BF000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
      }
      return 12;
    }
  }
  return v18;
}

uint64_t sub_1A40C47AC()
{
  int v0;
  uint64_t v1;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = sub_1A40C44C4(dword_1EE7023CC, 2, 1, 0, 0, 0, 0);
  v1 = v0;
  if (v0)
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023B8)
      v3 = qword_1EE7023B8;
    else
      v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "err == 0 ";
      v6 = 2048;
      v7 = v1;
      v8 = 2080;
      v9 = "";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v12 = 1024;
      v13 = 95;
      _os_log_impl(&dword_1A40BF000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
  return v1;
}

uint64_t sub_1A40C48F8()
{
  int v0;
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v5 = 4;
  v0 = sub_1A40C44C4(dword_1EE7023CC, 16, 0, 0, 0, &v6, &v5);
  if (v0)
  {
    v2 = v0;
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023B8)
      v3 = qword_1EE7023B8;
    else
      v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v2;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 114;
      _os_log_impl(&dword_1A40BF000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 != 4)
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023B8)
      v4 = qword_1EE7023B8;
    else
      v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "size == sizeof(state)";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 115;
      _os_log_impl(&dword_1A40BF000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
  return v6;
}

uint64_t sub_1A40C4B34()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (dword_1EE7023CC)
    goto LABEL_5;
  v0 = *MEMORY[0x1E0CBBAB8];
  v1 = IOServiceMatching("AppleBiometricServices");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    v4 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &dword_1EE7023CC);
    if (!(_DWORD)v4)
    {
      IOObjectRelease(v3);
LABEL_5:
      if (!sub_1A40C48F8())
        sub_1A40C47AC();
      return 0;
    }
    v5 = v4;
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023B8)
      v7 = qword_1EE7023B8;
    else
      v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "err == 0 ";
      v10 = 2048;
      v11 = (int)v5;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v16 = 1024;
      v17 = 135;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    v5 = 3758097084;
    if (qword_1EE7023B8)
      v7 = qword_1EE7023B8;
    else
      v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "service";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v16 = 1024;
      v17 = 132;
LABEL_23:
      _os_log_impl(&dword_1A40BF000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
  }
  return v5;
}

uint64_t sub_1A40C4D90(int *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  int v13;
  _BYTE v14[10];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1EE702378 != -1)
    dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
  v2 = MEMORY[0x1E0C81028];
  if (qword_1EE7023C0)
    v3 = qword_1EE7023C0;
  else
    v3 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    *(_QWORD *)v14 = a1;
    _os_log_impl(&dword_1A40BF000, v3, OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState %p\n", (uint8_t *)&v13, 0xCu);
  }
  if (a1)
  {
    if (byte_1EE7023D1)
    {
      v4 = 0;
      *a1 = dword_1EE702370;
    }
    else
    {
      v4 = sub_1A40C4B34();
      if ((_DWORD)v4)
      {
        if (qword_1EE702378 != -1)
          dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
        if (qword_1EE7023B8)
          v12 = qword_1EE7023B8;
        else
          v12 = v2;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = 136316162;
          *(_QWORD *)v14 = "err == 0 ";
          *(_WORD *)&v14[8] = 2048;
          v15 = (int)v4;
          v16 = 2080;
          v17 = "";
          v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
          v20 = 1024;
          v21 = 402;
          _os_log_impl(&dword_1A40BF000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
        }
      }
      else
      {
        *a1 = sub_1A40C48F8();
      }
    }
  }
  else
  {
    v4 = 3758097090;
  }
  if (dword_1EE7023CC)
  {
    IOServiceClose(dword_1EE7023CC);
    dword_1EE7023CC = 0;
  }
  if ((_DWORD)v4)
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023C0)
      v5 = qword_1EE7023C0;
    else
      v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (a1)
        v6 = *a1;
      else
        v6 = -1;
      v13 = 67109376;
      *(_DWORD *)v14 = v4;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v6;
      v9 = v5;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl(&dword_1A40BF000, v9, v10, "getSensorProvisioningState -> %{errno}d %d\n", (uint8_t *)&v13, 0xEu);
    }
  }
  else
  {
    if (qword_1EE702378 != -1)
      dispatch_once(&qword_1EE702378, &unk_1E4BA0FD0);
    if (qword_1EE7023C0)
      v7 = qword_1EE7023C0;
    else
      v7 = v2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (a1)
        v8 = *a1;
      else
        v8 = -1;
      v13 = 67109376;
      *(_DWORD *)v14 = 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v8;
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_36;
    }
  }
  return v4;
}

void sub_1A40C50B0(_QWORD *a1)
{
  uint8_t v2[16];

  *(_WORD *)v2 = 0;
  _os_log_error_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = qword_1EE7023B8;
}

void sub_1A40C510C(int a1)
{
  _DWORD v1[2];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109378;
  v1[1] = a1;
  v2 = 2080;
  v3 = xpc_strerror();
  _os_log_error_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v1, 0x12u);
}

void sub_1A40C51A4(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
  if (v4)
    v10 = v4 + 1;
  else
    v10 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
  v11 = off_1E4BA1198[2 * a1 + 1];
  sub_1A40C0884((uint64_t)v10, 330, (uint64_t)CFSTR("%s missing from %s\n"), v5, v6, v7, v8, v9, (char)v11);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = v11;
    v14 = 2080;
    v15 = a2;
    _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s missing from %s\n", buf, 0x16u);
  }
  __assert_rtn("_MGSLoadSymbol", "MobileGestaltSupport.m", 331, "0");
}

void sub_1A40C5288(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v6 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, a4, a5);
  v10 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, (uint64_t)"void *CrashReporterSupportLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, v10, (uint64_t)CFSTR("MobileGestaltSupport.m"), 32, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_1A40C52EC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v5 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, a4, a5);
  v9 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v6, (uint64_t)"Class getOTATaskingAgentClientClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, v9, (uint64_t)CFSTR("MobileGestaltSupport.m"), 33, CFSTR("Unable to find class %s"), "OTATaskingAgentClient");
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1E0CE8788](allocator);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE8A10](prefs, queue);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _MGClearInProcessCache()
{
  return MEMORY[0x1E0DE2C90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

