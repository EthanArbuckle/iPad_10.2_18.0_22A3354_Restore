uint64_t OUTLINED_FUNCTION_2(void *a1, const char *a2)
{
  return objc_msgSend(a1, "code");
}

uint64_t OUTLINED_FUNCTION_2_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

void sub_1B56D04A0(_Unwind_Exception *a1)
{
  void *v1;

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

void sub_1B56DA8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void asyncNotificationsCallback(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v7 = (void *)MEMORY[0x1B5E4E6F0]();
  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getObject:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = v10;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v10, "_handleRefreshConnection");
    }
    else if (a4 >= 7)
    {
      objc_msgSend(v10, "_handleNotification:withArg1:arg2:arg3:arg4:arg5:arg6:", *a3, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4), *((_QWORD *)a3 + 5), *((_QWORD *)a3 + 6));
    }

  }
  objc_autoreleasePoolPop(v7);
}

void sub_1B56E368C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B56E4A08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B56E4AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)TSDCTranslationClock;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1B56E4D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56E4D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B56E4DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B56E503C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B56E5454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B56E5690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56E5904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B56E5A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B56E5BB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56E5D2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56E5EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void TSBBBrowseServiceReply(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = (void *)MEMORY[0x1B5E4E6F0]();
  v16 = a8;
  v17 = v16;
  if (a4)
  {
    TSBonjourErrorFromErrorCode(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "description");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = 136315138;
      v21 = objc_msgSend(v19, "UTF8String");
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error browsing services: %s\n", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v17, "stopBrowsing");

  }
  else if ((a2 & 2) != 0)
  {
    objc_msgSend(v16, "addedServiceWithName:regType:domain:onInterface:withFlags:", a5, a6, a7, a3, a2);
  }
  else
  {
    objc_msgSend(v16, "removedServiceWithName:regType:domain:onInterface:withFlags:", a5, a6, a7, a3, a2);
  }

  objc_autoreleasePoolPop(v15);
}

void sub_1B56E94D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B56E9550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)TSDCgPTPClock;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B56E99BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56E9A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t scaledInterval(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  uint8_t v13[16];

  v2 = a1;
  v3 = IOTS_uint64mul(a1, a2);
  *((_QWORD *)&v6 + 1) = v4;
  *(_QWORD *)&v6 = v3;
  v5 = v6 >> 63;
  v7 = (v3 >> 40) & 0x7FFFFF | (v5 << 23);
  v8 = v5 >> 41;
  v9 = v7 + 1;
  if (v7 == -1)
    v10 = v8 + 1;
  else
    v10 = v8;
  if (v10 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock scaledInterval  timeYDelta128 is ridiculously big!\n", v13, 2u);
    }
  }
  else
  {
    *((_QWORD *)&v11 + 1) = v10;
    *(_QWORD *)&v11 = v9;
    return v11 >> 1;
  }
  return v2;
}

void sub_1B56EA530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56EA78C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56EA9C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EADBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EAFE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EB398(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EB594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EB618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EB78C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56ED0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B56ED234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56ED380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56ED4AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56EDAC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void TSBIResolvedServiceReply(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1B5E4E6F0]();
  v14 = a10;
  objc_msgSend(v14, "stopResolve");
  if (a4)
  {
    TSBonjourErrorFromErrorCode(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "description");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = 136315138;
      v18 = objc_msgSend(v16, "UTF8String");
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error resolving service: %s\n", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v14, "resolvedWithHostTarget:port:", a6, __rev16(a7));
  }

  objc_autoreleasePoolPop(v13);
}

void TSBIGetAddrReply(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  TSBonjourIPv6Address *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1B5E4E6F0]();
  v13 = a8;
  if (a4)
  {
    TSBonjourErrorFromErrorCode(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "description");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v35 = 136315138;
      v36 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error resolving service: %s\n", (uint8_t *)&v35, 0xCu);

    }
    goto LABEL_24;
  }
  if ((a2 & 2) != 0)
  {
    v16 = *(unsigned __int8 *)(a6 + 1);
    if (v16 == 30)
    {
      v17 = -[TSBonjourIPv6Address initWithIPv6Address:]([TSBonjourIPv6Address alloc], "initWithIPv6Address:", a6 + 8);
      objc_msgSend(v13, "setIpv6Address:", v17);
      objc_msgSend(v13, "pokeIPv6Destination");
      objc_msgSend(v13, "ipv6Addresses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0C99DE8];
      if (v22)
      {
        objc_msgSend(v13, "ipv6Addresses");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayWithArray:", v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "addObject:", v17);
      objc_msgSend(v13, "setIpv6Addresses:", v21);
      objc_msgSend(v13, "delegate");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_21;
      v32 = (void *)v31;
      objc_msgSend(v13, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0)
        goto LABEL_21;
      objc_msgSend(v13, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "node");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "didResolveIPv6Address:forInterface:ofNode:", v17, v13, v30);
    }
    else
    {
      if (v16 != 2)
        goto LABEL_22;
      v17 = -[TSBonjourIPv4Address initWithIPv4Address:]([TSBonjourIPv4Address alloc], "initWithIPv4Address:", bswap32(*(_DWORD *)(a6 + 4)));
      objc_msgSend(v13, "setIpv4Address:", v17);
      objc_msgSend(v13, "ipv4Addresses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0C99DE8];
      if (v18)
      {
        objc_msgSend(v13, "ipv4Addresses");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayWithArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "addObject:", v17);
      objc_msgSend(v13, "setIpv4Addresses:", v21);
      objc_msgSend(v13, "delegate");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_21;
      v26 = (void *)v25;
      objc_msgSend(v13, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0)
        goto LABEL_21;
      objc_msgSend(v13, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "node");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "didResolveIPv4Address:forInterface:ofNode:", v17, v13, v30);
    }

LABEL_21:
  }
LABEL_22:
  if ((a2 & 1) == 0)
    objc_msgSend(v13, "stopAddressLookup");
LABEL_24:

  objc_autoreleasePoolPop(v12);
}

id TSBonjourLocalizedErrorDescription(int a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case -65568:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Timeout");
      break;
    case -65567:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Polling mode");
      break;
    case -65566:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No router");
      break;
    case -65565:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT port mapping disabled");
      break;
    case -65564:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT port mapping is unsupported");
      break;
    case -65563:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Service is not running");
      break;
    case -65562:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Transient");
      break;
    case -65561:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Key");
      break;
    case -65560:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Sig");
      break;
    case -65559:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Time");
      break;
    case -65558:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Double NAT");
      break;
    case -65557:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT Traversal");
      break;
    case -65556:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No such key");
      break;
    case -65555:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No auth");
      break;
    case -65554:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No such record");
      break;
    case -65553:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Refused");
      break;
    case -65552:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad interface index");
      break;
    case -65551:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Incompatible");
      break;
    case -65550:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Firewall");
      break;
    case -65549:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Invalid");
      break;
    case -65548:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Name conflict");
      break;
    case -65547:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Already registered");
      break;
    case -65546:
      goto LABEL_5;
    case -65545:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Not initialized");
      break;
    case -65544:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Unsupported");
      break;
    case -65543:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad flags");
      break;
    case -65542:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad state");
      break;
    case -65541:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad reference");
      break;
    case -65540:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad parameter");
      break;
    case -65539:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No memory");
      break;
    case -65538:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No such name");
      break;
    case -65537:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Unknown DNSSD Error");
      break;
    default:
      if (a1)
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("Undefined DNS SD Error");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("No error.");
      }
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id TSBonjourLocalizedFailureReason(int a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case -65568:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Timeout");
      break;
    case -65567:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Polling mode");
      break;
    case -65566:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No router");
      break;
    case -65565:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT port mapping disabled");
      break;
    case -65564:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT port mapping is unsupported");
      break;
    case -65563:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Service is not running");
      break;
    case -65562:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Transient");
      break;
    case -65561:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Key");
      break;
    case -65560:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Sig");
      break;
    case -65559:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad Time");
      break;
    case -65558:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Double NAT");
      break;
    case -65557:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("NAT Traversal");
      break;
    case -65556:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No such key");
      break;
    case -65555:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No auth");
      break;
    case -65554:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("No such record");
      break;
    case -65553:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Refused");
      break;
    case -65552:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("A bad interface index was provided.");
      break;
    case -65551:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Incompatible");
      break;
    case -65550:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Firewall");
      break;
    case -65549:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Invalid");
      break;
    case -65548:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("The name conflicts with an already registered service");
      break;
    case -65547:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("The service is already registered.");
      break;
    case -65546:
      goto LABEL_5;
    case -65545:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Not initialized");
      break;
    case -65544:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("An unsupported request was made");
      break;
    case -65543:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad flags");
      break;
    case -65542:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Bad state");
      break;
    case -65541:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("A bad reference was provided.");
      break;
    case -65540:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("A bad parameter was provided.");
      break;
    case -65539:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Could not allocate memory.");
      break;
    case -65538:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("The requested name does not exist");
      break;
    case -65537:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Unknown DNSSD Error");
      break;
    default:
      if (a1)
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("Undefined DNS SD Error");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("No error.");
      }
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id TSBonjourErrorFromErrorCode(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  TSBonjourLocalizedErrorDescription(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TSBonjourLocalizedFailureReason(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D68];
  v9[0] = *MEMORY[0x1E0CB2D50];
  v9[1] = v5;
  v10[0] = v2;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("DNSSDError"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t IOTS_uint64mul(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

uint64_t operator<<(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)a1 << a2;
  if (a2 > 63)
    v2 = 0;
  if (a2 == 64)
    v3 = 0;
  else
    v3 = v2;
  if (a2)
    return v3;
  else
    return *(_QWORD *)a1;
}

uint64_t IOTS_add_128(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 IOTS_U128::operator*@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  __n128 result;
  __int128 v18;
  __n128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28[4];

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = *a1;
  v4 = a1[1];
  v7 = *a2;
  v6 = a2[1];
  v8 = IOTS_uint64mul(v4, v6);
  v10 = v9;
  v11 = IOTS_uint64mul(v5, v7);
  v13 = v12;
  v24 = IOTS_uint64mul(v4, v7);
  v25 = v14;
  v26 = 0;
  v27 = 0;
  *(_QWORD *)&v22 = IOTS_uint64mul(v5, v6);
  *((_QWORD *)&v22 + 1) = v15;
  v23 = 0uLL;
  IOTS_U256::operator+((unint64_t *)&v24, (unint64_t *)&v22, v28);
  v26 = v8;
  v27 = v10;
  v24 = 0;
  v25 = 0;
  operator<<(v28, 64, (uint64_t)&v20);
  v22 = v20;
  v23 = v21;
  v21 = 0uLL;
  *(_QWORD *)&v20 = v11;
  *((_QWORD *)&v20 + 1) = v13;
  IOTS_U256::operator+((unint64_t *)&v24, (unint64_t *)&v22, (unint64_t *)&v18);
  v16 = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = v16;
  IOTS_U256::operator+((unint64_t *)a3, (unint64_t *)&v20, (unint64_t *)&v18);
  result = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

unint64_t *IOTS_U256::operator+@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  v3 = result[2];
  v4 = a2[2];
  v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4)
    v6 = 1;
  else
    v6 = v6;
  v7 = a2[3] + result[3] + v6;
  v9 = *result;
  v8 = result[1];
  v11 = *a2;
  v10 = a2[1];
  v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11)
    v13 = 1;
  else
    v13 = v13;
  v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (v15 = v12 >= v9) : (v15 = 1),
        v15 ? (v16 = 0) : (v16 = 1),
        v12 < v11 ? (v17 = v10 == v14) : (v17 = 0),
        !v17 ? (v18 = v8 > v14) : (v18 = 1),
        !v18 ? (v19 = v16 == 0) : (v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1)
      a3[3] = v7 + 1;
  }
  return result;
}

_OWORD *operator<<@<X0>(_OWORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  __int128 v3;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = result[1];
  *(_OWORD *)a3 = *result;
  *(_OWORD *)(a3 + 16) = v3;
  if (a2)
  {
    v6 = a2 - 128;
    if (v6)
    {
      if (a2 <= 127)
      {
        v7 = operator>>((_QWORD *)a3, 128 - a2);
        v9 = v8;
        *(_QWORD *)(a3 + 16) = operator<<(a3 + 16, a2) | v7;
        *(_QWORD *)(a3 + 24) = v10 | v9;
        result = (_OWORD *)operator<<(a3, a2);
        *(_QWORD *)a3 = result;
        *(_QWORD *)(a3 + 8) = v11;
        return result;
      }
      result = (_OWORD *)operator<<(a3, v6);
      *(_QWORD *)(a3 + 16) = result;
      *(_QWORD *)(a3 + 24) = v12;
    }
    else
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)a3;
    }
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t IOTS_U128::operator/(__int128 *a1, unint64_t *a2)
{
  int v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = *a1;
  v11 = 0uLL;
  v3 = 128;
  do
  {
    operator<<(&v10, 1, (uint64_t)&v8);
    v11 = v9;
    result = v8;
    v10 = v8;
    v5 = *a2;
    v6 = a2[1];
    if (*((_QWORD *)&v9 + 1) > v6 || (*((_QWORD *)&v9 + 1) == v6 ? (v7 = (unint64_t)v9 >= v5) : (v7 = 0), v7))
    {
      v11 = v9 - __PAIR128__(v6, v5);
      result = v8 | 1;
      *(_QWORD *)&v10 = v8 | 1;
    }
    --v3;
  }
  while (v3);
  return result;
}

double operator*@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v4[2];

  v4[0] = a2;
  v4[1] = 0;
  *(_QWORD *)&result = IOTS_U128::operator*(a1, v4, a3).n128_u64[0];
  return result;
}

double operator*@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v4[2];

  v4[0] = a1;
  v4[1] = 0;
  *(_QWORD *)&result = IOTS_U128::operator*(v4, a2, a3).n128_u64[0];
  return result;
}

unint64_t operator>>(_QWORD *a1, int a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = a1[1];
  v3 = v2 >> a2;
  if (a2 <= 63)
    v3 = (v2 << -(char)a2) | (*a1 >> a2);
  if (a2 == 64)
    v3 = a1[1];
  if (a2)
    return v3;
  else
    return *a1;
}

unint64_t TSIntervalXtoIntervalY(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v15;
  _BYTE buf[22];
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!(a1 >> 31) && !HIDWORD(a3))
    return (2 * a1 * a3 / a2 + 1) >> 1;
  v7 = IOTS_uint64mul(a1, a3);
  *((_QWORD *)&v9 + 1) = v8;
  *(_QWORD *)&v9 = v7;
  v15 = v9 * 2;
  *(_QWORD *)buf = a2;
  *(_QWORD *)&buf[8] = 0;
  v10 = IOTS_U128::operator/(&v15, (unint64_t *)buf);
  if (v10 == -1)
    v12 = v11 + 1;
  else
    v12 = v11;
  *((_QWORD *)&v13 + 1) = v12;
  *(_QWORD *)&v13 = v10 + 1;
  v6 = v13 >> 1;
  if (v12 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSIntervalXtoIntervalY  timeYDelta128 is ridiculously big!\n", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "timeXDelta %llu intervalX %llu intervalY %llu\n", buf, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v12 >> 1;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "timeYDelta %llx.%016llx\n", buf, 0x16u);
    }
  }
  return v6;
}

uint64_t TSTimeXtoTimeY(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  result = -1;
  if (a4 != -1 && a1 != -1 && a2 != -1)
  {
    if (a1 >= a2)
      v11 = a1 - a2;
    else
      v11 = a2 - a1;
    v12 = TSIntervalXtoIntervalY(v11, a3, a5);
    if (a1 >= a2)
      v13 = v12;
    else
      v13 = -(uint64_t)v12;
    return v13 + a4;
  }
  return result;
}

unint64_t __C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t *a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t result;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;

  v10 = IOTS_uint64mul(a1, a2);
  v12 = v11;
  result = IOTS_uint64mul(a3, a4);
  if (v12 | v14)
  {
    do
    {
      do
      {
        v15 = v12;
        *((_QWORD *)&v16 + 1) = v12;
        *(_QWORD *)&v16 = v10;
        v10 = v16 >> 1;
        v17 = v14;
        v12 >>= 1;
        v14 >>= 1;
        *((_QWORD *)&v16 + 1) = v17;
        *(_QWORD *)&v16 = result;
        result = v16 >> 1;
      }
      while (v15 > 1);
    }
    while (v17 > 1);
  }
  if (((v10 | result) & 1) != 0)
  {
    v19 = result;
    v18 = v10;
    if (a5)
LABEL_7:
      *a5 = v18;
  }
  else
  {
    do
    {
      v18 = v10 >> 1;
      v19 = result >> 1;
      v20 = v10 | result;
      v10 >>= 1;
      result >>= 1;
    }
    while ((v20 & 2) == 0);
    if (a5)
      goto LABEL_7;
  }
  if (a6)
    *a6 = v19;
  return result;
}

unint64_t __C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t result;
  unint64_t v29;
  unint64_t v30;
  __int128 v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;

  v14 = IOTS_uint64mul(a1, a2);
  v16 = v15;
  v17 = IOTS_uint64mul(a4, a5);
  if (v16 | v18)
  {
    do
    {
      do
      {
        v19 = v16;
        *((_QWORD *)&v20 + 1) = v16;
        *(_QWORD *)&v20 = v14;
        v14 = v20 >> 1;
        v21 = v18;
        v16 >>= 1;
        v18 >>= 1;
        *((_QWORD *)&v20 + 1) = v21;
        *(_QWORD *)&v20 = v17;
        v17 = v20 >> 1;
      }
      while (v19 > 1);
    }
    while (v21 > 1);
  }
  if (((v14 | v17) & 1) != 0)
  {
    v23 = v17;
    v22 = v14;
  }
  else
  {
    do
    {
      v22 = v14 >> 1;
      v23 = v17 >> 1;
      v24 = v14 | v17;
      v14 >>= 1;
      v17 >>= 1;
    }
    while ((v24 & 2) == 0);
  }
  v25 = IOTS_uint64mul(v22, a3);
  v27 = v26;
  result = IOTS_uint64mul(v23, a6);
  if (v27 | v29)
  {
    do
    {
      do
      {
        v30 = v27;
        *((_QWORD *)&v31 + 1) = v27;
        *(_QWORD *)&v31 = v25;
        v25 = v31 >> 1;
        v32 = v29;
        v27 >>= 1;
        v29 >>= 1;
        *((_QWORD *)&v31 + 1) = v32;
        *(_QWORD *)&v31 = result;
        result = v31 >> 1;
      }
      while (v30 > 1);
    }
    while (v32 > 1);
  }
  if (((v25 | result) & 1) != 0)
  {
    v34 = result;
    v33 = v25;
    if (a7)
LABEL_14:
      *a7 = v33;
  }
  else
  {
    do
    {
      v33 = v25 >> 1;
      v34 = result >> 1;
      v35 = v25 | result;
      v25 >>= 1;
      result >>= 1;
    }
    while ((v35 & 2) == 0);
    if (a7)
      goto LABEL_14;
  }
  if (a8)
    *a8 = v34;
  return result;
}

void sub_1B56F9840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B56F98D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B56F9974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B56F9CEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1B56FA000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B56FAC60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56FAF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B56FB14C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56FB758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B56FB958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56FBAEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B56FC540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t IIR(IOTS_U128 *a1, IOTS_U128 a2, unsigned int a3)
{
  unint64_t hi;
  unint64_t lo;
  char v7;
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;

  hi = a2.hi;
  lo = a2.lo;
  v7 = a3;
  result = operator>>(a1, a3);
  v10 = hi >> v7;
  if (a3 > 0x3F)
  {
    v11 = 0;
  }
  else
  {
    v10 = (hi << -(char)a3) | (lo >> a3);
    v11 = hi >> a3;
  }
  if (a3 == 64)
  {
    v10 = hi;
    v11 = 0;
  }
  if (!a3)
  {
    v10 = lo;
    v11 = hi;
  }
  v12 = a1->lo - result;
  v13 = __CFADD__(v12, v10);
  v14 = v12 + v10;
  v15 = v13;
  if (v14 < v12)
    v16 = 1;
  else
    v16 = v15;
  v17 = ((__PAIR128__(v11 - v9 + a1->hi, a1->lo) - result) >> 64) + v16;
  a1->lo = v14;
  a1->hi = v17;
  return result;
}

void sub_1B56FEF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void asyncNotificationsCallback_0(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v7 = (void *)MEMORY[0x1B5E4E6F0]();
  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getObject:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = v10;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v10, "_handleRefreshConnection");
    }
    else if (a4 >= 3)
    {
      objc_msgSend(v10, "_handleNotification:withArgs:ofCount:", *a3, a3 + 2, a4 - 1);
    }

  }
  objc_autoreleasePoolPop(v7);
}

void TSBARegisterServiceReply(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1B5E4E6F0]();
  if (a3)
  {
    TSBonjourErrorFromErrorCode(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "description");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = 136315138;
      v17 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error registering service: %s\n", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    objc_msgSend(a7, "registeredServiceWithName:regType:domain:withFlags:", a4, a5, a6, a2);
  }
  objc_autoreleasePoolPop(v13);
}

TSClockInterface *TimeSyncClockCreateWithClockIdentifier(uint64_t a1)
{
  TSClockInterface *v2;
  TSClockInterface *v3;
  _BYTE v5[24];
  void *v6;
  _BYTE v7[10];
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = -[TSClockInterface initWithClockIdentifier:]([TSClockInterface alloc], "initWithClockIdentifier:", a1);
  if (v2)
  {
    if (TimeSyncClockCreateWithClockIdentifier_onceToken != -1)
      dispatch_once(&TimeSyncClockCreateWithClockIdentifier_onceToken, &__block_literal_global_148);
    v3 = v2;
    *(_QWORD *)v5 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v5[8] = 3221225472;
    *(_QWORD *)&v5[16] = __TimeSyncClockAddRef_block_invoke;
    v6 = &__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)v7 = v3;
    dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 136316418;
    *(_QWORD *)&v5[4] = "newInterface != nil";
    *(_WORD *)&v5[12] = 2048;
    *(_QWORD *)&v5[14] = 0;
    *(_WORD *)&v5[22] = 2048;
    v6 = 0;
    *(_WORD *)v7 = 2080;
    *(_QWORD *)&v7[2] = "";
    v8 = 2080;
    v9 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v10 = 1024;
    v11 = 500;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v5, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 134218240;
    *(_QWORD *)&v5[4] = a1;
    *(_WORD *)&v5[12] = 2048;
    *(_QWORD *)&v5[14] = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateWithClockIdentifier(0x%016llx) = %p", v5, 0x16u);
  }

  return v2;
}

void TimeSyncClockDispose(void *a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v9[24];
  void *v10;
  _BYTE v11[10];
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 134217984;
    *(_QWORD *)&v9[4] = a1;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockDispose(%p)", v9, 0xCu);
  }
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "clock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeUserFilteredClockWithIdentifier:error:", objc_msgSend(v5, "clockIdentifier"), 0);

    }
    *(_QWORD *)v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v9[8] = 3221225472;
    *(_QWORD *)&v9[16] = __TimeSyncClockRemoveRef_block_invoke;
    v10 = &__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)v11 = a1;
    dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v9);
    if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
    {
      objc_msgSend(a1, "clock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeClient:", a1);

      +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "translationClock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeClient:", a1);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v9 = 136316418;
      *(_QWORD *)&v9[4] = "TimeSyncClockValidRef(clockRef)";
      *(_WORD *)&v9[12] = 2048;
      *(_QWORD *)&v9[14] = 0;
      *(_WORD *)&v9[22] = 2048;
      v10 = 0;
      *(_WORD *)v11 = 2080;
      *(_QWORD *)&v11[2] = "";
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v14 = 1024;
      v15 = 528;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v9, 0x3Au);
    }
    a1 = 0;
  }

}

uint64_t TimeSyncClockValidRef(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __TimeSyncClockValidRef_block_invoke;
  v3[3] = &unk_1E694BA28;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t TimeSyncClockGetHostTimeForClockTime(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "convertFromDomainToMachAbsoluteTime:", a2);

  }
  else
  {
    v5 = -1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "TimeSyncClockValidRef(clockRef)";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v17 = 1024;
      v18 = 559;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218496;
    v8 = (const char *)a1;
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetHostTimeForClockTime(%p, %llu) = %llu", (uint8_t *)&v7, 0x20u);
  }
  return v5;
}

uint64_t TimeSyncClockGetClockTimeForHostTime(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "convertFromMachAbsoluteToDomainTime:", a2);

  }
  else
  {
    v5 = -1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = "TimeSyncClockValidRef(clockRef)";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v17 = 1024;
      v18 = 581;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218496;
    v8 = (const char *)a1;
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockTimeForHostTime(%p, %llu) = %llu", (uint8_t *)&v7, 0x20u);
  }
  return v5;
}

double TimeSyncClockGetClockRate(void *a1)
{
  void *v2;
  double v3;
  double v4;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hostRateRatio");
    v4 = v3;

  }
  else
  {
    v4 = 0.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316418;
      v7 = "TimeSyncClockValidRef(clockRef)";
      v8 = 2048;
      v9 = 0.0;
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v16 = 1024;
      v17 = 602;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRate(%p) = %f", (uint8_t *)&v6, 0x16u);
  }
  return v4;
}

uint64_t TimeSyncClockGetClockRateAndAnchors(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t *v27;
  __int16 v28;
  uint64_t *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v11 = objc_msgSend(v10, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", a2, a3, a4, a5, &v23);
    v12 = v23;

    if ((v11 & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v12, "code");
  }
  else
  {
    v13 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "TimeSyncClockValidRef(clockRef)";
      v26 = 2048;
      v27 = 0;
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v34 = 1024;
      LODWORD(v35) = 628;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v12 = 0;
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = &TSInvalidTime;
    if (a2)
      v15 = a2;
    else
      v15 = &TSInvalidTime;
    v16 = *v15;
    if (a3)
      v17 = a3;
    else
      v17 = &TSInvalidTime;
    v18 = *v17;
    if (a4)
      v19 = a4;
    else
      v19 = &TSInvalidTime;
    v20 = *v19;
    if (a5)
      v14 = a5;
    v21 = *v14;
    *(_DWORD *)buf = 134220288;
    v25 = (const char *)a1;
    v26 = 2048;
    v27 = a2;
    v28 = 2048;
    v29 = a3;
    v30 = 2048;
    v31 = (const char *)a4;
    v32 = 2048;
    v33 = (const char *)a5;
    v34 = 2048;
    v35 = v16;
    v36 = 2048;
    v37 = v18;
    v38 = 2048;
    v39 = v20;
    v40 = 2048;
    v41 = v21;
    v42 = 1024;
    v43 = v13;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRateAndAnchors(%p, %p, %p, %p, %p) = (%llu, %llu, %llu, %llu) 0x%08x", buf, 0x62u);
  }

  return v13;
}

uint64_t TimeSyncClockGetClockIdentifier(void *a1)
{
  void *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "clockIdentifier");

  }
  else
  {
    v3 = -1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TimeSyncClockValidRef(clockRef)";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v15 = 1024;
      v16 = 661;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218240;
    v6 = (const char *)a1;
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockIdentifier(%p) = 0x%016llx", (uint8_t *)&v5, 0x16u);
  }
  return v3;
}

uint64_t TimeSyncClockGetLockState(void *a1)
{
  void *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "lockState");

  }
  else
  {
    v3 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316418;
      v6 = "TimeSyncClockValidRef(clockRef)";
      v7 = 2048;
      v8 = 0;
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v15 = 1024;
      v16 = 682;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
      v3 = 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218240;
    v6 = (const char *)a1;
    v7 = 1024;
    LODWORD(v8) = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetLockState(%p) = %u", (uint8_t *)&v5, 0x12u);
  }
  return v3;
}

void TimeSyncClockSetLockStateChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setLockStateNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 700;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetLockStateChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetMasterChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setMasterChangeNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 718;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetMasterChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetTimeSyncTimeChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setTimeSyncTimeChangeNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 736;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetTimeSyncTimeChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetConnectionInterruptedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v11[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (a2)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __TimeSyncClockSetConnectionInterruptedCallback_block_invoke;
        v11[3] = &__block_descriptor_56_e23_v16__0__TSKernelClock_8l;
        v11[4] = a2;
        v11[5] = a1;
        v11[6] = a3;
        objc_msgSend(a1, "clock");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = v11;
      }
      else
      {
        objc_msgSend(a1, "clock");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0;
      }
      objc_msgSend(v8, "setInterruptionHandler:", v10);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "TimeSyncClockValidRef(clockRef)";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v22 = 1024;
    v23 = 758;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v13 = (const char *)a1;
    v14 = 2048;
    v15 = a2;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetConnectionInterruptedCallback(%p, %p, %p)", buf, 0x20u);
  }
}

id TimeSyncClockCreateAudioClockDeviceUID(void *a1)
{
  void *v2;
  id v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[TSClockManager timeSyncAudioClockDeviceUIDForClockIdentifier:](TSClockManager, "timeSyncAudioClockDeviceUIDForClockIdentifier:", objc_msgSend(v2, "clockIdentifier"));

    if (v3)
    {
      CFRetain(v3);
      goto LABEL_4;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316418;
      v7 = "result";
      v8 = 2048;
      v9 = 0;
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v16 = 1024;
      v17 = 794;
      v5 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 791;
    v5 = MEMORY[0x1E0C81028];
LABEL_11:
    _os_log_impl(&dword_1B56CB000, v5, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  v3 = 0;
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = (const char *)a1;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateAudioClockDeviceUID(%p) = %@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

uint64_t TimeSyncClockGetHostTimeAndGrandmasterIdentityForClockTime(void *a1, uint64_t a2, uint64_t *a3)
{
  __int16 v4;

  v4 = 0;
  return TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(a1, a2, a3, (const char *)&v4);
}

uint64_t TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(void *a1, uint64_t a2, uint64_t *a3, const char *a4)
{
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t *v12;
  const char *v13;
  int v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v17 = 136316418;
    v18 = "TimeSyncClockValidRef(clockRef)";
    v19 = 2048;
    v20 = 0;
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = "";
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v27 = 1024;
    v28 = 830;
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_19;
  }
  objc_msgSend(a1, "clock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", a2, a3, a4);

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136316418;
    v18 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    v19 = 2048;
    v20 = 0;
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = "";
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v27 = 1024;
    v28 = 832;
    v16 = MEMORY[0x1E0C81028];
LABEL_19:
    _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v17, 0x3Au);
  }
LABEL_4:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = &TSNullgPTPClockIdentity;
    if (a3)
      v12 = a3;
    v13 = (const char *)*v12;
    if (a4)
      v14 = *(unsigned __int16 *)a4;
    else
      v14 = 0xFFFF;
    v17 = 134219520;
    v18 = (const char *)a1;
    v19 = 2048;
    v20 = a2;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = v13;
    v27 = 1024;
    v28 = v14;
    v29 = 2048;
    v30 = v8;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(%p, %llu, %p, %p) = (0x%016llx, %hu) %llu", (uint8_t *)&v17, 0x44u);
  }
  return v8;
}

uint64_t TimeSyncClockGetClockTimeAndGrandmasterIdentityForHostTime(void *a1, uint64_t a2, uint64_t *a3)
{
  __int16 v4;

  v4 = 0;
  return TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(a1, a2, a3, (const char *)&v4);
}

uint64_t TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(void *a1, uint64_t a2, uint64_t *a3, const char *a4)
{
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t *v12;
  const char *v13;
  int v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v17 = 136316418;
    v18 = "TimeSyncClockValidRef(clockRef)";
    v19 = 2048;
    v20 = 0;
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = "";
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v27 = 1024;
    v28 = 869;
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_19;
  }
  objc_msgSend(a1, "clock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", a2, a3, a4);

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136316418;
    v18 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    v19 = 2048;
    v20 = 0;
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = "";
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v27 = 1024;
    v28 = 871;
    v16 = MEMORY[0x1E0C81028];
LABEL_19:
    _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v17, 0x3Au);
  }
LABEL_4:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = &TSNullgPTPClockIdentity;
    if (a3)
      v12 = a3;
    v13 = (const char *)*v12;
    if (a4)
      v14 = *(unsigned __int16 *)a4;
    else
      v14 = 0xFFFF;
    v17 = 134219520;
    v18 = (const char *)a1;
    v19 = 2048;
    v20 = a2;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = v13;
    v27 = 1024;
    v28 = v14;
    v29 = 2048;
    v30 = v8;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(%p, %llu, %p, %p) = (0x%016llx, %hu) %llu", (uint8_t *)&v17, 0x44u);
  }
  return v8;
}

uint64_t TimeSyncClockGetClockRateAnchorsAndGrandmasterIdentity(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  NSObject *v29;
  id v30;
  __int16 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t *v35;
  __int16 v36;
  uint64_t *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  uint64_t *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v17 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v33 = "TimeSyncClockValidRef(clockRef)";
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      v37 = 0;
      v38 = 2080;
      v39 = "";
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v42 = 1024;
      LODWORD(v43) = 900;
      v29 = MEMORY[0x1E0C81028];
LABEL_29:
      _os_log_impl(&dword_1B56CB000, v29, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_30:
    v16 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "clock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v17 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v33 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      v37 = 0;
      v38 = 2080;
      v39 = "";
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v42 = 1024;
      LODWORD(v43) = 902;
      v29 = MEMORY[0x1E0C81028];
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  objc_msgSend(a1, "clock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v15 = objc_msgSend(v14, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a2, a3, a4, a5, a6, &v31, &v30);
  v16 = v30;

  if ((v15 & 1) != 0)
    v17 = 0;
  else
    v17 = objc_msgSend(v16, "code");
LABEL_6:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v18 = &TSInvalidTime;
    if (a2)
      v19 = a2;
    else
      v19 = &TSInvalidTime;
    v20 = *v19;
    if (a3)
      v21 = a3;
    else
      v21 = &TSInvalidTime;
    v22 = *v21;
    if (a4)
      v23 = a4;
    else
      v23 = &TSInvalidTime;
    v24 = *v23;
    if (a5)
      v18 = a5;
    v25 = *v18;
    v26 = &TSNullgPTPClockIdentity;
    if (a6)
      v26 = a6;
    v27 = *v26;
    *(_DWORD *)buf = 134220800;
    v33 = (const char *)a1;
    v34 = 2048;
    v35 = a2;
    v36 = 2048;
    v37 = a3;
    v38 = 2048;
    v39 = (const char *)a4;
    v40 = 2048;
    v41 = (const char *)a5;
    v42 = 2048;
    v43 = a6;
    v44 = 2048;
    v45 = v20;
    v46 = 2048;
    v47 = v22;
    v48 = 2048;
    v49 = v24;
    v50 = 2048;
    v51 = v25;
    v52 = 2048;
    v53 = v27;
    v54 = 1024;
    v55 = v17;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRateAnchorsAndGrandmasterIdentity(%p, %p, %p, %p, %p, %p) = (%llu, %llu, %llu, %llu, 0x%016llx) 0x%08x", buf, 0x76u);
  }

  return v17;
}

uint64_t TimeSyncClockGetgPTPGrandmasterIdentity(void *a1)
{
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v8 = 136316418;
    v9 = "TimeSyncClockValidRef(clockRef)";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v18 = 1024;
    v19 = 930;
    v7 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  objc_msgSend(a1, "clock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "grandmasterIdentity");

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136316418;
    v9 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v18 = 1024;
    v19 = 932;
    v7 = MEMORY[0x1E0C81028];
LABEL_11:
    _os_log_impl(&dword_1B56CB000, v7, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = (const char *)a1;
    v10 = 2048;
    v11 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetgPTPGrandmasterIdentity(%p) = 0x%016llx", (uint8_t *)&v8, 0x16u);
  }
  return v2;
}

void TimeSyncClockSetgPTPGrandmasterChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setgPTPGrandmasterNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 950;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPGrandmasterChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetgPTPGrandmasterAndPortChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setgPTPGrandmasterIDAndPortNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 968;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPGrandmasterAndPortChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetgPTPLocalPortChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setgPTPLocalPortNotificationCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncClockValidRef(clockRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 986;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPLocalPortChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t TimeSyncClockAddUDPv4EndToEndPort(void *a1, uint64_t a2, uint64_t a3)
{
  __int16 v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  return TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, _WORD *a5)
{
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[10];
  const char *v29;
  __int128 v30;
  _WORD *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v24 = "TimeSyncClockValidRef(clockRef)";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    *(_QWORD *)v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    v29 = "";
    LOWORD(v30) = 2080;
    *(_QWORD *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1026;
    v21 = MEMORY[0x1E0C81028];
LABEL_24:
    _os_log_impl(&dword_1B56CB000, v21, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v24 = "clockIdentity != nil";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    *(_QWORD *)v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    v29 = "";
    LOWORD(v30) = 2080;
    *(_QWORD *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1028;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  if (!a5)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v24 = "localPortNumber != nil";
    v25 = 2048;
    v26 = 0;
    v27 = 2048;
    *(_QWORD *)v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    v29 = "";
    LOWORD(v30) = 2080;
    *(_QWORD *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1029;
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  objc_msgSend(a1, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v24 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v25 = 2048;
      v26 = 0;
      v27 = 2048;
      *(_QWORD *)v28 = 0;
      *(_WORD *)&v28[8] = 2080;
      v29 = "";
      LOWORD(v30) = 2080;
      *(_QWORD *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      WORD5(v30) = 1024;
      HIDWORD(v30) = 1031;
      v21 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
LABEL_25:
    v15 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = objc_msgSend(v12, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a2, a3, a5, &v22);
  v14 = v22;
  v15 = v14;
  if (v13)
  {
    v16 = 0;
    *a4 = objc_msgSend(v12, "clockIdentity");
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    v16 = objc_msgSend(v14, "code");
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = &TSNullClockIdentifier;
    if (a4)
      v17 = a4;
    v18 = *v17;
    if (a5)
      v19 = (unsigned __int16)*a5;
    else
      v19 = 0xFFFF;
    *(_DWORD *)buf = 134220546;
    v24 = (const char *)a1;
    v25 = 2112;
    v26 = a2;
    v27 = 1024;
    *(_DWORD *)v28 = (int)a3 >> 24;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = (int)((_DWORD)a3 << 8) >> 24;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = (__int16)a3 >> 8;
    HIWORD(v29) = 1024;
    LODWORD(v30) = (char)a3;
    WORD2(v30) = 2048;
    *(_QWORD *)((char *)&v30 + 6) = a4;
    HIWORD(v30) = 2048;
    v31 = a5;
    v32 = 2048;
    v33 = v18;
    v34 = 1024;
    v35 = v19;
    v36 = 1024;
    v37 = v16;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(%p, %@, %hhu.%hhu.%hhu.%hhu, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0x58u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveUDPv4EndToEndPort(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BYTE v21[10];
  const char *v22;
  _BYTE v23[10];
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "TimeSyncClockValidRef(clockRef)";
      v18 = 2048;
      v19 = 0;
      v20 = 2048;
      *(_QWORD *)v21 = 0;
      *(_WORD *)&v21[8] = 2080;
      v22 = "";
      *(_WORD *)v23 = 2080;
      *(_QWORD *)&v23[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v24 = 1024;
      v25 = 1068;
      v14 = MEMORY[0x1E0C81028];
LABEL_13:
      _os_log_impl(&dword_1B56CB000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    v11 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v18 = 2048;
      v19 = 0;
      v20 = 2048;
      *(_QWORD *)v21 = 0;
      *(_WORD *)&v21[8] = 2080;
      v22 = "";
      *(_WORD *)v23 = 2080;
      *(_QWORD *)&v23[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v24 = 1024;
      v25 = 1070;
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:", a2, a3, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v10, "code");
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219522;
    v17 = (const char *)a1;
    v18 = 2112;
    v19 = a2;
    v20 = 1024;
    *(_DWORD *)v21 = (int)a3 >> 24;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = (int)((_DWORD)a3 << 8) >> 24;
    LOWORD(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 2) = (__int16)a3 >> 8;
    HIWORD(v22) = 1024;
    *(_DWORD *)v23 = (char)a3;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v12;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveUDPv4EndToEndPort(%p, %@, %hhu.%hhu.%hhu.%hhu) = 0x%08x", buf, 0x34u);
  }

  return v12;
}

uint64_t TimeSyncClockAddUDPv6EndToEndPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  __int16 v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  return TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, _WORD *a5)
{
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  NSObject *v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  _BYTE v44[10];
  const char *v45;
  _BYTE v46[10];
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t *v70;
  __int16 v71;
  _WORD *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v40 = "TimeSyncClockValidRef(clockRef)";
    v41 = 2048;
    v42 = 0;
    v43 = 2048;
    *(_QWORD *)v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    v45 = "";
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v47 = 1024;
    v48 = 1119;
    v37 = MEMORY[0x1E0C81028];
LABEL_24:
    _os_log_impl(&dword_1B56CB000, v37, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v40 = "clockIdentity != nil";
    v41 = 2048;
    v42 = 0;
    v43 = 2048;
    *(_QWORD *)v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    v45 = "";
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v47 = 1024;
    v48 = 1121;
    v37 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  if (!a5)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v40 = "localPortNumber != nil";
    v41 = 2048;
    v42 = 0;
    v43 = 2048;
    *(_QWORD *)v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    v45 = "";
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v47 = 1024;
    v48 = 1122;
    v37 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  objc_msgSend(a1, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v40 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v41 = 2048;
      v42 = 0;
      v43 = 2048;
      *(_QWORD *)v44 = 0;
      *(_WORD *)&v44[8] = 2080;
      v45 = "";
      *(_WORD *)v46 = 2080;
      *(_QWORD *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v47 = 1024;
      v48 = 1124;
      v37 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
LABEL_25:
    v15 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v13 = objc_msgSend(v12, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a2, a3, a5, &v38);
  v14 = v38;
  v15 = v14;
  if (v13)
  {
    v16 = 0;
    *a4 = objc_msgSend(v12, "clockIdentity");
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    v16 = objc_msgSend(v14, "code");
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = *a3;
    v18 = a3[1];
    v19 = a3[2];
    v20 = a3[3];
    v21 = a3[4];
    v22 = a3[5];
    v23 = a3[6];
    v24 = a3[7];
    v25 = a3[8];
    v26 = a3[9];
    v27 = a3[10];
    v28 = a3[11];
    v29 = a3[12];
    v30 = a3[13];
    v31 = a3[14];
    v32 = a3[15];
    v33 = &TSNullClockIdentifier;
    if (a4)
      v33 = a4;
    v34 = *v33;
    if (a5)
      v35 = (unsigned __int16)*a5;
    else
      v35 = 0xFFFF;
    *(_DWORD *)buf = 134223618;
    v40 = (const char *)a1;
    v41 = 2112;
    v42 = a2;
    v43 = 1024;
    *(_DWORD *)v44 = v17;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v18;
    LOWORD(v45) = 1024;
    *(_DWORD *)((char *)&v45 + 2) = v19;
    HIWORD(v45) = 1024;
    *(_DWORD *)v46 = v20;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v21;
    v47 = 1024;
    v48 = v22;
    v49 = 1024;
    v50 = v23;
    v51 = 1024;
    v52 = v24;
    v53 = 1024;
    v54 = v25;
    v55 = 1024;
    v56 = v26;
    v57 = 1024;
    v58 = v27;
    v59 = 1024;
    v60 = v28;
    v61 = 1024;
    v62 = v29;
    v63 = 1024;
    v64 = v30;
    v65 = 1024;
    v66 = v31;
    v67 = 1024;
    v68 = v32;
    v69 = 2048;
    v70 = a4;
    v71 = 2048;
    v72 = a5;
    v73 = 2048;
    v74 = v34;
    v75 = 1024;
    v76 = v35;
    v77 = 1024;
    v78 = v16;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(%p, %@, %02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0xA0u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveUDPv6EndToEndPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BYTE v37[10];
  const char *v38;
  _BYTE v39[10];
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v33 = "TimeSyncClockValidRef(clockRef)";
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      *(_QWORD *)v37 = 0;
      *(_WORD *)&v37[8] = 2080;
      v38 = "";
      *(_WORD *)v39 = 2080;
      *(_QWORD *)&v39[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v40 = 1024;
      v41 = 1161;
      v30 = MEMORY[0x1E0C81028];
LABEL_13:
      _os_log_impl(&dword_1B56CB000, v30, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    v11 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v33 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      *(_QWORD *)v37 = 0;
      *(_WORD *)&v37[8] = 2080;
      v38 = "";
      *(_WORD *)v39 = 2080;
      *(_QWORD *)&v39[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v40 = 1024;
      v41 = 1163;
      v30 = MEMORY[0x1E0C81028];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v9 = objc_msgSend(v8, "removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:", a2, a3, &v31);
  v10 = v31;
  v11 = v10;
  if ((v9 & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v10, "code");
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *a3;
    v14 = a3[1];
    v15 = a3[2];
    v16 = a3[3];
    v17 = a3[4];
    v18 = a3[5];
    v19 = a3[6];
    v20 = a3[7];
    v21 = a3[8];
    v22 = a3[9];
    v23 = a3[10];
    v24 = a3[11];
    v25 = a3[12];
    v26 = a3[13];
    v27 = a3[14];
    v28 = a3[15];
    *(_DWORD *)buf = 134222594;
    v33 = (const char *)a1;
    v34 = 2112;
    v35 = a2;
    v36 = 1024;
    *(_DWORD *)v37 = v13;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v14;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v15;
    HIWORD(v38) = 1024;
    *(_DWORD *)v39 = v16;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v17;
    v40 = 1024;
    v41 = v18;
    v42 = 1024;
    v43 = v19;
    v44 = 1024;
    v45 = v20;
    v46 = 1024;
    v47 = v21;
    v48 = 1024;
    v49 = v22;
    v50 = 1024;
    v51 = v23;
    v52 = 1024;
    v53 = v24;
    v54 = 1024;
    v55 = v25;
    v56 = 1024;
    v57 = v26;
    v58 = 1024;
    v59 = v27;
    v60 = 1024;
    v61 = v28;
    v62 = 1024;
    v63 = v12;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveUDPv6EndToEndPort(%p, %@, %02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx) = 0x%08x", buf, 0x7Cu);
  }

  return v12;
}

uint64_t TimeSyncClockAddAWDLPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  __int16 v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  return TimeSyncClockAddAWDLPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddAWDLPortAndGetIdentity(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, _WORD *a5)
{
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BYTE v34[10];
  const char *v35;
  _BYTE v36[10];
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t *v40;
  __int16 v41;
  _WORD *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v30 = "TimeSyncClockValidRef(clockRef)";
    v31 = 2048;
    v32 = 0;
    v33 = 2048;
    *(_QWORD *)v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    v35 = "";
    *(_WORD *)v36 = 2080;
    *(_QWORD *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v37 = 1024;
    v38 = 1212;
    v27 = MEMORY[0x1E0C81028];
LABEL_24:
    _os_log_impl(&dword_1B56CB000, v27, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v30 = "clockIdentity != nil";
    v31 = 2048;
    v32 = 0;
    v33 = 2048;
    *(_QWORD *)v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    v35 = "";
    *(_WORD *)v36 = 2080;
    *(_QWORD *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v37 = 1024;
    v38 = 1214;
    v27 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  if (!a5)
  {
    v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136316418;
    v30 = "localPortNumber != nil";
    v31 = 2048;
    v32 = 0;
    v33 = 2048;
    *(_QWORD *)v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    v35 = "";
    *(_WORD *)v36 = 2080;
    *(_QWORD *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v37 = 1024;
    v38 = 1215;
    v27 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  objc_msgSend(a1, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v30 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v31 = 2048;
      v32 = 0;
      v33 = 2048;
      *(_QWORD *)v34 = 0;
      *(_WORD *)&v34[8] = 2080;
      v35 = "";
      *(_WORD *)v36 = 2080;
      *(_QWORD *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v37 = 1024;
      v38 = 1217;
      v27 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
LABEL_25:
    v15 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v13 = objc_msgSend(v12, "addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a2, a3, a5, &v28);
  v14 = v28;
  v15 = v14;
  if (v13)
  {
    v16 = 0;
    *a4 = objc_msgSend(v12, "clockIdentity");
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    v16 = objc_msgSend(v14, "code");
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = *a3;
    v18 = a3[1];
    v19 = a3[2];
    v20 = a3[3];
    v21 = a3[4];
    v22 = a3[5];
    v23 = &TSNullClockIdentifier;
    if (a4)
      v23 = a4;
    v24 = *v23;
    if (a5)
      v25 = (unsigned __int16)*a5;
    else
      v25 = 0xFFFF;
    *(_DWORD *)buf = 134221058;
    v30 = (const char *)a1;
    v31 = 2112;
    v32 = a2;
    v33 = 1024;
    *(_DWORD *)v34 = v17;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v18;
    LOWORD(v35) = 1024;
    *(_DWORD *)((char *)&v35 + 2) = v19;
    HIWORD(v35) = 1024;
    *(_DWORD *)v36 = v20;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v21;
    v37 = 1024;
    v38 = v22;
    v39 = 2048;
    v40 = a4;
    v41 = 2048;
    v42 = a5;
    v43 = 2048;
    v44 = v24;
    v45 = 1024;
    v46 = v25;
    v47 = 1024;
    v48 = v16;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddAWDLPortAndGetIdentity(%p, %@, %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0x64u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveAWDLPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  _BYTE v27[10];
  const char *v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "TimeSyncClockValidRef(clockRef)";
      v24 = 2048;
      v25 = 0;
      v26 = 2048;
      *(_QWORD *)v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      v28 = "";
      *(_WORD *)v29 = 2080;
      *(_QWORD *)&v29[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v30 = 1024;
      v31 = 1254;
      v20 = MEMORY[0x1E0C81028];
LABEL_13:
      _os_log_impl(&dword_1B56CB000, v20, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    v11 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v24 = 2048;
      v25 = 0;
      v26 = 2048;
      *(_QWORD *)v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      v28 = "";
      *(_WORD *)v29 = 2080;
      *(_QWORD *)&v29[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v30 = 1024;
      v31 = 1256;
      v20 = MEMORY[0x1E0C81028];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v9 = objc_msgSend(v8, "removeUnicastLinkLayerEtEPortFromInterfaceNamed:withDestinationAddress:error:", a2, a3, &v21);
  v10 = v21;
  v11 = v10;
  if ((v9 & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v10, "code");
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *a3;
    v14 = a3[1];
    v15 = a3[2];
    v16 = a3[3];
    v17 = a3[4];
    v18 = a3[5];
    *(_DWORD *)buf = 134220034;
    v23 = (const char *)a1;
    v24 = 2112;
    v25 = a2;
    v26 = 1024;
    *(_DWORD *)v27 = v13;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v14;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v15;
    HIWORD(v28) = 1024;
    *(_DWORD *)v29 = v16;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v17;
    v30 = 1024;
    v31 = v18;
    v32 = 1024;
    v33 = v12;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveAWDLPort(%p, %@, %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx) = 0x%08x", buf, 0x40u);
  }

  return v12;
}

uint64_t TimeSyncClockSetAllPortRemoteSyncMessageIntervals(void *a1, unsigned int a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  NSObject *v16;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "TimeSyncClockValidRef(clockRef)";
      v28 = 2048;
      *(_QWORD *)v29 = 0;
      *(_WORD *)&v29[8] = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v35 = 1024;
      v36 = 1294;
      v16 = MEMORY[0x1E0C81028];
LABEL_22:
      _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_23:
    v8 = 0;
    v14 = 0;
    goto LABEL_15;
  }
  objc_msgSend(a1, "clock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v28 = 2048;
      *(_QWORD *)v29 = 0;
      *(_WORD *)&v29[8] = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v35 = 1024;
      v36 = 1296;
      v16 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_msgSend(a1, "clock");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v8;
          objc_msgSend(v12, "requestRemoteMessageIntervalsWithPDelayMessageInterval:syncMessageInterval:announceMessageInterval:error:", TSMessageIntervalIgnore, a2, TSMessageIntervalIgnore, &v20);
          v13 = v20;

          v9 = 3758097095;
          v8 = v13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v14 = v18;
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v27 = (const char *)a1;
    v28 = 1024;
    *(_DWORD *)v29 = a2;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v9;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetAllPortRemoteSyncMessageIntervals(%p, %hhd) = 0x%08x", buf, 0x18u);
  }

  return v9;
}

uint64_t TimeSyncClockOverridePortReceiveMatching(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  _BYTE v23[20];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "TimeSyncClockValidRef(clockRef)";
      v22 = 2048;
      *(_QWORD *)v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(_QWORD *)&v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v27 = 1024;
      v28 = 1338;
      v18 = MEMORY[0x1E0C81028];
LABEL_15:
      _os_log_impl(&dword_1B56CB000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    v15 = 0;
    v12 = 0;
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v22 = 2048;
      *(_QWORD *)v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(_QWORD *)&v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v27 = 1024;
      v28 = 1340;
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "portWithPortNumber:", a2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0;
      v13 = objc_msgSend(v12, "overrideReceiveMatchingWithRemoteClockIdentity:remotePortNumber:error:", a3, a4, &v19);
      v14 = v19;
      v15 = v14;
      if ((v13 & 1) != 0)
        v16 = 0;
      else
        v16 = objc_msgSend(v14, "code");
    }
    else
    {
      v16 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        v22 = 2048;
        *(_QWORD *)v23 = 0;
        *(_WORD *)&v23[8] = 2048;
        *(_QWORD *)&v23[10] = 0;
        *(_WORD *)&v23[18] = 2080;
        v24 = "";
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        v27 = 1024;
        v28 = 1348;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      v15 = 0;
    }
  }
  else
  {
    v16 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "port != nil";
      v22 = 2048;
      *(_QWORD *)v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(_QWORD *)&v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v27 = 1024;
      v28 = 1347;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v15 = 0;
    v12 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v21 = (const char *)a1;
    v22 = 1024;
    *(_DWORD *)v23 = a2;
    *(_WORD *)&v23[4] = 2048;
    *(_QWORD *)&v23[6] = a3;
    *(_WORD *)&v23[14] = 1024;
    *(_DWORD *)&v23[16] = a4;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = v16;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockOverridePortReceiveMatching(%p, %hu, 0x%016llx, %hu) = 0x%08x", buf, 0x28u);
  }

  return v16;
}

uint64_t TimeSyncClockRestorePortReceiveMatching(void *a1, uint64_t a2)
{
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  _BYTE v19[10];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "TimeSyncClockValidRef(clockRef)";
      v18 = 2048;
      *(_QWORD *)v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1377;
      v14 = MEMORY[0x1E0C81028];
LABEL_15:
      _os_log_impl(&dword_1B56CB000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    v11 = 0;
    v8 = 0;
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v18 = 2048;
      *(_QWORD *)v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1379;
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portWithPortNumber:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0;
      v9 = objc_msgSend(v8, "restoreReceiveMatchingError:", &v15);
      v10 = v15;
      v11 = v10;
      if ((v9 & 1) != 0)
        v12 = 0;
      else
        v12 = objc_msgSend(v10, "code");
    }
    else
    {
      v12 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        v18 = 2048;
        *(_QWORD *)v19 = 0;
        *(_WORD *)&v19[8] = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        v25 = 1024;
        v26 = 1387;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      v11 = 0;
    }
  }
  else
  {
    v12 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v17 = "port != nil";
      v18 = 2048;
      *(_QWORD *)v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1386;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v11 = 0;
    v8 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v17 = (const char *)a1;
    v18 = 1024;
    *(_DWORD *)v19 = a2;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v12;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRestorePortReceiveMatching(%p, %hu) = 0x%08x", buf, 0x18u);
  }

  return v12;
}

uint64_t TimeSyncClockGetCurrentPortInfo(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BYTE v21[20];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v14 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "TimeSyncClockValidRef(clockRef)";
      v20 = 2048;
      *(_QWORD *)v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1418;
      v16 = MEMORY[0x1E0C81028];
LABEL_15:
      _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    v13 = 0;
    v10 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v14 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      v20 = 2048;
      *(_QWORD *)v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1420;
      v16 = MEMORY[0x1E0C81028];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "portWithPortNumber:", a2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0;
      v11 = objc_msgSend(v10, "getCurrentPortInfo:error:", a3, &v17);
      v12 = v17;
      v13 = v12;
      if ((v11 & 1) != 0)
        v14 = 0;
      else
        v14 = objc_msgSend(v12, "code");
    }
    else
    {
      v14 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v19 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        v20 = 2048;
        *(_QWORD *)v21 = 0;
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = 0;
        *(_WORD *)&v21[18] = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        v25 = 1024;
        v26 = 1428;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      v13 = 0;
    }
  }
  else
  {
    v14 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "port != nil";
      v20 = 2048;
      *(_QWORD *)v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v25 = 1024;
      v26 = 1427;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v13 = 0;
    v10 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v19 = (const char *)a1;
    v20 = 1024;
    *(_DWORD *)v21 = a2;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = a3;
    *(_WORD *)&v21[14] = 1024;
    *(_DWORD *)&v21[16] = v14;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetCurrentPortInfo(%p, %hu, %p) = 0x%08x", buf, 0x22u);
  }

  return v14;
}

uint64_t TimeSyncClockAddTimestamps(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = 3758097090;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "clock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v10 = objc_msgSend(v9, "addTimestampWithMachAbsolute:andDomainTime:error:", a2, a3, &v14);
      v11 = v14;
      v12 = v11;
      if ((v10 & 1) != 0)
        v6 = 0;
      else
        v6 = objc_msgSend(v11, "code");

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v16 = "TimeSyncClockValidRef(clockRef)";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 1458;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v16 = (const char *)a1;
    v17 = 2048;
    v18 = a2;
    v19 = 2048;
    v20 = a3;
    v21 = 1024;
    LODWORD(v22) = v6;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddTimestamps(%p, %llu, %llu) = 0x%08x", buf, 0x26u);
  }
  return v6;
}

uint64_t TimeSyncClockResetFilter(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  id v9;
  void *v10;
  const char *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = 3758097090;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "clock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v8 = objc_msgSend(v7, "resetFilterToNominal:error:", a2, &v13);
      v9 = v13;
      v10 = v9;
      if ((v8 & 1) != 0)
        v4 = 0;
      else
        v4 = objc_msgSend(v9, "code");

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v15 = "TimeSyncClockValidRef(clockRef)";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v24 = 1024;
    v25 = 1494;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = "false";
    *(_DWORD *)buf = 134218498;
    v15 = (const char *)a1;
    if ((_DWORD)a2)
      v11 = "true";
    v16 = 2082;
    v17 = v11;
    v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockResetFilter(%p, %{public}s) = 0x%08x", buf, 0x1Cu);
  }
  return v4;
}

uint64_t TimeSyncClockResetClock(void *a1)
{
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = 3758097090;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "clock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "clock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v6 = objc_msgSend(v5, "resetSyncServiceWithError:", &v10);
      v7 = v10;
      v8 = v7;
      if ((v6 & 1) != 0)
        v2 = 0;
      else
        v2 = objc_msgSend(v7, "code");

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v12 = "TimeSyncClockValidRef(clockRef)";
    v13 = 2048;
    v14 = 0;
    v15 = 2048;
    v16 = 0;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v21 = 1024;
    v22 = 1527;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = (const char *)a1;
    v13 = 1024;
    LODWORD(v14) = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockResetClock(%p) = 0x%08x", buf, 0x12u);
  }
  return v2;
}

TSPortInterface *TimeSyncPortCreateFromClock(void *a1, uint64_t a2)
{
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  TSPortInterface *v9;
  TSPortInterface *v10;
  TSPortInterface *v11;
  NSObject *v13;
  _BYTE v14[32];
  _BYTE v15[10];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 136316418;
      *(_QWORD *)&v14[4] = "TimeSyncClockValidRef(clockRef)";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(_QWORD *)&v14[24] = 0;
      *(_WORD *)v15 = 2080;
      *(_QWORD *)&v15[2] = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v18 = 1024;
      v19 = 1567;
      v13 = MEMORY[0x1E0C81028];
LABEL_15:
      _os_log_impl(&dword_1B56CB000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
LABEL_16:
    v8 = 0;
    v6 = 0;
LABEL_22:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "clock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 136316418;
      *(_QWORD *)&v14[4] = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(_QWORD *)&v14[24] = 0;
      *(_WORD *)v15 = 2080;
      *(_QWORD *)&v15[2] = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v18 = 1024;
      v19 = 1569;
      v13 = MEMORY[0x1E0C81028];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "clock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portWithPortNumber:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 136316418;
      *(_QWORD *)&v14[4] = "port != nil";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(_QWORD *)&v14[24] = 0;
      *(_WORD *)v15 = 2080;
      *(_QWORD *)&v15[2] = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v18 = 1024;
      v19 = 1574;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
    v8 = 0;
    goto LABEL_22;
  }
  v8 = (void *)v7;
  v9 = -[TSPortInterface initWithgPTPPort:onClockIdentifier:]([TSPortInterface alloc], "initWithgPTPPort:onClockIdentifier:", v7, objc_msgSend(v6, "clockIdentifier"));
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 136316418;
      *(_QWORD *)&v14[4] = "newInterface != nil";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(_QWORD *)&v14[24] = 0;
      *(_WORD *)v15 = 2080;
      *(_QWORD *)&v15[2] = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v18 = 1024;
      v19 = 1577;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
    goto LABEL_22;
  }
  v10 = v9;
  if (TimeSyncPortCreateFromClock_onceToken != -1)
    dispatch_once(&TimeSyncPortCreateFromClock_onceToken, &__block_literal_global_166);
  v11 = v10;
  *(_QWORD *)v14 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v14[8] = 3221225472;
  *(_QWORD *)&v14[16] = __TimeSyncPortAddRef_block_invoke;
  *(_QWORD *)&v14[24] = &__block_descriptor_40_e5_v8__0l;
  *(_QWORD *)v15 = v11;
  dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v14);
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 134218496;
    *(_QWORD *)&v14[4] = a1;
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = a2;
    *(_WORD *)&v14[18] = 2048;
    *(_QWORD *)&v14[20] = v11;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortCreateFromClock(%p, %hu) = %p", v14, 0x1Cu);
  }

  return v11;
}

void TimeSyncPortDispose(uint64_t a1)
{
  id v2;
  void *v3;
  _BYTE v4[24];
  void *v5;
  _BYTE v6[10];
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef(a1) & 1) != 0)
  {
    *(_QWORD *)v4 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v4[8] = 3221225472;
    *(_QWORD *)&v4[16] = __TimeSyncPortRemoveRef_block_invoke;
    v5 = &__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)v6 = a1;
    dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v4);
    v2 = (id)objc_opt_self();
    v3 = (void *)a1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v4 = 136316418;
      *(_QWORD *)&v4[4] = "TimeSyncPortValidRef(portRef)";
      *(_WORD *)&v4[12] = 2048;
      *(_QWORD *)&v4[14] = 0;
      *(_WORD *)&v4[22] = 2048;
      v5 = 0;
      *(_WORD *)v6 = 2080;
      *(_QWORD *)&v6[2] = "";
      v7 = 2080;
      v8 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v9 = 1024;
      v10 = 1603;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v4, 0x3Au);
    }
    v3 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v4 = 134217984;
    *(_QWORD *)&v4[4] = a1;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortDispose(%p)", v4, 0xCu);
  }

}

uint64_t TimeSyncPortValidRef(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __TimeSyncPortValidRef_block_invoke;
  v3[3] = &unk_1E694BA28;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t TimeSyncPortSetRemoteSyncMessageIntervals(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BYTE v16[10];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = 3758097090;
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "port");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v4 = 3758097095;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "port");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = 0;
        v8 = objc_msgSend(v7, "requestRemoteMessageIntervalsWithPDelayMessageInterval:syncMessageInterval:announceMessageInterval:error:", TSMessageIntervalIgnore, a2, TSMessageIntervalIgnore, &v12);
        v9 = v12;
        v10 = v9;
        if ((v8 & 1) != 0)
          v4 = 0;
        else
          v4 = objc_msgSend(v9, "code");
      }
      else
      {
        v10 = 0;
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v14 = "TimeSyncPortValidRef(portRef)";
    v15 = 2048;
    *(_QWORD *)v16 = 0;
    *(_WORD *)&v16[8] = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v22 = 1024;
    v23 = 1632;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v14 = (const char *)a1;
    v15 = 1024;
    *(_DWORD *)v16 = a2;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortSetRemoteSyncMessageIntervals(%p, %hhd) = 0x%08x", buf, 0x18u);
  }
  return v4;
}

uint64_t TimeSyncPortOverridePortReceiveMatching(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _BYTE v20[10];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    v11 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "TimeSyncPortValidRef(portRef)";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v24 = 1024;
      v25 = 1675;
      v13 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    v10 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "port");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "port != nil";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v24 = 1024;
      v25 = 1680;
      v13 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v7 = (void *)v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v8 = objc_msgSend(v7, "overrideReceiveMatchingWithRemoteClockIdentity:remotePortNumber:error:", a2, a3, &v14);
    v9 = v14;
    v10 = v9;
    if ((v8 & 1) != 0)
      v11 = 0;
    else
      v11 = objc_msgSend(v9, "code");
  }
  else
  {
    v11 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v24 = 1024;
      v25 = 1681;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v16 = (const char *)a1;
    v17 = 2048;
    v18 = a2;
    v19 = 1024;
    *(_DWORD *)v20 = a3;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v11;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortOverridePortReceiveMatching(%p, 0x%016llx, %hu) = 0x%08x", buf, 0x22u);
  }

  return v11;
}

uint64_t TimeSyncPortRestorePortReceiveMatching(void *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "TimeSyncPortValidRef(portRef)";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1709;
      v9 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    v6 = 0;
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "port");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "port != nil";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1714;
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "restoreReceiveMatchingError:", &v10);
    v5 = v10;
    v6 = v5;
    if ((v4 & 1) != 0)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "code");
  }
  else
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1715;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = (const char *)a1;
    v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortRestorePortReceiveMatching(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

uint64_t TimeSyncPortGetCurrentPortInfo(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "TimeSyncPortValidRef(portRef)";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v23 = 1024;
      v24 = 1744;
      v11 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v11, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    v8 = 0;
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "port");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v9 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "port != nil";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v23 = 1024;
      v24 = 1749;
      v11 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v5 = (void *)v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0;
    v6 = objc_msgSend(v5, "getCurrentPortInfo:error:", a2, &v12);
    v7 = v12;
    v8 = v7;
    if ((v6 & 1) != 0)
      v9 = 0;
    else
      v9 = objc_msgSend(v7, "code");
  }
  else
  {
    v9 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v23 = 1024;
      v24 = 1750;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v14 = (const char *)a1;
    v15 = 2048;
    v16 = a2;
    v17 = 1024;
    LODWORD(v18) = v9;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortGetCurrentPortInfo(%p, %p) = 0x%08x", buf, 0x1Cu);
  }

  return v9;
}

uint64_t TimeSyncPortEnable(void *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "TimeSyncPortValidRef(portRef)";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1778;
      v9 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    v6 = 0;
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "port");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "port != nil";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1783;
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "enablePortError:", &v10);
    v5 = v10;
    v6 = v5;
    if ((v4 & 1) != 0)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "code");
  }
  else
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1784;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = (const char *)a1;
    v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortEnable(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

uint64_t TimeSyncPortDisable(void *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "TimeSyncPortValidRef(portRef)";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1812;
      v9 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    v6 = 0;
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "port");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "port != nil";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1817;
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v4 = objc_msgSend(v3, "disablePortError:", &v10);
    v5 = v10;
    v6 = v5;
    if ((v4 & 1) != 0)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "code");
  }
  else
  {
    v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v21 = 1024;
      v22 = 1818;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = (const char *)a1;
    v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortDisable(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

void TimeSyncPortSetMACLookupTimeoutCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
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
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) != 0)
  {
    objc_msgSend(a1, "setMACLookupTimeoutCallback:refcon:", a2, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136316418;
    v7 = "TimeSyncPortValidRef(portRef)";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v16 = 1024;
    v17 = 1843;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = (const char *)a1;
    v8 = 2048;
    v9 = a2;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortSetMACLookupTimeoutCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t TimeSyncClockManagerNotifyWhenAvailable(uint64_t result, uint64_t a2)
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __TimeSyncClockManagerNotifyWhenAvailable_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = result;
    v2[5] = a2;
    return +[TSClockManager notifyWhenClockManagerIsAvailable:](TSClockManager, "notifyWhenClockManagerIsAvailable:", v2);
  }
  return result;
}

TSClockManagerInterface *TimeSyncCreateTimeSyncClockManagerConnectionCallbackWithInterruptedHandler(const char *a1, uint64_t a2)
{
  TSClockManagerInterface *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  TSClockManagerInterface *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(TSClockManagerInterface);
  if (v4)
  {
    +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSClockManagerInterface setClockManager:](v4, "setClockManager:", v5);

    -[TSClockManagerInterface setInterruptionCallback:andRefcon:](v4, "setInterruptionCallback:andRefcon:", a1, a2);
    -[TSClockManagerInterface addToClockManager](v4, "addToClockManager");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136316418;
    v8 = "newInterface != nil";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v17 = 1024;
    v18 = 1886;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218496;
    v8 = a1;
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncCreateTimeSyncClockManagerConnectionCallbackWithInterruptedHandler(%p, %p) = %p", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

void TimeSyncClockManagerConnectionCallbackDispose(void *a1)
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
  uint8_t buf[4];
  void *v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)_clockManagerInterfaces;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v13, 16);
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
        if (*(void **)(*((_QWORD *)&v7 + 1) + 8 * i) == a1)
        {
          objc_msgSend(a1, "removeFromClockManager", (_QWORD)v7);
          objc_msgSend((id)_clockManagerInterfaces, "removeObject:", a1);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a1;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockManagerConnectionCallbackDispose(%p)", buf, 0xCu);
  }
}

uint64_t TimeSyncgPTPManagerNotifyWhenAvailable(uint64_t result, uint64_t a2)
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __TimeSyncgPTPManagerNotifyWhenAvailable_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = result;
    v2[5] = a2;
    return +[TSgPTPManager notifyWhengPTPManagerIsAvailable:](TSgPTPManager, "notifyWhengPTPManagerIsAvailable:", v2);
  }
  return result;
}

uint64_t TimeSyncAddgPTPServices()
{
  void *v0;
  uint64_t v1;
  id v2;
  const char *v3;
  const char *v4;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v1 = objc_msgSend(v0, "addgPTPServicesWithError:", &v6);
  v2 = v6;
  if ((v1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    TimeSyncAddgPTPServices_cold_1(v2, v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = "false";
    if ((_DWORD)v1)
      v4 = "true";
    *(_DWORD *)buf = 136446210;
    v8 = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncAddgPTPServices() = %{public}s", buf, 0xCu);
  }

  return v1;
}

BOOL TimeSyncAddgPTPServicesSync(unsigned int a1)
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  _BOOL8 v8;
  const char *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[TSClockManager sharedClockManagerSyncWithTimeout:](TSClockManager, "sharedClockManagerSyncWithTimeout:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && TimeSyncAddgPTPServices())
  {
    v4 = dispatch_semaphore_create(0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __TimeSyncAddgPTPServicesSync_block_invoke;
    v11[3] = &unk_1E694AF60;
    v5 = v4;
    v12 = v5;
    +[TSgPTPManager notifyWhengPTPManagerIsAvailable:](TSgPTPManager, "notifyWhengPTPManagerIsAvailable:", v11);
    v6 = dispatch_time(0, 1000000 * a1);
    v7 = dispatch_semaphore_wait(v5, v6);
    v8 = v7 == 0;
    if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      TimeSyncAddgPTPServicesSync_cold_1();

  }
  else
  {
    v8 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = "false";
    if (v8)
      v9 = "true";
    *(_DWORD *)buf = 67109378;
    v14 = a1;
    v15 = 2080;
    v16 = v9;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncAddgPTPServicesSync(%u) = %s", buf, 0x12u);
  }
  return v8;
}

uint64_t TimeSyncRemovegPTPServices()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "removegPTPServicesWithError:", 0);
  if ((v1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    TimeSyncRemovegPTPServices_cold_1();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = "false";
    if ((_DWORD)v1)
      v2 = "true";
    v4 = 136446210;
    v5 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncRemovegPTPServices() = %{public}s", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

uint64_t TimeSyncSystemDomainClockIdentifier()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "systemDomainClockIdentifier");
  else
    v2 = -1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncSystemDomainClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAirPlayPTPInstanceClockIdentifier()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "airPlayPTPInstanceClockIdentifier");
  else
    v2 = -1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncAirPlayPTPInstanceClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAddAirPlayPTPInstance()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  id v4;
  const char *v5;
  id v7;
  uint8_t buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = -1;
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v7 = 0;
    *(_QWORD *)buf = -1;
    v3 = objc_msgSend(v1, "addAirPlayPTPInstance:error:", buf, &v7);
    v4 = v7;
    if (v3)
    {
      v0 = *(_QWORD *)buf;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      TimeSyncAddAirPlayPTPInstance_cold_1(v4, v5);
    }

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncAddAirPlayPTPInstance() = 0x%016llx", buf, 0xCu);
  }

  return v0;
}

uint64_t TimeSyncRemoveAirPlayPTPInstance()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  const char *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v7 = 0;
    v2 = objc_msgSend(v0, "removeAirPlayPTPInstanceWithError:", &v7);
    v3 = v7;
    if ((v2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      TimeSyncRemoveAirPlayPTPInstance_cold_1(v3, v4);

  }
  else
  {
    v2 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = "false";
    if ((_DWORD)v2)
      v5 = "true";
    *(_DWORD *)buf = 136446210;
    v9 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncRemoveAirPlayPTPInstance() = %{public}s", buf, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncCopresencePTPInstanceClockIdentifier()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "copresencePTPInstanceClockIdentifier");
  else
    v2 = -1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncCopresencePTPInstanceClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAddCopresencePTPInstance()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  id v4;
  const char *v5;
  id v7;
  uint8_t buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = -1;
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v7 = 0;
    *(_QWORD *)buf = -1;
    v3 = objc_msgSend(v1, "addCopresencePTPInstance:error:", buf, &v7);
    v4 = v7;
    if (v3)
    {
      v0 = *(_QWORD *)buf;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      TimeSyncAddCopresencePTPInstance_cold_1(v4, v5);
    }

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncAddCopresencePTPInstance() = 0x%016llx", buf, 0xCu);
  }

  return v0;
}

uint64_t TimeSyncRemoveCopresencePTPInstance()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  const char *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[TSgPTPManager sharedgPTPManager](TSgPTPManager, "sharedgPTPManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v7 = 0;
    v2 = objc_msgSend(v0, "removeCopresencePTPInstanceWithError:", &v7);
    v3 = v7;
    if ((v2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      TimeSyncRemoveCopresencePTPInstance_cold_1(v3, v4);

  }
  else
  {
    v2 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = "false";
    if ((_DWORD)v2)
      v5 = "true";
    *(_DWORD *)buf = 136446210;
    v9 = v5;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncRemoveCopresencePTPInstance() = %{public}s", buf, 0xCu);
  }

  return v2;
}

TSClockInterface *TimeSyncClockCreateUserFilteredClock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  TSClockInterface *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  TSClockInterface *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v15 = 0;
    v10 = objc_msgSend(v8, "addUserFilteredClockWithMachInterval:domainInterval:usingFilterShift:isAdaptive:error:", a1, a2, a3, a4, &v15);
    v11 = 0;
    if (v10 != -1)
    {
      v12 = v10;
      usleep(0x186A0u);
      v11 = TimeSyncClockCreateWithClockIdentifier(v12);
    }
  }
  else
  {
    v11 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = "false";
    *(_DWORD *)buf = 134219010;
    v17 = a1;
    v18 = 2048;
    if ((_DWORD)a4)
      v13 = "true";
    v19 = a2;
    v20 = 1024;
    v21 = a3;
    v22 = 2082;
    v23 = v13;
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateUserFilteredClock(%llu, %llu, %hu, %{public}s) = %p", buf, 0x30u);
  }

  return v11;
}

uint64_t TimeSyncGetClockMetricsWithSize(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  char isKindOfClass;
  TSClockMetrics *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _BYTE v23[10];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 != 40)
  {
    v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = 136316418;
    v17 = "size == sizeof(TimeSyncClockMetrics)";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    *(_QWORD *)v23 = "";
    *(_WORD *)&v23[8] = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 2268;
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  if (!a2)
  {
    v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = 136316418;
    v17 = "metrics != NULL";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    *(_QWORD *)v23 = "";
    *(_WORD *)&v23[8] = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 2269;
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = 136316418;
    v17 = "TimeSyncClockValidRef(clockRef)";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    *(_QWORD *)v23 = "";
    *(_WORD *)&v23[8] = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 2270;
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  objc_msgSend(a1, "clock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = 136316418;
    v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    *(_QWORD *)v23 = "";
    *(_WORD *)&v23[8] = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 2272;
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  if (a4)
  {
    v10 = -[TSClockMetrics initWithInterfaceMetrics:]([TSClockMetrics alloc], "initWithInterfaceMetrics:", a2);
    objc_msgSend(a1, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getMetricsWithDelta:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "clock");
    v10 = (TSClockMetrics *)objc_claimAutoreleasedReturnValue();
    -[TSClockMetrics getMetrics](v10, "getMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v12)
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_QWORD *)(a2 + 8) = objc_msgSend(v12, "gmChangesCount");
    *(_QWORD *)(a2 + 16) = objc_msgSend(v12, "timeToChangeGm");
    *(_QWORD *)(a2 + 24) = objc_msgSend(v12, "timeToLock");
    *(_QWORD *)(a2 + 32) = objc_msgSend(v12, "coreAudioReanchors");

    v13 = 0;
    goto LABEL_10;
  }
  v13 = 3758097090;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "tsClockMetrics != nil";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    *(_QWORD *)v23 = "";
    *(_WORD *)&v23[8] = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v25 = 1024;
    v26 = 2283;
    v15 = MEMORY[0x1E0C81028];
LABEL_23:
    _os_log_impl(&dword_1B56CB000, v15, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134219008;
    v17 = (const char *)a1;
    v18 = 2048;
    v19 = a2;
    v20 = 2048;
    v21 = a3;
    v22 = 1024;
    *(_DWORD *)v23 = a4;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v13;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetMetrics(%p, %p, %llu, %u) = %#x", (uint8_t *)&v16, 0x2Cu);
  }
  return v13;
}

uint64_t TimeSyncGetPortMetricsWithSize(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  void *v14;
  TSPortMetrics *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  _BYTE v24[30];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a4 != 138)
  {
    v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v21 = 136316418;
    v22 = "size == sizeof(TimeSyncPortMetrics)";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2316;
    v19 = MEMORY[0x1E0C81028];
LABEL_23:
    _os_log_impl(&dword_1B56CB000, v19, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
    goto LABEL_12;
  }
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v21 = 136316418;
    v22 = "TimeSyncClockValidRef(clockRef)";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2317;
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  if (!a3)
  {
    v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v21 = 136316418;
    v22 = "metrics != NULL";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2318;
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  objc_msgSend(a1, "clock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v21 = 136316418;
    v22 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2320;
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  objc_msgSend(a1, "clock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "portWithPortNumber:", a2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136316418;
      v22 = "port != nil";
      v23 = 2048;
      *(_QWORD *)v24 = 0;
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)&v24[10] = 0;
      *(_WORD *)&v24[18] = 2080;
      *(_QWORD *)&v24[20] = "";
      *(_WORD *)&v24[28] = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      v26 = 1024;
      v27 = 2327;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
    }
    goto LABEL_32;
  }
  v14 = (void *)v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a5)
    {
      v15 = -[TSPortMetrics initWithInterfaceMetrics:]([TSPortMetrics alloc], "initWithInterfaceMetrics:", a3);
      objc_msgSend(v14, "getMetricsWithDelta:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "getMetrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v16)
    {
      *(_OWORD *)(a3 + 122) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_WORD *)a3 = objc_msgSend(v16, "portNumber");
      *(_QWORD *)(a3 + 2) = objc_msgSend(v16, "syncTimeouts");
      *(_QWORD *)(a3 + 10) = objc_msgSend(v16, "filterResetsDroppedLimit");
      *(_QWORD *)(a3 + 18) = objc_msgSend(v16, "filterResetsOutOfBounds");
      *(_QWORD *)(a3 + 26) = objc_msgSend(v16, "meanDelayTime");
      *(_QWORD *)(a3 + 34) = objc_msgSend(v16, "droppedMeasurements");
      *(_QWORD *)(a3 + 42) = objc_msgSend(v16, "discardedPpmLimitMeasurements");
      *(_QWORD *)(a3 + 50) = objc_msgSend(v16, "discardedDelayLimitExceededMeasurements");
      *(_QWORD *)(a3 + 58) = objc_msgSend(v16, "discardedOutOfBoundsMeasurements");
      *(_QWORD *)(a3 + 66) = objc_msgSend(v16, "discardedTimestampsOutOfOrderMeasurements");
      *(_QWORD *)(a3 + 74) = objc_msgSend(v16, "successfulMeasurements");
      *(_QWORD *)(a3 + 82) = objc_msgSend(v16, "totalMeasurements");
      *(_QWORD *)(a3 + 90) = objc_msgSend(v16, "droppedPercentage");
      *(_QWORD *)(a3 + 98) = objc_msgSend(v16, "discardedPpmLimitPercentage");
      *(_QWORD *)(a3 + 106) = objc_msgSend(v16, "discardedDelayLimitExceededPercentage");
      *(_QWORD *)(a3 + 114) = objc_msgSend(v16, "discardedOutOfBoundsPercentage");
      *(_QWORD *)(a3 + 122) = objc_msgSend(v16, "discardedTimestampsOutOfOrderPercentage");
      *(_QWORD *)(a3 + 130) = objc_msgSend(v16, "successfulPercentage");

      v17 = 0;
      goto LABEL_12;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v21 = 136316418;
    v22 = "tsPortMetrics != nil";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2337;
    v20 = MEMORY[0x1E0C81028];
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136316418;
    v22 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
    v23 = 2048;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(_QWORD *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(_QWORD *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    v26 = 1024;
    v27 = 2328;
    v20 = MEMORY[0x1E0C81028];
LABEL_30:
    _os_log_impl(&dword_1B56CB000, v20, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
  }
LABEL_31:

LABEL_32:
  v17 = 3758097136;
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134219264;
    v22 = (const char *)a1;
    v23 = 1024;
    *(_DWORD *)v24 = a2;
    *(_WORD *)&v24[4] = 2048;
    *(_QWORD *)&v24[6] = a3;
    *(_WORD *)&v24[14] = 2048;
    *(_QWORD *)&v24[16] = a4;
    *(_WORD *)&v24[24] = 1024;
    *(_DWORD *)&v24[26] = a5;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v17;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TimeSyncPortGetMetrics(%p, %u, %p, %llu, %u) = %#x", (uint8_t *)&v21, 0x32u);
  }
  return v17;
}

void asyncNotificationsCallback_1(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v7 = (void *)MEMORY[0x1B5E4E6F0]();
  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getObject:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = v10;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v10, "_handleRefreshConnection");
    }
    else if (a4 >= 5)
    {
      objc_msgSend(v10, "_handleNotification:withArgs:ofCount:", *a3, a3 + 2, a4 - 1);
    }

  }
  objc_autoreleasePoolPop(v7);
}

void sub_1B570F0AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B570F154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57168A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1B57178E0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B5717E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

void sub_1B57180F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B5718474(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B57186E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57188CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TimeSyncAddgPTPServices_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v2, "Failed to add gPTP services with error 0x%08x\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void TimeSyncAddgPTPServicesSync_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to add gPTP services within the timeout period.\n", v0, 2u);
  OUTLINED_FUNCTION_1();
}

void TimeSyncRemovegPTPServices_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  objc_msgSend(0, "code");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v0, "Failed to remove gPTP services with error 0x%08x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void TimeSyncAddAirPlayPTPInstance_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v2, "Failed to add AirPlay PTP Instance with error 0x%08x\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void TimeSyncRemoveAirPlayPTPInstance_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v2, "Failed to remove AirPlay PTP Instance with error 0x%08x\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void TimeSyncAddCopresencePTPInstance_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v2, "Failed to add Copresence PTP Instance with error 0x%08x\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void TimeSyncRemoveCopresencePTPInstance_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B56CB000, MEMORY[0x1E0C81028], v2, "Failed to remove Copresence PTP Instance with error 0x%08x\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x1E0C80420](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x1E0C80458](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x1E0C80490](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x1E0C804A0](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x1E0C804B8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1E0C804C8](service, queue);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1E0C848F8]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D40](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C852C8](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D0](*(_QWORD *)&task, *(_QWORD *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D8](*(_QWORD *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852F0](*(_QWORD *)&semaphore);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C050](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1B8](__A, __I, __C, __N);
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1C0](__A, __IA, __C, __I, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1F0](__A, __IA, __C, __N);
}

void vDSP_svesqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C338](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C378](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vqint(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __M)
{
  MEMORY[0x1E0C8C798](__A, __B, __IB, __C, __IC, __N, __M);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E8](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C950](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vswmaxD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __WindowLength)
{
  MEMORY[0x1E0C8C978](__A, __IA, __C, __IC, __N, __WindowLength);
}

