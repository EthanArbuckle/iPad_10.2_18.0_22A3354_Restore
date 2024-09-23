void sub_21AA1F548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA1F7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA218E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HVDataSourceAssertSingleSource(uint64_t a1, int8x8_t a2)
{
  uint8x8_t v2;
  void *v4;
  id v5;

  a2.i32[0] = a1;
  v2 = (uint8x8_t)vcnt_s8(a2);
  v2.i16[0] = vaddlv_u8(v2);
  if (v2.i32[0] != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HVDataSourceAssertSingleSource(HVDataSources)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HVDataSources.m"), 167, CFSTR("HVDataSourceAssertSingleSource(%u) failed."), a1);

  }
}

void sub_21AA2241C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_21AA226BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id hv_default_log_handle()
{
  if (hv_default_log_handle__pasOnceToken2 != -1)
    dispatch_once(&hv_default_log_handle__pasOnceToken2, &__block_literal_global_1086);
  return (id)hv_default_log_handle__pasExprOnceResult;
}

uint64_t HVDataSourceForBundleIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.parsecd")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
  {
    v2 = 128;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v2 = 256;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
  {
    v2 = 512;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.usernotificationsd")) & 1) != 0)
  {
    v2 = 0x4000;
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.")))
  {
    v2 = 0;
  }
  else
  {
    v2 = 1024;
  }

  return v2;
}

void sub_21AA23354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void HVDataSourceRunBlockPerSetBit(int a1, void *a2)
{
  void (**v3)(id, uint64_t, _BYTE *);
  uint64_t i;
  char v5;

  v3 = a2;
  v5 = 0;
  for (i = 1; ; i = (2 * i))
  {
    if ((i & a1) != 0)
    {
      v3[2](v3, i, &v5);
      if (v5)
        break;
    }
    if (i > 0x4000)
      break;
  }

}

id HVDataSourceContentStateKey(int a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x22074FDF0]();
  v5 = (void *)objc_opt_new();
  HIDWORD(v7) = a1;
  LODWORD(v7) = a1 - 1024;
  v6 = v7 >> 10;
  v8 = v6 > 7;
  v9 = (1 << v6) & 0x8B;
  if (!v8 && v9 != 0)
  {
    objc_msgSend(v3, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  objc_msgSend(v3, "uniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "personaId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "addObject:", v13);

  }
  objc_msgSend(v5, "_pas_componentsJoinedByString:", CFSTR(":"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v14;
}

id HVDataSourceDescription(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  v3 = v2;
  if (!a1)
  {
    v4 = CFSTR("None");
LABEL_36:
    objc_msgSend(v3, "addObject:", v4);
    goto LABEL_37;
  }
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Mail"));
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Messages"));
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("News"));
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("Notes"));
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("Parsec"));
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("Photos Photo View"));
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "addObject:", CFSTR("Photos KnowledgeGraph"));
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "addObject:", CFSTR("Reminders"));
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "addObject:", CFSTR("Safari"));
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "addObject:", CFSTR("Siri"));
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "addObject:", CFSTR("Third Party App"));
  if ((a1 & 0x800) == 0)
  {
LABEL_14:
    if ((a1 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "addObject:", CFSTR("Interaction"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_15:
    if ((a1 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "addObject:", CFSTR("UserActivity Metadata"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "addObject:", CFSTR("Searchable UserActivity"));
  if ((a1 & 0x4000) == 0)
  {
LABEL_17:
    if ((a1 & 0x8000) == 0)
      goto LABEL_37;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "addObject:", CFSTR("Notifications"));
  if ((a1 & 0x8000) != 0)
  {
LABEL_35:
    v4 = CFSTR("Notification Stacks");
    goto LABEL_36;
  }
LABEL_37:
  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_21AA25A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t HVIsConnectedToPower()
{
  unsigned int v1;

  if (isConnectedToPowerOverrideForTesting)
    return objc_msgSend((id)isConnectedToPowerOverrideForTesting, "BOOLValue");
  if (initBatteryMonitoring_onceToken != -1)
    dispatch_once(&initBatteryMonitoring_onceToken, &__block_literal_global);
  v1 = atomic_load((unsigned int *)&powerConnectionState);
  if (!v1)
  {
    updatePowerConnectionState();
    v1 = atomic_load((unsigned int *)&powerConnectionState);
  }
  return v1 == 1;
}

double _refillState(uint64_t a1)
{
  double result;
  uint64_t v3;
  double v4;
  uint64_t v5;

  if (!+[HVUserDefaults harvestBudgetRefillDisabled](HVUserDefaults, "harvestBudgetRefillDisabled"))
  {
    if (*(_DWORD *)a1 != -1804290770)
    {
      *(_DWORD *)a1 = -1804290770;
      *(_DWORD *)(a1 + 20) = 0;
      *(_QWORD *)(a1 + 24) = 0;
    }
    v3 = +[HVUserDefaults harvestBudgetNumberOfOperations](HVUserDefaults, "harvestBudgetNumberOfOperations");
    +[HVUserDefaults harvestBudgetCPUTimeSeconds](HVUserDefaults, "harvestBudgetCPUTimeSeconds");
    v5 = 0x7FFFFFFFLL;
    if (v3 < 0x7FFFFFFF)
      v5 = v3;
    *(_DWORD *)(a1 + 4) = v5 & ~(v5 >> 63);
    result = v4 * 1000000000.0;
    *(_QWORD *)(a1 + 8) = (uint64_t)result;
    *(_DWORD *)(a1 + 16) = 200;
  }
  return result;
}

void sub_21AA26CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void HVDataSourceForContentClass(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1)
  {
    v2 = (void *)MEMORY[0x24BDBCE88];
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("HVDataSourceForContentClass got unexpected class %@"), a1);
    objc_msgSend(v2, "raise:format:", CFSTR("HVDataSourceForContentClassUnexpectedClass"), v3);

    __break(1u);
  }
}

void sub_21AA27BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21AA27D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA28298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA286FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21AA28A08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA28DE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
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

void HVBatteryMonitoringStart()
{
  if (initBatteryMonitoring_onceToken != -1)
    dispatch_once(&initBatteryMonitoring_onceToken, &__block_literal_global);
}

void __initBatteryMonitoring_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  int out_token;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("HVBatteryMonitoring", v1);
  out_token = 0;
  notify_register_dispatch("com.apple.system.powersources.source", &out_token, v2, &__block_literal_global_5);

}

void __initBatteryMonitoring_block_invoke_2()
{
  id v0;

  updatePowerConnectionState();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("kHVBatteryStateChangedNotification"), 0);

}

void updatePowerConnectionState()
{
  double v0;
  unsigned int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = IOPSGetTimeRemainingEstimate();
  if (v0 == -2.0)
    v1 = 1;
  else
    v1 = 2;
  atomic_store(v1, (unsigned int *)&powerConnectionState);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = v0 == -2.0;
    _os_log_debug_impl(&dword_21AA1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "AC: %i", (uint8_t *)v2, 8u);
  }
}

void HVBatteryMonitoringOverrideIsConnectedToPowerForTesting(id obj)
{
  objc_storeStrong((id *)&isConnectedToPowerOverrideForTesting, obj);
}

BOOL HVPBContentStateEntryReadFrom(id *a1, uint64_t a2)
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
  HVPBContentState *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(HVPBContentState);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || (HVPBContentStateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = (HVPBContentState *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(a1, "addUniqueIds:", v17);
LABEL_25:

    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21AA2A450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{

}

void sub_21AA2B060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __machTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToNanoseconds_machTimebaseInfo);
}

id HVDataSourceFileProtection(uint64_t a1, int8x8_t a2)
{
  int v2;
  id v3;
  id *v4;

  v2 = a1;
  HVDataSourceAssertSingleSource(a1, a2);
  if (v2 <= 127)
  {
    v4 = (id *)MEMORY[0x24BDD0CD0];
    switch(v2)
    {
      case 0:
        goto LABEL_21;
      case 1:
        goto LABEL_23;
      case 2:
      case 4:
      case 8:
        goto LABEL_22;
      case 3:
      case 5:
      case 6:
      case 7:
        return v3;
      default:
        if ((v2 - 16) <= 0x30 && ((1 << (v2 - 16)) & 0x1000000010001) != 0)
          goto LABEL_22;
        break;
    }
  }
  else
  {
    if (v2 <= 2047)
    {
      if (v2 > 511)
      {
        if (v2 != 512)
        {
          if (v2 != 1024)
            return v3;
          goto LABEL_21;
        }
      }
      else if (v2 != 128 && v2 != 256)
      {
        return v3;
      }
LABEL_22:
      v4 = (id *)MEMORY[0x24BDD0CE0];
      goto LABEL_23;
    }
    if (v2 >= 0x2000)
    {
      if (v2 != 0x2000)
      {
        if (v2 != 0x8000 && v2 != 0x4000)
          return v3;
        goto LABEL_22;
      }
LABEL_21:
      v4 = (id *)MEMORY[0x24BDD0CF8];
LABEL_23:
      v3 = *v4;
      return v3;
    }
    if (v2 == 2048 || v2 == 4096)
      goto LABEL_21;
  }
  return v3;
}

uint64_t HVDataSourceUsedForMultipleBundles(int a1)
{
  unint64_t v1;

  HIDWORD(v1) = a1;
  LODWORD(v1) = a1 - 1024;
  return ((v1 >> 10) < 8) & (0x8Bu >> (v1 >> 10));
}

void sub_21AA2E234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AA2EBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!SearchLibraryCore_frameworkLibrary)
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)SearchLibraryCore_frameworkLibrary;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void * _Nonnull SearchLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("HVContentAdmission.m"), 348, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "SPGetDisabledBundleSet");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_21AA2F098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__289(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__290(uint64_t a1)
{

}

void sub_21AA2F56C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21AA2F6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HVPBDeprecatedContentStateEntryReadFrom(uint64_t a1, uint64_t a2)
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
  HVPBContentState *v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v18 = *(HVPBContentState **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(HVPBContentState);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (HVPBContentStateReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HVCaseInsensitiveStringHash(const __CFString *a1)
{
  unint64_t Length;
  unsigned int CharacterAtIndex;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  Length = CFStringGetLength(a1);
  if (Length)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
    if (CharacterAtIndex > 0x7F)
    {
      v4 = (unsigned __int16)__tolower(CharacterAtIndex);
    }
    else if (CharacterAtIndex - 65 >= 0x1A)
    {
      v4 = CharacterAtIndex;
    }
    else
    {
      v4 = CharacterAtIndex + 32;
    }
    if (Length >= 2)
    {
      v5 = CFStringGetCharacterAtIndex(a1, Length - 1);
      if (v5 > 0x7F)
      {
        v6 = (unsigned __int16)__tolower(v5);
      }
      else if (v5 - 65 >= 0x1A)
      {
        v6 = v5;
      }
      else
      {
        v6 = v5 + 32;
      }
      v4 = 65537 * v4 + v6;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 * Length;
}

BOOL HVCaseInsensitiveEqual(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length;
  CFRange v6;

  Length = CFStringGetLength(a1);
  if (Length != CFStringGetLength(a2))
    return 0;
  v6.location = 0;
  v6.length = Length;
  return CFStringCompareWithOptions(a1, a2, v6, 1uLL) == kCFCompareEqualTo;
}

void sub_21AA31524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__559(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__560(uint64_t a1)
{

}

void sub_21AA31C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21AA31FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__657(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__658(uint64_t a1)
{

}

void sub_21AA35060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA35218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA352D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA35658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__921(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__922(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__212(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x22074FF64](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__213(uint64_t a1)
{

}

void sub_21AA372A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21AA38268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA38880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21AA38A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA38E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_21AA38F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1032(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1033(uint64_t a1)
{

}

void sub_21AA392EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA3949C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AA397F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void __hv_default_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = os_log_create("com.apple.proactive.ProactiveHarvesting", "Default");
  v2 = (void *)hv_default_log_handle__pasExprOnceResult;
  hv_default_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id hv_private_log_handle()
{
  if (hv_private_log_handle__pasOnceToken3 != -1)
    dispatch_once(&hv_private_log_handle__pasOnceToken3, &__block_literal_global_4);
  return (id)hv_private_log_handle__pasExprOnceResult;
}

void __hv_private_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = os_log_create("com.apple.proactive.ProactiveHarvesting", "Private-Data");
  v2 = (void *)hv_private_log_handle__pasExprOnceResult;
  hv_private_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id hv_xpc_server_log_handle()
{
  if (hv_xpc_server_log_handle__pasOnceToken4 != -1)
    dispatch_once(&hv_xpc_server_log_handle__pasOnceToken4, &__block_literal_global_6);
  return (id)hv_xpc_server_log_handle__pasExprOnceResult;
}

void __hv_xpc_server_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = os_log_create("com.apple.proactive.ProactiveHarvesting", "XPCServer");
  v2 = (void *)hv_xpc_server_log_handle__pasExprOnceResult;
  hv_xpc_server_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id hv_default_signpost_handle()
{
  if (hv_default_signpost_handle__pasOnceToken5 != -1)
    dispatch_once(&hv_default_signpost_handle__pasOnceToken5, &__block_literal_global_8);
  return (id)hv_default_signpost_handle__pasExprOnceResult;
}

void __hv_default_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = os_log_create("com.apple.proactive.ProactiveHarvesting.Signposts", "Default");
  v2 = (void *)hv_default_signpost_handle__pasExprOnceResult;
  hv_default_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id hv_scheduled_task_signpost_handle()
{
  if (hv_scheduled_task_signpost_handle__pasOnceToken6 != -1)
    dispatch_once(&hv_scheduled_task_signpost_handle__pasOnceToken6, &__block_literal_global_9_1090);
  return (id)hv_scheduled_task_signpost_handle__pasExprOnceResult;
}

void __hv_scheduled_task_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = os_log_create("com.apple.proactive.ProactiveHarvesting.Signposts", "ScheduledTask");
  v2 = (void *)hv_scheduled_task_signpost_handle__pasExprOnceResult;
  hv_scheduled_task_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void sub_21AA3A834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1125(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1126(uint64_t a1)
{

}

uint64_t HVPBContentStateReadFrom(uint64_t a1, uint64_t a2)
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
  void *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addConsumers:", v17);

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

void sub_21AA3F548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3F6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3F868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3F9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3FB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3FD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21AA3FEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA400D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA40258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21AA403D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1590(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1591(uint64_t a1)
{

}

void __bomData_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __int16 v3;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v3 = -257;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v3, 2);
  v2 = (void *)bomData__pasExprOnceResult;
  bomData__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id nullByteData()
{
  if (nullByteData__pasOnceToken2 != -1)
    dispatch_once(&nullByteData__pasOnceToken2, &__block_literal_global_1670);
  return (id)nullByteData__pasExprOnceResult;
}

void __nullByteData_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", "", 1);
  v2 = (void *)nullByteData__pasExprOnceResult;
  nullByteData__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void HVExit(int a1)
{
  _exit(a1);
}

void sub_21AA41504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HVSHA256String(void *a1, CC_SHA256_CTX *a2)
{
  __CFString *v3;
  const char *CStringPtr;
  CFIndex v5;
  CFIndex v6;
  CFIndex usedBufLen;
  UInt8 buffer[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
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
  uint64_t v40;
  CFRange v41;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    CC_SHA256_Update(a2, CStringPtr, -[__CFString length](v3, "length"));
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    *(_OWORD *)buffer = 0u;
    v9 = 0u;
    usedBufLen = 0;
    v5 = -[__CFString length](v3, "length");
    v6 = 0;
    while (1)
    {
      v41.location = v6;
      v41.length = v5;
      if (!CFStringGetBytes(v3, v41, 0x8000100u, 0, 0, buffer, 512, &usedBufLen))
        break;
      CC_SHA256_Update(a2, buffer, usedBufLen);
      v6 += usedBufLen;
      v5 -= usedBufLen;
    }
  }

}

void sub_21AA42668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void startElementSAX(void *a1, const char *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  const htmlElemDesc *v7;
  int v8;
  int v9;
  const char *v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  CFIndex v38;
  UniChar v39;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  CFIndex v44;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  HVHtmlParserHyperlink *v75;
  int v76;
  const char *v77;
  const char **v78;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  __CFString *v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  UniChar buffer[8];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  CFStringRef theString;
  const UniChar *v102;
  const char *v103;
  uint64_t v104;
  CFIndex v105;
  int64_t v106;
  int64_t v107;
  uint64_t v108;
  CFRange v109;

  v108 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (uint64_t)v5;
  if (v5)
    ++v5[23];
  if (!strcmp(a2, "title") || !strcmp(a2, "script") || !strcmp(a2, "style"))
  {
    if (v6)
      *(_BYTE *)(v6 + 144) = 1;
LABEL_37:
    v17 = strcmp(a2, "a");
    if (!a3 || v17)
      goto LABEL_132;
    while (1)
    {
      v18 = (void *)MEMORY[0x22074FDF0]();
      if (!strcmp(*(const char **)a3, "href"))
        break;
      objc_autoreleasePoolPop(v18);
      v19 = *(_QWORD *)(a3 + 16);
      a3 += 16;
      if (!v19)
        goto LABEL_132;
    }
    v20 = *(_QWORD *)(a3 + 8);
    if (!v20)
    {
LABEL_131:
      objc_autoreleasePoolPop(v18);
      goto LABEL_132;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v20, 4);
    if (!v21)
      goto LABEL_130;
    v22 = 0x24BDBC000uLL;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v21);
    if (!v23)
    {
      v24 = (void *)MEMORY[0x22074FDF0]();
      v25 = v21;
      objc_opt_self();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_90;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      *(_OWORD *)buffer = 0u;
      v94 = 0u;
      Length = CFStringGetLength(v25);
      theString = v25;
      v104 = 0;
      v105 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v25);
      CStringPtr = 0;
      v102 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v25, 0x600u);
      v106 = 0;
      v107 = 0;
      v103 = CStringPtr;
      if (Length > 0)
      {
        v83 = v24;
        v84 = v25;
        v86 = v21;
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 64;
        v34 = 0x7FFFFFFFFFFFFFFFLL;
        v35 = 0x7FFFFFFFFFFFFFFFLL;
        v36 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if ((unint64_t)v32 >= 4)
            v37 = 4;
          else
            v37 = v32;
          v38 = v105;
          if (v105 > v32)
          {
            if (v102)
            {
              v39 = v102[v32 + v104];
            }
            else if (v103)
            {
              v39 = v103[v104 + v32];
            }
            else
            {
              if (v107 <= v32 || v31 > v32)
              {
                v41 = v37 + v30;
                v42 = v33 - v37;
                v43 = v32 - v37;
                v87 = v34;
                v44 = v43 + 64;
                if (v43 + 64 >= v105)
                  v44 = v105;
                v106 = v43;
                v107 = v44;
                if (v105 >= v42)
                  v38 = v42;
                v109.length = v38 + v41;
                v109.location = v43 + v104;
                CFStringGetCharacters(theString, v109, buffer);
                v34 = v87;
                v31 = v106;
              }
              v39 = buffer[v32 - v31];
            }
            if (v39 == 35)
            {
              if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                v36 = v32;
            }
            else if (v39 == 63)
            {
              if (v35 == 0x7FFFFFFFFFFFFFFFLL && v36 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v36 = 0x7FFFFFFFFFFFFFFFLL;
                v35 = v32;
              }
            }
            else if (v39 == 47 && v35 == 0x7FFFFFFFFFFFFFFFLL && v36 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v36 = 0x7FFFFFFFFFFFFFFFLL;
              if (v34 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v35 = 0x7FFFFFFFFFFFFFFFLL;
                v34 = v32;
              }
              else
              {
                if (v32 == v34 + 1)
                  v34 = 0x7FFFFFFFFFFFFFFFLL;
                v35 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          ++v32;
          --v30;
          ++v33;
        }
        while (Length != v32);
        v88 = v34;
        v25 = v84;

        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v82 = -[__CFString length](v84, "length") - (v36 + 1);
          -[__CFString substringWithRange:](v84, "substringWithRange:", v36 + 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringByAddingPercentEncodingWithAllowedCharacters:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            -[__CFString stringByReplacingCharactersInRange:withString:](v84, "stringByReplacingCharactersInRange:withString:", v36 + 1, v82, v49);
            v50 = objc_claimAutoreleasedReturnValue();

            v25 = (__CFString *)v50;
          }

        }
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v52 = -[__CFString length](v25, "length");
          if (v36 >= v52)
            v53 = v52;
          else
            v53 = v36;
          v85 = v53 - (v35 + 1);
          -[__CFString substringWithRange:](v25, "substringWithRange:", v35 + 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringByAddingPercentEncodingWithAllowedCharacters:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            -[__CFString stringByReplacingCharactersInRange:withString:](v25, "stringByReplacingCharactersInRange:withString:", v35 + 1, v85, v56);
            v57 = objc_claimAutoreleasedReturnValue();

            v25 = (__CFString *)v57;
          }

        }
        if (v88 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = 0x24BDBC000;
          v24 = v83;
        }
        else
        {
          if (v36 >= v35)
            v58 = v35;
          else
            v58 = v36;
          v59 = -[__CFString length](v25, "length");
          if (v58 >= v59)
            v60 = v59;
          else
            v60 = v58;
          v61 = v60 - (v88 + 1);
          -[__CFString substringWithRange:](v25, "substringWithRange:", v88 + 1, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "stringByAddingPercentEncodingWithAllowedCharacters:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (v64)
          {
            -[__CFString stringByReplacingCharactersInRange:withString:](v25, "stringByReplacingCharactersInRange:withString:", v88 + 1, v61, v64);
            v65 = objc_claimAutoreleasedReturnValue();

            v25 = (__CFString *)v65;
          }
          v21 = v86;
          v22 = 0x24BDBC000uLL;
          v24 = v83;

        }
      }
      else
      {
LABEL_90:

      }
      -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v25, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("%20"), 2, 0, -[__CFString length](v25, "length"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v22 + 3912)), "initWithString:", v66);
      objc_autoreleasePoolPop(v24);
      if (!v23)
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    objc_msgSend(v23, "host");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "compare:options:", CFSTR("apple.com"), 3)
      && objc_msgSend(v67, "rangeOfString:options:", CFSTR(".apple.com"), 15) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v68 = v67;
      if (objc_msgSend(v68, "compare:options:", CFSTR("icloud.com"), 3))
      {
        v69 = objc_msgSend(v68, "rangeOfString:options:", CFSTR(".icloud.com"), 15);

        if (v69 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v6)
            goto LABEL_129;
          goto LABEL_128;
        }
LABEL_127:
        objc_msgSend(*(id *)(v6 + 232), "addObject:", v23);
LABEL_128:
        v70 = *(void **)(v6 + 240);
        v71 = *(_QWORD *)(v6 + 184);
        v72 = v23;
        objc_msgSend(v70, "addIndex:", v71);
        v73 = -[HVHtmlParser _currentOutputLength](v6);
        v74 = *(void **)(v6 + 248);
        v75 = -[HVHtmlParserHyperlink initWithURL:range:]([HVHtmlParserHyperlink alloc], "initWithURL:range:", v72, v73, 0);

        objc_msgSend(v74, "addObject:", v75);
LABEL_129:

        goto LABEL_130;
      }

    }
    goto LABEL_127;
  }
  if (!strcmp(a2, "br"))
    goto LABEL_37;
  v7 = htmlTagLookup((const xmlChar *)a2);
  if (!v7 || v7->isinline)
    goto LABEL_37;
  v8 = strcmp(a2, "pre");
  if (v6 && !v8)
    *(_BYTE *)(v6 + 145) = 1;
  -[HVHtmlParser _newBlock](v6);
  if (!strcmp(a2, "table"))
  {
    if (!v6)
      goto LABEL_132;
    v51 = *(void **)(v6 + 160);
LABEL_135:
    -[HVHtmlParser _enterRegion:](v6, v51);
    goto LABEL_132;
  }
  if (!strcmp(a2, "blockquote"))
  {
LABEL_99:
    if (!v6)
      goto LABEL_132;
    v51 = *(void **)(v6 + 152);
    goto LABEL_135;
  }
  if (!strcmp(a2, "div"))
  {
    if (a3)
      goto LABEL_17;
  }
  else
  {
    v9 = strcmp(a2, "pre");
    if (a3 && !v9)
    {
LABEL_17:
      v10 = *(const char **)a3;
      while (1)
      {
        if (!strcmp(v10, "class"))
        {
          v12 = *(char **)(a3 + 8);
          if (v12)
          {
            if (!strcmp(a2, "div")
              && (strstr(v12, "gmail_quote") || strstr(v12, "yahoo_quoted") || !strcmp(v12, "domino-section")))
            {
              goto LABEL_99;
            }
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v13 = objc_msgSend(&unk_24DD8BD18, "countByEnumeratingWithState:objects:count:", &v89, buffer, 16);
            if (v13)
              break;
          }
        }
LABEL_19:
        v11 = *(const char **)(a3 + 16);
        a3 += 16;
        v10 = v11;
        if (!v11)
          goto LABEL_132;
      }
      v14 = v13;
      v15 = *(_QWORD *)v90;
LABEL_28:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v90 != v15)
          objc_enumerationMutation(&unk_24DD8BD18);
        if (strstr(v12, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v16)), "UTF8String")))
        {
          break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(&unk_24DD8BD18, "countByEnumeratingWithState:objects:count:", &v89, buffer, 16);
          if (v14)
            goto LABEL_28;
          goto LABEL_19;
        }
      }
      if (!v6)
        goto LABEL_132;
      v51 = *(void **)(v6 + 168);
      goto LABEL_135;
    }
  }
  v76 = strcmp(a2, "hr");
  if (a3 && !v76)
  {
    v79 = *(const char **)a3;
    v78 = (const char **)(a3 + 16);
    v77 = v79;
    while (1)
    {
      if (!strcmp(v77, "id"))
      {
        v80 = *(v78 - 1);
        if (v80)
        {
          if (!strcmp(v80, "stopSpelling"))
            break;
        }
      }
      v81 = *v78;
      v78 += 2;
      v77 = v81;
      if (!v81)
        goto LABEL_132;
    }
    if (v6 && *(_QWORD *)(v6 + 224) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v6 + 224) = *(_QWORD *)(v6 + 112);
  }
LABEL_132:

}

void endElementSAX(void *a1, const xmlChar *a2)
{
  const htmlElemDesc *v3;
  uint64_t v4;
  int v5;
  _BYTE *v6;

  v6 = a1;
  if (!strcmp((const char *)a2, "title") || !strcmp((const char *)a2, "script") || !strcmp((const char *)a2, "style"))
  {
    v4 = (uint64_t)v6;
    if (v6)
      v6[144] = 0;
  }
  else if (!strcmp((const char *)a2, "br"))
  {
    v4 = (uint64_t)v6;
    if (v6)
    {
      v6[120] = 0;
      -[HVHtmlParser _newBlock]((uint64_t)v6);
      v4 = (uint64_t)v6;
    }
  }
  else
  {
    v3 = htmlTagLookup(a2);
    v4 = (uint64_t)v6;
    if (v3)
    {
      if (!v3->isinline)
      {
        v5 = strcmp((const char *)a2, "pre");
        -[HVHtmlParser _newBlock]((uint64_t)v6);
        v4 = (uint64_t)v6;
        if (v6)
        {
          if (!v5 && v6[145])
            v6[145] = 0;
        }
      }
    }
  }
  -[HVHtmlParser _tagEnd](v4);

}

void charactersSAX(void *a1, uint64_t a2, int a3)
{
  id *v5;
  id *v6;

  v5 = a1;
  if (v5 && a3 && a2 && !*((_BYTE *)v5 + 144))
  {
    v6 = v5;
    objc_msgSend(v5[16], "appendBytes:length:", a2, a3);
    v5 = v6;
  }

}

void sub_21AA51E78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21AA527C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AA52D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HVPBDataSourceContentStateReadFrom(void *a1, uint64_t a2)
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
  HVPBDeprecatedContentStateEntry *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(HVPBDeprecatedContentStateEntry);
        objc_msgSend(a1, "addDeprecatedDeferredContentStates:", v17);
        if (!PBReaderPlaceMark() || !HVPBDeprecatedContentStateEntryReadFrom((uint64_t)v17, a2))
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(HVPBContentStateEntry);
    objc_msgSend(a1, "addDeferredContentStates:", v17);
    if (!PBReaderPlaceMark() || !HVPBContentStateEntryReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4E0](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDD8840]();
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _PASCollapseWhitespaceAndStrip()
{
  return MEMORY[0x24BE7A670]();
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return MEMORY[0x24BE7A678]();
}

uint64_t _PASRepairString()
{
  return MEMORY[0x24BE7A698]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
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

htmlParserCtxtPtr htmlCreatePushParserCtxt(htmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename, xmlCharEncoding enc)
{
  return (htmlParserCtxtPtr)MEMORY[0x24BEDE560](sax, user_data, chunk, *(_QWORD *)&size, filename, *(_QWORD *)&enc);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x24BEDE568](ctxt, *(_QWORD *)&options);
}

void htmlFreeParserCtxt(htmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE580](ctxt);
}

int htmlParseChunk(htmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x24BEDE598](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

const htmlElemDesc *__cdecl htmlTagLookup(const xmlChar *tag)
{
  return (const htmlElemDesc *)MEMORY[0x24BEDE5C8](tag);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x24BEDD510](lhs, rhs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

