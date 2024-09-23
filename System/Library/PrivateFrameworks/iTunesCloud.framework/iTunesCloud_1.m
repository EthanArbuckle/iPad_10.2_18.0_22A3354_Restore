os_log_t _ICLogCategoryDefault_Oversize()
{
  return os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
}

os_log_t _ICLogCategoryAgeVerification()
{
  return os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
}

os_log_t _ICLogCategorySubscription()
{
  return os_log_create("com.apple.amp.iTunesCloud", "Subscription");
}

os_log_t _ICLogCategoryQuickRelay()
{
  return os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
}

void ICSiriPostDynamiteClientStateChangedNotification()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siri.client.state.DynamiteClientState%s"), ".siri_data_changed");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v0, "UTF8String"));

}

void ICSiriGetSharedUserIDs(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEBUG, "[ICUserIdentityStore] - Returning zero SiriSharedUserIDs [unsupported platform]", v5, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, MEMORY[0x1E0C9AA60], 0);
}

_DWORD *_MSV_XXH_XXH32_update_15624(_DWORD *result, char *__src, size_t __n)
{
  int v3;
  char *v4;
  _DWORD *v5;
  int v6;
  unsigned int v7;
  _BOOL4 v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;

  if (__src)
  {
    v3 = __n;
    v4 = __src;
    v5 = result;
    v6 = result[1];
    v7 = *result + __n;
    v9 = __n > 0xF || v7 > 0xF;
    *result = v7;
    result[1] = v6 | v9;
    v10 = result[10];
    if (v10 + __n <= 0xF)
    {
      result = memcpy((char *)result + v10 + 24, __src, __n);
      LODWORD(v11) = v5[10] + v3;
LABEL_18:
      v5[10] = v11;
      return result;
    }
    v12 = &__src[__n];
    if ((_DWORD)v10)
    {
      result = memcpy((char *)result + v10 + 24, __src, (16 - v10));
      HIDWORD(v13) = v5[2] - 2048144777 * v5[6];
      LODWORD(v13) = HIDWORD(v13);
      v14 = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[3] - 2048144777 * v5[7];
      LODWORD(v13) = HIDWORD(v13);
      v5[2] = v14;
      v5[3] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[4] - 2048144777 * v5[8];
      LODWORD(v13) = HIDWORD(v13);
      v5[4] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[5] - 2048144777 * v5[9];
      LODWORD(v13) = HIDWORD(v13);
      v5[5] = -1640531535 * (v13 >> 19);
      v4 += (16 - v5[10]);
      v5[10] = 0;
    }
    if (v4 <= v12 - 16)
    {
      v15 = v5[2];
      v16 = v5[3];
      v17 = v5[4];
      v18 = v5[5];
      do
      {
        HIDWORD(v19) = v15 - 2048144777 * *(_DWORD *)v4;
        LODWORD(v19) = HIDWORD(v19);
        v15 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v16 - 2048144777 * *((_DWORD *)v4 + 1);
        LODWORD(v19) = HIDWORD(v19);
        v16 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v17 - 2048144777 * *((_DWORD *)v4 + 2);
        LODWORD(v19) = HIDWORD(v19);
        v17 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v18 - 2048144777 * *((_DWORD *)v4 + 3);
        LODWORD(v19) = HIDWORD(v19);
        v18 = -1640531535 * (v19 >> 19);
        v4 += 16;
      }
      while (v4 <= v12 - 16);
      v5[2] = v15;
      v5[3] = v16;
      v5[4] = v17;
      v5[5] = v18;
    }
    if (v4 < v12)
    {
      v11 = v12 - v4;
      result = memcpy(v5 + 6, v4, v11);
      goto LABEL_18;
    }
  }
  return result;
}

void sub_1A0609410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPRequestHandlerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AskPermissionLibraryCore_frameworkLibrary)
    AskPermissionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AskPermissionLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AskPermissionLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICStoreDialogResponseHandler.m"), 28, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("APRequestHandler");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAPRequestHandlerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ICStoreDialogResponseHandler.m"), 29, CFSTR("Unable to find class %s"), "APRequestHandler");

LABEL_8:
    __break(1u);
  }
  getAPRequestHandlerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ICFairPlayGetContextIdentifier(_DWORD *a1, _QWORD *a2)
{
  return ICFairPlayGetContextIdentifierForFolderPath(0, a1, a2);
}

uint64_t ICFairPlayGetContextIdentifierForFolderPath(void *a1, _DWORD *a2, _QWORD *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMapTable *v15;
  uint64_t v16;
  void *v17;
  _DWORD value[3];
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if (!objc_msgSend(v5, "length"))
  {
    if (ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPathOnceToken != -1)
      dispatch_once(&ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPathOnceToken, &__block_literal_global_2_15862);
    v6 = (id)ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath;

  }
  pthread_mutex_lock(&ICFairPlayGetContextIdentifierForFolderPath_sMutex);
  if (!ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID)
  {
LABEL_8:
    value[0] = 0;
    goto LABEL_9;
  }
  value[0] = NSMapGet((NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID, v6);
  if (value[0])
  {
    df35957c4e0();
    if (!v7)
      goto LABEL_17;
    goto LABEL_8;
  }
LABEL_9:
  memset(v21, 0, 24);
  if (!ICFairPlayGetHardwareInfo((uint64_t)v21))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7500, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v8 = objc_retainAutorelease(v6);
  v9 = XtCqEf5X(0, (uint64_t)v21, objc_msgSend(v8, "UTF8String"), (uint64_t)value);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)&value[1] = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &value[1], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7501, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v14 = 0;
    goto LABEL_18;
  }
  v15 = (NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
  if (!ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 1);
    v17 = (void *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
    ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID = v16;

    v15 = (NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
  }
  NSMapInsert(v15, v8, (const void *)value[0]);
LABEL_17:
  v13 = 0;
  v14 = 1;
LABEL_18:
  pthread_mutex_unlock(&ICFairPlayGetContextIdentifierForFolderPath_sMutex);
  if (a2)
    *a2 = value[0];
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v14;
}

BOOL ICFairPlayCopyKeyBagSyncData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int ContextIdentifierForFolderPath;
  id v9;
  _BOOL8 v10;
  id v11;
  id v13;
  id v14;
  unsigned int v15;

  v15 = 0;
  v14 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v15, &v14);
  v9 = v14;
  if (ContextIdentifierForFolderPath)
  {
    v13 = v9;
    v10 = ICFairPlayCopyKeyBagSyncDataWithContextID(v15, a1, a2, a3, &v13);
    v11 = v13;

    v9 = v11;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v9);
LABEL_6:

  return v10;
}

BOOL ICFairPlayCopyKeyBagSyncDataWithContextID(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v12;
  uint64_t v13;

  v13 = 0;
  v12 = 0;
  Mt76Vq80ux(a1, a2, 0, a3, (uint64_t)&v13, (uint64_t)&v12);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v13, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return v8 == 0;
}

BOOL ICFairPlayImportKeybagData(void *a1, _QWORD *a2)
{
  id v3;
  int ContextIdentifierForFolderPath;
  id v5;
  _BOOL8 v6;
  id v7;
  id v9;
  id v10;
  unsigned int v11;

  v3 = a1;
  v11 = 0;
  v10 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v11, &v10);
  v5 = v10;
  if (ContextIdentifierForFolderPath)
  {
    v9 = v5;
    v6 = ICFairPlayImportKeybagDataWithContextID(v11, v3, &v9);
    v7 = v9;

    v5 = v7;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if (a2)
LABEL_5:
    *a2 = objc_retainAutorelease(v5);
LABEL_6:

  return v6;
}

BOOL ICFairPlayImportKeybagDataWithContextID(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id v6;
  int v7;
  _BOOL8 v8;
  void *v9;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    ha0dkchaters6();
    v8 = v7 == 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_7;
    }
    else
    {
      v9 = 0;
      if (!a3)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = 0;
  v8 = 1;
  if (a3)
LABEL_6:
    *a3 = objc_retainAutorelease(v9);
LABEL_7:

  return v8;
}

uint64_t _ICLLQueryMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t result;
  _ICLLQueueQuery *v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 0u:
        v17 = 0;
        do
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_40;
          }
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0)
            break;
        }
        while (v17++ <= 8);
        goto LABEL_40;
      case 1u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        v24 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_39;
      case 2u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        v24 = objc_alloc_init(_ICLLPlaybackSyncStateQuery);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackSyncStateQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_39;
      case 3u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        v24 = objc_alloc_init(_ICLLPlaybackControlSettingsQuery);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (_ICLLPlaybackControlSettingsQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 4u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 4;
        v24 = objc_alloc_init(_ICLLParticipantQuery);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (PBReaderPlaceMark() && (_ICLLParticipantQueryReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_40:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_40;
    }
  }
}

void sub_1A060DBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *SetupAssistantLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("ICDeviceSetupStatusMonitor.m"), 22, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

uint64_t _ICLLParticipantChangeActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  _ICLLParticipantQuery *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = objc_alloc_init(_ICLLParticipantQuery);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (_ICLLParticipantQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0)
            goto LABEL_45;
          v25 += 7;
          v14 = v26++ >= 9;
          if (v14)
          {
            v27 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_47:
        *(_QWORD *)(a1 + 8) = v27;
      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_41;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ICIAMApplicationMessageSyncResponseReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  ICIAMApplicationMessageSyncCommand *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (ICIAMApplicationMessageSyncCommand *)a1[1];
        a1[1] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(ICIAMApplicationMessageSyncCommand);
    objc_msgSend(a1, "addSyncCommands:", v18);
    if (!PBReaderPlaceMark() || (ICIAMApplicationMessageSyncCommandReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ICPAPlayModeDictionaryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
            goto LABEL_48;
          }
          v26 += 7;
          v24 = v27++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
LABEL_47:
        *(_BYTE *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
            goto LABEL_47;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_51:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v31 = 0;
    v32 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 20) |= 4u;
    while (1)
    {
      v33 = *v3;
      v34 = *(_QWORD *)(a2 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
      {
        v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
        goto LABEL_47;
      }
      v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
      *(_QWORD *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0)
        break;
      v31 += 7;
      v24 = v32++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
        goto LABEL_50;
      }
    }
    v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
LABEL_48:
    if (*(_BYTE *)(a2 + *v5))
      LODWORD(v20) = 0;
LABEL_50:
    *(_DWORD *)(a1 + *v25) = v20;
    goto LABEL_51;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A0612FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16750(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16751(uint64_t a1)
{

}

uint64_t _ICLLCurrentItemChangeCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A0615238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17061(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17062(uint64_t a1)
{

}

void sub_1A0615A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17243(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17244(uint64_t a1)
{

}

uint64_t _ICLLParticipantQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _ICLLParticipant *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_ICLLParticipant);
        -[_ICLLParticipantQuery addParticipant:](a1, v17);
        if (!PBReaderPlaceMark() || (_ICLLParticipantReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _ICLLQueueQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  _ICLLQueue *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(_ICLLQueue);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && (_ICLLQueueReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_34;
        goto LABEL_41;
      case 2u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 32) = v23;
        goto LABEL_39;
      case 4u:
        v17 = objc_alloc_init(_ICLLPlaybackControlSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (PBReaderPlaceMark() && (_ICLLPlaybackControlSettingsReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t ICIAMMessageActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  ICIAMParameter *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
LABEL_24:
        v20 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_53;
      case 4u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 60) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_48:
        *(_BYTE *)(a1 + 56) = v23 != 0;
        goto LABEL_53;
      case 5u:
        v27 = objc_alloc_init(ICIAMParameter);
        objc_msgSend((id)a1, "addActionParameters:", v27);
        if (!PBReaderPlaceMark() || !ICIAMParameterReadFrom((uint64_t)v27, a2))
          goto LABEL_55;
        goto LABEL_37;
      case 6u:
        v27 = objc_alloc_init(ICIAMMetricEvent);
        objc_storeStrong((id *)(a1 + 16), v27);
        if (PBReaderPlaceMark() && (ICIAMMetricEventReadFrom((uint64_t)v27, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_53:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_55:

        return 0;
      case 7u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 60) |= 1u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                LODWORD(v30) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v30) = 0;
LABEL_52:
        *(_DWORD *)(a1 + 40) = v30;
        goto LABEL_53;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_53;
    }
  }
}

void sub_1A061DB20(_Unwind_Exception *a1)
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
  objc_destroyWeak((id *)(v5 - 120));
  objc_destroyWeak((id *)(v5 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18151(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AFA8D0](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__18152(uint64_t a1)
{

}

void sub_1A0624794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18947(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18948(uint64_t a1)
{

}

BOOL ICIAMMessageContentReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  ICIAMImage *v19;
  uint64_t v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 80;
        goto LABEL_32;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 72;
        goto LABEL_32;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_32;
      case 4u:
        v19 = objc_alloc_init(ICIAMImage);
        objc_msgSend(a1, "addImages:", v19);
        if (!PBReaderPlaceMark() || (ICIAMImageReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_40;
      case 5u:
        v19 = objc_alloc_init(ICIAMMessageAction);
        objc_msgSend(a1, "addMessageActions:", v19);
        if (!PBReaderPlaceMark() || (ICIAMMessageActionReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_40;
      case 6u:
        v19 = objc_alloc_init(ICIAMParameter);
        objc_msgSend(a1, "addContentParameters:", v19);
        if (!PBReaderPlaceMark() || !ICIAMParameterReadFrom((uint64_t)v19, a2))
          goto LABEL_45;
        goto LABEL_40;
      case 7u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
LABEL_32:
        v19 = *(ICIAMImage **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;
        goto LABEL_41;
      case 0xEu:
        v19 = objc_alloc_init(ICIAMMetricEvent);
        v20 = 64;
        goto LABEL_38;
      case 0xFu:
        v19 = objc_alloc_init(ICIAMMetricEvent);
        v20 = 24;
        goto LABEL_38;
      case 0x10u:
        v19 = objc_alloc_init(ICIAMMetricEvent);
        v20 = 16;
LABEL_38:
        objc_storeStrong((id *)&a1[v20], v19);
        if (PBReaderPlaceMark() && (ICIAMMetricEventReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_40:
          PBReaderRecallMark();
LABEL_41:

LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_45:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_42;
    }
  }
}

__CFString *NSStringFromICFavoriteMediaEntityType(unint64_t a1)
{
  if (a1 < 4)
    return off_1E438CED8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A062A82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19668(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19669(uint64_t a1)
{

}

void sub_1A062C150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getML3MusicLibraryClass_19702()
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
  v0 = (void *)getML3MusicLibraryClass_softClass_19703;
  v7 = getML3MusicLibraryClass_softClass_19703;
  if (!getML3MusicLibraryClass_softClass_19703)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getML3MusicLibraryClass_block_invoke_19704;
    v3[3] = &unk_1E4391138;
    v3[4] = &v4;
    __getML3MusicLibraryClass_block_invoke_19704((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A062D08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getML3MusicLibraryClass_block_invoke_19704(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MusicLibraryLibraryCore_frameworkLibrary_19705)
    MusicLibraryLibraryCore_frameworkLibrary_19705 = _sl_dlopen();
  if (!MusicLibraryLibraryCore_frameworkLibrary_19705)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MusicLibraryLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("ML3MusicLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getML3MusicLibraryClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ICPlaybackPositionClient.m"), 19, CFSTR("Unable to find class %s"), "ML3MusicLibrary");

LABEL_8:
    __break(1u);
  }
  getML3MusicLibraryClass_softClass_19703 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A062D9FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1A062DB90(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t ICIAMMessageRuleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  ICIAMMessageRule *v31;
  void *v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_44;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 60) |= 2u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_48:
        v33 = 56;
        goto LABEL_53;
      case 3u:
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 60) |= 1u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_52:
        v33 = 24;
LABEL_53:
        *(_DWORD *)(a1 + v33) = v22;
        goto LABEL_54;
      case 4u:
        v31 = objc_alloc_init(ICIAMMessageRule);
        objc_msgSend((id)a1, "addSubrules:", v31);
        if (!PBReaderPlaceMark() || (ICIAMMessageRuleReadFrom(v31, a2) & 1) == 0)
          goto LABEL_56;
        goto LABEL_41;
      case 5u:
        v31 = objc_alloc_init(ICIAMTriggerCondition);
        objc_storeStrong((id *)(a1 + 40), v31);
        if (PBReaderPlaceMark() && (ICIAMTriggerConditionReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
LABEL_41:
          PBReaderRecallMark();

LABEL_54:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_56:

        return 0;
      case 6u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_44;
      case 7u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_44:
        v32 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_54;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_54;
    }
  }
}

uint64_t __Block_byref_object_copy__20210(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20211(uint64_t a1)
{

}

void sub_1A0630E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20315(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20316(uint64_t a1)
{

}

uint64_t ICPAPlayActivityEnqueuerPropertiesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  void *v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  BOOL v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_47;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_47;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_47;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_47;
        case 5u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 68) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_58:
          *(_DWORD *)(a1 + 48) = v22;
          continue;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 68) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_62:
          v45 = v28 != 0;
          v46 = 65;
          goto LABEL_71;
        case 7u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_66:
          *(_QWORD *)(a1 + 8) = v34;
          continue;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_47:
          v38 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 9u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)(a1 + 68) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          break;
        v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
        *(_QWORD *)(a2 + v42) = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0)
          goto LABEL_68;
        v39 += 7;
        v14 = v40++ >= 9;
        if (v14)
        {
          v41 = 0;
          goto LABEL_70;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
      if (*(_BYTE *)(a2 + *v5))
        v41 = 0;
LABEL_70:
      v45 = v41 != 0;
      v46 = 64;
LABEL_71:
      *(_BYTE *)(a1 + v46) = v45;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ICPBDGSStartDelegationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  ICPBDGSPlayerInfoContextToken *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_27;
      case 2u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_27;
      case 3u:
        v19 = objc_alloc_init(ICPBDGSPlayerInfoContextToken);
        -[ICPBDGSStartDelegationResponse addPlayerInfoContextToken:](a1, v19);
        if (PBReaderPlaceMark() && (ICPBDGSPlayerInfoContextTokenReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_27:
        v19 = *(ICPBDGSPlayerInfoContextToken **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_29;
    }
  }
}

BOOL _ICLLMediaInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *ICCreateLoggableValueForDSIDString(void *a1)
{
  id v1;
  void *v2;
  char v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t *v7;
  ldiv_t v8;
  uint64_t v9;
  char *v10;
  const UInt8 *v11;
  unsigned __int8 *v12;
  char *v13;
  char *v14;
  uint64_t m;
  unsigned int v16;
  char *v17;
  id v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unsigned __int8 *v25;
  char *v26;
  char *v27;
  uint64_t j;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t quot;
  lldiv_t v34;
  uint64_t v35;
  CFStringRef v36;
  unsigned __int8 *v37;
  char *v38;
  char *v39;
  uint64_t k;
  unsigned int v41;
  char *v42;
  char *v43;
  uint64_t v44;
  _BYTE *v45;
  unint64_t v46;
  unsigned __int8 *v47;
  char *v48;
  char *v49;
  uint64_t i;
  unsigned int v51;
  char *v52;
  void *v54;
  void *v55;
  _BYTE v56[208];
  _BYTE v57[72];
  _OWORD v58[4];
  uint64_t v59;
  _QWORD v60[3];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isInternalBuild");

    v4 = (__CFString *)v1;
    if ((v3 & 1) == 0)
    {
      memset(v56, 0, sizeof(v56));
      CC_SHA1_Init((CC_SHA1_CTX *)v56);
      v5 = objc_retainAutorelease(v4);
      CC_SHA1_Update((CC_SHA1_CTX *)v56, (const void *)-[__CFString UTF8String](v5, "UTF8String"), -[__CFString length](v5, "length"));

      memset(&v57[8], 0, 64);
      *(_QWORD *)v57 = 4001;
      CC_SHA1_Final(&v57[8], (CC_SHA1_CTX *)v56);
      v58[0] = *(_OWORD *)v57;
      v58[1] = *(_OWORD *)&v57[16];
      v58[2] = *(_OWORD *)&v57[32];
      v58[3] = *(_OWORD *)&v57[48];
      v59 = *(_QWORD *)&v57[64];
      if (*(uint64_t *)v57 > 3999)
      {
        if (*(uint64_t *)v57 > 4255)
        {
          if (*(_QWORD *)v57 == 4256)
          {
            v47 = (unsigned __int8 *)v58 + 8;
            v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v49 = v48;
            for (i = 0; i != 64; i += 2)
            {
              v51 = *v47++;
              v52 = &v48[i];
              *v52 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v51 >> 4];
              v52[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v51 & 0xF];
            }
            v18 = objc_alloc(MEMORY[0x1E0CB3940]);
            v19 = v49;
            v20 = 64;
          }
          else
          {
            if (*(_QWORD *)v57 != 4512)
              goto LABEL_53;
            v25 = (unsigned __int8 *)v58 + 8;
            v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v27 = v26;
            for (j = 0; j != 128; j += 2)
            {
              v29 = *v25++;
              v30 = &v26[j];
              *v30 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v29 >> 4];
              v30[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v29 & 0xF];
            }
            v18 = objc_alloc(MEMORY[0x1E0CB3940]);
            v19 = v27;
            v20 = 128;
          }
        }
        else if (*(_QWORD *)v57 == 4000)
        {
          v37 = (unsigned __int8 *)v58 + 8;
          v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v39 = v38;
          for (k = 0; k != 32; k += 2)
          {
            v41 = *v37++;
            v42 = &v38[k];
            *v42 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v41 >> 4];
            v42[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v41 & 0xF];
          }
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          v19 = v39;
          v20 = 32;
        }
        else
        {
          if (*(_QWORD *)v57 != 4001)
            goto LABEL_53;
          v12 = (unsigned __int8 *)v58 + 8;
          v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v14 = v13;
          for (m = 0; m != 40; m += 2)
          {
            v16 = *v12++;
            v17 = &v13[m];
            *v17 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v16 >> 4];
            v17[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v16 & 0xF];
          }
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          v19 = v14;
          v20 = 40;
        }
      }
      else
      {
        if (*(uint64_t *)v57 <= 2999)
        {
          if (*(_QWORD *)v57 == 1000)
          {
            v31 = *((_QWORD *)&v58[0] + 1);
            v32 = (char *)&v61 + 1;
            quot = *((_QWORD *)&v58[0] + 1);
            do
            {
              v34 = lldiv(quot, 10);
              quot = v34.quot;
              if (v34.rem >= 0)
                LOBYTE(v35) = v34.rem;
              else
                v35 = -v34.rem;
              *(v32 - 2) = v35 + 48;
              v11 = (const UInt8 *)(v32 - 2);
              --v32;
            }
            while (v34.quot);
            if (v31 < 0)
            {
              *(v32 - 2) = 45;
              v11 = (const UInt8 *)(v32 - 2);
            }
            v10 = (char *)((char *)&v61 - (char *)v11);
            goto LABEL_39;
          }
          if (*(_QWORD *)v57 == 2000)
          {
            v6 = DWORD2(v58[0]);
            v7 = &v61;
            do
            {
              v8 = ldiv(v6, 10);
              v6 = v8.quot;
              if (v8.rem >= 0)
                LOBYTE(v9) = v8.rem;
              else
                v9 = -v8.rem;
              *((_BYTE *)v7 - 1) = v9 + 48;
              v7 = (uint64_t *)((char *)v7 - 1);
            }
            while (v8.quot);
            v10 = (char *)((char *)&v61 - (char *)v7);
            v11 = (const UInt8 *)v7;
LABEL_39:
            v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_50:
            v4 = (__CFString *)v36;
LABEL_51:

            goto LABEL_52;
          }
LABEL_53:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 4001, *(_QWORD *)v56);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

          v4 = &stru_1E4391778;
          goto LABEL_51;
        }
        if (*(_QWORD *)v57 == 3000)
        {
          LODWORD(v60[0]) = bswap32(DWORD2(v58[0]));
          v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
          v44 = 0;
          v45 = v43 + 1;
          do
          {
            v46 = *((unsigned __int8 *)v60 + v44);
            *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v46 >> 4];
            *v45 = MSVFastHexStringFromBytes_hexCharacters_37049[v46 & 0xF];
            v45 += 2;
            ++v44;
          }
          while (v44 != 4);
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          v19 = v43;
          v20 = 8;
        }
        else
        {
          if (*(_QWORD *)v57 != 3001)
            goto LABEL_53;
          v60[0] = bswap64(*((unint64_t *)&v58[0] + 1));
          v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
          v22 = 0;
          v23 = v21 + 1;
          do
          {
            v24 = *((unsigned __int8 *)v60 + v22);
            *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v24 >> 4];
            *v23 = MSVFastHexStringFromBytes_hexCharacters_37049[v24 & 0xF];
            v23 += 2;
            ++v22;
          }
          while (v22 != 8);
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          v19 = v21;
          v20 = 16;
        }
      }
      v36 = (CFStringRef)objc_msgSend(v18, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v20, 4, 1, 4001, *(_QWORD *)v56);
      goto LABEL_50;
    }
  }
  else
  {
    v4 = CFSTR("nil");
  }
LABEL_52:

  return v4;
}

uint64_t ICPBDGSResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  ICPBDGSFinishDelegationResponse *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 101)
      {
        v24 = objc_alloc_init(ICPBDGSFinishDelegationResponse);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || !ICPBDGSFinishDelegationResponseReadFrom(a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 != 100)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_37;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v24 = objc_alloc_init(ICPBDGSStartDelegationResponse);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || !ICPBDGSStartDelegationResponseReadFrom((uint64_t)v24, a2))
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A0641B4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A06427A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1A0642ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0643E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  uint64_t v63;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v63 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A0644284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A06445C4(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void sub_1A0644898(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void sub_1A0644C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A064549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1A06457B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
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
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22482(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22483(uint64_t a1)
{

}

void __destructor_8_s0_s8(id *a1)
{

}

void sub_1A06474F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A06483FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A064A1D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class __getAFMultiUserConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 47, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFMultiUserConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFMultiUserConnectionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ICLibraryAuthServiceClientTokenProvider.m"), 48, CFSTR("Unable to find class %s"), "AFMultiUserConnection");

LABEL_8:
    __break(1u);
  }
  getAFMultiUserConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A064B7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A064BE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22861(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22862(uint64_t a1)
{

}

Class __getPDCPreflightManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
    PrivacyDisclosureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PrivacyDisclosureCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPrivacyInfo.m"), 40, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PDCPreflightManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPDCPreflightManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("ICPrivacyInfo.m"), 41, CFSTR("Unable to find class %s"), "PDCPreflightManager");

LABEL_8:
    __break(1u);
  }
  getPDCPreflightManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A064CA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *OnBoardingKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)OnBoardingKitLibraryCore_frameworkLibrary;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *OnBoardingKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("ICPrivacyInfo.m"), 45, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getOBPrivacyFitnessPlusIdentifier()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr;
  v8 = getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr)
  {
    v1 = OnBoardingKitLibrary();
    v0 = (id *)dlsym(v1, "OBPrivacyFitnessPlusIdentifier");
    v6[3] = (uint64_t)v0;
    getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyFitnessPlusIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPrivacyInfo.m"), 51, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A064CC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getOBPrivacyImproveFitnessPlusIdentifier()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  v8 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr)
  {
    v1 = OnBoardingKitLibrary();
    v0 = (id *)dlsym(v1, "OBPrivacyImproveFitnessPlusIdentifier");
    v6[3] = (uint64_t)v0;
    getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyImproveFitnessPlusIdentifier(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPrivacyInfo.m"), 52, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A064CD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICPBDGSPlayerInfoContextTokenReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A064E71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A064F628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  id *v36;
  id *v37;
  id *v38;
  uint64_t v39;

  objc_destroyWeak(v38);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  objc_destroyWeak(v37);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1A064FEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A064FF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0650050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0650120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06501F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06502C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0650390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A065045C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23378(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23379(uint64_t a1)
{

}

uint64_t _ICLLPlaybackItemContainerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  BOOL v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
            break;
          v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v14 = v9++ >= 9;
          if (v14)
          {
            v10 = 0;
            v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v15)
          v16 = 1;
        else
          v16 = (v10 & 7) == 4;
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_BYTE *)(a1 + 44) |= 1u;
              break;
            case 2u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
              goto LABEL_32;
            case 3u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 8;
              goto LABEL_32;
            case 4u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_32;
            case 5u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 32;
LABEL_32:
              v26 = *(void **)(a1 + v25);
              *(_QWORD *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_37:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_34;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_36:
          *(_DWORD *)(a1 + 40) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__23697(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23698(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__23734(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23735(uint64_t a1)
{

}

uint64_t _ICLLAddQueueItemsActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  _ICLLPlaybackItem *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 44) |= 4u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_52;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_54;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_54:
        v35 = 40;
        goto LABEL_63;
      case 2u:
        v24 = 0;
        v25 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_58:
        v35 = 16;
        goto LABEL_63;
      case 3u:
        v29 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLAddQueueItemsAction addItems:](a1, v29);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v29, a2) & 1) == 0)
          goto LABEL_66;
        goto LABEL_50;
      case 4u:
        v30 = 0;
        v31 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_62:
        v35 = 20;
LABEL_63:
        *(_DWORD *)(a1 + v35) = v19;
        goto LABEL_64;
      case 5u:
        v29 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 24), v29);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v29, a2) & 1) == 0)
          goto LABEL_66;
        goto LABEL_50;
      case 6u:
        v29 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 32), v29);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v29, a2))
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_64:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_66:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_64;
    }
  }
}

void sub_1A0656B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0656CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24535(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24536(uint64_t a1)
{

}

void _UserNotificationCallback(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ICUserNotificationManager sharedManager](ICUserNotificationManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleCallbackForUserNotification:responseFlags:", a1, a2);

}

id ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("sbKeyBag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("subKeyBag"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_NSIsNSData())
  {
    v3 = v2;
LABEL_7:
    v4 = v3;
    goto LABEL_9;
  }
  if (_NSIsNSString())
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_9:
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

uint64_t ICSDelegationProviderServiceXPCGetInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5B0E18);
}

uint64_t ICCDelegationProviderServiceXPCGetInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDB48);
}

BOOL ICIAMLogEventResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_1A065C258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A065C31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A065C3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25385(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25386(uint64_t a1)
{

}

uint64_t _ICLLPlaybackSyncCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload](a1);
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 2;
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      else
      {
        if ((_DWORD)v17 != 1)
        {
          if ((_DWORD)v17)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          else
          {
            v18 = 0;
            while (1)
            {
              v19 = *v3;
              v20 = *(_QWORD *)(a2 + v19);
              if (v20 == -1 || v20 >= *(_QWORD *)(a2 + *v4))
                break;
              v21 = v20 + 1;
              v22 = *(char *)(*(_QWORD *)(a2 + *v7) + v20);
              *(_QWORD *)(a2 + v19) = v21;
              if (v22 < 0 && v18++ <= 8)
                continue;
              goto LABEL_34;
            }
            *(_BYTE *)(a2 + *v5) = 1;
          }
          continue;
        }
        -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload](a1);
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

LABEL_34:
      ;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A065EE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ICCloudServiceCapabilitiesGetDescription(__int16 a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("musicCatalogPlayback"));
    if ((a1 & 0x100) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("addToCloudMusicLibrary"));
  if ((a1 & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "addObject:", CFSTR("musicCatalogSubscriptionEligible"));
LABEL_5:
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("none"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL ICPBDGSFinishDelegationResponseReadFrom(uint64_t a1)
{
  int *v2;
  int *v3;
  int *v4;
  int *v5;
  int v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v14;

  v2 = (int *)MEMORY[0x1E0D82BF0];
  v3 = (int *)MEMORY[0x1E0D82BD8];
  v4 = (int *)MEMORY[0x1E0D82BC8];
  v5 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(_QWORD *)(a1 + *v2) >= *(_QWORD *)(a1 + *v3))
      return v6 == 0;
    if (*(_BYTE *)(a1 + *v4))
    {
      v6 = 1;
      return v6 == 0;
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = *v2;
      v11 = *(_QWORD *)(a1 + v10);
      if (v11 == -1 || v11 >= *(_QWORD *)(a1 + *v3))
        break;
      v12 = *(_BYTE *)(*(_QWORD *)(a1 + *v5) + v11);
      *(_QWORD *)(a1 + v10) = v11 + 1;
      v9 |= (unint64_t)(v12 & 0x7F) << v7;
      if ((v12 & 0x80) == 0)
        goto LABEL_12;
      v7 += 7;
      if (v8++ >= 9)
      {
        LOBYTE(v9) = 0;
        v6 = *(unsigned __int8 *)(a1 + *v4);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a1 + *v4) = 1;
LABEL_12:
    v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(_BYTE *)(a1 + *v4))
      LOBYTE(v9) = 0;
LABEL_14:
    if (v6)
      v14 = 1;
    else
      v14 = (v9 & 7) == 4;
    if (v14)
      return v6 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t ICPBDGSRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  ICPBDGSFinishDelegationRequest *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 101)
      {
        v24 = objc_alloc_init(ICPBDGSFinishDelegationRequest);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ICPBDGSFinishDelegationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 != 100)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_37;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_39:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v24 = objc_alloc_init(ICPBDGSStartDelegationRequest);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (ICPBDGSStartDelegationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _ICLLServerNoticeActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__26319(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26320(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__26630(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26631(uint64_t a1)
{

}

uint64_t _ICLLQueueReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  int *v30;
  int *v31;
  _ICLLPlaybackItem *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t result;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void *v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v6) == 0;
  v8 = &OBJC_IVAR___ICMusicUserState__lightweightSubscriptionStatus;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  v10 = &OBJC_IVAR___ICMusicUserState__lightweightSubscriptionStatus;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v6))
      return *(_BYTE *)(a2 + *v6) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v4;
      v15 = *(_QWORD *)(a2 + v14);
      if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v5))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
      *(_QWORD *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v17 = v12++ >= 9;
      if (v17)
      {
        v13 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v6);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v6);
    if (*(_BYTE *)(a2 + *v6))
      v13 = 0;
LABEL_14:
    v19 = v13 & 7;
    if (v18 || v19 == 4)
      return *(_BYTE *)(a2 + *v6) == 0;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 56;
        goto LABEL_53;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + v8[382]) |= 4u;
        while (2)
        {
          v26 = *v4;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              v17 = v24++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v25) = 0;
LABEL_64:
        v51 = 64;
        goto LABEL_73;
      case 3u:
        v29 = v2;
        v30 = v10;
        v31 = v8;
        v32 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLQueue addItems:](a1, v32);
        if (PBReaderPlaceMark() && (_ICLLPlaybackItemReadFrom((uint64_t)v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v8 = v31;
          v10 = v30;
          v2 = v29;
LABEL_74:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          continue;
        }

        return 0;
      case 4u:
        v33 = 0;
        v34 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + v8[382]) |= 2u;
        while (2)
        {
          v35 = *v4;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v25 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              v17 = v34++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v25) = 0;
LABEL_68:
        v51 = 44;
        goto LABEL_73;
      case 5u:
        if (v19 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v4) < *(_QWORD *)(a2 + *v5) && !*(_BYTE *)(a2 + *v6))
          {
            v39 = 0;
            v40 = 0;
            v41 = 0;
            while (1)
            {
              v42 = *v4;
              v43 = *(_QWORD *)(a2 + v42);
              if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v5))
                break;
              v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v43);
              *(_QWORD *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v17 = v40++ >= 9;
                if (!v17)
                  continue;
              }
              goto LABEL_49;
            }
            *(_BYTE *)(a2 + *v6) = 1;
LABEL_49:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v52 = 0;
          v53 = 0;
          v54 = 0;
          while (1)
          {
            v55 = *v4;
            v56 = *(_QWORD *)(a2 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v5))
              break;
            v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v56);
            *(_QWORD *)(a2 + v55) = v56 + 1;
            v54 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v52 += 7;
              v17 = v53++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_85;
          }
          *(_BYTE *)(a2 + *v6) = 1;
LABEL_85:
          PBRepeatedInt32Add();
        }
        goto LABEL_74;
      case 7u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
LABEL_53:
        v45 = *(void **)(a1 + v22);
        *(_QWORD *)(a1 + v22) = v21;

        goto LABEL_74;
      case 8u:
        v46 = 0;
        v47 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + v8[382]) |= 1u;
        while (2)
        {
          v48 = *v4;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 1;
            v25 |= (unint64_t)(v50 & 0x7F) << v46;
            if (v50 < 0)
            {
              v46 += 7;
              v17 = v47++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          LODWORD(v25) = 0;
LABEL_72:
        v51 = 40;
LABEL_73:
        *(_DWORD *)(a1 + v51) = v25;
        goto LABEL_74;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_74;
    }
  }
}

void sub_1A066C724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ICIAMParameterReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ICSQLiteGetRelatedFilePath(void *a1, uint64_t a2)
{
  void *v2;
  id v4;
  void *v5;
  const __CFString *v6;

  v4 = a1;
  v5 = v4;
  if (!a2)
  {
    v6 = CFSTR("-shm");
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    v6 = CFSTR("-wal");
LABEL_5:
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id ICSQLiteGetCurrentError(sqlite3 *a1)
{
  int v2;
  int v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = sqlite3_errcode(a1);
  if (v2)
  {
    v3 = v2;
    v4 = (char *)sqlite3_errmsg(a1);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
      v6 = objc_alloc(MEMORY[0x1E0C99D80]);
      v4 = (char *)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E0CB2D50], 0);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICSQLiteError"), v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

BOOL ICSQLiteTruncateDatabase(void *a1)
{
  _BOOL8 v1;
  int v3;
  sqlite3 *ppDb;

  ppDb = 0;
  if (sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), &ppDb, 2, 0))
  {
    return 0;
  }
  v3 = 129;
  v1 = sqlite3_file_control(ppDb, 0, 101, &v3) == 0;
  sqlite3_close(ppDb);
  return v1;
}

uint64_t __Block_byref_object_copy__27550(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27551(uint64_t a1)
{

}

void sub_1A0670F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0672268(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A0675718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A06762A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ICKnownProcessNameForSystemApplication(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ICKnownProcessNameForSystemApplication_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ICKnownProcessNameForSystemApplication_onceToken, &__block_literal_global_36);
  objc_msgSend((id)ICKnownProcessNameForSystemApplication___bundleIdentifierToProcessNameMap, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ICKnownClientVersionForSystemApplication(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ICKnownClientVersionForSystemApplication_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ICKnownClientVersionForSystemApplication_onceToken, &__block_literal_global_52_27962);
  objc_msgSend((id)ICKnownClientVersionForSystemApplication___bundleIdentifierToClientVersionMap, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void getML3TrackPropertyTitle()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getML3TrackPropertyTitleSymbolLoc_ptr;
  v8 = getML3TrackPropertyTitleSymbolLoc_ptr;
  if (!getML3TrackPropertyTitleSymbolLoc_ptr)
  {
    v1 = MusicLibraryLibrary();
    v0 = (id *)dlsym(v1, "ML3TrackPropertyTitle");
    v6[3] = (uint64_t)v0;
    getML3TrackPropertyTitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getML3TrackPropertyTitle(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionEntity.m"), 17, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A067960C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyAlbum()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getML3TrackPropertyAlbumSymbolLoc_ptr;
  v8 = getML3TrackPropertyAlbumSymbolLoc_ptr;
  if (!getML3TrackPropertyAlbumSymbolLoc_ptr)
  {
    v1 = MusicLibraryLibrary();
    v0 = (id *)dlsym(v1, "ML3TrackPropertyAlbum");
    v6[3] = (uint64_t)v0;
    getML3TrackPropertyAlbumSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getML3TrackPropertyAlbum(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionEntity.m"), 18, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A0679704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyArtist()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getML3TrackPropertyArtistSymbolLoc_ptr;
  v8 = getML3TrackPropertyArtistSymbolLoc_ptr;
  if (!getML3TrackPropertyArtistSymbolLoc_ptr)
  {
    v1 = MusicLibraryLibrary();
    v0 = (id *)dlsym(v1, "ML3TrackPropertyArtist");
    v6[3] = (uint64_t)v0;
    getML3TrackPropertyArtistSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getML3TrackPropertyArtist(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionEntity.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A06797FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyPodcastExternalGUID()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr;
  v8 = getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr;
  if (!getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr)
  {
    v1 = MusicLibraryLibrary();
    v0 = (id *)dlsym(v1, "ML3TrackPropertyPodcastExternalGUID");
    v6[3] = (uint64_t)v0;
    getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getML3TrackPropertyPodcastExternalGUID(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionEntity.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A06798F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyFeedURL()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getML3TrackPropertyFeedURLSymbolLoc_ptr;
  v8 = getML3TrackPropertyFeedURLSymbolLoc_ptr;
  if (!getML3TrackPropertyFeedURLSymbolLoc_ptr)
  {
    v1 = MusicLibraryLibrary();
    v0 = (id *)dlsym(v1, "ML3TrackPropertyFeedURL");
    v6[3] = (uint64_t)v0;
    getML3TrackPropertyFeedURLSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getML3TrackPropertyFeedURL(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("ICPlaybackPositionEntity.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A06799EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *ICPlaybackPositionEntityIdentifierForProperties(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  ldiv_t v21;
  uint64_t v22;
  char *v23;
  const UInt8 *v24;
  unsigned __int8 *v25;
  char *v26;
  char *v27;
  uint64_t n;
  unsigned int v29;
  char *v30;
  id v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  unsigned __int8 *v41;
  char *v42;
  char *v43;
  uint64_t k;
  unsigned int v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t quot;
  lldiv_t v50;
  uint64_t v51;
  CFStringRef v52;
  unsigned __int8 *v53;
  char *v54;
  char *v55;
  uint64_t m;
  unsigned int v57;
  char *v58;
  char *v59;
  uint64_t v60;
  _BYTE *v61;
  unint64_t v62;
  unsigned __int8 *v63;
  char *v64;
  char *v65;
  uint64_t j;
  unsigned int v67;
  char *v68;
  void *v69;
  void *v70;
  id v71;
  _BYTE v72[208];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[72];
  _OWORD v79[4];
  uint64_t v80;
  _QWORD v81[3];
  _QWORD v82[3];

  v82[0] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v71 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  v7 = v4;
  if (!v6)
    goto LABEL_16;
  v8 = v6;
  v9 = *(_QWORD *)v74;
  while (2)
  {
    v10 = v5;
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v74 != v9)
        objc_enumerationMutation(v10);
      objc_msgSend(v71, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "absoluteString");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v14 = (void *)v13;

        v12 = v14;
        v4 = v7;
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "stringValue");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v12, "length"))
      {

        v5 = v10;
        goto LABEL_19;
      }
      objc_msgSend(v4, "appendString:", v12);

    }
    v5 = v10;
    v8 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v8)
      continue;
    break;
  }
LABEL_16:

  if (!objc_msgSend(v4, "length"))
  {
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  memset(v72, 0, sizeof(v72));
  CC_MD5_Init((CC_MD5_CTX *)v72);
  v15 = objc_retainAutorelease(v4);
  CC_MD5_Update((CC_MD5_CTX *)v72, (const void *)objc_msgSend(v15, "UTF8String"), objc_msgSend(v15, "length"));

  memset(&v78[8], 0, 64);
  *(_QWORD *)v78 = 4000;
  v4 = v7;
  CC_MD5_Final(&v78[8], (CC_MD5_CTX *)v72);
  v79[0] = *(_OWORD *)v78;
  v79[1] = *(_OWORD *)&v78[16];
  v79[2] = *(_OWORD *)&v78[32];
  v79[3] = *(_OWORD *)&v78[48];
  v80 = *(_QWORD *)&v78[64];
  if (*(uint64_t *)v78 > 3999)
  {
    if (*(uint64_t *)v78 > 4255)
    {
      if (*(_QWORD *)v78 == 4256)
      {
        v18 = v5;
        v63 = (unsigned __int8 *)v79 + 8;
        v64 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v65 = v64;
        for (j = 0; j != 64; j += 2)
        {
          v67 = *v63++;
          v68 = &v64[j];
          *v68 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v67 >> 4];
          v68[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v67 & 0xF];
        }
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v65;
        v33 = 64;
      }
      else
      {
        if (*(_QWORD *)v78 != 4512)
          goto LABEL_68;
        v18 = v5;
        v41 = (unsigned __int8 *)v79 + 8;
        v42 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v43 = v42;
        for (k = 0; k != 128; k += 2)
        {
          v45 = *v41++;
          v46 = &v42[k];
          *v46 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v45 >> 4];
          v46[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v45 & 0xF];
        }
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = v43;
        v33 = 128;
      }
    }
    else if (*(_QWORD *)v78 == 4000)
    {
      v18 = v5;
      v53 = (unsigned __int8 *)v79 + 8;
      v54 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v55 = v54;
      for (m = 0; m != 32; m += 2)
      {
        v57 = *v53++;
        v58 = &v54[m];
        *v58 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v57 >> 4];
        v58[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v57 & 0xF];
      }
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      v32 = v55;
      v33 = 32;
    }
    else
    {
      if (*(_QWORD *)v78 != 4001)
        goto LABEL_68;
      v18 = v5;
      v25 = (unsigned __int8 *)v79 + 8;
      v26 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v27 = v26;
      for (n = 0; n != 40; n += 2)
      {
        v29 = *v25++;
        v30 = &v26[n];
        *v30 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v29 >> 4];
        v30[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v29 & 0xF];
      }
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      v32 = v27;
      v33 = 40;
    }
    v52 = (CFStringRef)objc_msgSend(v31, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v32, v33, 4, 1);
    goto LABEL_67;
  }
  if (*(uint64_t *)v78 > 2999)
  {
    if (*(_QWORD *)v78 == 3000)
    {
      LODWORD(v81[0]) = bswap32(DWORD2(v79[0]));
      v59 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v60 = 0;
      v61 = v59 + 1;
      do
      {
        v62 = *((unsigned __int8 *)v81 + v60);
        *(v61 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v62 >> 4];
        *v61 = MSVFastHexStringFromBytes_hexCharacters_37049[v62 & 0xF];
        v61 += 2;
        ++v60;
      }
      while (v60 != 4);
      v38 = objc_alloc(MEMORY[0x1E0CB3940]);
      v39 = v59;
      v40 = 8;
    }
    else
    {
      if (*(_QWORD *)v78 != 3001)
        goto LABEL_68;
      v81[0] = bswap64(*((unint64_t *)&v79[0] + 1));
      v34 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v35 = 0;
      v36 = v34 + 1;
      do
      {
        v37 = *((unsigned __int8 *)v81 + v35);
        *(v36 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v37 >> 4];
        *v36 = MSVFastHexStringFromBytes_hexCharacters_37049[v37 & 0xF];
        v36 += 2;
        ++v35;
      }
      while (v35 != 8);
      v38 = objc_alloc(MEMORY[0x1E0CB3940]);
      v39 = v34;
      v40 = 16;
    }
    v16 = (__CFString *)objc_msgSend(v38, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v39, v40, 4, 1);
    goto LABEL_20;
  }
  if (*(_QWORD *)v78 == 1000)
  {
    v18 = v5;
    v47 = *((_QWORD *)&v79[0] + 1);
    v48 = (char *)v82 + 1;
    quot = *((_QWORD *)&v79[0] + 1);
    do
    {
      v50 = lldiv(quot, 10);
      quot = v50.quot;
      if (v50.rem >= 0)
        LOBYTE(v51) = v50.rem;
      else
        v51 = -v50.rem;
      *(v48 - 2) = v51 + 48;
      v24 = (const UInt8 *)(v48 - 2);
      --v48;
    }
    while (v50.quot);
    if (v47 < 0)
    {
      *(v48 - 2) = 45;
      v24 = (const UInt8 *)(v48 - 2);
    }
    v23 = (char *)((char *)v82 - (char *)v24);
LABEL_55:
    v52 = CFStringCreateWithBytes(0, v24, (CFIndex)v23, 0x8000100u, 0);
LABEL_67:
    v16 = (__CFString *)v52;
    v5 = v18;
    goto LABEL_20;
  }
  if (*(_QWORD *)v78 == 2000)
  {
    v18 = v5;
    v19 = DWORD2(v79[0]);
    v20 = v82;
    do
    {
      v21 = ldiv(v19, 10);
      v19 = v21.quot;
      if (v21.rem >= 0)
        LOBYTE(v22) = v21.rem;
      else
        v22 = -v21.rem;
      *((_BYTE *)v20 - 1) = v22 + 48;
      v20 = (_QWORD *)((char *)v20 - 1);
    }
    while (v21.quot);
    v23 = (char *)((char *)v82 - (char *)v20);
    v24 = (const UInt8 *)v20;
    goto LABEL_55;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

  v16 = &stru_1E4391778;
LABEL_20:

  return v16;
}

void *MusicLibraryLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MusicLibraryLibraryCore_frameworkLibrary_28112)
    MusicLibraryLibraryCore_frameworkLibrary_28112 = _sl_dlopen();
  v0 = (void *)MusicLibraryLibraryCore_frameworkLibrary_28112;
  if (!MusicLibraryLibraryCore_frameworkLibrary_28112)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MusicLibraryLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("ICPlaybackPositionEntity.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

uint64_t getAPSSettingsGetInt64SymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getAPSSettingsGetInt64SymbolLoc_ptr;
  v6 = getAPSSettingsGetInt64SymbolLoc_ptr;
  if (!getAPSSettingsGetInt64SymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getAPSSettingsGetInt64SymbolLoc_block_invoke;
    v2[3] = &unk_1E4391138;
    v2[4] = &v3;
    __getAPSSettingsGetInt64SymbolLoc_block_invoke(v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A067B134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAPSSettingsGetInt64SymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!AirPlaySupportLibraryCore_frameworkLibrary)
    AirPlaySupportLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)AirPlaySupportLibraryCore_frameworkLibrary;
  if (!AirPlaySupportLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AirPlaySupportLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("ICDelegationServiceSecuritySettings.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "APSSettingsGetInt64");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getAPSSettingsGetInt64SymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_1A067B558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28361(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28362(uint64_t a1)
{

}

uint64_t _ICLLErrorMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 12;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__28694(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28695(uint64_t a1)
{

}

void sub_1A067F74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v30);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28868(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28869(uint64_t a1)
{

}

void sub_1A0680D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29019(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29020(uint64_t a1)
{

}

void sub_1A0681F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0683668(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id getMCProfileConnectionClass()
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
  v0 = (void *)getMCProfileConnectionClass_softClass;
  v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E4391138;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A068372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *ManagedConfigurationLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("ICLiveLinkQRConnectionDataSource.m"), 32, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ManagedConfigurationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MCProfileConnection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ICLiveLinkQRConnectionDataSource.m"), 33, CFSTR("Unable to find class %s"), "MCProfileConnection");

    __break(1u);
  }
}

uint64_t __Block_byref_object_copy__29695(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29696(uint64_t a1)
{

}

__CFString *NSStringFromICLiveLinkEventType(unint64_t a1)
{
  if (a1 < 6)
    return off_1E438F4D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown/type=%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t _ICLLPlaybackSyncActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        -[_ICLLPlaybackSyncAction clearOneofValuesForPayload](a1);
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 2;
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      else
      {
        if ((_DWORD)v17 != 1)
        {
          if ((_DWORD)v17)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          else
          {
            v18 = 0;
            while (1)
            {
              v19 = *v3;
              v20 = *(_QWORD *)(a2 + v19);
              if (v20 == -1 || v20 >= *(_QWORD *)(a2 + *v4))
                break;
              v21 = v20 + 1;
              v22 = *(char *)(*(_QWORD *)(a2 + *v7) + v20);
              *(_QWORD *)(a2 + v19) = v21;
              if (v22 < 0 && v18++ <= 8)
                continue;
              goto LABEL_34;
            }
            *(_BYTE *)(a2 + *v5) = 1;
          }
          continue;
        }
        -[_ICLLPlaybackSyncAction clearOneofValuesForPayload](a1);
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

LABEL_34:
      ;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A0690D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31553(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31554(uint64_t a1)
{

}

void sub_1A069137C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A06920CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0692714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1A0692FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31747(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31748(uint64_t a1)
{

}

uint64_t ICIAMSynchronizeMessagesRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_44;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_46:
          v37 = 8;
          goto LABEL_51;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_50:
          v37 = 16;
LABEL_51:
          *(_QWORD *)(a1 + v37) = v19;
          continue;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v29;

          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_53;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          v33 = 0;
          goto LABEL_55;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
      if (*(_BYTE *)(a2 + *v5))
        v33 = 0;
LABEL_55:
      *(_BYTE *)(a1 + 32) = v33 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A069416C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31864(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31865(uint64_t a1)
{

}

void sub_1A06945A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

id ICDelegateAccountStorePrimaryKeyForUserIdentity(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "deviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      v4 = v5;
    else
      v4 = 0;

  }
  return v4;
}

void sub_1A0695CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0697138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ICMusicSubscriptionStatusMonitorHandleActiveUserIdentityDidChangeRemoteNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleActiveUserIdentityDidChangeRemoteNotification");
}

void sub_1A069980C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0699914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06999F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0699B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32687(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32688(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__32824(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32825(uint64_t a1)
{

}

uint64_t ICPBDGSPlayerInfoContextRequestTokenReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 != 2)
      {
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_47;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        v32 = 8;
        goto LABEL_46;
      }
      PBReaderReadData();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v29;

LABEL_47:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v24 = 0;
    v25 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 32) |= 2u;
    while (1)
    {
      v26 = *v3;
      v27 = *(_QWORD *)(a2 + v26);
      if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
        break;
      v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
      *(_QWORD *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0)
        goto LABEL_43;
      v24 += 7;
      v14 = v25++ >= 9;
      if (v14)
      {
        v20 = 0;
        goto LABEL_45;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
    if (*(_BYTE *)(a2 + *v5))
      v20 = 0;
LABEL_45:
    v32 = 16;
LABEL_46:
    *(_QWORD *)(a1 + v32) = v20;
    goto LABEL_47;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL _ICLLCurrentItemTransitionActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _ICLLRemoveQueueItemCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_42;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_44:
          v33 = 36;
          goto LABEL_49;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
          goto LABEL_40;
        case 3u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[_ICLLRemoveQueueItemCommand addItemIdsToRemove:](a1, v31);

          continue;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
LABEL_40:
          v32 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0)
          goto LABEL_46;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_48:
      v33 = 32;
LABEL_49:
      *(_DWORD *)(a1 + v33) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _ICLLAvailabilityReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  unint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 60) |= 1u;
        while (1)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_58;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v28 = 0;
            goto LABEL_60;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_60:
        *(_BYTE *)(a1 + 56) = v28 != 0;
        goto LABEL_77;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        if (v16 != 2)
        {
          v38 = 0;
          v39 = 0;
          v40 = 0;
          while (1)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
              break;
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              v14 = v39++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_76;
          }
LABEL_75:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_76:
          PBRepeatedInt32Add();
          goto LABEL_77;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (1)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_33;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          PBRepeatedInt32Add();
        }
LABEL_56:
        PBReaderRecallMark();
        goto LABEL_77;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_77:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    if (v16 != 2)
    {
      v44 = 0;
      v45 = 0;
      v46 = 0;
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          goto LABEL_75;
        v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if (v49 < 0)
        {
          v44 += 7;
          v14 = v45++ >= 9;
          if (!v14)
            continue;
        }
        goto LABEL_76;
      }
    }
    result = PBReaderPlaceMark();
    if (!(_DWORD)result)
      return result;
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if (v37 < 0)
        {
          v32 += 7;
          v14 = v33++ >= 9;
          if (!v14)
            continue;
        }
        goto LABEL_53;
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
      PBRepeatedInt32Add();
    }
    goto LABEL_56;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__33446(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33447(uint64_t a1)
{

}

const __CFString *ICNSStringForICMediaContentTasteItem(unint64_t a1)
{
  if (a1 > 8)
    return CFSTR("Unknown Media Entity Type");
  else
    return off_1E43907F8[a1];
}

const __CFString *ICNSStringForICMediaContentTaste(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown Content Taste Type");
  else
    return off_1E4390840[a1];
}

void sub_1A06A07C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A06A0CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33687(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33688(uint64_t a1)
{

}

void sub_1A06A120C(void *a1)
{
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_1A06A1218(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A06A1AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1A06A2E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

double ICStoreVideoArtworkInfoBestSizesForSize(void *a1, double a2, double a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = v7;
    v12 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "CGSizeValue");
        if (v14 >= a2 && v15 >= a3)
        {
          if (v12 == v6 && v11 == v7 || (v14 < v12 ? (v17 = v15 < v11) : (v17 = 0), v17))
          {
            v11 = v15;
            v12 = v14;
          }
        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

void sub_1A06A66C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06A6794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06A6860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34189(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34190(uint64_t a1)
{

}

void sub_1A06A7470(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A06A7668(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A06A7688(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A06A7628);
}

void sub_1A06A7870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06A7A6C(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1A06A7A8C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A06A7A00);
}

uint64_t __Block_byref_object_copy__34360(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34361(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__34635(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34636(uint64_t a1)
{

}

BOOL ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("skd"), 1) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

uint64_t _ICLLClientInfoActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__35395(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35396(uint64_t a1)
{

}

BOOL ICEnvironmentNetworkLinkQualityIsHigh(unint64_t a1)
{
  return a1 > 0x31;
}

const __CFString *ICEnvironmentNetworkLinkQualityDescription(unint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("fair");
  if (a1 < 0x14)
    v1 = CFSTR("low");
  if (a1 <= 0x31)
    return v1;
  else
    return CFSTR("high");
}

BOOL ICEnvironmentNetworkTypeIsBluetooth(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x1F4;
}

BOOL ICEnvironmentNetworkTypeIsWired(uint64_t a1)
{
  return a1 > 1999;
}

BOOL ICEnvironmentNetworkTypeIsWifi(uint64_t a1)
{
  return (unint64_t)(a1 - 1000) < 0x3E8;
}

BOOL ICEnvironmentNetworkLinkQualityIsLow(unint64_t a1)
{
  return a1 < 0x14;
}

void sub_1A06B24D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A06B26C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35918(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35919(uint64_t a1)
{

}

__CFString *ICMusicSubscriptionStatusTypeGetDescription(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E43914F0[a1];
}

__CFString *ICMusicSubscriptionStatusReasonTypeGetDescription(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E4391510[a1];
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_wifiCallBack:", a2);
}

uint64_t ICIAMSerialCheckResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ICIAMApplicationBadgeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
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

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C990D8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CFURLResponseCopyPeerAddress()
{
  return MEMORY[0x1E0C92A40]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CacheDeleteCacheable()
{
  return MEMORY[0x1E0D09B30]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1E0D09B80]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBAD28](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1E0DE2B18]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MRAVAirPlaySecuritySettingsGetPassword()
{
  return MEMORY[0x1E0D4B3B8]();
}

uint64_t MRAVAirPlaySecuritySettingsGetSecurityMode()
{
  return MEMORY[0x1E0D4B3C0]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x1E0D4BE70]();
}

uint64_t MRMediaRemoteGetReceiverAirPlaySecuritySettings()
{
  return MEMORY[0x1E0D4BF68]();
}

uint64_t MRMediaRemoteGetSavedAVRoutePassword()
{
  return MEMORY[0x1E0D4BF70]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x1E0D4CE58]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0D4CE78]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1E0D4CE98]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x1E0D4CEE8]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x1E0D4CEF0]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x1E0D4CF00]();
}

uint64_t MSVMediaLoggingDirectory()
{
  return MEMORY[0x1E0D4CF58]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1E0D4CF60]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1E0D4CF68]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1E0D4CFC8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1E0D1B510]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1E0D1B528]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1E0D1B530]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x1E0D1B570]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x1E0D1B5C8]();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE89F8](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8A40](prefs, runLoop, runLoopMode);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x1E0CD64C8]();
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1E0DB1018]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1E0CA6E80]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1E0CA7030]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x1E0CA7098]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1E0C9A878]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1E0C9A880]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8D0]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8F0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1E0D4D148]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1E0CD7368](trust);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85E0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1E0DE8860](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE89B8](pStmt);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

