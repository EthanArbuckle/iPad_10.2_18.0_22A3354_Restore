id WRBundle()
{
  if (WRBundle_onceToken != -1)
    dispatch_once(&WRBundle_onceToken, &__block_literal_global);
  return (id)WRBundle_sWRBundle;
}

void sub_21DBDB4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WRLocalizedCategoryString(void *a1, unint64_t a2, void *a3)
{
  __CFString *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (a2 > 9)
    v4 = 0;
  else
    v4 = off_24E19D528[a2];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  v7 = a1;
  objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.WatchReplies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WRLocalizedStringForLanguage(v6, v7, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id WRDeviceLanguage()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "canonicalLanguageIdentifierFromString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WRLocalizedStringForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  WRDeviceLanguage();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v7, "length"))
  {
    v12 = v11;

    v7 = v12;
  }
  if (-[__CFString length](v9, "length"))
  {
    if (v10)
      goto LABEL_5;
  }
  else
  {

    v9 = CFSTR("Localizable");
    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v32 = -[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    v33 = -[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
    objc_msgSend(v10, "bundleIdentifier");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315906;
    v37 = v31;
    v38 = 2080;
    v39 = v32;
    v40 = 2080;
    v41 = v33;
    v42 = 2080;
    v43 = objc_msgSend(v34, "UTF8String");
    _os_log_debug_impl(&dword_21DBDA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#quickboard Lookup '%s' in %s, table: %s bundle: %s", buf, 0x2Au);

  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v11) & 1) != 0)
    goto LABEL_33;
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("zh-Hant"))
    && (objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDBCAE8]),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("HK")),
        v14,
        v13,
        v15))
  {

    v7 = CFSTR("zh-HK");
  }
  else if (!v7)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      WRLocalizedStringForLanguage_cold_4(v16);
    objc_msgSend(v10, "localizations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v17, v20, 1, 1);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      WRLocalizedStringForLanguage_cold_3(v21);

    v7 = v21;
  }

LABEL_21:
  if (WRLocalizedStringForLanguage_onceToken != -1)
    dispatch_once(&WRLocalizedStringForLanguage_onceToken, &__block_literal_global_0);
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@%@"), v23, v7, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)WRLocalizedStringForLanguage_stringTablesCache, "objectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = CFSTR("Localizable");
    if (v9)
      v26 = v9;
    v27 = v26;
    objc_msgSend(v10, "pathForResource:ofType:inDirectory:forLocalization:", v27, CFSTR("strings"), 0, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend((id)WRLocalizedStringForLanguage_stringTablesCache, "setObject:forKey:", v25, v24);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        WRLocalizedStringForLanguage_cold_2(v27, v28);
    }

  }
  objc_msgSend(v25, "objectForKey:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    WRLocalizedStringForLanguage_cold_1((int)v25, v29);

  if (!v29)
  {
LABEL_33:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v8, 0, v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t _WRCannedRepliesStore_handleStoreChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleStoreChange");
}

void sub_21DBDCF00(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x21DBDCEA4);
  }
  _Unwind_Resume(exc_buf);
}

void sub_21DBDD140(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x21DBDD0E8);
  }
  _Unwind_Resume(exc_buf);
}

void sub_21DBDD9B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  JUMPOUT(0x21DBDD8E4);
}

void sub_21DBDDCE8(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x21DBDDC98);
  }
  _Unwind_Resume(exc_buf);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void WRLocalizedStringForLanguage_cold_1(int a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  OUTLINED_FUNCTION_1(&dword_21DBDA000, MEMORY[0x24BDACB70], v2, "#quickboard %s table, found: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

void WRLocalizedStringForLanguage_cold_2(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  OUTLINED_FUNCTION_1(&dword_21DBDA000, MEMORY[0x24BDACB70], v3, "#quickboard Cached table %s at path %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2();
}

void WRLocalizedStringForLanguage_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_0(&dword_21DBDA000, MEMORY[0x24BDACB70], v1, "#quickboard Preferred language %s", v2, v3, v4, v5, 2u);
}

void WRLocalizedStringForLanguage_cold_4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_0(&dword_21DBDA000, MEMORY[0x24BDACB70], v1, "#quickboard Cannonical language %s", v2, v3, v4, v5, 2u);
}

uint64_t BPSAccessoryColor()
{
  return MEMORY[0x24BE0FCC8]();
}

uint64_t BPSAccessoryHighlightColor()
{
  return MEMORY[0x24BE0FCD0]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x24BE0FCD8]();
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return MEMORY[0x24BE0FCF0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

