BOOL PBNSPreferredRepresentationFromPB(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

uint64_t PBPreferencesBoolValue(void *a1, char a2)
{
  uint64_t v2;
  _QWORD v4[5];
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PBPreferencesBoolValue_block_invoke;
  v4[3] = &unk_1E2431AB0;
  v4[4] = &v6;
  v5 = a2;
  _readPasteboardPreferenceCached(a1, v4);
  v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void _readPasteboardPreferenceCached(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  _preferencesCacheQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___readPasteboardPreferenceCached_block_invoke;
  block[3] = &unk_1E24314A0;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

}

id _preferencesCacheQueue()
{
  if (qword_1ECED8C58 != -1)
    dispatch_once(&qword_1ECED8C58, &__block_literal_global_62);
  return (id)qword_1ECED8C50;
}

id PBAllowedMetadataClasses()
{
  if (qword_1ECED8C08 != -1)
    dispatch_once(&qword_1ECED8C08, &__block_literal_global_14);
  return (id)_MergedGlobals_5;
}

id PBNewClientToServerXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0436A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBItemCollection allowedClassesForSecureCoding](PBItemCollection, "allowedClassesForSecureCoding");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_pasteboardWithName_createIfNeeded_completionBlock_, 0, 1);

  +[PBItemCollection allowedClassesForSecureCoding](PBItemCollection, "allowedClassesForSecureCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_savePasteboard_dataProviderEndpoint_completionBlock_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_savePasteboard_dataProviderEndpoint_completionBlock_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_didPasteContentsFromPasteboardWithName_UUID_completionBlock_, 0, 0);

  +[PBItemCollection allowedClassesForSecureCoding](PBItemCollection, "allowedClassesForSecureCoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAllPasteboardsCompletionBlock_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock_, 2, 1);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock_, 0, 1);

  return v0;
}

void sub_18C53C920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C53CA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C53CAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C53CD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PBCannotUnserializePasteboardError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Cannot unserialize pasteboard at URL %@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(8, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBErrorMake(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBErrorDomain"), a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_18C53DCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 184), 8);
  _Block_object_dispose((const void *)(v70 - 136), 8);
  _Unwind_Resume(a1);
}

id PBNSIPTopLevelMetadataKeys()
{
  if (qword_1ECED8BB8 != -1)
    dispatch_once(&qword_1ECED8BB8, &__block_literal_global_2);
  return (id)_MergedGlobals_2;
}

void sub_18C53E4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18C53E804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _bestMatchType(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(id, id, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "isEqualToString:", v5) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v15)
    {
      v19 = 0;
      goto LABEL_19;
    }
    v16 = v15;
    v17 = *(_QWORD *)v22;
LABEL_11:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v14);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18);
      if ((v7[2](v7, v5, v13) & 1) != 0)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        v19 = 0;
        if (v16)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v19 = v13;
LABEL_19:

  return v19;
}

void sub_18C53ECF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id PBItemQueue()
{
  if (qword_1ECED8C88 != -1)
    dispatch_once(&qword_1ECED8C88, &__block_literal_global_7);
  return (id)_MergedGlobals_6;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t PBIsPasteboardNameGeneralPasteboard(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general"));
}

id PBStorageRootURL()
{
  if (qword_1ECED8C28 != -1)
    dispatch_once(&qword_1ECED8C28, &__block_literal_global_32);
  return (id)qword_1ECED8C20;
}

BOOL PBIsPasteboardNameAllowed(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (a2 && !v4)
  {
    PBPasteboardNameInvalidError((uint64_t)v3, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5 != 0;
}

void ___notificationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.Pasteboard.notification-queue", 0);
  v1 = (void *)qword_1ECED8B90;
  qword_1ECED8B90 = (uint64_t)v0;

}

void sub_18C53F4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id _PBLog()
{
  if (_PBLog_onceToken != -1)
    dispatch_once(&_PBLog_onceToken, &__block_literal_global_3);
  return (id)_PBLog_log;
}

char *PBSHA1HashOfString(void *a1)
{
  char *v1;
  const char *v2;
  CC_LONG v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unint64_t v6;
  CC_SHA1_CTX v8;
  unsigned __int8 v9[41];
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  if (v1)
  {
    v2 = v1;
    memset(&v8, 0, sizeof(v8));
    CC_SHA1_Init(&v8);
    v3 = strlen(v2);
    CC_SHA1_Update(&v8, v2, v3);
    CC_SHA1_Final(md, &v8);
    v4 = 0;
    v5 = v9;
    do
    {
      v6 = md[v4];
      *v5 = PBSHA1HashOfString_hexNibble[v6 >> 4];
      v5[1] = PBSHA1HashOfString_hexNibble[v6 & 0xF];
      v5 += 2;
      ++v4;
    }
    while (v4 != 20);
    *v5 = 0;
    v1 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, 40, 4);
  }
  return v1;
}

uint64_t _notificationQueue_getState()
{
  uint32_t state;
  uint32_t v1;
  NSObject *v2;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(_notificationQueue_token, &state64);
  if (!state)
    return state64;
  v1 = state;
  _PBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    v6 = v1;
    _os_log_fault_impl(&dword_18C53A000, v2, OS_LOG_TYPE_FAULT, "Cannot get notification state. Error: %d", buf, 8u);
  }

  return 0;
}

id _notificationQueue()
{
  if (qword_1ECED8B98 != -1)
    dispatch_once(&qword_1ECED8B98, &__block_literal_global_94);
  return (id)qword_1ECED8B90;
}

void sub_18C53FB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id _loggingErrorHandler(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___loggingErrorHandler_block_invoke;
  v7[3] = &unk_1E2431438;
  v8 = v3;
  v9 = a1;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D782EA4](v7);

  return v5;
}

void sub_18C53FD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PBDispatchAsyncCallback(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  callbackQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v1);

}

id callbackQueue()
{
  if (qword_1ECED8C48 != -1)
    dispatch_once(&qword_1ECED8C48, &__block_literal_global_60);
  return (id)qword_1ECED8C40;
}

void ___readPasteboardPreferenceCached_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD handler[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _preferencesCacheQueue_KeyToValueMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Pasteboard"), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _PBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_18C53A000, v5, OS_LOG_TYPE_INFO, "Registering for pasteboard preferences notification: %@", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    _preferencesCacheQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___readPasteboardPreferenceCached_block_invoke_28;
    handler[3] = &unk_1E2431A88;
    v14 = *(id *)(a1 + 32);
    notify_register_dispatch(v7, (int *)buf, v8, handler);

    _readPasteboardPreference(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      _preferencesCacheQueue_KeyToValueMap();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _preferencesCacheQueue_KeyToValueMap();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v11)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v3;
    else
      v12 = 0;
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12);
  }

}

id _preferencesCacheQueue_KeyToValueMap()
{
  if (qword_1ECED8C68 != -1)
    dispatch_once(&qword_1ECED8C68, &__block_literal_global_64);
  return (id)qword_1ECED8C60;
}

__CFString *PBPasteboardPersistenceName(void *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __CFString *v14;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general")))
  {
    if ((a4 & 1) != 0)
    {
      v10 = CFSTR("com.apple.UIKit.pboard.general.locked");
      goto LABEL_12;
    }
    v14 = CFSTR("com.apple.UIKit.pboard.general");
LABEL_10:
    v10 = v14;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v10 = 0;
    goto LABEL_12;
  }
  v11 = objc_msgSend(v9, "length");
  v12 = v9;
  if (!v11 && (v13 = objc_msgSend(v8, "length"), v12 = v8, !v13)
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v12, v7),
        (v10 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownApp.%@"), v7);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_12:

  return v10;
}

void sub_18C54378C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18C543C14(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D782EA4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_18C544B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void *_bestReadOnlySandboxExtensionTypeForURL(void *result)
{
  id v1;
  void *v2;
  id v3;
  int v4;

  if (result)
  {
    v1 = result;
    getpid();
    objc_msgSend(v1, "path");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_retainAutorelease(v2);
    objc_msgSend(v3, "fileSystemRepresentation");
    v4 = sandbox_check();

    if (v4)
      return 0;
    else
      return (void *)*MEMORY[0x1E0C80000];
  }
  return result;
}

id _issueSandboxExtension(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "fileSystemRepresentation");
  v7 = (const char *)sandbox_extension_issue_file();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, strlen(v7) + 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2FE0];
    v12 = *__error();
    v19 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = __error();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Could not create sandbox extension of type %s for URL %@. Error: %s"), a2, v14, strerror(*v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (a3 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      v8 = 0;
      *a3 = v9;
    }
  }

  return v8;
}

void *initFPIsFileProviderBookmark(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t (*v5)();

  v4 = FileProviderLibrary();
  v5 = (uint64_t (*)())dlsym(v4, "FPIsFileProviderBookmark");
  softLinkFPIsFileProviderBookmark = v5;
  if (v5)
    return (void *)((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
  dlerror();
  abort_report_np();
  return FileProviderLibrary();
}

void *FileProviderLibrary()
{
  void *result;
  uint64_t v1;

  result = (void *)FileProviderLibrary_frameworkLibrary;
  if (!FileProviderLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      dlerror();
      v1 = abort_report_np();
      return (void *)initFPCreateBookmarkableStringFromDocumentURL(v1);
    }
  }
  return result;
}

uint64_t initFPCreateBookmarkableStringFromDocumentURL(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t (*v5)();
  uint64_t v7;

  v4 = FileProviderLibrary();
  v5 = (uint64_t (*)())dlsym(v4, "FPCreateBookmarkableStringFromDocumentURL");
  softLinkFPCreateBookmarkableStringFromDocumentURL[0] = v5;
  if (v5)
    return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
  dlerror();
  v7 = abort_report_np();
  return initFPCreateDocumentURLFromBookmarkableString(v7);
}

void initFPCreateDocumentURLFromBookmarkableString(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t (*v5)();
  void *v6;
  SEL v7;
  id v8;

  v4 = FileProviderLibrary();
  v5 = (uint64_t (*)())dlsym(v4, "FPCreateDocumentURLFromBookmarkableString");
  softLinkFPCreateDocumentURLFromBookmarkableString[0] = v5;
  if (v5)
  {
    ((void (*)(uint64_t, uint64_t))v5)(a1, a2);
  }
  else
  {
    dlerror();
    v6 = (void *)abort_report_np();
    +[PBServerConnection simulateCrashReportForAuthorizationWithAuthenticationMessage:](v6, v7, v8);
  }
}

void sub_18C548B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18C548F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18C549250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18C549688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void ___loggingErrorHandler_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_18C53A000, v4, OS_LOG_TYPE_ERROR, "%s failed with error: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

double _PBDefaultMaxGeneralPasteboardAgeForLockState(int a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  _defaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("GeneralPasteboardAge"));
  v4 = v3;

  if (a1)
  {
    _defaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleForKey:", CFSTR("GeneralLockedPasteboardAge"));
    v7 = v6;

    if (v4 >= v7)
      return v7;
  }
  return v4;
}

id _defaults()
{
  if (qword_1ECED8BA8 != -1)
    dispatch_once(&qword_1ECED8BA8, &__block_literal_global_1);
  return (id)_MergedGlobals_1;
}

void ___defaults_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Pasteboard"));
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

  v2 = (void *)_MergedGlobals_1;
  v8 = CFSTR("GeneralPasteboardAge");
  v9[0] = &unk_1E2437D98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

  v4 = (void *)_MergedGlobals_1;
  v6 = CFSTR("GeneralLockedPasteboardAge");
  v7 = &unk_1E2437DA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDefaults:", v5);

}

void sub_18C549DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C549FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54A17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54A398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54A910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54ADF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C54B8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54D0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54D1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54D400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54D6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54D7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54DC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18C54E990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18C54ED8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54F99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C54FD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C550108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C5502B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D782EA4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

id _cleanupQueue()
{
  if (qword_1ECED8BC8 != -1)
    dispatch_once(&qword_1ECED8BC8, &__block_literal_global_78);
  return (id)_MergedGlobals_3;
}

void ___cleanupQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.Pasteboard.cleanupQueue", 0);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

void PBAssertIsOnCallbackQueue()
{
  NSObject *v0;

  callbackQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v0);

}

id PBBestMatchConformingToType(void *a1, void *a2)
{
  return _bestMatchType(a1, a2, &__block_literal_global_6);
}

id PBBestMatchToConformingType(void *a1, void *a2)
{
  return _bestMatchType(a1, a2, &__block_literal_global_10);
}

id PBBestMatchConformingToTypes(void *a1, void *a2)
{
  return _bestMatchTypes(a1, a2, &__block_literal_global_11);
}

id _bestMatchTypes(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(id, _QWORD, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v5;
  v34 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v34)
  {
    v9 = *(_QWORD *)v49;
    v32 = *(_QWORD *)v49;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v8);
        v11 = v8;
        v12 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v10);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v13 = v6;
        v14 = v6;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              if ((objc_msgSend(v19, "isEqualToString:", v12) & 1) != 0)
              {
                v6 = v13;
                v8 = v11;
LABEL_33:
                v29 = v19;

                goto LABEL_34;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            if (v16)
              continue;
            break;
          }
        }

        ++v10;
        v6 = v13;
        v8 = v11;
        v9 = v32;
      }
      while (v10 != v34);
      v34 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v34);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = v8;
  v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v35)
  {
    v21 = *(_QWORD *)v41;
    v31 = *(_QWORD *)v41;
    v33 = v20;
    while (2)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v20);
        v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v24 = v6;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v37;
LABEL_23:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v37 != v27)
              objc_enumerationMutation(v24);
            v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v28);
            if ((v7[2](v7, v23, v19) & 1) != 0)
              goto LABEL_33;
            if (v26 == ++v28)
            {
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
              if (v26)
                goto LABEL_23;
              break;
            }
          }
        }

        v20 = v33;
        v21 = v31;
      }
      v29 = 0;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      if (v35)
        continue;
      break;
    }
  }
  else
  {
    v29 = 0;
  }
LABEL_34:

  return v29;
}

id PBBestMatchToConformingTypes(void *a1, void *a2)
{
  return _bestMatchTypes(a1, a2, &__block_literal_global_12);
}

id PBURLFromURLArchive(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v11;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
LABEL_10:

      goto LABEL_8;
    }
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", &stru_1E24329D8);

      v8 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v8, "URLWithString:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLWithString:relativeToURL:", v3, v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

id _readPasteboardPreference(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = qword_1ECED8C18;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_1ECED8C18, &__block_literal_global_26);
  objc_msgSend((id)qword_1ECED8C10, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___readPasteboardPreference_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Pasteboard"));
  v1 = (void *)qword_1ECED8C10;
  qword_1ECED8C10 = v0;

}

void ___readPasteboardPreferenceCached_block_invoke_28(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _readPasteboardPreference(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _PBLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_18C53A000, v3, OS_LOG_TYPE_INFO, "Pasteboard preference changed: %@, new value: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v2)
  {
    _preferencesCacheQueue_KeyToValueMap();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _preferencesCacheQueue_KeyToValueMap();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

  }
}

double PBPreferencesDoubleValue(void *a1, double a2)
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PBPreferencesDoubleValue_block_invoke;
  v4[3] = &unk_1E2431AD8;
  v4[4] = &v5;
  *(double *)&v4[5] = a2;
  _readPasteboardPreferenceCached(a1, v4);
  v2 = (double)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id PBOldPasteboardStorageRootURL()
{
  if (qword_1ECED8C38 != -1)
    dispatch_once(&qword_1ECED8C38, &__block_literal_global_39);
  return (id)qword_1ECED8C30;
}

id PBSchemaFileContentsWithVersion(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("schemaVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _PBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_18C53A000, v5, OS_LOG_TYPE_FAULT, "Could not create new schema file. Error: %@", buf, 0xCu);
    }

  }
  return v3;
}

id PBCoordinatedRead(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35F8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "readingIntentWithURL:options:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _coordinatedFileAccess(v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id _coordinatedFileAccess(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _coordinationQueue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___coordinatedFileAccess_block_invoke;
  v17[3] = &unk_1E2431BD8;
  v18 = v6;
  v19 = v5;
  v10 = v8;
  v20 = v10;
  v21 = v7;
  v11 = v7;
  v12 = v5;
  v13 = v6;
  objc_msgSend(v9, "addOperationWithBlock:", v17);

  v14 = v21;
  v15 = v10;

  return v15;
}

id PBCoordinatedReadForUploading(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35F8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "readingIntentWithURL:options:", v5, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _coordinatedFileAccess(v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t PBIsBundleIDAllowedToPromiseFileProviderFolders(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple."));
}

id PBCloneFileToTemporaryDir(void *a1, _QWORD *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[12];
  int to_fd;

  if ((objc_msgSend(a1, "fileDescriptor") & 0x80000000) != 0)
  {
    PBCannotCopyFileError(0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a2)
      goto LABEL_12;
    goto LABEL_10;
  }
  to_fd = -1;
  CPTemporaryFileWithUniqueName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = 0;
  }
  else
  {
    _PBLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, "Cannot cerate temporary file.", buf, 2u);
    }

    PBCannotCopyFileError(0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a2)
  {
LABEL_10:
    if (v5)
      *a2 = objc_retainAutorelease(v5);
  }
LABEL_12:

  return 0;
}

id PBCloneToTemporaryDir(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  int *v13;
  void *v14;
  id v15;
  id v17;

  v5 = a1;
  v17 = 0;
  PBTemporaryFileName(a2, &v17);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)v17;
  v8 = (id)v7;
  if (!v6 || v7)
  {
    if (!(v6 | v7))
    {
      PBCannotCopyFileError(v5, 0, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v5, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
    objc_msgSend((id)v6, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v10) = copyfile(v10, (const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0, 0x10C800Fu);

    if (!(_DWORD)v10)
    {
      v15 = (id)v6;
      v8 = 0;
      goto LABEL_11;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = __error();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s"), strerror(*v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBCannotCopyFileError(v5, v14, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  if (a3 && v8)
  {
    v8 = objc_retainAutorelease(v8);
    v15 = 0;
    *a3 = v8;
  }
LABEL_11:

  return v15;
}

id PBTemporaryFileName(void *a1, _QWORD *a2)
{
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int *v17;
  void *v18;
  char v20[1025];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (__CFString *)v3;
  if (!v3 || (v5 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E0CA5A88])) == 0)
    v5 = CFSTR("tmp");
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@.XXXXXX"), CFSTR("com.apple.Pasteboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "UTF8String");
  __strlcpy_chk();
  v10 = mktemp(v20);
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v5)
    {
      objc_msgSend(v12, "stringByAppendingPathExtension:", v5);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v13, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }
  else
  {
    v17 = __error();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s"), strerror(*v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBCannotCreateTemporaryFile((uint64_t)v18, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (a2 && v16)
    {
      v16 = objc_retainAutorelease(v16);
      v15 = 0;
      *a2 = v16;
    }
  }

  return v15;
}

id PBFilenameWithProperExtension(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  CFStringRef v5;
  CFStringRef v6;
  void *SuggestedFilename;

  v3 = a2;
  v4 = (__CFString *)objc_msgSend(a1, "copy");
  if (!-[__CFString length](v4, "length"))
  {
    v5 = UTTypeCopyDescription(v3);

    v4 = (__CFString *)v5;
  }
  if (!-[__CFString length](v4, "length"))
  {
    v6 = UTTypeCopyDescription((CFStringRef)*MEMORY[0x1E0CA5BA0]);

    v4 = (__CFString *)v6;
  }
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();

  return SuggestedFilename;
}

id PBCloneURLToTemporaryFolder(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD *v35;
  void *v36;
  char v37[1025];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v11 = a4;
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@.XXXXXX"), a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "getFileSystemRepresentation:maxLength:", v37, 1024);
  if (mkdtemp(v37))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  v35 = a6;
  if (objc_msgSend(v11, "length"))
  {
    v18 = v11;
  }
  else
  {
    objc_msgSend(v10, "lastPathComponent");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v20 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v20, "setSuggestedName:", v19);
  objc_msgSend(v20, "_sanitizedSuggestedName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  PBFilenameWithProperExtension(v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "URLByAppendingPathComponent:", v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v36 = v10;
  objc_msgSend(v10, "path");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (const char *)objc_msgSend(v24, "fileSystemRepresentation");
  objc_msgSend(v23, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_retainAutorelease(v26);
  v28 = copyfile(v25, (const char *)objc_msgSend(v27, "fileSystemRepresentation"), 0, 0x10C800Fu);

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeItemAtURL:error:", v17, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), strerror(v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBCannotCreateTemporaryFile((uint64_t)v30, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    if (v35 && v31)
    {
      v31 = objc_retainAutorelease(v31);
      v32 = 0;
      *v35 = v31;
    }
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    v32 = v23;
    v31 = 0;
  }

  return v32;
}

BOOL PBPreferredRepresentationFromNS(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

void __callbackQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.Pasteboard.callback-queue", 0);
  v1 = (void *)qword_1ECED8C40;
  qword_1ECED8C40 = (uint64_t)v0;

}

void ___preferencesCacheQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.pasteboard.preferencesCacheQueue", 0);
  v1 = (void *)qword_1ECED8C50;
  qword_1ECED8C50 = (uint64_t)v0;

}

void ___coordinatedFileAccess_block_invoke(id *a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "startAccessingSecurityScopedResource");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  v12[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _coordinationQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___coordinatedFileAccess_block_invoke_2;
  v6[3] = &unk_1E2431BB0;
  v7 = a1[6];
  v10 = a1[7];
  v8 = a1[5];
  v11 = v2;
  v9 = a1[4];
  objc_msgSend(v3, "coordinateAccessWithIntents:queue:byAccessor:", v4, v5, v6);

}

void ___coordinatedFileAccess_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v4);

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 48), "stopAccessingSecurityScopedResource");
}

id _coordinationQueue()
{
  if (qword_1ECED8C78 != -1)
    dispatch_once(&qword_1ECED8C78, &__block_literal_global_69);
  return (id)qword_1ECED8C70;
}

void ___coordinationQueue_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ECED8C70;
  qword_1ECED8C70 = (uint64_t)v0;

}

id PBTypeNotFoundError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("The item cannot be represented as type %@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(0, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotInstantiateObjectOfClassError(objc_class *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  NSStringFromClass(a1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Cannot instantiate object of class %@ from representation of type %@"), v8, v5);
  else
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Cannot instantiate object of class %@"), v8, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(1, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id PBCannotLoadRepresentationError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Cannot load representation of type %@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(0, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotCreateRepresentationError(void *a1, objc_class *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a1;
  NSStringFromClass(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot represent object of class %@ as representation of type %@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PBErrorMake(2, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id PBCannotCoerceObjectOfClassToObjectOfClassError(objc_class *a1, objc_class *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  NSStringFromClass(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot coerce object of class %@ to object of class %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(3, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot coerce representation of type %@ to representation of type %@"), a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(21, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PBIndexOutOfRangeError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Item index %d is out of range."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(4, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotUnarchiveItemCollectionError(void *a1)
{
  return PBErrorMake(5, CFSTR("Cannot unarchive item collection."), a1);
}

id PBCannotCopyFileError(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot copy file at URL %@. Error: %@"), v5, v6);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot copy file. Error: %@"), v6, v11);
  }
  else
  {
    if (!v5)
    {
      PBErrorMake(6, CFSTR("Cannot copy file."), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot copy file at URL %@."), v5, v11);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

id PBCannotConnectToServerError(void *a1)
{
  return PBErrorMake(7, CFSTR("Cannot connect to pasteboard server."), a1);
}

id PBCannotUnserializePasteboardNameError(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot unserialize pasteboard “%@” at URL %@"), a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(8, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PBCannotSerializePasteboardError(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  if (a1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a3;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot serialize pasteboard “%@” at URL %@"), a1, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    PBErrorMake(9, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a3;
    PBErrorMake(9, CFSTR("Cannot serialize a pasteboard with no name."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id PBPasteboardNotAvailableError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Pasteboard UUID %@ is no longer available."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(10, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBPasteboardNameNotAvailableError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Pasteboard %@ is not available at this time."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(10, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBPasteboardNameInvalidError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("The pasteboard name %@ is not valid."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(11, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotLoadRemotePasteboardError(void *a1)
{
  return PBErrorMake(12, CFSTR("Cannot load remote pasteboard contents."), a1);
}

id PBNotAuthorizedError(void *a1)
{
  return PBErrorMake(13, CFSTR("Operation not authorized."), a1);
}

id PBDataTransferCancelledError(void *a1)
{
  return PBErrorMake(14, CFSTR("Data transfer has been cancelled."), a1);
}

id PBNoLoaderAvailableError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("No loader block available for type %@."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(15, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotOpenInPlaceError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Cannot open in place file at URL %@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(16, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotCreateTemporaryFile(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a2;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Cannot create a temporary file. Error: %@"), a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    PBErrorMake(17, v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a2;
    PBErrorMake(17, CFSTR("Cannot create a temporary file."), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id PBNotFileURLError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("The URL %@ does not point to a file."), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(18, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBCannotDeleteURLError(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Cannot delete file at URL %@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBErrorMake(19, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PBPasteNotAllowedError(void *a1)
{
  return PBErrorMake(20, CFSTR("Paste not allowed."), a1);
}

void sub_18C554410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C554DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C555214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C556A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C558244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C558370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C5585C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C558808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C558ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C558FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D782EA4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{

}

void sub_18C559FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C55B888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C55C138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C55C6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id _transferQueue()
{
  if (qword_1ECED8CA8 != -1)
    dispatch_once(&qword_1ECED8CA8, &__block_literal_global_9);
  return (id)_MergedGlobals_8;
}

void ___transferQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.Pasteboard.transferQueue", 0);
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;

}

id PBNewDataProviderXPCInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE03FA30);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_loadRepresentationForItemAtIndex_type_completionBlock_, 1, 1);

  return v0;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA8](gray, alpha);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1E0C9BD10](colorName);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CPTemporaryFileWithUniqueName()
{
  return MEMORY[0x1E0CFA910]();
}

uint64_t FPURLMightBeInFileProvider()
{
  return MEMORY[0x1E0CAAAF0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t UISColorLuminance()
{
  return MEMORY[0x1E0DC5CA8]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
}

uint64_t _UTTypeCreateSuggestedFilename()
{
  return MEMORY[0x1E0CA5A50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
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

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

