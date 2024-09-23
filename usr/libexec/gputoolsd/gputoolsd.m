void sub_100002A28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100002BB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100002CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100002DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t sub_100002E00(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v1, 0));

  if (v2)
    v3 = (uint64_t)objc_msgSend(v2, "pid");
  else
    v3 = 0xFFFFFFFFLL;

  return v3;
}

void sub_100002E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002E98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    DYLog(kDYLoggingLevelError, "Cannot bring app to foreground: error = %s", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  }
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v9);

}

void sub_100002F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100003538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_10000365C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v3 = v2;
  if (v2 != (void *)DYErrorDomain)
  {

LABEL_4:
    DYLog(kDYLoggingLevelError, "launchGuestAppWithPath: helper transport error");
    objc_msgSend(*(id *)(a1 + 32), "terminate:", 1);
    goto LABEL_5;
  }
  v4 = objc_msgSend(v5, "code");

  if (v4 != (id)6)
    goto LABEL_4;
LABEL_5:

}

void sub_10000370C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t sub_10000372C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectPayload"));
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v7);

  return 0;
}

void sub_10000379C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  sub_100003DE0();

  _Unwind_Resume(a1);
}

void sub_100003CA8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    DYLog(kDYLoggingLevelError, "Cannot launch app: error = %s", v8);

  }
  else if (v9)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "pid");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100003D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t sub_100003D7C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileReplayer")) & 1) != 0)
    v2 = 1;
  else
    v2 = (uint64_t)objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MTLReplayer"));

  return v2;
}

void sub_100003DD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100003DE0()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Agent-LaunchInferior", (const char *)&unk_10000BB1E, v1, 2u);
  }
}

void sub_100004164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10000421C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  const char *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "error"));
  v3 = (void *)DYErrorDomain;
  v4 = v2;
  v5 = v3;
  if (!v5)
    __assert_rtn("BOOL dy_error_eq(NSError *__strong, NSString *__strong, int)", "", 0, "domain");
  if (!v4 || objc_msgSend(v4, "code") != (id)6)
  {

    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
LABEL_7:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "error"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    DYLog(kDYLoggingLevelError, "helper transport error: %s", v10);

    objc_msgSend(*(id *)(a1 + 32), "terminate:", 1);
  }
}

void sub_10000436C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000043A4(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "BOOLResult") & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
    v3 = (const char *)objc_msgSend(v2, "UTF8String");
    DYLog(kDYLoggingLevelError, "failed to connect to helper: %s", v3);

    objc_msgSend(*(id *)(a1 + 40), "terminate:", 1);
  }
  v4 = kDYGuestAppLaunchEnvironmentKey;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = kDYGuestAppLaunchArgumentsKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "objectForKey:", kDYGuestAppLaunchArgumentsKey));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v4, v7, v6, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", 1287, v10));
  if (!v8)
  {
    DYLog(kDYLoggingLevelError, "failed to serialize environment plist for helper");
    objc_msgSend(*(id *)(a1 + 40), "terminate:", 1);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "send:error:", v8, 0) & 1) == 0)
  {
    DYLog(kDYLoggingLevelError, "failed to send reload UI server message to helper");
    objc_msgSend(*(id *)(a1 + 40), "terminate:", 1);
  }

}

void sub_100004524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{

  _Unwind_Resume(a1);
}

void sub_100004B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_10000511C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000519C(uint64_t a1, const void *a2)
{
  const void *Value;
  const void *v5;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
  {
    v5 = Value;
    if (is_valid_plist_value(Value))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, v5);
  }
}

void sub_100005360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1000053B4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_opt_class(LSApplicationProxy);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processApplication:", v5));
    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

void sub_100005428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100005BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100005D20(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id Signature;

  if (CSIsNull(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
  {
    v2 = CSSymbolicatorCreateWithPid(objc_msgSend(*(id *)(a1 + 32), "inferiorPid"));
    v3 = (uint64_t *)(*(_QWORD *)(a1 + 32) + 8);
    *v3 = v2;
    v3[1] = v4;
  }
  if ((CSIsNull(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) != 0)
    Signature = 0;
  else
    Signature = (id)CSSymbolicatorCreateSignature(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:payload:](DYTransportMessage, "messageWithKind:payload:", 1538, Signature));
  objc_msgSend(v5, "send:inReplyTo:error:", v6, *(_QWORD *)(a1 + 40), 0);

}

void sub_100005E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100005F64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

NSObject *sub_100005FF4(uint64_t a1, NSObject *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;

  v5 = a3;
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a2);
  if (v6)
  {
    v7 = 1000000000 * a1;
    v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(v6, v8, v7, 0x989680uLL);
    dispatch_source_set_event_handler(v6, v5);
    dispatch_resume(v6);
  }

  return v6;
}

void sub_100006118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DYGPUStatsReport;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100006144(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

CFComparisonResult sub_100006214(uint64_t a1, uint64_t a2)
{
  const __CFString *Group;
  const __CFString *SubGroup;
  CFComparisonResult result;

  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  if (CFStringCompare(Group, *(CFStringRef *)(a1 + 32), 1uLL))
    return 16;
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  result = CFStringCompare(SubGroup, *(CFStringRef *)(a1 + 40), 1uLL);
  if (result)
    return 16;
  return result;
}

void sub_100006318(uint64_t a1)
{
  uint64_t Samples;
  uint64_t v3;
  uint64_t v4;
  uint64_t SamplesDelta;
  const void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSMutableDictionary *v15;

  Samples = IOReportCreateSamples(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  if (Samples)
  {
    v3 = Samples;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    if (v4)
    {
      SamplesDelta = IOReportCreateSamplesDelta(v4, v3, 0);
      if (SamplesDelta)
      {
        v6 = (const void *)SamplesDelta;
        v10 = 0;
        v11 = &v10;
        v12 = 0x3032000000;
        v13 = sub_100006450;
        v14 = sub_100006460;
        v15 = objc_opt_new(NSMutableDictionary);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100006468;
        v9[3] = &unk_10000C7F0;
        v9[4] = &v10;
        IOReportIterate(v6, v9);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), (id)v11[5]);
        CFRelease(v6);
        _Block_object_dispose(&v10, 8);

      }
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v3;

  }
}

void sub_100006430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100006450(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006460(uint64_t a1)
{

}

uint64_t sub_100006468(uint64_t a1, uint64_t a2)
{
  int Count;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *NameForIndex;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;

  if (IOReportChannelGetFormat(a2) != 2)
    return 16;
  Count = IOReportStateGetCount(a2);
  v5 = objc_alloc_init((Class)NSNumberFormatter);
  objc_msgSend(v5, "setNumberStyle:", 1);
  if (Count >= 1)
  {
    v6 = 0;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      NameForIndex = (void *)IOReportStateGetNameForIndex(a2, v6);
      IOReportStateGetDutyCycle(a2, v6);
      if (NameForIndex)
      {
        v11 = v10;
        if (objc_msgSend(NameForIndex, "length"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 * 100.0));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v12, NameForIndex);

          if ((objc_msgSend(NameForIndex, "isEqualToString:", CFSTR("OFF")) & 1) == 0)
          {
            if (objc_msgSend(NameForIndex, "hasPrefix:", CFSTR("P")))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(NameForIndex, "substringFromIndex:", 1));
              v14 = v13;
              if (v13 && objc_msgSend(v13, "length"))
              {
                v15 = v5;
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "numberFromString:", v14));
                v17 = v16;
                if (v16)
                {
                  objc_msgSend(v16, "doubleValue");
                  v7 = v7 + v18 * v11;
                  v8 = v8 + v11;
                }

                v5 = v15;
              }

            }
          }
        }
      }

      v6 = (v6 + 1);
    }
    while (Count != (_DWORD)v6);
    if (v8 > 2.22044605e-16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 / v8));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v19, kDYXPState);

    }
  }

  return 0;
}

void sub_100006660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006C08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006C34(uint64_t a1)
{
  uint64_t result;

  result = SSLRead(*(SSLContextRef *)(*(_QWORD *)(a1 + 32) + 288), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64), (size_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100006E18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006E44(uint64_t a1)
{
  uint64_t result;

  result = SSLWrite(*(SSLContextRef *)(*(_QWORD *)(a1 + 32) + 288), *(const void **)(a1 + 56), *(_QWORD *)(a1 + 64), (size_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100006FC0(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  signed int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;

  v2 = *(void **)(a1 + 32);
  if (!*((_BYTE *)v2 + OBJC_IVAR___DYTransport__invalid))
  {
    if (!objc_msgSend(v2, "connected"))
    {
      v10 = secure_lockdown_checkin(*(_QWORD *)(a1 + 32) + 272, 0, *(_QWORD *)(a1 + 32) + 280);
      v11 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        v12 = v10;
        v13 = kDYLoggingLevelError;
        if (v10 > 0xB)
          v14 = "unknown";
        else
          v14 = (&off_10000C860)[v10 - 1];
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
        _DYOLog(v11, v13, CFSTR("failed to checkin with lockdownd: %@ (%d)"));

        v4 = v12;
        v3 = CFSTR("LockdownErrorDomain");
        goto LABEL_3;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = lockdown_get_socket(*(_QWORD *)(v11 + 272));
      v15 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v15 + 296) == -1)
      {
        ((void (*)(void))_DYOLog)();
        v9 = 0;
        goto LABEL_6;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = lockdown_get_securecontext(*(_QWORD *)(v15 + 272));
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD **)(v16 + 288);
      if (v17 && *(_DWORD *)(v16 + 296) == *((_DWORD *)v17 + 8))
      {
        v17[2] = sub_1000071F0;
        v17[3] = sub_1000071FC;
        v17[4] = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)v16, "runWithSocket:", *(unsigned int *)(v16 + 296));
    }
    v9 = 1;
LABEL_6:
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    v6 = (id *)(a1 + 40);
    goto LABEL_7;
  }
  v3 = (const __CFString *)DYErrorDomain;
  v4 = 32;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v3, v4, 0));
  v7 = *(void **)(a1 + 40);
  v6 = (id *)(a1 + 40);
  objc_msgSend(v7, "setError:", v5);

  v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
LABEL_7:
  v19 = (id)v8;
  objc_msgSend(*v6, "setResult:", v8);

}

id sub_1000071F0(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "_ssl_st_read:size:", a2, a3);
}

id sub_1000071FC(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "_ssl_st_write:size:", a2, a3);
}

void start()
{
  void *v0;
  NSObject *v1;
  DYLockdownTransport *v2;
  DYEmbeddedDaemon *v3;

  sub_1000072D0();
  v0 = objc_autoreleasePoolPush();
  signal(15, (void (__cdecl *)(int))1);
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v1, &stru_10000C8D8);
  dispatch_resume(v1);
  signal(20, (void (__cdecl *)(int))1);
  v2 = objc_alloc_init(DYLockdownTransport);
  v3 = -[DYEmbeddedDaemon initWithTransport:terminationHandler:]([DYEmbeddedDaemon alloc], "initWithTransport:terminationHandler:", v2, &stru_10000C918);
  -[DYEmbeddedDaemon run](v3, "run");

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

uint64_t sub_1000072D0()
{
  uint64_t result;
  size_t v1;
  uint64_t v2;

  v1 = 8;
  v2 = 0;
  result = sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v1, 0, 0);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000078B4();
LABEL_8:
    exit(1);
  }
  if (v2 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100007870();
    goto LABEL_8;
  }
  return result;
}

void sub_100007358(id a1)
{
  DYLog(kDYLoggingLevelMessage, "SIGTERM received");
  exit(0);
}

void sub_100007380(id a1, int a2)
{
  exit(a2);
}

void sub_1000074F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100007748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100007844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100007870()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Service prohibited from running (developer mode not enabled)", v0, 2u);
}

void sub_1000078B4()
{
  int v0;
  _DWORD v1[2];

  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to read developer mode status: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__createContextInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createContextInfo:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_BOOLResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLResult");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bringAppToForeground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringAppToForeground:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_cacheInferiorAppIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheInferiorAppIdentifier");
}

id objc_msgSend_canOpenApplication_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canOpenApplication:reason:");
}

id objc_msgSend_captureAPISupportForAPI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureAPISupportForAPI:");
}

id objc_msgSend_capturingInferior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capturingInferior");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_createInferiorTransportAndSetEnvironment_uniqueIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInferiorTransportAndSetEnvironment:uniqueIdentifier:error:");
}

id objc_msgSend_createInferiorTransportAndSetEnvironment_withAPI_uniqueIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInferiorTransportAndSetEnvironment:withAPI:uniqueIdentifier:error:");
}

id objc_msgSend_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_denyTransfer_transport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyTransfer:transport:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destroySharedMemoryTransport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroySharedMemoryTransport");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateBundlesOfType:block:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "future");
}

id objc_msgSend_graphicsAPIInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "graphicsAPIInfo");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_inferiorPid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inferiorPid");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initWithAPI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAPI:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithIdentifier_sharegroupIdentifier_renderers_currentRendererIndex_api_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:sharegroupIdentifier:renderers:currentRendererIndex:api:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithTransport_terminationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransport:terminationHandler:");
}

id objc_msgSend_initWithURL_transport_asSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:transport:asSender:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interposeDylibPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interposeDylibPath");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleInternal");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kind");
}

id objc_msgSend_lastStatsReport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStatsReport");
}

id objc_msgSend_launchInferiorWithIdentifer_environment_arguments_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchInferiorWithIdentifer:environment:arguments:error:");
}

id objc_msgSend_launchInferiorWithPath_arguments_environment_workingDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchInferiorWithPath:arguments:environment:workingDirectory:error:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_messageWithKind_attributes_objectPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:attributes:objectPayload:");
}

id objc_msgSend_messageWithKind_objectPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:objectPayload:");
}

id objc_msgSend_messageWithKind_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:payload:");
}

id objc_msgSend_messageWithKind_plistPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:plistPayload:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_newSourceWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSourceWithQueue:");
}

id objc_msgSend_notifyOnQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyOnQueue:handler:");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPayload");
}

id objc_msgSend_observeInferior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observeInferior");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_ownsInferior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownsInferior");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_processApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processApplication:");
}

id objc_msgSend_receiveTransfer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveTransfer:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_rendererInfoWithGLIContext_dispatch_api_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rendererInfoWithGLIContext:dispatch:api:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runWithSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithSocket:");
}

id objc_msgSend_scheduleReadOnWritableSocket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleReadOnWritableSocket");
}

id objc_msgSend_send_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "send:error:");
}

id objc_msgSend_send_error_replyQueue_timeout_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "send:error:replyQueue:timeout:handler:");
}

id objc_msgSend_send_inReplyTo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "send:inReplyTo:error:");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_setCancellationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellationHandler:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setInferiorPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInferiorPid:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOwner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwner:");
}

id objc_msgSend_setOwnsInferior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwnsInferior:");
}

id objc_msgSend_setPrioritizeOutgoingMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrioritizeOutgoingMessages:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setShouldLoadCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldLoadCapture:");
}

id objc_msgSend_setShouldLoadDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldLoadDiagnostics:");
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransport:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharegroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharegroup");
}

id objc_msgSend_shouldLoadCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLoadCapture");
}

id objc_msgSend_shouldLoadDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLoadDiagnostics");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startCollectingStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCollectingStats");
}

id objc_msgSend_stopCollectingStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCollectingStats");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_terminate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminate:");
}

id objc_msgSend_timeoutAfter_label_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutAfter:label:");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}
