uint64_t NCWidgetVisibilityPreferencesChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_widgetVisibilityPreferencesChanged");
}

id WGWidgetVisibilityManagerFirstPartyAvocadoBlackList()
{
  if (WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_onceToken != -1)
    dispatch_once(&WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_onceToken, &__block_literal_global);
  return (id)WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_avocadoBlackList;
}

uint64_t NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "processIdentifier");
  BSBundleIDForPID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v6);

  }
  return v5;
}

id WGContainingBundleIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    WGContainingBundleProxyForWidgetWithBundleIdentifer((uint64_t)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id WGContainingBundleProxyForWidgetWithBundleIdentifer(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDC1588], "pluginKitProxyForIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_2172E3AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromWGWidgetPinningTeachingAnimationViewState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("none");
  else
    return off_24D731408[a1 - 1];
}

void sub_2172E4BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2172E56B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

double _WGMainScreenScale()
{
  if (_WGMainScreenScale_onceToken != -1)
    dispatch_once(&_WGMainScreenScale_onceToken, &__block_literal_global_0);
  return *(double *)&_WGMainScreenScale___mainScreenScale;
}

uint64_t _WGGraphicsQuality()
{
  if (_WGGraphicsQuality_onceToken != -1)
    dispatch_once(&_WGGraphicsQuality_onceToken, &__block_literal_global_6);
  return _WGGraphicsQuality___graphicsQuality;
}

uint64_t _WGSupportsMetal()
{
  if (_WGSupportsMetal_onceToken != -1)
    dispatch_once(&_WGSupportsMetal_onceToken, &__block_literal_global_10);
  return _WGSupportsMetal___supportsMetal;
}

uint64_t _WGSupportsASTC()
{
  if (_WGSupportsASTC_onceToken != -1)
    dispatch_once(&_WGSupportsASTC_onceToken, &__block_literal_global_13);
  return _WGSupportsASTC___supportsASTC;
}

const __CFString *WGStringForAppearState(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("[Invalid]");
  else
    return off_24D7315A0[a1];
}

const __CFString *WGStringFromUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("[Unknown]");
  else
    return off_24D7315C0[a1];
}

id WGSafeCast(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id WGCachedNSHomeDirectory()
{
  if (WGCachedNSHomeDirectory_onceToken != -1)
    dispatch_once(&WGCachedNSHomeDirectory_onceToken, &__block_literal_global_34);
  return (id)WGCachedNSHomeDirectory___homeDir;
}

id WGCachesPathForSandboxPath(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1)
  {
    WGCachedNSHomeDirectory();
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void WGEnsureDirectoryExistsAtPath(void *a1)
{
  int v1;
  void *v2;
  id v3;

  v3 = objc_retainAutorelease(a1);
  v1 = mkdir((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0x1FFu);
  if (v1 && (v1 != -1 || *__error() != 17))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  }
}

id WGWidgetsFrameworkBundle()
{
  if (WGWidgetsFrameworkBundle___once != -1)
    dispatch_once(&WGWidgetsFrameworkBundle___once, &__block_literal_global_38);
  return (id)WGWidgetsFrameworkBundle___bundle;
}

double WGConvertDampingRatioResponseToMassStiffnessDamping(_QWORD *a1, double *a2, double *a3, double result, double a5)
{
  double v5;
  double v6;
  double v7;

  v5 = 6.28318531 / a5;
  if (a1)
    *a1 = 0x3FF0000000000000;
  v6 = v5 * v5;
  if (a2)
    *a2 = v6;
  if (a3)
  {
    v7 = sqrt(v6);
    result = (v7 + v7) * result;
    *a3 = result;
  }
  return result;
}

void WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration(double *a1, double *a2, _QWORD *a3, double a4, double a5)
{
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v10 = sqrt(a4);
  if (v10 + v10 < a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration(CGFloat, CGFloat, CGFloat *, CGFloat *, NSTimeInterval *)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WGUtilities.m"), 139, CFSTR("CA doesn't handle overdamped springs, these parameters are bad. Tension: %.2f Friction: %.2f"), *(_QWORD *)&a4, *(_QWORD *)&a5);

  }
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMass:", 1.0);
  objc_msgSend(v14, "setStiffness:", a4);
  objc_msgSend(v14, "setDamping:", a5);
  objc_msgSend(v14, "settlingDuration");
  if (a1)
    *a1 = a5 / (v10 + v10);
  if (a2)
    *a2 = 6.28318531 / v10;
  if (a3)
    *a3 = v11;

}

NSObject *_WGIsQueueSuspended(NSObject *result)
{
  if (result)
    return (dispatch_queue_get_specific(result, "_WGQueueIsSuspended") != 0);
  return result;
}

void _WGSuspendQueue(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  void *specific;
  NSObject *object;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    object = v1;
    specific = dispatch_queue_get_specific(v1, "_WGQueueIsSuspended");
    v2 = object;
    if (!specific)
    {
      dispatch_suspend(object);
      dispatch_queue_set_specific(object, "_WGQueueIsSuspended", (void *)1, 0);
      v2 = object;
    }
  }

}

void _WGResumeQueue(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  void *specific;
  NSObject *object;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    object = v1;
    specific = dispatch_queue_get_specific(v1, "_WGQueueIsSuspended");
    v2 = object;
    if (specific)
    {
      dispatch_resume(object);
      dispatch_queue_set_specific(object, "_WGQueueIsSuspended", 0, 0);
      v2 = object;
    }
  }

}

uint64_t _WGDataSourceIsEqualToDataSource(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "dataSourceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataSourceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

void sub_2172E826C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172E84AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void WGWidgetPersistentStateResetHasContent(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  WGPersistedStateURLForWidgetWithBundleIdentifier(a1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SBWidgetViewControllerHasContentKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "removeObjectForKey:", CFSTR("SBWidgetViewControllerHasContentKey"));
    objc_msgSend(v1, "writeToURL:atomically:", v3, 1);
  }

}

void sub_2172EBE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172ECA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172ED834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_2172EF89C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2172EFE94(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_2172F05AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172F0660(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2172F1A18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2172F1CEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

const __CFString *WGStringFromWidgetLifeCycleSequenceState(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("[Invalid]");
  else
    return off_24D731AE8[a1];
}

id WGApplicationIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BDC1588];
  v2 = a1;
  objc_msgSend(v1, "pluginKitProxyForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  if (v4)
  {
    objc_msgSend(v3, "objectForInfoDictionaryKey:ofClass:", CFSTR("NCWidgetAssociatedApplicationIdentifier"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "containingBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t WGIsBundleWithIdentifierFirstParty(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple."));
}

id WGContainingBundleCachePathForWidgetWithContainingBundleIdentifier(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BDC1538];
  v6 = a2;
  objc_msgSend(v5, "applicationProxyForIdentifier:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataContainerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WGCachesPathForSandboxPath(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("com.apple.notificationcenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    WGEnsureDirectoryExistsAtPath(v12);

  return v12;
}

id WGWidgetCachePathForWidgetWithBundleIdentifier(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BDC1588];
  v6 = a2;
  objc_msgSend(v5, "pluginKitProxyForIdentifier:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataContainerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WGCachesPathForSandboxPath(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("com.apple.notificationcenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    WGEnsureDirectoryExistsAtPath(v12);

  return v12;
}

BOOL _WGIsSystemVersionSameOrAfterSystemVersion(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "length")
    && objc_msgSend(v4, "length")
    && (unint64_t)objc_msgSend(v3, "compare:options:", v4, 64) < 2;

  return v5;
}

BOOL WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x24BDC1538];
  WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationProxyForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sdkVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length") && objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")))
  {
    +[WGWidgetInfo _productVersion](WGWidgetInfo, "_productVersion");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = _WGIsSystemVersionSameOrAfterSystemVersion(v8, v4);

  return v10;
}

uint64_t WGIsBundleWithIdentifierInternal(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (WGIsBundleWithIdentifierInternal_onceToken != -1)
    dispatch_once(&WGIsBundleWithIdentifierInternal_onceToken, &__block_literal_global_2);
  if (WGIsBundleWithIdentifierInternal___isInternalInstall && objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForIdentifier:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("AppleInternal"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t WGIsWidgetWithBundleIdentifierInternal(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  WGContainingBundleProxyForWidgetWithBundleIdentifer(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WGIsBundleWithIdentifierInternal(v2);

  return v3;
}

uint64_t WGIsWidgetWithBundleIdentifierWantsTop(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.")))
    v2 = _WGBoolValueForInfoDictionaryKey((uint64_t)v1, CFSTR("NCWidgetWantsTop"));
  else
    v2 = 0;

  return v2;
}

uint64_t _WGBoolValueForInfoDictionaryKey(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDC1550];
  v4 = a2;
  objc_msgSend(v3, "bundleProxyForIdentifier:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", v4, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

id WGPlugInBundleIdentifiersForContainingBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__1;
    v11 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "plugInKitPlugins");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __WGPlugInBundleIdentifiersForContainingBundleIdentifier_block_invoke;
    v6[3] = &unk_24D731B50;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_2172F50C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2172F60B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2172F62F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2172F7CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172F9A74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2172FA00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id smoothDecelerationAnimation(double a1)
{
  void *v2;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_opt_new();
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  WGConvertDampingRatioResponseToMassStiffnessDamping(&v6, &v5, &v4, 1.0, 0.8);
  objc_msgSend(v2, "setMass:", v6);
  objc_msgSend(v2, "setStiffness:", v5);
  objc_msgSend(v2, "setDamping:", v4);
  objc_msgSend(v2, "durationForEpsilon:", 1.17549435e-38);
  objc_msgSend(v2, "setDuration:");
  objc_msgSend(v2, "setInitialVelocity:", a1);
  return v2;
}

void sub_2172FCAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2172FD0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

id OUTLINED_FUNCTION_2_0(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_3_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_5()
{
  void *v0;

  return objc_msgSend(v0, "alpha");
}

void sub_2173007E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_217301714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217302640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2173029B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217303504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21730416C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void WGTodayViewArchiveSave(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __WGTodayViewArchiveSave_block_invoke;
    v11[3] = &unk_24D732138;
    v12 = v9;
    v13 = v8;
    v10 = v9;
    dispatch_async(v6, v11);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void WGTodayViewArchiveMigrateArchiveFromLegacy()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(CFSTR("~/Library/SpringBoard/TodayViewArchive.plist"), "stringByExpandingTildeInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    BBSavedChronologicalSectionOrder();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BBSavedSectionInfo();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") && objc_msgSend(v4, "count"))
    {
      objc_msgSend(CFSTR("~/Library/SpringBoard/KnownWidgets.plist"), "stringByExpandingTildeInPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfFile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userInterfaceIdiom");

      WGTodayViewArchiveSetOrderedIdentifiersInGroup(v2, v3, CFSTR("TodayGroup"), 0);
      WGTodayViewArchiveGetOrderedIdentifiersInGroup(v2, CFSTR("TodayGroup"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WGTodayViewArchiveGetOrderedIdentifiersInGroup(v2, CFSTR("WidgetGroup"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            WGTodayViewArchiveSetKnownForIdentifier(v2, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17++), 0);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v7, "count"))
        objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("DefaultEnabled"));
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __WGTodayViewArchiveMigrateArchiveFromLegacy_block_invoke;
      v19[3] = &unk_24D732160;
      v20 = v4;
      v21 = v5;
      v18 = v5;
      WGTodayViewArchiveSave(v2, MEMORY[0x24BDAC9B8], v19);

    }
    else
    {
      v2 = 0;
    }

  }
}

void WGTodayViewArchiveSetOrderedIdentifiersInGroup(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7 && v8 && _WGTodayViewArchiveIsValidGroupKey(v9))
  {
    objc_msgSend(v7, "setObject:forKey:", v8, v9);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          WGTodayViewArchiveSetKnownForIdentifier(v7, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

    if (v10)
      WGTodayViewArchiveSave(v7, v10, 0);
  }

}

id WGTodayViewArchiveGetOrderedIdentifiersInGroup(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3
    || !_WGTodayViewArchiveIsValidGroupKey(v4)
    || (objc_msgSend(v3, "objectForKey:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void WGTodayViewArchiveSetKnownForIdentifier(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  if (v8 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Known"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Known"));
    }
    objc_msgSend(v7, "addObject:", v5);
    if (v6)
      WGTodayViewArchiveSave(v8, v6, 0);

  }
}

id WGTodayViewArchiveGetArchive(void *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  id v42;
  id v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  _BOOL4 v50;
  _BOOL4 v51;
  int v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  uint64_t *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v65 = a1;
  v64 = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(CFSTR("~/Library/SpringBoard/TodayViewArchive.plist"), "stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v67, "objectForKey:", CFSTR("Known"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v63);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Known"));

    }
    objc_msgSend(v67, "objectForKey:", CFSTR("Penalized"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v62);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("Penalized"));

    }
    objc_msgSend(v67, "objectForKey:", CFSTR("DisplayMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v8;
    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("DisplayMode"));

    }
    objc_msgSend(v67, "objectForKey:", CFSTR("TodayGroup"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
      objc_msgSend(v5, "setObject:forKey:", v58, CFSTR("TodayGroup"));
    objc_msgSend(v67, "objectForKey:", CFSTR("WidgetGroup"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      objc_msgSend(v5, "setObject:forKey:", v57, CFSTR("WidgetGroup"));
    objc_msgSend(v67, "objectForKey:", CFSTR("DefaultEnabled"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
      objc_msgSend(v65, "addObjectsFromArray:");
    objc_msgSend(v67, "objectForKey:", CFSTR("FavoriteGroup"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      objc_msgSend(v5, "setObject:forKey:", v55, CFSTR("FavoriteGroup"));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInterfaceIdiom");
    v11 = v5;
    v12 = v65;
    v13 = v64;
    v14 = v13;
    if (v11)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("WidgetGroup"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("TodayGroup"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = (id)objc_msgSend(v16, "mutableCopy");
        else
          v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v23 = v18;
        objc_msgSend(v11, "objectForKey:", CFSTR("WidgetGroup"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
          objc_msgSend(v23, "addObjectsFromArray:", v24);
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(v11, v23, CFSTR("TodayGroup"), 0);
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("WidgetGroup"));

        WGTodayViewArchiveSave(v11, v14, 0);
      }

      v25 = v11;
      v26 = v12;
      v27 = v14;
      v76 = 0;
      v77 = &v76;
      v78 = 0x2020000000;
      v79 = 0;
      WGTodayViewArchiveGetOrderedIdentifiersInGroup(v25, CFSTR("TodayGroup"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = ___WGTodayViewArchiveMigrateWidgetIdentifiers_block_invoke;
      v80[3] = &unk_24D732188;
      v81 = &unk_24D744538;
      v84 = &v76;
      v30 = v29;
      v82 = v30;
      v83 = v26;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v80);
      if (*((_BYTE *)v77 + 24))
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(v25, v30, CFSTR("TodayGroup"), v27);

      _Block_object_dispose(&v76, 8);
    }
    else
    {

      v21 = v12;
      v22 = v14;
    }

    v66 = v11;
    v61 = v12;
    v31 = v14;
    if (v11)
    {
      v53 = v31;
      v54 = (void *)objc_msgSend(v61, "copy");
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _WGTodayViewArchiveGetDefaultArchiveForIdiom(objc_msgSend(v32, "userInterfaceIdiom"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      _WGTodayViewArchiveGetEnabledIdentifiers(v60);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "mutableCopy");

      objc_msgSend(v66, "objectForKey:", CFSTR("Known"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "allObjects");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v37 = v36;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, &v76, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v69 != v39)
              objc_enumerationMutation(v37);
            objc_msgSend(v34, "removeObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, &v76, 16);
        }
        while (v38);
      }

      if (objc_msgSend(v34, "count"))
      {
        objc_msgSend(v61, "unionSet:", v34);
        v52 = objc_msgSend(v54, "isEqualToSet:", v61);
        v51 = _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(v60, v66, v34, CFSTR("TodayGroup"));
        v50 = _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(v60, v66, v34, CFSTR("WidgetGroup"));
        v41 = v60;
        v42 = v66;
        v43 = v34;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v44 = 0;
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v73 != v46)
                objc_enumerationMutation(v43);
              v48 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
              if (WGTodayViewArchiveGetDisplayModeForIdentifier(v41, v48) == 1)
              {
                WGTodayViewArchiveSetDisplayModeForIdentifier(v42, v48, 1, 0);
                v44 = 1;
              }
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
          }
          while (v45);
        }

        if (((v44 | v50 | v51 | v52 ^ 1) & 1) != 0)
          WGTodayViewArchiveSave(v42, v53, 0);
      }

      v31 = v53;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _WGTodayViewArchiveGetDefaultArchiveForIdiom(objc_msgSend(v19, "userInterfaceIdiom"));
    v66 = (id)objc_claimAutoreleasedReturnValue();

    _WGTodayViewArchiveGetEnabledIdentifiers(v66);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v65, "unionSet:", v20);
    WGTodayViewArchiveSave(v66, v64, 0);

  }
  return v66;
}

void sub_2173060A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

id _WGTodayViewArchiveGetDefaultArchiveForIdiom(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("DefaultTodayViewArchive~ipad");
  if (a1 != 1)
    v3 = 0;
  if (!a1)
    v3 = CFSTR("DefaultTodayViewArchive~iphone");
  v4 = v3;
  if (-[__CFString length](v4, "length"))
  {
    WGWidgetsFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v7;
    }

  }
  return v2;
}

id _WGTodayViewArchiveGetEnabledIdentifiers(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v1, "objectForKey:", CFSTR("TodayGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObjectsFromArray:", v3);
  objc_msgSend(v1, "objectForKey:", CFSTR("WidgetGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

uint64_t _WGTodayViewArchiveIsValidGroupKey(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqual:", CFSTR("TodayGroup")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("WidgetGroup")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqual:", CFSTR("FavoriteGroup"));
  }

  return v2;
}

void _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v12 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v12, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v7))
    {
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v11, "removeObject:", v7);
      WGTodayViewArchiveSetOrderedIdentifiersInGroup(v12, v11, v8, v9);

    }
  }

}

void WGTodayViewArchiveRemoveFromOrderedIdentifiers(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a1;
  v5 = a2;
  v6 = a3;
  if (v7 && objc_msgSend(v5, "length"))
  {
    _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(v7, v5, CFSTR("TodayGroup"), v6);
    _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(v7, v5, CFSTR("WidgetGroup"), v6);
  }

}

uint64_t WGTodayViewArchiveGetKnownForIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "objectForKey:", CFSTR("Known"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void WGTodayViewArchiveSetPenalizedForIdentifier(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  if (v8 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Penalized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Penalized"));
    }
    objc_msgSend(v7, "addObject:", v5);
    if (v6)
      WGTodayViewArchiveSave(v8, v6, 0);

  }
}

uint64_t WGTodayViewArchiveGetPenalizedForIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "objectForKey:", CFSTR("Penalized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void WGTodayViewArchiveSetDisplayModeForIdentifier(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a1;
  v7 = a2;
  v8 = a4;
  if (v11 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("DisplayMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("DisplayMode"));
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v7);

    if (v8)
      WGTodayViewArchiveSave(v11, v8, 0);

  }
}

uint64_t WGTodayViewArchiveGetDisplayModeForIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "objectForKey:", CFSTR("DisplayMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

BOOL _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WGTodayViewArchiveGetOrderedIdentifiersInGroup(v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v23 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsObject:", v18))
            objc_msgSend(v11, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WGTodayViewArchiveGetOrderedIdentifiersInGroup(v8, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      objc_msgSend(v19, "addObjectsFromArray:", v20);
    v7 = v23;
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v19, "addObjectsFromArray:", v11);
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(v8, v19, v10, 0);

  }
  v21 = objc_msgSend(v11, "count") != 0;

  return v21;
}

void sub_217308C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void WGRegisterWidgetsLogging()
{
  if (WGRegisterWidgetsLogging_onceToken != -1)
    dispatch_once(&WGRegisterWidgetsLogging_onceToken, &__block_literal_global_6);
}

uint64_t WGWidgetListSettingsFullCarousel()
{
  return 5;
}

uint64_t WGWidgetListSettingsTopCarousel()
{
  return 1;
}

BOOL WGWidgetListSettingsEqualsToWidgetListSettings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;

  v4 = (((unsigned __int16)a4 ^ (unsigned __int16)a2) & 0x101) == 0 && ((a4 ^ a2) & 0x10000) == 0;
  return a1 == a3 && v4;
}

void sub_217309B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;
  id *v18;

  v18 = v16;
  objc_destroyWeak(v18);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id WGPersistedStateURLForWidgetWithBundleIdentifier(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v3, CFSTR("State"), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-state"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_21730A0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const __CFString *WGShortStringFromLayoutMode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("[Unknown]");
  else
    return off_24D732320[a1 + 1];
}

__CFString *WGStringFromLayoutMode(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("[Unknown]");
  objc_msgSend(CFSTR("WGModalLayoutMode"), "stringByAppendingString:", off_24D732320[a1 + 1], v1, v2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_21730B034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21730B23C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21730BBC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21730C4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WGRoundToMainScreenScale()
{
  _WGMainScreenScale();
  return BSFloatRoundForScale();
}

uint64_t WGRectRoundForMainScreenScale()
{
  _WGMainScreenScale();
  return BSRectRoundForScale();
}

double WGMainScreenReferenceBounds()
{
  if (WGMainScreenReferenceBounds_onceToken != -1)
    dispatch_once(&WGMainScreenReferenceBounds_onceToken, &__block_literal_global_9);
  return *(double *)&WGMainScreenReferenceBounds___mainScreenReferenceBounds_0;
}

void sub_21730E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t _HandleKeybagLockStatusChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lockedStateDidChange");
}

void sub_21731147C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void InvalidateQueue(void *a1)
{
  dispatch_queue_t queue;

  if (a1)
  {
    queue = a1;
    SuspendQueueIfNecessary(queue);
    dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsValidTag", 0, 0);
    ResumeQueueIfNecessary(queue);

  }
}

void sub_217312E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731354C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t QueueName(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const char *QueueName(NSString *__strong, NSString *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WGWidgetHostingViewController.m"), 622, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[queueName length] > 0"));

  }
  v5 = v3;
  v6 = v5;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "UTF8String");

  return v8;
}

NSObject *NewSerialQueue(char *label)
{
  NSObject *v2;
  void *v4;
  void *v5;

  if (!label)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "dispatch_queue_t NewSerialQueue(const char *)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WGWidgetHostingViewController.m"), 631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v2 = dispatch_queue_create(label, 0);
  dispatch_queue_set_specific(v2, "_WGWidgetViewControllerQueueIsValidTag", (void *)1, 0);
  return v2;
}

void sub_2173148D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a11);
  _Unwind_Resume(a1);
}

void sub_217314EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2173155D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ValidateQueue(void *a1)
{
  dispatch_queue_t queue;

  if (a1)
  {
    queue = a1;
    SuspendQueueIfNecessary(queue);
    dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsValidTag", (void *)1, 0);
    ResumeQueueIfNecessary(queue);

  }
}

void sub_2173163C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x219A0A970](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void SuspendQueueIfNecessary(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  void *specific;
  NSObject *queue;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    queue = v1;
    specific = dispatch_queue_get_specific(v1, "_WGWidgetViewControllerQueueIsSuspendedTag");
    v2 = queue;
    if (!specific)
    {
      dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsSuspendedTag", (void *)1, 0);
      dispatch_suspend(queue);
      v2 = queue;
    }
  }

}

void ResumeQueueIfNecessary(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  void *specific;
  NSObject *queue;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    queue = v1;
    specific = dispatch_queue_get_specific(v1, "_WGWidgetViewControllerQueueIsSuspendedTag");
    v2 = queue;
    if (specific)
    {
      dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsSuspendedTag", 0, 0);
      dispatch_resume(queue);
      v2 = queue;
    }
  }

}

void sub_217318850(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_217318F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731A06C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21731A320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731AF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void sub_21731BE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731CB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731D290(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21731DC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731E394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void sub_21731E8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731F5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21731FE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217322AEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217322C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_5_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x24BE02960]();
}

uint64_t BBRemoveSavedChronologicalSectionInfo()
{
  return MEMORY[0x24BE0FDF8]();
}

uint64_t BBSavedChronologicalSectionOrder()
{
  return MEMORY[0x24BE0FE00]();
}

uint64_t BBSavedSectionInfo()
{
  return MEMORY[0x24BE0FE08]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x24BE0BAC0]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x24BE0BB50]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x24BE0BBC8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x24BE0BBD8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x24BE0BBF0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x24BE0BBF8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x24BE0BC00]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x24BE0BC10]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x24BE0BC38]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x24BE0BCB8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSRunLoopPerformAfterCACommit()
{
  return MEMORY[0x24BE0BCC8]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x24BE0BEF8]();
}

uint64_t BSXPCConnectionHasEntitlement()
{
  return MEMORY[0x24BE0BD70]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x24BDBE6D8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x24BED8438]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x24BED8460]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x24BED84D0]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x24BED84E0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x24BE67148]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x24BE67150]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t NCStringFromWidgetDisplayMode()
{
  return MEMORY[0x24BDE27D0]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6688](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t StocksAttributionString()
{
  return MEMORY[0x24BEB1418]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BDF7C90]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BDF7CA8]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BDF7CB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BDF7CE0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x24BDF7D00]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BDF7D98]();
}

uint64_t WAAttributionString()
{
  return MEMORY[0x24BEC1F00]();
}

uint64_t _BSUI_Private_IsN84()
{
  return MEMORY[0x24BE0BF60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x24BDF80F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x24BDADEF0](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
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

void objc_removeAssociatedObjects(id object)
{
  MEMORY[0x24BEDD290](object);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

