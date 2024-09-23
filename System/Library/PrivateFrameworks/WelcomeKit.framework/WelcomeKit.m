void sub_22773571C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227737E04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id WLDaemonExportedInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9148);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_sourceDeviceWithReply_, 0, 1);

  WLDataMigrationDelegateInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_startMigrationUsingRetryPolicies_delegate_useMigrationKit_replyBlock_, 1, 0);

  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_startMigrationUsingRetryPolicies_delegate_useMigrationKit_replyBlock_, 0, 1);
  return v0;
}

id WLDataMigrationDelegateInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F93F8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigratorDidBecomeRestartable_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigratorDidFinish_withImportErrors_context_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigrator_didFailWithError_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigrator_didUpdateMigrationState_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigrator_didUpdateProgressPercentage_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_dataMigrator_didUpdateRemainingDownloadTime_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemon_didCreateCode_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemon_didReceiveClient_brand_model_name_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemonDidAuthenticateClient_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemonDidRejectClient_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemon_didUpdateProgress_remainingTime_completedOperationCount_totalOperationCount_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemonWillImport_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemon_didImportWithContext_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470), sel_daemon_didChangeState_withContext_, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_daemon_didImportWithContext_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_daemon_didChangeState_withContext_, 2, 0);

  return v0;
}

uint64_t WLDataMigratorInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558F9470);
}

void _loggingUserDefaultsChangedNotificationHandler()
{
  id v0;

  CFPreferencesAppSynchronize(CFSTR("com.apple.welcomekit"));
  +[WLLogController sharedLogger](WLLogController, "sharedLogger");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_reloadLogPreferences");

}

uint64_t WLLoggingEnabled()
{
  void *v0;
  uint64_t v1;

  +[WLLogController sharedLogger](WLLogController, "sharedLogger");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_loggingEnabled");

  return v1;
}

void _WLLog(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;

  v11 = a3;
  +[WLLogController sharedLogger](WLLogController, "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessageFromAddress:withLevel:format:args:", a1, a2, v11, &a9);

}

void sub_227738CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _didDiscoverCandidate(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___didDiscoverCandidate_block_invoke;
  v9[3] = &unk_24EFCA8D0;
  v4 = v2;
  v10 = v4;
  objc_msgSend(v4, "daemonWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = ___didDiscoverCandidate_block_invoke_2;
  v7[3] = &unk_24EFCAB98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "sourceDeviceWithReply:", v7);

}

void _sourceDevicesDidChange(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___sourceDevicesDidChange_block_invoke;
  v9[3] = &unk_24EFCA8D0;
  v4 = v2;
  v10 = v4;
  objc_msgSend(v4, "daemonWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = ___sourceDevicesDidChange_block_invoke_2;
  v7[3] = &unk_24EFCAB98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "sourceDeviceWithReply:", v7);

}

void _wifiAndDeviceDiscoveryDidGetInterrupted(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  objc_msgSend(WeakRetained, "wifiAndDeviceDiscoveryDidGetInterrupted");

}

void ___didDiscoverCandidate_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error fetching source device following change notification - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void ___didDiscoverCandidate_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  id v12;

  v12 = a2;
  if (a3)
  {
    _WLLog(v3, 0, CFSTR("%@: Error from daemon fetching source device following change notification - %@"), v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "sourceDeviceController:didDiscoverCandidate:", *(_QWORD *)(a1 + 32), v12);

  }
}

void ___sourceDevicesDidChange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error fetching source device following change notification - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void ___sourceDevicesDidChange_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  id v12;

  v12 = a2;
  if (a3)
  {
    _WLLog(v3, 0, CFSTR("%@: Error from daemon fetching source device following change notification - %@"), v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "sourceDeviceController:didDiscoverDevice:", *(_QWORD *)(a1 + 32), v12);

  }
}

id WLLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WLLocalizedString_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WLLocalizedString_onceToken, &__block_literal_global_2);
  objc_msgSend((id)WLLocalizedString_bundle, "localizedStringForKey:value:table:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x24BDAF390]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

