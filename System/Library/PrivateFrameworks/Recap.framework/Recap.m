id _RCPActiveScreens()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  objc_msgSend(MEMORY[0x1E0CD2728], "displays");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v0, "count"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___RCPActiveScreens_block_invoke;
  v3[3] = &unk_1E4FC2040;
  v3[4] = &v4;
  objc_msgSend(v0, "enumerateObjectsUsingBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A5E86878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RCPTimeIntervalFromMachTimestamp(unint64_t a1)
{
  if (machDurationOfSecond_once != -1)
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  return (double)a1 / *(double *)&machDurationOfSecond_duration;
}

id RCPLogPlayback()
{
  if (RCPLogPlayback_onceToken != -1)
    dispatch_once(&RCPLogPlayback_onceToken, &__block_literal_global_4);
  return (id)RCPLogPlayback___logObj;
}

uint64_t _RCPIsAllowlistedProperty(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = _RCPIsAllowlistedProperty_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_RCPIsAllowlistedProperty_onceToken, &__block_literal_global_167);
  v3 = objc_msgSend((id)_RCPIsAllowlistedProperty_propertyNames, "containsObject:", v2);

  return v3;
}

id _RCPVirtualHIDServiceQueue()
{
  if (_RCPVirtualHIDServiceQueue_onceToken != -1)
    dispatch_once(&_RCPVirtualHIDServiceQueue_onceToken, &__block_literal_global_1);
  return (id)_RCPVirtualHIDServiceQueue_queue;
}

void sub_1A5E8C088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSOrientationObserverClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getFBSOrientationObserverClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("FBSOrientationObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getFBSOrientationObserverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

double RCPTimeIntervalFromMachDuration(uint64_t a1)
{
  if (machDurationOfSecond_once != -1)
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  return (double)a1 / *(double *)&machDurationOfSecond_duration;
}

unint64_t RCPMachTimestampFromTimeInterval(double a1)
{
  if (a1 < 0.0)
    RCPMachTimestampFromTimeInterval_cold_1();
  if (machDurationOfSecond_once != -1)
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  return (unint64_t)(*(double *)&machDurationOfSecond_duration * a1);
}

uint64_t RCPMachDurationFromTimeInterval(double a1)
{
  if (machDurationOfSecond_once != -1)
    dispatch_once(&machDurationOfSecond_once, &__block_literal_global_0);
  return (uint64_t)(*(double *)&machDurationOfSecond_duration * a1);
}

double __machDurationOfSecond_block_invoke()
{
  unint64_t v0;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  result = (double)(1000000000 * (unint64_t)info.denom) / (double)v0;
  *(double *)&machDurationOfSecond_duration = result;
  return result;
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

uint64_t signal_handler(uint64_t a1)
{
  return objc_msgSend((id)s_sharedTool, "handleSignal:", a1);
}

uint64_t _updateEventPhase(void *a1)
{
  const __CFArray *Children;
  const __CFArray *v2;

  objc_msgSend(a1, "hidEvent");
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    v2 = Children;
    if (CFArrayGetCount(Children) >= 1)
      CFArrayGetValueAtIndex(v2, 0);
  }
  return IOHIDEventSetPhase();
}

uint64_t RCPSetNonDecayingThreadPriority(int a1)
{
  _opaque_pthread_t *v2;
  uint64_t v3;
  thread_act_t v4;
  uint64_t result;
  thread_act_t v6;
  integer_t v7;
  int v8;
  sched_param v9;

  v9 = 0;
  v8 = 0;
  v2 = pthread_self();
  pthread_getschedparam(v2, &v8, &v9);
  if (v9.sched_priority < a1)
    v9.sched_priority = a1;
  v3 = pthread_setschedparam(v2, v8, &v9);
  v7 = 0;
  v4 = MEMORY[0x1A85B7498](v3);
  thread_policy_set(v4, 1u, &v7, 1u);
  result = proc_setthread_cpupercent();
  if ((_DWORD)result)
  {
    v7 = 1;
    v6 = MEMORY[0x1A85B7498](result);
    return thread_policy_set(v6, 1u, &v7, 1u);
  }
  return result;
}

void _RCPEventHIDEnumerateChildren(uint64_t a1, int a2, void *a3)
{
  void (**v4)(id, const void *, CFIndex, _BYTE *);
  const __CFArray *Children;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const void *ValueAtIndex;
  BOOL v11;
  char v12;

  v4 = a3;
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    v6 = Children;
    Count = CFArrayGetCount(Children);
    v12 = 0;
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 0;
      do
      {
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
          if (!a2 || IOHIDEventGetType() == a2)
            break;
          if (++v9 >= v8)
            goto LABEL_12;
        }
        v4[2](v4, ValueAtIndex, v9++, &v12);
        if (v12)
          v11 = 0;
        else
          v11 = v9 < v8;
      }
      while (v11);
    }
  }
LABEL_12:

}

uint64_t _RCPEventHIDDigitizerEventCountOfTouchingContacts(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (IOHIDEventGetType() == 11)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___RCPEventHIDDigitizerEventCountOfTouchingContacts_block_invoke;
    v4[3] = &unk_1E4FC2170;
    v4[4] = &v5;
    _RCPEventHIDEnumerateChildren(a1, 11, v4);
  }
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A5E8DF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RCPHIDEventMatchingPredicate(uint64_t a1, void *a2)
{
  return _RCPHIDEventMatchingPredicateCore(a1, 0, a2);
}

uint64_t _RCPHIDEventMatchingPredicateCore(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a1 && ((*((uint64_t (**)(id, uint64_t, uint64_t))v5 + 2))(v5, a1, a2) & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    IOHIDEventGetChildren();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = a2 + 1;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v13 = _RCPHIDEventMatchingPredicateCore(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v11, v6);
          if (v13)
          {
            a1 = v13;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    a1 = 0;
LABEL_13:

  }
  return a1;
}

uint64_t RCPHIDEventTransformLocation(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4[1] = 3221225472;
  v2 = a2[1];
  v5 = *a2;
  v6 = v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __RCPHIDEventTransformLocation_block_invoke;
  v4[3] = &__block_descriptor_88_e26_B24__0____IOHIDEvent__8q16l;
  v4[4] = a1;
  v7 = a2[2];
  return _RCPHIDEventMatchingPredicateCore(a1, 0, v4);
}

double DKDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MidY;
  double v17;
  CGFloat v18;
  double result;
  double MidX;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  MidY = CGRectGetMidY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  v17 = CGRectGetMidX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  v18 = MidY - CGRectGetMidY(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v25, MidX - v17, v18);
  return result;
}

double DKDRectWithSize()
{
  return 0.0;
}

void sub_1A5E900E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
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

Class __getFBSOrientationObserverClass_block_invoke_0(uint64_t a1)
{
  Class result;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
  {
    FrontBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_6:
      __getFBSOrientationObserverClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("FBSOrientationObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getFBSOrientationObserverClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id RCPLogWorkarounds()
{
  if (RCPLogWorkarounds_onceToken != -1)
    dispatch_once(&RCPLogWorkarounds_onceToken, &__block_literal_global_3);
  return (id)RCPLogWorkarounds___logObj;
}

id RCPCGImageBackedImageFromImage(void *a1)
{
  id v1;
  const void *v2;
  id v3;
  double v4;
  id v5;

  v1 = a1;
  if (objc_msgSend(v1, "ioSurface"))
  {
    v2 = (const void *)_UICreateCGImageFromIOSurfaceWithOptions();
    v3 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v1, "scale");
    v5 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);
    CFRelease(v2);
  }
  else
  {
    v5 = v1;
  }

  return v5;
}

void sub_1A5E938C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A5E957E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1A5E964C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5E98BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ioHIDEventCallback(void *a1, int a2, const void *a3, CFTypeRef cf)
{
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t SenderID;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  CFTypeRef v21;
  uint64_t v22;

  CFRetain(cf);
  v7 = mach_absolute_time();
  v8 = a1;
  v9 = v8;
  if (!a3)
    goto LABEL_10;
  if (!objc_msgSend(v8, "shouldRecordSenderProperties"))
    goto LABEL_10;
  v10 = CFGetTypeID(a3);
  if (v10 != IOHIDServiceClientGetTypeID())
    goto LABEL_10;
  if (!_ioHIDEventCallback_sSenderPropertiesBySenderID)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (void *)_ioHIDEventCallback_sSenderPropertiesBySenderID;
    _ioHIDEventCallback_sSenderPropertiesBySenderID = (uint64_t)v11;

  }
  SenderID = IOHIDEventGetSenderID();
  if (SenderID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SenderID);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_ioHIDEventCallback_sSenderPropertiesBySenderID, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[RCPEventSenderProperties senderFromIOHIDService:](RCPEventSenderProperties, "senderFromIOHIDService:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_ioHIDEventCallback_sSenderPropertiesBySenderID, "setObject:forKeyedSubscript:", v15, v14);
    }

  }
  else
  {
LABEL_10:
    v15 = 0;
  }
  if (v9[25])
  {
    v9[25] = 0;
    v16 = objc_msgSend(v9, "_initialLocationEvent");
  }
  else
  {
    v16 = 0;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___ioHIDEventCallback_block_invoke;
  v18[3] = &unk_1E4FC25B8;
  v19 = v15;
  v20 = v16;
  v21 = cf;
  v22 = v7;
  v17 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void ___ioHIDEventCallback_block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  unint64_t v8;
  FILE **v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CFStringRef v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int *v22;
  __CFString *v23;
  id v24;
  const void *v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[RCPRecorder sharedRecorder](RCPRecorder, "sharedRecorder");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[2];

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v7 = &_CLTLogLevel;
    v8 = 0x1E4FC1000uLL;
    v26 = a1;
    v9 = (FILE **)MEMORY[0x1E0C80C20];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "config");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "ignoreSenderProperties");

        v14 = 0;
        v15 = *(void **)(a1 + 32);
        if (v15 && (v13 & 1) == 0)
          v14 = v15;
        if (*(_QWORD *)(a1 + 40))
          objc_msgSend(v11, "setStartLocationEvent:");
        objc_msgSend(*(id *)(v8 + 2256), "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "enqueueEvent:", v16);
        if (*v7 >= 5)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = CFCopyDescription(*(CFTypeRef *)(a1 + 48));
          v19 = v5;
          v20 = v6;
          v21 = v8;
          v22 = v7;
          v23 = (__CFString *)v18;
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fputs((const char *)objc_msgSend(v24, "UTF8String"), *v9);

          v7 = v22;
          v8 = v21;
          v6 = v20;
          v5 = v19;
          a1 = v26;
          fflush(*v9);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  v25 = *(const void **)(a1 + 40);
  if (v25)
    CFRelease(v25);
  CFRelease(*(CFTypeRef *)(a1 + 48));

}

id RCPMediaTimingFunctionForInputType(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v6;
  void *v7;

  switch(a1)
  {
    case 1:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      goto LABEL_8;
    case 2:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      goto LABEL_9;
    case 3:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      LODWORD(a3) = 1056437569;
      LODWORD(a4) = 1026291025;
      LODWORD(a5) = 1057228128;
      LODWORD(a6) = 1064648875;
LABEL_10:
      objc_msgSend(v6, "functionWithControlPoints::::", a3, a4, a5, a6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
  }
  v6 = (void *)MEMORY[0x1E0CD27D0];
  if (!a2)
  {
LABEL_9:
    LODWORD(a3) = 1048980465;
    LODWORD(a4) = 1043842074;
    LODWORD(a5) = 1061297928;
    LODWORD(a6) = 1063511816;
    goto LABEL_10;
  }
LABEL_8:
  objc_msgSend(v6, "functionWithName:", *MEMORY[0x1E0CD3058]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

id RCPDataFromHexString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  char v12;
  unint64_t v13;
  int v14;
  unsigned int v15;
  char v16;
  char v17;
  char v19;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("#$ <>:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_1E4FC2788);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v5);
  if ((objc_msgSend(v7, "length") & 1) == 0 && v8 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v7, "length"))
  {
    v9 = 0;
    do
    {
      v10 = objc_msgSend(v7, "characterAtIndex:", v9);
      if ((v10 - 65) <= 5)
        v11 = v10 - 55;
      else
        v11 = 0;
      if ((v10 - 97) <= 5)
        v11 = v10 - 87;
      if ((v10 - 48) <= 9)
        v12 = v10 - 48;
      else
        v12 = v11;
      v13 = v9 + 1;
      v14 = objc_msgSend(v7, "characterAtIndex:", v13);
      v15 = v14 - 48;
      if ((v14 - 65) <= 5)
        v16 = v14 - 55;
      else
        v16 = 0;
      if ((v14 - 97) <= 5)
        v17 = v14 - 87;
      else
        v17 = v16;
      if (v15 > 9)
        LOBYTE(v15) = v17;
      v19 = v15 | (16 * v12);
      objc_msgSend(v2, "appendBytes:length:", &v19, 1);
      v9 = v13 + 1;
    }
    while (v9 < objc_msgSend(v7, "length"));
  }

  return v2;
}

void sub_1A5E99D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id parseCommandFromCLIArguments(void *a1, void *a2)
{
  id v3;
  CLIArguments *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  float v36;
  double v37;
  uint64_t v38;
  FILE *v39;
  id v40;
  const char *v41;
  id v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  FILE *v62;
  const char *v63;
  size_t v64;
  void *v65;
  int v66;
  void *v67;
  BOOL v68;
  void *v69;
  float v70;
  double v71;
  FILE *v72;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  float v80;
  float v81;
  void *v82;
  float v83;
  double v84;
  uint64_t v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  BOOL v90;
  void *v91;
  float v92;
  float v93;
  void *v94;
  double v95;
  float v96;
  double v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  BOOL v102;
  void *v103;
  float v104;
  float v105;
  void *v106;
  float v107;
  double v108;
  void *v109;
  int v110;
  void *v111;
  BOOL v112;
  void *v113;
  float v114;
  float v115;
  void *v116;
  float v117;
  double v118;
  void *v119;
  int v120;
  void *v121;
  BOOL v122;
  void *v123;
  void *v124;
  BOOL v125;
  void *v126;
  float v127;
  float v128;
  void *v129;
  float v130;
  float v131;
  void *v132;
  float v133;
  float v134;
  void *v135;
  float v136;
  float v137;
  void *v138;
  _BOOL4 v139;
  float v140;
  double v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  BOOL v146;
  void *v147;
  float v148;
  float v149;
  void *v150;
  float v151;
  float v152;
  void *v153;
  _BOOL4 v154;
  double v155;
  void *v156;
  float v157;
  void *v158;
  _BOOL4 v159;
  double v160;
  void *v161;
  float v162;
  void *v163;
  _BOOL4 v164;
  void *v165;
  void *v166;
  BOOL v167;
  void *v168;
  float v169;
  float v170;
  void *v171;
  float v172;
  float v173;
  void *v174;
  double v175;
  double v176;
  float v177;
  double v178;
  uint64_t v179;
  void *v180;
  int v181;
  void *v182;
  void *v183;
  BOOL v184;
  void *v185;
  float v186;
  float v187;
  uint64_t v188;
  float v189;
  float v190;
  void *v191;
  void *v192;
  float v193;
  float v194;
  void *v195;
  BOOL v196;
  void *v197;
  float v198;
  float v199;
  void *v200;
  BOOL v201;
  void *v202;
  float v203;
  float v204;
  void *v205;
  BOOL v206;
  void *v207;
  float v208;
  double v209;
  void *v210;
  int v211;
  void *v212;
  int v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  unsigned int v218;
  void *v219;
  int v220;
  void *v221;
  BOOL v222;
  void *v223;
  float v224;
  float v225;
  void *v226;
  float v227;
  float v228;
  void *v229;
  void *v230;
  _BOOL4 v231;
  void *v232;
  uint64_t v233;
  double v234;
  double v235;
  unint64_t i;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  unint64_t v242;
  void *v243;
  _BOOL4 v244;
  uint64_t v245;
  void *v246;
  int v247;
  void *v248;
  BOOL v249;
  void *v250;
  float v251;
  float v252;
  void *v253;
  float v254;
  float v255;
  double v256;
  double v257;
  void *v258;
  void *v259;
  BOOL v260;
  void *v261;
  float v262;
  uint64_t v263;
  uint64_t v264;
  FILE *v265;
  const char *v266;
  size_t v267;
  void *v268;
  int v269;
  void *v270;
  _BOOL4 v271;
  double v272;
  void *v273;
  double v274;
  void *v275;
  _BOOL4 v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  _BOOL4 v281;
  double v282;
  void *v283;
  double v284;
  void *v285;
  int v286;
  void *v287;
  int v288;
  void *v289;
  int v290;
  void *v291;
  int v292;
  void *v293;
  int v294;
  uint64_t v295;
  void *v296;
  int v297;
  void *v298;
  int v299;
  void *v300;
  BOOL v301;
  void *v302;
  void *v303;
  _BOOL4 v304;
  double v305;
  void *v306;
  float v307;
  void *v308;
  int v309;
  void *v310;
  double v311;
  double v312;
  uint64_t v313;
  void *v314;
  _BOOL4 v315;
  void *v316;
  float v317;
  void *v318;
  int v319;
  void *v320;
  int v321;
  void *v322;
  int v323;
  void *v324;
  int v325;
  void *v326;
  int v327;
  void *v328;
  _BOOL4 v329;
  void *v330;
  double v331;
  double v332;
  void *v333;
  void *v334;
  BOOL v335;
  void *v336;
  float v337;
  float v338;
  void *v339;
  float v340;
  float v341;
  void *v342;
  double v343;
  double v344;
  _BOOL4 v345;
  double v346;
  void *v347;
  float v348;
  void *v349;
  int v350;
  void *v351;
  void *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t j;
  uint64_t v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  _BOOL4 v361;
  void *v362;
  double v363;
  double v364;
  uint64_t v365;
  void *v366;
  void *v367;
  void *v368;
  id v369;
  id v370;
  void *v371;
  void *v372;
  uint64_t v373;
  void *v374;
  int v375;
  void *v376;
  void *v377;
  BOOL v378;
  void *v379;
  int v380;
  void *v381;
  BOOL v382;
  void *v383;
  double v384;
  double v385;
  void *v386;
  uint64_t v387;
  unsigned int v388;
  uint64_t v389;
  void *v390;
  void *v391;
  double v392;
  double v393;
  void *v394;
  float v395;
  double v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  id v403;
  void *v404;
  id v405;
  void *v406;
  void *v407;
  BOOL v408;
  void *v409;
  BOOL v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  int v415;
  void *v416;
  void *v417;
  BOOL v418;
  void *v419;
  float v420;
  float v421;
  void *v422;
  float v423;
  double v424;
  FILE *v425;
  const char *v426;
  size_t v427;
  double v428;
  void *v429;
  float v430;
  void *v431;
  int v432;
  void *v433;
  BOOL v434;
  void *v435;
  float v436;
  float v437;
  void *v438;
  uint64_t v439;
  double v440;
  uint64_t v441;
  void *v442;
  float v443;
  float v444;
  void *v445;
  float v446;
  double v447;
  double v448;
  void *v449;
  float v450;
  void *v451;
  int v452;
  void *v453;
  void *v454;
  BOOL v455;
  void *v456;
  float v457;
  float v458;
  void *v459;
  float v460;
  float v461;
  double v462;
  void *v463;
  float v464;
  float v465;
  void *v466;
  double v467;
  float v468;
  double v469;
  void *v470;
  void *v471;
  void *v472;
  int v473;
  void *v474;
  BOOL v475;
  void *v476;
  float v477;
  float v478;
  void *v479;
  float v480;
  float v481;
  double v482;
  void *v483;
  float v484;
  float v485;
  void *v486;
  double v487;
  float v488;
  double v489;
  _BOOL4 v490;
  _BOOL4 v491;
  double v492;
  double v493;
  void *v494;
  int v495;
  void *v496;
  BOOL v497;
  void *v498;
  int v499;
  void *v500;
  int v501;
  void *v502;
  uint64_t v503;
  void *v504;
  int v505;
  uint64_t v506;
  void *v507;
  int v508;
  void *v509;
  BOOL v510;
  void *v511;
  float v512;
  double v513;
  uint64_t v514;
  void *v515;
  int v516;
  void *v517;
  void *v518;
  BOOL v519;
  void *v520;
  float v521;
  float v522;
  void *v523;
  float v524;
  double v525;
  void *v526;
  void *v527;
  int v528;
  void *v529;
  BOOL v530;
  void *v531;
  float v532;
  double v533;
  FILE *v534;
  id v535;
  void *v536;
  _BOOL4 v537;
  void *v538;
  float v539;
  float v540;
  void *v541;
  double v542;
  _BOOL4 v543;
  void *v544;
  double v545;
  uint64_t v546;
  void *v547;
  id obj;
  id obja;
  void *v550;
  void *v551;
  CLIArguments *v552;
  id v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  _QWORD v558[4];
  id v559;
  id v560;
  id v561;
  _QWORD v562[5];
  uint64_t v563;
  uint64_t *v564;
  uint64_t v565;
  uint64_t v566;
  _BYTE v567[128];
  _QWORD v568[12];
  _QWORD v569[14];

  v569[12] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v553 = a2;
  v4 = objc_alloc_init(CLIArguments);
  v550 = v3;
  -[CLIArguments setArguments:](v4, "setArguments:", v3);
  v552 = v4;
  -[CLIArguments objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("sender"));

  if ((_DWORD)v3)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    if (v551)
    {
      if (propertiesForSenderString_onceToken != -1)
        dispatch_once(&propertiesForSenderString_onceToken, &__block_literal_global_682);
      v6 = (void *)propertiesForSenderString_propertyMap;
      objc_msgSend(v551, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pointerValue");

      if (v9)
      {
        +[RCPEventSenderProperties performSelector:](RCPEventSenderProperties, "performSelector:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v553, "setSenderProperties:", v10);
          v11 = 0;
LABEL_20:

          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

          goto LABEL_44;
        }
      }
      v27 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v551, "dataUsingEncoding:", 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v561 = 0;
      objc_msgSend(v27, "JSONObjectWithData:options:error:", v28, 0, &v561);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v561;

      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v10);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v553, "setSenderProperties:", v29);

          goto LABEL_20;
        }
        v72 = (FILE *)*MEMORY[0x1E0C80C10];
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v72, "JSON sender data didn't decode to dictionary (%s)\n", (const char *)objc_msgSend(v40, "UTF8String"));
      }
      else
      {
        v39 = (FILE *)*MEMORY[0x1E0C80C10];
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v41 = (const char *)objc_msgSend(v40, "UTF8String");
        objc_msgSend(v11, "description");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v39, "I don't recognize the sender value (%s) -- error:%s\n", v41, (const char *)objc_msgSend(v42, "UTF8String"));

      }
      v26 = 0;
      goto LABEL_43;
    }
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Please specify a value for argument \"%s\".\n", (const char *)objc_msgSend(CFSTR("sender"), "UTF8String"));
LABEL_37:
    v26 = 0;
    goto LABEL_44;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(":"));
  v551 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v551, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kbd"));

  if (v14)
  {
    if ((unint64_t)objc_msgSend(v551, "count") >= 2)
    {
      objc_msgSend(v551, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (isNumber(v15))
      {
        objc_msgSend(v551, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = isNegativeNumber(v16);

        if (!v17)
        {
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v551, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "integerValue"));
          obj = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v563 = 0;
          v564 = &v563;
          v565 = 0x2050000000;
          v44 = (void *)getTypistHWKeyboardClass_softClass;
          v566 = getTypistHWKeyboardClass_softClass;
          if (!getTypistHWKeyboardClass_softClass)
          {
            v562[0] = MEMORY[0x1E0C809B0];
            v562[1] = 3221225472;
            v562[2] = __getTypistHWKeyboardClass_block_invoke;
            v562[3] = &unk_1E4FC2000;
            v562[4] = &v563;
            __getTypistHWKeyboardClass_block_invoke((uint64_t)v562);
            v44 = (void *)v564[3];
          }
          v45 = objc_retainAutorelease(v44);
          _Block_object_dispose(&v563, 8);
          v46 = (void *)objc_msgSend([v45 alloc], "initWithLanguage:", obj);
          v47 = (void *)MEMORY[0x1E0CB36D8];
          objc_msgSend(v46, "getPropertyDictionaryString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "dataUsingEncoding:", 4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "JSONObjectWithData:options:error:", v49, 0, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "usagePairsForText:", v43);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v553, "setSenderProperties:", v51);
          objc_msgSend(v52, "usagePages");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "usages");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "usagePages");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count") == 0;

          if (!v56)
          {
            v57 = 0;
            do
            {
              objc_msgSend(v53, "objectAtIndex:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "objectAtIndex:", v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v553, "pressButtonsWithPages:usages:duration:", v58, v59, 0.12);

              objc_msgSend(v52, "usagePages");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "count");

              ++v57;
            }
            while (v57 < v61);
          }
          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    fwrite("No keyboard language provided. Defaulting to US English Keyboard.", 0x41uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    obj = &unk_1E4FCCA50;
    goto LABEL_29;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("tf"));

  if (v21)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = isNumber(v22);

    if (v23)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v553, "setTouchFrequency:", objc_msgSend(v24, "integerValue"));

      -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 2);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v26 = (void *)v25;
      goto LABEL_44;
    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a frequency in touches/sec.\n";
    v64 = 43;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("unicode"));

  if (v31)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      fwrite("Please specify a text to synthesize.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v26 = 0;
LABEL_53:

      goto LABEL_44;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = isNumber(v33);

    if (v34)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v37 = v36;

      v38 = 3;
    }
    else
    {
      v38 = 2;
      v37 = 0.1;
    }
    objc_msgSend(v553, "sendUnicodeString:synthesizePerCharacterEvents:durationBetweenEvents:", v32, 1, v37);
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v38);
    v85 = objc_claimAutoreleasedReturnValue();
LABEL_52:
    v26 = (void *)v85;
    goto LABEL_53;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("wait"));

  if (v66)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = isNumber(v67);

    if (v68)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "floatValue");
      v71 = v70;

      objc_msgSend(v553, "advanceTime:", v71);
      -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 2);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a duration to wait.\n";
    v64 = 35;
LABEL_36:
    fwrite(v63, v64, 1uLL, v62);
    goto LABEL_37;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("d"));

  if (v75)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v76))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = isNumber(v77);

      if (v78)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "floatValue");
        v81 = v80;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "floatValue");
        v84 = v83;

        objc_msgSend(v553, "doubleTap:", v81, v84);
        -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {

    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a start point for the double tap.\n";
LABEL_61:
    v64 = 49;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "isEqualToString:", CFSTR("qt"));

  if (v87)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v88))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = isNumber(v89);

      if (v90)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "floatValue");
        v93 = v92;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v93;
        objc_msgSend(v94, "floatValue");
        v97 = v96;

        objc_msgSend(v553, "touchDown:", v95, v97);
        objc_msgSend(v553, "advanceTime:", 0.000001);
        objc_msgSend(v553, "liftUp:", v95, v97);
        -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {

    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a start point for the quick tap.\n";
    v64 = 48;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("ttw"));

  if (v99)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v100))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = isNumber(v101);

      if (v102)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "floatValue");
        v105 = v104;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "floatValue");
        v108 = v107;

        objc_msgSend(v553, "tapToWakeAtPoint:", v105, v108);
        -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_138;
    }
    goto LABEL_137;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "isEqualToString:", CFSTR("edgeOrb"));

  if (v110)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v100))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = isNumber(v111);

      if (v112)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "floatValue");
        v115 = v114;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "floatValue");
        v118 = v117;

        objc_msgSend(v553, "edgeOrb:", v115, v118);
        -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_138;
    }
    goto LABEL_137;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "isEqualToString:", CFSTR("edgeOrbSwipe"));

  if (v120)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v100))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = isNumber(v121);

      if (v122)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        if (isNumber(v123))
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = isNumber(v124);

          if (v125)
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "floatValue");
            v128 = v127;
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "floatValue");
            v131 = v130;

            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "floatValue");
            v134 = v133;
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "floatValue");
            v137 = v136;

            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = isNumber(v138);
            if (v139)
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "floatValue");
              v141 = v140;
            }
            else
            {
              v141 = 0.5;
            }
            objc_msgSend(v553, "edgeOrbSwipe:withEndLocation:withDuration:", v128, v131, v134, v137, v141);
            if (v139)

            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (isNumber(v32))
              v264 = 6;
            else
              v264 = 5;
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v264);
            v85 = objc_claimAutoreleasedReturnValue();
            goto LABEL_52;
          }
        }
        else
        {

        }
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a end point for the swipe.\n";
        v64 = 42;
        goto LABEL_36;
      }
      goto LABEL_138;
    }
    goto LABEL_137;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "isEqualToString:", CFSTR("hvr"));

  if (v143)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v144))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = isNumber(v145);

      if (v146)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "floatValue");
        v149 = v148;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "floatValue");
        v152 = v151;

        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = isNumber(v153);

        v155 = 5.0;
        if (v154)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "floatValue");
          v155 = v157;

        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = isNumber(v158);

        v160 = 1.0;
        if (v159)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "floatValue");
          v160 = v162;

        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = isNumber(v163);

        if (v164)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 6);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          if (isNumber(v165))
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 7);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v167 = isNumber(v166);

            if (v167)
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v168, "floatValue");
              v170 = v169;

              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 6);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "floatValue");
              v173 = v172;

              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 7);
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = v170;
              v176 = v173;
              objc_msgSend(v174, "floatValue");
              v178 = v177;

              v179 = 8;
              goto LABEL_126;
            }
          }
          else
          {

          }
          v62 = (FILE *)*MEMORY[0x1E0C80C10];
          v63 = "Please specify a azimuth angle, altitude angle, and roll angle.\n";
          v64 = 64;
          goto LABEL_36;
        }
        v175 = 0.0;
        v176 = 0.785398163;
        v179 = 5;
        v178 = 0.0;
LABEL_126:
        objc_msgSend(v553, "hoverAtLocation:withDuration:withZPosition:withAltitudeAngle:withAzimuthAngle:withRollAngle:", v149, v152, v160, v155, v176, v175, v178);
        if (v154)
        {
          if (v159)
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v179);
          else
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 4);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        goto LABEL_371;
      }
    }
    else
    {

    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a start point for the hover.\n";
LABEL_100:
    v64 = 44;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(v180, "isEqualToString:", CFSTR("br"));

  if (v181)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v182))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = isNumber(v183);

      if (v184)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "floatValue");
        v187 = v186;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v188 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v188, "floatValue");
        v190 = v189;

        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v188) = isNumber(v191);

        if ((v188 & 1) != 0)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "floatValue");
          v194 = v193;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v196 = isNumber(v195);

          if (!v196)
          {
            v62 = (FILE *)*MEMORY[0x1E0C80C10];
            v63 = "Please specify an altitude angle for the barrel roll.\n";
            v64 = 54;
            goto LABEL_36;
          }
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "floatValue");
          v199 = v198;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          v201 = isNumber(v200);

          if (!v201)
          {
            v62 = (FILE *)*MEMORY[0x1E0C80C10];
            v63 = "Please specify an azimuth angle for the barrel roll.\n";
            v64 = 53;
            goto LABEL_36;
          }
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v202, "floatValue");
          v204 = v203;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 6);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          v206 = isNumber(v205);

          if (v206)
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 6);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "floatValue");
            v209 = v208;

            objc_msgSend(v553, "barrelRollAtLocation:withZPosition:withAltitudeAngle:withAzimuthAngle:withRollAngle:", v187, v190, v194, v199, v204, v209);
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 7);
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          v62 = (FILE *)*MEMORY[0x1E0C80C10];
          v63 = "Please specify a roll angle for the barrel roll.\n";
          goto LABEL_61;
        }
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a starting z position for the barrel roll.\n";
LABEL_141:
        v64 = 58;
        goto LABEL_36;
      }
    }
    else
    {

    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify a start point for the barrel roll.\n";
    v64 = 50;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = objc_msgSend(v210, "isEqualToString:", CFSTR("sq"));

  if (v211)
  {
    objc_msgSend(v553, "squeeze");
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 1);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = objc_msgSend(v212, "isEqualToString:", CFSTR("tbc"));

  if (v213)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v214)
    {
      v265 = (FILE *)*MEMORY[0x1E0C80C10];
      v266 = "Please specify a Tostada option 'c', 'i', 'e'.\n";
      v267 = 47;
      goto LABEL_152;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    if (v215)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = objc_msgSend(v216, "BOOLValue");

      v218 = 3;
    }
    else
    {
      v217 = 0;
      v218 = 2;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = isNumber(v270);

    v272 = 0.0;
    if (v271)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "doubleValue");
      v272 = v274;

      ++v218;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = isNumberIncludingNegatives(v275);

    v277 = 0.0;
    if (v276)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "doubleValue");
      v277 = v279;

      ++v218;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v281 = isNumber(v280);

    v282 = 0.5;
    if (v281)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "doubleValue");
      v282 = v284;

      ++v218;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v286 = objc_msgSend(v285, "isEqualToString:", CFSTR("c"));

    if (v286)
    {
      objc_msgSend(v553, "touchSensitiveButtonClickWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v272, v277);
    }
    else
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      v288 = objc_msgSend(v287, "isEqualToString:", CFSTR("i"));

      if (v288)
      {
        objc_msgSend(v553, "touchSensitiveButtonIntermediatePressWithDuration:withPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v282, v272, v277);
      }
      else
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        v290 = objc_msgSend(v289, "isEqualToString:", CFSTR("e"));

        if (v290)
        {
          objc_msgSend(v553, "touchSensitiveButtonIntermediatePressWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v272, v277);
          objc_msgSend(v553, "touchSensitiveButtonEngagedWithLiftWithDuration:withPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v282, v272, v277);
        }
        else
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          v294 = objc_msgSend(v293, "isEqualToString:", CFSTR("h"));

          if (v294)
          {
            objc_msgSend(v553, "touchSensitiveButtonHoldWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v272, v277);
            objc_msgSend(v553, "advanceTime:", v282);
            objc_msgSend(v553, "touchSensitiveButtonReleaseHoldWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", &unk_1E4FCCA20, &unk_1E4FCCA68, v217, v272, v277);
          }
        }
      }
    }
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v218);
    v295 = objc_claimAutoreleasedReturnValue();
LABEL_176:
    v26 = (void *)v295;
    goto LABEL_177;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = objc_msgSend(v219, "isEqualToString:", CFSTR("tt"));

  if (v220)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v100))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v222 = isNumber(v221);

      if (v222)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "floatValue");
        v225 = v224;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v226, "floatValue");
        v228 = v227;

        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        if (isNumber(v229))
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          v231 = isNumber(v230);

          if (v231)
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = objc_msgSend(v232, "integerValue");

            if (v233)
            {
              v234 = v225;
              v235 = v228;
              for (i = 1; i <= v242; ++i)
              {
                -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v553, "tapsNoLift:location:withNumberOfTouches:", 1, objc_msgSend(v237, "integerValue"), v234, v235);

                -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                if (isNumber(v238))
                {
                  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v239, "doubleValue");
                  objc_msgSend(v553, "advanceTime:");

                }
                else
                {
                  objc_msgSend(v553, "advanceTime:", 0.15);
                }

                -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v553, "liftUp:touchCount:", objc_msgSend(v240, "integerValue"), v234, v235);

                -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                v242 = objc_msgSend(v241, "integerValue");

              }
            }
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 5);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            v244 = isNumber(v243);

            if (v244)
              v245 = 6;
            else
              v245 = 5;
            goto LABEL_304;
          }
        }
        else
        {

        }
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a number of taps and a number of fingers to use for multi-finger tap\n";
        v64 = 84;
        goto LABEL_36;
      }
      goto LABEL_138;
    }
    goto LABEL_137;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = objc_msgSend(v246, "isEqualToString:", CFSTR("t"));

  if (v247)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNumber(v100))
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = isNumber(v248);

      if (v249)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v250, "floatValue");
        v252 = v251;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v253, "floatValue");
        v255 = v254;

        objc_msgSend(v553, "defaultRadius");
        v257 = v256;
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v253) = objc_msgSend(v258, "isEqualToString:", CFSTR("r"));

        if ((_DWORD)v253)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          v260 = isNumber(v259);

          if (!v260)
          {
            v62 = (FILE *)*MEMORY[0x1E0C80C10];
            v63 = "No valid radius specified following touch radius command.\n";
            goto LABEL_141;
          }
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v261, "floatValue");
          v257 = v262;

          v263 = 5;
        }
        else
        {
          v263 = 3;
        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        v304 = isNumber(v303);

        v305 = 0.0;
        if (v304)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v306, "floatValue");
          v305 = v307;

          ++v263;
        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v309 = objc_msgSend(v308, "isEqualToString:", CFSTR("peek"));

        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        v311 = v252;
        v312 = v255;
        v313 = objc_msgSend(v310, "isEqualToString:", CFSTR("pop"));

        if ((v309 | v313) != 1)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          v319 = objc_msgSend(v318, "isEqualToString:", CFSTR("d"));

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          v321 = objc_msgSend(v320, "isEqualToString:", CFSTR("f"));

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          v323 = objc_msgSend(v322, "isEqualToString:", CFSTR("s"));

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263);
          v324 = (void *)objc_claimAutoreleasedReturnValue();
          v325 = objc_msgSend(v324, "isEqualToString:", CFSTR("p"));

          if (((v319 | v321 | v323) & 1) == 0 && !v325)
          {
            if (v304)
              objc_msgSend(v553, "dragWithStartPoint:endPoint:duration:radius:", v311, v255, v311, v255, v305, v257);
            else
              objc_msgSend(v553, "tap:radius:", v311, v255, v257);
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v263);
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 1);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          if (isNumber(v333))
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 2);
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            v335 = isNumber(v334);

            if (v335)
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 1);
              v336 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v336, "floatValue");
              v338 = v337;
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 2);
              v339 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v339, "floatValue");
              v341 = v340;

              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 3);
              v342 = (void *)objc_claimAutoreleasedReturnValue();
              v343 = v338;
              v344 = v341;
              v345 = isNumber(v342);

              if (v319)
              {
                v346 = 1.0;
                if (v345)
                {
                  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 3);
                  v347 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v347, "floatValue");
                  v346 = v348;

                }
                objc_msgSend(v553, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:radius:", 1, v311, v312, v343, v344, v346, v305, v257);
              }
              else if (v321)
              {
                if (v345)
                {
                  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 3);
                  v394 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v394, "floatValue");
                  v396 = v395;

                }
                else
                {
                  v396 = 0.2;
                }
                objc_msgSend(v553, "sendFlickWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v396, v257);
              }
              else if (v323)
              {
                v428 = 1.0;
                if (v345)
                {
                  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 3);
                  v429 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v429, "floatValue");
                  v428 = v430;

                }
                objc_msgSend(v553, "pinchCloseWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v428, v257);
              }
              else if (v325)
              {
                v448 = 1.0;
                if (v345)
                {
                  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 3);
                  v449 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v449, "floatValue");
                  v448 = v450;

                }
                objc_msgSend(v553, "pinchOpenWithStartPoint:endPoint:duration:radius:", v311, v312, v343, v341, v448, v257);
              }
              if (v345)
                v245 = v263 + 4;
              else
                v245 = v263 + 3;
              goto LABEL_304;
            }
          }
          else
          {

          }
          v62 = (FILE *)*MEMORY[0x1E0C80C10];
          v63 = "Please specify start and end points for the touch.\n";
          goto LABEL_139;
        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 1);
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        v315 = isNumber(v314);

        if (v315)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v263 + 1);
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v316, "floatValue");
          objc_msgSend(v553, "peekAndPop:commit:duration:radius:", v313, v311, v255, v317, v257);

        }
        else
        {
          objc_msgSend(v553, "peekAndPop:commit:duration:radius:", v313, v311, v255, 1.0, v257);
        }
        if (v315)
          v245 = v263 + 2;
        else
          v245 = v263 + 1;
LABEL_304:
        -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v245);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_138:
      v62 = (FILE *)*MEMORY[0x1E0C80C10];
      v63 = "Please specify a start point for the tap or touch.\n";
LABEL_139:
      v64 = 51;
      goto LABEL_36;
    }
LABEL_137:

    goto LABEL_138;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v269 = objc_msgSend(v268, "isEqualToString:", CFSTR("mt"));

  if (v269)
  {
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    parseMultitouchCommandFromArgumentString(v32, v553);
    v85 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v292 = objc_msgSend(v291, "isEqualToString:", CFSTR("st"));

  if (v292)
  {
    objc_msgSend(v553, "setTransducerType:", 0);
    objc_msgSend(v553, "setTouchFrequency:", 240);
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    parseMultitouchCommandFromArgumentString(v32, v553);
    v85 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = objc_msgSend(v296, "isEqualToString:", CFSTR("stt"));

  if (v297)
  {
    objc_msgSend(v553, "stylusBarrelDoubleTap");
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 1);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = objc_msgSend(v298, "isEqualToString:", CFSTR("ringer"));

  if (v299)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = isNumber(v300);

    if (v301)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v553, "flipRingerSwitchToValue:", objc_msgSend(v302, "BOOLValue"));

      -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 2);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v62 = (FILE *)*MEMORY[0x1E0C80C10];
    v63 = "Please specify if the ringer should be enabled or disabled (1 or 0).\n";
    v64 = 69;
    goto LABEL_36;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = objc_msgSend(v326, "isEqualToString:", CFSTR("b"));

  if (v327)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    v329 = isNumber(v328);

    if (v329)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v330, "doubleValue");
      v332 = v331;

    }
    else
    {
      v332 = 0.12;
    }
    v568[0] = CFSTR("h");
    v568[1] = CFSTR("u");
    v569[0] = &unk_1E4FCCA80;
    v569[1] = &unk_1E4FCCA98;
    v568[2] = CFSTR("vu");
    v568[3] = CFSTR("d");
    v569[2] = &unk_1E4FCCA98;
    v569[3] = &unk_1E4FCCAB0;
    v568[4] = CFSTR("vd");
    v568[5] = CFSTR("w");
    v569[4] = &unk_1E4FCCAB0;
    v569[5] = &unk_1E4FCCAC8;
    v568[6] = CFSTR("lock");
    v568[7] = CFSTR("s");
    v569[6] = &unk_1E4FCCAC8;
    v569[7] = &unk_1E4FCCAE0;
    v568[8] = CFSTR("c");
    v568[9] = CFSTR("l");
    v569[8] = &unk_1E4FCCAF8;
    v569[9] = &unk_1E4FCCB10;
    v568[10] = CFSTR("r");
    v568[11] = CFSTR("p");
    v569[10] = &unk_1E4FCCB28;
    v569[11] = &unk_1E4FCCB40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v569, v568, 12);
    v366 = (void *)objc_claimAutoreleasedReturnValue();
    v367 = (void *)objc_opt_new();
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    v558[0] = MEMORY[0x1E0C809B0];
    v558[1] = 3221225472;
    v558[2] = __parseCommandFromCLIArguments_block_invoke;
    v558[3] = &unk_1E4FC26A8;
    v369 = v368;
    v559 = v369;
    v370 = v367;
    v560 = v370;
    objc_msgSend(v366, "enumerateKeysAndObjectsUsingBlock:", v558);
    if (objc_msgSend(v370, "count"))
    {
      if (objc_msgSend(v370, "containsObject:", &unk_1E4FCCAF8))
      {
        +[RCPEventSenderProperties crownSender](RCPEventSenderProperties, "crownSender");
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v553, "setSenderProperties:", v371);

      }
      if ((objc_msgSend(v370, "containsObject:", &unk_1E4FCCA98) & 1) != 0
        || (objc_msgSend(v370, "containsObject:", &unk_1E4FCCAB0) & 1) != 0
        || objc_msgSend(v370, "containsObject:", &unk_1E4FCCAC8))
      {
        +[RCPEventSenderProperties phoneButtonSender](RCPEventSenderProperties, "phoneButtonSender");
        v372 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v553, "setSenderProperties:", v372);

      }
      objc_msgSend(v553, "pressButtons:duration:", v370, v332);
      if (v329)
        v373 = 3;
      else
        v373 = 2;
      -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v373);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      fwrite("Please specify valid hardware buttons to press.\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v26 = 0;
    }

    goto LABEL_44;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v350 = objc_msgSend(v349, "isEqualToString:", CFSTR("bx"));

  if (!v350)
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    v375 = objc_msgSend(v374, "isEqualToString:", CFSTR("vendor"));

    if (v375)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      if (isHexadecimal(v376))
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        v378 = isHexadecimal(v377);

        if (v378)
          goto LABEL_260;
      }
      else
      {

      }
      fwrite("Please specify a usage pair.\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
LABEL_260:
      LODWORD(v562[0]) = 0;
      LODWORD(v563) = 0;
      v397 = (void *)MEMORY[0x1E0CB3900];
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v397, "scannerWithString:", v398);
      v399 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v399, "scanHexInt:", v562) & 1) != 0)
      {
        v400 = (void *)MEMORY[0x1E0CB3900];
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v401 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v400, "scannerWithString:", v401);
        v402 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v402, "scanHexInt:", &v563) & 1) != 0)
        {
          v403 = objc_alloc(MEMORY[0x1E0CB37E8]);
          v404 = (void *)objc_msgSend(v403, "initWithInt:", LODWORD(v562[0]));
          v405 = objc_alloc(MEMORY[0x1E0CB37E8]);
          v406 = (void *)objc_msgSend(v405, "initWithInt:", v563);
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v407 = (void *)objc_claimAutoreleasedReturnValue();
          v408 = isNumber(v407);

          if (v408)
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
            v409 = (void *)objc_claimAutoreleasedReturnValue();
            v410 = isHexadecimal(v409);

            if (v410)
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
              v411 = (void *)objc_claimAutoreleasedReturnValue();
              RCPDataFromHexString(v411);
              v412 = (void *)objc_claimAutoreleasedReturnValue();

              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
              v413 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v553, "vendorEventWithPage:withUsage:withVersion:withData:", v404, v406, objc_msgSend(v413, "intValue"), v412);

              -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 5);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v553, "vendorEventWithPage:withUsage:withVersion:", v404, v406, objc_msgSend(v471, "intValue"));

              -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 4);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            fwrite("Please specify a version for the event.\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
            v26 = 0;
          }

        }
        else
        {
          fwrite("Please specify a valid usage in hex.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
          v26 = 0;
        }

      }
      else
      {
        fwrite("Please specify a valid usage page in hex.\n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        v26 = 0;
      }

      goto LABEL_44;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    v380 = objc_msgSend(v379, "isEqualToString:", CFSTR("rc"));

    if (v380)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v381 = (void *)objc_claimAutoreleasedReturnValue();
      v382 = isNumber(v381);

      if (!v382)
      {
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a rotation angle in degrees.\n";
        goto LABEL_100;
      }
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v383 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v383, "doubleValue");
      v385 = v384;

      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = v386;
      if (v386 && !isNumber(v386))
      {
        if ((objc_msgSend(v214, "isEqualToString:", CFSTR("cw")) & 1) != 0)
        {
          v387 = 0;
          v388 = 3;
        }
        else
        {
          if ((objc_msgSend(v214, "isEqualToString:", CFSTR("ccw")) & 1) == 0)
          {
            v265 = (FILE *)*MEMORY[0x1E0C80C10];
            v266 = "Please specify a valid direction (cw or ccw). If no direction is specified cw is assumed.\n";
            v267 = 90;
            goto LABEL_152;
          }
          v388 = 3;
          v387 = 1;
        }
      }
      else
      {
        v387 = 0;
        v388 = 2;
      }
      v389 = v388;
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v388);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      v391 = v390;
      if (v390)
      {
        if (!isNumber(v390))
        {
          fwrite("Please specify a valid duration in secs.\n", 0x29uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
          v26 = 0;
          goto LABEL_321;
        }
        objc_msgSend(v391, "doubleValue");
        v393 = v392;
        v389 = (v389 + 1);
      }
      else
      {
        v393 = 0.3;
      }
      +[RCPEventSenderProperties crownSender](RCPEventSenderProperties, "crownSender");
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v553, "setSenderProperties:", v470);

      objc_msgSend(v553, "rotateCrown:direction:duration:", v387, v385, v393);
      -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v389);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_321:

      goto LABEL_177;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    v415 = objc_msgSend(v414, "isEqualToString:", CFSTR("ptset"));

    if (v415)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      if (isNumber(v416))
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        v418 = isNumber(v417);

        if (v418)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v419 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v419, "floatValue");
          v421 = v420;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
          v422 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v422, "floatValue");
          v424 = v423;

          objc_msgSend(v553, "pointerSetAbsolutePosition:", v421, v424);
          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        goto LABEL_306;
      }
      goto LABEL_305;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    v432 = objc_msgSend(v431, "isEqualToString:", CFSTR("ptmove"));

    if (v432)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      if (isNumberIncludingNegatives(v416))
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v433 = (void *)objc_claimAutoreleasedReturnValue();
        v434 = isNumberIncludingNegatives(v433);

        if (v434)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v435 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v435, "floatValue");
          v437 = v436;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v438 = (void *)objc_claimAutoreleasedReturnValue();
          v439 = objc_msgSend(v438, "integerValue");

          if (v437 <= 0.0)
            v440 = 1.0;
          else
            v440 = v437;
          if (v439 <= 1)
            v441 = 1;
          else
            v441 = v439;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v442 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v442, "floatValue");
          v444 = v443;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
          v445 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v445, "floatValue");
          v447 = v446;

          objc_msgSend(v553, "pointerMoveDelta:duration:frequency:", v441, v444, v447, v440);
          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 5);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        goto LABEL_306;
      }
LABEL_305:

LABEL_306:
      v62 = (FILE *)*MEMORY[0x1E0C80C10];
      v63 = "Please specify a point.\n";
      v64 = 24;
      goto LABEL_36;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    v452 = objc_msgSend(v451, "isEqualToString:", CFSTR("ptscroll"));

    if (v452)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      if (isNumberIncludingNegatives(v453))
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        v455 = isNumberIncludingNegatives(v454);

        if (v455)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v456 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v456, "floatValue");
          v458 = v457;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v459 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v459, "floatValue");
          v461 = v460;

          if (v458 <= 0.0)
            v462 = 1.0;
          else
            v462 = v458;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v463 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v463, "floatValue");
          v465 = v464;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
          v466 = (void *)objc_claimAutoreleasedReturnValue();
          v467 = v465;
          objc_msgSend(v466, "floatValue");
          v469 = v468;

          if (v461 <= 0.0)
            objc_msgSend(v553, "pointerPhasedScroll:duration:", v467, v469, v462);
          else
            objc_msgSend(v553, "pointerPhasedScroll:duration:frequency:", (uint64_t)v461, v467, v469, v462);
LABEL_363:
          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 5);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        goto LABEL_339;
      }
      goto LABEL_338;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v472 = (void *)objc_claimAutoreleasedReturnValue();
    v473 = objc_msgSend(v472, "isEqualToString:", CFSTR("ptflick"));

    if (v473)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      if (isNumberIncludingNegatives(v453))
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v474 = (void *)objc_claimAutoreleasedReturnValue();
        v475 = isNumberIncludingNegatives(v474);

        if (v475)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 3);
          v476 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v476, "floatValue");
          v478 = v477;

          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 4);
          v479 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v479, "floatValue");
          v481 = v480;

          if (v478 <= 0.0)
            v482 = 0.2;
          else
            v482 = v478;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v483 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v483, "floatValue");
          v485 = v484;
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
          v486 = (void *)objc_claimAutoreleasedReturnValue();
          v487 = v485;
          objc_msgSend(v486, "floatValue");
          v489 = v488;

          v490 = *MEMORY[0x1E0C9D538] == v487;
          v491 = *(double *)(MEMORY[0x1E0C9D538] + 8) == v489;
          v492 = 0.0;
          if (!v490 || !v491)
            v492 = v487;
          v493 = 200.0;
          if (!v490 || !v491)
            v493 = v489;
          if (v481 <= 0.0)
            objc_msgSend(v553, "pointerPhasedFlick:duration:", v492, v493, v482);
          else
            objc_msgSend(v553, "pointerPhasedFlick:duration:frequency:", (uint64_t)v481, v492, v493, v482);
          goto LABEL_363;
        }
LABEL_339:
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a delta point.\n";
        v64 = 30;
        goto LABEL_36;
      }
LABEL_338:

      goto LABEL_339;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    v495 = objc_msgSend(v494, "isEqualToString:", CFSTR("ptbutton"));

    if (v495)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
      v496 = (void *)objc_claimAutoreleasedReturnValue();
      v497 = isNumber(v496);

      if (v497)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v498 = (void *)objc_claimAutoreleasedReturnValue();
        v499 = objc_msgSend(v498, "isEqualToString:", CFSTR("u"));

        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
        v500 = (void *)objc_claimAutoreleasedReturnValue();
        v501 = objc_msgSend(v500, "isEqualToString:", CFSTR("d"));

        if (((v499 | v501) & 1) != 0)
        {
          -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
          v502 = (void *)objc_claimAutoreleasedReturnValue();
          v503 = objc_msgSend(v502, "integerValue");

          if (v501)
            objc_msgSend(v553, "pointerBeginPressingButton:", v503);
          else
            objc_msgSend(v553, "pointerEndPressingButton:", v503);
LABEL_371:
          -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", 3);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify u/d for up/down.\n";
      }
      else
      {
        v62 = (FILE *)*MEMORY[0x1E0C80C10];
        v63 = "Please specify a button number.\n";
      }
      v64 = 32;
      goto LABEL_36;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    v505 = objc_msgSend(v504, "isEqualToString:", CFSTR("ptgesture"));

    if (!v505)
    {
      v534 = (FILE *)*MEMORY[0x1E0C80C10];
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 0);
      v535 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v534, "Unrecognized command: %s\nExamples: recap -c t 100 100 or recap -c t 100 150 f 100 250 0.25 or recap -c b hw\n", (const char *)objc_msgSend(v535, "UTF8String"));

      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v506 = 1;
    while (1)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506);
      v507 = (void *)objc_claimAutoreleasedReturnValue();
      v508 = objc_msgSend(v507, "isEqualToString:", CFSTR("rotation"));

      if (v508)
        break;
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506);
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      v516 = objc_msgSend(v515, "isEqualToString:", CFSTR("translation"));

      if (!v516)
      {
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506);
        v527 = (void *)objc_claimAutoreleasedReturnValue();
        v528 = objc_msgSend(v527, "isEqualToString:", CFSTR("scale"));

        if (!v528)
        {
          if (objc_msgSend(v214, "count"))
          {
            -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506);
            v536 = (void *)objc_claimAutoreleasedReturnValue();
            v537 = isNumber(v536);

            if (v537)
            {
              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506);
              v538 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v538, "floatValue");
              v540 = v539;

              -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
              v541 = (void *)objc_claimAutoreleasedReturnValue();
              v542 = v540;
              v543 = isNumber(v541);

              if (v543)
              {
                -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
                v544 = (void *)objc_claimAutoreleasedReturnValue();
                v545 = (double)objc_msgSend(v544, "integerValue");

                v506 += 2;
                v546 = (uint64_t)v545;
              }
              else
              {
                v546 = 1;
                ++v506;
              }
            }
            else
            {
              v542 = 1.0;
              v546 = 1;
            }
            objc_msgSend(v553, "pointerDiscreteGesture:duration:frequency:", v214, v546, v542);
            -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v506);
            v295 = objc_claimAutoreleasedReturnValue();
            goto LABEL_176;
          }
          v265 = (FILE *)*MEMORY[0x1E0C80C10];
          v266 = "Please specify a gesture.\n";
          v267 = 26;
LABEL_152:
          fwrite(v266, v267, 1uLL, v265);
          v26 = 0;
LABEL_177:

          goto LABEL_44;
        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
        v529 = (void *)objc_claimAutoreleasedReturnValue();
        v530 = isNumberIncludingNegatives(v529);

        if (!v530)
        {
          v265 = (FILE *)*MEMORY[0x1E0C80C10];
          v266 = "Please specify a scale value.\n";
          v267 = 30;
          goto LABEL_152;
        }
        -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
        v531 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v531, "floatValue");
        v533 = v532;

        +[RCPDiscreteGestureSpec scaleZ:](RCPDiscreteGestureSpec, "scaleZ:", v533);
        v514 = objc_claimAutoreleasedReturnValue();
        goto LABEL_360;
      }
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
      v517 = (void *)objc_claimAutoreleasedReturnValue();
      if (!isNumberIncludingNegatives(v517))
      {

LABEL_373:
        v265 = (FILE *)*MEMORY[0x1E0C80C10];
        v266 = "Please specify translation values.\n";
        v267 = 35;
        goto LABEL_152;
      }
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      v519 = isNumberIncludingNegatives(v518);

      if (!v519)
        goto LABEL_373;
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
      v520 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v520, "floatValue");
      v522 = v521;

      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 2);
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v523, "floatValue");
      v525 = v524;

      +[RCPDiscreteGestureSpec translation:](RCPDiscreteGestureSpec, "translation:", v522, v525);
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      v506 += 3;
LABEL_361:
      objc_msgSend(v214, "addObject:", v526);

    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
    v509 = (void *)objc_claimAutoreleasedReturnValue();
    v510 = isNumberIncludingNegatives(v509);

    if (!v510)
    {
      v265 = (FILE *)*MEMORY[0x1E0C80C10];
      v266 = "Please specify a rotation value.\n";
      v267 = 33;
      goto LABEL_152;
    }
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", v506 + 1);
    v511 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v511, "floatValue");
    v513 = v512;

    +[RCPDiscreteGestureSpec rotationZ:](RCPDiscreteGestureSpec, "rotationZ:", v513);
    v514 = objc_claimAutoreleasedReturnValue();
LABEL_360:
    v526 = (void *)v514;
    v506 += 2;
    goto LABEL_361;
  }
  -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 1);
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v351 = (void *)objc_opt_new();
  v352 = (void *)objc_opt_new();
  objc_msgSend(v547, "componentsSeparatedByString:", CFSTR("/"));
  v556 = 0u;
  v557 = 0u;
  v554 = 0u;
  v555 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v353 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v554, v567, 16);
  if (!v353)
    goto LABEL_223;
  v354 = *(_QWORD *)v555;
  while (2)
  {
    for (j = 0; j != v353; ++j)
    {
      if (*(_QWORD *)v555 != v354)
        objc_enumerationMutation(obja);
      v356 = *(_QWORD *)(*((_QWORD *)&v554 + 1) + 8 * j);
      LODWORD(v562[0]) = 0;
      LODWORD(v563) = 0;
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v356);
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v357, "scanHexInt:", v562) & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E0C80C10];
        v426 = "Please specify a valid usage page in hex.\n";
        v427 = 42;
LABEL_273:
        fwrite(v426, v427, 1uLL, v425);

        goto LABEL_274;
      }
      if ((objc_msgSend(v357, "scanString:intoString:", CFSTR(","), 0) & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E0C80C10];
        v426 = "Missing comma separator.\n";
        v427 = 25;
        goto LABEL_273;
      }
      if ((objc_msgSend(v357, "scanHexInt:", &v563) & 1) == 0)
      {
        v425 = (FILE *)*MEMORY[0x1E0C80C10];
        v426 = "Please specify a valid usage in hex.\n";
        v427 = 37;
        goto LABEL_273;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v562[0]));
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v351, "addObject:", v358);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v563);
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v352, "addObject:", v359);

    }
    v353 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v554, v567, 16);
    if (v353)
      continue;
    break;
  }
LABEL_223:

  if (objc_msgSend(v351, "count"))
  {
    -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = isNumber(v360);

    if (v361)
    {
      -[CLIArguments objectAtIndexedSubscript:](v552, "objectAtIndexedSubscript:", 2);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v362, "doubleValue");
      v364 = v363;

      v365 = 3;
    }
    else
    {
      v365 = 2;
      v364 = 0.12;
    }
    objc_msgSend(v553, "pressButtonsWithPages:usages:duration:", v351, v352, v364);
    -[CLIArguments consumeUpToIndex:](v552, "consumeUpToIndex:", v365);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fwrite("Please specify one or more usage pairs.\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
LABEL_274:
    v26 = 0;
  }

LABEL_44:
  return v26;
}

void sub_1A5E9D474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

BOOL isNumber(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("0123456789."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length") == 0;
  return v5;
}

BOOL isNegativeNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "hasPrefix:", CFSTR("-")))
  {
    objc_msgSend(v2, "substringFromIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL isNumberIncludingNegatives(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = isNegativeNumber(v1) || isNumber(v1);

  return v2;
}

id parseMultitouchCommandFromArgumentString(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  float v42;
  void *v43;
  float v44;
  double v45;
  double v46;
  void *v47;
  float v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v57;
  void (**v58)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double);
  id v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  int v71;
  char v72;
  _BYTE v73[128];
  _OWORD v74[2];
  uint64_t v75;
  _OWORD v76[2];
  uint64_t v77;
  _OWORD v78[5];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v72 = 0;
  v71 = 0;
  memset(v78, 0, sizeof(v78));
  v77 = 0;
  memset(v76, 0, sizeof(v76));
  v75 = 0;
  memset(v74, 0, sizeof(v74));
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __parseMultitouchCommandFromArgumentString_block_invoke;
  v69[3] = &unk_1E4FC2708;
  v63 = v4;
  v70 = v63;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))MEMORY[0x1A85B7660](v69);
  if (!objc_msgSend(v3, "count"))
  {
    v12 = 0;
    v13 = 0;
LABEL_53:
    objc_msgSend(v63, "advanceTime:", 1.0 / (double)objc_msgSend(v63, "touchFrequency"));
    objc_msgSend(v63, "liftUpAtAllActivePoints");
    v54 = v3;
    if (objc_msgSend(v54, "count") <= v13)
    {
      v55 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v54, "subarrayWithRange:", v13, objc_msgSend(v54, "count") - v13);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v3 = v55;
    v53 = v3;
    goto LABEL_57;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0.2;
  while (1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v7 + 1;
    if (!v12 || !objc_msgSend(v12, "length"))
    {
LABEL_49:
      if ((v9 & 1) == 0)
        goto LABEL_53;
      goto LABEL_50;
    }
    if (objc_msgSend(v12, "characterAtIndex:", 0) == 91)
      break;
    if (!isNumber(v12))
    {
      v13 = v7;
      if ((v9 & 1) == 0)
        goto LABEL_53;
LABEL_50:
      ((void (**)(_QWORD, uint64_t, _OWORD *, _OWORD *, _OWORD *, double))v5)[2](v5, v10, v78, v76, v74, v11);
      goto LABEL_53;
    }
    objc_msgSend(v12, "floatValue");
    v11 = v18;
LABEL_48:
    v6 = v12;
    v7 = v13;
    if (v13 >= objc_msgSend(v3, "count"))
      goto LABEL_49;
  }
  v61 = v8;
  if ((v9 & 1) != 0)
    ((void (**)(_QWORD, uint64_t, _OWORD *, _OWORD *, _OWORD *, double))v5)[2](v5, v10, v78, v76, v74, v11);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("[]"));

  if ((v16 & 1) != 0)
  {
    v17 = 0;
LABEL_20:
    v60 = v13;
    v62 = (void *)objc_opt_new();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v26 = v17;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v27)
    {
      v28 = v27;
      v57 = v12;
      v58 = v5;
      v59 = v3;
      v10 = 0;
      v29 = 0;
      v30 = *(_QWORD *)v66;
      do
      {
        v31 = 0;
        v32 = (char *)&v71 + v29;
        do
        {
          if (*(_QWORD *)v66 != v30)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v31);
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByTrimmingCharactersInSet:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "componentsSeparatedByString:", CFSTR(" "));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v36, "count") <= 1 && v32[v31])
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29 + v31);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "addObject:", v37);

            v32[v31] = 0;
          }
          else
          {
            v64 = 0uLL;
            objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "floatValue");
            v40 = v39;
            objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "floatValue");
            *(double *)&v64 = v40;
            *((double *)&v64 + 1) = v42;

            if ((unint64_t)objc_msgSend(v36, "count") <= 2)
            {
              objc_msgSend(v63, "defaultPressure");
              v45 = v46;
            }
            else
            {
              objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "floatValue");
              v45 = v44;

            }
            if (objc_msgSend(v36, "count") == 4)
            {
              objc_msgSend(v36, "objectAtIndexedSubscript:", 3);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "floatValue");
              v49 = v48;

            }
            else
            {
              objc_msgSend(v63, "defaultRadius");
              v49 = v50;
            }
            if (!v32[v31])
            {
              objc_msgSend(v63, "touchDownAtPoints:touchCount:pressure:radius:", &v64, 1, v45, v49);
              v32[v31] = 1;
            }
            v78[v10] = v64;
            *((double *)v76 + v10) = v45;
            *((double *)v74 + v10++) = v49;
          }

          ++v31;
        }
        while (v28 != v31);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        v29 += v31;
      }
      while (v28);
      v5 = v58;
      v3 = v59;
      v12 = v57;
    }
    else
    {
      v10 = 0;
      v29 = 0;
    }

    v51 = v29;
    if (v29 < v61)
    {
      do
      {
        if (*((_BYTE *)&v71 + v51))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v52);

          *((_BYTE *)&v71 + v51) = 0;
        }
        ++v51;
      }
      while (v61 != v51);
    }
    if (objc_msgSend(v62, "count"))
      objc_msgSend(v63, "liftUpActivePointsByIndex:", v62);

    v9 = 1;
    v11 = 0.2;
    v8 = v29;
    v13 = v60;
    goto LABEL_48;
  }
  v19 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v12, "substringFromIndex:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 < objc_msgSend(v3, "count"))
  {
    v13 = v7 + 2;
    do
    {
      v22 = v12;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v13 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        break;
      if (objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 1) == 93)
      {
        objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v24);

        objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(","));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      objc_msgSend(v21, "addObject:", v12);
    }
    while (v13++ < objc_msgSend(v3, "count"));
  }

  v53 = 0;
LABEL_57:

  return v53;
}

void __parseCommandFromCLIArguments_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", a2) != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

BOOL isHexadecimal(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEF"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length") == 0;
  return v5;
}

void __propertiesForSenderString_block_invoke()
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
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[13];

  v14[11] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("mouse");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_mouseSender);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v13[1] = CFSTR("trackpad");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_trackpadSender);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v0;
  v13[2] = CFSTR("pencil");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_pencilDigitizerSender);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v13[3] = CFSTR("touchscreen");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_touchScreenDigitizerSender);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v13[4] = CFSTR("gamepad");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_gamepadSender);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v13[5] = CFSTR("keyboard");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_keyboardSender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v13[6] = CFSTR("tvremote");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_tvRemoteSender);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v13[7] = CFSTR("naturalinput");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_naturalInputCollectionSender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v13[8] = CFSTR("globalposition");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_globalPositionSender);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v13[9] = CFSTR("crown");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_crownSender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v13[10] = CFSTR("phone");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_phoneButtonSender);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)propertiesForSenderString_propertyMap;
  propertiesForSenderString_propertyMap = v10;

}

Class __getTypistHWKeyboardClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!TypistFrameworkLibraryCore_frameworkLibrary)
  {
    TypistFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TypistFrameworkLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getTypistHWKeyboardClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("TypistHWKeyboard");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getTypistHWKeyboardClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __parseMultitouchCommandFromArgumentString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, double *a5, double a6)
{
  void *v6;

  v6 = *(void **)(a1 + 32);
  if (a2 < 1)
    return objc_msgSend(v6, "advanceTime:", a6);
  else
    return objc_msgSend(v6, "moveToPoints:touchCount:pressure:duration:radius:", a3, a2, *a4, a6, *a5);
}

void __getFBSOrientationObserverClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  RCPMachTimestampFromTimeInterval_cold_1(v0);
}

void RCPMachTimestampFromTimeInterval_cold_1()
{
  __assert_rtn("RCPMachTimestampFromTimeInterval", "RCPMachTime.m", 31, "0 <= timeInterval");
}

void __getTypistHWKeyboardClass_block_invoke_cold_1()
{
  abort_report_np();
  AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSDisplayServicesGetExternalDisplayScale()
{
  return MEMORY[0x1E0D00998]();
}

uint64_t BKSDisplayServicesGetMainScreenInfo()
{
  return MEMORY[0x1E0D009A0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
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

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x1E0C9D3F8](path);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1E0CBB008]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x1E0CBB018]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1E0CBB030]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1E0CBB038]();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return MEMORY[0x1E0CBB040]();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return MEMORY[0x1E0CBB048]();
}

uint64_t IOHIDEventCreateDigitizerStylusEventWithPolarOrientation()
{
  return MEMORY[0x1E0CBB058]();
}

uint64_t IOHIDEventCreateForceStageEvent()
{
  return MEMORY[0x1E0CBB060]();
}

uint64_t IOHIDEventCreateGameControllerEvent()
{
  return MEMORY[0x1E0CBB068]();
}

uint64_t IOHIDEventCreateGenericGestureEvent()
{
  return MEMORY[0x1E0CBB070]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x1E0CBB078]();
}

uint64_t IOHIDEventCreateRelativePointerEvent()
{
  return MEMORY[0x1E0CBB090]();
}

uint64_t IOHIDEventCreateRotationEvent()
{
  return MEMORY[0x1E0CBB098]();
}

uint64_t IOHIDEventCreateScaleEvent()
{
  return MEMORY[0x1E0CBB0A0]();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x1E0CBB0A8]();
}

uint64_t IOHIDEventCreateTouchSensitiveButtonEventWithRadius()
{
  return MEMORY[0x1E0CBB0B8]();
}

uint64_t IOHIDEventCreateTranslationEvent()
{
  return MEMORY[0x1E0CBB0C0]();
}

uint64_t IOHIDEventCreateUnicodeEvent()
{
  return MEMORY[0x1E0CBB0C8]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x1E0CBB0D0]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x1E0CBB0E0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1E0CBB0F8]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1E0CBB128]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1E0CBB150]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventSetAttributeData()
{
  return MEMORY[0x1E0CBB190]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x1E0CBB198]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x1E0CBB1A8]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1E0CBB1B0]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x1E0CBB1B8]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x1E0CBB1C0]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x1E0CBB1C8]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1E0CBB1F0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB250]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1E0CBB270]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1E0CBB298]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB2C0]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4D0](service);
}

CFTypeID IOHIDServiceClientGetTypeID(void)
{
  return MEMORY[0x1E0CBB4D8]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1E0DDD560]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x1E0CEBF48]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x1E0CEC128]();
}

uint64_t _UIRenderingBufferCreate()
{
  return MEMORY[0x1E0CEC130]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1E0C84C88]();
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

