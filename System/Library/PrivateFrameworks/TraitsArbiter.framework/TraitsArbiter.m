id TRALogCommon()
{
  if (TRALogCommon_onceToken != -1)
    dispatch_once(&TRALogCommon_onceToken, &__block_literal_global_1);
  return (id)TRALogCommon___logObj;
}

__CFString *TRAStringFromTraitsPreferencesType(unint64_t a1)
{
  if (a1 >= 4)
    TRAStringFromTraitsPreferencesType_cold_1();
  return off_251A06D88[a1];
}

void preOrder(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 == 1)
    objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_219);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v18, "children", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        preOrder(v18, v19, v10, a4);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

uint64_t __preOrder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 <= v9)
  {
    objc_msgSend(v4, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v5, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 >= v14)
      v10 = 0;
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void sub_24919C904(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24919F344(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24919F9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void appendDescription(void *a1, void *a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = v13;
  v53 = v11;
  if (v11 && objc_msgSend(v13, "length"))
    objc_msgSend(v14, "appendString:", CFSTR("\n"));
  if (a4 >= 1)
  {
    v15 = a4;
    do
    {
      objc_msgSend(v14, "appendString:", CFSTR("\t"));
      if (v15 == 1)
        objc_msgSend(v14, "appendString:", CFSTR("⎿ "));
      --v15;
    }
    while (v15);
  }
  if (v53)
  {
    v52 = a4;
    objc_msgSend(v53, "participant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "zOrderLevelSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "participant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "orientationSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "description");
    v23 = objc_claimAutoreleasedReturnValue();

    v50 = (void *)v23;
    v51 = (void *)v19;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v19, v23);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v53, "participant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "orientationPreferences");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    TRAStringForBSInterfaceOrientationMask(objc_msgSend(v26, "supportedOrientations"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("supported: %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v53, "debugLastSettingsWereValidated") & 1) != 0)
    {
      v29 = &stru_251A072F0;
      v30 = 0x24BDD1000;
    }
    else
    {
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v53, "debugLastOrientationSettingsValidationFailureReason");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR(",  last validation failed: %@"), v32);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v30 = 0x24BDD1000uLL;
    }
    v33 = *(void **)(v30 + 1992);
    objc_msgSend(v53, "participant");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "uniqueIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@,  %@,  %@%@"), v35, v49, v28, v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v36);

    a4 = v52;
  }
  if (v12 && (_DWORD)a6)
  {
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_214);
    v37 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v37;
  }
  else if (a5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("children.@count"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingDescriptors:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v40;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v41 = v12;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v55;
    v45 = (a4 + 1);
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(v41);
        v47 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v47, "children");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        appendDescription(v47, v48, v14, v45, a5, a6);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v43);
  }

}

uint64_t __appendDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "currentZOrderLevel");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "currentZOrderLevel");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t TRABSInterfaceOrientationMaskForBSInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

const __CFString *TRAStringForBSDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_251A06EE8[a1 - 1];
}

__CFString *TRAStringForBSInterfaceOrientation(uint64_t a1)
{
  if (!a1)
    return CFSTR("unknown");
  TRAStringForBSInterfaceOrientationMask((1 << a1) & 0x1E);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *TRAStringForBSInterfaceOrientationMask(uint64_t a1)
{
  char v1;
  __CFString *v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v2 = CFSTR("none");
    return v2;
  }
  v1 = a1;
  if (a1 != 30)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v1 & 2) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("Pu"));
      if ((v1 & 0x10) == 0)
      {
LABEL_7:
        if ((v1 & 8) == 0)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    else if ((v1 & 0x10) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("Ll"));
    if ((v1 & 8) == 0)
    {
LABEL_8:
      if ((v1 & 4) == 0)
      {
LABEL_10:
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
LABEL_9:
      objc_msgSend(v4, "addObject:", CFSTR("Pd"));
      goto LABEL_10;
    }
LABEL_14:
    objc_msgSend(v4, "addObject:", CFSTR("Lr"));
    if ((v1 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v2 = CFSTR("All");
  return v2;
}

void sub_2491A3D30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void TRAStringFromTraitsPreferencesType_cold_1()
{
  __assert_rtn("TRAStringFromTraitsPreferencesType", "TRAPreferences.m", 24, "0");
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x24BE0BC30]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x24BE0BC60]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

