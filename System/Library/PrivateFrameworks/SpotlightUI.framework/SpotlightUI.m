void SPUIInitLogging()
{
  if (SPUIInitLogging_once != -1)
    dispatch_once(&SPUIInitLogging_once, &__block_literal_global_1);
}

id SPTransactionCreate(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;

  v1 = a1;
  if (objc_msgSend(v1, "count")
    && (objc_msgSend(v1, "componentsJoinedByString:", CFSTR(".")), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.spotlight.%@"), v2);

  }
  else
  {
    v4 = CFSTR("com.apple.spotlight");
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    SPTransactionCreate_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_retainAutorelease(v4);
  -[__CFString UTF8String](v12, "UTF8String");
  v13 = (void *)os_transaction_create();

  return v13;
}

void SPTransactionDone(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = (void *)os_transaction_copy_description();
    if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      SPTransactionDone_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    free(v2);
  }

}

void sub_218DECBE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void lockStateChanged(uint64_t a1, const void *a2)
{
  int v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = MKBGetDeviceLockState();
  if (!v3 || v3 == 3 || unlocked == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a2, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
    unlocked = 1;
  }
}

void sendAppsInfoWithData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (runningInSpotlight)
  {
    prepareApps(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84998]), "initWithName:", CFSTR("Apps"));
      objc_msgSend(v9, "setRootObject:", v8);
      objc_msgSend(v9, "setInfo:", MEMORY[0x24BDBD1B8]);
      objc_msgSend(v5, "sendMessage:", v9);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134218240;
        v11 = objc_msgSend(v6, "count");
        v12 = 2048;
        v13 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_218DEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Send apps:%ld hidden:%ld", (uint8_t *)&v10, 0x16u);
      }

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_218DEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No app data to send", (uint8_t *)&v10, 2u);
    }

  }
}

id prepareApps(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  const __CFString **v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  const __CFString *v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v35 = a2;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v41;
    v8 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "displayNameLoaded") & 1) == 0)
        {
          objc_msgSend(v11, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v10;
            v53 = 2112;
            v54 = v12;
            _os_log_debug_impl(&dword_218DEA000, v8, OS_LOG_TYPE_DEBUG, "app %@ display name %@", buf, 0x16u);
          }
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v11, "setDisplayName:", v12);
          }
          else
          {
            if (!v6)
              v6 = (void *)objc_opt_new();
            objc_msgSend(v6, "addObject:", v10);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v13 = (void *)objc_msgSend(v3, "count");
  if (v13)
  {
    v14 = v35;
    if (objc_msgSend(v35, "count"))
    {
      v49[0] = CFSTR("apps");
      v49[1] = CFSTR("hiddenApps");
      v50[0] = v3;
      v50[1] = v35;
      v15 = (void *)MEMORY[0x24BDBCE70];
      v16 = (id *)v50;
      v17 = (const __CFString **)v49;
      v18 = 2;
    }
    else
    {
      v47 = CFSTR("apps");
      v48 = v3;
      v15 = (void *)MEMORY[0x24BDBCE70];
      v16 = &v48;
      v17 = &v47;
      v18 = 1;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v35;
  }
  v19 = v13;
  v20 = v19;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("apps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("hiddenApps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = v24;
    if (v24)
      v26 = v24;
    else
      v26 = (id)objc_opt_new();
    v27 = v26;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v6;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v22, "removeObjectForKey:", v33);
          objc_msgSend(v27, "addObject:", v33);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v30);
    }

    v20 = v19;
    if (v22)
    {
      v20 = v19;
      if (v27)
      {
        v44[0] = CFSTR("apps");
        v44[1] = CFSTR("hiddenApps");
        v45[0] = v22;
        v45[1] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    v14 = v35;
  }

  return v20;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const __CFString *SPUIRemoteViewPresentationSourceDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("Unknown");
  else
    return off_24DA1D0A0[a1 - 1];
}

void sub_218DEE4BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_218DEEE54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *SPUIRemoteViewPresentationIntentDescription(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24DA1D0E0[a1];
}

__CFString *SPUISearchViewSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  unint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1 == 1000)
  {
    objc_msgSend(v3, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a1 == 1003)
  {
    v7 = objc_msgSend(v3, "integerValue");
    if (v7 < 5)
    {
      v6 = off_24DA1D0E0[v7];
      goto LABEL_10;
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  if (a1 != 1002)
    goto LABEL_9;
  SPUIRemoteViewPresentationSourceDescription(objc_msgSend(v3, "integerValue"));
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (__CFString *)v5;
LABEL_10:

  return v6;
}

__CFString *SPUISearchViewSceneClientSettingsKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1000) > 0xC)
    return 0;
  else
    return off_24DA1D108[a1 - 1000];
}

id SPUISearchViewClientSceneSettingsValueDescription(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  CGSize v10;

  v4 = a3;
  v5 = v4;
  v6 = a1 + 24;
  if ((unint64_t)(a1 - 1000) > 0xA)
  {
    v8 = 0;
  }
  else
  {
    if (((1 << v6) & 0x47F) != 0)
    {
      objc_msgSend(v4, "description");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << v6) & 0x300) != 0)
      {
        objc_msgSend(v4, "CGSizeValue");
        NSStringFromCGSize(v10);
      }
      else
      {
        BSSettingFlagDescription();
      }
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
  }

  return v8;
}

void sub_218DF1A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_218DF220C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218DF2EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void SPTransactionCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "SPTransactionCreate, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void SPTransactionDone_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "SPTransactionDone, %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x24BE37FC8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE37FD0]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x24BE37FD8]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE37FE0]();
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

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t FBSProcessResourceAllowanceMakeWithRealTimeInterval()
{
  return MEMORY[0x24BE37FF0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

uint64_t SBUIGetUserAgent()
{
  return MEMORY[0x24BEB0F38]();
}

uint64_t SPFastApplicationsGet()
{
  return MEMORY[0x24BE849E0]();
}

uint64_t SPFastApplicationsGetNoBuild()
{
  return MEMORY[0x24BE849E8]();
}

uint64_t SPFastHiddenAppsGetNoBuild()
{
  return MEMORY[0x24BE849F8]();
}

uint64_t SPSetAppUpdateBlock()
{
  return MEMORY[0x24BE84AA8]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x24BDF7710]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x24BDAF430]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

