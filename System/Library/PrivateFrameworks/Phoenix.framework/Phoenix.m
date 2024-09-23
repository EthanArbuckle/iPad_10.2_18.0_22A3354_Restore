double MachAbsoluteTimeToTimeIntervalSinceBoot(uint64_t a1)
{
  if (!dword_255A15504)
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo);
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo
                / dword_255A15504)
       / 1000000000.0;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

__CFString *PolicyOptionToString(int a1)
{
  os_log_t oslog;
  int v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  switch(a1)
  {
    case 1:
      v4 = CFSTR("AXPhoenixDoubleTapPolicy");
      break;
    case 2:
      v4 = CFSTR("AXPhoenixTripleTapPolicy");
      break;
    case 3:
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
    default:
      oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v5, (uint64_t)"PolicyOptionToString", v3);
        _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v5, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
  }
  return v4;
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 64;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

void sub_228CE41C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  uint64_t v21;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

id getCMWakeGestureManagerClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getCMWakeGestureManagerClass_softClass;
  v13 = getCMWakeGestureManagerClass_softClass;
  if (!getCMWakeGestureManagerClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getCMWakeGestureManagerClass_block_invoke;
    v6 = &unk_24F18F2B0;
    v7 = &v9;
    __getCMWakeGestureManagerClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_0(uint64_t a1)
{
  if (!dword_255A1552C)
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_0);
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_0
                / dword_255A1552C)
       / 1000000000.0;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __getCMWakeGestureManagerClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  CoreMotionLibrary();
  Class = objc_getClass("CMWakeGestureManager");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getCMWakeGestureManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreMotionLibrary()
{
  uint64_t v1;

  v1 = CoreMotionLibraryCore();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t CoreMotionLibraryCore()
{
  if (!CoreMotionLibraryCore_frameworkLibrary)
    __CoreMotionLibraryCore_block_invoke();
  return CoreMotionLibraryCore_frameworkLibrary;
}

uint64_t __os_log_helper_16_2_2_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

__CFString *PolicyOptionToString_0(int a1)
{
  os_log_t oslog;
  int v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  switch(a1)
  {
    case 1:
      v4 = CFSTR("AXPhoenixDoubleTapPolicy");
      break;
    case 2:
      v4 = CFSTR("AXPhoenixTripleTapPolicy");
      break;
    case 3:
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
    default:
      oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v5, (uint64_t)"PolicyOptionToString", v3);
        _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Could not create classifier model URL. Model URL is nil.", v5, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
  }
  return v4;
}

void sub_228CED2D4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  uint64_t v15;

  *(_QWORD *)(v15 - 152) = a1;
  *(_DWORD *)(v15 - 156) = a2;
  objc_destroyWeak((id *)(v15 - 144));
  _Block_object_dispose((const void *)(v15 - 136), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 152));
}

void HandleDeviceLockStateChanged(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v5;
  double v6;
  id v7[6];

  v7[5] = a1;
  v7[4] = a2;
  v7[3] = a3;
  v7[2] = a4;
  v7[1] = a5;
  v7[0] = a2;
  v5 = mach_absolute_time();
  v6 = MachAbsoluteTimeToTimeIntervalSinceBoot_1(v5);
  objc_msgSend(v7[0], "deviceLockStateChanged:", v6);
  objc_storeStrong(v7, 0);
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_1(uint64_t a1)
{
  if (!dword_255A15554)
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_1);
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_1
                / dword_255A15554)
       / 1000000000.0;
}

void sub_228CF41A4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 96) = a1;
  *(_DWORD *)(v11 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 80));
  JUMPOUT(0x228CF41E8);
}

void sub_228CF41E0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_228CF5180()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

__CFString *PolicyOptionToString_1(int a1)
{
  os_log_t oslog;
  int v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  switch(a1)
  {
    case 1:
      v4 = CFSTR("AXPhoenixDoubleTapPolicy");
      break;
    case 2:
      v4 = CFSTR("AXPhoenixTripleTapPolicy");
      break;
    case 3:
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
    default:
      oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v5, (uint64_t)"PolicyOptionToString", v3);
        _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v5, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = CFSTR("AXPhoenixGeneralPolicy");
      break;
  }
  return v4;
}

void sub_228CF9AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  uint64_t v21;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_228CFE3C4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_2(uint64_t a1)
{
  if (!dword_255A1557C)
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_2);
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_2
                / dword_255A1557C)
       / 1000000000.0;
}

void sub_228CFECD0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_228CFEFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  uint64_t v20;

  objc_destroyWeak(&a20);
  objc_destroyWeak((id *)(v20 - 32));
  _Unwind_Resume(a1);
}

void sub_228D011D0(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void __61__backtap_loadContentsOfURL_configuration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  backtap *v3;
  id v6[2];
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    v3 = [backtap alloc];
    v6[0] = -[backtap initWithMLModel:](v3, "initWithMLModel:", location[0]);
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void __52__backtap_predictionFromFeatures_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  backtapOutput *v3;
  id v4;
  id v5;
  id v8[2];
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  if (location[0])
  {
    v3 = [backtapOutput alloc];
    v5 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("model_output"));
    v4 = (id)objc_msgSend(v5, "multiArrayValue");
    v8[0] = -[backtapOutput initWithModel_output:](v3, "initWithModel_output:");

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v8, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __60__backtap_predictionFromFeatures_options_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  backtapOutput *v3;
  id v4;
  id v5;
  id v8[2];
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  if (location[0])
  {
    v3 = [backtapOutput alloc];
    v5 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("model_output"));
    v4 = (id)objc_msgSend(v5, "multiArrayValue");
    v8[0] = -[backtapOutput initWithModel_output:](v3, "initWithModel_output:");

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v8, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t AXAccessibilityPrivateFrameworksDirectory()
{
  return MEMORY[0x24BDFDF68]();
}

uint64_t AXLogBackTap()
{
  return MEMORY[0x24BDFE0D0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x24BEDA2F0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x24BEDA578]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_ustar()
{
  return MEMORY[0x24BEDA650]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

