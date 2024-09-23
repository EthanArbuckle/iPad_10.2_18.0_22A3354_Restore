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

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
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

uint64_t __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1C3B76918](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1BD8323B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BD832484(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double RCTestSlowMessageServiceSleepAmount()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return *(double *)&_RCTestSlowMessageServiceSleepAmount;
}

id OSLogForCategory(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  os_log_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  id v9;
  __int16 v11;
  uint8_t buf[2];

  v1 = a1;
  v2 = MEMORY[0x1E0C81028];
  if (OSLogForCategory_onceToken == -1)
  {
    if (v1)
      goto LABEL_3;
LABEL_14:
    v3 = (void *)MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  dispatch_once(&OSLogForCategory_onceToken, &__block_literal_global_10);
  if (!v1)
    goto LABEL_14;
LABEL_3:
  objc_msgSend((id)OSLogForCategory_gOSLogDictionary, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if ((unint64_t)objc_msgSend((id)OSLogForCategory_gOSLogDictionary, "count") > 0xA)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v6 = MEMORY[0x1E0C81028];
        v7 = "ERROR | Too many categories defined, use default";
        v8 = (uint8_t *)&v11;
LABEL_11:
        _os_log_impl(&dword_1BD830000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      v4 = objc_retainAutorelease(v1);
      v5 = os_log_create("com.apple.VoiceMemos", (const char *)objc_msgSend(v4, "UTF8String"));
      if (v5)
      {
        v3 = v5;
        objc_msgSend((id)OSLogForCategory_gOSLogDictionary, "setObject:forKey:", v5, v4);
        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = MEMORY[0x1E0C81028];
        v7 = "ERROR | Failed os_log_create, use default";
        v8 = buf;
        goto LABEL_11;
      }
    }
    v3 = (void *)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
LABEL_15:

  return v3;
}

void sub_1BD8336FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1BD83389C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1BD833AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD833C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD833FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(unint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  unint64_t v7;
  double v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v7 = (unint64_t)(floor(a5) / 60.0);
  v8 = fmax(a4, 0.0);
  v9 = 2;
  if (v7)
    v9 = 3;
  v10 = v7 >= 0x3C;
  v11 = 4;
  if (v10)
    v9 = 4;
  if (v9 <= a1)
    v9 = a1;
  if (v9 < 4)
    v11 = v9;
  switch(v11)
  {
    case 4:
      +[RCDurationFormatter sharedFormatter](RCDurationFormatter, "sharedFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8;
      v15 = a2;
      v16 = 0;
      break;
    case 3:
      +[RCDurationFormatter sharedFormatter](RCDurationFormatter, "sharedFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8;
      v15 = a2;
      v16 = 2;
      break;
    case 2:
      +[RCDurationFormatter sharedFormatter](RCDurationFormatter, "sharedFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8;
      v15 = a2;
      v16 = 4;
      break;
    default:
      v17 = 0;
      return v17;
  }
  objc_msgSend(v12, "stringFromDuration:hideComponentOptions:style:shouldPadMinute:", v15, v16, a3, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id RCLocalizedDurationWithHiddenComponents(int a1, uint64_t a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = 3;
  if ((unint64_t)(a3 / 3600.0))
    v6 = 1;
  else
    v6 = 3;
  if (a3 < 60.0)
    v5 = 1;
  if (a1)
    v7 = v5;
  else
    v7 = 0;
  +[RCDurationFormatter sharedFormatter](RCDurationFormatter, "sharedFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDuration:hideComponentOptions:style:shouldPadMinute:", v7, v6, a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id RCObserveChangesToKeyPath(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v24[0] = a2;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a2;
  v8 = a1;
  objc_msgSend(v6, "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __RCObserveChangesToKeyPath_block_invoke;
  v15[3] = &unk_1E769CA68;
  v16 = v5;
  v17 = &v18;
  v10 = v5;
  RCObserveChangesToKeyPaths(v8, v9, 3, v15);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v19[5];
  v19[5] = v11;

  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

id RCObserveChangesToKeyPaths(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:", v7);
  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v10, "setKeyPaths:", v11);

  objc_msgSend(v10, "setObserver:", v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v10, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), a3, &__keyPathObserverContext, (_QWORD)v18);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  return v10;
}

id RCRecordingsDirectoryURL()
{
  if (RCRecordingsDirectoryURL_onceToken != -1)
    dispatch_once(&RCRecordingsDirectoryURL_onceToken, &__block_literal_global_6);
  return (id)RCRecordingsDirectoryURL_recordingsDirectory;
}

BOOL identicalClones(void *a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  v4 = fsctl((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0x40104A0EuLL, &v9, 0);
  v5 = 0;
  if (!v4)
  {
    v5 = 0;
    if (!fsctl((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 0x40104A0EuLL, &v7, 0))v5 = (v9 == 2 || v7 == 2) && v10 == v8;
  }

  return v5;
}

id getChange(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v2)
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

void sub_1BD835C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_s0_s8_s16_s24(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1BD835FB4(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24(id *a1)
{

}

BOOL RCIsBeingUnitTested()
{
  return NSClassFromString(CFSTR("XCTestCase")) != 0;
}

void sub_1BD836778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BD836814(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ___accessActiveCaptureCompositionAVURLs_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL RCDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

id RCLocalizedPlaybackTime(int a1, uint64_t a2, double a3, double a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = 3;
  if (a3 < 60.0)
    v5 = 1;
  if (a1)
    v6 = v5;
  else
    v6 = 0;
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(3uLL, v6, a2, a3, a4);
}

void ___accessActiveCaptureCompositionAVURLs_block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessActiveCaptureCompositionAVURLs_compositionAVURLs;
  _accessActiveCaptureCompositionAVURLs_compositionAVURLs = v0;

  v2 = dispatch_queue_create(0, 0);
  v3 = (void *)_accessActiveCaptureCompositionAVURLs_queue;
  _accessActiveCaptureCompositionAVURLs_queue = (uint64_t)v2;

}

uint64_t RCSupportsDebugAODOverlay()
{
  void *v0;
  uint64_t v1;

  if (RCIsInternalInstall_onceToken != -1)
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_142);
  if (!RCIsInternalInstall_isInternalInstall)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("RCDebugAODOverlay"));

  return v1;
}

uint64_t RCIsInternalInstall()
{
  if (RCIsInternalInstall_onceToken != -1)
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_142);
  return RCIsInternalInstall_isInternalInstall;
}

id RCCloudRecordingsStoreURL()
{
  if (RCCloudRecordingsStoreURL_onceToken != -1)
    dispatch_once(&RCCloudRecordingsStoreURL_onceToken, &__block_literal_global_48);
  return (id)RCCloudRecordingsStoreURL_storeURL;
}

void _accessActiveCaptureCompositionAVURLs(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  if (_accessActiveCaptureCompositionAVURLs_onceToken != -1)
    dispatch_once(&_accessActiveCaptureCompositionAVURLs_onceToken, &__block_literal_global_255);
  v2 = _accessActiveCaptureCompositionAVURLs_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___accessActiveCaptureCompositionAVURLs_block_invoke_2;
  block[3] = &unk_1E769C228;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void sub_1BD837AA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BD837BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD837D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD838538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD838690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD838708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83887C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _checkCanAppend(RCWaveformGenerator *a1, objc_selector *a2)
{
  RCWaveformGenerator *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _checkCanAppend(RCWaveformGenerator *__strong, SEL)");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("<Unknown Function>");
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("<Unknown File>");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v7, v11, 938, CFSTR("invalid parameter"), 0, 0, 0, 0, 0);

  }
  v13 = -[RCWaveformGenerator state](v3, "state");
  v14 = v13;
  if (v13 == 3 || !v13)
    _assertInvalidStateMessage(CFSTR("loading samples"), v13, a2);
  if (v14)
    v15 = v14 == 3;
  else
    v15 = 1;
  v16 = !v15;

  return v16;
}

void sub_1BD838A70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD838B00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD838BF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1BD838C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD838D7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _assertInvalidStateMessage(NSString *a1, unint64_t a2, objc_selector *a3)
{
  NSString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  OSLogForCategory(CFSTR("Default"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector((SEL)a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (a2 > 3)
      v9 = CFSTR("unknown RCWaveformGeneratorState");
    else
      v9 = off_1E769BE48[a2];
    v10 = 136315906;
    v11 = "_assertInvalidStateMessage";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_error_impl(&dword_1BD830000, v6, OS_LOG_TYPE_ERROR, "%s -- WARNING: %@ (%@) is disallowed when generator state is '%@'  ignoring, instead of asserting.", (uint8_t *)&v10, 0x2Au);

  }
}

void sub_1BD839210(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD839280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1BD839818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1BD839A98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD839C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD839DA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD839F98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83A120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1BD83A4B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD83A7CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83AC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1BD83AEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1BD83AFB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83B09C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83B1BC(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 0;
    objc_end_catch();
    JUMPOUT(0x1BD83B188);
  }
  _Unwind_Resume(a1);
}

void sub_1BD83B338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1BD83B584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83B82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1BD83BD88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83BDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)RCWaveformSegmentAccumulator;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1BD83BEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E769B2F8, MEMORY[0x1E0DE42D0]);
}

void sub_1BD83BFC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1BD83CBB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83CCB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD83CD70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83CE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83CF78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1BD83D054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83D0F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83D15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1BD83D304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83D518(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1BD83D904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1BD83DB30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83DD8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1BD83DFF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD83E144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83E4E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD83E79C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD83EA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1BD83EC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BD83F528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD83FAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD83FBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD83FF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD84009C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD84021C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8405E8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BD8405F4(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1BD840600);
}

void sub_1BD840714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8408EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD840B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD840DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD840F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD84117C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8415F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD841EF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BD842FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t block, uint64_t a17, void (*a18)(uint64_t a1), void *a19, id a20)
{
  void *v20;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    block = MEMORY[0x1E0C809B0];
    a17 = 3221225472;
    a18 = __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_81;
    a19 = &unk_1E769C228;
    a20 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], &block);

    objc_end_catch();
    JUMPOUT(0x1BD842F5CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1BD8438C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD843C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD843EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD844010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8456A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BD8469C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BD846FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8472E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD847530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8477C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD847A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD847CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD847E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD847FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8482AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BD8484EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __isUniqueMusicMemo_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recordingsWithUniqueID:", *(_QWORD *)(a1 + 40));
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "musicMemo", (_QWORD)v7) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

BOOL RCShouldSendAnalyticsEventForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v1);
    goto LABEL_5;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v3, 86400.0);
  v6 = objc_msgSend(v4, "compare:", v5);
  v7 = v6 == 1;
  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v4, v1);

LABEL_5:
    v7 = 1;
  }

  return v7;
}

void sub_1BD849F90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD84A0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void migrateBackupExclusionFlag(void *a1)
{
  id v1;
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v15 = 0;
  v2 = *MEMORY[0x1E0C999D8];
  v14 = 0;
  v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v15, v2, &v14);
  v4 = v15;
  v5 = v14;
  if (v3 && objc_msgSend(v4, "BOOLValue"))
  {
    v6 = *MEMORY[0x1E0C9AC90];
    v13 = v5;
    v7 = objc_msgSend(v1, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA0], v2, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      OSLogForCategory(CFSTR("Default"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "migrateBackupExclusionFlag";
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1BD830000, v9, OS_LOG_TYPE_DEFAULT, "%s -- ERROR clearing old exclusion flag: %@", buf, 0x16u);
      }

    }
    v12 = v8;
    v10 = objc_msgSend(v1, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v6, &v12);
    v5 = v12;

    if ((v10 & 1) == 0)
    {
      OSLogForCategory(CFSTR("Default"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "migrateBackupExclusionFlag";
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_1BD830000, v11, OS_LOG_TYPE_DEFAULT, "%s -- ERROR setting new exclusion flag: %@", buf, 0x16u);
      }

    }
  }

}

void sub_1BD84C924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1BD84EDC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BD84F080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD84FE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL RCTimeRangeContainsRange(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 <= a3;
}

BOOL RCTimeRangeContainsTime(double a1, double a2, double a3)
{
  return a2 >= a3 && a1 <= a3;
}

BOOL RCTimeRangeIntersectsRange(double a1, double a2, double a3, double a4)
{
  return a3 <= a2 && a1 <= a4;
}

BOOL RCTimeRangeEqualToTimeRange(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) <= 0.00000011920929;
  return vabdd_f64(a2, a4) <= 0.00000011920929 && v4;
}

double RCTimeRangeByConvertingToValidRange(double a1, double a2, double a3)
{
  double v3;
  double v5;

  v3 = fabs(a2 + 1.79769313e308);
  if (fabs(a1 + -1.79769313e308) > 0.00000011920929 || v3 > 0.00000011920929)
  {
    v5 = fabs(a2 + -1.79769313e308);
    if (fabs(a1 + 1.79769313e308) > 0.00000011920929 || v5 > 0.00000011920929)
      return a1;
  }
  return a3;
}

double RCTimeRangeDelta(double a1, double a2)
{
  double v2;
  double v3;
  float v4;

  v2 = a2 - a1;
  v3 = __exp10(4.0);
  v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithFractionalPrecision(uint64_t a1, double a2, double a3)
{
  double v3;
  double v4;
  float v5;

  v3 = a3 - a2;
  if (a1 >= 1)
  {
    v4 = __exp10((double)a1);
    v5 = v3 * v4;
    return roundf(v5) / v4;
  }
  return v3;
}

double RCTimeRangeGetMidTime(double a1, double a2)
{
  double v3;
  double v4;
  float v5;

  v3 = a2 - a1;
  v4 = __exp10(4.0);
  v5 = v3 * v4;
  return a1 + roundf(v5) / v4 * 0.5;
}

double RCTimeRangeDeltaWithUIPrecision(double a1, double a2)
{
  double v2;
  double v3;
  float v4;

  v2 = a2 - a1;
  v3 = __exp10(4.0);
  v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithExactPrecision(double a1, double a2)
{
  return a2 - a1;
}

double RCTimeRangeConstrainTime(double result, double a2, double a3)
{
  if (a2 >= a3)
    a2 = a3;
  if (result < a2)
    return a2;
  return result;
}

double RCTimeRangeShift(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeInset(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeIntersectTimeRange(double result, double a2, double a3, double a4)
{
  if (result < a3)
    result = a3;
  if (a2 >= a4)
    a2 = a4;
  if (a2 < result)
    return 1.79769313e308;
  return result;
}

id NSStringFromRCTimeRange(double a1, double a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  if (a2 == 1.79769313e308)
  {
    v3 = CFSTR("MAX");
  }
  else if (a2 == -1.79769313e308)
  {
    v3 = CFSTR("-MAX");
  }
  else
  {
    _RCTimeRangeTimeDescription(&v7, a2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a1 == 1.79769313e308)
  {
    v4 = CFSTR("MAX");
  }
  else if (a1 == -1.79769313e308)
  {
    v4 = CFSTR("-MAX");
  }
  else
  {
    _RCTimeRangeTimeDescription(&v7, a1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ - %@]"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _RCTimeRangeTimeDescription(_QWORD *a1, double a2)
{
  int v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;

  v2 = (int)a2;
  v3 = a2 - (double)(60 * ((int)a2 / 60));
  v4 = (v2 / 3600);
  v5 = (v2 / 60 - 60 * v4);
  if (v2 > 3599)
  {
    if (!a1)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!a1)
  {
    if ((int)v5 <= 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (*a1 != 3)
  {
    if ((int)v5 <= 0 && *a1 != 2)
    {
      *a1 = 1;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g"), *(_QWORD *)&v3, v8, v9);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    *a1 = 2;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%05.2f"), v5, *(_QWORD *)&v3, v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  *a1 = 3;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%05.2f"), v4, v5, *(_QWORD *)&v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void RCTimeRangeEncodeWithKey(void *a1, void *a2, double a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = a1;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".beginTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeDouble:forKey:", v9, a3);

  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".endTime"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encodeDouble:forKey:", v10, a4);
}

double RCTimeRangeDecodeWithKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".beginTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v5);
  v7 = v6;

  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".endTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", v8);
  return v7;
}

CMTimeRange *CMTimeRangeFromRCTimeRange@<X0>(CMTimeRange *a1@<X8>, Float64 a2@<D0>, double a3@<D1>)
{
  double v6;
  float v7;
  CMTime v9;
  CMTime start;

  CMTimeMakeWithSeconds(&start, a2, kCMDefaultTimeScale);
  v6 = __exp10(4.0);
  v7 = (a3 - a2) * v6;
  CMTimeMakeWithSeconds(&v9, roundf(v7) / v6, kCMDefaultTimeScale);
  return CMTimeRangeMake(a1, &start, &v9);
}

double RCTimeRangeFromCMTimeRange(uint64_t a1)
{
  double Seconds;
  CMTime v4;

  v4 = *(CMTime *)a1;
  Seconds = CMTimeGetSeconds(&v4);
  v4 = *(CMTime *)(a1 + 24);
  CMTimeGetSeconds(&v4);
  return Seconds;
}

void sub_1BD850990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  __destructor_8_s0_s8_s16_s24((id *)va);
  _Unwind_Resume(a1);
}

id _hiddenComponentStringWithString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = (void *)MEMORY[0x1E0CB37A0];
  v2 = a1;
  objc_msgSend(v1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___hiddenComponentStringWithString_block_invoke;
  v8[3] = &unk_1E769C930;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

const __CFString *NSStringFromRCDurationFormattingStyle(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("RCDurationFormattingStyle_???");
  else
    return off_1E769C968[a1];
}

uint64_t ___hiddenComponentStringWithString_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("−"));
}

void sub_1BD8513F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1BD851768(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  uint64_t v13;
  id v16;
  uint64_t v17;
  void *v18;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    v17 = *(_QWORD *)(v12 + 64);
    RCGenericError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

    objc_end_catch();
    JUMPOUT(0x1BD851738);
  }
  _Unwind_Resume(a1);
}

id RCGenericError()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.ErrorDomain"), -1, 0);
}

id RCErrorWithTypeAndDescription(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = a2;
  v5 = [v3 alloc];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.ErrorDomain"), a1, v6);
  return v7;
}

id RCGenericErrorWithUnderlyingError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v6 = *MEMORY[0x1E0CB3388];
    v7[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.ErrorDomain"), -1, v3);

  return v4;
}

double RCNormalizedDecibelValue(float a1)
{
  return __exp10f(a1 / 12.0);
}

long double RCScalarDecibelValue(float a1)
{
  return log10(a1) * 12.0;
}

BOOL RCFloatsAlmostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.01;
}

BOOL RCEqualFloatsWithTolerance(float a1, float a2, float a3)
{
  return vabds_f32(a1, a2) < a3;
}

id RCLocalizedDuration(double a1)
{
  return RCLocalizedDurationWithHiddenComponents(0, 0, a1);
}

id RCLocalizedRecordingDateWithOptions(void *a1, unint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a1;
  if (a2 <= 1)
    v4 = 1;
  else
    v4 = a2;
  if ((~v4 & 3) == 0)
  {
    v5 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
    if (!RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v7 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
      RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter = (uint64_t)v6;

      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter, "setDateStyle:", 1);
      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter, "setTimeStyle:", 1);
      v5 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
    }
LABEL_14:
    objc_msgSend(v5, "stringFromDate:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    RCDisplayStringForString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ((v4 & 1) != 0)
  {
    v5 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
    if (!RCLocalizedRecordingDateWithOptions___timeFormatter)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v12 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
      RCLocalizedRecordingDateWithOptions___timeFormatter = (uint64_t)v11;

      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___timeFormatter, "setDateStyle:", 0);
      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___timeFormatter, "setTimeStyle:", 1);
      v5 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
    }
    goto LABEL_14;
  }
  if ((v4 & 2) != 0)
  {
    v5 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
    if (!RCLocalizedRecordingDateWithOptions___dateFormatter)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v14 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
      RCLocalizedRecordingDateWithOptions___dateFormatter = (uint64_t)v13;

      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___dateFormatter, "setDateStyle:", 1);
      objc_msgSend((id)RCLocalizedRecordingDateWithOptions___dateFormatter, "setTimeStyle:", 0);
      v5 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull RCLocalizedRecordingDateWithOptions(NSDate *__strong _Nonnull, RCDateFormatOptions)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("RCUtilities.m"), 163, CFSTR("must supply either time or day"));

  v10 = 0;
LABEL_15:

  return v10;
}

id RCLocalizedPlaybackTimeWithMinimumComponents(unint64_t a1, uint64_t a2, double a3, double a4)
{
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(a1, 0, a2, a3, a4);
}

id RCLocalizedInteger(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a2 == 2)
  {
    if (__locStringInt2W_onceToken != -1)
      dispatch_once(&__locStringInt2W_onceToken, &__block_literal_global_166);
    v4 = (void *)__locStringInt2W_paddedNumberFormatter;
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    if (__locStringInt1W_onceToken != -1)
      dispatch_once(&__locStringInt1W_onceToken, &__block_literal_global_165);
    v4 = (void *)__locStringInt1W_paddedNumberFormatter;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v5 = v7;
  if (a2 >= 1)
    objc_msgSend(v7, "setMinimumIntegerDigits:", a2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

id RCLocalizedFrameworkString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.VoiceMemos.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id RCDebugStringForTimeInterval(double a1)
{
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(3uLL, 0, 1, a1, a1);
}

uint64_t RCNumberOfDigitsInInteger(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 1;
  if (a1 >= 0)
    v1 = a1;
  else
    v1 = -a1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

uint64_t RCAvailableDiskSpaceForRecording()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const __CFNumber *Value;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t valuePtr;
  statfs v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (!v0)
  {
    OSLogForCategory(CFSTR("Default"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      RCAvailableDiskSpaceForRecording_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);

    goto LABEL_11;
  }
  v1 = v0;
  Value = (const __CFNumber *)CFDictionaryGetValue(v0, (const void *)*MEMORY[0x1E0DE2CA0]);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      RCAvailableDiskSpaceForRecording_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  CFRelease(v1);
  v19 = valuePtr;
  if (!valuePtr)
  {
LABEL_11:
    memset(&v32, 0, 512);
    objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = statfs((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v32);

    if (v21)
    {
      OSLogForCategory(CFSTR("Default"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        RCAvailableDiskSpaceForRecording_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);

      v19 = valuePtr;
    }
    else
    {
      v19 = v32.f_bavail * v32.f_bsize;
    }
  }
  return (uint64_t)fmax((double)(v19 / 2) + -5242880.0, 0.0);
}

BOOL RCHasEnoughDiskSpaceToRecord()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = RCAvailableDiskSpaceForRecording();
  if (v0 < 5242880)
  {
    OSLogForCategory(CFSTR("Default"));
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      RCHasEnoughDiskSpaceToRecord_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  }
  return v0 >= 5242880;
}

id RCDiskCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.voicememos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id RCApplicationSupportDirectory()
{
  void *v0;
  void *v1;
  void *v2;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.voicememos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t RCIsVoiceMemosApplication()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isApplication");

  return v1;
}

uint64_t RCIsVoiceMemosApplicationInstalled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "applicationIsInstalled:", CFSTR("com.apple.VoiceMemos"));

  return v1;
}

id RCLegacyRecordingsDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = CFSTR("Library");
  v6[2] = CFSTR("Recordings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id RCLibraryRecordingsDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = CFSTR("Media");
  v6[2] = CFSTR("Recordings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id RCStockRecordingsURL()
{
  void *v0;
  void *v1;
  void *v2;

  RCLibraryRecordingsDirectoryURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("StockRecordings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id RCLogsDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = CFSTR("Library");
  v6[2] = CFSTR("Logs");
  v6[3] = CFSTR("com.apple.voicememos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void RCDispatchNoSoonerThan(void *a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  NSObject *queue;

  queue = a2;
  v5 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v7 - v8;
  if (v9 <= 0.0)
  {
    dispatch_async(queue, v5);
  }
  else
  {
    v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_after(v10, queue, v5);
  }

}

id RCComputeFileDigest(void *a1, uint64_t a2, void *a3)
{
  id v5;
  unsigned int (**v6)(id, id, void *);
  void *v7;
  id v8;
  void *v9;
  id v10;
  unsigned __int8 *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v5 = a1;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  if (v6 && v6[2](v6, v5, v7))
  {
    v8 = v7;
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x8810000000;
    v24 = &unk_1BD87DC11;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 1, a2);
    if (v9)
    {
      CC_SHA256_Init((CC_SHA256_CTX *)(v22 + 4));
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __RCComputeFileDigest_block_invoke;
      v20[3] = &unk_1E769CA90;
      v20[4] = &v21;
      objc_msgSend(v9, "enumerateByteRangesUsingBlock:", v20);
      v10 = objc_retainAutorelease(v7);
      v11 = (unsigned __int8 *)objc_msgSend(v10, "mutableBytes");
      CC_SHA256_Final(v11, (CC_SHA256_CTX *)(v22 + 4));
      v8 = v10;
    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        RCComputeFileDigest_cold_1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

      v8 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }

  return v8;
}

void sub_1BD852A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RCIsBeingDebugged()
{
  return 0;
}

uint64_t RCDebugAssertsDisabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("RCDebugAssertsDisabled"));

  return v1;
}

uint64_t RCTestEditInTrimSheetAllowedGetDefaultOption()
{
  return _RCTestEditInTrimSheetAllowedDefaultOption;
}

void RCTestEditInTrimSheetAllowedSetDefaultOption(uint64_t a1)
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  if (_RCTestEditInTrimSheetAllowed)
    _RCTestEditInTrimSheetAllowedDefaultOption = a1;
}

uint64_t RCTestEditInTrimSheetAllowed()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestEditInTrimSheetAllowed;
}

double RCTestSlowMessageExportSeconds()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return *(double *)&_RCTestSlowMessageExportSeconds;
}

uint64_t RCTestAlwaysShowLockScreenPlugin()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestAlwaysShowLockScreenPlugin;
}

uint64_t RCTestResetSyncs()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestResetSyncs;
}

uint64_t RCTestResetSyncsAlwaysResetSync()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestResetSyncsAlwaysResetSync;
}

double RCTestBeginPreviewDelay()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return *(double *)&_RCTestBeginPreviewDelay;
}

double RCTestAudioTrimmingProgressWithDuration()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return *(double *)&_RCTestAudioTrimmingProgressWithDuration;
}

uint64_t RCTestAutoSelectedRecordingIndex()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestAutoSelectedRecordingIndex;
}

uint64_t RCTestRunningAutomatedUITests()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestRunningAutomatedUITests;
}

double RCTestResetNavigationStateThresholdSeconds()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return *(double *)&_RCTestResetNavigationStateThresholdSeconds;
}

uint64_t RCTestDebugAutolayout_Show()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestDebugAutolayout_Show;
}

uint64_t RCTestDebugAutolayout_Logging()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1)
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_170);
  return _RCTestDebugAutolayout_Logging;
}

uint64_t RCSupportsDebugAODLogs()
{
  void *v0;
  uint64_t v1;

  if (RCIsInternalInstall_onceToken != -1)
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_142);
  if (!RCIsInternalInstall_isInternalInstall)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("RCDebugAODLogs"));

  return v1;
}

uint64_t RCRunningInSavedRecordingDaemon()
{
  if (RCRunningInSavedRecordingDaemon_onceToken != -1)
    dispatch_once(&RCRunningInSavedRecordingDaemon_onceToken, &__block_literal_global_139);
  return RCRunningInSavedRecordingDaemon_runningInDaemon;
}

id RCLocalizationNotNeeded(void *a1)
{
  return a1;
}

void RCRegisterForFirstUnlockSinceBootCallback(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;
  int out_token;

  v1 = a1;
  out_token = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __RCRegisterForFirstUnlockSinceBootCallback_block_invoke;
  v3[3] = &unk_1E769CAF8;
  v4 = v1;
  v2 = v1;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, MEMORY[0x1E0C80D38], v3);

}

void RCDebugNotification(const char *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  int out_token;

  v3 = a2;
  out_token = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __RCDebugNotification_block_invoke;
  v5[3] = &unk_1E769CAF8;
  v6 = v3;
  v4 = v3;
  notify_register_dispatch(a1, &out_token, MEMORY[0x1E0C80D38], v5);

}

uint64_t isNotNullAndNotNSNull(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0C99E38];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = objc_msgSend(v3, "isEqual:", v2);

  v4 = v1 ^ 1;
  return v4;
}

uint64_t RCUseDevelopmentContainer()
{
  if (RCUseDevelopmentContainer_onceToken != -1)
    dispatch_once(&RCUseDevelopmentContainer_onceToken, &__block_literal_global_148);
  return RCUseDevelopmentContainer_developmentContainerEnabled;
}

id RCNonUserGeneratedDeviceName()
{
  return (id)MGCopyAnswer();
}

id RCOperatingSystemVersionString()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "operatingSystemVersionString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id RCSupportDirectoryForDatabase(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@_SUPPORT"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t RCIsFileNotFoundError(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t found;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = v3;
  if (!v3)
  {
    found = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 4)
    {
      found = 1;
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    v9 = objc_msgSend(v4, "code") == 2;
  else
    v9 = 0;

  found = a2 | v9;
  if (a2 && !v9)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    found = RCIsFileNotFoundError(v11, 1);

  }
LABEL_13:

  return found;
}

double VMAudioWriteDelay()
{
  if (VMAudioWriteDelay_onceToken != -1)
    dispatch_once(&VMAudioWriteDelay_onceToken, &__block_literal_global_154);
  return *(double *)&VMAudioWriteDelay_writeDelay;
}

uint64_t RCStereoRecordingIsAvailable()
{
  if (RCStereoRecordingIsAvailable_onceToken != -1)
    dispatch_once(&RCStereoRecordingIsAvailable_onceToken, &__block_literal_global_157);
  return RCStereoRecordingIsAvailable_stereoRecordingAvailable;
}

uint64_t RCTranscriptionFeatureFlagIsEnabled()
{
  if (RCTranscriptionFeatureFlagIsEnabled_onceToken != -1)
    dispatch_once(&RCTranscriptionFeatureFlagIsEnabled_onceToken, &__block_literal_global_160);
  return RCTranscriptionFeatureFlagIsEnabled_transcriptionEnabled;
}

uint64_t RCSaveAsNewFeatureFlagIsEnabled()
{
  if (RCSaveAsNewFeatureFlagIsEnabled_onceToken != -1)
    dispatch_once(&RCSaveAsNewFeatureFlagIsEnabled_onceToken, &__block_literal_global_163);
  return RCSaveAsNewFeatureFlagIsEnabled_saveAsNewEnabled;
}

uint64_t RCCatchTranscriptionDecodingError()
{
  void *v0;
  uint64_t v1;

  if (RCIsInternalInstall_onceToken != -1)
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_142);
  if (!RCIsInternalInstall_isInternalInstall)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("RCCatchTranscriptionDecodingError"));

  return v1;
}

uint64_t ____locStringInt1W_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)__locStringInt1W_paddedNumberFormatter;
  __locStringInt1W_paddedNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)__locStringInt1W_paddedNumberFormatter, "setMinimumIntegerDigits:", 1);
}

uint64_t ____locStringInt2W_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)__locStringInt2W_paddedNumberFormatter;
  __locStringInt2W_paddedNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)__locStringInt2W_paddedNumberFormatter, "setMinimumIntegerDigits:", 2);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id RCDisplayStringForString(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (RCDisplayStringForString_onceToken != -1)
    dispatch_once(&RCDisplayStringForString_onceToken, &__block_literal_global_7);
  if (RCDisplayStringForString_doubleStrings)
  {
    objc_msgSend(v1, "stringByAppendingString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("@"), &stru_1E769F848, 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    v3 = v1;
  }

  return v3;
}

id computeAudioDigest(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  _QWORD *v3;
  id v4;
  const char *v5;
  void *v6;
  OSStatus v7;
  OSStatus v8;
  SInt64 v9;
  OSStatus v10;
  const char *v11;
  UInt32 ioNumBytes;
  CC_SHA256_CTX c;
  AudioFileID outAudioFile;
  unsigned __int8 value[32];
  _BYTE outBuffer[8192];
  uint64_t v18;

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(v1);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  if (audioDigestAttribute_onceToken != -1)
    dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
  if (getxattr(v5, (const char *)audioDigestAttribute__audioDigestAttribute, value, 0x20uLL, 0, 0) == 32)
    goto LABEL_4;
  outAudioFile = 0;
  v7 = AudioFileOpenURL((CFURLRef)v4, kAudioFileReadPermission, 0x6D346166u, &outAudioFile);
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    ioNumBytes = 0x2000;
    v8 = AudioFileReadBytes(outAudioFile, 0, 0, &ioNumBytes, outBuffer);
    if (!v8)
    {
      v9 = 0;
      do
      {
        CC_SHA256_Update(&c, outBuffer, ioNumBytes);
        v9 += ioNumBytes;
        ioNumBytes = 0x2000;
        v10 = AudioFileReadBytes(outAudioFile, 0, v9, &ioNumBytes, outBuffer);
      }
      while (!v10);
      v8 = v10;
    }
    AudioFileClose(outAudioFile);
    if (v8 == -39)
    {
      CC_SHA256_Final(value, &c);
      v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
      if (audioDigestAttribute_onceToken != -1)
        dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
      setxattr(v11, (const char *)audioDigestAttribute__audioDigestAttribute, value, 0x20uLL, 0, 0);
LABEL_4:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", value, 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
    v6 = 0;
    *v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_18:

  return v6;
}

uint64_t isAudioFilePurgeable(void *a1)
{
  const char *v1;
  _BOOL4 v2;
  uint64_t value;

  value = 0;
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  if (audioFileFlagsAttribute_onceToken != -1)
    dispatch_once(&audioFileFlagsAttribute_onceToken, &__block_literal_global_182);
  v2 = getxattr(v1, (const char *)audioFileFlagsAttribute__audioFileFlagsAttribute, &value, 8uLL, 0, 0) == 8;
  return v2 & value;
}

char *__audioDigestAttribute_block_invoke()
{
  char *result;

  result = xattr_name_with_flags("com.apple.voicememos.audioDigest", 2uLL);
  audioDigestAttribute__audioDigestAttribute = (uint64_t)result;
  return result;
}

char *__audioFileFlagsAttribute_block_invoke()
{
  char *result;

  result = xattr_name_with_flags("com.apple.voicememos.audioFlags", 4uLL);
  audioFileFlagsAttribute__audioFileFlagsAttribute = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t RCShouldAssertWarnings()
{
  uint64_t result;

  result = RCIsInternalInstall();
  if ((_DWORD)result)
    return RCDebugAssertsDisabled() ^ 1;
  return result;
}

void sub_1BD856F78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD857004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD8571AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD8573C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1BD8574A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD85751C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD8576B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD857840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD857980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1BD8579B4()
{
  JUMPOUT(0x1BD8579A8);
}

void sub_1BD857A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD857AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD857C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD857CE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD857DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD857EC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BD857F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1BD858008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD858168(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BD858214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1BD85832C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1BD858490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BD858598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD8586C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BD858768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1BD8587FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1BD858890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1BD858910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;
  void *v11;

  v11 = v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BD858C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PowerMeter::Reset(PowerMeter *this)
{
  double result;

  *(double *)((char *)&this->mMaxPeak + 6) = 0.0;
  this->mMaxPeak = 0.0;
  *(_QWORD *)&result = 0xFFFFFFFFLL;
  *(_QWORD *)&this->mPrevBlockSize = 0xFFFFFFFFLL;
  return result;
}

void PowerMeter::PowerMeter(PowerMeter *this)
{
  this->mSampleRate = 0.0;
  this->mPeakDecay = 0.006;
  this->mDecay = 0.016;
  this->mMaxPeak = 0.0;
  *(double *)((char *)&this->mMaxPeak + 6) = 0.0;
  *(_QWORD *)&this->mPrevBlockSize = 0xFFFFFFFFLL;
}

void PowerMeter::SetSampleRate(PowerMeter *this, double a2)
{
  double v4;
  double v5;
  BOOL v6;
  long double v7;

  this->mSampleRate = a2;
  v4 = a2 * 2.5;
  v5 = 0.0;
  v6 = a2 * 2.5 < 0.00001;
  v7 = 0.0;
  if (!v6)
    v7 = exp(-6.90775528 / v4);
  this->mPeakDecay1 = v7;
  if (a2 * 1.24 >= 0.00001)
    v5 = exp(-6.90775528 / (a2 * 1.24));
  this->mDecay1 = v5;
}

void PowerMeter::Process(PowerMeter *this, float *a2, int a3, int a4)
{
  float *v6;
  float v8;
  int v9;
  int v10;
  float v11;
  double mMaxPeak;
  double v13;
  float v15;
  int v16;
  float *v17;

  v6 = a2;
  v17 = a2;
  v15 = 0.0;
  v16 = a4;
  v8 = 0.0;
  v9 = a4;
  if ((a2 & 0xF) == 0)
  {
    PowerMeter::ProcessVector(this, (const float **)&v17, &v16, &v15);
    v9 = v16;
    v8 = v15;
  }
  if (v9 >= 1)
  {
    v10 = v9 + 1;
    do
    {
      v11 = *v6;
      if (*v6 < 0.0)
        v11 = -*v6;
      if (v11 > v8)
        v8 = v11;
      --v10;
      v6 += a3;
    }
    while (v10 > 1);
  }
  if (v8 > this->mClipping.peakValueSinceLastCall)
    this->mClipping.peakValueSinceLastCall = v8;
  this->mPeakHoldCount += a4;
  mMaxPeak = v8;
  if (this->mMaxPeak > mMaxPeak)
    mMaxPeak = this->mMaxPeak;
  v13 = fabs(mMaxPeak);
  if (v13 >= 1.0e15 || v13 <= 1.0e-15)
    mMaxPeak = 0.0;
  this->mMaxPeak = mMaxPeak;
}

void PowerMeter::ProcessVector(PowerMeter *this, const float **a2, int *a3, float *__C)
{
  int v6;
  const float *v7;
  int v8;
  int v9;
  float __B[16];
  float __Ca[16];
  float __D[16];
  _OWORD v13[4];
  _OWORD __A[4];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(__A, 0, sizeof(__A));
  v13[0] = xmmword_1BD874030;
  v13[1] = unk_1BD874040;
  v13[2] = xmmword_1BD874050;
  v13[3] = unk_1BD874060;
  v6 = *a3;
  if ((*a3 + 15) >= 0x1F)
  {
    v7 = *a2;
    if (v6 < 0)
      v6 = *a3 + 15;
    v8 = v6 >> 4;
    do
    {
      --v8;
      vDSP_vsq(v7, 1, __Ca, 1, 4uLL);
      vDSP_vabs(v7, 1, __B, 1, 4uLL);
      vDSP_vmax((const float *)__A, 1, __B, 1, (float *)__A, 1, 4uLL);
      vDSP_vma(__Ca, 1, (const float *)v13, 1, __D, 1, __D, 1, 4uLL);
      v7 += 16;
    }
    while (v8);
  }
  vDSP_maxv((const float *)__A, 1, __C, 0x10uLL);
  v9 = *a3 & 0xF;
  if (*a3 <= 0)
    v9 = -(-*a3 & 0xF);
  *a3 = v9;
}

void sub_1BD85A2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85B3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BD85B920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1BD85BE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85C1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BD85C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BD85CB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BD85CFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85D21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85E5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD85E8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location,char a29)
{
  id *v29;
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BD85E9EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BD85EFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD85FAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

BOOL checkAudioFormat(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (!a1 && a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8A2F8], -11828, a2);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1 != 0;
}

uint64_t _predicateOperatorTypeForSearchOption(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 3)
    return qword_1BD874088[a1];
  OSLogForCategory(CFSTR("Default"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _predicateOperatorTypeForSearchOption_cold_1();

  return 4;
}

uint64_t _predicateOptionsForSearchOption(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 3)
    return qword_1BD8740A0[a1];
  OSLogForCategory(CFSTR("Default"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _predicateOptionsForSearchOption_cold_1();

  return 0;
}

id SharedFlagsBitwiseAndCompoundPredicate(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil && bitwiseAnd:with:(%K, %@) == %@"), CFSTR("sharedFlags"), CFSTR("sharedFlags"), v1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1BD862304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *RCSavedRecordingsCloudKitContainerIdentifier()
{
  if (RCUseDevelopmentContainer())
    return CFSTR("com.apple.VoiceMemosDevelopmentContainer");
  else
    return CFSTR("com.apple.VoiceMemosContainer");
}

uint64_t RCDecodeFail(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.SerializationErrorDomain"), a1, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

void sub_1BD8631DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8638EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

id RCSearchableItemForRecording(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "URIRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCCloudRecording searchableItemIdentifierForSavedRecordingURI:](RCCloudRecording, "searchableItemIdentifierForSavedRecordingURI:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CA6B50]);
  v5 = (void *)objc_msgSend(v4, "initWithContentType:", *MEMORY[0x1E0CEC450]);
  objc_msgSend(v1, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v6);

  objc_msgSend(v1, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentCreationDate:", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "length");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", v9);

  v10 = v1;
  if (RCTranscriptionFeatureFlagIsEnabled()
    && (+[RCAppGroupStorage sharedInstance](RCAppGroupStorage, "sharedInstance"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "transcriptionIsSupported"),
        v11,
        v12))
  {
    objc_msgSend(v10, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rc_transcriptionData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        *(_QWORD *)buf = 0;
        +[TranscriptionDecoder decodeTransciptionData:error:](TranscriptionDecoder, "decodeTransciptionData:error:", v16, buf);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(id *)buf;
        if (!v14)
        {
          OSLogForCategory(CFSTR("Service"));
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            RCSearchableItemForRecording_cold_1((uint64_t)v17, v18);

        }
      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v5, "setTextContent:", v14);
  v19 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RECORDING_SEARCH_KEYWORD_RECORDING"), &stru_1E769F848, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeywords:", v22);

  objc_msgSend(v10, "length");
  RCLocalizedDuration(round(v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3940];
  RCLocalizedFrameworkString(CFSTR("RECORDING_ENTITY_DISPLAY_REPRESENTATION_DURATION %@"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringWithFormat:", v26, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0CB3940];
  RCLocalizedFrameworkString(CFSTR("SPOTLIGHT_RECORDING_ENTITY_NAME %lu"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringWithFormat:", v29, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v31 && v30 && v32)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v34 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
    v43 = getLNSpotlightAppEntityMapperClass_softClass;
    if (!getLNSpotlightAppEntityMapperClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLNSpotlightAppEntityMapperClass_block_invoke;
      v45 = &unk_1E769D788;
      v46 = &v40;
      __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)buf);
      v34 = (void *)v41[3];
    }
    v35 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v40, 8);
    objc_msgSend(v35, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:", v5, v31, CFSTR("RCRecordingEntity"), v33, v27, 0, v30, 0, 0, &unk_1E76A9698, v40);
  }
  OSLogForCategory(CFSTR("Service"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "debugDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "RCSearchableItemForRecording";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    _os_log_impl(&dword_1BD830000, v36, OS_LOG_TYPE_INFO, "%s -- created searchable item attributes = %@", buf, 0x16u);

  }
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v3, 0, v5);

  return v38;
}

void sub_1BD864B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLNSpotlightAppEntityMapperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E769D7A8;
    v5 = 0;
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LinkServicesLibraryCore_frameworkLibrary)
    __getLNSpotlightAppEntityMapperClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LNSpotlightAppEntityMapper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLNSpotlightAppEntityMapperClass_block_invoke_cold_2();
  getLNSpotlightAppEntityMapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BD865A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id appendMDItem(void *a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0C8B278];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = a1;
  v12 = objc_alloc_init(v7);
  objc_msgSend(v12, "setKeySpace:", v10);
  objc_msgSend(v12, "setKey:", v9);
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIdentifier:", v13);
  objc_msgSend(v12, "setValue:", v8);

  objc_msgSend(v11, "addObject:", v12);
  return v12;
}

BOOL _RCCleanUpURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  char v13;
  int v14;

  v3 = a1;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v13);

  if (!v6)
  {
    v10 = 1;
    goto LABEL_9;
  }
  if (!v13)
  {
    v11 = v3;
LABEL_8:
    v10 = _RCMarkAsPurgeable(v11, a2);
    goto LABEL_9;
  }
  v7 = v3;
  v14 = 0;
  v8 = objc_retainAutorelease(v7);
  if (!fsctl((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0x80084A02uLL, &v14, 0))
  {

    v11 = v8;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set APFSIOC_MAINTAIN_DIR_STATS - %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _RCPosixErnnoError(v9, a2);

  v10 = 0;
LABEL_9:

  return v10;
}

BOOL _RCMarkAsPurgeable(void *a1, _QWORD *a2)
{
  id v3;
  int v4;
  void *v5;
  int v7;

  v7 = 66053;
  v3 = objc_retainAutorelease(a1);
  v4 = fsctl((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0xC0084A44uLL, &v7, 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set APFSIOC_MARK_PURGEABLE - %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _RCPosixErnnoError(v5, a2);

  }
  return v4 == 0;
}

void _RCPosixErnnoError(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v9[0] = *MEMORY[0x1E0CB3388];
    v4 = *MEMORY[0x1E0CB2FE0];
    v5 = a1;
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, *__error(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = *MEMORY[0x1E0CB2D50];
    v10[0] = v6;
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.ErrorDomain"), -1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *a2 = v8;
  }
}

id firstStringValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __firstStringValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __firstDateValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dateValue");
}

uint64_t __firstNumberValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "numberValue");
}

uint64_t __firstDataValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataValue");
}

void sub_1BD869364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RCAvailableDiskSpaceForRecording_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD830000, a1, a3, "%s -- ERROR: Couldn't get free space information from statfs.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RCAvailableDiskSpaceForRecording_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD830000, a1, a3, "%s -- ERROR: Failed to get disk usage from MobileGestalt.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RCAvailableDiskSpaceForRecording_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD830000, a1, a3, "%s -- ERROR: Couldn't get free space information from MobileGestalt.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RCHasEnoughDiskSpaceToRecord_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, a2, a3, "%s -- ERROR: Not enough space to record a memo. Available space is %lli.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RCComputeFileDigest_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, a2, a3, "%s -- ERROR: unable load data for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void _predicateOperatorTypeForSearchOption_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD830000, v0, v1, "%s -- %d is out of the valid range for RCPredicateSearchOption", v2, v3, v4, v5, 2u);
}

void _predicateOptionsForSearchOption_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD830000, v0, v1, "%s -- %d is out of the valid range for RCPredicateSearchOption", v2, v3, v4, v5, 2u);
}

void RCSearchableItemForRecording_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "RCTranscriptionForRecording";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to decode transcription, error = %@", (uint8_t *)&v2, 0x16u);
}

void __getLNSpotlightAppEntityMapperClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LinkServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RCSavedRecording+SpotlightAdditions.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLNSpotlightAppEntityMapperClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLNSpotlightAppEntityMapperClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RCSavedRecording+SpotlightAdditions.m"), 27, CFSTR("Unable to find class %s"), "LNSpotlightAppEntityMapper");

  __break(1u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1E0C91F28](inAudioFile);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1E0C91F60](inFileRef, inPermissions, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadBytes(AudioFileID inAudioFile, Boolean inUseCache, SInt64 inStartingByte, UInt32 *ioNumBytes, void *outBuffer)
{
  return MEMORY[0x1E0C91F70](inAudioFile, inUseCache, inStartingByte, ioNumBytes, outBuffer);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1E0C98468](allocator, tmplate, options, locale);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EA80](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EAE8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EF98](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, blockBufferOut);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x1E0C9F078](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, bufferList);
}

OSStatus CMSampleBufferSetDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F088](sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
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

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1E0DB0FC8]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x1E0DB1038]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E769B310(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E769B318(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
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

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
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

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1B0](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6A0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmax(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6C0](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C920](__A, __IA, __C, __IC, __N);
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x1E0C85D60](a1, a2);
}

