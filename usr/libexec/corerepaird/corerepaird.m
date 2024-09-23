uint64_t start()
{
  id v0;
  CRRepairSession *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  ServiceDelegate *v5;
  PreferencesDelegate *v6;
  PreflightDelegate *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v0 = objc_msgSend(objc_alloc((Class)ASTRepairSessionProvider), "initWithServiceName:entitlements:", CFSTR("com.apple.corerepair.diagnostics-controller"), &off_1000583C0);
  v1 = -[CRRepairSession initWithDelegate:]([CRRepairSession alloc], "initWithDelegate:", v0);
  v2 = objc_autoreleasePoolPush();
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "corerepaird has started!", buf, 2u);
  }

  v5 = objc_opt_new(ServiceDelegate);
  v6 = objc_opt_new(PreferencesDelegate);
  v7 = objc_opt_new(PreflightDelegate);
  v8 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.corerepair"));
  if (!v8)
  {
    v9 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v24, 2u);
    }

  }
  objc_msgSend(v8, "setDelegate:", v5);
  objc_msgSend(v8, "resume");
  v11 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.corerepair.intentControl"));
  if (!v11)
  {
    v12 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v23, 2u);
    }

  }
  objc_msgSend(v11, "setDelegate:", v6);
  objc_msgSend(v11, "resume");
  v14 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.corerepair.preflightControl"));
  if (!v14)
  {
    v15 = handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v22, 2u);
    }

  }
  objc_msgSend(v14, "setDelegate:", v7);
  objc_msgSend(v14, "resume");
  if (objc_opt_class(ASTRepairSessionProvider))
  {
    objc_msgSend(v0, "setReceiver:", v1);
    objc_msgSend(v0, "startListening");
  }
  else
  {
    v17 = handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ASTRepairSessionProvider is not linked on current platform", v21, 2u);
    }

  }
  objc_autoreleasePoolPop(v2);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v19, "run");

  return 0;
}

id sub_100001990(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (v5)
      {
        v9 = handleForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1000365E8(v5, v10);

        objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, NSLocalizedDescriptionKey);
      }
      if (v7)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, NSUnderlyingErrorKey);
      a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, a1, v8));

    }
    else
    {
      a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, a1, 0));
    }
  }

  return a1;
}

void sub_1000023E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000023F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003D14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003D24(uint64_t a1)
{

}

void sub_100003D2C(uint64_t a1, const void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t BytePtr;
  NSData *v21;
  void *v22;
  __int128 v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100036BE8((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
LABEL_17:

    goto LABEL_18;
  }
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    v29 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100036BBC();
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "count"))
  {
    v17 = 0;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v17));

      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      BytePtr = SecCertificateGetBytePtr(v18);
      v21 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", BytePtr, SecCertificateGetLength(v18));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v19, "addObject:", v22);

      ++v17;
    }
    while ((unint64_t)objc_msgSend(v7, "count") > v17);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    v24 = 0;
    *(_QWORD *)&v23 = 67109378;
    v30 = v23;
    do
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", v24, v30));
      v26 = handleForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "base64EncodedStringWithOptions:", 0));
        *(_DWORD *)buf = v30;
        v32 = v24;
        v33 = 2112;
        v34 = v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "cert_%d: %@", buf, 0x12u);

      }
      ++v24;
    }
    while ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > v24);
  }
LABEL_18:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (a2)
    CFRelease(a2);

}

void sub_100003FC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004CD8(id a1)
{
  CRCFactoryHelper *v1;
  void *v2;

  v1 = objc_alloc_init(CRCFactoryHelper);
  v2 = (void *)qword_100066830;
  qword_100066830 = (uint64_t)v1;

}

void sub_100005B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = a1;
    v8 = 2080;
    v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v6, 0x16u);
  }

}

void sub_100006694(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_100006718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;

  v8 = (id)objc_opt_new(CRComponentSigning);
  objc_msgSend(v8, "vcrtSign:outSignature:outDeviceNonce:outError:", a1, a2, a3, a4);

}

void sub_100006778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;

  v8 = (id)objc_opt_new(CRComponentSigning);
  objc_msgSend(v8, "bcrtSign:outSignature:outDeviceNonce:outError:", a1, a2, a3, a4);

}

void sub_1000067D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;

  v8 = (id)objc_opt_new(CRComponentSigning);
  objc_msgSend(v8, "tcrtSign:outSignature:outDeviceNonce:outError:", a1, a2, a3, a4);

}

void sub_100006838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;

  v8 = (id)objc_opt_new(CRComponentSigning);
  objc_msgSend(v8, "prpcSign:outSignature:outDeviceNonce:outError:", a1, a2, a3, a4);

}

void sub_100006914(id a1)
{
  CoreRepairHelper *v1;
  void *v2;

  v1 = objc_alloc_init(CoreRepairHelper);
  v2 = (void *)qword_100066840;
  qword_100066840 = (uint64_t)v1;

}

void sub_1000073B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008008(uint64_t a1, int a2, xpc_object_t xint)
{
  int64_t value;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  value = xpc_int64_get_value(xint);
  if (value == 37 || value == 17)
  {
    v5 = handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100037544();

  }
  else if (value)
  {
    v7 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000374D8();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

void sub_100008184(id a1)
{
  qword_100066858 = (uint64_t)dlopen("/usr/lib/system/libxpc.dylib", 2);
}

void sub_10000821C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000877C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testSequencer"));
  objc_msgSend(v1, "start");

}

void sub_100008CF4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testSequencer"));
  objc_msgSend(v2, "handleResult:", *(_QWORD *)(a1 + 40));

}

void sub_10000B0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B0CC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000B0DC(uint64_t a1)
{

}

void sub_10000B0E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "answer %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

void sub_10000B1AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "answer %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

void *sub_10000E204(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;

  v4 = calloc(8uLL, 1uLL);
  v5 = v4;
  if (v4)
  {
    *v4 = 0;
    if (a1)
    {
      if (sub_10000FAFC((uint64_t)v4, a1, a1 + a2))
      {
        memset_s(v5, 8uLL, 0, 8uLL);
        free(v5);
        return 0;
      }
    }
  }
  return v5;
}

void *sub_10000E284(int a1, int a2)
{
  void **v2;
  void *result;
  void **v4;
  void *v5;
  BOOL v6;

  switch(a1)
  {
    case 1:
      v2 = (void **)&off_100066160;
      goto LABEL_28;
    case 2:
      v2 = (void **)&off_100066150;
      goto LABEL_28;
    case 3:
      v2 = (void **)&off_100066158;
      goto LABEL_28;
    case 4:
      v2 = (void **)&off_100066168;
      goto LABEL_28;
    case 5:
      v2 = (void **)&off_100066140;
      goto LABEL_28;
    case 6:
      v2 = (void **)&off_1000661E8;
      goto LABEL_28;
    case 7:
      v2 = (void **)&off_1000661E0;
      goto LABEL_28;
    case 8:
      v4 = (void **)&off_1000661F8;
      goto LABEL_30;
    case 9:
      v4 = (void **)&off_100066200;
      goto LABEL_30;
    case 10:
      v2 = (void **)&off_100066210;
      goto LABEL_28;
    case 11:
      v2 = (void **)&off_100066218;
      goto LABEL_28;
    case 12:
      v2 = (void **)&off_100066220;
      goto LABEL_28;
    case 13:
      v2 = (void **)&off_100066228;
      goto LABEL_28;
    case 14:
      v2 = (void **)&off_100066230;
      goto LABEL_28;
    case 15:
      v2 = (void **)&off_1000661F0;
      goto LABEL_28;
    case 16:
      v4 = (void **)&off_1000661A0;
      goto LABEL_30;
    case 17:
      v2 = (void **)&off_1000661B0;
      goto LABEL_28;
    case 18:
      v4 = (void **)&off_1000661B8;
      goto LABEL_30;
    case 19:
      v5 = off_1000661C8;
      v6 = a2 == 3;
      goto LABEL_31;
    case 20:
      v4 = (void **)&off_1000661D0;
      goto LABEL_30;
    case 21:
      v2 = (void **)&off_1000661D8;
      goto LABEL_28;
    case 22:
      v4 = (void **)&off_1000661C0;
      goto LABEL_30;
    case 23:
      v4 = (void **)&off_1000661A8;
      goto LABEL_30;
    case 24:
      v2 = (void **)&off_100066238;
      goto LABEL_28;
    case 25:
      v2 = (void **)&off_100066240;
LABEL_28:
      v5 = *v2;
      v6 = a2 == 2;
      goto LABEL_31;
    case 26:
      v4 = (void **)&off_100066208;
LABEL_30:
      v5 = *v4;
      v6 = a2 == 1;
LABEL_31:
      if (v6)
        result = v5;
      else
        result = 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_10000E404(_QWORD *a1, int a2, uint64_t *a3)
{
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;

  v5 = 3758097090;
  v6 = (unsigned __int8 *)sub_10000E284(a2, 1);
  if (v6)
  {
    v7 = (uint64_t)v6;
    if (!sub_10000F8EC(a1, v6) && (!a3 || !sub_1000100B0(a1, v7, *a3)))
      return 0;
  }
  return v5;
}

uint64_t sub_10000E47C(void ***a1)
{
  uint64_t result;
  void **v3;

  result = 3758097090;
  if (a1)
  {
    v3 = *a1;
    if (*a1)
    {
      *a1 = 0;
      sub_10000F874(v3);
      memset_s(v3, 8uLL, 0, 8uLL);
      free(v3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000E4D8(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, void ***a6)
{
  uint64_t v12;
  void *v13;
  void **v14;
  void *v15;
  void **v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  size_t v25;
  void *v26;
  size_t v27;

  v12 = 3758097090;
  v13 = off_100066188;
  v14 = (void **)calloc(8uLL, 1uLL);
  *v14 = 0;
  sub_10000FF34(v14, (uint64_t)off_100066130, (uint64_t)v13);
  v26 = 0;
  v27 = 0;
  v24 = 0;
  v25 = 0;
  if (!a6)
    goto LABEL_14;
  v15 = calloc(0x50uLL, 1uLL);
  v23 = v15;
  if (!v15)
  {
    v12 = 3758604298;
    goto LABEL_14;
  }
  v16 = (void **)v15;
  memset_s(v15, 0x50uLL, 0, 0x50uLL);
  if (a4 && sub_10000FAFC((uint64_t)v14, a4, a4 + a5)
    || sub_1000100B0(v14, (uint64_t)off_100066138, a2)
    || sub_1000100B0(v14, (uint64_t)off_100066178, a3)
    || sub_10000FC04(v14, &v26, &v27))
  {
LABEL_17:
    sub_10000E704((uint64_t *)&v23);
    goto LABEL_14;
  }
  v17 = sub_10000E878(a1, v26, v27, &v24, &v25);
  if ((_DWORD)v17)
  {
    v12 = v17;
    goto LABEL_17;
  }
  v18 = (char *)v24;
  v19 = v25;
  *v16 = v24;
  v16[1] = (void *)v19;
  *((_DWORD *)v16 + 10) = a1;
  v16[2] = &v18[v19];
  v21 = 0;
  v22 = 0;
  if (sub_10000F6D4((uint64_t)off_100066180, &v21, &v22, (uint64_t)v18, (uint64_t)&v18[v19]))
    v16[4] = v21;
  if (sub_10000F6D4((uint64_t)off_100066150, &v21, &v22, (uint64_t)*v16, (uint64_t)v16[2]))
    v16[3] = v21;
  v12 = 0;
  *a6 = v16;
  v24 = 0;
  v25 = 0;
LABEL_14:
  sub_10000F874(v14);
  memset_s(v14, 8uLL, 0, 8uLL);
  free(v14);
  memset_s(v26, v27, 0, v27);
  free(v26);
  memset_s(v24, v25, 0, v25);
  free(v24);
  return v12;
}

uint64_t sub_10000E704(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *a1;
  if (!*a1)
    return 3758097090;
  *a1 = 0;
  if (*(_QWORD *)v1)
  {
    memset_s(*(void **)v1, *(_QWORD *)(v1 + 8), 0, *(_QWORD *)(v1 + 8));
    free(*(void **)v1);
  }
  v2 = *(void **)(v1 + 48);
  if (v2)
  {
    memset_s(v2, *(_QWORD *)(v1 + 56), 0, *(_QWORD *)(v1 + 56));
    free(*(void **)(v1 + 48));
  }
  v3 = *(void **)(v1 + 64);
  if (v3)
  {
    memset_s(v3, *(_QWORD *)(v1 + 72), 0, *(_QWORD *)(v1 + 72));
    free(*(void **)(v1 + 64));
  }
  memset_s((void *)v1, 0x50uLL, 0, 0x50uLL);
  free((void *)v1);
  return 0;
}

uint64_t sub_10000E7B4(int a1, const void *a2, size_t a3, uint64_t *a4)
{
  uint64_t v4;
  void *v9;
  uint64_t v10;
  void *v12;

  v4 = 3758097090;
  if (a2)
  {
    if (a3)
    {
      if (sub_10000F59C((uint64_t)a2, (uint64_t)a2 + a3) == a3)
      {
        v4 = 3758604298;
        v9 = calloc(0x50uLL, 1uLL);
        v12 = v9;
        if (v9)
        {
          v10 = (uint64_t)v9;
          memset_s(v9, 0x50uLL, 0, 0x50uLL);
          *(_DWORD *)(v10 + 40) = a1;
          if (sub_10000EA50(v10, a2, a3))
          {
            sub_10000E704((uint64_t *)&v12);
          }
          else
          {
            v4 = 0;
            *a4 = v10;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_10000E878(int a1, const void *a2, size_t a3, _QWORD *a4, size_t *a5)
{
  mach_port_t v10;
  mach_port_t v11;
  uint64_t v12;
  void *v13;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];

  v10 = sub_10000F334();
  if (v10)
  {
    if (a2)
    {
      v11 = v10;
      v12 = 3758097090;
      if (sub_10000F59C((uint64_t)a2, (uint64_t)a2 + a3) == a3)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = a1;
        v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, a2, a3, 0, 0, __src, &__count);
        if (!(_DWORD)v12 && a4 && a5)
        {
          v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            v12 = 0;
            *a5 = __count;
          }
          else
          {
            v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      v12 = 3758097090;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_operation", ":", 457, "", 0, "", "");
    v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_10000EA50(uint64_t a1, const void *a2, size_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  if (!sub_10000F6D4((uint64_t)off_100066180, &v10, &v11, (uint64_t)a2, (uint64_t)a2 + a3))
    return 3758097090;
  if (*(_QWORD *)a1)
  {
    memset_s(*(void **)a1, *(_QWORD *)(a1 + 8), 0, *(_QWORD *)(a1 + 8));
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  v6 = calloc(a3, 1uLL);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = a3;
  if (!v6)
    return 3758604298;
  memcpy(v6, a2, a3);
  v7 = *(void **)a1;
  v8 = *(_QWORD *)a1 + *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = v8;
  if (sub_10000F6D4((uint64_t)off_100066180, &v10, &v11, (uint64_t)v7, v8))
    *(_QWORD *)(a1 + 32) = v10;
  if ((sub_10000F6D4((uint64_t)off_100066150, &v10, &v11, *(_QWORD *)a1, *(_QWORD *)(a1 + 16)) & 1) != 0
    || (result = sub_10000F6D4((uint64_t)off_100066148, &v10, &v11, *(_QWORD *)a1, *(_QWORD *)(a1 + 16)), (_DWORD)result))
  {
    result = 0;
    *(_QWORD *)(a1 + 24) = v10;
  }
  return result;
}

uint64_t sub_10000EB84(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;

  v4 = 3758604298;
  if (a1)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if ((!v8 || !sub_10000FAFC((uint64_t)a2, v8, v8 + *(_QWORD *)(a1 + 56)))
      && (!a3 || !sub_10000FAFC((uint64_t)a2, a3, a3 + a4)))
    {
      sub_10000F8EC(a2, (unsigned __int8 *)off_100066150);
      return 0;
    }
  }
  return v4;
}

uint64_t sub_10000EC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, size_t *a7)
{
  uint64_t v14;
  void *v15;
  void **v16;
  void *__s;
  rsize_t __n;

  v14 = 3758097090;
  v15 = off_100066190;
  v16 = (void **)calloc(8uLL, 1uLL);
  *v16 = 0;
  sub_10000FF34(v16, (uint64_t)off_100066130, (uint64_t)v15);
  __s = 0;
  __n = 0;
  if (!sub_10000EB84(a1, v16, a2, a3))
  {
    sub_10000F8EC(v16, (unsigned __int8 *)off_100066140);
    sub_10000F8EC(v16, (unsigned __int8 *)off_100066180);
    if (!sub_10000FF44(v16, (uint64_t)off_100066140, a4, a5)
      && !sub_10000FDC8(v16, (uint64_t)off_100066180, *(_QWORD *)a1, *(_QWORD *)(a1 + 16))
      && !sub_10000FC04(v16, &__s, &__n))
    {
      v14 = sub_10000E878(*(_DWORD *)(a1 + 40), __s, __n, a6, a7);
    }
  }
  sub_10000F874(v16);
  memset_s(v16, 8uLL, 0, 8uLL);
  free(v16);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v14;
}

uint64_t sub_10000ED8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  size_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[15];
  char v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  __int128 v28;

  v7 = a7;
  *(_QWORD *)&v28 = a6;
  *((_QWORD *)&v28 + 1) = a6 + a7;
  v27 = 0;
  v26 = 0;
  sub_10000F808(&v28, 4, &v27, &v26);
  if ((v12 & 1) == 0)
  {
    v26 = a6;
    v27 = v7;
  }
  v13 = 3758097090;
  v14 = sub_10000EF94((uint64_t)a1);
  if ((v14 - 4) < 2)
  {
    v24 = 0;
    goto LABEL_8;
  }
  if ((v14 - 7) < 2)
  {
    v15 = ccec_cp_384();
    v24 = 0;
    if (v15)
    {
LABEL_9:
      __chkstk_darwin();
      v17 = &v23[-v16];
      bzero(&v23[-v16], v16);
      v25 = 0;
      v18 = sub_10000EFF0(a1, &v25);
      if (v18
        && !ccec_import_pub(v15, v25, v18, v17)
        && !ccec_verify(v17, a5, a4, v27, v26, &v24))
      {
        if (!v24)
          return 3758604294;
        return 0;
      }
      return v13;
    }
LABEL_8:
    v15 = ccec_cp_256();
    goto LABEL_9;
  }
  if (v14 == 3)
  {
    v25 = 0;
    v19 = sub_10000EFF0(a1, &v25);
    if (v19)
    {
      if (v25 == 32 && v26 && v27 == 64)
      {
        v20 = v19;
        v21 = ccsha512_di();
        if (cced25519_verify(v21, a5, a4, v26, v20))
          return 3758604294;
        return 0;
      }
    }
  }
  return v13;
}

uint64_t sub_10000EF94(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  v3 = 0;
  v4 = 0;
  result = sub_10000F6D4((uint64_t)off_100066178, &v3, &v4, v1, *(_QWORD *)(a1 + 16));
  if ((_DWORD)result)
    return sub_10000F7A0(v3, v3 + v4);
  return result;
}

uint64_t sub_10000EFF0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  int v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;

  v20 = 0;
  v19 = 0;
  v2 = a1[4];
  if (!v2)
    return 0;
  v17 = 0;
  v18 = 0;
  if (sub_10000F6D4((uint64_t)off_100066170, &v17, &v18, v2, a1[2]))
  {
    *(_QWORD *)&v16 = v17;
    *((_QWORD *)&v16 + 1) = v17 + v18;
    sub_10000F808(&v16, 4, &v20, &v19);
  }
  v5 = sub_10000EF94((uint64_t)a1);
  if ((v5 - 7) < 2)
  {
    v6 = ccec_cp_384();
    goto LABEL_9;
  }
  if ((v5 - 4) <= 1)
  {
    v6 = ccec_cp_256();
LABEL_9:
    v8 = (_QWORD *)v6;
    if (v6)
    {
      v9 = j__cczp_bitlen(v6);
      if (v20 == (unint64_t)(v9 + 7) >> 3)
      {
        if (v19 && !a1[8])
        {
          __chkstk_darwin();
          v11 = (char *)&v15 - v10;
          bzero((char *)&v15 - v10, v10);
          ccec_compact_import_pub(v8, v20, v19, v11);
          v12 = (2 * sub_10000F514()) | 1;
          v13 = calloc(v12, 1uLL);
          a1[8] = (uint64_t)v13;
          a1[9] = v12;
          if (v13)
            ccec_export_pub(v11, v13);
          cc_clear(24 * *v8 + 16, v11);
        }
        v14 = a1[9];
        v19 = a1[8];
        v20 = v14;
      }
    }
  }
  *a2 = v20;
  return v19;
}

uint64_t sub_10000F1C0(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;

  result = *a1;
  *a2 = a1[1];
  return result;
}

uint64_t sub_10000F1CC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, size_t *a5)
{
  return sub_10000F1EC(a1, (uint64_t)off_100066198, a2, a3, a4, a5);
}

uint64_t sub_10000F1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, size_t *a6)
{
  uint64_t v12;
  void **v13;
  void *__s;
  rsize_t __n;

  v12 = 3758097090;
  v13 = (void **)calloc(8uLL, 1uLL);
  *v13 = 0;
  sub_10000FF34(v13, (uint64_t)off_100066130, a2);
  __s = 0;
  __n = 0;
  if (a1)
  {
    if (a5)
    {
      if (a6)
      {
        if (!sub_10000EB84(a1, v13, a3, a4))
        {
          sub_10000F8EC(v13, (unsigned __int8 *)off_100066180);
          if (!sub_10000FDC8(v13, (uint64_t)off_100066180, *(_QWORD *)a1, *(_QWORD *)(a1 + 16))
            && !sub_10000FC04(v13, &__s, &__n))
          {
            v12 = sub_10000E878(*(_DWORD *)(a1 + 40), __s, __n, a5, a6);
          }
        }
      }
    }
  }
  sub_10000F874(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v12;
}

uint64_t sub_10000F334()
{
  uint64_t result;

  if (qword_100066868 != -1)
    dispatch_once(&qword_100066868, &stru_100050D50);
  dispatch_sync((dispatch_queue_t)qword_100066870, &stru_100050D10);
  result = dword_100066860;
  if (!dword_100066860)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100066860;
  }
  return result;
}

void sub_10000F3BC(id a1)
{
  if (!dword_100066860)
    dword_100066860 = sub_10000F420("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

void sub_10000F3F8(id a1)
{
  qword_100066870 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_10000F420(char *path, const char *a2)
{
  io_service_t v3;
  io_object_t v4;
  kern_return_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  result = connect;
  if (connect)
  {
    v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

unint64_t sub_10000F514()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

BOOL sub_10000F534(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  size_t v7;

  v7 = sub_10000F59C((uint64_t)a1, a2);
  return v7 == sub_10000F59C((uint64_t)a3, a4) && memcmp(a1, a3, v7) == 0;
}

uint64_t sub_10000F59C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[0] = a1;
  v6[1] = a2;
  v4 = 0;
  v5 = 0;
  if (ccder_blob_decode_tag(v6, &v5) && ccder_blob_decode_len(v6, &v4))
    return v6[0] + v4 - a1;
  else
    return 0;
}

uint64_t sub_10000F600(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[0] = a1;
  v11[1] = a2;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  result = ccder_blob_decode_range(v11, 0x2000000000000011, v11);
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl(v11, &v9))
    {
      while (1)
      {
        v7 = v9;
        result = ccder_blob_decode_tl(&v9, 12, &v8);
        if (!(_DWORD)result)
          break;
        if (v9 - v7 != 2)
          return 0;
        result = a3(v7, v10 - v7, v9 + v8, v10 - (v9 + v8), a4);
        if (!(_DWORD)result)
          return result;
        v11[0] = v10;
        if ((ccder_blob_decode_sequence_tl(v11, &v9) & 1) == 0)
          return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_10000F6D4(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v10 = a1;
  v11 = 0;
  if (a1)
  {
    sub_10000F600(a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000F740, (uint64_t)&v10);
    if (a2)
    {
      if (a3)
      {
        v7 = v11;
        v8 = v12;
        *a2 = v11;
        *a3 = v8 - v7;
      }
    }
  }
  return v13;
}

BOOL sub_10000F740(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = sub_10000F534(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1, (uint64_t)a1 + a2);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_10000F7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unsigned int v5;
  _QWORD v6[2];
  uint64_t v7;

  v7 = 0;
  v6[0] = a1;
  v6[1] = a2;
  if (!ccder_blob_decode_tl(v6, 2, &v7))
    return 0;
  v2 = v7;
  if ((unint64_t)(v7 - 9) < 0xFFFFFFFFFFFFFFF8)
    return 0;
  v3 = (unsigned __int8 *)v6[0];
  result = (uint64_t)*(char *)v6[0] >> 7;
  do
  {
    v5 = *v3++;
    result = v5 | (unint64_t)(result << 8);
    --v2;
  }
  while (v2);
  return result;
}

double sub_10000F808(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v11 = *a1;
  v9 = 0;
  v10 = 0;
  if (ccder_blob_decode_range(&v11, a2, &v9))
  {
    v8 = v9;
    *a4 = v9;
    *a3 = v10 - v8;
    result = *(double *)&v11;
    *a1 = v11;
  }
  return result;
}

uint64_t sub_10000F874(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_10000F8EC(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)sub_10000F980(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *sub_10000F980(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  uint64_t v4;
  const void *v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v6 = 0;
  v7 = 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v4 = v2[1] + v2[2];
      v6 = (const void *)v2[1];
      v7 = v4;
      if (ccder_blob_decode_sequence_tl(&v6, &v6) && sub_10000F534(a2, (uint64_t)&a2[a2[1] + 2], v6, v7))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_10000FA00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;

  v2 = a1;
  v4[1] = a2;
  v5 = 0;
  v4[0] = a1;
  if ((ccder_blob_decode_tl(v4, 12, &v5) & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  if (v5 >= 0x11)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 2%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return v2;
}

uint64_t sub_10000FAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return sub_10000F600(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000FB38, a1)- 1;
  else
    return 4294967285;
}

uint64_t sub_10000FB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)sub_10000FA00(a1, a1 + a2);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!sub_10000F8EC(a5, v8) && !sub_10000FDC8(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_10000FC04(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  char *v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = (char *)calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *(_OWORD *)v15 = *(_OWORD *)(v14 + 1);
                v15 += 16;
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000102C4);
            v16 = ccder_sizeof(0x2000000000000011, v10);
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = &v13[-v9 - 8];
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body(&v25, *(_QWORD *)v20, *((_QWORD *)v20 - 1));
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl(&v25, 0x2000000000000011, v10) || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_10000FDC8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    v9 = sub_10000F59C(a3, a4);
    if (v9 <= a4 - a3)
    {
      v10 = v9;
      v11 = ccder_sizeof(0x2000000000000010, v9 + *(unsigned __int8 *)(a2 + 1) + 2);
      v12 = (char *)calloc(v11, 1uLL);
      if (!v12)
        return 4294967279;
      v13 = v12;
      v14 = &v12[v11];
      v22 = v12;
      v23 = &v12[v11];
      if (ccder_blob_encode_body(&v22, v10, a3))
      {
        v24 = v13;
        v25 = v23;
        v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2, a2);
        v16 = v25;
        if (!v15)
          v16 = 0;
        v24 = v13;
        v25 = v16;
        v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010, v14 - v16);
        v18 = v25;
        if (!v17)
          v18 = 0;
        if (v18 && v18 == v13)
        {
          v20 = calloc(0x18uLL, 1uLL);
          if (v20)
          {
            v21 = v20;
            result = 0;
            v21[1] = v13;
            v21[2] = v11;
            *v21 = *a1;
            *a1 = v21;
            return result;
          }
        }
      }
      memset_s(v13, v11, 0, v11);
      free(v13);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10000FF34(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10000FDC8(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_10000FF44(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  BOOL v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    v9 = *(unsigned __int8 *)(a2 + 1);
    v10 = ccder_sizeof(4, a4);
    v11 = ccder_sizeof(0x2000000000000010, v9 + v10 + 2);
    v12 = (char *)calloc(v11, 1uLL);
    if (v12)
    {
      v13 = v12;
      v14 = &v12[v11];
      v22 = v12;
      v23 = &v12[v11];
      if (!ccder_blob_encode_body(&v22, a4, a3) || !ccder_blob_encode_tl(&v22, 4, a4))
        goto LABEL_19;
      v24 = v13;
      v25 = v23;
      v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v16 = v25;
      if (!v15)
        v16 = 0;
      v24 = v13;
      v25 = v16;
      v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010, v14 - v16);
      v18 = v25;
      if (!v17)
        v18 = 0;
      v19 = v18 && v18 == v13;
      if (v19 && (v20 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v21 = v20;
        result = 0;
        v21[1] = v13;
        v21[2] = v11;
        *v21 = *a1;
        *a1 = v21;
      }
      else
      {
LABEL_19:
        memset_s(v13, v11, 0, v11);
        free(v13);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000100B0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v19;
  char *v20;
  int v21;
  char *v22;
  BOOL v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v3 = a3;
  v6 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v11 = 8;
  }
  else
  {
    v7 = 9;
    v8 = 48;
    v9 = 1;
    while ((unint64_t)(v7 - 2) >= 2)
    {
      v10 = a3 >> v8;
      --v7;
      v8 -= 8;
      if ((_DWORD)v6 != v10)
      {
        v9 = v7 - 1;
        goto LABEL_8;
      }
    }
    v7 = 2;
LABEL_8:
    if ((((a3 >> (8 * v9 - 8)) ^ v6) & 0x80) != 0)
      v11 = v7;
    else
      v11 = v9;
  }
  v30 = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v13 = *(unsigned __int8 *)(a2 + 1);
    v14 = ccder_sizeof(2, v11);
    v15 = ccder_sizeof(0x2000000000000010, v13 + v14 + 2);
    v16 = (char *)calloc(v15, 1uLL);
    if (v16)
    {
      v17 = v16;
      v18 = v11;
      do
      {
        *((_BYTE *)&v30 + v18 - 1) = v3;
        v3 >>= 8;
        --v18;
      }
      while (v18);
      v26 = v16;
      v27 = &v16[v15];
      if ((ccder_blob_encode_body(&v26, v11, &v30) & 1) == 0 || !ccder_blob_encode_tl(&v26, 2, v11))
        goto LABEL_30;
      v28 = v17;
      v29 = v27;
      v19 = ccder_blob_encode_body(&v28, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v20 = v29;
      if (!v19)
        v20 = 0;
      v28 = v17;
      v29 = v20;
      v21 = ccder_blob_encode_tl(&v28, 0x2000000000000010, &v17[v15] - v20);
      v22 = v29;
      if (!v21)
        v22 = 0;
      v23 = v22 && v22 == v17;
      if (v23 && (v24 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v25 = v24;
        result = 0;
        v25[1] = v17;
        v25[2] = v15;
        *v25 = *a1;
        *a1 = v25;
      }
      else
      {
LABEL_30:
        memset_s(v17, v15, 0, v15);
        free(v17);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000102C4(_QWORD *a1, void **a2)
{
  uint64_t v2;
  char *v3;
  const void *v4;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  int v9;
  int v11;
  void *__s2[2];
  _QWORD v13[2];
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v2 = *a1 + a1[1];
  v13[0] = *a1;
  v13[1] = v2;
  v3 = (char *)a2[1] + (_QWORD)*a2;
  __s2[0] = *a2;
  __s2[1] = v3;
  if (!ccder_blob_decode_sequence_tl(v13, v13))
    return 4294967293;
  if (!ccder_blob_decode_sequence_tl(__s2, __s2))
    return 4294967293;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  if (!ccder_blob_decode_tag(v13, &v17))
    return 4294967293;
  if (!ccder_blob_decode_len(v13, &v16))
    return 4294967293;
  v4 = (const void *)v13[0];
  if (!v13[0]
    || !ccder_blob_decode_tag(__s2, &v15)
    || !ccder_blob_decode_len(__s2, &v14)
    || !__s2[0])
  {
    return 4294967293;
  }
  if (v17 > v15)
    return 1;
  if (v15 > v17)
    return 0xFFFFFFFFLL;
  v6 = v16;
  v7 = v14;
  v8 = v16 >= v14 ? v14 : v16;
  v9 = memcmp(v4, __s2[0], v8);
  if (v9 > 0 || !v9 && v6 > v7)
    return 1;
  v11 = v9 < 0 || v6 < v7;
  return (v11 << 31 >> 31);
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  size_t v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  size_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  if (qword_100066880 != -1)
    dispatch_once(&qword_100066880, &stru_100050D70);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v18 = a1;
    v19 = 2048;
    v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v18 = "data";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v18 = "dataLength > 0";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 180;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    v5 = 258;
    goto LABEL_12;
  }
  v5 = sub_1000109D0();
  if ((_DWORD)v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v13 = __osLogPearlLib;
    else
      v13 = &_os_log_default;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = (int)v5;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 183;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = sub_100010C8C(dword_100066878, 10, 0, a1, a2, 0, 0);
    if ((_DWORD)v6)
    {
      v14 = v6;
      v15 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      if (__osLogPearlLib)
        v16 = __osLogPearlLib;
      else
        v16 = &_os_log_default;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v15;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v25 = 1024;
        v26 = 186;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v5 = v14;
    }
  }
LABEL_12:
  if (dword_100066878)
  {
    IOServiceClose(dword_100066878);
    dword_100066878 = 0;
  }
  if ((_DWORD)v5)
  {
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLibTrace)
      v7 = __osLogPearlLibTrace;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v5;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLibTrace)
      v10 = __osLogPearlLibTrace;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_1000109D0()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
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

  v0 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100066878);
    if ((_DWORD)v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      if (__osLogPearlLib)
        v6 = __osLogPearlLib;
      else
        v6 = &_os_log_default;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v8 = "err == 0 ";
        v9 = 2048;
        v10 = (int)v3;
        v11 = 2080;
        v12 = "";
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v15 = 1024;
        v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    v3 = 3758097084;
    if (__osLogPearlLib)
      v5 = __osLogPearlLib;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "service";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v15 = 1024;
      v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_100010C8C(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v14;
  _WORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  _BYTE outputStructCnt[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v14 = a5 + 8;
  v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    v16 = v15;
    *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5)
      memmove(v15 + 4, a4, a5);
    if (a7)
    {
      *(_QWORD *)outputStructCnt = *a7;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(_QWORD *)outputStructCnt;
    }
    else
    {
      *(_QWORD *)outputStructCnt = 0;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(_QWORD *)&outputStructCnt[4] = "cmd";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v27 = 1024;
      v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSString *v15;
  FILE *v16;
  NSString *v17;
  NSObject *v18;
  NSString *v19;
  NSObject *v20;
  const char *v21;
  NSFileManager *v22;
  unsigned int v23;
  NSFileManager *v24;
  unsigned int v25;
  NSObject *v26;
  NSFileManager *v27;
  unsigned __int8 v28;
  NSDictionary *v29;
  NSFileManager *v30;
  uint64_t v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  _DWORD *v35;
  int *v36;
  int v37;
  NSObject *v38;
  int v39;
  unsigned int v40;
  int v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int *v47;
  uint64_t v48;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  NSData *v55;
  NSString *v56;
  unsigned __int8 v57;
  FILE *v58;
  double v59;
  unsigned int v60;
  int v61;
  NSObject *v62;
  unsigned int v63;
  int v64;
  double v65;
  NSString *v66;
  NSObject *v67;
  const char *v68;
  unsigned __int8 v69;
  FILE *v70;
  NSObject *v71;
  NSString *v72;
  NSObject *v73;
  const char *v74;
  NSString *v75;
  NSString *v76;
  NSData *v77;
  NSData *v78;
  NSString *v79;
  NSObject *v80;
  NSString *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  io_connect_t v88;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSString *v93;
  NSObject *v94;
  NSString *v95;
  NSObject *v96;
  NSString *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  unsigned int *v110;
  uint64_t v111;
  NSString *v112;
  unsigned int *v113;
  __CFString *v114;
  unsigned int *v115;
  id v116;
  int *v117;
  NSString *v118;
  NSData *v119;
  NSString *v120;
  int v121;
  _DWORD v122[2];
  size_t v123;
  NSFileAttributeKey v124;
  _UNKNOWN **v125;
  uint8_t buf[4];
  _BYTE v127[10];
  uint64_t v128;
  _BYTE v129[26];
  char __str[16];
  __int128 v131;

  v123 = 0;
  *(_OWORD *)__str = 0u;
  v131 = 0u;
  if (!a1 || !a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v99 = __osLogPearlLib;
    else
      v99 = &_os_log_default;
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v99 = __osLogPearlLib;
    else
      v99 = &_os_log_default;
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "systemRootPath";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 310;
LABEL_190:
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    v12 = 258;
LABEL_263:
    v35 = (_DWORD *)&unk_100066000;
    goto LABEL_124;
  }
  v6 = sub_1000109D0();
  if ((_DWORD)v6)
  {
    v12 = v6;
    v100 = (int)v6;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v101 = __osLogPearlLib;
    else
      v101 = &_os_log_default;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v100;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 313;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v102 = __osLogPearlLib;
    else
      v102 = &_os_log_default;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "fdrInput";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 317;
    goto LABEL_221;
  }
  v8 = v7;
  *(_DWORD *)v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  v9 = sub_100010C8C(dword_100066878, 36, 0, v8, a2 + 9, 0, 0);
  if ((_DWORD)v9)
  {
    v12 = v9;
    v103 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v104 = __osLogPearlLib;
    else
      v104 = &_os_log_default;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v103;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 327;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  v123 = 52;
  v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v102 = __osLogPearlLib;
    else
      v102 = &_os_log_default;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "dataInfo";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 334;
LABEL_221:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    v12 = 260;
    goto LABEL_263;
  }
  v11 = v10;
  v12 = sub_100010C8C(dword_100066878, 45, 0, 0, 0, v10, &v123);
  if ((_DWORD)v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v105 = __osLogPearlLib;
    else
      v105 = &_os_log_default;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = (int)v12;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 338;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(__stderrp, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_100066880 != -1)
    dispatch_once(&qword_100066880, &stru_100050D70);
  if (__osLogPearlLib)
    v13 = __osLogPearlLib;
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v106 = __osLogPearlLib;
    else
      v106 = &_os_log_default;
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "dataInfo->setCount > 0";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 342;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 259;
    goto LABEL_262;
  }
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s"), a3, "/System/Library/Pearl/ReferenceFrames");
  v16 = __stderrp;
  if (!v15)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v107 = __osLogPearlLib;
    else
      v107 = &_os_log_default;
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "path";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 345;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 261;
    goto LABEL_262;
  }
  v17 = objc_retainAutorelease(v15);
  fprintf(v16, "ReferenceFramesPath: %s\n", -[NSString UTF8String](v17, "UTF8String"));
  if (qword_100066880 != -1)
    dispatch_once(&qword_100066880, &stru_100050D70);
  if (__osLogPearlLib)
    v18 = __osLogPearlLib;
  else
    v18 = &_os_log_default;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_retainAutorelease(v17);
    v20 = v18;
    v21 = -[NSString UTF8String](v19, "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v127 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);

  }
  v22 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v23 = -[NSFileManager fileExistsAtPath:](v22, "fileExistsAtPath:", v17);

  if (v23)
  {
    v24 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v25 = -[NSFileManager removeItemAtPath:error:](v24, "removeItemAtPath:error:", v17, 0);

    if ((v25 & 1) == 0)
    {
      v12 = v25 ^ 1;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      if (__osLogPearlLib)
        v108 = __osLogPearlLib;
      else
        v108 = &_os_log_default;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v127 = "err == 0 ";
        *(_WORD *)&v127[8] = 2048;
        v128 = v12;
        *(_WORD *)v129 = 2080;
        *(_QWORD *)&v129[2] = "";
        *(_WORD *)&v129[10] = 2080;
        *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v129[20] = 1024;
        *(_DWORD *)&v129[22] = 353;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v26 = __osLogPearlLib;
    else
      v26 = &_os_log_default;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  v27 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v28 = -[NSFileManager fileExistsAtPath:](v27, "fileExistsAtPath:", v17);

  if ((v28 & 1) != 0)
    goto LABEL_37;
  v124 = NSFilePosixPermissions;
  v125 = &off_1000586A8;
  v29 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
  v30 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v12 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, v29, 0) ^ 1;

  if ((v12 & 1) != 0)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v109 = __osLogPearlLib;
    else
      v109 = &_os_log_default;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v12;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 362;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    v31 = 0;
    v119 = 0;
    v120 = 0;
    v114 = 0;
    v32 = 0;
    v33 = 0;
    v116 = 0;
    v34 = 0;
    v35 = &unk_100066000;
    v110 = v11;
    while (1)
    {
      v36 = &v11[3 * v31];
      v37 = v36[1];
      v115 = (unsigned int *)(++v36 + 1);
      v117 = v36;
      v113 = (unsigned int *)(v36 + 2);
      fprintf(__stderrp, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v31, v37, v36[1], v36[2]);
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      v121 = v31;
      if (__osLogPearlLib)
        v38 = __osLogPearlLib;
      else
        v38 = &_os_log_default;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = *v117;
        v40 = *v115;
        v41 = *v113;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v127 = v31;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v39;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v40;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      v42 = *v117;
      if (v42 <= 3)
        v114 = off_100050D90[v42];
      v43 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");

      if (!v43)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v93 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        if (__osLogPearlLib)
          v94 = __osLogPearlLib;
        else
          v94 = &_os_log_default;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "setDictionary";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 383;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v11 = v110;
        v77 = v119;
        v32 = v93;
        v76 = v33;
        goto LABEL_79;
      }
      v111 = v31;
      v116 = v43;
      objc_msgSend(v43, "setObject:forKeyedSubscript:", &off_1000586C0, CFSTR("FormatDR"));
      v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/reference-%@.plist"), v17, v114);

      if (!v44)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        v77 = v119;
        v95 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        if (__osLogPearlLib)
          v96 = __osLogPearlLib;
        else
          v96 = &_os_log_default;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "dictFileName";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 388;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v76 = (NSString *)v43;
        v11 = v110;
        v32 = v95;
        goto LABEL_79;
      }
      v112 = v44;
      if (*v115)
        break;
LABEL_68:
      v69 = objc_msgSend(v116, "writeToFile:atomically:", v112, 0);
      v70 = __stderrp;
      if ((v69 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v97 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        v77 = v119;
        if (__osLogPearlLib)
          v98 = __osLogPearlLib;
        else
          v98 = &_os_log_default;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v128 = 1;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 438;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v12 = 1;
        v11 = v110;
        v32 = v97;
        v76 = v112;
        goto LABEL_79;
      }
      v33 = objc_retainAutorelease(v112);
      fprintf(v70, "Reference set dictionary written to %s\n", -[NSString UTF8String](v33, "UTF8String"));
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      v11 = v110;
      if (__osLogPearlLib)
        v71 = __osLogPearlLib;
      else
        v71 = &_os_log_default;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = objc_retainAutorelease(v33);
        v73 = v71;
        v74 = -[NSString UTF8String](v72, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v127 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);

      }
      v31 = v111 + 1;
      if (v111 + 1 >= (unint64_t)*v110)
      {

        v12 = 0;
        v76 = v33;
        v77 = v119;
LABEL_79:

        v75 = v120;
        goto LABEL_80;
      }
    }
    v45 = 0;
    while (1)
    {
      v122[0] = v121;
      v122[1] = v45;
      v123 = *v113 + 524;
      v46 = (unsigned int *)calloc(v123, 1uLL);
      if (!v46)
        break;
      v47 = v46;
      v48 = sub_100010C8C(v35[542], 46, 0, v122, 8uLL, v46, &v123);
      if ((_DWORD)v48)
      {
        v12 = v48;
        v81 = v34;
        v82 = (int)v48;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v48, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v118 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        if (__osLogPearlLib)
          v83 = __osLogPearlLib;
        else
          v83 = &_os_log_default;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v128 = v82;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 403;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v47) - 32) <= 0xFFFFFFE0)
      {
        v81 = v34;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v118 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        if (__osLogPearlLib)
          v84 = __osLogPearlLib;
        else
          v84 = &_os_log_default;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 406;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
LABEL_104:
        v85 = v110;
        v50 = v81;
LABEL_121:
        v53 = v120;
LABEL_122:
        free(v85);
        free(v47);

        v78 = v119;
        goto LABEL_123;
      }
      v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str);

      if (!v49)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v118 = v32;
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        v85 = v110;
        if (__osLogPearlLib)
          v86 = __osLogPearlLib;
        else
          v86 = &_os_log_default;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "tempString";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 409;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v50 = 0;
        v12 = 261;
        v35 = (_DWORD *)&unk_100066000;
        goto LABEL_121;
      }
      v50 = v49;
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reference-%@__T_%@.bin"), v114, v49);

      if (!v51)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        v85 = v110;
        if (__osLogPearlLib)
          v87 = __osLogPearlLib;
        else
          v87 = &_os_log_default;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refFileName";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 412;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v118 = 0;
        v12 = 261;
        goto LABEL_121;
      }
      v52 = v51;
      v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v17, v51);

      v118 = v52;
      if (!v53)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        if (__osLogPearlLib)
          v90 = __osLogPearlLib;
        else
          v90 = &_os_log_default;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refPath";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 415;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v53 = 0;
        v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v54 = v17;
      objc_msgSend(v116, "setObject:forKeyedSubscript:", v52, v50);
      v55 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v47 + 3, v47[2], 0);

      if (!v55)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        v17 = v54;
        if (__osLogPearlLib)
          v91 = __osLogPearlLib;
        else
          v91 = &_os_log_default;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refFrameData";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 423;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v119 = 0;
        v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v56 = v50;
      v119 = v55;
      v57 = -[NSData writeToFile:atomically:](v55, "writeToFile:atomically:", v53, 0);
      v58 = __stderrp;
      if ((v57 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_100066880 != -1)
          dispatch_once(&qword_100066880, &stru_100050D70);
        v17 = v54;
        if (__osLogPearlLib)
          v92 = __osLogPearlLib;
        else
          v92 = &_os_log_default;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v12 = 1;
          v128 = 1;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 426;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          v12 = 1;
        }
        v85 = v110;
        goto LABEL_122;
      }
      v59 = *(double *)v47;
      v60 = v47[2];
      v61 = *v117;
      v120 = objc_retainAutorelease(v53);
      fprintf(v58, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v121, v45, v60, v61, v59, -[NSString UTF8String](v120, "UTF8String"));
      if (qword_100066880 != -1)
        dispatch_once(&qword_100066880, &stru_100050D70);
      if (__osLogPearlLib)
        v62 = __osLogPearlLib;
      else
        v62 = &_os_log_default;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v47[2];
        v64 = *v117;
        v65 = *(double *)v47;
        v66 = objc_retainAutorelease(v120);
        v67 = v62;
        v68 = -[NSString UTF8String](v66, "UTF8String");
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v127 = v121;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v45;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v63;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v64;
        *(_WORD *)&v129[4] = 2048;
        *(double *)&v129[6] = v65;
        v35 = (_DWORD *)&unk_100066000;
        *(_WORD *)&v129[14] = 2080;
        *(_QWORD *)&v129[16] = v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);

      }
      free(v47);
      ++v45;
      v17 = v54;
      v34 = v56;
      v32 = v118;
      if (v45 >= *v115)
        goto LABEL_68;
    }
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    v79 = v32;
    if (qword_100066880 != -1)
      dispatch_once(&qword_100066880, &stru_100050D70);
    if (__osLogPearlLib)
      v80 = __osLogPearlLib;
    else
      v80 = &_os_log_default;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "refFrame";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 400;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v110);

    v12 = 260;
  }
  else
  {
    v75 = 0;
    v32 = 0;
    v34 = 0;
    v77 = 0;
    v12 = 0;
    v35 = (_DWORD *)&unk_100066000;
LABEL_80:
    free(v11);

    v78 = v77;
LABEL_123:

  }
LABEL_124:
  v88 = v35[542];
  if (v88)
  {
    IOServiceClose(v88);
    v35[542] = 0;
  }
  return v12;
}

void sub_10001308C(id a1)
{
  os_log_t v1;
  void *v2;
  void *v3;

  v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000130FC();
    v3 = (void *)__osLogPearlLib;
  }
  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_1000130FC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

uint64_t AMAuthInstallCreate(const __CFAllocator *a1)
{
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  CFMutableDictionaryRef v4;
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  CFMutableDictionaryRef v7;
  CFMutableDictionaryRef v8;
  CFMutableDictionaryRef v9;
  uint64_t Instance;
  uint64_t v11;
  void *v12;
  CFTypeRef v13;
  uint64_t v14;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v17;
  CFURLRef v18;
  CFURLRef v19;
  CFURLRef cf;

  pthread_once(&stru_100066248, (void (*)(void))sub_100013B6C);
  Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable || (cf = CFURLCreateWithString(a1, CFSTR("https://gs.apple.com:443/"), 0)) == 0)
  {
    v11 = 0;
    cf = 0;
LABEL_21:
    v19 = 0;
LABEL_23:
    v18 = 0;
LABEL_25:
    v17 = 0;
    v2 = 0;
LABEL_26:
    v3 = 0;
LABEL_27:
    v4 = 0;
LABEL_28:
    v5 = 0;
LABEL_29:
    v6 = 0;
LABEL_30:
    v7 = 0;
LABEL_31:
    v8 = 0;
LABEL_32:
    v9 = 0;
    goto LABEL_18;
  }
  v19 = CFURLCreateWithString(a1, CFSTR("http://vega-dr.apple.com:8080/vegads/fuser"), 0);
  if (!v19)
  {
    v11 = 0;
    goto LABEL_21;
  }
  v18 = CFURLCreateWithString(a1, CFSTR("http://treecko-dr.apple.com:8080/TREECKO/controller"), 0);
  if (!v18)
  {
    v11 = 0;
    goto LABEL_23;
  }
  v17 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v17)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v2 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    v11 = 0;
    goto LABEL_26;
  }
  v3 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v3)
  {
    v11 = 0;
    goto LABEL_27;
  }
  v4 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v4)
  {
    v11 = 0;
    goto LABEL_28;
  }
  v5 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v5)
  {
    v11 = 0;
    goto LABEL_29;
  }
  v6 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v6)
  {
    v11 = 0;
    goto LABEL_30;
  }
  v7 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v7)
  {
    v11 = 0;
    goto LABEL_31;
  }
  v8 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v8)
  {
    v11 = 0;
    goto LABEL_32;
  }
  v9 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v9)
  {
    Instance = _CFRuntimeCreateInstance(a1, qword_100066888, 512, 0);
    v11 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 496) = 0u;
      *(_OWORD *)(Instance + 512) = 0u;
      *(_OWORD *)(Instance + 464) = 0u;
      *(_OWORD *)(Instance + 480) = 0u;
      *(_OWORD *)(Instance + 432) = 0u;
      *(_OWORD *)(Instance + 448) = 0u;
      *(_OWORD *)(Instance + 400) = 0u;
      *(_OWORD *)(Instance + 416) = 0u;
      *(_OWORD *)(Instance + 368) = 0u;
      *(_OWORD *)(Instance + 384) = 0u;
      *(_OWORD *)(Instance + 336) = 0u;
      *(_OWORD *)(Instance + 352) = 0u;
      *(_OWORD *)(Instance + 304) = 0u;
      *(_OWORD *)(Instance + 320) = 0u;
      *(_OWORD *)(Instance + 272) = 0u;
      *(_OWORD *)(Instance + 288) = 0u;
      *(_OWORD *)(Instance + 240) = 0u;
      *(_OWORD *)(Instance + 256) = 0u;
      *(_OWORD *)(Instance + 208) = 0u;
      *(_OWORD *)(Instance + 224) = 0u;
      *(_OWORD *)(Instance + 176) = 0u;
      *(_OWORD *)(Instance + 192) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 160) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 16) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_BYTE *)(Instance + 520) = 0;
      *(_WORD *)(Instance + 57) = 257;
      *(_QWORD *)(Instance + 72) = CFRetain(cf);
      *(_DWORD *)(v11 + 80) = 3;
      *(_QWORD *)(v11 + 352) = CFRetain(Mutable);
      *(_QWORD *)(v11 + 376) = CFRetain(v17);
      *(_QWORD *)(v11 + 384) = CFRetain(v2);
      *(_QWORD *)(v11 + 416) = CFRetain(v3);
      *(_QWORD *)(v11 + 160) = CFRetain(v19);
      *(_QWORD *)(v11 + 296) = CFRetain(v18);
      *(_QWORD *)(v11 + 88) = CFSTR("ApImg4Ticket");
      *(_QWORD *)(v11 + 200) = CFRetain(v4);
      *(_QWORD *)(v11 + 208) = CFRetain(v5);
      *(_QWORD *)(v11 + 216) = CFRetain(v6);
      v12 = calloc(1uLL, 0x30uLL);
      *(_QWORD *)(v11 + 128) = v12;
      if (v12)
      {
        v13 = CFRetain(v7);
        v14 = *(_QWORD *)(v11 + 128);
        *(_QWORD *)v14 = v13;
        *(_QWORD *)(v14 + 40) = 0;
        *(_OWORD *)(v14 + 24) = 0u;
        *(_OWORD *)(v14 + 8) = 0u;
        *(_QWORD *)(v11 + 496) = 0;
        *(_BYTE *)(v11 + 504) = 0;
        *(_QWORD *)(v11 + 440) = sub_100013724;
        *(_QWORD *)(v11 + 448) = sub_10001372C;
        *(_QWORD *)(v11 + 456) = CFRetain(v8);
        *(_QWORD *)(v11 + 464) = CFRetain(v9);
        *(_QWORD *)(v11 + 488) = 0;
        *(_QWORD *)(v11 + 512) = 0;
        *(_QWORD *)(v11 + 360) = AMAuthInstallLockCreate((uint64_t)a1);
      }
      else
      {
        sub_1000135DC(v11);
      }
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_18:
  SafeRelease(Mutable);
  SafeRelease(cf);
  SafeRelease(v19);
  SafeRelease(v18);
  SafeRelease(v17);
  SafeRelease(v2);
  SafeRelease(v3);
  SafeRelease(0);
  SafeRelease(v4);
  SafeRelease(v5);
  SafeRelease(v6);
  SafeRelease(v7);
  SafeRelease(v8);
  SafeRelease(v9);
  return v11;
}

double sub_1000135DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  if (!a1)
    sub_100037898();
  if (!*(_BYTE *)(a1 + 520))
  {
    *(_BYTE *)(a1 + 520) = 1;
    AMAuthInstallApFinalize(a1);
    AMAuthInstallBasebandFinalize(a1, v2, v3, v4, v5, v6, v7, v8);
    AMAuthInstallBundleFinalize(a1);
    SafeRelease(*(CFTypeRef *)(a1 + 120));
    SafeRelease(*(CFTypeRef *)(a1 + 376));
    SafeRelease(*(CFTypeRef *)(a1 + 384));
    SafeRelease(*(CFTypeRef *)(a1 + 416));
    SafeRelease(*(CFTypeRef *)(a1 + 336));
    SafeRelease(*(CFTypeRef *)(a1 + 96));
    SafeRelease(*(CFTypeRef *)(a1 + 72));
    SafeRelease(*(CFTypeRef *)(a1 + 88));
    SafeRelease(*(CFTypeRef *)(a1 + 64));
    SafeRelease(*(CFTypeRef *)(a1 + 352));
    SafeRelease(*(CFTypeRef *)(a1 + 296));
    SafeRelease(*(CFTypeRef *)(a1 + 312));
    SafeRelease(*(CFTypeRef *)(a1 + 320));
    SafeRelease(*(CFTypeRef *)(a1 + 424));
    SafeRelease(*(CFTypeRef *)(a1 + 456));
    SafeRelease(*(CFTypeRef *)(a1 + 464));
    SafeRelease(*(CFTypeRef *)(a1 + 472));
    SafeRelease(*(CFTypeRef *)(a1 + 480));
    SafeRelease(*(CFTypeRef *)(a1 + 496));
    SafeRelease(*(CFTypeRef *)(a1 + 40));
    SafeRelease(*(CFTypeRef *)(a1 + 512));
    SafeRelease(*(CFTypeRef *)(a1 + 360));
    SafeRelease(*(CFTypeRef *)(a1 + 488));
    result = 0.0;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
  }
  return result;
}

uint64_t sub_100013724()
{
  return 1;
}

uint64_t sub_10001372C()
{
  return 1;
}

const __CFString *AMAuthInstallGetLocalizedStatusString(CFDictionaryRef *cf, int a2)
{
  const __CFString *Value;
  const __CFAllocator *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int valuePtr;

  valuePtr = a2;
  if (a2 > 98)
  {
    switch(a2)
    {
      case 3500:
        Value = CFSTR("The signing server returned an internal error");
        break;
      case 3501:
        Value = CFSTR("You must authorize with the signing server before making this request");
        break;
      case 3502:
      case 3505:
      case 3506:
        goto LABEL_34;
      case 3503:
        Value = CFSTR("You are not authorized to make this request. Please check your device or credentials");
        break;
      case 3504:
        Value = CFSTR("The signing server could not find the resource requested");
        break;
      case 3507:
        Value = CFSTR("You must authorize with a proxy server before making this request");
        break;
      default:
        if (a2 == 99)
        {
          Value = CFSTR("Generic");
        }
        else if (a2 == 3194)
        {
          Value = CFSTR("Declined to authorize this image on this device for this user.");
        }
        else
        {
LABEL_34:
          Value = &stru_100052650;
          if (cf)
          {
            if ((a2 - 3100) <= 0x383)
            {
              v4 = CFGetAllocator(cf);
              v5 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
              if (v5)
              {
                v6 = v5;
                Value = (const __CFString *)CFDictionaryGetValue(cf[44], v5);
                CFRelease(v6);
                if (!Value)
                  AMAuthInstallLog(7, "AMAuthInstallGetLocalizedStatusString", "no cached text for tss error code %d", v7, v8, v9, v10, v11, valuePtr);
              }
            }
          }
        }
        break;
    }
  }
  else
  {
    Value = CFSTR("No error");
    switch(a2)
    {
      case 0:
        return Value;
      case 1:
        Value = CFSTR("Bad parameter");
        break;
      case 2:
        Value = CFSTR("Allocation error");
        break;
      case 3:
        Value = CFSTR("Conversion error");
        break;
      case 4:
        Value = CFSTR("File error");
        break;
      case 5:
        Value = CFSTR("Hash error");
        break;
      case 6:
        Value = CFSTR("Crypto error");
        break;
      case 7:
        Value = CFSTR("Bad build identity");
        break;
      case 8:
        Value = CFSTR("Entry not found");
        break;
      case 9:
        Value = CFSTR("Invalid img3 object");
        break;
      case 10:
        Value = CFSTR("Invalid bbfw object");
        break;
      case 11:
        Value = CFSTR("Server not reachable");
        break;
      case 12:
        Value = CFSTR("Server timed out");
        break;
      case 13:
        Value = CFSTR("Unimplemented");
        break;
      case 14:
        Value = CFSTR("Internal error");
        break;
      case 15:
        Value = CFSTR("Invalid bbfw file");
        break;
      case 16:
        Value = CFSTR("Network error");
        break;
      case 17:
        Value = CFSTR("Bad response");
        break;
      case 18:
        Value = CFSTR("Fusing failed");
        break;
      case 19:
        Value = CFSTR("Baseband provisioning failed");
        break;
      case 20:
        Value = CFSTR("AppleConnect not found");
        break;
      case 21:
        Value = CFSTR("AppleConnect user canceled");
        break;
      case 22:
        Value = CFSTR("AppleConnect bad credentials");
        break;
      default:
        goto LABEL_34;
    }
  }
  return Value;
}

uint64_t AMAuthInstallSetSigningServerURL(uint64_t a1, const void *a2)
{
  uint64_t result;
  const void *v5;
  CFTypeRef v6;

  result = 1;
  if (a1 && a2)
  {
    v5 = *(const void **)(a1 + 72);
    if (v5 == a2)
    {
      return 0;
    }
    else
    {
      SafeRelease(v5);
      v6 = CFRetain(a2);
      result = 0;
      *(_QWORD *)(a1 + 72) = v6;
    }
  }
  return result;
}

uint64_t AMAuthInstallSetSOCKSProxyInformation(uint64_t a1, const void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFDictionary *Mutable;
  __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v20;
  char v21;

  if (a2)
  {
    if (a3)
    {
      if (a1)
      {
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          v12 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("SOCKSProxy"), a2);
          CFDictionarySetValue(v12, CFSTR("SOCKSPort"), a3);
          AMAuthInstallSetSOCKSProxyDict(a1, v12, v13, v14, v15, v16, v17, v18);
          CFRelease(v12);
          return 0;
        }
        v20 = "Created proxy dictionary is NULL";
      }
      else
      {
        v20 = "amai is NULL";
      }
    }
    else
    {
      v20 = "SOCKS proxy port is NULL";
    }
  }
  else
  {
    v20 = "SOCKS proxy host is NULL";
  }
  AMAuthInstallLog(3, "AMAuthInstallSetSOCKSProxyInformation", v20, a4, a5, a6, a7, a8, v21);
  return 99;
}

uint64_t AMAuthInstallSetSOCKSProxyDict(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v10;
  CFTypeRef v11;
  uint64_t result;
  const char *v13;
  char v14;

  if (!cf)
  {
    v13 = "SOCKS proxy dict is NULL";
LABEL_8:
    AMAuthInstallLog(3, "AMAuthInstallSetSOCKSProxyDict", v13, a4, a5, a6, a7, a8, v14);
    return 99;
  }
  if (!a1)
  {
    v13 = "amai is NULL";
    goto LABEL_8;
  }
  v10 = *(const void **)(a1 + 488);
  if (v10)
    CFRelease(v10);
  v11 = CFRetain(cf);
  result = 0;
  *(_QWORD *)(a1 + 488) = v11;
  return result;
}

uint64_t sub_100013B6C()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_100050DB0);
  qword_100066888 = result;
  return result;
}

CFStringRef sub_100013B90(uint64_t a1, const __CFDictionary *a2)
{
  __CFString *v4;
  __CFString *v5;
  const __CFAllocator *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *LibraryVersionString;
  uint64_t PlatformInfoString;
  CFStringRef v13;

  if (!a1)
    sub_1000378C0();
  v4 = AMAuthInstallApCopyDescription(a1);
  v5 = AMAuthInstallBasebandCopyDescription(a1);
  v6 = CFGetAllocator((CFTypeRef)a1);
  v7 = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(a1 + 64))
    v8 = *(const __CFString **)(a1 + 64);
  else
    v8 = CFSTR("default");
  if (*(_BYTE *)(a1 + 56))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (*(_QWORD *)(a1 + 104))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
  PlatformInfoString = AMAuthInstallPlatformGetPlatformInfoString();
  v13 = CFStringCreateWithFormat(v6, a2, CFSTR("<AMAuthInstall %p>{ap=%@, bp=%@, UserAuth=%@, iTunes=%@, server=\"%@\", locale=%@, version=\"%@\", platform=%@}"), a1, v4, v5, v10, v9, v7, v8, LibraryVersionString, PlatformInfoString);
  SafeRelease(v4);
  SafeRelease(v5);
  return v13;
}

CFStringRef sub_100013C88(uint64_t a1)
{
  return sub_100013B90(a1, 0);
}

uint64_t AMAuthInstallApSupportsLocalSigning(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  char v13;

  result = 1;
  if (a1 && a2)
  {
    v11 = *(_QWORD *)(a1 + 16);
    if (v11)
    {
      if (*(_BYTE *)(v11 + 96))
      {
        v12 = AMAuthInstallApImg4SupportsLocalSigning(a1);
LABEL_8:
        v13 = v12;
        result = 0;
        *a2 = v13;
        return result;
      }
    }
    else
    {
      AMAuthInstallLog(3, "AMAuthInstallApIsImg4", "%s: apParameters is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApIsImg4");
    }
    v12 = AMAuthInstallApImg3SupportsLocalSigning();
    goto LABEL_8;
  }
  return result;
}

uint64_t AMAuthInstallApSupportsGlobalSigning(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;
  BOOL v12;

  result = 1;
  if (a1 && a2)
  {
    v11 = *(_QWORD *)(a1 + 16);
    if (v11)
    {
      if (*(_BYTE *)(v11 + 96))
      {
        v12 = AMAuthInstallApImg4SupportsGlobalSigning(a1);
        result = 0;
        *a2 = v12;
        return result;
      }
    }
    else
    {
      AMAuthInstallLog(3, "AMAuthInstallApIsImg4", "%s: apParameters is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApIsImg4");
    }
    return 13;
  }
  return result;
}

__CFString *AMAuthInstallApCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  uint64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  const char *v15;
  const __CFAllocator *v16;
  const char *v17;

  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 64);
  CFStringAppend(Mutable, CFSTR("("));
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = "YES";
    if (*(_BYTE *)(a1 + 57))
      v6 = "YES";
    else
      v6 = "NO";
    if (*(_BYTE *)(v4 + 20))
      v7 = "YES";
    else
      v7 = "NO";
    if (*(_BYTE *)(v4 + 81))
      v8 = "YES";
    else
      v8 = "NO";
    if (*(_BYTE *)(v4 + 72))
      v9 = "YES";
    else
      v9 = "NO";
    if (*(_BYTE *)(v4 + 82))
      v10 = "YES";
    else
      v10 = "NO";
    if (*(_BYTE *)(v4 + 96))
      v11 = "YES";
    else
      v11 = "NO";
    if (*(_QWORD *)(v4 + 120))
      v12 = "YES";
    else
      v12 = "NO";
    if (!*(_QWORD *)(v4 + 128))
      v5 = "NO";
    CFStringAppendFormat(Mutable, 0, CFSTR("personalize=%s %@ ecid=0x%llx, chipid=0x%x, boardid=0x%x, secDom=%d, isProduction=%s, EPRO=%s, isSecure=%s, ESEC=%s, img4=%s, demotionPolicy=%@, managedBaaCert=%s, slowRollBaaCert=%s, dpoc=%@"), v6, *(_QWORD *)(v4 + 104), *(_QWORD *)v4, *(unsigned int *)(v4 + 8), *(unsigned int *)(v4 + 12), *(unsigned int *)(v4 + 16), v7, v8, v9, v10, v11, *(_QWORD *)(v4 + 88), v12, v5, *(_QWORD *)(v4 + 192));
    v13 = *(_QWORD *)(a1 + 16);
    if (*(_QWORD *)(v13 + 24))
    {
      v14 = CFGetAllocator((CFTypeRef)a1);
      v15 = _CopyHexStringFromData(v14, *(CFDataRef *)(*(_QWORD *)(a1 + 16) + 24));
      CFStringAppendFormat(Mutable, 0, CFSTR(", nonce=0x%@"), v15);
      CFRelease(v15);
      v13 = *(_QWORD *)(a1 + 16);
    }
    if (*(_QWORD *)(v13 + 48))
    {
      v16 = CFGetAllocator((CFTypeRef)a1);
      v17 = _CopyHexStringFromData(v16, *(CFDataRef *)(*(_QWORD *)(a1 + 16) + 48));
      CFStringAppendFormat(Mutable, 0, CFSTR(", sepNonce=0x%@"), v17);
      CFRelease(v17);
    }
  }
  CFStringAppend(Mutable, CFSTR(")"));
  return Mutable;
}

void AMAuthInstallApFinalize(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    SafeRelease(*(CFTypeRef *)(v2 + 24));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 32));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 48));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 56));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 88));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 104));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 120));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 128));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 136));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 160));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 168));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 176));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 184));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 192));
    SafeFree(*(void **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
  }
  SafeRelease(*(CFTypeRef *)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
}

uint64_t AMAuthInstallApRemoveInfoDict(const __CFAllocator *a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  const __CFDictionary *v3;
  uint64_t v4;
  const void **v6;
  const void **v7;
  const __CFDictionary *MutableCopy;
  CFIndex Count;
  const void **v10;
  uint64_t v11;
  const void *v12;
  CFTypeID v13;

  v3 = 0;
  v4 = 1;
  if (theDict)
  {
    v6 = 0;
    v7 = 0;
    if (a3)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, theDict);
      v3 = MutableCopy;
      if (MutableCopy)
      {
        Count = CFDictionaryGetCount(MutableCopy);
        v6 = (const void **)malloc(8 * Count);
        v10 = (const void **)malloc(8 * Count);
        v7 = v10;
        v4 = 2;
        if (v6 && v10)
        {
          CFDictionaryGetKeysAndValues(v3, v6, v10);
          if (Count < 1)
          {
LABEL_14:
            v4 = 0;
            *a3 = CFRetain(v3);
          }
          else
          {
            v11 = 0;
            while (v6[v11])
            {
              v12 = v7[v11];
              if (!v12)
                break;
              v13 = CFGetTypeID(v12);
              if (v13 == CFDictionaryGetTypeID() && CFDictionaryGetValue((CFDictionaryRef)v7[v11], CFSTR("Info")))
                CFDictionaryRemoveValue((CFMutableDictionaryRef)v7[v11], CFSTR("Info"));
              if (Count == ++v11)
                goto LABEL_14;
            }
            v4 = 1;
          }
        }
      }
      else
      {
        v6 = 0;
        v7 = 0;
        v4 = 2;
      }
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  SafeRelease(v3);
  SafeFree(v6);
  SafeFree(v7);
  return v4;
}

uint64_t AMAuthInstallApCreatePersonalizedResponse(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFDictionary *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  _BYTE *v30;
  uint64_t SignedManifest;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFAllocator *v37;
  __CFDictionary *v38;
  char v39;
  const __CFAllocator *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  const void *v49;
  const __CFAllocator *v50;
  __CFDictionary *Mutable;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  char LocalizedStatusString;
  CFTypeRef v61;
  void *value;
  __int16 v63;

  v6 = CFDictionaryContainsKey(theDict, CFSTR("Ap,LocalPolicy"));
  v13 = 0;
  v63 = 0;
  v61 = 0;
  value = 0;
  v14 = 1;
  if (a1 && theDict && a3)
  {
    v15 = v6;
    if (AMAuthInstallApSupportsLocalSigning(a1, (_BYTE *)&v63 + 1, v7, v8, v9, v10, v11, v12))
      goto LABEL_30;
    v22 = AMAuthInstallApSupportsGlobalSigning(a1, (BOOL *)&v63, v16, v17, v18, v19, v20, v21);
    if ((_DWORD)v22 != 13)
    {
      v14 = v22;
      if ((_DWORD)v22)
        goto LABEL_30;
    }
    v28 = *(_QWORD *)(a1 + 16);
    if (v28)
    {
      v29 = *(_BYTE *)(v28 + 78) != 0;
      if (HIBYTE(v63) && *(_BYTE *)(v28 + 78))
      {
        AMAuthInstallLog(6, "_AMAuthInstallApCreatePersonalizedResponseInternal", "Forcing server signing\n", v23, v24, v25, v26, v27, LocalizedStatusString);
        LOBYTE(v29) = 1;
        goto LABEL_16;
      }
    }
    else
    {
      v29 = 0;
    }
    if (HIBYTE(v63) && !v29)
    {
      v30 = (_BYTE *)(a1 + 505);
      if (!*(_BYTE *)(a1 + 505))
        goto LABEL_20;
      goto LABEL_19;
    }
LABEL_16:
    if (!v15 || !*(_BYTE *)(a1 + 505))
    {
      if ((_BYTE)v63)
        v39 = v29;
      else
        v39 = 1;
      if ((v39 & 1) == 0)
      {
        v48 = (void *)CFRetain(*(CFTypeRef *)(a1 + 40));
        value = v48;
        if (v48)
        {
          v49 = v48;
          v50 = CFGetAllocator((CFTypeRef)a1);
          Mutable = CFDictionaryCreateMutable(v50, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          v13 = Mutable;
          if (Mutable)
          {
            CFDictionaryAddValue(Mutable, *(const void **)(a1 + 88), v49);
            *a3 = CFRetain(v13);
            AMAuthInstallLog(6, "_AMAuthInstallApCreatePersonalizedResponseInternal", "Using global signing", v52, v53, v54, v55, v56, LocalizedStatusString);
            v14 = 0;
            goto LABEL_31;
          }
          goto LABEL_46;
        }
        v58 = "global ticketData is NULL";
LABEL_45:
        AMAuthInstallLog(3, "_AMAuthInstallApCreatePersonalizedResponseInternal", v58, v32, v33, v34, v35, v36, LocalizedStatusString);
        v13 = 0;
        goto LABEL_46;
      }
      v40 = CFGetAllocator((CFTypeRef)a1);
      v41 = AMAuthInstallApRemoveInfoDict(v40, theDict, &v61);
      if ((_DWORD)v41)
      {
        v14 = v41;
        v59 = "could not remove info dicts from request";
      }
      else
      {
        v14 = AMAuthInstallRequestSendSync(a1, v61, a3);
        if (!(_DWORD)v14)
          goto LABEL_30;
        LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)a1, v14);
        v59 = "server request error: %@";
      }
      AMAuthInstallLog(3, "_AMAuthInstallApCreatePersonalizedResponseInternal", v59, v42, v43, v44, v45, v46, LocalizedStatusString);
      goto LABEL_30;
    }
    v30 = (_BYTE *)(a1 + 505);
    v28 = *(_QWORD *)(a1 + 16);
LABEL_19:
    *(_DWORD *)(v28 + 68) = 1;
    *(_DWORD *)(v28 + 112) = 384;
LABEL_20:
    SignedManifest = AMAuthInstallApImg4LocalCreateSignedManifest((_QWORD *)a1, theDict, 0, 0, 0, (CFTypeRef *)&value, v26, v27);
    if (!(_DWORD)SignedManifest)
    {
      if (value)
      {
        v37 = CFGetAllocator((CFTypeRef)a1);
        v38 = CFDictionaryCreateMutable(v37, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v13 = v38;
        if (v38)
        {
          CFDictionaryAddValue(v38, *(const void **)(a1 + 88), value);
          v14 = 0;
          *a3 = CFRetain(v13);
          goto LABEL_31;
        }
LABEL_46:
        v14 = 2;
        goto LABEL_31;
      }
      v58 = "ticketData is NULL";
      goto LABEL_45;
    }
    v14 = SignedManifest;
    if (*v30)
      v57 = "hacktivated";
    else
      v57 = "local";
    AMAuthInstallLog(3, "_AMAuthInstallApCreatePersonalizedResponseInternal", "failed to create a %s Img4 ticket", v32, v33, v34, v35, v36, (char)v57);
LABEL_30:
    v13 = 0;
  }
LABEL_31:
  SafeRelease(v13);
  SafeRelease(value);
  SafeRelease(v61);
  return v14;
}

uint64_t AMAuthInstallApImg3SupportsLocalSigning()
{
  return 0;
}

CFStringRef AMAuthInstallApImg4GetTypeForEntryName(CFStringRef theString1)
{
  uint64_t v2;
  __CFString *v3;

  v2 = 0;
  while (CFStringCompare(theString1, off_100050E28[v2], 0))
  {
    v2 += 2;
    if (v2 == 200)
    {
      v3 = 0;
      goto LABEL_6;
    }
  }
  v3 = off_100050E28[v2 + 1];
LABEL_6:
  if (v3)
    return v3;
  else
    return theString1;
}

BOOL AMAuthInstallApImg4SupportsLocalSigning(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 16);
    if (v1)
    {
      if (*(_BYTE *)(v1 + 76))
        return 1;
    }
  }
  return result;
}

BOOL AMAuthInstallApImg4SupportsGlobalSigning(uint64_t a1)
{
  return a1 && *(_QWORD *)(a1 + 40);
}

uint64_t AMAuthInstallApImg4GetTagAsInteger(CFStringRef theString)
{
  CFIndex i;
  unsigned int v4;

  v4 = 0;
  if (!theString)
    return 0xFFFFFFFFLL;
  for (i = 0; i != 4; ++i)
  {
    if (i == CFStringGetLength(theString))
      break;
    *((_BYTE *)&v4 + i) = CFStringGetCharacterAtIndex(theString, i);
  }
  return bswap32(v4);
}

uint64_t AMAuthInstallApImg4AddInteger32Property(uint64_t a1, const __CFString *a2, const __CFNumber *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int CString;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t TagAsInteger;
  uint64_t v30;
  const char *v32;
  char v33;
  unsigned int valuePtr;
  char buffer[256];

  v8 = 0;
  valuePtr = 0;
  if (!a1)
    goto LABEL_18;
  if (!a2)
    goto LABEL_18;
  if (!a3)
    goto LABEL_18;
  v8 = DEREncoderCreate(0);
  if (!v8)
    goto LABEL_18;
  CString = CFStringGetCString(a2, buffer, 256, 0x8000100u);
  if (CString)
  {
    v13 = strlen(buffer);
    if (DEREncoderAddData(v8, 0, 22, buffer, v13, 0))
    {
      v33 = (char)a2;
      v32 = "failed to add %@ string";
      goto LABEL_17;
    }
  }
  if (!CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger32Property", "%s: invalid datatype", v19, v20, v21, v22, v23, (char)"AMAuthInstallApImg4AddInteger32Property");
    if (CString)
    {
      v30 = 1;
      goto LABEL_11;
    }
LABEL_18:
    v30 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger32Property", "%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddInteger32Property");
    goto LABEL_11;
  }
  if (DEREncoderAddUInt32(v8, 0, 2, valuePtr))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger32Property", "failed to add %@ value", v24, v25, v26, v27, v28, (char)a2);
    goto LABEL_18;
  }
  TagAsInteger = AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder(v8, a1, TagAsInteger))
  {
    v32 = "failed to sequence tag";
LABEL_17:
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger32Property", v32, v14, v15, v16, v17, v18, v33);
    goto LABEL_18;
  }
  v30 = 0;
LABEL_11:
  DEREncoderDestroy(v8);
  return v30;
}

uint64_t AMAuthInstallApImg4AddInteger64Property(uint64_t a1, const __CFString *a2, const __CFNumber *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int CString;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t TagAsInteger;
  uint64_t v30;
  const char *v32;
  char v33;
  uint64_t valuePtr;
  char buffer[256];

  v8 = 0;
  valuePtr = 0;
  if (!a1)
    goto LABEL_18;
  if (!a2)
    goto LABEL_18;
  if (!a3)
    goto LABEL_18;
  v8 = DEREncoderCreate(0);
  if (!v8)
    goto LABEL_18;
  CString = CFStringGetCString(a2, buffer, 256, 0x8000100u);
  if (CString)
  {
    v13 = strlen(buffer);
    if (DEREncoderAddData(v8, 0, 22, buffer, v13, 0))
    {
      v33 = (char)a2;
      v32 = "failed to add %@ string";
      goto LABEL_17;
    }
  }
  if (!CFNumberGetValue(a3, kCFNumberSInt64Type, &valuePtr))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger64Property", "%s: invalid datatype", v19, v20, v21, v22, v23, (char)"AMAuthInstallApImg4AddInteger64Property");
    if (CString)
    {
      v30 = 1;
      goto LABEL_11;
    }
LABEL_18:
    v30 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger64Property", "%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddInteger64Property");
    goto LABEL_11;
  }
  if (DEREncoderAddUInt64(v8, 0, 2, valuePtr))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger64Property", "failed to add %@ value", v24, v25, v26, v27, v28, (char)a2);
    goto LABEL_18;
  }
  TagAsInteger = AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder(v8, a1, TagAsInteger))
  {
    v32 = "failed to sequence tag";
LABEL_17:
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddInteger64Property", v32, v14, v15, v16, v17, v18, v33);
    goto LABEL_18;
  }
  v30 = 0;
LABEL_11:
  DEREncoderDestroy(v8);
  return v30;
}

uint64_t AMAuthInstallApImg4AddBooleanProperty(uint64_t a1, const __CFString *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v9;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t TagAsInteger;
  uint64_t v24;
  const char *v26;
  char v27;
  char v28;
  char buffer[256];

  v8 = 0;
  if (a3)
    v9 = -1;
  else
    v9 = 0;
  v28 = v9;
  if (!a1)
    goto LABEL_17;
  if (!a2)
    goto LABEL_17;
  v8 = DEREncoderCreate(0);
  if (!v8)
    goto LABEL_17;
  if (CFStringGetCString(a2, buffer, 256, 0x8000100u))
  {
    v12 = strlen(buffer);
    if (DEREncoderAddData(v8, 0, 22, buffer, v12, 0))
    {
      v27 = (char)a2;
      v26 = "failed to add %@ string";
      goto LABEL_16;
    }
  }
  if (DEREncoderAddData(v8, 0, 1, &v28, 1, 0))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddBooleanProperty", "%s: failed to add data", v18, v19, v20, v21, v22, (char)"AMAuthInstallApImg4AddBooleanProperty");
LABEL_17:
    v24 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddBooleanProperty", "%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddBooleanProperty");
    goto LABEL_12;
  }
  TagAsInteger = AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder(v8, a1, TagAsInteger))
  {
    v26 = "failed to sequence tag";
LABEL_16:
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddBooleanProperty", v26, v13, v14, v15, v16, v17, v27);
    goto LABEL_17;
  }
  v24 = 0;
LABEL_12:
  DEREncoderDestroy(v8);
  return v24;
}

uint64_t AMAuthInstallApImg4AddDataProperty(uint64_t a1, const __CFString *a2, const __CFData *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t TagAsInteger;
  uint64_t v26;
  const char *v28;
  char v29;
  char buffer[256];

  v8 = 0;
  if (!a1)
    goto LABEL_15;
  if (!a2)
    goto LABEL_15;
  if (!a3)
    goto LABEL_15;
  v8 = DEREncoderCreate(0);
  if (!v8)
    goto LABEL_15;
  if (CFStringGetCString(a2, buffer, 256, 0x8000100u))
  {
    v12 = strlen(buffer);
    if (DEREncoderAddData(v8, 0, 22, buffer, v12, 0))
    {
      v29 = (char)a2;
      v28 = "failed to add %@ string";
      goto LABEL_14;
    }
  }
  BytePtr = CFDataGetBytePtr(a3);
  Length = CFDataGetLength(a3);
  if (DEREncoderAddData(v8, 0, 4, BytePtr, Length, 0))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddDataProperty", "failed to add %@ data", v20, v21, v22, v23, v24, (char)a2);
LABEL_15:
    v26 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddDataProperty", "%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddDataProperty");
    goto LABEL_10;
  }
  TagAsInteger = AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder(v8, a1, TagAsInteger))
  {
    v28 = "failed to sequence tag";
LABEL_14:
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddDataProperty", v28, v13, v14, v15, v16, v17, v29);
    goto LABEL_15;
  }
  v26 = 0;
LABEL_10:
  DEREncoderDestroy(v8);
  return v26;
}

uint64_t AMAuthInstallApImg4AddDictionaryProperty(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t TagAsInteger;
  uint64_t v19;
  const char *v21;
  char v22;
  char buffer[256];

  v8 = 0;
  if (!a1)
    goto LABEL_15;
  if (!a2)
    goto LABEL_15;
  if (!a3)
    goto LABEL_15;
  v8 = DEREncoderCreate(0);
  if (!v8)
    goto LABEL_15;
  if (CFStringGetCString(a3, buffer, 256, 0x8000100u))
  {
    v12 = strlen(buffer);
    if (DEREncoderAddData(v8, 0, 22, buffer, v12, 0))
    {
      v22 = (char)a3;
      v21 = "failed to add %@ string";
      goto LABEL_14;
    }
  }
  if (DEREncoderAddSetFromEncoder(a1, v8))
  {
    v21 = "failed to add set";
LABEL_14:
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddDictionaryProperty", v21, v13, v14, v15, v16, v17, v22);
LABEL_15:
    v19 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4AddDictionaryProperty", "%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddDictionaryProperty");
    goto LABEL_10;
  }
  TagAsInteger = AMAuthInstallApImg4GetTagAsInteger(a3);
  if (DEREncoderAddPrivateFromEncoder(v8, a2, TagAsInteger))
  {
    v21 = "failed to add private";
    goto LABEL_14;
  }
  v19 = 0;
LABEL_10:
  DEREncoderDestroy(v8);
  return v19;
}

uint64_t AMAuthInstallApImg4LocalCreateManifestBody(uint64_t a1, CFTypeRef a2, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFAllocator *v17;
  const __CFNumber *v18;
  const __CFNumber *Value;
  const __CFNumber *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  CFTypeID v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFNumber *v35;
  const __CFNumber *v36;
  CFTypeID v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  const __CFNumber *v49;
  const __CFNumber *v50;
  CFTypeID v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const __CFBoolean *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFBoolean *v64;
  CFTypeID v65;
  int v66;
  const __CFBoolean *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const __CFBoolean *v73;
  CFTypeID v74;
  int v75;
  const __CFData *v76;
  const __CFData *v77;
  CFTypeID v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const __CFData *v84;
  const __CFData *v85;
  CFTypeID v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const __CFData *v92;
  const __CFData *v93;
  CFTypeID v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const __CFBoolean *v100;
  const __CFBoolean *v101;
  CFTypeID v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const __CFData *v108;
  const __CFData *v109;
  CFTypeID v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const __CFData *v116;
  const __CFData *v117;
  CFTypeID v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const __CFData *v124;
  const __CFData *v125;
  CFTypeID v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const __CFBoolean *v132;
  const __CFBoolean *v133;
  CFTypeID v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const __CFAllocator *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const __CFAllocator *v159;
  CFDataRef v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v168;
  char v169;
  UInt8 *bytes;
  CFIndex length;

  LODWORD(length) = 0;
  bytes = 0;
  if (!a1 || !a2 || !a3)
  {
    v166 = 3;
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateManifestBody", "%s DER operation failed", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4LocalCreateManifestBody");
    v157 = 0;
    if (!a3)
    {
      v155 = 0;
      v141 = 0;
      v16 = 0;
      v18 = 0;
      goto LABEL_68;
    }
    v18 = 0;
    v16 = 0;
    v141 = 0;
    v155 = 0;
LABEL_90:
    SafeRelease(*a3);
    v166 = 3;
    goto LABEL_68;
  }
  AMAuthInstallDebugWriteObject((char *)a1, a2, (uint64_t)CFSTR("tss-request"), 2);
  v16 = DEREncoderCreate(1);
  if (!v16)
  {
    v18 = 0;
    goto LABEL_88;
  }
  v17 = CFGetAllocator((CFTypeRef)a1);
  v18 = CFNumberCreate(v17, kCFNumberIntType, (const void *)(*(_QWORD *)(a1 + 16) + 68));
  if (!v18)
    goto LABEL_88;
  if (AMAuthInstallApImg4AddInteger32Property(v16, CFSTR("CEPO"), v18, v11, v12, v13, v14, v15))
    goto LABEL_88;
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApChipID"));
  if (Value)
  {
    v20 = Value;
    v21 = CFGetTypeID(Value);
    if (v21 == CFNumberGetTypeID())
    {
      if (AMAuthInstallApImg4AddInteger32Property(v16, CFSTR("CHIP"), v20, v22, v23, v24, v25, v26))
        goto LABEL_88;
    }
  }
  v27 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApBoardID"));
  if (v27)
  {
    v28 = v27;
    v29 = CFGetTypeID(v27);
    if (v29 == CFNumberGetTypeID())
    {
      if (AMAuthInstallApImg4AddInteger32Property(v16, CFSTR("BORD"), v28, v30, v31, v32, v33, v34))
        goto LABEL_88;
    }
  }
  v35 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApECID"));
  if (v35)
  {
    v36 = v35;
    v37 = CFGetTypeID(v35);
    if (v37 == CFNumberGetTypeID())
    {
      if (!AMAuthInstallApImg4AddInteger64Property(v16, CFSTR("ECID"), v36, v38, v39, v40, v41, v42))
      {
        v48 = 1;
        goto LABEL_18;
      }
      AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateManifestBody", "failed to add ApEcid", v43, v44, v45, v46, v47, v169);
LABEL_88:
      v141 = 0;
      v155 = 0;
      v157 = 0;
      goto LABEL_89;
    }
  }
  v48 = 0;
LABEL_18:
  v49 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApSecurityDomain"));
  if (v49)
  {
    v50 = v49;
    v51 = CFGetTypeID(v49);
    if (v51 == CFNumberGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddInteger32Property(v16, CFSTR("SDOM"), v50, v52, v53, v54, v55, v56);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v58 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApProductionMode"));
  v66 = 0;
  if (v58)
  {
    v64 = v58;
    v65 = CFGetTypeID(v58);
    if (v65 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v64))
        v66 = 1;
    }
  }
  v57 = AMAuthInstallApImg4AddBooleanProperty(v16, CFSTR("CPRO"), v66, v59, v60, v61, v62, v63);
  if ((_DWORD)v57)
    goto LABEL_69;
  v67 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApSecurityMode"));
  v75 = 0;
  if (v67)
  {
    v73 = v67;
    v74 = CFGetTypeID(v67);
    if (v74 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v73))
        v75 = 1;
    }
  }
  v57 = AMAuthInstallApImg4AddBooleanProperty(v16, CFSTR("CSEC"), v75, v68, v69, v70, v71, v72);
  if ((_DWORD)v57)
    goto LABEL_69;
  v76 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApLocalNonceHash"));
  if (v76)
  {
    v77 = v76;
    v78 = CFGetTypeID(v76);
    if (v78 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("LNCH"), v77, v79, v80, v81, v82, v83);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v84 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApNonce"));
  if (v84)
  {
    v85 = v84;
    v86 = CFGetTypeID(v84);
    if (v86 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("BNCH"), v85, v87, v88, v89, v90, v91);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v92 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("SepNonce"));
  if (v92)
  {
    v93 = v92;
    v94 = CFGetTypeID(v92);
    if (v94 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("snon"), v93, v95, v96, v97, v98, v99);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v100 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ApAllowMixAndMatch"));
  if (v100)
  {
    v101 = v100;
    v102 = CFGetTypeID(v100);
    if (v102 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v101))
      {
        v57 = AMAuthInstallApImg4AddBooleanProperty(v16, CFSTR("AMNM"), 1, v103, v104, v105, v106, v107);
        if ((_DWORD)v57)
          goto LABEL_69;
      }
    }
  }
  v108 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Ap,NextStageIM4MHash"));
  if (v108)
  {
    v109 = v108;
    v110 = CFGetTypeID(v108);
    if (v110 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("nsih"), v109, v111, v112, v113, v114, v115);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v116 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Ap,RecoveryOSPolicyNonceHash"));
  if (v116)
  {
    v117 = v116;
    v118 = CFGetTypeID(v116);
    if (v118 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("ronh"), v117, v119, v120, v121, v122, v123);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v124 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Ap,VolumeUUID"));
  if (v124)
  {
    v125 = v124;
    v126 = CFGetTypeID(v124);
    if (v126 == CFDataGetTypeID())
    {
      v57 = AMAuthInstallApImg4AddDataProperty(v16, CFSTR("vuid"), v125, v127, v128, v129, v130, v131);
      if ((_DWORD)v57)
        goto LABEL_69;
    }
  }
  v132 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Ap,LocalBoot"));
  if (v132)
  {
    v133 = v132;
    v134 = CFGetTypeID(v132);
    if (v134 == CFBooleanGetTypeID())
    {
      v135 = CFBooleanGetValue(v133);
      v57 = AMAuthInstallApImg4AddBooleanProperty(v16, CFSTR("lobo"), v135, v136, v137, v138, v139, v140);
      if ((_DWORD)v57)
      {
LABEL_69:
        v166 = v57;
        v141 = 0;
LABEL_70:
        v155 = 0;
LABEL_82:
        v157 = 0;
        goto LABEL_83;
      }
    }
  }
  v141 = DEREncoderCreate(1);
  if (!v141)
  {
    v155 = 0;
    goto LABEL_76;
  }
  v142 = AMAuthInstallApImg4AddDictionaryProperty(v16, v141, CFSTR("MANP"), v11, v12, v13, v14, v15);
  if ((_DWORD)v142)
  {
    v166 = v142;
    goto LABEL_70;
  }
  v143 = CFGetAllocator((CFTypeRef)a1);
  v149 = AMAuthInstallApImg4LocalAddImages(v143, (CFDictionaryRef)a2, v141, v144, v145, v146, v147, v148);
  if ((_DWORD)v149)
  {
    v166 = v149;
    v155 = 0;
    v168 = "failed to add img objects to the manifest body";
LABEL_81:
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateManifestBody", v168, v150, v151, v152, v153, v154, v169);
    goto LABEL_82;
  }
  v155 = DEREncoderCreate(v149);
  if (!v155)
  {
LABEL_76:
    v157 = 0;
    goto LABEL_77;
  }
  v156 = AMAuthInstallApImg4AddDictionaryProperty(v141, v155, CFSTR("MANB"), v11, v12, v13, v14, v15);
  if ((_DWORD)v156)
  {
    v166 = v156;
    v168 = "failed to create the signed section";
    goto LABEL_81;
  }
  v157 = DEREncoderCreate(v156);
  if (!v157)
  {
LABEL_77:
    v166 = 2;
    goto LABEL_83;
  }
  v158 = DEREncoderAddSetFromEncoder(v155, v157);
  if ((_DWORD)v158)
  {
    v166 = v158;
LABEL_83:
    if ((v48 & 1) != 0)
      goto LABEL_68;
    goto LABEL_89;
  }
  if (DEREncoderCreateEncodedBuffer(v157, &bytes, &length))
  {
LABEL_89:
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateManifestBody", "%s DER operation failed", v11, v12, v13, v14, v15, (char)"AMAuthInstallApImg4LocalCreateManifestBody");
    goto LABEL_90;
  }
  v159 = CFGetAllocator((CFTypeRef)a1);
  v160 = CFDataCreate(v159, bytes, length);
  *a3 = v160;
  if (v160)
  {
    v166 = 0;
  }
  else
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateManifestBody", "failed to create manifest data", v161, v162, v163, v164, v165, v169);
    v166 = 2;
  }
LABEL_68:
  SafeFree(bytes);
  DEREncoderDestroy(v16);
  DEREncoderDestroy(v141);
  DEREncoderDestroy(v155);
  DEREncoderDestroy(v157);
  SafeRelease(v18);
  return v166;
}

uint64_t AMAuthInstallApImg4LocalAddImages(const __CFAllocator *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Count;
  const void **v12;
  const void **v13;
  const __CFArray *Mutable;
  uint64_t v15;
  const __CFString *v16;
  const void *v17;
  CFTypeID v18;
  CFTypeID v20;
  const __CFString *TypeForEntryName;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v35;
  char v36;
  CFRange v37;

  if (!theDict)
  {
    v35 = "requestDict cannot be NULL";
LABEL_23:
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImages", v35, a4, a5, a6, a7, a8, v36);
    v12 = 0;
    v13 = 0;
    Mutable = 0;
LABEL_24:
    v33 = 1;
    goto LABEL_18;
  }
  if (!a3)
  {
    v35 = "dstEncoder cannot be NULL";
    goto LABEL_23;
  }
  Count = CFDictionaryGetCount(theDict);
  v12 = (const void **)malloc(8 * Count);
  v13 = (const void **)malloc(8 * Count);
  CFDictionaryGetKeysAndValues(theDict, v12, v13);
  Mutable = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    v33 = 2;
    goto LABEL_18;
  }
  if (Count >= 1)
  {
    v15 = 0;
    do
    {
      v16 = (const __CFString *)v12[v15];
      if (!v16)
        goto LABEL_24;
      v17 = v13[v15];
      v18 = CFGetTypeID(v12[v15]);
      if (v18 != CFStringGetTypeID() || v17 == 0)
        goto LABEL_24;
      v20 = CFGetTypeID(v17);
      if (v20 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryGetValue((CFDictionaryRef)v17, CFSTR("Digest")))
        {
          v37.length = CFArrayGetCount(Mutable);
          v37.location = 0;
          if (CFArrayGetFirstIndexOfValue(Mutable, v37, v16) == -1)
          {
            CFArrayAppendValue(Mutable, v16);
            TypeForEntryName = AMAuthInstallApImg4GetTypeForEntryName(v16);
            if (!TypeForEntryName)
            {
              AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImages", "did not find a matching tag for requestTag %@", v22, v23, v24, v25, v26, (char)v16);
              goto LABEL_24;
            }
            v27 = AMAuthInstallApImg4LocalAddImageProperties((uint64_t)TypeForEntryName, a3, TypeForEntryName, (const __CFDictionary *)v17, v23, v24, v25, v26);
            if ((_DWORD)v27)
            {
              v33 = v27;
              AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImages", "failed to add %@ image to the ticket body", v28, v29, v30, v31, v32, (char)v16);
              goto LABEL_18;
            }
          }
        }
      }
    }
    while (Count != ++v15);
  }
  v33 = 0;
LABEL_18:
  SafeFree(v12);
  SafeFree(v13);
  SafeRelease(Mutable);
  return v33;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedTag(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFDataRef v26;
  UInt8 *bytes;
  unsigned int length;
  char length_4[256];

  length = 0;
  bytes = 0;
  if (!a1)
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedTag", "%s: tagStr is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
    goto LABEL_8;
  }
  v8 = (char)a1;
  if (!CFStringGetCString(a1, length_4, 256, 0x8000100u))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedTag", "%s: cannot convert tagStr", v9, v10, v11, v12, v13, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v14 = DEREncoderCreate(0);
  if (!v14)
  {
LABEL_9:
    SafeRelease(0);
    v26 = 0;
    goto LABEL_10;
  }
  v15 = strlen(length_4);
  if (DEREncoderAddData(v14, 0, 22, length_4, v15, 0))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedTag", "failed to add %@ string", v16, v17, v18, v19, v20, v8);
    goto LABEL_9;
  }
  if (DEREncoderCreateEncodedBuffer(v14, &bytes, &length))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedTag", "%s: failed to create buffer", v21, v22, v23, v24, v25, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
    goto LABEL_9;
  }
  v26 = CFDataCreate(0, bytes, length);
LABEL_10:
  SafeFree(bytes);
  DEREncoderDestroy(v14);
  return v26;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedVersion(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFDataRef v9;
  const char *v11;
  const char *v12;
  UInt8 *bytes;
  unsigned int v14;

  v14 = 0;
  bytes = 0;
  v2 = DEREncoderCreate(0);
  v3 = v2;
  if (!v2)
    goto LABEL_9;
  if (DEREncoderAddUInt32(v2, 0, 2, a1))
  {
    v11 = "failed to add manifest version";
LABEL_8:
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedVersion", v11, v4, v5, v6, v7, v8, (char)v12);
LABEL_9:
    SafeRelease(0);
    v9 = 0;
    goto LABEL_5;
  }
  if (DEREncoderCreateEncodedBuffer(v3, &bytes, &v14))
  {
    v12 = "AMAuthInstallApImg4LocalCreateEncodedVersion";
    v11 = "%s: failed to create buffer";
    goto LABEL_8;
  }
  v9 = CFDataCreate(0, bytes, v14);
LABEL_5:
  SafeFree(bytes);
  DEREncoderDestroy(v3);
  return v9;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedData(const __CFData *a1)
{
  uint64_t v2;
  const UInt8 *BytePtr;
  CFIndex v4;
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
  CFDataRef v15;
  UInt8 *bytes;
  CFIndex length;

  LODWORD(length) = 0;
  bytes = 0;
  v2 = DEREncoderCreate(0);
  if (!v2)
    goto LABEL_8;
  BytePtr = CFDataGetBytePtr(a1);
  v4 = CFDataGetLength(a1);
  if (DEREncoderAddData(v2, 0, 4, BytePtr, v4, 0))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedData", "%s: failed to encode data", v5, v6, v7, v8, v9, (char)"AMAuthInstallApImg4LocalCreateEncodedData");
LABEL_8:
    SafeRelease(0);
    v15 = 0;
    goto LABEL_5;
  }
  if (DEREncoderCreateEncodedBuffer(v2, &bytes, &length))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedData", "%s: failed to create buffer", v10, v11, v12, v13, v14, (char)"AMAuthInstallApImg4LocalCreateEncodedData");
    goto LABEL_8;
  }
  v15 = CFDataCreate(0, bytes, length);
LABEL_5:
  SafeFree(bytes);
  DEREncoderDestroy(v2);
  return v15;
}

uint64_t _AMAuthInstallApImg4LocalCreateSignedManifest(_QWORD *a1, const void *a2, const void *a3, const void *a4, const void *a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  int v10;
  const __CFAllocator *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFData *Mutable;
  const __CFData *EncodedTag;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFData *v30;
  const UInt8 *BytePtr;
  CFIndex v32;
  const __CFData *EncodedVersion;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFData *v39;
  const UInt8 *v40;
  CFIndex v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFData *v47;
  uint64_t v48;
  const UInt8 *v49;
  CFIndex v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const __CFData *v58;
  const char *v59;
  CFTypeRef v60;
  const __CFData *EncodedData;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const UInt8 *v67;
  CFIndex v68;
  const __CFData *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const UInt8 *v75;
  CFIndex v76;
  uint64_t v77;
  const UInt8 *v78;
  CFIndex v79;
  const __CFAllocator *v80;
  CFDataRef v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v88;
  const char *v89;
  int v90;
  UInt8 *bytes;
  CFDataRef v93;
  CFTypeRef v94;
  CFDataRef theData;
  CFIndex length;

  LODWORD(length) = 0;
  v94 = 0;
  theData = 0;
  bytes = 0;
  v93 = 0;
  if (!a1 || !a2 || !a6)
  {
    v48 = 3;
    AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "%s failed to create DER file", (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    v77 = 0;
    v58 = 0;
    v39 = 0;
    v30 = 0;
    Mutable = 0;
    if (!a6)
      goto LABEL_26;
    goto LABEL_44;
  }
  v10 = a7;
  v15 = CFGetAllocator(a1);
  Mutable = CFDataCreateMutable(v15, 0);
  if (!Mutable)
  {
    v30 = 0;
LABEL_49:
    v39 = 0;
    goto LABEL_41;
  }
  EncodedTag = AMAuthInstallApImg4LocalCreateEncodedTag(CFSTR("IM4M"), v16, v17, v18, v19, v20, v21, v22);
  v30 = EncodedTag;
  if (!EncodedTag)
  {
    AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "%s failed to encode tag", v25, v26, v27, v28, v29, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    goto LABEL_49;
  }
  BytePtr = CFDataGetBytePtr(EncodedTag);
  v32 = CFDataGetLength(v30);
  CFDataAppendBytes(Mutable, BytePtr, v32);
  EncodedVersion = AMAuthInstallApImg4LocalCreateEncodedVersion(0);
  v39 = EncodedVersion;
  if (!EncodedVersion)
  {
    AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "%s failed to encode version", v34, v35, v36, v37, v38, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    goto LABEL_41;
  }
  v40 = CFDataGetBytePtr(EncodedVersion);
  v41 = CFDataGetLength(v39);
  CFDataAppendBytes(Mutable, v40, v41);
  if (a3)
  {
    v47 = (const __CFData *)CFRetain(a3);
    theData = v47;
    v48 = 99;
    if (v47)
      goto LABEL_9;
LABEL_13:
    v59 = "manifest not found";
LABEL_40:
    AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", v59, v18, v19, v20, v21, v22, v90);
    goto LABEL_41;
  }
  if (AMAuthInstallApImg4LocalCreateManifestBody((uint64_t)a1, a2, (CFTypeRef *)&theData, v42, v43, v44, v45, v46))
  {
    v59 = "failed to create unsigned manifest";
    goto LABEL_40;
  }
  v48 = 0;
  v47 = theData;
  if (!theData)
    goto LABEL_13;
LABEL_9:
  v49 = CFDataGetBytePtr(v47);
  v50 = CFDataGetLength(theData);
  CFDataAppendBytes(Mutable, v49, v50);
  if (!v10)
  {
    if (!AMAuthInstallApImg4LocalRegisterKeys((uint64_t)a1, v51, v52, v53, v54, v55, v56, v57))
    {
      if (a4)
      {
        v60 = CFRetain(a4);
        v94 = v60;
        if (v60)
        {
          EncodedData = AMAuthInstallApImg4LocalCreateEncodedData((const __CFData *)v60);
          v58 = EncodedData;
          if (EncodedData)
          {
            v67 = CFDataGetBytePtr(EncodedData);
            v68 = CFDataGetLength(v58);
            CFDataAppendBytes(Mutable, v67, v68);
            if (a5)
            {
              v69 = (const __CFData *)CFRetain(a5);
              v93 = v69;
              if (v69)
              {
LABEL_20:
                v75 = CFDataGetBytePtr(v69);
                v76 = CFDataGetLength(v93);
                CFDataAppendBytes(Mutable, v75, v76);
                v48 = 0;
                goto LABEL_21;
              }
            }
            else
            {
              if (AMAuthInstallApImg4LocalCreateEncodedCertificateChain((uint64_t)a1, (CFTypeRef *)&v93))
              {
                v89 = "failed to add certificate";
                goto LABEL_54;
              }
              v69 = v93;
              if (v93)
                goto LABEL_20;
            }
            v89 = "certificate not found";
LABEL_54:
            AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", v89, v70, v71, v72, v73, v74, v90);
            goto LABEL_42;
          }
          AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "%s failed to encode signature", v62, v63, v64, v65, v66, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
LABEL_42:
          v77 = 0;
LABEL_43:
          AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "%s failed to create DER file", v18, v19, v20, v21, v22, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
LABEL_44:
          SafeRelease(*a6);
          *a6 = 0;
          v48 = 3;
          goto LABEL_26;
        }
        goto LABEL_38;
      }
      v88 = *(_DWORD *)(a1[2] + 112);
      if (v88 == 384)
      {
        CFDataGetBytePtr(theData);
        CFDataGetLength(theData);
        if (AMAuthInstallCryptoCreateRsaSignature_SHA384())
          goto LABEL_41;
        goto LABEL_38;
      }
      if (v88 != 256)
      {
        if (v88 != 1)
        {
          v90 = *(_DWORD *)(a1[2] + 112);
          v59 = "Unsupported digest type: %d";
          goto LABEL_40;
        }
        CFDataGetBytePtr(theData);
        CFDataGetLength(theData);
        if (AMAuthInstallCryptoCreateRsaSignature())
          goto LABEL_41;
        goto LABEL_38;
      }
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
      if (!AMAuthInstallCryptoCreateRsaSignature_SHA256())
      {
LABEL_38:
        v59 = "signature not found";
        goto LABEL_40;
      }
    }
LABEL_41:
    v58 = 0;
    goto LABEL_42;
  }
  v58 = 0;
LABEL_21:
  v77 = DEREncoderCreate(0);
  if (!v77)
    goto LABEL_43;
  v78 = CFDataGetBytePtr(Mutable);
  v79 = CFDataGetLength(Mutable);
  if (DEREncoderAddData(v77, 0, 16, v78, v79, 1)
    || DEREncoderCreateEncodedBuffer(v77, &bytes, &length))
  {
    goto LABEL_43;
  }
  v80 = CFGetAllocator(a1);
  v81 = CFDataCreate(v80, bytes, length);
  *a6 = v81;
  if (!v81)
  {
    AMAuthInstallLog(3, "_AMAuthInstallApImg4LocalCreateSignedManifest", "failed to create manifest data", v82, v83, v84, v85, v86, v90);
    v48 = 2;
  }
LABEL_26:
  SafeRelease(Mutable);
  SafeRelease(v30);
  SafeRelease(v39);
  SafeRelease(theData);
  SafeRelease(v94);
  SafeRelease(v58);
  SafeRelease(v93);
  SafeFree(bytes);
  DEREncoderDestroy(v77);
  return v48;
}

uint64_t AMAuthInstallApImg4LocalRegisterKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t result;
  int v10;
  const __CFString *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  int v28;

  if (!a1)
    return 1;
  v8 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v8 + 20))
  {
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalRegisterKeys", "local signing is not available for production fused devices.", a4, a5, a6, a7, a8, v26);
    return 14;
  }
  if (!*(_QWORD *)(a1 + 392))
  {
    if (*(_BYTE *)(v8 + 72) || *(_DWORD *)(v8 + 16))
    {
      if (*(_BYTE *)(v8 + 73))
      {
        v10 = *(_DWORD *)(v8 + 8);
        if (v10 == 32784)
        {
          v11 = CFSTR("ap.ticket.insec.rsa4k.key.private");
        }
        else
        {
          if (v10 != 35168)
          {
            AMAuthInstallLog(3, "AMAuthInstallApImg4LocalRegisterKeys", "unrecognized chipid: 0x%08X", a4, a5, a6, a7, a8, v10);
            return 1;
          }
          v11 = CFSTR("ap.ticket.insec.rsa1k.key.private");
        }
      }
      else
      {
        v11 = CFSTR("ap.ticket.dev.key.private");
        if (*(_BYTE *)(a1 + 505))
          v11 = CFSTR("ap.ticket.localpolicy.hacktivation.key.private");
      }
    }
    else
    {
      v11 = CFSTR("ap.ticket.unfused.key.private");
    }
    *(_QWORD *)(a1 + 392) = v11;
  }
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 376), CFSTR("ap.ticket.dev.key.private")))
    return 0;
  v28 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  v27 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  v12 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v13 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v14 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v15 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  v16 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v17 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  v18 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v19 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  v20 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  result = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  if ((!v28 || !v27 || !v15 || !v17 || !(_DWORD)result) && (!v12 || !v13 || !v14 || !v16 || !v18 || !v19 || !v20))
  {
    AMAuthInstallLog(6, "AMAuthInstallApImg4LocalRegisterKeys", "ap local signing keys available", v21, v22, v23, v24, v25, v26);
    return 0;
  }
  return result;
}

uint64_t AMAuthInstallApImg4LocalCreateEncodedCertificateChain(uint64_t a1, CFTypeRef *a2)
{
  const __CFAllocator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFData *Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t CertData;
  const UInt8 *v17;
  CFIndex v18;
  const UInt8 *v19;
  CFIndex v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  int v28;
  const UInt8 *BytePtr;
  CFIndex v30;
  char v31;
  UInt8 *bytes;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  bytes = 0;
  if (!a1 || !a2)
  {
    v12 = 0;
    Mutable = 0;
    v13 = 1;
    if (!a2)
      goto LABEL_18;
    goto LABEL_6;
  }
  v4 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFDataCreateMutable(v4, 0);
  if (!Mutable)
  {
    v12 = 0;
    v13 = 2;
    goto LABEL_6;
  }
  v11 = *(_QWORD *)(a1 + 16);
  if (!*(_BYTE *)(v11 + 20))
  {
    if (!*(_QWORD *)(a1 + 400))
    {
      if (*(_BYTE *)(a1 + 505))
      {
        v14 = CFSTR("ap.ticket.localpolicy.hacktivation.leaf.cert");
      }
      else if (*(_BYTE *)(v11 + 72) || *(_DWORD *)(v11 + 16))
      {
        if (*(_BYTE *)(v11 + 73))
        {
          v27 = *(_DWORD *)(v11 + 8);
          switch(v27)
          {
            case 32770:
              v14 = CFSTR("ap.ticket.8002.insec.cert");
              break;
            case 35168:
              if (!*(_QWORD *)(a1 + 408))
                *(_QWORD *)(a1 + 408) = CFSTR("ap.ticket.ca.cert");
              CertData = AMAuthInstallCryptoGetCertData();
              if ((_DWORD)CertData)
                goto LABEL_45;
              BytePtr = CFDataGetBytePtr(*(CFDataRef *)&length[1]);
              v30 = CFDataGetLength(*(CFDataRef *)&length[1]);
              CFDataAppendBytes(Mutable, BytePtr, v30);
              v14 = CFSTR("ap.ticket.8960.insec.cert");
              break;
            case 32784:
              v14 = CFSTR("ap.ticket.8010.insec.cert");
              break;
            default:
              AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedCertificateChain", "unrecognized chipid: 0x%08X", v5, v6, v7, v8, v9, v27);
              goto LABEL_38;
          }
        }
        else
        {
          v14 = CFSTR("ap.ticket.8960.dev.cert");
        }
      }
      else
      {
        v14 = CFSTR("ap.ticket.8960.unfused.cert");
      }
      *(_QWORD *)(a1 + 400) = v14;
    }
    if (!*(_BYTE *)(a1 + 505))
    {
      v15 = *(_QWORD *)(a1 + 16);
      if (!*(_BYTE *)(v15 + 77))
      {
        v28 = *(_DWORD *)(v15 + 8);
        if (v28 != 32770 && v28 != 35168 && v28 != 32784)
        {
          AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedCertificateChain", "chipid: 0x%08X unsupported for img4 local signing", v5, v6, v7, v8, v9, v28);
LABEL_38:
          v12 = 0;
          v13 = 1;
          goto LABEL_6;
        }
      }
    }
    CertData = AMAuthInstallCryptoGetCertData();
    if (!(_DWORD)CertData)
    {
      v17 = CFDataGetBytePtr(*(CFDataRef *)&length[1]);
      v18 = CFDataGetLength(*(CFDataRef *)&length[1]);
      CFDataAppendBytes(Mutable, v17, v18);
      v12 = DEREncoderCreate(0);
      if (v12)
      {
        v19 = CFDataGetBytePtr(Mutable);
        v20 = CFDataGetLength(Mutable);
        if (DEREncoderAddData(v12, 0, 16, v19, v20, 1))
        {
          v13 = 3;
          goto LABEL_6;
        }
        if (!DEREncoderCreateEncodedBuffer(v12, &bytes, length))
        {
          v13 = 0;
          *a2 = CFDataCreate(0, bytes, length[0]);
          goto LABEL_18;
        }
        AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedCertificateChain", "%s: failed to create buffer", v21, v22, v23, v24, v25, (char)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain");
      }
      v13 = 0;
      goto LABEL_18;
    }
LABEL_45:
    v13 = CertData;
    v12 = 0;
    goto LABEL_6;
  }
  AMAuthInstallLog(3, "AMAuthInstallApImg4LocalCreateEncodedCertificateChain", "local signing is not available for production fused devices.", v5, v6, v7, v8, v9, v31);
  v12 = 0;
  v13 = 14;
LABEL_6:
  SafeRelease(*a2);
LABEL_18:
  SafeRelease(Mutable);
  SafeFree(bytes);
  DEREncoderDestroy(v12);
  return v13;
}

uint64_t AMAuthInstallApImg4LocalCreateSignedManifest(_QWORD *a1, const void *a2, const void *a3, const void *a4, const void *a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  return _AMAuthInstallApImg4LocalCreateSignedManifest(a1, a2, a3, a4, a5, a6, 0, a8);
}

uint64_t AMAuthInstallApImg4LocalAddImageProperties(uint64_t a1, uint64_t a2, const __CFString *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  const __CFData *Value;
  const __CFData *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFBoolean *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFBoolean *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFBoolean *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const __CFBoolean *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const __CFBoolean *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFData *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v104;
  char v105;

  if (!a2)
  {
    v104 = "toEncoder cannot be NULL";
LABEL_28:
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", v104, (uint64_t)a4, a5, a6, a7, a8, v105);
    v11 = 0;
    v25 = 1;
    goto LABEL_24;
  }
  if (!a3)
  {
    v104 = "imageTag cannot be NULL";
    goto LABEL_28;
  }
  if (!a4)
  {
    v104 = "requestDict cannot be NULL";
    goto LABEL_28;
  }
  v11 = DEREncoderCreate(1);
  if (!v11)
  {
    v25 = 2;
    goto LABEL_24;
  }
  Value = (const __CFData *)CFDictionaryGetValue(a4, CFSTR("Digest"));
  if (Value)
  {
    v13 = Value;
    if (CFDataGetLength(Value) < 1)
    {
      AMAuthInstallLog(6, "AMAuthInstallApImg4LocalAddImageProperties", "'%@' has zero length digest - skipping digest", v14, v15, v16, v17, v18, (char)a3);
    }
    else
    {
      v19 = AMAuthInstallApImg4AddDataProperty(v11, CFSTR("DGST"), v13, v14, v15, v16, v17, v18);
      if ((_DWORD)v19)
      {
        v25 = v19;
        AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add Digest property for '%@'", v20, v21, v22, v23, v24, (char)a3);
        goto LABEL_24;
      }
    }
  }
  v26 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("Trusted"));
  if (v26
    && (v27 = CFBooleanGetValue(v26),
        v33 = AMAuthInstallApImg4AddBooleanProperty(v11, CFSTR("EKEY"), v27, v28, v29, v30, v31, v32),
        (_DWORD)v33))
  {
    v25 = v33;
    AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add EKEY property for '%@'", v34, v35, v36, v37, v38, (char)a3);
  }
  else
  {
    v39 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("DPRO"));
    if (v39
      && (v40 = CFBooleanGetValue(v39),
          v46 = AMAuthInstallApImg4AddBooleanProperty(v11, CFSTR("DPRO"), v40, v41, v42, v43, v44, v45),
          (_DWORD)v46))
    {
      v25 = v46;
      AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add DPRO property for '%@'", v47, v48, v49, v50, v51, (char)a3);
    }
    else
    {
      v52 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("DSEC"));
      if (v52
        && (v53 = CFBooleanGetValue(v52),
            v59 = AMAuthInstallApImg4AddBooleanProperty(v11, CFSTR("DSEC"), v53, v54, v55, v56, v57, v58),
            (_DWORD)v59))
      {
        v25 = v59;
        AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add DSEC property for '%@'", v60, v61, v62, v63, v64, (char)a3);
      }
      else
      {
        v65 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("ESEC"));
        if (v65
          && (v66 = CFBooleanGetValue(v65),
              v72 = AMAuthInstallApImg4AddBooleanProperty(v11, CFSTR("ESEC"), v66, v67, v68, v69, v70, v71),
              (_DWORD)v72))
        {
          v25 = v72;
          AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add ESEC property for '%@'", v73, v74, v75, v76, v77, (char)a3);
        }
        else
        {
          v78 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("EPRO"));
          if (v78
            && (v79 = CFBooleanGetValue(v78),
                v85 = AMAuthInstallApImg4AddBooleanProperty(v11, CFSTR("EPRO"), v79, v80, v81, v82, v83, v84),
                (_DWORD)v85))
          {
            v25 = v85;
            AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add EPRO property for '%@'", v86, v87, v88, v89, v90, (char)a3);
          }
          else
          {
            v91 = (const __CFData *)CFDictionaryGetValue(a4, CFSTR("TBMDigests"));
            if (v91
              && (v97 = AMAuthInstallApImg4AddDataProperty(v11, CFSTR("tbms"), v91, v92, v93, v94, v95, v96), (_DWORD)v97))
            {
              v25 = v97;
              AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "failed to add %@ property for '%@'", v92, v93, v94, v95, v96, (char)CFSTR("tbms"));
            }
            else
            {
              v25 = AMAuthInstallApImg4AddDictionaryProperty(v11, a2, a3, v92, v93, v94, v95, v96);
              if ((_DWORD)v25)
                AMAuthInstallLog(3, "AMAuthInstallApImg4LocalAddImageProperties", "AMAuthInstallApImg4LocalAddDictionaryProperty failed for '%@'", v98, v99, v100, v101, v102, (char)a3);
            }
          }
        }
      }
    }
  }
LABEL_24:
  DEREncoderDestroy(v11);
  return v25;
}

void _AMAuthInstallBasebandParametersFinalize(CFTypeRef *a1)
{
  if (a1)
  {
    SafeRelease(a1[2]);
    SafeRelease(a1[3]);
    SafeRelease(a1[4]);
    SafeRelease(a1[5]);
    SafeRelease(a1[8]);
    SafeRelease(a1[9]);
    SafeRelease(a1[13]);
    SafeRelease(a1[14]);
    SafeRelease(a1[15]);
    SafeRelease(a1[16]);
    SafeRelease(a1[17]);
    SafeRelease(a1[18]);
    SafeRelease(a1[19]);
    SafeRelease(a1[21]);
    free(a1);
  }
}

__CFString *AMAuthInstallBasebandCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  const char *v4;
  const __CFAllocator *v5;
  const char *v6;
  const char *v7;
  const __CFAllocator *v8;
  const char *v9;
  const char *v10;

  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 256);
  CFStringAppend(Mutable, CFSTR("("));
  if (*(_BYTE *)(a1 + 58))
    v4 = "YES";
  else
    v4 = "NO";
  CFStringAppendFormat(Mutable, 0, CFSTR("personalize=%s"), v4);
  if (*(_QWORD *)(a1 + 48))
  {
    CFStringAppendFormat(Mutable, 0, CFSTR(", "));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16))
    {
      v5 = CFGetAllocator((CFTypeRef)a1);
      v6 = _CopyHexStringFromData(v5, *(CFDataRef *)(*(_QWORD *)(a1 + 48) + 16));
      if (v6)
      {
        v7 = v6;
        CFStringAppendFormat(Mutable, 0, CFSTR("snum=0x%@, "), v6);
        CFRelease(v7);
      }
    }
    CFStringAppendFormat(Mutable, 0, CFSTR("chipid=0x%x, certid=0x%x"), *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4), *(unsigned int *)(*(_QWORD *)(a1 + 48) + 8));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24))
    {
      v8 = CFGetAllocator((CFTypeRef)a1);
      v9 = _CopyHexStringFromData(v8, *(CFDataRef *)(*(_QWORD *)(a1 + 48) + 24));
      if (v9)
      {
        v10 = v9;
        CFStringAppendFormat(Mutable, 0, CFSTR(", nonce=0x%@"), v9);
        CFRelease(v10);
      }
    }
  }
  CFStringAppend(Mutable, CFSTR(")"));
  return Mutable;
}

uint64_t AMAuthInstallBasebandLocalSetSigningParameters(void *cf, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6)
{
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char LocalizedStatusString;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  if (cf)
  {
    if (a2 && a3 && a4 || (v12 = 1, !a2) && !a3 && !a4 && !a5 && !a6)
    {
      v13 = (_QWORD *)*((_QWORD *)cf + 46);
      if (v13)
      {
        AMAuthInstallReleaseRsaKeyData(*v13);
        SafeRelease(*(CFTypeRef *)(*((_QWORD *)cf + 46) + 8));
        SafeRelease(*(CFTypeRef *)(*((_QWORD *)cf + 46) + 16));
        SafeRelease(*(CFTypeRef *)(*((_QWORD *)cf + 46) + 24));
        SafeRelease(*(CFTypeRef *)(*((_QWORD *)cf + 46) + 32));
        free(*((void **)cf + 46));
        *((_QWORD *)cf + 46) = 0;
      }
      if (a2)
      {
        CFGetAllocator(cf);
        v14 = AMAuthInstallCopyRsaKeyDataForKey();
        if ((_DWORD)v14)
        {
          v12 = v14;
          LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)cf, v14);
          AMAuthInstallLog(3, "AMAuthInstallBasebandLocalSetSigningParameters", "bad local signing key: %@", v16, v17, v18, v19, v20, LocalizedStatusString);
        }
        else
        {
          v21 = calloc(1uLL, 0x28uLL);
          *((_QWORD *)cf + 46) = v21;
          if (v21)
          {
            **((_QWORD **)cf + 46) = CFRetain(0);
            *(_QWORD *)(*((_QWORD *)cf + 46) + 8) = CFRetain(a3);
            *(_QWORD *)(*((_QWORD *)cf + 46) + 16) = CFRetain(a4);
            *(_QWORD *)(*((_QWORD *)cf + 46) + 32) = CFRetain(a6);
            v12 = 0;
            *(_QWORD *)(*((_QWORD *)cf + 46) + 24) = SafeRetain(a5);
          }
          else
          {
            v12 = 2;
          }
        }
      }
      else
      {
        v12 = 0;
      }
    }
  }
  else
  {
    v12 = 1;
  }
  SafeRelease(0);
  SafeRelease(0);
  return v12;
}

void AMAuthInstallBasebandFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;

  if (*(_QWORD *)(a1 + 176))
  {
    AMAuthInstallLog(3, "AMAuthInstallBasebandFinalize", "*********************************", a4, a5, a6, a7, a8, v19);
    AMAuthInstallLog(3, "AMAuthInstallBasebandFinalize", "* unacknowledged fusing program *", v9, v10, v11, v12, v13, v20);
    AMAuthInstallLog(3, "AMAuthInstallBasebandFinalize", "*********************************", v14, v15, v16, v17, v18, v21);
  }
  _AMAuthInstallBasebandParametersFinalize(*(CFTypeRef **)(a1 + 48));
  AMAuthInstallBasebandLocalSetSigningParameters((void *)a1, 0, 0, 0, 0, 0);
  SafeRelease(*(CFTypeRef *)(a1 + 160));
  SafeRelease(*(CFTypeRef *)(a1 + 168));
  SafeRelease(*(CFTypeRef *)(a1 + 176));
  SafeRelease(*(CFTypeRef *)(a1 + 192));
  SafeRelease(*(CFTypeRef *)(a1 + 200));
  SafeRelease(*(CFTypeRef *)(a1 + 208));
  SafeRelease(*(CFTypeRef *)(a1 + 216));
  SafeRelease(*(CFTypeRef *)(a1 + 136));
  SafeRelease(*(CFTypeRef *)(a1 + 240));
  SafeRelease(*(CFTypeRef *)(a1 + 264));
  SafeRelease(*(CFTypeRef *)(a1 + 248));
  SafeRelease(*(CFTypeRef *)(a1 + 232));
  SafeRelease(*(CFTypeRef *)(a1 + 272));
  SafeRelease(*(CFTypeRef *)(a1 + 280));
}

void AMAuthInstallBundleFinalize(uint64_t a1)
{
  CFTypeRef *v1;

  v1 = *(CFTypeRef **)(a1 + 128);
  if (v1)
  {
    SafeRelease(*v1);
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 128) + 8));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 128) + 16));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 128) + 24));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 128) + 32));
    SafeRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 128) + 40));
    SafeFree(*(void **)(a1 + 128));
    *(_QWORD *)(a1 + 128) = 0;
  }
}

uint64_t AMAuthInstallCopyRsaKeyDataForKey()
{
  return 13;
}

uint64_t AMAuthInstallCryptoRegisterKeysFromPEMBuffer()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature_SHA256()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature_SHA384()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateDigestForData(const __CFAllocator *a1, const __CFData *a2, CFTypeRef *a3)
{
  __CFData *Mutable;
  __CFData *v6;
  const UInt8 *BytePtr;
  CC_LONG Length;
  unsigned __int8 *MutableBytePtr;
  uint64_t v10;
  CC_SHA1_CTX v12;

  memset(&v12, 0, sizeof(v12));
  Mutable = CFDataCreateMutable(a1, 20);
  v6 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, 20);
    CC_SHA1_Init(&v12);
    BytePtr = CFDataGetBytePtr(a2);
    Length = CFDataGetLength(a2);
    CC_SHA1_Update(&v12, BytePtr, Length);
    MutableBytePtr = CFDataGetMutableBytePtr(v6);
    CC_SHA1_Final(MutableBytePtr, &v12);
    v10 = 0;
    *a3 = CFRetain(v6);
  }
  else
  {
    v10 = 2;
  }
  SafeRelease(v6);
  return v10;
}

uint64_t AMAuthInstallCryptoGetCertData()
{
  return 13;
}

uint64_t AMAuthInstallCryptoRegisterCertFromPEMBuffer()
{
  return 13;
}

uint64_t AMAuthInstallHttpMessageSendSyncNew(CFAllocatorRef allocator, uint64_t a2, CFTypeRef *a3, _DWORD *a4, CFDictionaryRef theDict, double a6)
{
  CFIndex Count;
  const __CFDictionary *MutableCopy;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFNumberRef v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  uint64_t v38;
  CFTypeRef cf;
  double valuePtr;

  valuePtr = a6;
  v38 = 0;
  cf = 0;
  v37 = -1;
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, theDict);
    if (CFDictionaryContainsKey(MutableCopy, kAMSupportHttpOptionSocksProxySettings))
      AMAuthInstallLog(7, "AMAuthInstallHttpMessageSendSyncNew", "Options dictionary contains proxy information. Will attempt to use a proxy.", v13, v14, v15, v16, v17, v36);
    if (CFDictionaryContainsKey(MutableCopy, kAMSupportHttpOptionTrustedServerCAs))
      AMAuthInstallLog(7, "AMAuthInstallHttpMessageSendSyncNew", "Options dictionary contains trusted server CAs. Will authenticate SSL against CAs.", v18, v19, v20, v21, v22, v36);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(allocator, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  if (!MutableCopy)
  {
    AMAuthInstallLog(3, "AMAuthInstallHttpMessageSendSyncNew", "CFDictionaryCreateMutable failed to allocate", v18, v19, v20, v21, v22, v36);
    v28 = 0;
LABEL_18:
    v34 = 2;
    goto LABEL_15;
  }
  v28 = CFNumberCreate(allocator, kCFNumberDoubleType, &valuePtr);
  if (!v28)
  {
    AMAuthInstallLog(3, "AMAuthInstallHttpMessageSendSyncNew", "timeout failed to allocate", v23, v24, v25, v26, v27, v36);
    goto LABEL_18;
  }
  CFDictionarySetValue(MutableCopy, kAMSupportHttpOptionTimeout, v28);
  AMSupportHttpSendSync(a2, MutableCopy, &cf, 0, &v37, &v38);
  if (v38)
  {
    AMAuthInstallLog(3, "AMAuthInstallHttpMessageSendSyncNew", "HTTP request failed with error %@", v29, v30, v31, v32, v33, v38);
LABEL_21:
    v34 = 16;
    goto LABEL_15;
  }
  if (!cf)
  {
    AMAuthInstallLog(3, "AMAuthInstallHttpMessageSendSyncNew", "HTTP request provided no response data", v29, v30, v31, v32, v33, v36);
    goto LABEL_21;
  }
  if (a3)
    *a3 = CFRetain(cf);
  v34 = 0;
  if (a4)
    *a4 = v37;
LABEL_15:
  AMSupportSafeRelease(cf);
  AMSupportSafeRelease(MutableCopy);
  AMSupportSafeRelease(v28);
  return v34;
}

uint64_t AMAuthInstallLockCreate(uint64_t a1)
{
  uint64_t result;

  pthread_once(&stru_100066258, (void (*)(void))sub_1000170C8);
  result = _CFRuntimeCreateInstance(a1, qword_100066890, 8, 0);
  if (result)
    *(_DWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_1000170C8()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_100051468);
  qword_100066890 = result;
  return result;
}

void (*AMAuthInstallLogSetHandler(void (*result)(int a1, uint64_t a2)))(int a1, uint64_t a2)
{
  void (*v1)(int, uint64_t);

  v1 = sub_10001710C;
  if (result)
    v1 = result;
  off_100066268 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

void sub_10001710C(int a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;

  if (qword_1000668A0 != -1)
    dispatch_once(&qword_1000668A0, &stru_1000514E8);
  if (a1 <= 2)
  {
    if (os_log_type_enabled((os_log_t)qword_100066898, OS_LOG_TYPE_FAULT))
      sub_1000378E8();
    return;
  }
  if (a1 == 3)
  {
    if (os_log_type_enabled((os_log_t)qword_100066898, OS_LOG_TYPE_ERROR))
      sub_100037954();
    return;
  }
  if (a1 <= 5)
  {
    v4 = qword_100066898;
    if (!os_log_type_enabled((os_log_t)qword_100066898, OS_LOG_TYPE_DEFAULT))
      return;
    v9 = 136446210;
    v10 = a2;
    v5 = v4;
    v6 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s", (uint8_t *)&v9, 0xCu);
    return;
  }
  if (a1 == 6)
  {
    v7 = qword_100066898;
    if (!os_log_type_enabled((os_log_t)qword_100066898, OS_LOG_TYPE_INFO))
      return;
    v9 = 136446210;
    v10 = a2;
    v5 = v7;
    v6 = OS_LOG_TYPE_INFO;
    goto LABEL_15;
  }
  v8 = os_log_type_enabled((os_log_t)qword_100066898, OS_LOG_TYPE_DEBUG);
  if (a1 > 7)
  {
    if (v8)
      sub_100037A20();
  }
  else if (v8)
  {
    sub_1000379C0();
  }
}

void AMAuthInstallLog(uint64_t a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v11;
  unsigned int v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int Length;
  unsigned int v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  const char *v24;
  char __str[4096];

  v11 = "";
  if (a2)
    v11 = a2;
  v12 = snprintf(__str, 0x1000uLL, "%s: ", v11);
  v13 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, a3, 0x8000100u, kCFAllocatorNull);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_9;
  }
  v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v13, &a9);
  v15 = v14;
  if (!v14)
  {
LABEL_9:
    v23 = 0;
    v22 = 0;
    goto LABEL_14;
  }
  v16 = v12;
  v17 = 4096 - v12;
  Length = CFStringGetLength(v14);
  v19 = Length;
  if (4096 - v12 < Length && (v20 = (char *)malloc(v12 + Length + 1)) != 0)
  {
    v21 = v20;
    v17 = v19 + 1;
    memcpy(v20, __str, v12);
    v22 = v21;
  }
  else
  {
    v22 = 0;
    v21 = __str;
  }
  if (CFStringGetCString(v15, &v21[v16], v17, 0x8000100u))
    v23 = v21;
  else
    v23 = 0;
LABEL_14:
  if (v23)
    v24 = v23;
  else
    v24 = "failed to format log message";
  off_100066268(a1, v24);
  SafeRelease(v13);
  SafeRelease(v15);
  SafeFree(v22);
}

uint64_t AMAuthInstallDebugWriteObject(char *cf, CFTypeRef a2, uint64_t a3, int a4)
{
  CFTypeID v7;
  const __CFData *Data;
  const char *v9;
  const __CFAllocator *v10;
  CFStringRef v11;
  const __CFString *v12;
  const __CFAllocator *v13;
  uint64_t v14;
  const __CFAllocator *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFAllocatorRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeID v28;
  CFTypeID v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFAllocator *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  CFTypeRef cfa;

  cfa = 0;
  if (!cf)
    goto LABEL_19;
  if ((*((_DWORD *)cf + 86) & a4) == 0)
  {
    v14 = 0;
LABEL_12:
    Data = 0;
    goto LABEL_20;
  }
  if (!*((_QWORD *)cf + 42))
  {
    v21 = CFGetAllocator(cf);
    v22 = AMAuthInstallSupportCopyURLToNewTempDirectory(v21, "amai-debug.XXXXXX", cf + 336);
    if ((_DWORD)v22)
    {
      v14 = v22;
      AMAuthInstallLog(3, "AMAuthInstallDebugWriteObject", "failed to create debug output directory", v23, v24, v25, v26, v27, v42);
      goto LABEL_12;
    }
  }
  v7 = CFGetTypeID(a2);
  if (v7 == CFDataGetTypeID())
  {
    Data = (const __CFData *)CFRetain(a2);
    v9 = "";
    if (Data)
      goto LABEL_6;
LABEL_16:
    v14 = 0;
    goto LABEL_20;
  }
  v28 = CFGetTypeID(a2);
  if (v28 != CFDictionaryGetTypeID())
  {
    v29 = CFGetTypeID(a2);
    if (v29 != CFArrayGetTypeID())
    {
      AMAuthInstallLog(3, "AMAuthInstallDebugWriteObject", "can't prepare data for output to file", v30, v31, v32, v33, v34, v42);
      AMAuthInstallLog(7, "AMAuthInstallDebugWriteObject", "%@", v36, v37, v38, v39, v40, (char)a2);
LABEL_19:
      Data = 0;
      v14 = 1;
      goto LABEL_20;
    }
  }
  v35 = CFGetAllocator(cf);
  Data = CFPropertyListCreateData(v35, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  v9 = ".plist";
  if (!Data)
    goto LABEL_16;
LABEL_6:
  v10 = CFGetAllocator(cf);
  v11 = CFStringCreateWithFormat(v10, 0, CFSTR("%@%s"), a3, v9);
  if (v11)
  {
    v12 = v11;
    v13 = CFGetAllocator(cf);
    v14 = AMAuthInstallSupportCopyURLWithAppendedComponent(v13, *((const void **)cf + 42), v12, 0, (CFURLRef *)&cfa);
    CFRelease(v12);
    if (!(_DWORD)v14)
    {
      v15 = CFGetAllocator(cf);
      v14 = AMAuthInstallSupportWriteDataToFileURL(v15, Data, (const __CFURL *)cfa, 0);
      AMAuthInstallLog(7, "AMAuthInstallDebugWriteObject", "debug object written: %@", v16, v17, v18, v19, v20, (char)cfa);
    }
  }
  else
  {
    v14 = 2;
  }
LABEL_20:
  SafeRelease(Data);
  SafeRelease(cfa);
  return v14;
}

void sub_1000176B4(id a1)
{
  qword_100066898 = (uint64_t)os_log_create("com.apple.libauthinstall", "AMAuthInstallLog");
}

void sub_1000176E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t AMAuthInstallPlatformRemoveFile(const __CFURL *a1)
{
  char v1;
  std::error_code *v2;
  uint64_t result;
  int *v4;
  char v5;
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
  std::__fs::filesystem::path buffer[42];

  v1 = (char)a1;
  if (!CFURLGetFileSystemRepresentation(a1, 1u, (UInt8 *)buffer, 1024))
    return 3;
  result = remove(buffer, v2);
  if ((_DWORD)result)
  {
    v4 = __error();
    v5 = strerror(*v4);
    AMAuthInstallLog(3, "AMAuthInstallPlatformRemoveFile", "failed to file: %s", v6, v7, v8, v9, v10, v5);
    AMAuthInstallLog(7, "AMAuthInstallPlatformRemoveFile", "url=%@, path=%s", v11, v12, v13, v14, v15, v1);
    return 4;
  }
  return result;
}

uint64_t AMAuthInstallPlatformCopyURLToNewTempDirectory(const __CFAllocator *a1, const char *a2, CFURLRef *a3)
{
  uint64_t result;
  char v6;
  size_t v7;
  CFURLRef v8;
  CFURLRef v9;
  int *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char __str[1024];

  result = 1;
  if (a2 && a3)
  {
    v6 = (char)a2;
    snprintf(__str, 0x400uLL, "/tmp/%s", a2);
    if (mkdtemp(__str))
    {
      v7 = strlen(__str);
      v8 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)__str, v7, 1u);
      if (v8)
      {
        v9 = v8;
        result = 0;
        *a3 = v9;
      }
      else
      {
        unlink(__str);
        return 2;
      }
    }
    else
    {
      v10 = __error();
      v11 = strerror(*v10);
      AMAuthInstallLog(3, "AMAuthInstallPlatformCopyURLToNewTempDirectory", "failed to create tmp dir: %s", v12, v13, v14, v15, v16, v11);
      AMAuthInstallLog(8, "AMAuthInstallPlatformCopyURLToNewTempDirectory", "tmp dir template: %s", v17, v18, v19, v20, v21, v6);
      return 4;
    }
  }
  return result;
}

uint64_t AMAuthInstallPlatformWriteBufferToNativeFilePath(char *a1, int a2, char *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = open(a3, 1537, 420);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    if (a2 < 1)
    {
LABEL_6:
      close(v7);
      return 0;
    }
    v8 = 0;
    v9 = a2;
    while (1)
    {
      v10 = write(v7, a1, v9);
      if (v10 <= 0)
        break;
      a1 += v10;
      v9 -= v10;
      v8 += v10;
      if (v8 >= a2)
        goto LABEL_6;
    }
    close(v7);
    unlink(a3);
  }
  v12 = __error();
  v13 = strerror(*v12);
  AMAuthInstallLog(3, "AMAuthInstallPlatformWriteBufferToNativeFilePath", "failed to open file for writing: %s", v14, v15, v16, v17, v18, v13);
  AMAuthInstallLog(7, "AMAuthInstallPlatformWriteBufferToNativeFilePath", "path: %s", v19, v20, v21, v22, v23, (char)a3);
  return 4;
}

uint64_t AMAuthInstallPlatformWriteDataToFileURL(const __CFData *a1, CFURLRef url)
{
  char *BytePtr;
  int Length;
  UInt8 buffer[1024];

  if (!CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024))
    return 3;
  BytePtr = (char *)CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  return AMAuthInstallPlatformWriteBufferToNativeFilePath(BytePtr, Length, (char *)buffer);
}

uint64_t AMAuthInstallPlatformCopyURLWithAppendedComponent(const __CFAllocator *a1, CFTypeRef cf, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  CFTypeID v10;
  CFTypeID v11;
  uint64_t result;
  CFURLRef v13;
  CFURLRef v14;

  if (!cf)
    return 1;
  v10 = CFGetTypeID(cf);
  v11 = CFURLGetTypeID();
  result = 1;
  if (a5 && a3 && v10 == v11)
  {
    v13 = CFURLCreateCopyAppendingPathComponent(a1, (CFURLRef)cf, a3, a4);
    if (v13)
    {
      v14 = v13;
      result = 0;
      *a5 = v14;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t AMAuthInstallPlatformFileURLExists(const __CFURL *a1, BOOL *a2)
{
  uint64_t v2;
  int v4;
  stat v6;
  UInt8 buffer[1024];

  v2 = 1;
  if (a1 && a2)
  {
    memset(&v6, 0, sizeof(v6));
    if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    {
      v4 = stat((const char *)buffer, &v6);
      v2 = 0;
      *a2 = v4 == 0;
    }
    else
    {
      return 3;
    }
  }
  return v2;
}

const __CFString *sub_100017BB8()
{
  const __CFString *result;
  size_t v1;
  _BYTE v2[32];
  _BYTE v3[32];

  qword_1000668A8 = (uint64_t)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/tmp"), kCFURLPOSIXPathStyle, 1u);
  if (!qword_1000668A8)
    sub_100037A80();
  v1 = 32;
  result = (const __CFString *)sysctlbyname("kern.osversion", v3, &v1, 0, 0);
  if (!(_DWORD)result)
  {
    v1 = 32;
    if (!sysctlbyname("hw.product", v2, &v1, 0, 0)
      || (result = (const __CFString *)sysctlbyname("hw.machine", v2, &v1, 0, 0), !(_DWORD)result))
    {
      result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("mac/%s/%s"), v3, v2);
      if (result)
        goto LABEL_6;
    }
  }
  if (!qword_1000668B0)
  {
    result = CFSTR("???");
LABEL_6:
    qword_1000668B0 = (uint64_t)result;
  }
  return result;
}

uint64_t AMAuthInstallPlatformGetPlatformInfoString()
{
  pthread_once(&stru_100066270, (void (*)(void))sub_100017BB8);
  return qword_1000668B0;
}

const __CFString *AMAuthInstallPlatformGetSimplePlatformInfoString()
{
  return CFSTR("iOS");
}

uint64_t AMAuthInstallRequestSendSyncWithHeader(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  const __CFAllocator *v8;
  uint64_t v9;
  __CFDictionary *DeepCopy;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const void **v17;
  const __CFData *v18;
  const __CFData *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, CFAllocatorRef, uint64_t, uint64_t *);
  CFAllocatorRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFData *Data;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFDictionary *v41;
  __CFDictionary *v42;
  const __CFString *SimplePlatformInfoString;
  __CFDictionary *v44;
  const __CFString *LibraryVersionString;
  uint64_t v46;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *session;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const void *v77;
  const __CFAllocator *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CFNumberRef v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char LocalizedStatusString;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const __CFAllocator *v96;
  const __CFAllocator *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const void *Value;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const __CFString *v125;
  char v126;
  char v127;
  char v128;
  uint64_t context;
  __CFDictionary *MutableCopy;
  CFMutableDictionaryRef theDict;
  uint64_t v132;
  CFTypeRef v133;
  CFTypeRef cf;

  v133 = 0;
  cf = 0;
  v132 = 0;
  v8 = CFGetAllocator((CFTypeRef)a1);
  v9 = 2;
  DeepCopy = (__CFDictionary *)CFPropertyListCreateDeepCopy(v8, a2, 2uLL);
  theDict = DeepCopy;
  if (!DeepCopy)
    goto LABEL_28;
  v16 = *(const void **)(a1 + 64);
  if (v16)
    CFDictionarySetValue(DeepCopy, CFSTR("@Locality"), v16);
  v17 = (const void **)(a1 + 120);
  v18 = *(const __CFData **)(a1 + 120);
  v19 = v18;
  if (!v18)
  {
    if (!*(_QWORD *)(a1 + 104))
    {
      AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "SSO function returned NULL and no SSO token was provided, SSO disabled.", v11, v12, v13, v14, v15, v126);
      goto LABEL_15;
    }
    AMAuthInstallLog(5, "AMAuthInstallRequestSendSyncWithHeader", "using SSO.", v11, v12, v13, v14, v15, v126);
    v19 = (const __CFData *)*v17;
    if (!*v17)
    {
      v25 = *(uint64_t (**)(uint64_t, CFAllocatorRef, uint64_t, uint64_t *))(a1 + 104);
      v26 = CFGetAllocator((CFTypeRef)a1);
      v27 = v25(a1, v26, a1 + 120, &v132);
      if ((_DWORD)v27)
      {
        v9 = v27;
        AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "failed to create sso data %@", v28, v29, v30, v31, v32, v132);
        goto LABEL_13;
      }
      v19 = (const __CFData *)*v17;
      if (!*v17)
      {
        AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "SSO failed to authenticate.", v28, v29, v30, v31, v32, v126);
        Data = 0;
        v34 = 0;
        v9 = 22;
        goto LABEL_29;
      }
    }
  }
  AMAuthInstallCryptoCreateDigestForData(kCFAllocatorDefault, v19, &cf);
  if (cf)
  {
    AMAuthInstallLog(7, "AMAuthInstallRequestSendSyncWithHeader", "AuthUserId Hash: %@", v20, v21, v22, v23, v24, (char)cf);
    CFRelease(cf);
  }
  CFDictionarySetValue(theDict, CFSTR("AuthUserId"), *v17);
  if (!v18)
  {
    SafeRelease(*v17);
    *v17 = 0;
  }
LABEL_15:
  v35 = *(_QWORD *)(a1 + 16);
  if (!v35)
    goto LABEL_21;
  if (*(_QWORD *)(v35 + 144))
  {
    context = a1;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
    if (MutableCopy)
    {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_100018348, &context);
      SafeRelease(theDict);
      theDict = MutableCopy;
      v35 = *(_QWORD *)(a1 + 16);
      if (!v35)
        goto LABEL_21;
      goto LABEL_19;
    }
    AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "fullrequest copy allocation failure", v36, v37, v38, v39, v40, v126);
    v9 = 0;
LABEL_13:
    Data = 0;
    v34 = 0;
    goto LABEL_29;
  }
LABEL_19:
  v41 = *(const __CFDictionary **)(v35 + 136);
  if (v41)
    CFDictionaryApplyFunction(v41, (CFDictionaryApplierFunction)sub_1000184D4, theDict);
LABEL_21:
  v42 = theDict;
  SimplePlatformInfoString = AMAuthInstallPlatformGetSimplePlatformInfoString();
  CFDictionarySetValue(v42, CFSTR("@HostPlatformInfo"), SimplePlatformInfoString);
  v44 = theDict;
  LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
  CFDictionarySetValue(v44, CFSTR("@VersionInfo"), LibraryVersionString);
  v46 = *(_QWORD *)(a1 + 16);
  if (!v46 || !*(_BYTE *)(v46 + 116))
    CFDictionarySetValue(theDict, CFSTR("@BBTicket"), kCFBooleanTrue);
  v47 = *(const void **)(a1 + 96);
  if (v47)
    CFDictionarySetValue(theDict, CFSTR("@UUID"), v47);
  v48 = AMAuthInstallVinylRemoveFirmwareLoaderVersionTag((const void *)a1, &theDict);
  if ((_DWORD)v48)
  {
    v9 = v48;
    AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "AMAuthInstallVinylRemoveFirmwareLoaderVersionTag %d", v49, v50, v51, v52, v53, v48);
LABEL_28:
    Data = 0;
    v34 = 0;
    goto LABEL_29;
  }
  v9 = 2;
  AMAuthInstallDebugWriteObject((char *)a1, theDict, (uint64_t)CFSTR("tss-request"), 2);
  session = tss_create_session(&stru_100052650, *(const void **)(a1 + 72));
  v34 = (uint64_t)session;
  if (!session)
  {
    Data = 0;
    goto LABEL_29;
  }
  CFRelease((CFTypeRef)session[3]);
  *(_QWORD *)(v34 + 24) = CFRetain(theDict);
  *(_DWORD *)(v34 + 16) = *(_DWORD *)(a1 + 80);
  *(_QWORD *)(v34 + 80) = *(_QWORD *)(a1 + 488);
  *(_QWORD *)(v34 + 88) = *(_QWORD *)(a1 + 512);
  *(_QWORD *)(v34 + 32) = a3;
  v70 = tss_submit(v34, v63, v64, v65, v66, v67, v68, v69);
  v76 = v70;
  if (!v70)
  {
    v9 = 0;
    goto LABEL_52;
  }
  if (v70 <= 0x2710)
  {
    v77 = *(const void **)(v34 + 72);
    if (v77)
    {
      v9 = v70 + 3100;
      LODWORD(context) = v70 + 3100;
      if (v70 < 0x384)
      {
        v78 = CFGetAllocator((CFTypeRef)a1);
        v84 = CFNumberCreate(v78, kCFNumberIntType, &context);
        if (v84)
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 352), v84, v77);
          AMAuthInstallLog(7, "kAMAuthInstallRequestCacheLocalizedTssError", "cached server error text: (%d) %@", v85, v86, v87, v88, v89, context);
        }
        else
        {
          AMAuthInstallLog(3, "kAMAuthInstallRequestCacheLocalizedTssError", "failed to cache server error text: (%d) %@", v79, v80, v81, v82, v83, context);
        }
        SafeRelease(v84);
        goto LABEL_51;
      }
      AMAuthInstallLog(3, "kAMAuthInstallRequestCacheLocalizedTssError", "tss error code out of bounds (%d)", v71, v72, v73, v74, v75, v70 + 28);
    }
  }
  SafeRelease(0);
  if (v76 > 9999)
  {
    if ((v76 - 10000) > 0xC)
      v9 = 14;
    else
      v9 = dword_100049418[v76 - 10000];
  }
  else
  {
    v9 = (v76 + 3100);
  }
LABEL_51:
  LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)a1, v9);
  AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "failed tss submission: %@", v91, v92, v93, v94, v95, LocalizedStatusString);
LABEL_52:
  v96 = CFGetAllocator((CFTypeRef)a1);
  Data = CFPropertyListCreateData(v96, theDict, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    v97 = CFGetAllocator((CFTypeRef)a1);
    v103 = AMAuthInstallSupportBase64Encode(v97, Data, &v133, v98, v99, v100, v101, v102);
    if (v76)
    {
      if (!v103)
      {
        AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "failed tss request:<<<<<<<<<<\n%@", v104, v105, v106, v107, v108, (char)v133);
        AMAuthInstallLog(3, "AMAuthInstallRequestSendSyncWithHeader", "failed tss request:>>>>>>>>>>", v109, v110, v111, v112, v113, v127);
      }
    }
    else
    {
      if (!v103)
      {
        AMAuthInstallLog(8, "AMAuthInstallRequestSendSyncWithHeader", "successful tss request:<<<<<<<<<<\n%@", v104, v105, v106, v107, v108, (char)v133);
        AMAuthInstallLog(8, "AMAuthInstallRequestSendSyncWithHeader", "successful tss request:>>>>>>>>>>", v114, v115, v116, v117, v118, v128);
      }
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v34 + 40), CFSTR("@ServerVersion"));
      v125 = CFSTR("unavailable");
      if (Value)
        LOBYTE(v125) = (_BYTE)Value;
      AMAuthInstallLog(5, "AMAuthInstallRequestSendSyncWithHeader", "received tss response (server version: %@)", v120, v121, v122, v123, v124, (char)v125);
      AMAuthInstallDebugWriteObject((char *)a1, *(CFTypeRef *)(v34 + 40), (uint64_t)CFSTR("tss-response"), 2);
      v9 = 0;
      if (a4)
        *a4 = CFRetain(*(CFTypeRef *)(v34 + 40));
    }
  }
LABEL_29:
  SafeRelease(0);
  SafeRelease(0);
  SafeRelease(theDict);
  SafeRelease(0);
  SafeRelease(Data);
  SafeRelease(v133);
  SafeRelease(0);
  if (v34)
    tss_close_session((void *)v34, v54, v55, v56, v57, v58, v59, v60);
  return v9;
}

void sub_100018348(const __CFString *a1, const void *a2, CFMutableDictionaryRef *a3)
{
  __CFString *MutableCopy;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  __CFString *v14;
  CFRange v15;
  __CFDictionary *v16;
  CFStringRef v17;
  uint64_t v18;

  MutableCopy = (__CFString *)kCFAllocatorDefault;
  v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)*a3 + 2) + 144));
  v18 = *((_QWORD *)*a3 + 11);
  v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("@%@"));
  if (!v13 || (MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, a1)) == 0)
  {
    AMAuthInstallLog(3, "_ApplyTagPrefix", "Failed allocation", v8, v9, v10, v11, v12, v18);
    goto LABEL_9;
  }
  if (CFStringHasPrefix(a1, CFSTR("Ap,")))
  {
    v14 = MutableCopy;
    v15.location = 0;
    v15.length = 3;
LABEL_7:
    CFStringReplace(v14, v15, v7);
    v16 = a3[1];
    v17 = MutableCopy;
    goto LABEL_8;
  }
  if (CFStringHasPrefix(a1, CFSTR("Ap")))
  {
    v14 = MutableCopy;
    v15.location = 0;
    v15.length = 2;
    goto LABEL_7;
  }
  if (CFStringCompare(a1, CFSTR("@ApImg4Ticket"), 0))
    goto LABEL_9;
  v16 = a3[1];
  v17 = v13;
LABEL_8:
  CFDictionarySetValue(v16, v17, a2);
  CFDictionaryRemoveValue(a3[1], a1);
LABEL_9:
  SafeRelease(v7);
  SafeRelease(v13);
  SafeRelease(MutableCopy);
}

void sub_1000184D4(void *key, const void *a2, CFDictionaryRef theDict)
{
  const void *Value;

  if (CFDictionaryContainsKey(theDict, key))
  {
    Value = CFDictionaryGetValue(theDict, key);
    CFDictionarySetValue(theDict, a2, Value);
    CFDictionaryRemoveValue(theDict, key);
  }
}

uint64_t AMAuthInstallRequestSendSync(uint64_t a1, const void *a2, CFTypeRef *a3)
{
  return AMAuthInstallRequestSendSyncWithHeader(a1, a2, 0, a3);
}

void SafeRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

CFTypeRef SafeRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void SafeFree(void *a1)
{
  if (a1)
    free(a1);
}

const char *_CopyHexStringFromData(const __CFAllocator *a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unsigned int Length;
  const char *result;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  CFStringRef v10;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  result = (const char *)calloc(1uLL, (2 * Length) | 1);
  if (result)
  {
    v7 = (char *)result;
    if (Length)
    {
      v8 = 0;
      do
      {
        v9 = *BytePtr++;
        result[v8] = a0123456789abcd[(unint64_t)v9 >> 4];
        result[(v8 + 1)] = a0123456789abcd[v9 & 0xF];
        v8 += 2;
      }
      while (2 * Length != v8);
    }
    v10 = CFStringCreateWithCString(a1, result, 0x8000100u);
    free(v7);
    return (const char *)v10;
  }
  return result;
}

uint64_t AMAuthInstallSupportRemoveFile(const __CFURL *a1)
{
  uint64_t result;
  BOOL v3;

  v3 = 0;
  result = AMAuthInstallPlatformFileURLExists(a1, &v3);
  if (!(_DWORD)result)
  {
    if (!v3)
      return 0;
    result = AMAuthInstallPlatformRemoveFile(a1);
    if (!(_DWORD)result)
      return 0;
  }
  return result;
}

uint64_t AMAuthInstallSupportCopyURLWithAppendedComponent(const __CFAllocator *a1, const void *a2, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  if (a2 && a3 && a5)
    return AMAuthInstallPlatformCopyURLWithAppendedComponent(a1, a2, a3, a4, a5);
  else
    return 1;
}

uint64_t AMAuthInstallSupportCopyPreserveFileURL(const __CFAllocator *a1, CFTypeRef cf, CFTypeRef *a3, int a4)
{
  uint64_t v4;
  const __CFURL *v7;
  CFTypeRef v8;
  CFStringRef v9;
  CFMutableStringRef Mutable;
  CFStringRef v11;
  uint64_t v12;
  uint64_t v13;
  CFURLRef v14;
  BOOL v15;
  const __CFURL *v16;
  char v20;

  v4 = 1;
  v20 = 1;
  if (cf && a3)
  {
    v7 = (const __CFURL *)CFRetain(cf);
    v8 = CFRetain(cf);
    v9 = 0;
    Mutable = 0;
    v11 = 0;
    v12 = 1;
    while (1)
    {
      v13 = AMAuthInstallPlatformFileURLExists(v7, (BOOL *)&v20);
      if ((_DWORD)v13)
      {
        v4 = v13;
        goto LABEL_25;
      }
      if (!v20)
        goto LABEL_21;
      if (v11)
        CFRelease(v11);
      v11 = CFStringCreateWithFormat(a1, 0, CFSTR("~%d"), v12);
      if (!v11)
        goto LABEL_38;
      if (Mutable)
        CFRelease(Mutable);
      if (v9)
        CFRelease(v9);
      Mutable = CFStringCreateMutable(a1, 0);
      if (!Mutable)
        break;
      v9 = CFURLCopyFileSystemPath((CFURLRef)cf, kCFURLPOSIXPathStyle);
      if (!v9)
        goto LABEL_38;
      CFStringAppend(Mutable, v9);
      CFStringAppend(Mutable, v11);
      if (v8)
        CFRelease(v8);
      v8 = CFRetain(v7);
      CFRelease(v7);
      v14 = CFURLCreateWithFileSystemPath(a1, Mutable, kCFURLPOSIXPathStyle, 0);
      if (!v14)
      {
        v4 = 2;
LABEL_28:
        CFRelease(v11);
        goto LABEL_29;
      }
      v7 = v14;
      if (v20)
      {
        v15 = v12 > 0x1E;
        v12 = (v12 + 1);
        if (!v15)
          continue;
      }
LABEL_21:
      if (a4)
        v16 = v7;
      else
        v16 = (const __CFURL *)v8;
      v4 = 0;
      *a3 = CFRetain(v16);
      goto LABEL_25;
    }
    v9 = 0;
LABEL_38:
    v4 = 2;
LABEL_25:
    if (v7)
      CFRelease(v7);
    if (v11)
      goto LABEL_28;
LABEL_29:
    if (Mutable)
      CFRelease(Mutable);
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
  }
  return v4;
}

const __CFString *AMAuthInstallSupportGetLibraryVersionString()
{
  return CFSTR("libauthinstall_device-1033.0.6");
}

uint64_t AMAuthInstallSupportBase64Encode(const __CFAllocator *a1, CFDataRef theData, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *BytePtr;
  unsigned int Length;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  UInt8 *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFStringRef v26;
  CFStringRef v27;
  const char *v29;
  const char *v30;
  char v31;

  if (!theData)
  {
    v29 = "value == NULL";
LABEL_11:
    AMAuthInstallLog(3, "AMAuthInstallSupportBase64Encode", v29, a4, a5, a6, a7, a8, v31);
    return 1;
  }
  if (!CFDataGetLength(theData))
  {
    AMAuthInstallLog(3, "AMAuthInstallSupportBase64Encode", "value length == 0: '%@'", a4, a5, a6, a7, a8, (char)theData);
    return 1;
  }
  if (!a3)
  {
    v29 = "outEncodedValue == NULL";
    goto LABEL_11;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v13 = b64encode(BytePtr, Length);
  if (v13)
  {
    v19 = (UInt8 *)v13;
    v20 = strlen(v13);
    if (v20)
    {
      v26 = CFStringCreateWithBytes(a1, v19, v20, 0x8000100u, 0);
      if (v26)
      {
        v27 = v26;
        *a3 = CFRetain(v26);
        free(v19);
        CFRelease(v27);
        return 0;
      }
      v30 = "encodedValue == NULL: '%@'";
    }
    else
    {
      v30 = "encodedLength == 0: '%@'";
    }
    AMAuthInstallLog(3, "AMAuthInstallSupportBase64Encode", v30, v21, v22, v23, v24, v25, (char)theData);
    free(v19);
  }
  else
  {
    AMAuthInstallLog(3, "AMAuthInstallSupportBase64Encode", "encodedBuffer == NULL: '%@'", v14, v15, v16, v17, v18, (char)theData);
  }
  return 99;
}

uint64_t AMAuthInstallSupportWriteDataToFileURL(const __CFAllocator *a1, const __CFData *a2, const __CFURL *cf, int a4)
{
  uint64_t v4;
  uint64_t v7;
  const __CFURL *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFURL *v15;
  char v17;
  CFTypeRef cfa;

  cfa = 0;
  v4 = 1;
  if (!a2 || !cf)
    return v4;
  if (a4)
  {
    v7 = AMAuthInstallSupportRemoveFile(cf);
    if ((_DWORD)v7)
    {
LABEL_12:
      v4 = v7;
      goto LABEL_13;
    }
    v8 = 0;
LABEL_8:
    if (v8)
      v15 = v8;
    else
      v15 = cf;
    v7 = AMAuthInstallPlatformWriteDataToFileURL(a2, v15);
    goto LABEL_12;
  }
  v9 = AMAuthInstallSupportCopyPreserveFileURL(a1, cf, &cfa, 1);
  if (!(_DWORD)v9)
  {
    v8 = (const __CFURL *)cfa;
    goto LABEL_8;
  }
  v4 = v9;
  AMAuthInstallLog(3, "AMAuthInstallSupportWriteDataToFileURL", "AMAuthInstallSupportCopyPreserveFileURL failed.", v10, v11, v12, v13, v14, v17);
LABEL_13:
  if (cfa)
    CFRelease(cfa);
  return v4;
}

uint64_t AMAuthInstallVinylRemoveFirmwareLoaderVersionTag(const void *a1, CFDictionaryRef *a2)
{
  __CFDictionary *v2;
  uint64_t v3;
  const __CFAllocator *v5;
  __CFDictionary *MutableCopy;

  v2 = 0;
  v3 = 1;
  if (a1 && a2)
  {
    if (*a2)
    {
      v5 = CFGetAllocator(a1);
      MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, *a2);
      v2 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionaryRemoveValue(MutableCopy, CFSTR("EUICCFirmwareLoaderVersion"));
        SafeRelease(*a2);
        v3 = 0;
        *a2 = (CFDictionaryRef)CFRetain(v2);
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v2 = 0;
    }
  }
  SafeRelease(v2);
  return v3;
}

unint64_t b64_ntop(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  __int16 v17;
  unsigned __int8 v18;

  *a3 = 0;
  if (a2 >= 3)
  {
    v5 = 0;
    while (1)
    {
      result = v5 + 4;
      if (v5 + 4 > a4)
        goto LABEL_16;
      v7 = a1[2];
      v8 = a1[1];
      v9 = *a1;
      a1 += 3;
      a2 -= 3;
      v10 = &a3[v5];
      *v10 = aAbcdefghijklmn[(unint64_t)v9 >> 2];
      v10[1] = aAbcdefghijklmn[(v8 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v9 & 3))];
      v10[2] = aAbcdefghijklmn[(v7 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v8 & 0xF))];
      v10[3] = aAbcdefghijklmn[v7 & 0x3F];
      v5 = result;
      if (a2 <= 2)
      {
        if (a2)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  result = 0;
  if (a2)
  {
LABEL_8:
    v11 = 0;
    v12 = 0;
    v18 = 0;
    v17 = 0;
    do
    {
      *((_BYTE *)&v17 + v12) = a1[v11++];
      v12 = v11;
    }
    while (a2 > v11);
    if (result + 4 > a4)
      goto LABEL_16;
    v13 = HIBYTE(v17);
    v14 = ((unint64_t)HIBYTE(v17) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v17 & 3));
    a3[result] = aAbcdefghijklmn[(unint64_t)v17 >> 2];
    v15 = v18;
    a3[result | 1] = aAbcdefghijklmn[v14];
    v16 = 61;
    if (a2 != 1)
      v16 = aAbcdefghijklmn[(v15 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v13 & 0xF))];
    a3[result | 2] = v16;
    a3[result | 3] = 61;
    result += 4;
  }
LABEL_14:
  if (result < a4)
  {
    a3[result] = 0;
    return result;
  }
LABEL_16:
  a3[a4 - 1] = 0;
  *a3 = 0;
  return 0xFFFFFFFFLL;
}

_BYTE *b64encode(unsigned __int8 *a1, unsigned int a2)
{
  _BYTE *v2;
  unsigned int v5;
  size_t v6;

  v2 = 0;
  if (a1 && (int)a2 >= 1)
  {
    v5 = a2 / 3;
    if (a2 != 3 * (a2 / 3))
      ++v5;
    v6 = (4 * v5) | 1;
    v2 = malloc(v6);
    if (v2)
      b64_ntop(a1, a2, v2, v6);
  }
  return v2;
}

const __CFString *tss_lookup_error(int a1)
{
  const char *v1;
  const char **i;
  int v3;

  v1 = off_100066288;
  if (off_100066288)
  {
    if (tss_err_map == a1)
      return CFStringCreateWithCString(kCFAllocatorDefault, v1, 0x8000100u);
    for (i = (const char **)&off_100066298; ; i += 2)
    {
      v1 = *i;
      if (!*i)
        break;
      v3 = *((_DWORD *)i - 2);
      if (v3 == a1)
        return CFStringCreateWithCString(kCFAllocatorDefault, v1, 0x8000100u);
    }
  }
  return CFSTR("Unknown");
}

_QWORD *tss_create_session(const void *a1, const void *a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  CFTypeID v11;
  CFMutableDictionaryRef Mutable;
  const char *v13;
  char v15;

  v4 = malloc(0x60uLL);
  v10 = v4;
  if (!v4)
    goto LABEL_7;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  *v4 = 0u;
  v4[1] = 0u;
  if (!a2)
  {
    v13 = "signingServerURL is NULL";
    goto LABEL_10;
  }
  v11 = CFGetTypeID(a2);
  if (v11 != CFURLGetTypeID())
  {
    v13 = "signingServerURL is malformed";
    goto LABEL_10;
  }
  v10[1] = CFRetain(a2);
  *((_WORD *)v10 + 10) = 256;
  if (a1)
    CFRetain(a1);
  *v10 = a1;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v10[3] = Mutable;
  if (!Mutable)
  {
LABEL_7:
    v13 = "out of memory";
LABEL_10:
    AMAuthInstallLog(3, "tss_create_session", v13, v5, v6, v7, v8, v9, v15);
    free(v10);
    return 0;
  }
  return v10;
}

uint64_t tss_close_session(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  v9 = tss_reset_session((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)v9)
    free(a1);
  return v9;
}

uint64_t tss_reset_session(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  void *v14;
  uint64_t result;
  char v16;

  if (a1)
  {
    v9 = *(const void **)a1;
    if (v9)
      CFRelease(v9);
    v10 = *(const void **)(a1 + 24);
    if (v10)
      CFRelease(v10);
    v11 = *(const void **)(a1 + 40);
    if (v11)
      CFRelease(v11);
    v12 = *(const void **)(a1 + 8);
    if (v12)
      CFRelease(v12);
    v13 = *(const void **)(a1 + 72);
    if (v13)
    {
      CFRelease(v13);
      *(_QWORD *)(a1 + 72) = 0;
    }
    v14 = *(void **)(a1 + 56);
    if (v14)
      free(v14);
    result = 0;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    AMAuthInstallLog(3, "tss_reset_session", "NULL session", a4, a5, a6, a7, a8, v16);
    return 10009;
  }
  return result;
}

uint64_t tss_submit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  char v19;

  if (!a1)
  {
    AMAuthInstallLog(3, "tss_submit", "NULL session", a4, a5, a6, a7, a8, v19);
    return 10009;
  }
  if (!*(_QWORD *)(a1 + 24))
  {
    AMAuthInstallLog(3, "tss_submit", "NULL request in session", a4, a5, a6, a7, a8, v19);
    v15 = 10008;
    v16 = (const __CFString *)a1;
    v17 = 10008;
LABEL_10:
    sub_10001902C(v16, v17);
    return v15;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    sub_10001906C();
    return *(unsigned int *)(a1 + 64);
  }
  v9 = (pthread_t *)malloc(8uLL);
  *(_QWORD *)(a1 + 56) = v9;
  if (!v9)
  {
    AMAuthInstallLog(3, "tss_submit_non_block", "out of memory", v10, v11, v12, v13, v14, v19);
    v15 = 10006;
    v16 = (const __CFString *)a1;
    v17 = 10006;
    goto LABEL_10;
  }
  pthread_create(v9, 0, (void *(__cdecl *)(void *))sub_10001906C, (void *)a1);
  return 0;
}

const __CFString *sub_10001902C(const __CFString *result, int a2)
{
  const __CFString *v3;
  const void *info;

  if (result)
  {
    v3 = result;
    LODWORD(result[2].isa) = a2;
    info = (const void *)result[2].info;
    if (info)
      CFRelease(info);
    result = tss_lookup_error(a2);
    v3[2].info = (uint64_t)result;
  }
  return result;
}

uint64_t sub_10001906C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  const __CFAllocator *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFData *v21;
  char Length;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFURL *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFHTTPMessage *Request;
  const __CFString *v35;
  const __CFDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFDictionary *v42;
  const __CFString *Value;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFDictionary *Mutable;
  __CFDictionary *v50;
  const void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  const char *v70;
  int v71;
  const __CFString *v72;
  const __CFDictionary *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const __CFString *v80;
  int v81;
  void (*v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  int v89;
  const UInt8 *BytePtr;
  CFIndex v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  const char *v98;
  const char *v99;
  const char *v100;
  int v101;
  const char *v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  const void *v144;
  size_t v145;
  CFStringRef v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const __CFString *v152;
  int v153;
  CFIndex v154;
  CFDataRef v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const __CFData *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  CFDictionaryRef Copy;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  int v173;
  char v175;
  char v176;
  char v177;
  char v178;
  char v179;
  char v180;
  char v181;
  int v182;
  const char *v183;
  const char *v184;
  const char *v185;
  const char *v186;
  const char *v187;
  const char *cf;
  const char *cfa;
  const __CFData *cfb;
  void *key;
  CFErrorRef error;
  char __s[16];
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  char v209[8];
  CFDataRef theData[12800];
  _BYTE v211[102400];

  v0 = __chkstk_darwin();
  v6 = v0;
  if (v0)
  {
    if (*(_DWORD *)(v0 + 16) <= 1u)
      v7 = 1;
    else
      v7 = *(_DWORD *)(v0 + 16);
  }
  else
  {
    v7 = 1;
  }
  v8 = 0;
  v9 = kCFAllocatorDefault;
  key = (void *)_kCFSystemVersionBuildVersionKey;
  do
  {
    AMAuthInstallLog(6, "tss_submit_job_with_retry", "TSS Connection attempt %d of %d.  (Will retry if TSS_ERR_SERVER_NOT_REACHABLE.)", v1, v2, v3, v4, v5, ++v8);
    error = 0;
    bzero(v211, 0x19000uLL);
    if (!*(_QWORD *)(v6 + 8))
    {
      AMAuthInstallLog(3, "tss_submit_job", "no server URL", v10, v11, v12, v13, v14, v175);
      v71 = 10008;
LABEL_25:
      sub_10001902C((const __CFString *)v6, v71);
      v28 = 0;
      Request = 0;
      v72 = 0;
      v35 = 0;
      v73 = 0;
      v50 = 0;
      *(_DWORD *)(v6 + 64) = v71;
      goto LABEL_36;
    }
    v15 = CFPropertyListCreateData(v9, *(CFPropertyListRef *)(v6 + 24), kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (!v15)
    {
      AMAuthInstallLog(3, "tss_submit_job", "CFPropertyListCreateXMLData failed %@", v16, v17, v18, v19, v20, (char)error);
      v71 = 10036;
      goto LABEL_25;
    }
    v21 = v15;
    Length = CFDataGetLength(v15);
    v28 = CFURLCreateWithString(v9, CFSTR("TSS/controller?action=2"), *(CFURLRef *)(v6 + 8));
    if (!v28)
    {
      AMAuthInstallLog(3, "tss_submit_job", "CFURLCreateCopyAppendingPathComponent() failed", v23, v24, v25, v26, v27, v175);
      v74 = 10041;
      sub_10001902C((const __CFString *)v6, 10041);
      Request = 0;
LABEL_28:
      v72 = 0;
      v35 = 0;
      v50 = 0;
LABEL_35:
      *(_DWORD *)(v6 + 64) = v74;
      CFRelease(v21);
      v73 = 0;
      goto LABEL_36;
    }
    Request = CFHTTPMessageCreateRequest(v9, CFSTR("POST"), v28, kCFHTTPVersion1_1);
    if (!Request)
    {
      AMAuthInstallLog(3, "tss_submit_job", "CFHTTPMessageCreateRequest failed", v29, v30, v31, v32, v33, v175);
      v74 = 10041;
      sub_10001902C((const __CFString *)v6, 10041);
      goto LABEL_28;
    }
    v176 = Length;
    v35 = CFStringCreateWithFormat(v9, 0, CFSTR("%d"));
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Proxy-Connection"), CFSTR("Keep-Alive"));
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Pragma"), CFSTR("no-cache"));
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Type"), CFSTR("text/xml; charset=\"utf-8\""));
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Length"), v35);
    v36 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v36)
    {
      v42 = v36;
      Value = (const __CFString *)CFDictionaryGetValue(v36, key);
      CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-OS-Version"), Value);
      CFRelease(v42);
    }
    if (*(_QWORD *)(v6 + 32))
    {
      AMAuthInstallLog(7, "tss_submit_job", "Attempting to add additional entries to HTTP header", v37, v38, v39, v40, v41, v176);
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v6 + 32), (CFDictionaryApplierFunction)sub_100019B6C, Request);
      AMAuthInstallLog(7, "tss_submit_job", "Done adding additional fields to HTTP header", v44, v45, v46, v47, v48, v177);
    }
    CFHTTPMessageSetBody(Request, v21);
    Mutable = CFDictionaryCreateMutable(v9, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v50 = Mutable;
    v51 = *(const void **)(v6 + 80);
    if (v51)
    {
      CFDictionaryAddValue(Mutable, CFSTR("SocksProxySettings"), v51);
      AMAuthInstallLog(7, "tss_submit_job", "Found a SOCKS proxy setting. Will attempt to use it.", v52, v53, v54, v55, v56, v176);
    }
    v57 = *(const void **)(v6 + 88);
    if (v57)
    {
      CFDictionaryAddValue(v50, CFSTR("TrustedServerCAs"), v57);
      AMAuthInstallLog(7, "tss_submit_job", "Found a trusted server CA. Will attempt to use it.", v58, v59, v60, v61, v62, v176);
    }
    theData[0] = 0;
    v63 = CFURLCopyScheme(*(CFURLRef *)(v6 + 8));
    if (!v63)
    {
      v70 = "Invalid scheme in url";
      goto LABEL_32;
    }
    v69 = v63;
    *(_DWORD *)__s = 10000;
    if (CFStringCompare(v63, CFSTR("https"), 1uLL) && CFStringCompare(v69, CFSTR("http"), 1uLL))
    {
      CFRelease(v69);
      v70 = "unsupported URL scheme";
LABEL_32:
      AMAuthInstallLog(3, "tss_submit_job", v70, v64, v65, v66, v67, v68, v176);
      v74 = 10008;
      v80 = (const __CFString *)v6;
      v81 = 10008;
      goto LABEL_33;
    }
    CFRelease(v69);
    if (AMAuthInstallHttpMessageSendSyncNew(v9, (uint64_t)Request, (CFTypeRef *)theData, __s, v50, 300.0))
    {
      AMAuthInstallLog(3, "tss_submit_job", "failed to send http request", v75, v76, v77, v78, v79, v176);
      v74 = 10002;
      v80 = (const __CFString *)v6;
      v81 = 10002;
LABEL_33:
      sub_10001902C(v80, v81);
LABEL_34:
      v72 = CFSTR("Content-Length");
      goto LABEL_35;
    }
    v74 = *(_DWORD *)__s;
    if (*(_DWORD *)__s != 200)
    {
      AMAuthInstallLog(3, "tss_submit_job", "SendHttpRequest failed %d", v75, v76, v77, v78, v79, __s[0]);
      if (*(_DWORD *)__s == -1)
        v74 = 10002;
      v88 = (const __CFString *)v6;
      v89 = v74;
      goto LABEL_62;
    }
    if ((unint64_t)CFDataGetLength(theData[0]) > 0x19000)
    {
      AMAuthInstallLog(3, "tss_submit_job", "Response too large", v83, v84, v85, v86, v87, v176);
      v74 = 10052;
      v88 = (const __CFString *)v6;
      v89 = 10052;
LABEL_62:
      sub_10001902C(v88, v89);
      CFRelease(theData[0]);
      goto LABEL_34;
    }
    BytePtr = CFDataGetBytePtr(theData[0]);
    v91 = CFDataGetLength(theData[0]);
    __memcpy_chk(v211, BytePtr, v91, 102400);
    LODWORD(BytePtr) = CFDataGetLength(theData[0]);
    CFRelease(theData[0]);
    v97 = (int)BytePtr;
    *(_QWORD *)v209 = 0;
    *(_OWORD *)__s = 0u;
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v182 = (int)BytePtr;
    if ((int)BytePtr < 1)
    {
      v101 = 0;
      v186 = 0;
      cf = 0;
      v185 = 0;
      goto LABEL_101;
    }
    v98 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = v211;
    do
    {
      if (v100)
      {
        if (v99)
          goto LABEL_67;
      }
      else if (v101 + 7 >= v97)
      {
        v100 = 0;
        if (v99)
          goto LABEL_67;
      }
      else
      {
        v183 = v98;
        v187 = v99;
        if (!strncmp(v102, "STATUS", 6uLL))
        {
          v103 = 0;
          v100 = v102 + 7;
          v98 = v183;
          do
          {
            v104 = v102[v103 + 7];
            if (v104 == 38)
              break;
            v209[v103++] = v104;
          }
          while (v103 != 8);
          v209[7] = 0;
          v97 = v182;
        }
        else
        {
          v100 = 0;
          v97 = v182;
          v98 = v183;
        }
        v99 = v187;
        if (v187)
        {
LABEL_67:
          if (v98)
            goto LABEL_98;
          goto LABEL_68;
        }
      }
      if (v101 + 8 >= v97)
      {
        v99 = 0;
        if (v98)
          goto LABEL_98;
      }
      else
      {
        cfa = v100;
        v184 = v98;
        if (!strncmp(v102, "MESSAGE", 7uLL))
        {
          v105 = 0;
          v99 = v102 + 8;
          v98 = v184;
          v100 = cfa;
          do
          {
            v106 = v102[v105 + 8];
            if (v106 == 10)
              break;
            if (v106 == 38)
              break;
            __s[v105++] = v106;
          }
          while (v105 != 256);
          HIBYTE(v208) = 0;
          v97 = v182;
          if (v184)
            goto LABEL_98;
        }
        else
        {
          v99 = 0;
          v97 = v182;
          v98 = v184;
          v100 = cfa;
          if (v184)
            goto LABEL_98;
        }
      }
LABEL_68:
      if (v101 + 15 >= v97)
      {
        v98 = 0;
      }
      else
      {
        v186 = v99;
        cf = v100;
        if (!strncmp(v102, "REQUEST_STRING", 0xEuLL))
        {
          v98 = v102 + 15;
          v100 = cf;
          if (cf)
          {
            v97 = v182;
            v99 = v186;
            if (v186)
            {
              v185 = v102 + 15;
              goto LABEL_101;
            }
          }
          else
          {
            v97 = v182;
            v99 = v186;
          }
        }
        else
        {
          v98 = 0;
          v97 = v182;
          v99 = v186;
          v100 = cf;
        }
      }
LABEL_98:
      ++v102;
      ++v101;
    }
    while (v101 != v97);
    v185 = v98;
    v186 = v99;
    v101 = v97;
    cf = v100;
LABEL_101:
    AMAuthInstallLog(8, "tss_submit_job", "----Begin request", v92, v93, v94, v95, v96, v176);
    AMAuthInstallLog(8, "tss_submit_job", "%@", v107, v108, v109, v110, v111, *(_QWORD *)(v6 + 24));
    AMAuthInstallLog(8, "tss_submit_job", "----End request", v112, v113, v114, v115, v116, v178);
    AMAuthInstallLog(8, "tss_submit_job", "----Begin response", v117, v118, v119, v120, v121, v179);
    AMAuthInstallLog(8, "tss_submit_job", "%s", v122, v123, v124, v125, v126, (char)v211);
    AMAuthInstallLog(8, "tss_submit_job", "----End response", v127, v128, v129, v130, v131, v180);
    if (!cf || !v186)
    {
      AMAuthInstallLog(3, "tss_submit_job", "invalid response", v132, v133, v134, v135, v136, v181);
      v143 = 10052;
      v152 = (const __CFString *)v6;
      v153 = 10052;
      goto LABEL_109;
    }
    v137 = atoi(v209);
    if (!v137)
    {
      if (v185)
      {
        v154 = v182 - v101 - 15;
        __memcpy_chk(theData, v185, v154, 102400);
        v155 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)theData, v154);
        if (v155)
        {
          v161 = v155;
          if (error)
            CFRelease(error);
          cfb = v161;
          v73 = (const __CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v161, 0, 0, &error);
          if (v73)
          {
            Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v73);
            *(_QWORD *)(v6 + 40) = Copy;
            if (Copy)
            {
              v173 = 0;
LABEL_124:
              *(_DWORD *)(v6 + 64) = v173;
              CFRelease(v21);
              CFRelease(cfb);
              goto LABEL_111;
            }
            AMAuthInstallLog(3, "tss_submit_job", "CFDictionaryCreateCopy failed", v168, v169, v170, v171, v172, v181);
            v173 = 10056;
          }
          else
          {
            AMAuthInstallLog(3, "tss_submit_job", "CFPropertyListCreateFromXMLData failed (%@)", v162, v163, v164, v165, v166, (char)error);
            v173 = 10055;
          }
          sub_10001902C((const __CFString *)v6, v173);
          goto LABEL_124;
        }
        AMAuthInstallLog(3, "tss_submit_job", "CFDataCreate failed", v156, v157, v158, v159, v160, v181);
        v143 = 10054;
        v152 = (const __CFString *)v6;
        v153 = 10054;
      }
      else
      {
        AMAuthInstallLog(3, "tss_submit_job", "no data in response", v138, v139, v140, v141, v142, v181);
        v143 = 10053;
        v152 = (const __CFString *)v6;
        v153 = 10053;
      }
LABEL_109:
      sub_10001902C(v152, v153);
      goto LABEL_110;
    }
    v143 = v137;
    AMAuthInstallLog(3, "tss_submit_job", "error from server=%d (%s)", v138, v139, v140, v141, v142, v137);
    v144 = *(const void **)(v6 + 72);
    if (v144)
      CFRelease(v144);
    v145 = strlen(__s);
    v146 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)__s, v145, 0x8000100u, 0);
    *(_QWORD *)(v6 + 72) = v146;
    if (!v146)
      AMAuthInstallLog(3, "tss_submit_job", "Server message failed to convert: %d", v147, v148, v149, v150, v151, v143);
LABEL_110:
    *(_DWORD *)(v6 + 64) = v143;
    CFRelease(v21);
    v73 = 0;
LABEL_111:
    v72 = CFSTR("Content-Length");
LABEL_36:
    if (error)
      CFRelease(error);
    if (v28)
      CFRelease(v28);
    if (Request)
      CFRelease(Request);
    if (v72)
      CFRelease(v72);
    if (v35)
      CFRelease(v35);
    v9 = kCFAllocatorDefault;
    if (v73)
      CFRelease(v73);
    if (v50)
      CFRelease(v50);
    v82 = *(void (**)(uint64_t))(v6 + 48);
    if (v82)
      v82(v6);
  }
  while (v6 && v8 < v7 && *(_DWORD *)(v6 + 64) == 10002);
  return 0;
}

void sub_100019B6C(const __CFString *a1, const __CFString *a2, __CFHTTPMessage *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char buffer[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  *(_OWORD *)buffer = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)v11 = 0u;
  v12 = 0u;
  CFStringGetCString(a1, buffer, 511, 0x8000100u);
  CFStringGetCString(a2, v11, 511, 0x8000100u);
  AMAuthInstallLog(7, "_AMAuthInstallUpdateHTTPHeaderWithEntry", "Appending {%s : %s} to http header", v6, v7, v8, v9, v10, (char)buffer);
  CFHTTPMessageSetHeaderFieldValue(a3, a1, a2);
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

BOOL sub_10001A69C(NSError *self, SEL a2)
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v3, "isEqualToString:", NSPOSIXErrorDomain))
    v4 = (id)-[NSError code](self, "code") == (id)17;
  else
    v4 = 0;

  return v4;
}

id UARPPersonalizationTSSRequestWithSigningServer(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v5 = sub_10001AA78();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10001B05C();

  v6 = sub_10001AAB8(v3, v4, 0);
  v7 = sub_10001AA78();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      sub_10001B030();

    v9 = v6;
  }
  else
  {
    if (v8)
      sub_10001B004();

  }
  return v6;
}

id sub_10001AA78()
{
  if (qword_1000668B8 != -1)
    dispatch_once(&qword_1000668B8, &stru_100051618);
  return (id)qword_1000668C0;
}

id sub_10001AAB8(void *a1, void *a2, int a3)
{
  const __CFDictionary *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  CFTypeRef v23;
  uint8_t buf[4];
  CFTypeRef v25;
  __int16 v26;
  const __CFString *v27;

  v5 = a1;
  v6 = a2;
  v7 = sub_10001AA78();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler((void (*)(int, uint64_t))sub_10001AF44);
  v8 = AMAuthInstallCreate(kCFAllocatorDefault);
  if (!v8)
  {
    v13 = sub_10001AA78();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10001B0C0();

    goto LABEL_11;
  }
  v9 = (const void *)v8;
  v10 = AMAuthInstallSetSigningServerURL(v8, v6);
  v11 = sub_10001AA78();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001B15C();

    CFRelease(v9);
LABEL_11:
    v14 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (a3)
      v15 = CFSTR(" <AppleConnect>");
    else
      v15 = CFSTR(" ");
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2114;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
  }

  v16 = sub_10001AA78();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  v23 = 0;
  v17 = AMAuthInstallApCreatePersonalizedResponse((uint64_t)v9, v5, &v23);
  v18 = sub_10001AA78();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    if (a3)
      v19 = CFSTR(" <AppleConnect>");
    else
      v19 = CFSTR(" ");
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2114;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
  }

  v20 = sub_10001AA78();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  if (v17)
  {
    v21 = sub_10001AA78();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10001B0EC(v17, v21);

    v14 = 0;
  }
  else
  {
    v14 = (void *)v23;
  }
  CFRelease(v9);
LABEL_32:

  return v14;
}

id UARPPersonalizationTSSRequestWithSigningServerSSO(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;

  v3 = a1;
  v4 = a2;
  v5 = sub_10001AA78();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10001B1B4();

  v6 = sub_10001AAB8(v3, v4, 1);
  if (!v6)
  {
    v7 = sub_10001AA78();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001B188();

  }
  return v6;
}

void sub_10001AF10(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  v2 = (void *)qword_1000668C0;
  qword_1000668C0 = (uint64_t)v1;

}

void sub_10001AF44(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;

  v3 = sub_10001AA78();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v4, 0xCu);
  }

}

void sub_10001B004()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10001B030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10001B05C()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001AFEC();
  sub_10000821C((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void sub_10001B0C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10001B0EC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, error = %u", (uint8_t *)v2, 8u);
  sub_1000023F0();
}

void sub_10001B15C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10001B188()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10001B1B4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001AFEC();
  sub_10000821C((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

void sub_10001B2B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C1A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021664(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "superbinary:logString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id sub_10002169C(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = *(id *)(a2 + 32);
  return *(id *)(a2 + 40);
}

void sub_1000216C4(uint64_t a1)
{

}

void sub_100024B28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027954(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100027C9C(NSFileHandle *self, SEL a2, const void *a3, unint64_t a4)
{
  NSData *v5;

  v5 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4);
  LOBYTE(self) = -[NSFileHandle uarpWriteData:error:](self, "uarpWriteData:error:", v5, 0);

  return (char)self;
}

void sub_100029558(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002956C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10002958C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1000295BC()
{
  void *v0;

}

void sub_1000295E8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000295A0();
  sub_10002958C((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  sub_100029584();
}

void sub_100029654(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[FTABFileBackDeploy parseFileData]";
  sub_10002956C((void *)&_mh_execute_header, a1, a3, "%s: File too short", (uint8_t *)&v3);
  sub_100006680();
}

void sub_1000296C8(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = 136316162;
  v7 = "-[FTABFileBackDeploy parseFileData]";
  v8 = 1024;
  v9 = v2;
  v10 = 1024;
  v11 = v3;
  v12 = 1024;
  v13 = v4;
  v14 = 1024;
  v15 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: File tag parse error (%02x %02x %02x %02x)", (uint8_t *)&v6, 0x24u);
  sub_100029584();
}

void sub_100029774()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1000295D4();
  sub_1000295C4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  sub_100006680();
}

void sub_1000297F0()
{
  os_log_t v0;
  int v1[4];
  __int16 v2;
  uint64_t v3;

  v1[0] = 136315650;
  sub_1000295D4();
  v2 = 2048;
  v3 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Error parsing file offset list (offset=%u, length=%lu)", (uint8_t *)v1, 0x1Cu);
  sub_100029584();
}

void sub_100029878(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[FTABFileBackDeploy parseFileData]";
  sub_10002956C((void *)&_mh_execute_header, a1, a3, "%s: Manifest parameters are invalid", (uint8_t *)&v3);
  sub_100006680();
}

void sub_1000298EC()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1000295C4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

void sub_1000299C8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000295A0();
  sub_10002958C((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  sub_100029584();
}

void sub_100029A34()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_100008230();
  sub_1000295C4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
  sub_100006680();
}

void sub_100029AA8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = objc_msgSend(a1, "path");
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);
  sub_1000295BC();
  sub_100029578();
}

void sub_100029B24(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = objc_msgSend(a1, "path");
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);
  sub_1000295BC();
  sub_100029578();
}

void sub_100029BA0(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = objc_msgSend(a1, "tag");
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to write '%@'", v4, v5, v6, v7, v8);
  sub_1000295BC();
  sub_100029578();
}

void sub_100029C1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "Failed to write manifest", a5, a6, a7, a8, 0);
}

void sub_100029C50(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = objc_msgSend(a1, "tag");
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to write '%@' header", v4, v5, v6, v7, v8);
  sub_1000295BC();
  sub_100029578();
}

void sub_100029CCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "Failed to write FTAB header", a5, a6, a7, a8, 0);
}

void sub_100029D00(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = objc_msgSend(a1, "absoluteString");
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);
  sub_1000295BC();
  sub_100029578();
}

void sub_100029D7C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008230();
  sub_10002956C((void *)&_mh_execute_header, v0, v1, "Unable to locate subfile with tag '%@'", v2);
  sub_100006680();
}

void sub_10002B9A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BE5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C20C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C600(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C9B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D860(id a1)
{
  NSMutableArray *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSArray *v39;
  void *v40;

  v1 = objc_opt_new(NSMutableArray);
  v2 = +[UARPTLVPersonalizationRequiredBackDeploy metaDataTableEntry](UARPTLVPersonalizationRequiredBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v2);

  v3 = +[UARPTLVPersonalizationPayloadTagBackDeploy metaDataTableEntry](UARPTLVPersonalizationPayloadTagBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v3);

  v4 = +[UARPTLVPersonalizationSuperBinaryAssetIDBackDeploy metaDataTableEntry](UARPTLVPersonalizationSuperBinaryAssetIDBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v4);

  v5 = +[UARPTLVPersonalizationManifestPrefixBackDeploy metaDataTableEntry](UARPTLVPersonalizationManifestPrefixBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v5);

  v6 = +[UARPTLVPersonalizationBoardIDBackDeploy metaDataTableEntry](UARPTLVPersonalizationBoardIDBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v6);

  v7 = +[UARPTLVPersonalizationChipIDBackDeploy metaDataTableEntry](UARPTLVPersonalizationChipIDBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v7);

  v8 = +[UARPTLVPersonalizationECIDBackDeploy metaDataTableEntry](UARPTLVPersonalizationECIDBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v8);

  v9 = +[UARPTLVPersonalizationECIDDataBackDeploy metaDataTableEntry](UARPTLVPersonalizationECIDDataBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v9);

  v10 = +[UARPTLVPersonalizationNonceBackDeploy metaDataTableEntry](UARPTLVPersonalizationNonceBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v10);

  v11 = +[UARPTLVPersonalizationNonceHashBackDeploy metaDataTableEntry](UARPTLVPersonalizationNonceHashBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v11);

  v12 = +[UARPTLVPersonalizationSecurityDomainBackDeploy metaDataTableEntry](UARPTLVPersonalizationSecurityDomainBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v12);

  v13 = +[UARPTLVPersonalizationSecurityModeBackDeploy metaDataTableEntry](UARPTLVPersonalizationSecurityModeBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v13);

  v14 = +[UARPTLVPersonalizationProductionModeBackDeploy metaDataTableEntry](UARPTLVPersonalizationProductionModeBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v14);

  v15 = +[UARPTLVPersonalizationChipEpochBackDeploy metaDataTableEntry](UARPTLVPersonalizationChipEpochBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v15);

  v16 = +[UARPTLVPersonalizationEnableMixMatchBackDeploy metaDataTableEntry](UARPTLVPersonalizationEnableMixMatchBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v16);

  v17 = +[UARPTLVPersonalizationSuperBinaryPayloadIndexBackDeploy metaDataTableEntry](UARPTLVPersonalizationSuperBinaryPayloadIndexBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v17);

  v18 = +[UARPTLVPersonalizationChipRevisionBackDeploy metaDataTableEntry](UARPTLVPersonalizationChipRevisionBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v18);

  v19 = +[UARPTLVPersonalizationFTABSubfileTagBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTagBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v19);

  v20 = +[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongnameBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v20);

  v21 = +[UARPTLVPersonalizationFTABSubfileDigestBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileDigestBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v21);

  v22 = +[UARPTLVPersonalizationFTABSubfileHashAlgorithmBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileHashAlgorithmBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v22);

  v23 = +[UARPTLVPersonalizationFTABSubfileESECBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileESECBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v23);

  v24 = +[UARPTLVPersonalizationFTABSubfileEPROBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileEPROBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v24);

  v25 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTrustedBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v25);

  v26 = +[UARPTLVPersonalizationSoCLiveNonceBackDeploy metaDataTableEntry](UARPTLVPersonalizationSoCLiveNonceBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v26);

  v27 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy metaDataTableEntry](UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v27);

  v28 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy metaDataTableEntry](UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v28);

  v29 = +[UARPTLVPersonalizationLogicalUnitNumberBackDeploy metaDataTableEntry](UARPTLVPersonalizationLogicalUnitNumberBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v29);

  v30 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy metaDataTableEntry](UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v30);

  v31 = +[UARPTLVHostPersonalizationRequiredBackDeploy metaDataTableEntry](UARPTLVHostPersonalizationRequiredBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v31);

  v32 = +[UARPTLVRequiredPersonalizationOptionBackDeploy metaDataTableEntry](UARPTLVRequiredPersonalizationOptionBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v32);

  v33 = +[UARPTLVPersonalizationFTABPayloadBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABPayloadBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v33);

  v34 = +[UARPTLVPersonalizedManifestBackDeploy metaDataTableEntry](UARPTLVPersonalizedManifestBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v34);

  v35 = +[UARPTLVPersonalizationLifeBackDeploy metaDataTableEntry](UARPTLVPersonalizationLifeBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v35);

  v36 = +[UARPTLVPersonalizationProvisioningBackDeploy metaDataTableEntry](UARPTLVPersonalizationProvisioningBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v36);

  v37 = +[UARPTLVPersonalizationManifestEpochBackDeploy metaDataTableEntry](UARPTLVPersonalizationManifestEpochBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v37);

  v38 = +[UARPTLVPersonalizationManifestSuffixBackDeploy metaDataTableEntry](UARPTLVPersonalizationManifestSuffixBackDeploy, "metaDataTableEntry");
  -[NSMutableArray addObject:](v1, "addObject:", v38);

  v39 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v1);
  v40 = (void *)qword_1000668C8;
  qword_1000668C8 = (uint64_t)v39;

}

id FormatHex(uint64_t a1, unint64_t a2, int a3)
{
  void *v6;
  void *v7;
  const __CFString *v8;
  unint64_t v9;
  const char *v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  char *__format;
  char __str[32];
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v7 = v6;
  v44 = 0;
  v43 = 0;
  if (a3)
    v8 = CFSTR("00000000  ");
  else
    v8 = CFSTR("0000  ");
  objc_msgSend(v6, "appendFormat:", v8);
  if (a2)
  {
    v9 = 0;
    v10 = "%s %s\n%04x  ";
    if (a3)
      v10 = "%s %s\n%08x  ";
    __format = (char *)v10;
    do
    {
      if (v9)
      {
        v11 = v9 & 0xF;
        if ((v9 & 0xF) == 0)
        {
          v42 = 0;
          v41 = *(_QWORD *)(v9 + a1 - 16);
          do
          {
            v12 = *((char *)&v41 + v11);
            if (v12 < 32 || v12 == 127 || *((_BYTE *)&v41 + v11) == 32)
              *((_BYTE *)&v41 + v11) = 46;
            ++v11;
          }
          while (v11 != 8);
          v13 = 0;
          v40 = 0;
          v39 = *(_QWORD *)(v9 + a1 - 8);
          do
          {
            v14 = *((char *)&v39 + v13);
            if (v14 < 32 || v14 == 127 || *((_BYTE *)&v39 + v13) == 32)
              *((_BYTE *)&v39 + v13) = 46;
            ++v13;
          }
          while (v13 != 8);
          snprintf(__str, 0x20uLL, __format, &v41, &v39, v9);
          objc_msgSend(v7, "appendFormat:", CFSTR("%s"), __str);
        }
      }
      if (v9 + 8 >= a2)
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("%02x "), *(unsigned __int8 *)(a1 + v9++));
      }
      else
      {
        v15 = *(unsigned __int8 *)(a1 + v9);
        v16 = *(unsigned __int8 *)(a1 + v9 + 1);
        if ((((_BYTE)v9 + 8) & 0xF) != 0)
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x  ", v15, v16);
        else
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x    ", v15, v16);
        objc_msgSend(v7, "appendFormat:", CFSTR("%s"), __str);
        v9 += 8;
      }
    }
    while (v9 < a2);
    v17 = 16;
    if ((a2 & 0xF) != 0)
      v17 = a2 & 0xF;
    if (a2 <= 0xF)
      v18 = a2;
    else
      v18 = v17;
    if (a2 >= 0x10 && (a2 & 0xF) == 0)
    {
      objc_msgSend(v7, "appendString:", CFSTR("   "));
      v19 = 0;
      v43 = *(_QWORD *)(v9 + a1 - 16);
      do
      {
        v20 = *((char *)&v43 + v19);
        if (v20 < 32 || v20 == 127 || *((_BYTE *)&v43 + v19) == 32)
          *((_BYTE *)&v43 + v19) = 46;
        ++v19;
      }
      while (v19 != 8);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v43));
      objc_msgSend(v7, "appendString:", v21);

      objc_msgSend(v7, "appendString:", CFSTR(" "));
      v22 = 0;
      v43 = *(_QWORD *)(v9 + a1 - 8);
      do
      {
        v23 = *((char *)&v43 + v22);
        if (v23 < 32 || v23 == 127 || *((_BYTE *)&v43 + v22) == 32)
          *((_BYTE *)&v43 + v22) = 46;
        ++v22;
      }
      while (v22 != 8);
LABEL_77:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v43));
      objc_msgSend(v7, "appendString:", v35);

      return v7;
    }
  }
  else
  {
    v18 = 0;
    v9 = 0;
  }
  v24 = 3;
  if (v18 < 9)
    v24 = 4;
  v25 = 3 * (16 - v18) + v24;
  do
  {
    objc_msgSend(v7, "appendString:", CFSTR(" "));
    --v25;
  }
  while (v25);
  v26 = (uint64_t *)(a1 + v9 - v18);
  v27 = v18 - 8;
  if (v18 >= 8)
  {
    v30 = 0;
    v43 = *v26;
    do
    {
      v31 = *((char *)&v43 + v30);
      if (v31 < 32 || v31 == 127 || *((_BYTE *)&v43 + v30) == 32)
        *((_BYTE *)&v43 + v30) = 46;
      ++v30;
    }
    while (v30 != 8);
  }
  else
  {
    __memcpy_chk(&v43, v26, v18, 9);
    *((_BYTE *)&v43 + v18) = 0;
    if (v18)
    {
      v28 = 0;
      do
      {
        v29 = *((char *)&v43 + v28);
        if (v29 < 32 || v29 == 127 || *((_BYTE *)&v43 + v28) == 32)
          *((_BYTE *)&v43 + v28) = 46;
        ++v28;
      }
      while (v28 < v18);
    }
    v27 = 0;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v43));
  objc_msgSend(v7, "appendString:", v32);

  if (v27)
  {
    objc_msgSend(v7, "appendString:", CFSTR(" "));
    __memcpy_chk(&v43, a1 + v9 - v27, v27, 9);
    v33 = 0;
    *((_BYTE *)&v43 + v27) = 0;
    do
    {
      v34 = *((char *)&v43 + v33);
      if (v34 < 32 || v34 == 127 || *((_BYTE *)&v43 + v33) == 32)
        *((_BYTE *)&v43 + v33) = 46;
      ++v33;
    }
    while (v27 > v33);
    goto LABEL_77;
  }
  return v7;
}

void sub_100032A0C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000295A0();
  sub_10002958C((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  sub_100029584();
}

void sub_100032A78(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[FTABFile parseFileData]";
  sub_10002956C((void *)&_mh_execute_header, a1, a3, "%s: File too short", (uint8_t *)&v3);
  sub_100006680();
}

void sub_100032AEC(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = 136316162;
  v7 = "-[FTABFile parseFileData]";
  v8 = 1024;
  v9 = v2;
  v10 = 1024;
  v11 = v3;
  v12 = 1024;
  v13 = v4;
  v14 = 1024;
  v15 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: File tag parse error (%02x %02x %02x %02x)", (uint8_t *)&v6, 0x24u);
  sub_100029584();
}

void sub_100032B98()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1000295D4();
  sub_1000295C4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  sub_100006680();
}

void sub_100032C14()
{
  os_log_t v0;
  int v1[4];
  __int16 v2;
  uint64_t v3;

  v1[0] = 136315650;
  sub_1000295D4();
  v2 = 2048;
  v3 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Error parsing file offset list (offset=%u, length=%lu)", (uint8_t *)v1, 0x1Cu);
  sub_100029584();
}

void sub_100032C9C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[FTABFile parseFileData]";
  sub_10002956C((void *)&_mh_execute_header, a1, a3, "%s: Manifest parameters are invalid", (uint8_t *)&v3);
  sub_100006680();
}

void sub_100032D10()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1000295C4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

void sub_100032DEC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000295A0();
  sub_10002958C((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  sub_100029584();
}

void sub_100032E58(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);

  sub_100029578();
}

void sub_100032ED0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);

  sub_100029578();
}

void sub_100032F48(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tag"));
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to write '%@'", v4, v5, v6, v7, v8);

  sub_100029578();
}

void sub_100032FC0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tag"));
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to write '%@' header", v4, v5, v6, v7, v8);

  sub_100029578();
}

void sub_100033038(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "absoluteString"));
  sub_100008230();
  sub_100029558((void *)&_mh_execute_header, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);

  sub_100029578();
}

uint64_t lzvn_decode_buffer(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (a3 <= a3 + a4 - 8)
      __asm { BR              X17 }
    __asm { BTI             j }
    return 0;
  }
  else
  {
    __asm { BTI             j }
    return 0;
  }
}

int32x4_t **lz4_encode_2gb(int32x4_t **result, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int32x4_t v7;
  int32x4_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  unint64_t v14;
  int *v15;
  int v16;
  int v17;
  unint64_t v18;
  int *v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE *v24;
  unint64_t v25;
  int *v26;
  int v27;
  int v28;
  _BYTE *v30;
  unint64_t v31;
  int *v32;
  int v33;
  int v34;
  _BYTE *v36;
  unint64_t v37;
  int *v38;
  int v39;
  int v40;
  _BYTE *v42;
  char *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  BOOL v51;
  int v52;
  int v53;
  int v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  __int8 v59;
  int32x4_t *v60;
  unint64_t v61;
  BOOL v62;
  unint64_t v63;
  int32x4_t v64;
  _WORD *v65;
  int32x4_t *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int32x4_t *v76;
  unsigned int v77;
  int64_t v78;
  uint64_t v79;
  int32x4_t v80;
  __int8 v81;

  v7 = vdupq_n_s32(0xFFFFFFFF);
  v8 = *result;
  v9 = *a3;
  v10 = (uint64_t)(*result)[-8].i64 + a2;
  if (v10 < (uint64_t)*result)
    goto LABEL_92;
  v11 = (uint64_t)&v9[a5 - 128];
  if (v11 >= (uint64_t)v9)
  {
    do
    {
      v12 = v9;
      v13 = &v9[-a4];
      while (1)
      {
        v14 = *v12;
        v15 = (int *)(a6 + 8 * ((-1640531535 * *v12) >> 20));
        v16 = *v15;
        v17 = v15[1];
        *v15 = (int)v13;
        v15[1] = v14;
        v18 = v14 >> 8;
        v19 = (int *)(a6 + 8 * ((-1640531535 * (v14 >> 8)) >> 20));
        v20 = *v19;
        v21 = v19[1];
        *v19 = (_DWORD)v13 + 1;
        v19[1] = v14 >> 8;
        if ((_DWORD)v14 == v17)
        {
          v22 = ((_DWORD)v13 - v16);
          if (v22 < 0x10000 && (_DWORD)v22 != 0)
            break;
        }
        v12 = (_QWORD *)((char *)v12 + 1);
        v24 = v13 + 1;
        v25 = v14 >> 16;
        v26 = (int *)(a6 + 8 * ((-1640531535 * v25) >> 20));
        v27 = *v26;
        v28 = v26[1];
        *v26 = (_DWORD)v24 + 1;
        v26[1] = v25;
        if ((_DWORD)v18 == v21)
        {
          v22 = ((_DWORD)v24 - v20);
          if (v22 < 0x10000 && (_DWORD)v24 != v20)
            break;
        }
        v12 = (_QWORD *)((char *)v12 + 1);
        v30 = v24 + 1;
        v31 = v25 >> 8;
        v32 = (int *)(a6 + 8 * ((-1640531535 * (v25 >> 8)) >> 20));
        v33 = *v32;
        v34 = v32[1];
        *v32 = (_DWORD)v30 + 1;
        v32[1] = v25 >> 8;
        if ((_DWORD)v25 == v28)
        {
          v22 = ((_DWORD)v30 - v27);
          if (v22 < 0x10000 && (_DWORD)v30 != v27)
            break;
        }
        v12 = (_QWORD *)((char *)v12 + 1);
        v36 = v30 + 1;
        v37 = v25 >> 16;
        v38 = (int *)(a6 + 8 * ((-1640531535 * v37) >> 20));
        v39 = *v38;
        v40 = v38[1];
        *v38 = (_DWORD)v36 + 1;
        v38[1] = v37;
        if ((_DWORD)v31 == v34)
        {
          v22 = ((_DWORD)v36 - v33);
          if (v22 < 0x10000 && (_DWORD)v36 != v33)
            break;
        }
        v12 = (_QWORD *)((char *)v12 + 1);
        v42 = v36 + 1;
        if ((_DWORD)v37 == v40)
        {
          v22 = ((_DWORD)v42 - v39);
          if (v22 < 0x10000 && (_DWORD)v42 != v39)
            break;
        }
        v12 = (_QWORD *)((char *)v12 + 1);
        v13 = v42 + 1;
        if ((unint64_t)v12 >= v11)
          goto LABEL_74;
      }
      v44 = (char *)v12 + 4;
      v45 = (_QWORD *)((char *)v12 - v22 + 4);
      while (1)
      {
        v47 = *(_QWORD *)v44;
        v44 += 8;
        v46 = v47;
        v49 = *v45++;
        v48 = v49;
        if (v46 != v49)
          break;
        if ((unint64_t)v44 >= v11)
          goto LABEL_38;
      }
      v44 = &v44[(__clz(__rbit64(v46 ^ v48)) >> 3) - 8];
LABEL_38:
      v50 = (char *)v12 - v22;
      while (1)
      {
        v51 = (uint64_t)v12 <= (uint64_t)v9 || (uint64_t)v50 <= a4;
        if (v51)
          break;
        v53 = *((unsigned __int8 *)v12 - 1);
        v12 = (_QWORD *)((char *)v12 - 1);
        v52 = v53;
        v54 = *--v50;
        if (v52 != v54)
        {
          v12 = (_QWORD *)((char *)v12 + 1);
          break;
        }
      }
      v55 = v44 - (char *)v12 - 4;
      v56 = (char *)v12 - v9;
      v57 = (char *)v12 - v9 + 3;
      v58 = v10 - (_QWORD)v8 - v57;
      if (v10 - (uint64_t)v8 < v57)
        goto LABEL_92;
      v59 = (v55 & 0xF) + 16 * v56;
      v60 = (int32x4_t *)&v8->i8[1];
      if ((unint64_t)v56 >= 0xF)
      {
        v59 |= 0xF0u;
        v61 = v56 - 15;
        v62 = v58-- != 0;
        if (!v62)
          goto LABEL_92;
        if (v61 >= 0xFF)
        {
          v63 = v61 / 0xFFuLL;
          v62 = v58 >= v63;
          v58 -= v63;
          if (!v62)
            goto LABEL_92;
          LOBYTE(v61) = v61 + v63;
          do
          {
            *v60++ = v7;
            v51 = v63 > 0x10;
            v63 -= 16;
          }
          while (v51);
          v60 = (int32x4_t *)((char *)v60 + v63);
        }
        v60->i8[0] = v61;
        v60 = (int32x4_t *)((char *)v60 + 1);
      }
      do
      {
        v64 = *(int32x4_t *)v9;
        v9 += 16;
        *v60++ = v64;
        v51 = v56 <= 16;
        v56 -= 16;
      }
      while (!v51);
      v65 = (__int16 *)((char *)v60->i16 + v56);
      *v65 = v22;
      v66 = (int32x4_t *)(v65 + 1);
      if (v55 >= 0xF)
      {
        v59 |= 0xFu;
        v67 = v44 - (char *)v12 - 19;
        v62 = v58 != 0;
        v68 = v58 - 1;
        if (!v62)
          goto LABEL_92;
        if (v67 >= 0xFF)
        {
          v69 = v67 / 0xFFuLL;
          if (v68 < v69)
            goto LABEL_92;
          LOBYTE(v67) = v67 + v69;
          do
          {
            *v66++ = v7;
            v51 = v69 > 0x10;
            v69 -= 16;
          }
          while (v51);
          v66 = (int32x4_t *)((char *)v66 + v69);
        }
        v66->i8[0] = v67;
        v66 = (int32x4_t *)((char *)v66 + 1);
      }
      v8->i8[0] = v59;
      v8 = v66;
      v9 = v44;
    }
    while ((uint64_t)v44 < v11 && (uint64_t)v66 < v10);
  }
LABEL_74:
  if (a7)
    goto LABEL_92;
  v71 = (char *)(v11 + 128);
  v72 = v71 - v9;
  if (v71 == v9)
    goto LABEL_92;
  v73 = v10 + 128 - (_QWORD)v8 - 1;
  v51 = v73 <= v72;
  v74 = v73 - v72;
  if (v51)
    goto LABEL_92;
  if (v72 < 15)
  {
    v8->i8[0] = 16 * v72;
    v8 = (int32x4_t *)((char *)v8 + 1);
    do
    {
LABEL_91:
      v81 = *v9++;
      v8->i8[0] = v81;
      v8 = (int32x4_t *)((char *)v8 + 1);
    }
    while (v9 < v71);
    goto LABEL_92;
  }
  v75 = v74 - 1;
  if (v75 >= 0)
  {
    v8->i8[0] = -16;
    v76 = (int32x4_t *)&v8->i8[1];
    v77 = v72 - 15;
    if ((unint64_t)(v72 - 15) >= 0xFF)
    {
      v78 = v77 / 0xFFuLL;
      if (v75 - v78 < 0)
      {
        v8 = (int32x4_t *)((char *)v76 - 1);
        goto LABEL_92;
      }
      LOBYTE(v77) = v77 + v78;
      do
      {
        *v76++ = v7;
        v51 = v78 <= 16;
        v78 -= 16;
      }
      while (!v51);
      v76 = (int32x4_t *)((char *)v76 + v78);
    }
    v76->i8[0] = v77;
    v8 = (int32x4_t *)&v76->i8[1];
    v79 = (unint64_t)v72 >> 4;
    if (!((unint64_t)v72 >> 4))
      goto LABEL_91;
    do
    {
      v80 = *(int32x4_t *)v9;
      v9 += 16;
      *v8++ = v80;
      v51 = v79-- <= 1;
    }
    while (!v51);
    if (v9 < v71)
      goto LABEL_91;
  }
LABEL_92:
  *result = v8;
  *a3 = v9;
  return result;
}

uint64_t lz4_decode_asm(int8x16_t **a1, unint64_t a2, unint64_t a3, unsigned __int8 **a4, unint64_t a5)
{
  unsigned __int8 *v5;
  int8x16_t *v6;
  int8x16_t *v7;
  unsigned __int8 *v8;
  _OWORD *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int8x16_t *v14;
  int8x16_t *v15;
  unsigned __int16 *v16;
  int8x16_t *v17;
  int8x16_t *v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t *v21;
  int8x16_t v22;
  int8x16_t v23;
  unint64_t v24;
  unsigned int v25;
  int8x16_t *v26;
  int8x16_t *v27;
  unsigned int v28;
  int8x16_t *v29;
  int8x16_t v30;
  int8x16_t v31;
  uint64_t v32;
  int8x16_t *v33;
  int8x16_t *v34;
  int8x16_t *v35;
  int8x16_t v36;
  int8x16_t *v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t *v40;
  int8x16_t v41;
  int8x16_t *v42;
  int8x16_t *v43;
  int8x16_t v44;
  int8x16_t *v45;
  int8x16_t v46;
  uint64_t v47;

  v5 = *a4;
  v6 = *a1;
  while (1)
  {
    v7 = v6;
    v8 = v5;
    if ((unint64_t)v5 >= a5 || (unint64_t)v6 >= a3)
      break;
    v10 = *v5;
    v9 = v5 + 1;
    v11 = (unint64_t)v10 >> 4;
    v12 = (v10 & 0xF) + 4;
    if (v11 > 0xE)
    {
      while ((unint64_t)v9 < a5)
      {
        v13 = *(unsigned __int8 *)v9;
        v9 = (_OWORD *)((char *)v9 + 1);
        v11 += v13;
        if (v13 != 255)
        {
          v14 = (int8x16_t *)v9;
          v15 = v6;
          v16 = (unsigned __int16 *)((char *)v9 + v11);
          v17 = (int8x16_t *)((char *)v6 + v11);
          if ((unint64_t)v16 < a5 && (unint64_t)v17 < a3)
          {
            v19 = *v14;
            v20 = v14[1];
            v18 = v14 + 2;
            *v15 = v19;
            v15[1] = v20;
            v21 = v15 + 2;
            do
            {
              v22 = *v18;
              v23 = v18[1];
              v18 += 2;
              *v21 = v22;
              v21[1] = v23;
              v21 += 2;
            }
            while (v17 > v21);
            goto LABEL_13;
          }
          goto LABEL_36;
        }
      }
      break;
    }
    *v6 = *(int8x16_t *)v9;
    v16 = (unsigned __int16 *)((char *)v9 + v11);
    v17 = (int8x16_t *)((char *)v6 + v11);
LABEL_13:
    if ((unint64_t)v16 >= a5)
      break;
    v25 = *v16;
    v5 = (unsigned __int8 *)(v16 + 1);
    v24 = v25;
    if (!v25 || (v26 = (int8x16_t *)((char *)v17 - v24), (unint64_t)v17 - v24 < a2))
    {
      v47 = -1;
      goto LABEL_37;
    }
    v27 = v17;
    v6 = (int8x16_t *)((char *)v17 + v12);
    if (v12 == 19)
    {
      while ((unint64_t)v5 < a5)
      {
        v28 = *v5++;
        v6 = (int8x16_t *)((char *)v6 + v28);
        if (v28 != 255)
        {
          if ((unint64_t)v6 >= a3)
            goto LABEL_36;
          goto LABEL_24;
        }
      }
      break;
    }
    if (v12 > 0x10)
    {
LABEL_24:
      if (v24 > 0x1F)
      {
        v36 = *v26;
        v35 = v26 + 1;
        *v27 = v36;
        v37 = v27 + 1;
        do
        {
          v38 = *v35;
          v39 = v35[1];
          v35 += 2;
          *v37 = v38;
          v37[1] = v39;
          v37 += 2;
        }
        while (v6 > v37);
      }
      else if (v24 > 0xF)
      {
        v41 = *v26;
        v40 = v26 + 1;
        *v27 = v41;
        v42 = v27 + 1;
        do
        {
          v44 = *v40;
          v43 = v40 + 1;
          *v42 = v44;
          v45 = v42 + 1;
          v46 = *v43;
          v40 = v43 + 1;
          *v45 = v46;
          v42 = v45 + 1;
        }
        while (v6 > v42);
      }
      else
      {
        v29 = (int8x16_t *)&qword_100035E00[4 * v24];
        v30 = vqtbl1q_s8(*v26, *v29);
        v31 = vqtbl1q_s8(*v26, v29[1]);
        v32 = *((unsigned __int8 *)qword_100036000 + v24);
        *v27 = v30;
        v27[1] = v31;
        v33 = (int8x16_t *)((char *)v27 + v32);
        do
        {
          *v33 = v30;
          v33[1] = v31;
          v34 = (int8x16_t *)((char *)v33 + v32);
          *v34 = v30;
          v34[1] = v31;
          v33 = (int8x16_t *)((char *)v34 + v32);
        }
        while (v6 > v33);
      }
    }
    else if (v24 <= 0xF)
    {
      *v27 = vqtbl1q_s8(*v26, *(int8x16_t *)&qword_100035E00[4 * v24]);
    }
    else
    {
      *v27 = *v26;
    }
  }
LABEL_36:
  v47 = 0;
LABEL_37:
  *a4 = v8;
  *a1 = v7;
  return v47;
}

uint64_t lzfse_decode_lmd(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int8x16_t *v32;
  int8x16_t *v33;
  uint64_t v34;
  uint64_t v35;
  int8x16_t *v36;
  unint64_t v37;
  int8x16_t v38;
  int8x16_t v39;
  uint64_t v40;
  BOOL v41;
  char v42;
  char *v43;
  char v44;

  v1 = *(_QWORD **)(a1 + 24);
  v2 = (uint64_t *)(*(_QWORD *)a1 + *(int *)(a1 + 120));
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(unsigned int *)(a1 + 112);
  v5 = *(unsigned int *)(a1 + 72);
  v6 = *(unsigned int *)(a1 + 88);
  v7 = *(unsigned int *)(a1 + 92);
  v8 = *(unsigned int *)(a1 + 96);
  v9 = *(unsigned __int16 *)(a1 + 124);
  v10 = *(unsigned __int16 *)(a1 + 126);
  v11 = *(unsigned __int16 *)(a1 + 128);
  v12 = *(_QWORD *)(a1 + 40) - (_QWORD)v1 - 32;
  v13 = *(char **)(a1 + 80);
  if (v6 | v7)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 72))
  {
    while (1)
    {
      v2 = (uint64_t *)((char *)v2 - ((unint64_t)(63 - v4) >> 3));
      if ((unint64_t)v2 < *(_QWORD *)(a1 + 8))
        return -3;
      v3 = *v2;
      v14 = (unsigned __int8 *)(a1 + 136 + 8 * v9);
      v15 = *v14;
      v16 = v4 + ((63 - v4) & 0xFFFFFFFFFFFFFFF8) - v15;
      v17 = (unint64_t)*v2 >> v16;
      v18 = v17 & ~(-1 << v15);
      LOBYTE(v15) = v14[1];
      v9 = (v18 >> v15) + *((unsigned __int16 *)v14 + 1);
      v6 = (v17 & ~(-1 << v15)) + *((unsigned int *)v14 + 1);
      v19 = (unsigned __int8 *)(a1 + 648 + 8 * v10);
      v20 = *v19;
      v21 = v16 - v20;
      v22 = (unint64_t)*v2 >> v21;
      v23 = v22 & ~(-1 << v20);
      LOBYTE(v20) = v19[1];
      v10 = (v23 >> v20) + *((unsigned __int16 *)v19 + 1);
      v7 = (v22 & ~(-1 << v20)) + *((unsigned int *)v19 + 1);
      v24 = (unsigned __int8 *)(a1 + 1160 + 8 * v11);
      v25 = *v24;
      v4 = v21 - v25;
      v26 = (unint64_t)*v2 >> v4;
      v27 = v26 & ~(-1 << v25);
      LOBYTE(v25) = v24[1];
      v11 = (v27 >> v25) + *((unsigned __int16 *)v24 + 1);
      v28 = (v26 & ~(-1 << v25)) + *((unsigned int *)v24 + 1);
      if (v28)
        v8 = v28;
      --v5;
LABEL_7:
      if (v8 > (unint64_t)v1 + v6 - *(_QWORD *)(a1 + 32)
        || a1 + *(unsigned int *)(a1 + 7304) + 7308 < (uint64_t)&v13[v6])
      {
        return -3;
      }
      v29 = v12 < (uint64_t)(v6 + v7);
      v12 -= v6 + v7;
      if (v29)
      {
        v40 = v12 + v6 + v7 + 32;
        if (v6)
        {
          do
          {
            v41 = v40-- != 0;
            if (!v41)
              goto LABEL_30;
            v42 = *v13++;
            *(_BYTE *)v1 = v42;
            v1 = (_QWORD *)((char *)v1 + 1);
          }
          while (--v6);
        }
        if (v7)
        {
          v43 = (char *)v1 - v8;
          while (1)
          {
            v41 = v40-- != 0;
            if (!v41)
              break;
            v44 = *v43++;
            *(_BYTE *)v1 = v44;
            v1 = (_QWORD *)((char *)v1 + 1);
            if (!--v7)
              goto LABEL_28;
          }
LABEL_30:
          *(_QWORD *)(a1 + 24) = v1;
          *(_QWORD *)(a1 + 120) = (char *)v2 - *(_QWORD *)a1;
          *(_QWORD *)(a1 + 104) = v3;
          *(_DWORD *)(a1 + 112) = v4;
          *(_DWORD *)(a1 + 72) = v5;
          *(_DWORD *)(a1 + 88) = v6;
          *(_DWORD *)(a1 + 92) = v7;
          *(_DWORD *)(a1 + 96) = v8;
          *(_WORD *)(a1 + 124) = v9;
          *(_WORD *)(a1 + 126) = v10;
          *(_WORD *)(a1 + 128) = v11;
          *(_QWORD *)(a1 + 80) = v13;
          return -2;
        }
LABEL_28:
        v12 = v40 - 32;
        if (!v5)
          goto LABEL_29;
      }
      else
      {
        do
        {
          v30 = *(_QWORD *)v13;
          v31 = *((_QWORD *)v13 + 1);
          v13 += 16;
          *v1 = v30;
          v1[1] = v31;
          v1 += 2;
          v29 = v6 > 0x10;
          v6 -= 16;
        }
        while (v29);
        v32 = (int8x16_t *)((char *)v1 + v6);
        v13 += v6;
        v33 = (int8x16_t *)((char *)v32 - v8);
        if (v8 < 0x10)
        {
          v36 = (int8x16_t *)((char *)&unk_1000494E0 + 32 * v8);
          v37 = byte_1000496E0[v8];
          v38 = vqtbl1q_s8(*v33, *v36);
          v39 = vqtbl1q_s8(*v33, v36[1]);
          do
          {
            *v32 = v38;
            v32[1] = v39;
            v32 = (int8x16_t *)((char *)v32 + v37);
            v29 = v7 > v37;
            v7 -= v37;
          }
          while (v29);
          v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5)
            goto LABEL_29;
        }
        else
        {
          do
          {
            v34 = v33->i64[0];
            v35 = v33->i64[1];
            ++v33;
            v32->i64[0] = v34;
            v32->i64[1] = v35;
            ++v32;
            v29 = v7 > 0x10;
            v7 -= 16;
          }
          while (v29);
          v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5)
            goto LABEL_29;
        }
      }
    }
  }
  else
  {
LABEL_29:
    *(_QWORD *)(a1 + 24) = v1;
    return 0;
  }
}

uint64_t lzfse_decode_literals(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD **a5, unint64_t a6, double a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  int v13;
  _QWORD *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;

  v7 = LOWORD(a7);
  v8 = WORD1(a7);
  v9 = WORD2(a7);
  v10 = HIWORD(a7);
  v12 = *(_QWORD *)a4;
  v13 = *(_DWORD *)(a4 + 8);
  v14 = *a5;
  while (1)
  {
    v15 = *(_DWORD *)(a2 + 4 * v7);
    v16 = *(_DWORD *)(a2 + 4 * v8);
    v17 = *(_DWORD *)(a2 + 4 * v9);
    v18 = *(_DWORD *)(a2 + 4 * v10);
    *a1++ = (v16 & 0xFF00)
          + ((unsigned __int16)(v15 & 0xFF00) >> 8)
          + (((v18 & 0xFF00) + ((unsigned __int16)(v17 & 0xFF00) >> 8)) << 16);
    v19 = (63 - v13) & 0xFFFFFFF8;
    if (((63 - v13) & 0xFFFFFFF8) != 0)
      break;
LABEL_5:
    v20 = v13 - v15;
    v21 = v20 - v16;
    v22 = v12 >> (v13 - v15);
    v23 = v12 & qword_1000363E0[v20];
    v24 = v21 - v17;
    v7 = v22 + HIWORD(v15);
    v25 = v23 >> (v20 - v16);
    v26 = v23 & qword_1000363E0[v21];
    v13 = v24 - v18;
    v8 = v25 + HIWORD(v16);
    v27 = v26 >> (v21 - v17);
    v28 = v26 & qword_1000363E0[v24];
    v9 = v27 + HIWORD(v17);
    v29 = v28 >> (v24 - v18);
    v12 = v28 & qword_1000363E0[v13];
    v10 = v29 + HIWORD(v18);
    v30 = a3 <= 4;
    a3 -= 4;
    if (v30)
    {
      *(_QWORD *)a4 = v12;
      *(_DWORD *)(a4 + 8) = v13;
      *a5 = v14;
      return 0;
    }
  }
  v14 = (_QWORD *)((char *)v14 - (v19 >> 3));
  if ((unint64_t)v14 >= a6)
  {
    v13 += v19;
    v12 = (v12 << v19) | *v14 & qword_1000363E0[v19];
    goto LABEL_5;
  }
  return -3;
}

void sub_1000365E8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_10003665C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_sik_attest failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000366BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_ref_key_sign failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003671C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "ccder_decode_tl failed", a5, a6, a7, a8, 0);
  sub_1000023F0();
}

void sub_10003674C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_ref_key_verify_sig failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000367AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "Failed to retrieve PKA state.", a5, a6, a7, a8, 0);
  sub_1000023F0();
}

void sub_1000367DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "aks_params_create failed", a5, a6, a7, a8, 0);
  sub_1000023F0();
}

void sub_10003680C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_ref_key_create failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003686C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_params_get_der failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000368CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_params_set_number failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003692C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002408();
  sub_1000023E0((void *)&_mh_execute_header, v0, v1, "aks_ref_key_create_with_blob failed: %d", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003698C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "Failed to get delta components: %@", a5, a6, a7, a8, 2u);
}

void sub_1000369F4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported strong component", buf, 2u);
}

void sub_100036A30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Missing key blob", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036A5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Empty payload", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036A88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Create RIK failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036AB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get digest failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036AE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Missing RIK", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036B0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Failed to get attestation", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036B38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Failed to get pub key", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036B64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "No baa certs found", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036B90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "DeviceIdentityIssueClientCertificateWithCompletion timeout", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036BBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "DeviceIdentityIssueClientCertificateWithCompletion failed with no certificates", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036BE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "DeviceIdentityIssueClientCertificateWithCompletion failed: %@", a5, a6, a7, a8, 2u);
}

void sub_100036C50(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = CFSTR("/var/hardware/Pearl");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete directory %@, error: %@", (uint8_t *)&v2, 0x16u);
  sub_100006680();
}

void sub_100036CD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "Failed to delete Yonkers.fw, error: %@", a5, a6, a7, a8, 2u);
  sub_100006680();
}

void sub_100036D38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "Failed to delete Savage.fw, error: %@", a5, a6, a7, a8, 2u);
  sub_100006680();
}

void sub_100036D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036DC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036E20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006694(__stack_chk_guard);
  sub_100006688();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "Failed to create SavageUpdater: %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100036ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006694(__stack_chk_guard);
  sub_100006688();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "SavageUpdaterExecCommand failed: %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100036F38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get Brunor ticket failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100036F64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "powerCycleSensor failed with error: %@", a5, a6, a7, a8, 2u);
  sub_100006680();
}

void sub_100036FC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006694(__stack_chk_guard);
  sub_100006688();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "SavageUpdater failed with error: %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100037028()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Get Yonkers ticket failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006694(__stack_chk_guard);
  sub_100006688();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "Failed to get local psd3, error: %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_1000370E0(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to verify psd3, pearlStatus: %d", (uint8_t *)v2, 8u);
  sub_1000023F0();
}

void sub_100037150(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "Unable to setup FS for repair", a5, a6, a7, a8, 0);
}

void sub_100037184(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "Unable to create CRFDRSeal with parameters: %@", a5, a6, a7, a8, 2u);
  sub_100006680();
}

void sub_1000371E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "FDR Seal failed: %@", a5, a6, a7, a8, 2u);
  sub_100006680();
}

void sub_10003724C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003FC0((void *)&_mh_execute_header, a2, a3, "FDR Seal failed: %ld", a5, a6, a7, a8, 0);
  sub_100006680();
}

void sub_1000372B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000023F8((void *)&_mh_execute_header, a1, a3, "Failed to setup alternative FDR path", a5, a6, a7, a8, 0);
}

void sub_1000372E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid action", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid daemon label", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003733C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008230();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "Missing entitlement for controlling daemon %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_10003739C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid domain name", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000373C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid preference key", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000373F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid preference value", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037420()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008230();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "Missing entitlement for accessing defaults of domain %@", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100037480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Failed to find libxpc API", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000374AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Unsupported action", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000374D8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  uint64_t v3;

  sub_100008230();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_10000821C((void *)&_mh_execute_header, v0, v1, "%s: error %lld", v2, v3);
  sub_100006680();
}

void sub_100037544()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_100008230();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_10000821C((void *)&_mh_execute_header, v1, v2, "%s service already %s", v3, v4);
  sub_100006680();
}

void sub_1000375CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "dlopen failed", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000375F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008230();
  sub_100003FC0((void *)&_mh_execute_header, v0, v1, "dlsym(%s) failed", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100037658(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to read asset %@: %@", (uint8_t *)&v6, 0x16u);

}

void sub_100037708(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get delta components: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003777C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SSR not supported", v1, 2u);
}

void sub_1000377BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Test sequencer is already running", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_1000377E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "No running test found", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "No test result", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037840()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Invalid test result", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_10003786C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003FB4();
  sub_1000023F8((void *)&_mh_execute_header, v0, v1, "Test result is not for the running test", v2, v3, v4, v5, v6);
  sub_1000023F0();
}

void sub_100037898()
{
  __assert_rtn("_AMAuthInstallFinalize", "AMAuthInstall.c", 686, "type != NULL");
}

void sub_1000378C0()
{
  __assert_rtn("_AMAuthInstallCopyFormattingDescription", "AMAuthInstall.c", 741, "type != NULL");
}

void sub_1000378E8()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100008230();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}s", v1, 0xCu);
  sub_100006680();
}

void sub_100037954()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100008230();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s", v1, 0xCu);
  sub_100006680();
}

void sub_1000379C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008230();
  sub_1000176E0((void *)&_mh_execute_header, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100037A20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008230();
  sub_1000176E0((void *)&_mh_execute_header, v0, v1, "%s", v2, v3, v4, v5, v6);
  sub_100006680();
}

void sub_100037A80()
{
  __assert_rtn("_AMAuthInstallPlatformTempDirURLInitialize", "AMAuthInstallPlatform.c", 714, "_tempDirURL != NULL");
}

id objc_msgSend_PrCL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PrCL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__componentNameSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_componentNameSuffix");
}

id objc_msgSend__copyCombinedFDRData_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyCombinedFDRData:withError:");
}

id objc_msgSend__propertyNameSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_propertyNameSuffix");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
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

id objc_msgSend_addSubfileWithTagName_subfileData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubfileWithTagName:subfileData:");
}

id objc_msgSend_addSubfiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubfiles:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asDictionary");
}

id objc_msgSend_attestationBlob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attestationBlob");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bcrtSign_outSignature_outDeviceNonce_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bcrtSign:outSignature:outDeviceNonce:outError:");
}

id objc_msgSend_boardID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boardID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootNonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bootNonce");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_byteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "byteString");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_challengeStrongComponents_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challengeStrongComponents:withReply:");
}

id objc_msgSend_char1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "char1");
}

id objc_msgSend_char2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "char2");
}

id objc_msgSend_char3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "char3");
}

id objc_msgSend_char4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "char4");
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipID");
}

id objc_msgSend_cleanupFileSystemForRepair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupFileSystemForRepair");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeTestSuite_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeTestSuite:description:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_composeTSSRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeTSSRequest:");
}

id objc_msgSend_composeTSSRequest_asMeasurement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeTSSRequest:asMeasurement:");
}

id objc_msgSend_configureDataWriteDestination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureDataWriteDestination");
}

id objc_msgSend_configureFileHandleWriteDestinationForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureFileHandleWriteDestinationForURL:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_convertDataToHexInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertDataToHexInDictionary:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "create");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createFileHandleForWritingToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileHandleForWritingToURL:");
}

id objc_msgSend_createWithKeyBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithKeyBlob:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataLength");
}

id objc_msgSend_dataPointer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataPointer");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_decodeBytesForKey_returnedLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBytesForKey:returnedLength:");
}

id objc_msgSend_decodeCharForKey_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeCharForKey:key:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decompressPearlFrames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decompressPearlFrames");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceSupportsRepairBootIntent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportsRepairBootIntent");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digest");
}

id objc_msgSend_doLaunchControl_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doLaunchControl:action:");
}

id objc_msgSend_doRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doRetry");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dumpString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpString");
}

id objc_msgSend_ecID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ecID");
}

id objc_msgSend_enableSSO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSSO:");
}

id objc_msgSend_encodeBytes_length_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBytes:length:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expandMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expandMetaData:");
}

id objc_msgSend_expandSuperBinary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expandSuperBinary");
}

id objc_msgSend_expandTLVs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expandTLVs");
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportedInterface");
}

id objc_msgSend_factoryServiceOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "factoryServiceOn");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForWritingToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingToURL:error:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_fileValidForOffset_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileValidForOffset:length:");
}

id objc_msgSend_findUnsealedDataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findUnsealedDataWithError:");
}

id objc_msgSend_firmwareKeyFromBuildIdentityDict_deviceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareKeyFromBuildIdentityDict:deviceInfo:");
}

id objc_msgSend_generateHashForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateHashForData:");
}

id objc_msgSend_generateHashForSubfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateHashForSubfile:");
}

id objc_msgSend_generatePersonalizedSuperBinary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePersonalizedSuperBinary");
}

id objc_msgSend_generatePersonalizedSuperBinaryInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePersonalizedSuperBinaryInternal:");
}

id objc_msgSend_generateRequestDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateRequestDictionary");
}

id objc_msgSend_generateTLV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateTLV");
}

id objc_msgSend_generateTatsuMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateTatsuMeasurements:");
}

id objc_msgSend_generateTatsuMeasurementsPerPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateTatsuMeasurementsPerPayload:");
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generation");
}

id objc_msgSend_getAllowedListFromEntitlements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllowedListFromEntitlements:");
}

id objc_msgSend_getBrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBrunorTicketForBrunorFWUpdateWithOptions:BrunorTicket:auth:error:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultAMAuthInstallRef");
}

id objc_msgSend_getInnermostNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInnermostNSError:");
}

id objc_msgSend_getLibXPCInternalWithSymbol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLibXPCInternalWithSymbol:");
}

id objc_msgSend_getRepairTicket_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRepairTicket:error:");
}

id objc_msgSend_getSavageTicketForZenithSavageFWUpdateWithOptions_SavageTicket_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSavageTicketForZenithSavageFWUpdateWithOptions:SavageTicket:error:");
}

id objc_msgSend_getYonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getYonkersTicketForZenithYonkersFWUpdateWithOptions:YonkersTicket:error:");
}

id objc_msgSend_handleResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResult:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hasMesa(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMesa");
}

id objc_msgSend_hasMesaDelta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMesaDelta");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFile");
}

id objc_msgSend_initTestSequence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initTestSequence");
}

id objc_msgSend_initWithAuthInstallObj_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthInstallObj:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChar1_char2_char3_char4_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChar1:char2:char3:char4:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:delegate:delegateQueue:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_metaData_tag_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:metaData:tag:version:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithHardwareInfo_componentName_objectName_nonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHardwareInfo:componentName:objectName:nonce:");
}

id objc_msgSend_initWithID_type_iconLocator_localizedTitle_localizedSubtitle_imageLocators_instructions_instructionsStyle_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:");
}

id objc_msgSend_initWithId_suiteNameLocalizedString_suiteDescriptionLocalizedString_estimatedCompletionTimeLocalizedString_primaryAssetLocator_secondaryAssetLocator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithId:suiteNameLocalizedString:suiteDescriptionLocalizedString:estimatedCompletionTimeLocalizedString:primaryAssetLocator:secondaryAssetLocator:");
}

id objc_msgSend_initWithKeyBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeyBlob:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMajorVersion_minorVersion_releaseVersion_buildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:");
}

id objc_msgSend_initWithOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:error:");
}

id objc_msgSend_initWithParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParameters:");
}

id objc_msgSend_initWithServiceName_entitlements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:entitlements:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTag_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTag:data:");
}

id objc_msgSend_initWithTag_dataPointer_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTag:dataPointer:dataLength:");
}

id objc_msgSend_initWithType_length_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:length:value:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileExistsError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileExistsError");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isSSRBootIntentSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSSRBootIntentSet");
}

id objc_msgSend_issueRepairCert_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "issueRepairCert:withReply:");
}

id objc_msgSend_keyBlob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyBlob");
}

id objc_msgSend_keyWithPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyWithPrefix:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastRunTestId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRunTestId");
}

id objc_msgSend_lastRunTestIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRunTestIndex");
}

id objc_msgSend_lastTestStatusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastTestStatusCode");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_life(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "life");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithKey:");
}

id objc_msgSend_log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log:");
}

id objc_msgSend_logInternal_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logInternal:arguments:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longname");
}

id objc_msgSend_magic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magic");
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorVersion");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifest");
}

id objc_msgSend_manifestEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestEpoch");
}

id objc_msgSend_manifestSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestSuffix");
}

id objc_msgSend_measurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "measurements");
}

id objc_msgSend_metaDataTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metaDataTable");
}

id objc_msgSend_metaDataTableEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metaDataTableEntry");
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minorVersion");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsHostPersonalization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsHostPersonalization");
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonce");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrides");
}

id objc_msgSend_parseOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseOptions:");
}

id objc_msgSend_partSPC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partSPC");
}

id objc_msgSend_patchItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchItems");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_payloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadData");
}

id objc_msgSend_payloadWith4ccTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadWith4ccTag:");
}

id objc_msgSend_personalizedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personalizedData");
}

id objc_msgSend_personalizedMetaData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personalizedMetaData");
}

id objc_msgSend_powerCycleSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerCycleSensor:");
}

id objc_msgSend_prefixNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefixNeedsLogicalUnitNumber");
}

id objc_msgSend_preparePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preparePayload:");
}

id objc_msgSend_processMeasurementsForTSSOptions_unitNumber_asMeasurement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMeasurementsForTSSOptions:unitNumber:asMeasurement:");
}

id objc_msgSend_processTLVsForPersonalization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processTLVsForPersonalization");
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productionMode");
}

id objc_msgSend_promptContinue_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptContinue:withContext:");
}

id objc_msgSend_provisioning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisioning");
}

id objc_msgSend_prpcSign_outSignature_outDeviceNonce_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prpcSign:outSignature:outDeviceNonce:outError:");
}

id objc_msgSend_pubKeyBlob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pubKeyBlob");
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purge");
}

id objc_msgSend_queryRepairDeltaWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryRepairDeltaWithReply:");
}

id objc_msgSend_queryTatsuSigningServer_ssoOnly_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryTatsuSigningServer:ssoOnly:error:");
}

id objc_msgSend_releaseVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseVersion");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeSubfileWithTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSubfileWithTag:");
}

id objc_msgSend_requestBAACertificates_apticket_proxySettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestBAACertificates:apticket:proxySettings:");
}

id objc_msgSend_requiredTSSOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiredTSSOptions");
}

id objc_msgSend_resultData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultData");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rik(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rik");
}

id objc_msgSend_rk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rk");
}

id objc_msgSend_rtKitKeyFromBuildIdentityDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtKitKeyFromBuildIdentityDict:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_run_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run:withContext:");
}

id objc_msgSend_runningSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningSemaphore");
}

id objc_msgSend_safeGetStringParam_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeGetStringParam:key:");
}

id objc_msgSend_seal_oldSealingManifest_newSealingManifest_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seal:oldSealingManifest:newSealingManifest:stats:");
}

id objc_msgSend_securityDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityDomain");
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityMode");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_setAllowFactoryReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowFactoryReset:");
}

id objc_msgSend_setAssetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetID:");
}

id objc_msgSend_setBoardID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoardID:");
}

id objc_msgSend_setChipEpoch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChipEpoch:");
}

id objc_msgSend_setChipID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChipID:");
}

id objc_msgSend_setChipRevision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChipRevision:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDemote:");
}

id objc_msgSend_setDigest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDigest:");
}

id objc_msgSend_setDoRetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoRetry:");
}

id objc_msgSend_setEcID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEcID:");
}

id objc_msgSend_setEnableMixMatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableMixMatch:");
}

id objc_msgSend_setEpro_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEpro:");
}

id objc_msgSend_setEsec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEsec:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFactoryServiceOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFactoryServiceOn:");
}

id objc_msgSend_setFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilename:");
}

id objc_msgSend_setHashAlgorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHashAlgorithm:");
}

id objc_msgSend_setIsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRequired:");
}

id objc_msgSend_setLastRunTestId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRunTestId:");
}

id objc_msgSend_setLastRunTestIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRunTestIndex:");
}

id objc_msgSend_setLastTestStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastTestStatusCode:");
}

id objc_msgSend_setLife_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLife:");
}

id objc_msgSend_setLiveNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveNonce:");
}

id objc_msgSend_setLogicalUnitNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogicalUnitNumber:");
}

id objc_msgSend_setLongname_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLongname:");
}

id objc_msgSend_setManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifest:");
}

id objc_msgSend_setManifestEpoch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestEpoch:");
}

id objc_msgSend_setManifestSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestSuffix:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonce:");
}

id objc_msgSend_setNonceHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonceHash:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrides:");
}

id objc_msgSend_setPartSPC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPartSPC:");
}

id objc_msgSend_setPatchItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPatchItems:");
}

id objc_msgSend_setPayloadIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadIndex:");
}

id objc_msgSend_setPrCL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrCL:");
}

id objc_msgSend_setPrefixNeedsLogicalUnitNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefixNeedsLogicalUnitNumber:");
}

id objc_msgSend_setProductionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductionMode:");
}

id objc_msgSend_setProvisioning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProvisioning:");
}

id objc_msgSend_setReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceiver:");
}

id objc_msgSend_setResultData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultData:");
}

id objc_msgSend_setRik_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRik:");
}

id objc_msgSend_setRunningSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningSemaphore:");
}

id objc_msgSend_setSecurityDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecurityDomain:");
}

id objc_msgSend_setSecurityMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecurityMode:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStarted:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setSuffixNeedsLogicalUnitNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuffixNeedsLogicalUnitNumber:");
}

id objc_msgSend_setSuiteId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuiteId:");
}

id objc_msgSend_setSuiteResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuiteResult:");
}

id objc_msgSend_setTLVs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTLVs:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTestContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestContext:");
}

id objc_msgSend_setTestId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestId:");
}

id objc_msgSend_setTestSequence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestSequence:");
}

id objc_msgSend_setTestSequencer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestSequencer:");
}

id objc_msgSend_setTestSequencerQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestSequencerQueue:");
}

id objc_msgSend_setTicketNeedsLogicalUnitNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTicketNeedsLogicalUnitNumber:");
}

id objc_msgSend_setTicketPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTicketPrefix:");
}

id objc_msgSend_setTrusted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrusted:");
}

id objc_msgSend_setTrustedOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrustedOverride:");
}

id objc_msgSend_setTssOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTssOption:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupAlternativeFDRPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAlternativeFDRPath:");
}

id objc_msgSend_setupFileSystemForRepair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupFileSystemForRepair");
}

id objc_msgSend_sha256Data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha256Data:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSingleton");
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPersonalizeWithSSOByDefault");
}

id objc_msgSend_shouldRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRun:");
}

id objc_msgSend_showInstructionalPrompt_withConfirmation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showInstructionalPrompt:withConfirmation:");
}

id objc_msgSend_sign_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sign:");
}

id objc_msgSend_sign_keyBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sign:keyBlob:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListening");
}

id objc_msgSend_startTest_parameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTest:parameters:");
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "started");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subfileWithTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subfileWithTag:");
}

id objc_msgSend_subfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subfiles");
}

id objc_msgSend_suffixNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suffixNeedsLogicalUnitNumber");
}

id objc_msgSend_suiteId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suiteId");
}

id objc_msgSend_suiteResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suiteResult");
}

id objc_msgSend_superbinary_logString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superbinary:logString:");
}

id objc_msgSend_supportHarvestPearl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportHarvestPearl");
}

id objc_msgSend_supportLiDAR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportLiDAR");
}

id objc_msgSend_supportPeCoNet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportPeCoNet");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag");
}

id objc_msgSend_tatsuMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tatsuMeasurements:");
}

id objc_msgSend_tcrtSign_outSignature_outDeviceNonce_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tcrtSign:outSignature:outDeviceNonce:outError:");
}

id objc_msgSend_testContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testContext");
}

id objc_msgSend_testId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testId");
}

id objc_msgSend_testSequence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testSequence");
}

id objc_msgSend_testSequencer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testSequencer");
}

id objc_msgSend_testSequencerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testSequencerQueue");
}

id objc_msgSend_ticketName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketName");
}

id objc_msgSend_ticketNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketNeedsLogicalUnitNumber");
}

id objc_msgSend_ticketPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketPrefix");
}

id objc_msgSend_tlvFromPropertyListValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvFromPropertyListValue:");
}

id objc_msgSend_tlvFromType_length_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvFromType:length:value:");
}

id objc_msgSend_tlvType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvType");
}

id objc_msgSend_tlvTypeName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvTypeName:");
}

id objc_msgSend_tlvValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvValue");
}

id objc_msgSend_tlvValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvValue:");
}

id objc_msgSend_tlvWithLength_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvWithLength:value:");
}

id objc_msgSend_tlvs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlvs");
}

id objc_msgSend_trusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trusted");
}

id objc_msgSend_tssKeyName_unitNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tssKeyName:unitNumber:");
}

id objc_msgSend_tssOption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tssOption");
}

id objc_msgSend_tssRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tssRequest");
}

id objc_msgSend_uarpWriteData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uarpWriteData:error:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_update_testIndex_testResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update:testIndex:testResult:");
}

id objc_msgSend_updateBrunorDATFirmware(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBrunorDATFirmware");
}

id objc_msgSend_updateSavageDATFirmware(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSavageDATFirmware");
}

id objc_msgSend_updateTestSuiteProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTestSuiteProgress:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_vcrtSign_outSignature_outDeviceNonce_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vcrtSign:outSignature:outDeviceNonce:outError:");
}

id objc_msgSend_verboseLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verboseLog:");
}

id objc_msgSend_verify_signature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verify:signature:");
}

id objc_msgSend_verify_signature_keyBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verify:signature:keyBlob:");
}

id objc_msgSend_verifyPSD3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyPSD3");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_warnings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnings");
}

id objc_msgSend_writeBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytes:length:");
}

id objc_msgSend_writeToData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToData");
}

id objc_msgSend_writeToDestination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToDestination");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
