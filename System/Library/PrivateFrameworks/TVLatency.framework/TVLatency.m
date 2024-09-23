uint64_t _IPv4ToHostByteOrder(void *a1)
{
  int v1;
  unsigned int v2;
  unsigned int v4;

  v4 = 0;
  v1 = inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), &v4);
  v2 = bswap32(v4);
  if (v1 == 1)
    return v2;
  else
    return 0;
}

id _IPv6ToHostByteOrder(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _OWORD *v4;
  id v5;
  __int128 v7;

  v7 = 0uLL;
  v1 = 0;
  if (inet_pton(30, (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), &v7) == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v2;
    if (v7 == 254 && (BYTE1(v7) & 0xC0) == 0x80)
    {
      v3 = objc_retainAutorelease(v2);
      v4 = (_OWORD *)objc_msgSend(v3, "mutableBytes");
      *v4 = v7;
      v5 = objc_retainAutorelease(v3);
      *(_BYTE *)(objc_msgSend(v5, "mutableBytes") + 2) = 0;
      v1 = objc_retainAutorelease(v5);
      *(_BYTE *)(objc_msgSend(v1, "mutableBytes") + 3) = 0;
    }
  }
  return v1;
}

id _IPAddress(int a1, void *a2)
{
  id v3;
  int v4;
  char *v5;
  ifaddrs *v6;
  void *v7;
  const sockaddr *ifa_addr;
  void *v9;
  ifaddrs *v11;
  char v12[1025];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0;
  v4 = getifaddrs(&v11);
  v5 = 0;
  v6 = v11;
  if (!v4 && v11)
  {
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6->ifa_name);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v3))
      {
        ifa_addr = v6->ifa_addr;
        if (ifa_addr->sa_family == a1 && !getnameinfo(ifa_addr, ifa_addr->sa_len, v12, 0x401u, 0, 0, 2))
          break;
      }
      v6 = v6->ifa_next;

      if (!v6)
      {
        v5 = 0;
        goto LABEL_9;
      }
    }

    v5 = v12;
LABEL_9:
    v6 = v11;
  }
  if (v6)
    MEMORY[0x2207C5938](v6);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_21F2AE0EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F2AE234(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21F2AE6D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21F2AE7CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F2AEB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_21F2AF030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21F2AF6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2AFD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3(id a1)
{
  return a1;
}

void sub_21F2B07C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t softBKSHIDServicesRequestProximityDetectionMode(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr;
  v9 = getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr;
  if (!getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke;
    v5[3] = &unk_24E3E9750;
    v5[4] = &v6;
    __getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)softBKSHIDServicesRequestProximityDetectionMode_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2(a1);
}

void sub_21F2B14F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void *__getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)BackBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)BackBoardServicesLibraryCore_frameworkLibrary;
    if (!BackBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BKSHIDServicesRequestProximityDetectionMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void _UnregisterHIDSystemClient(void *a1)
{
  _QWORD *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = a1;
  if (v1[1])
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v2 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21F2AB000, v2, OS_LOG_TYPE_INFO, "UnregisterHIDSystemClient", v3, 2u);
    }
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    IOHIDEventSystemClientUnregisterEventCallback();
    v1[1] = 0;
  }

}

void _ALSIOHIDEventCallback(void *a1, uint64_t a2, __IOHIDServiceClient *a3)
{
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  const __CFArray *Children;
  uint64_t DataValue;
  _OWORD *v22;
  unsigned int v23;
  NSObject *v24;
  float v25;
  float v26;
  float v27;
  TVLALSData *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  double v40;
  uint64_t v41;
  int *v42;
  int v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  unint64_t v48;
  BOOL v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD v60[2];
  uint8_t v61[4];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if (_TVLLogDefault_onceToken_2 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  v5 = _TVLLogDefault_log_2;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2AB000, v5, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback", buf, 2u);
  }
  v6 = a1;
  if (IOHIDEventGetType() == 12)
  {
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207C5BC0](*((_QWORD *)v6 + 2));
    if (a3)
    {
      v8 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("LocationID"));
      v9 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("Built-In"));
      if (v8 && objc_msgSend(v8, "intValue"))
        objc_msgSend(v8, "intValue");
      if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
      {
        IOHIDEventGetFloatValue();
        v11 = v10;
        IOHIDEventGetDoubleValue();
        v13 = v12;
        IOHIDEventGetDoubleValue();
        v15 = v14;
        IOHIDEventGetDoubleValue();
        v17 = v16;
        IOHIDEventGetDoubleValue();
        v19 = v18;
        v59 = 0u;
        memset(v60, 0, 25);
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        *(_OWORD *)buf = 0u;
        v54 = 0u;
        Children = (const __CFArray *)IOHIDEventGetChildren();
        v52 = v9;
        if (Children)
        {
          if (CFArrayGetValueAtIndex(Children, 0))
          {
            DataValue = IOHIDEventGetDataValue();
            if (DataValue)
            {
              v22 = (_OWORD *)DataValue;
              if (IOHIDEventGetIntegerValue() == 137)
              {
                v58 = v22[5];
                v59 = v22[6];
                v60[0] = v22[7];
                *(_OWORD *)((char *)v60 + 9) = *(_OWORD *)((char *)v22 + 121);
                v54 = v22[1];
                v55 = v22[2];
                v56 = v22[3];
                v57 = v22[4];
                *(_OWORD *)buf = *v22;
                v23 = buf[4];
LABEL_28:
                v28 = objc_alloc_init(TVLALSData);
                v25 = v13;
                *(float *)&v29 = v25;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setX:](v28, "setX:", v30);

                v26 = v15;
                *(float *)&v31 = v26;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setY:](v28, "setY:", v32);

                v27 = v17;
                *(float *)&v33 = v27;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setZ:](v28, "setZ:", v34);

                *(float *)&v35 = v11;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setLux:](v28, "setLux:", v36);

                *(float *)&v37 = v19;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setCct:](v28, "setCct:", v38);

                v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                if (v23)
                {
                  v41 = v23;
                  v42 = (int *)&v54 + 3;
                  do
                  {
                    v43 = *v42++;
                    LODWORD(v40) = v43;
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "addObject:", v44);

                    --v41;
                  }
                  while (v41);
                }
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVLALSData setChannelData:](v28, "setChannelData:", v45);

                if (_TVLLogDefault_onceToken_2 != -1)
                  dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
                v9 = v52;
                v46 = _TVLLogDefault_log_2;
                if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
                {
                  v47 = *((_QWORD *)v6 + 4);
                  *(_DWORD *)v61 = 134217984;
                  v62 = v47;
                  _os_log_impl(&dword_21F2AB000, v46, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback store ALS result (remaining count=%lu)", v61, 0xCu);
                }
                objc_msgSend(*((id *)v6 + 3), "addObject:", v28);
                v48 = *((_QWORD *)v6 + 4);
                v49 = v48 > 1;
                v50 = v48 - 1;
                if (v49)
                {
                  *((_QWORD *)v6 + 4) = v50;
                }
                else
                {
                  *((_QWORD *)v6 + 4) = 0;
                  if (v7)
                  {
                    v51 = (void *)objc_msgSend(*((id *)v6 + 3), "copy");
                    ((void (**)(_QWORD, void *))v7)[2](v7, v51);

                  }
                }

LABEL_40:
                goto LABEL_41;
              }
              if (_TVLLogDefault_onceToken_2 != -1)
                dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
              if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_FAULT))
                _ALSIOHIDEventCallback_cold_1();
            }
          }
        }
        v23 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v24 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2AB000, v24, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback external event", buf, 2u);
    }
    if (v7)
      v7[2](v7, 0);
    goto LABEL_40;
  }
LABEL_41:

}

id _TVLLogDefault()
{
  if (_TVLLogDefault_onceToken_2 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  return (id)_TVLLogDefault_log_2;
}

void sub_21F2B3B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFTypeID __isInternalBuild_block_invoke()
{
  CFTypeID result;
  const __CFBoolean *v1;
  CFTypeID v2;

  result = MGCopyAnswer();
  if (result)
  {
    v1 = (const __CFBoolean *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    result = CFBooleanGetTypeID();
    if (v2 == result)
    {
      result = CFBooleanGetValue(v1);
      isInternalBuild_internalBuild = (_DWORD)result != 0;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void print_HmClData(uint64_t a1, os_log_t oslog)
{
  uint64_t v3;
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
  uint64_t v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  long double v43;
  long double v44;
  long double v45;
  long double v46;
  unint64_t v47;
  double v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  double v54;
  unint64_t v55;
  double v56;
  uint64_t i;
  unsigned int v58;
  unsigned int v59;
  unint64_t v60;
  double v61;
  unint64_t v62;
  unsigned int v63;
  double v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  char v81[15];
  char v82;
  char v83[15];
  char v84;
  char v85[15];
  uint8_t buf[4];
  double v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    print_HmClData_cold_1();
  v3 = a1;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_16();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_15();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_14(v3, oslog);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_13();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_12();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_11();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_10();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_9();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_8();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_7(v3, oslog, v4, v5, v6, v7, v8, v9);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_6(v3, oslog, v10, v11, v12, v13, v14, v15);
  v16 = 0;
  v76 = v3 + 204;
  v77 = v3 + 96;
  v74 = v3 + 228;
  v75 = v3 + 216;
  v72 = v3 + 240;
  v73 = v3 + 234;
  v78 = v3 + 288;
  v70 = v3 + 300;
  v71 = v3 + 264;
  v69 = v3 + 324;
  v17 = 1;
  do
  {
    v79 = v17;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v34 = *(unsigned __int8 *)(v3 + 5080 * v16 + 76);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v34;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "source:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v35 = *(unsigned __int8 *)(v3 + 5080 * v16 + 77);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v35;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "algo_version:       %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v36 = *(unsigned __int16 *)(v3 + 5080 * v16 + 78);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v36;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "size:               %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v37 = *(unsigned __int8 *)(v3 + 5080 * v16 + 80);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v37;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "numChannels:        %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v38 = *(unsigned __int8 *)(v3 + 5080 * v16 + 81);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v38;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "numGains:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v39 = *(unsigned __int16 *)(v3 + 5080 * v16 + 82);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v39;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "slow_int:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v40 = *(unsigned __int16 *)(v3 + 5080 * v16 + 84);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v40;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "fast_int:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v41 = *(unsigned __int16 *)(v3 + 5080 * v16 + 86);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v41;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "rapid_int:          %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v42 = *(unsigned __int16 *)(v3 + 5080 * v16 + 88);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v42;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "occlusion_int:      %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v43 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v16 + 90));
      *(_DWORD *)buf = 134217984;
      v87 = v43;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "slow_gain:           %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v44 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v16 + 91));
      *(_DWORD *)buf = 134217984;
      v87 = v44;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "fast_gain:           %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v45 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v16 + 92));
      *(_DWORD *)buf = 134217984;
      v87 = v45;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "rapid_gain:          %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v46 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v16 + 93));
      *(_DWORD *)buf = 134217984;
      v87 = v46;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "occlusion_gain:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = *(_WORD *)(v3 + 5080 * v16 + 94);
      *(_DWORD *)buf = 134217984;
      v87 = (float)((float)v18 * 0.000061035);
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "lux_correction:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      print_HmClData_cold_5(&v84, v85);
    v19 = v3 + 5080 * v16;
    v21 = *(unsigned __int8 *)(v19 + 80);
    v20 = (_BYTE *)(v19 + 80);
    if (v21)
    {
      v22 = 0;
      v23 = v16;
      v24 = 5080 * v16;
      v25 = v3;
      v26 = (unsigned __int8 *)(v3 + v24 + 81);
      v27 = v77 + v24;
      do
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v87) = v22;
          _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "\tch%d: ", buf, 8u);
        }
        v28 = *v26;
        if (*v26)
        {
          v29 = 0;
          do
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v30) = *(_WORD *)(v27 + 2 * v29);
              *(_DWORD *)buf = 134217984;
              v87 = (float)((float)v30 * 0.000061035);
              _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
              v28 = *v26;
            }
            ++v29;
          }
          while (v29 < v28);
        }
        ++v22;
        v31 = *v20;
        v27 += 18;
      }
      while (v22 < v31);
      v3 = v25;
      v16 = v23;
    }
    else
    {
      LODWORD(v31) = 0;
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "azOffset: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_75;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_75;
    }
    v32 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v33 = *(__int16 *)(v76 + 5080 * v16 + 2 * v32);
        *(_DWORD *)buf = 67109120;
        LODWORD(v87) = v33;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v31) = *v20;
      }
      ++v32;
    }
    while (v32 < v31);
LABEL_75:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "adcOffset: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_83;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_83;
    }
    v47 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v48 = (float)((float)*(__int16 *)(v75 + 5080 * v16 + 2 * v47) * 0.0039062);
        *(_DWORD *)buf = 134217984;
        v87 = v48;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v31) = *v20;
      }
      ++v47;
    }
    while (v47 < v31);
LABEL_83:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "darkCounts: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_91;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_91;
    }
    v49 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v50 = *(unsigned __int8 *)(v74 + 5080 * v16 + v49);
        *(_DWORD *)buf = 67109120;
        LODWORD(v87) = v50;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v31) = *v20;
      }
      ++v49;
    }
    while (v49 < v31);
LABEL_91:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "backlightCounts: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_99;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_99;
    }
    v51 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v52 = *(char *)(v73 + 5080 * v16 + v51);
        *(_DWORD *)buf = 67109120;
        LODWORD(v87) = v52;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v31) = *v20;
      }
      ++v51;
    }
    while (v51 < v31);
LABEL_99:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "luxCoeff: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_107;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_107;
    }
    v53 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v54 = (float)((float)*(int *)(v72 + 5080 * v16 + 4 * v53) * 0.000015259);
        *(_DWORD *)buf = 134217984;
        v87 = v54;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v31) = *v20;
      }
      ++v53;
    }
    while (v53 < v31);
LABEL_107:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "cctCoeff: ", buf, 2u);
      LODWORD(v31) = *v20;
      if (!*v20)
        goto LABEL_115;
    }
    else if (!(_DWORD)v31)
    {
      goto LABEL_115;
    }
    v55 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v56 = (float)((float)*(int *)(v71 + 5080 * v16 + 4 * v55) * 0.000015259);
        *(_DWORD *)buf = 134217984;
        v87 = v56;
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v31) = *v20;
      }
      ++v55;
    }
    while (v55 < v31);
LABEL_115:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      print_HmClData_cold_4(&v82, v83);
    for (i = 0; i != 8; i += 2)
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v58) = *(_WORD *)(v78 + 5080 * v16 + i);
        *(_DWORD *)buf = 134217984;
        v87 = (float)((float)v58 * 0.000030518);
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
      }
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v64 = (float)((float)*(unsigned int *)(v3 + 5080 * v16 + 296) * 0.000015259);
      *(_DWORD *)buf = 134217984;
      v87 = v64;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "spectrum_normalization:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      print_HmClData_cold_3(&v80, v81);
    v59 = *v20;
    if (*v20)
    {
      v60 = 0;
      do
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v61 = (float)((float)*(unsigned int *)(v70 + 5080 * v16 + 4 * v60) * 0.000015259);
          *(_DWORD *)buf = 134217984;
          v87 = v61;
          _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
          v59 = *v20;
        }
        ++v60;
      }
      while (v60 < v59);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "pia: ", buf, 2u);
      v59 = *v20;
      if (!*v20)
        goto LABEL_138;
    }
    else if (!v59)
    {
      goto LABEL_138;
    }
    v62 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v63) = *(_WORD *)(v69 + 5080 * v16 + 2 * v62);
        *(_DWORD *)buf = 134217984;
        v87 = (float)((float)v63 * 0.000061035);
        _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        v59 = *v20;
      }
      ++v62;
    }
    while (v62 < v59);
LABEL_138:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v65 = *(unsigned __int16 *)(v3 + 5080 * v16 + 336);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v65;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_start_visible:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v66 = *(unsigned __int16 *)(v3 + 5080 * v16 + 338);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v66;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_start_nir:               %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v67 = *(unsigned __int16 *)(v3 + 5080 * v16 + 340);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v67;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_end:                     %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v68 = *(unsigned __int8 *)(v3 + 5080 * v16 + 342);
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v68;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_step:                    %d\n", buf, 8u);
    }
    v17 = 0;
    v16 = 1;
  }
  while ((v79 & 1) != 0);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmClData_cold_2();
}

void print_HmCl_VD6287_v3(uint64_t a1, os_log_t oslog)
{
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  unsigned __int16 *v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  unsigned __int16 *v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  uint8_t buf[4];
  int v110;
  __int16 v111;
  _BYTE v112[10];
  __int16 v113;
  int v114;
  __int16 v115;
  int v116;
  __int16 v117;
  int v118;
  __int16 v119;
  int v120;
  __int16 v121;
  int v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_11();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_10();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_9();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_8();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_7();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_6();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_5();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_4();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_3();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_2();
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v11 = "ASYNC";
      if ((v6 & 1) != 0)
        v11 = "SYNC";
      v110 = v4;
      v111 = 2080;
      *(_QWORD *)v112 = v11;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d] (%s)\n", buf, 0x12u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(unsigned __int8 *)(a1 + 5134 * v4 + 80);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v12;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].source = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(unsigned __int8 *)(a1 + 5134 * v4 + 81);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v13;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].algo_version = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(unsigned __int16 *)(a1 + 5134 * v4 + 82);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v14;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].size = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(unsigned __int8 *)(a1 + 5134 * v4 + 84);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v15;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].num_channels = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(unsigned __int8 *)(a1 + 5134 * v4 + 85);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v16;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].num_gains = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(unsigned __int8 *)(a1 + 5134 * v4 + 86);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v17;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_gain = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(unsigned __int16 *)(a1 + 5134 * v4 + 87);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v18;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_tint_time = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(unsigned __int16 *)(a1 + 5134 * v4 + 89);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v19;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_tint_nsamples = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v20 = (unsigned __int8 *)(a1 + 5134 * v4);
      v21 = v20[91];
      v22 = v20[92];
      v23 = v20[93];
      v24 = v20[94];
      v25 = v20[95];
      LODWORD(v20) = v20[96];
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v21;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v22;
      v113 = 1024;
      v114 = v23;
      v115 = 1024;
      v116 = v24;
      v117 = 1024;
      v118 = v25;
      v119 = 1024;
      v120 = (int)v20;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].occlusion = [%u,%u,%u,%u,%u,%u]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v26 = *(unsigned __int16 *)(a1 + 5134 * v4 + 97);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v26;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].temperature_mod100 = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(unsigned __int16 *)(a1 + 5134 * v4 + 99);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v27;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_correction_mod16384 = %u\n", buf, 0xEu);
    }
    v7 = 0;
    v8 = a1 + 101 + 5134 * v4;
    do
    {
      for (i = 0; i != 9; ++i)
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v10 = *(unsigned __int16 *)(v8 + 2 * i);
          *(_DWORD *)buf = 67109888;
          v110 = v4;
          v111 = 1024;
          *(_DWORD *)v112 = v7;
          *(_WORD *)&v112[4] = 1024;
          *(_DWORD *)&v112[6] = i;
          v113 = 1024;
          v114 = v10;
          _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].gain_scaling_mod16384[%u][%u] = %u\n", buf, 0x1Au);
        }
      }
      ++v7;
      v8 += 18;
    }
    while (v7 != 6);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v28 = a1 + 5134 * v4;
      v29 = *(__int16 *)(v28 + 209);
      v30 = *(__int16 *)(v28 + 211);
      v31 = *(__int16 *)(v28 + 213);
      v32 = *(__int16 *)(v28 + 215);
      v33 = *(__int16 *)(v28 + 217);
      LODWORD(v28) = *(__int16 *)(v28 + 219);
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v29;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v30;
      v113 = 1024;
      v114 = v31;
      v115 = 1024;
      v116 = v32;
      v117 = 1024;
      v118 = v33;
      v119 = 1024;
      v120 = v28;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].dark_counts_offset = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v34 = a1 + 5134 * v4;
      v35 = *(__int16 *)(v34 + 221);
      v36 = *(__int16 *)(v34 + 223);
      v37 = *(__int16 *)(v34 + 225);
      v38 = *(__int16 *)(v34 + 227);
      v39 = *(__int16 *)(v34 + 229);
      LODWORD(v34) = *(__int16 *)(v34 + 231);
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v35;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v36;
      v113 = 1024;
      v114 = v37;
      v115 = 1024;
      v116 = v38;
      v117 = 1024;
      v118 = v39;
      v119 = 1024;
      v120 = v34;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].cnt_ratio_mod16384 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v40 = a1 + 5134 * v4;
      v41 = *(_DWORD *)(v40 + 233);
      v42 = *(_DWORD *)(v40 + 237);
      v43 = *(_DWORD *)(v40 + 241);
      v44 = *(_DWORD *)(v40 + 245);
      v45 = *(_DWORD *)(v40 + 249);
      LODWORD(v40) = *(_DWORD *)(v40 + 253);
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v41;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v42;
      v113 = 1024;
      v114 = v43;
      v115 = 1024;
      v116 = v44;
      v117 = 1024;
      v118 = v45;
      v119 = 1024;
      v120 = v40;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_mod65536 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v46 = *(_DWORD *)(a1 + 5134 * v4 + 257);
      v47 = *(_DWORD *)(a1 + 5134 * v4 + 261);
      v48 = *(_DWORD *)(a1 + 5134 * v4 + 265);
      v49 = *(_DWORD *)(a1 + 5134 * v4 + 269);
      v50 = *(_DWORD *)(a1 + 5134 * v4 + 273);
      v51 = *(_DWORD *)(a1 + 5134 * v4 + 277);
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v46;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v47;
      v113 = 1024;
      v114 = v48;
      v115 = 1024;
      v116 = v49;
      v117 = 1024;
      v118 = v50;
      v119 = 1024;
      v120 = v51;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].cct_coefficient_mod256 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v52 = *(_DWORD *)(a1 + 5134 * v4 + 281);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v52;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].normalization_factor_mod65536 = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v53 = *(_DWORD *)(a1 + 5134 * v4 + 285);
      v54 = *(_DWORD *)(a1 + 5134 * v4 + 289);
      v55 = *(_DWORD *)(a1 + 5134 * v4 + 293);
      v56 = *(_DWORD *)(a1 + 5134 * v4 + 297);
      v57 = *(_DWORD *)(a1 + 5134 * v4 + 301);
      v58 = *(_DWORD *)(a1 + 5134 * v4 + 305);
      *(_DWORD *)buf = 67110656;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v53;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v54;
      v113 = 1024;
      v114 = v55;
      v115 = 1024;
      v116 = v56;
      v117 = 1024;
      v118 = v57;
      v119 = 1024;
      v120 = v58;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].nir_scaling_mod65536 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v59 = *(unsigned __int16 *)(a1 + 5134 * v4 + 309);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v59;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_start_visible = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v60 = *(unsigned __int16 *)(a1 + 5134 * v4 + 311);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v60;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_start_nir = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v61 = *(unsigned __int16 *)(a1 + 5134 * v4 + 313);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v61;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_end = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v62 = *(unsigned __int8 *)(a1 + 5134 * v4 + 315);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v62;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_step = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v63 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5130);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v63;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.als_location_x = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v64 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5132);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v64;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.als_location_y = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v65 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5134);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v65;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.num_nits = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v66 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5135);
      v67 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5137);
      v68 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5139);
      v69 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5141);
      v70 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5143);
      v71 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5145);
      v72 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5147);
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v66;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v67;
      v113 = 1024;
      v114 = v68;
      v115 = 1024;
      v116 = v69;
      v117 = 1024;
      v118 = v70;
      v119 = 1024;
      v120 = v71;
      v121 = 1024;
      v122 = v72;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.nits = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v73 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5149);
      v74 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5151);
      v75 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5153);
      v76 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5155);
      v77 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5157);
      v78 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5159);
      v79 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5161);
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v73;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v74;
      v113 = 1024;
      v114 = v75;
      v115 = 1024;
      v116 = v76;
      v117 = 1024;
      v118 = v77;
      v119 = 1024;
      v120 = v78;
      v121 = 1024;
      v122 = v79;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.line_delay = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v80 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5177);
      v81 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5178);
      v82 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5179);
      v83 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5180);
      v84 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5181);
      v85 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5182);
      v86 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5183);
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v80;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v81;
      v113 = 1024;
      v114 = v82;
      v115 = 1024;
      v116 = v83;
      v117 = 1024;
      v118 = v84;
      v119 = 1024;
      v120 = v85;
      v121 = 1024;
      v122 = v86;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_gain = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v87 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5163);
      v88 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5165);
      v89 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5167);
      v90 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5169);
      v91 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5171);
      v92 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5173);
      v93 = *(unsigned __int16 *)(a1 + 5134 * v4 + 5175);
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v87;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v88;
      v113 = 1024;
      v114 = v89;
      v115 = 1024;
      v116 = v90;
      v117 = 1024;
      v118 = v91;
      v119 = 1024;
      v120 = v92;
      v121 = 1024;
      v122 = v93;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_time = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v94 = (unsigned __int16 *)(a1 + 5134 * v4);
      v95 = v94[2599];
      v96 = v94[2600];
      v97 = v94[2601];
      v98 = v94[2602];
      v99 = v94[2603];
      v100 = v94[2604];
      LODWORD(v94) = v94[2605];
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v95;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v96;
      v113 = 1024;
      v114 = v97;
      v115 = 1024;
      v116 = v98;
      v117 = 1024;
      v118 = v99;
      v119 = 1024;
      v120 = v100;
      v121 = 1024;
      v122 = (int)v94;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_interval = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v101 = (unsigned __int16 *)(a1 + 5134 * v4);
      v102 = v101[2592];
      v103 = v101[2593];
      v104 = v101[2594];
      v105 = v101[2595];
      v106 = v101[2596];
      v107 = v101[2597];
      LODWORD(v101) = v101[2598];
      *(_DWORD *)buf = 67110912;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v102;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v103;
      v113 = 1024;
      v114 = v104;
      v115 = 1024;
      v116 = v105;
      v117 = 1024;
      v118 = v106;
      v119 = 1024;
      v120 = v107;
      v121 = 1024;
      v122 = (int)v101;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_nsamples = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v108 = *(unsigned __int8 *)(a1 + 5134 * v4 + 5212);
      *(_DWORD *)buf = 67109376;
      v110 = v4;
      v111 = 1024;
      *(_DWORD *)v112 = v108;
      _os_log_debug_impl(&dword_21F2AB000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.num_regions = %u\n", buf, 0xEu);
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    print_HmCl_VD6287_v3_cold_1();
}

CFDataRef convertNighthawkHmClv1Tov3()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  UInt8 *v6;
  char v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  UInt8 *v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  char v18;
  __int16 v19;
  __int16 v20;
  _WORD *v21;
  _BYTE *v22;
  UInt8 bytes[8];
  int v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  _BYTE v29[28];
  uint64_t v30;
  int v31;
  _BYTE v32[10284];

  v0 = MEMORY[0x24BDAC7A8]();
  *(_QWORD *)&v32[10268] = *MEMORY[0x24BDAC8D0];
  bzero(v32, 0x281CuLL);
  v1 = 0;
  *(_QWORD *)bytes = *(_QWORD *)v0;
  v25 = *(_DWORD *)(v0 + 8);
  v26 = *(_QWORD *)(v0 + 12);
  v27 = *(_DWORD *)(v0 + 20);
  *(_OWORD *)&v29[12] = *(_OWORD *)(v0 + 52);
  *(_OWORD *)v29 = *(_OWORD *)(v0 + 40);
  v2 = *(_OWORD *)(v0 + 24);
  v3 = 1;
  v30 = *(_QWORD *)(v0 + 68);
  v31 = *(_DWORD *)(v0 + 76);
  v28 = v2;
  do
  {
    v4 = 0;
    v5 = v0 + 5180 * v1;
    v6 = &bytes[5134 * v1];
    *((_DWORD *)v6 + 20) = *(_DWORD *)(v5 + 80);
    v6[84] = *(_BYTE *)(v5 + 84);
    *(_WORD *)(v6 + 85) = *(_WORD *)(v5 + 85);
    *(_DWORD *)(v6 + 91) = *(_DWORD *)(v5 + 89);
    *(_WORD *)(v6 + 95) = *(_WORD *)(v5 + 93);
    *(_WORD *)(v6 + 97) = *(_WORD *)(v5 + 99);
    *(_WORD *)(v6 + 99) = *(_WORD *)(v5 + 101);
    v7 = v3;
    *(_DWORD *)(v6 + 87) = -1;
    v8 = *(_OWORD *)(v5 + 103);
    v9 = *(_OWORD *)(v5 + 119);
    *(_OWORD *)(v6 + 133) = *(_OWORD *)(v5 + 135);
    *(_OWORD *)(v6 + 117) = v9;
    *(_OWORD *)(v6 + 101) = v8;
    v10 = *(_OWORD *)(v5 + 151);
    v11 = *(_OWORD *)(v5 + 167);
    v12 = *(_OWORD *)(v5 + 183);
    *(_OWORD *)(v6 + 193) = *(_OWORD *)(v5 + 195);
    *(_OWORD *)(v6 + 181) = v12;
    *(_OWORD *)(v6 + 165) = v11;
    *(_OWORD *)(v6 + 149) = v10;
    do
    {
      *(_WORD *)&v32[5134 * v1 + 129 + 2 * v4] = *(char *)(v0 + 217 + 5180 * v1 + v4);
      ++v4;
    }
    while (v4 != 6);
    v13 = v0 + 5180 * v1;
    v14 = &bytes[5134 * v1];
    *(_QWORD *)(v14 + 221) = *(_QWORD *)(v13 + 223);
    *(_DWORD *)(v14 + 229) = *(_DWORD *)(v13 + 231);
    *(_OWORD *)(v14 + 233) = *(_OWORD *)(v13 + 235);
    *(_QWORD *)(v14 + 249) = *(_QWORD *)(v13 + 251);
    *(_OWORD *)(v14 + 257) = *(_OWORD *)(v13 + 259);
    *(_QWORD *)(v14 + 273) = *(_QWORD *)(v13 + 275);
    *(_DWORD *)(v14 + 281) = *(_DWORD *)(v13 + 283);
    *(_QWORD *)(v14 + 301) = *(_QWORD *)(v13 + 303);
    *(_OWORD *)(v14 + 285) = *(_OWORD *)(v13 + 287);
    *(_WORD *)(v14 + 309) = *(_WORD *)(v13 + 311);
    *(_DWORD *)(v14 + 311) = *(_DWORD *)(v13 + 313);
    v14[315] = *(_BYTE *)(v13 + 317);
    memcpy(v14 + 318, (const void *)(v13 + 319), 0x12D0uLL);
    LOWORD(v15) = *(unsigned __int8 *)(v13 + 5135) + 1;
    v14[5134] = *(_BYTE *)(v13 + 5135) + 1;
    *(_QWORD *)(v14 + 5137) = *(_QWORD *)(v13 + 5136);
    v16 = *(_QWORD *)(v13 + 5144);
    *(_QWORD *)(v14 + 5151) = v16;
    *(_WORD *)(v14 + 5149) = v16;
    if ((v15 & 0x100) == 0)
    {
      v15 = v15;
      v17 = *(_WORD *)(v0 + 5180 * v1 + 5153);
      v18 = *(_BYTE *)(v0 + 5180 * v1 + 5152);
      v19 = *(_WORD *)(v0 + 5180 * v1 + 5157);
      v20 = *(_WORD *)(v0 + 5180 * v1 + 5155);
      v21 = &v32[5134 * v1 + 5118];
      v22 = &v32[5134 * v1 + 5097];
      do
      {
        *(_WORD *)((char *)v21 - 35) = v17;
        *v22++ = v18;
        *(v21 - 7) = v19;
        *v21++ = v20;
        --v15;
      }
      while (v15);
    }
    v3 = 0;
    v32[5134 * v1 + 5132] = *(_BYTE *)(v0 + 5180 * v1 + 5159);
    v1 = 1;
  }
  while ((v7 & 1) != 0);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 10348);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

double OUTLINED_FUNCTION_4_0()
{
  return 2.0542726e-289;
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x4Au);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Au);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

_BYTE *OUTLINED_FUNCTION_8_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void TapToRadar()
{
  void *v0;
  void *v1;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("tap-to-radar://new"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "componentsWithURL:resolvingAgainstBaseURL:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("AMP tvOS Core"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("AV Calibration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("992338"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("DeviceClasses"), CFSTR("iPhone,AppleTV"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[TVLPersistenceManager allRecordingPaths](TVLPersistenceManager, "allRecordingPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", CFSTR("Attachments"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v20;
  v25[1] = v19;
  v25[2] = v18;
  v25[3] = v3;
  v25[4] = v4;
  v25[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueryItems:", v15);

  objc_msgSend(v2, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openURL:configuration:completionHandler:", v16, 0, 0);

}

id AllRecordings()
{
  return +[TVLPersistenceManager allRecordingPaths](TVLPersistenceManager, "allRecordingPaths");
}

uint64_t EraseAllRecordings()
{
  return +[TVLPersistenceManager eraseAllRecordings](TVLPersistenceManager, "eraseAllRecordings");
}

void sub_21F2B66A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21F2B6834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21F2B69E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B705C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B74B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B7B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B7FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B822C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

CFTypeID __isInternalBuild_block_invoke_0()
{
  CFTypeID result;
  const __CFBoolean *v1;
  CFTypeID v2;

  result = MGCopyAnswer();
  if (result)
  {
    v1 = (const __CFBoolean *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    result = CFBooleanGetTypeID();
    if (v2 == result)
    {
      result = CFBooleanGetValue(v1);
      isInternalBuild_internalBuild_0 = (_DWORD)result != 0;
    }
  }
  return result;
}

NSObject *tvl_schedule_block_at_time(dispatch_time_t a1, NSObject *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, a2);
  v7 = v6;
  if (v6)
  {
    dispatch_source_set_timer(v6, a1, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v7, v5);
    dispatch_resume(v7);
  }

  return v7;
}

void sub_21F2B91F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B9BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2B9D50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F2BA4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F2BA778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _TVLNetworkMonitorTypeOptionsAreEqual(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void sub_21F2BBC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v29 - 112));
  _Unwind_Resume(a1);
}

void sub_21F2BBEDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F2BC80C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_21F2BC9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21F2BCEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_21F2BD5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F2BE104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PriorityOfAVAudioSessionOrientation(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1668]) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1658]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1670]) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1678]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1660]) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1680]))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t softBKSHIDServicesRequestProximityDetectionMode_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[TVLRGBColorDetector _setupCaptureSession].cold.1(v0);
}

void _ALSIOHIDEventCallback_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_21F2AB000, v0, OS_LOG_TYPE_FAULT, "ColorSensorVendorEventData size mismatch", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_1()
{
  __assert_rtn("print_HmClData", "TVL_AppleEmbeddedLightSensor.cpp", 19, "p");
}

void print_HmClData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v0, v1, "HmCl Calibration - END", v2);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_0(a1, a2);
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v2, (uint64_t)v2, "nir_scaling: ", v3);
}

void print_HmClData_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_0(a1, a2);
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v2, (uint64_t)v2, "segment_correction: ", v3);
}

void print_HmClData_cold_5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_0(a1, a2);
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v2, (uint64_t)v2, "gain_scaling:\n", v3);
}

void print_HmClData_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_21F2AB000, a2, a3, "dut_sn: %12s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void print_HmClData_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_21F2AB000, a2, a3, "cg_sn: %44s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void print_HmClData_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "upstreamPassFatpTest:           0x%02X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "device_id:                      0x%02X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "chip_id:                        0x%08X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "offsetCalBlobs:                 %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "numCalBlobs:                    %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "size:                           %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmClData_cold_14(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 4);
  v3 = *(unsigned __int8 *)(a1 + 5);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_21F2AB000, a2, OS_LOG_TYPE_DEBUG, "version:                        v%d.%d\n", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_8();
}

void print_HmClData_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0(&dword_21F2AB000, v0, v1, "magic:                          %c%c%c%c\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v0, v1, "HmCl Calibration - BEGIN", v2);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v0, v1, "HmClv3 Calibration - END", v2);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_21F2AB000, v0, v1, "dut_sn = {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", v2, v3, v4, v5, 0);
}

void print_HmCl_VD6287_v3_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_21F2AB000, v0, v1, "cfsn = {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", v2, v3, v4, v5, 0);
}

void print_HmCl_VD6287_v3_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "offset_blobs = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "num_blobs = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "crc16 = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "size = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "version_minor = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_21F2AB000, v0, v1, "version_major = %u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void print_HmCl_VD6287_v3_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0(&dword_21F2AB000, v0, v1, "magic = %c%c%c%c\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_21F2AB000, v0, v1, "HmClv3 Calibration - BEGIN\n", v2);
  OUTLINED_FUNCTION_1_0();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x24BED4328]();
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BE0A798](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x24BDD8268]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x24BDD8270]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x24BDD8398]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x24BDD83C0]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x24BDD83F8]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x24BDD8418]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8530](service, key);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

uint64_t nw_interface_get_subtype()
{
  return MEMORY[0x24BDE13D0]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
  MEMORY[0x24BDE1690](parameters, include_peer_to_peer);
}

uint64_t nw_parameters_set_required_interface_subtype()
{
  return MEMORY[0x24BDE1740]();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x24BDE1748](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x24BDE1808](path, enumerate_block);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

