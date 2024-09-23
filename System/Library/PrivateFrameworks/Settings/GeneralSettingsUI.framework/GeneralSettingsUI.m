id _PSGLoggingFacility()
{
  if (_PSGLoggingFacility_onceToken != -1)
    dispatch_once(&_PSGLoggingFacility_onceToken, &__block_literal_global_4);
  return (id)_PSGLoggingFacility_oslog;
}

void sub_22E0290E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

id PSG_BundleForGeneralSettingsUIFramework()
{
  if (PSG_BundleForGeneralSettingsUIFramework_onceToken != -1)
    dispatch_once(&PSG_BundleForGeneralSettingsUIFramework_onceToken, &__block_literal_global_5);
  return (id)PSG_BundleForGeneralSettingsUIFramework__generalSettingsUIFrameworkBundle;
}

void sub_22E0297F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id PSG_LocalizedStringForGeneral(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_22E02A98C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11)
    (*(void (**)(void))(a11 + 16))();
  _Unwind_Resume(exception_object);
}

void sub_22E02B214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22E02F28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E02F468(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22E02F9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E02FB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getFMDFMIPManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("FMDFMIPManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getFMDFMIPManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SensorKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SensorKitLibraryCore_frameworkLibrary)
    SensorKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SensorKitLibraryCore_frameworkLibrary;
  if (!SensorKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSRAuthorizationClientClass_block_invoke(uint64_t a1)
{
  Class result;

  SensorKitLibrary();
  result = objc_getClass("SRAuthorizationClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSRAuthorizationClientClass_block_invoke_cold_1();
  getSRAuthorizationClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCHResetInventorySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreHandwritingLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CoreHandwritingLibraryCore_frameworkLibrary;
  }
  else
  {
    CoreHandwritingLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CoreHandwritingLibraryCore_frameworkLibrary;
    if (!CoreHandwritingLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CHResetInventory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCHResetInventorySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetOptionsClass_block_invoke_cold_1();
  getDDRResetOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void EmbeddedDataResetLibrary()
{
  void *v0;

  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
    EmbeddedDataResetLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getMBManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MobileBackupLibraryCore_frameworkLibrary)
  {
    MobileBackupLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileBackupLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getMBManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("MBManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getMBManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetRequestClass_block_invoke_cold_1();
  getDDRResetRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetServiceClass_block_invoke_cold_1();
  getDDRResetServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_22E0337F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E033C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

void sub_22E03479C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _isDeviceNameEditable()
{
  void *v1;
  uint64_t v2;

  if ((objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isDeviceNameModificationAllowed");

  return v2;
}

void sub_22E038D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t _shouldShowAccessoryInfo(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = a1;
  if ((objc_msgSend(v1, "shouldBeHiddenFromUI") & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v1, "bonjourName");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(v1, "isAvailableOverBonjour");

    if (!v4)
      goto LABEL_9;
  }
  objc_msgSend(v1, "bonjourName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((objc_msgSend(v1, "isConnected") & 1) != 0)
      goto LABEL_7;
LABEL_9:
    v7 = 0;
    goto LABEL_27;
  }

LABEL_7:
  objc_msgSend(v1, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v1, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v1, "modelNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v1, "firmwareRevision");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          v7 = 1;
        }
        else
        {
          objc_msgSend(v1, "hardwareRevision");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(v1, "bonjourName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "length"))
              v7 = 1;
            else
              v7 = objc_msgSend(v1, "supportsPublicIap");

          }
        }

      }
    }

  }
LABEL_27:

  return v7;
}

uint64_t HostRenamedDevice(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_898);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t TimeZoneConfirmed(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadTimezone");
}

void sub_22E0408B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PSGSignpostLoggingFacility()
{
  if (_PSGSignpostLoggingFacility_onceToken != -1)
    dispatch_once(&_PSGSignpostLoggingFacility_onceToken, &__block_literal_global_3);
  return (id)_PSGSignpostLoggingFacility_oslog;
}

void PSGGreenTeaAppListLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  if (PSGGreenTeaLoggerForAppListing_onceToken != -1)
    dispatch_once(&PSGGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_5);
  if (PSGGreenTeaLoggerForAppListing_appListLogger)
  {
    getCTGreenTeaOsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v9, &a9);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);

    }
  }

}

void PSGGreenTeaIMEILog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  if (PSGGreenTeaLoggerForIMEI_onceToken != -1)
    dispatch_once(&PSGGreenTeaLoggerForIMEI_onceToken, &__block_literal_global_7);
  if (PSGGreenTeaLoggerForIMEI_psgIMEILogger)
  {
    getCTGreenTeaOsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v9, &a9);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);

    }
  }

}

void PSGGreenTeaWLANHardwareAddressLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  if (PSGGreenTeaLoggerForWLANHardwareAddress_onceToken != -1)
    dispatch_once(&PSGGreenTeaLoggerForWLANHardwareAddress_onceToken, &__block_literal_global_9);
  if (PSGGreenTeaLoggerForWLANHardwareAddress_psgWLANLogger)
  {
    getCTGreenTeaOsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v9, &a9);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);

    }
  }

}

void PSGGreenTeaBluetoothHardwareAddressLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  if (PSGGreenTeaLoggerForBluetoothHardwareAddress_onceToken != -1)
    dispatch_once(&PSGGreenTeaLoggerForBluetoothHardwareAddress_onceToken, &__block_literal_global_11);
  if (PSGGreenTeaLoggerForBluetoothHardwareAddress_psgBluetoothLogger)
  {
    getCTGreenTeaOsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v9, &a9);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_22E024000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);

    }
  }

}

id PSG_LocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForAbout(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("About"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForAutomaticContentDownload(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("AutomaticContentDownload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForBackupAlert(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("BackupAlert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForBackupInfo(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("BackupInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForContinuity(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Continuity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForDateAndTime(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Date & Time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForHomeButton(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("HomeButton-sshb"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForModelNames(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("ModelNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForNFC(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Nfc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForPointers(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Pointers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForPointersHiding(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Pointers-R418-R428"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForReset(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Reset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForMatter(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Matter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForWombat(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Wombat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSG_LocalizedStringForLOTX(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("LOTX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22E04A160(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E04A1E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E04AB10(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22E04ABD0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E04B1C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22E04B270(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E04B6B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22E04BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E04C1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRCarPlayPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  CarKitLibrary();
  result = objc_getClass("CRCarPlayPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCRCarPlayPreferencesClass_block_invoke_cold_1();
  getCRCarPlayPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CarKitLibrary()
{
  void *v0;

  if (!CarKitLibraryCore_frameworkLibrary)
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getBFFStyleClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("BFFStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getBFFStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCRPairedVehicleManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  CarKitLibrary();
  result = objc_getClass("CRPairedVehicleManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCRPairedVehicleManagerClass_block_invoke_cold_1();
  getCRPairedVehicleManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22E04D81C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_22E04E594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E04EA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBFFStyleClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBFFStyleClass_softClass_0;
  v7 = getBFFStyleClass_softClass_0;
  if (!getBFFStyleClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBFFStyleClass_block_invoke_0;
    v3[3] = &unk_24F9C8058;
    v3[4] = &v4;
    __getBFFStyleClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22E04EB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  Class result;

  SetupAssistantUILibrary();
  result = objc_getClass("BFFStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBFFStyleClass_block_invoke_cold_1();
  getBFFStyleClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SetupAssistantUILibrary()
{
  void *v0;

  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBFFPaneHeaderViewClass_block_invoke(uint64_t a1)
{
  Class result;

  SetupAssistantUILibrary();
  result = objc_getClass("BFFPaneHeaderView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBFFPaneHeaderViewClass_block_invoke_cold_1();
  getBFFPaneHeaderViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22E051464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E0515D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E0516B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051730(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051960(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051AB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051BF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051D3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E051E88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

size_t sub_22E053A94(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  size_t result;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE v18[32];
  _QWORD v19[4];
  uint64_t v20;

  v2 = v1;
  v17 = sub_22E056578();
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x24BEE4AF8];
    if (!v7)
      return v8;
    v20 = MEMORY[0x24BEE4AF8];
    result = sub_22E0541B8(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v16 = v2;
    v10 = 0;
    v8 = v20;
    v2 = a1 & 0xC000000000000001;
    while (v7 != v10)
    {
      if (v2)
        v11 = (id)MEMORY[0x22E324144](v10, a1);
      else
        v11 = *(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      v19[3] = sub_22E0544F4();
      v19[0] = v12;
      sub_22E054530((uint64_t)v19, (uint64_t)v18);
      v13 = v12;
      sub_22E05656C();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);

      v20 = v8;
      v15 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_22E0541B8(v14 > 1, v15 + 1, 1);
        v8 = v20;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v15, v6, v17);
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v7 = sub_22E0566B0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id EmitNavigationEventWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EmitNavigationEventWrapper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EmitNavigationEventWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22E053E24(uint64_t a1, uint64_t a2)
{
  return sub_22E053F6C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22E053E30(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22E056638();
  *a2 = 0;
  return result;
}

uint64_t sub_22E053EA4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22E056644();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22E053F20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22E056650();
  v2 = sub_22E05662C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22E053F60(uint64_t a1, uint64_t a2)
{
  return sub_22E053F6C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22E053F6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22E056650();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22E053FA8()
{
  sub_22E056650();
  sub_22E05665C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E053FE8()
{
  uint64_t v0;

  sub_22E056650();
  sub_22E0566E0();
  sub_22E05665C();
  v0 = sub_22E0566EC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E054058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22E056650();
  v2 = v1;
  if (v0 == sub_22E056650() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22E0566D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22E0540E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22E05662C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22E054124@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22E056650();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22E05414C()
{
  sub_22E054690(&qword_255DF46F0, (uint64_t)&unk_22E059570);
  sub_22E054690(&qword_255DF46F8, (uint64_t)&unk_22E0594C4);
  return sub_22E0566C8();
}

size_t sub_22E0541B8(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_22E0541D4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_22E0541D4(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DF46C8);
  v10 = *(_QWORD *)(sub_22E056578() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_22E056578() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_22E054348(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;

  v18 = a5;
  v19 = sub_22E056578();
  v9 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22E0565E4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t *)((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22E056608();
  sub_22E0565FC();
  *v15 = a1;
  v15[1] = a2;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE85558], v12);
  v21 = sub_22E0544F4();
  v20 = a3;
  swift_bridgeObjectRetain();
  v16 = a3;
  sub_22E05656C();
  sub_22E053A94(a4);
  sub_22E0565F0();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t type metadata accessor for EmitNavigationEventWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for EmitNavigationEventWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static EmitNavigationEventWrapper.generalEmitNavigationEventForSystemSetting(withGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_22E0544F4()
{
  unint64_t result;

  result = qword_255DF46C0;
  if (!qword_255DF46C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DF46C0);
  }
  return result;
}

uint64_t sub_22E054530(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E324D20]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for Key()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255DF46D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255DF46D0);
  }
}

uint64_t sub_22E054624()
{
  return sub_22E054690(&qword_255DF46D8, (uint64_t)&unk_22E059488);
}

uint64_t sub_22E054648()
{
  return sub_22E054690(&qword_255DF46E0, (uint64_t)&unk_22E05945C);
}

uint64_t sub_22E05466C()
{
  return sub_22E054690(&qword_255DF46E8, (uint64_t)&unk_22E0594F8);
}

uint64_t sub_22E054690(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    result = MEMORY[0x22E324D38](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_22E0546D0(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t inited;
  void **v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v6 = sub_22E0565C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22E0565D8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_target);

    v42 = v10;
    v43 = v7;
    v40 = a2;
    v41 = v11;
    if (v16)
    {
      objc_opt_self();
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v39 = v17;
        v16 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v19 = (void *)objc_opt_self();
        v20 = (void *)sub_22E05662C();
        v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DF4700);
        inited = swift_initStackObject();
        v23 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_22E0592D0;
        v24 = *v23;
        *(_QWORD *)(inited + 32) = *v23;
        v25 = (void *)objc_opt_self();
        v26 = v18;
        swift_bridgeObjectRetain();
        v27 = v24;
        v28 = objc_msgSend(v25, sel_labelColor);
        v29 = objc_msgSend(v28, sel_colorWithAlphaComponent_, a3);

        *(_QWORD *)(inited + 64) = sub_22E0555AC(0, &qword_255DF4708);
        *(_QWORD *)(inited + 40) = v29;
        sub_22E054BA4(inited);
        v30 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v31 = (void *)sub_22E05662C();
        swift_bridgeObjectRelease();
        type metadata accessor for Key();
        sub_22E055644(&qword_255DF46F0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E059570);
        v32 = (void *)sub_22E056620();
        swift_bridgeObjectRelease();
        v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, v32);

        objc_msgSend(v26, sel_setAttributedText_, v33);
        sub_22E0555AC(0, &qword_255DF4710);
        v34 = (void *)sub_22E056680();
        v35 = swift_allocObject();
        *(_QWORD *)(v35 + 16) = v16;
        *(_QWORD *)(v35 + 24) = v26;
        aBlock[4] = sub_22E055610;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22E054CBC;
        aBlock[3] = &block_descriptor;
        v36 = _Block_copy(aBlock);
        v37 = v16;
        swift_release();
        sub_22E0565CC();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_22E055644(&qword_255DF4718, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DF4720);
        sub_22E055684(&qword_255DF4728, &qword_255DF4720, MEMORY[0x24BEE12C8]);
        sub_22E056698();
        MEMORY[0x22E32412C](0, v13, v9, v36);

        _Block_release(v36);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v42);
      }
      swift_unknownObjectRelease();
      v16 = 0;
    }
    v39 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_22E054BA4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DF4730);
  v2 = sub_22E0566BC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22E0556C4(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_22E0550C0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_22E05570C(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22E054CBC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22E054CE8()
{
  uint64_t ObjCClassFromMetadata;
  void *v1;
  id v2;

  type metadata accessor for PSGGeneralPlacardCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v2 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_22E056560();

  swift_retain();
  return sub_22E056614();
}

id sub_22E054E7C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_22E05662C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_22E05506C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PSGGeneralPlacardCell()
{
  return objc_opt_self();
}

unint64_t sub_22E0550C0(uint64_t a1)
{
  uint64_t v2;

  sub_22E056650();
  sub_22E0566E0();
  sub_22E05665C();
  v2 = sub_22E0566EC();
  swift_bridgeObjectRelease();
  return sub_22E055140(a1, v2);
}

unint64_t sub_22E055140(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_22E056650();
    v8 = v7;
    if (v6 == sub_22E056650() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22E0566D4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_22E056650();
          v15 = v14;
          if (v13 == sub_22E056650() && v15 == v16)
            break;
          v18 = sub_22E0566D4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_22E0552B4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  id (*v16)(double);
  _QWORD *v17;
  uint64_t v18[5];

  v1 = v0;
  swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253DA4648);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = sub_22E056560();
  v10 = v9;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v1;
  v11[3] = v8;
  v11[4] = v10;
  v14 = v8;
  v15 = v10;
  v16 = sub_22E055514;
  v17 = v11;
  v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DA4688);
  sub_22E055684(&qword_253DA4680, &qword_253DA4688, MEMORY[0x24BE855C8]);
  sub_22E0565A8();
  swift_bridgeObjectRelease();
  sub_22E0565B4();
  v18[3] = v2;
  v18[4] = sub_22E055684(&qword_253DA4678, &qword_253DA4648, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_22E05659C();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  MEMORY[0x22E324114](v18);
  return swift_release();
}

uint64_t sub_22E0554E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_22E055514(double a1)
{
  uint64_t v1;

  return sub_22E0546D0(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_22E055520()
{
  return sub_22E054CE8();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E324D2C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22E0555AC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22E0555E4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22E055610()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_22E055644(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E324D38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E055684(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E324D38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E0556C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DF4738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22E05570C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22E05571C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSRAuthorizationClientClass_block_invoke_cold_1(v0);
}

void __getSRAuthorizationClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getDDRResetOptionsClass_block_invoke_cold_1(v0);
}

void __getDDRResetOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMBManagerClass_block_invoke_cold_1(v0);
}

void __getMBManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  __getDDRResetRequestClass_block_invoke_cold_1();
}

void __getDDRResetRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getDDRResetServiceClass_block_invoke_cold_1(v0);
}

void __getDDRResetServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[PSGSEIDDetailsController _setupSEIDSpecifier].cold.1(v0);
}

void __getCRCarPlayPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getBFFStyleClass_block_invoke_cold_1(v0);
}

void __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCRPairedVehicleManagerClass_block_invoke_cold_1(v0);
}

void __getCRPairedVehicleManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:].cold.1(v0);
}

void __getBFFPaneHeaderViewClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_22E056560();
}

uint64_t sub_22E056560()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22E05656C()
{
  return MEMORY[0x24BDCD308]();
}

uint64_t sub_22E056578()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_22E056584()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22E056590()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22E05659C()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_22E0565A8()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_22E0565B4()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_22E0565C0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22E0565CC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22E0565D8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22E0565E4()
{
  return MEMORY[0x24BE85560]();
}

uint64_t sub_22E0565F0()
{
  return MEMORY[0x24BE85578]();
}

uint64_t sub_22E0565FC()
{
  return MEMORY[0x24BE85588]();
}

uint64_t sub_22E056608()
{
  return MEMORY[0x24BE85590]();
}

uint64_t sub_22E056614()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_22E056620()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22E05662C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22E056638()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22E056644()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22E056650()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22E05665C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22E056668()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22E056674()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_22E056680()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22E05668C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22E056698()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22E0566A4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22E0566B0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22E0566BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22E0566C8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22E0566D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22E0566E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22E0566EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ALGetPhotosAndVideosCount()
{
  return MEMORY[0x24BE72208]();
}

uint64_t ALRegisterForPhotosAndVideosCount()
{
  return MEMORY[0x24BE72210]();
}

uint64_t ALUnregisterForPhotosAndVideosCount()
{
  return MEMORY[0x24BE72218]();
}

uint64_t APFSVolumeGetSpaceInfo()
{
  return MEMORY[0x24BDFD2B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBBD60](allocator, formatter, at);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x24BE1FAA0]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC760]();
}

void CFTimeZoneResetSystem(void)
{
  MEMORY[0x24BDBC788]();
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CTCallDial()
{
  return MEMORY[0x24BDC25A8]();
}

uint64_t CTSettingCopyEffectiveSimInfo()
{
  return MEMORY[0x24BDC26A8]();
}

uint64_t CTStartManualOTASP()
{
  return MEMORY[0x24BDC26C8]();
}

uint64_t DeviceName()
{
  return MEMORY[0x24BE75428]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x24BDD87E0]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x24BDD87F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8828](blob, ps);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x24BE758F0]();
}

uint64_t PSCityForSpecifier()
{
  return MEMORY[0x24BE75960]();
}

uint64_t PSCityForTimeZone()
{
  return MEMORY[0x24BE75968]();
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x24BE75A88]();
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x24BE75A98]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x24BE75AF0]();
}

uint64_t PSIsLocationRestricted()
{
  return MEMORY[0x24BE75B00]();
}

uint64_t PSLegacyCityFromCity()
{
  return MEMORY[0x24BE75BA0]();
}

uint64_t PSLocaleUses24HourClock()
{
  return MEMORY[0x24BE75BA8]();
}

uint64_t PSStockholmLocallyStoredValuePassNames()
{
  return MEMORY[0x24BE75CD8]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x24BE75D80]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x24BE75DB0]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x24BE75DB8]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x24BE75DC0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x24BE75DC8]();
}

uint64_t SBSIsReachabilityEnabled()
{
  return MEMORY[0x24BEB0C90]();
}

uint64_t SBSPresentPowerDownUI()
{
  return MEMORY[0x24BEB0CF0]();
}

uint64_t SBSResetHomeScreenLayout()
{
  return MEMORY[0x24BEB0D28]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x24BDF5708]();
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5720](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x24BE857A0]();
}

uint64_t SUSUISettingsIsBadgedForSoftwareUpdate()
{
  return MEMORY[0x24BEAEF58]();
}

uint64_t SUStringFromOSUpdateType()
{
  return MEMORY[0x24BEAEDD0]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x24BDE8830]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C78](server, hostname);
}

uint64_t SecTrustStoreCopyAll()
{
  return MEMORY[0x24BDE8E70]();
}

uint64_t SecTrustStoreCopyUsageConstraints()
{
  return MEMORY[0x24BDE8E78]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x24BDE8E80]();
}

uint64_t SecTrustStoreGetSettingsAssetVersionNumber()
{
  return MEMORY[0x24BDE8E88]();
}

uint64_t SecTrustStoreGetSettingsVersionNumber()
{
  return MEMORY[0x24BDE8E90]();
}

uint64_t SecTrustStoreSetTrustSettings()
{
  return MEMORY[0x24BDE8EA0]();
}

uint64_t SetDeviceName()
{
  return MEMORY[0x24BE75DE8]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x24BE75DF8]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x24BEB37C0]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x24BEB37F8]();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return MEMORY[0x24BE289A8]();
}

uint64_t TMIsTimeZoneConfirmed()
{
  return MEMORY[0x24BE289B0]();
}

uint64_t TMSetAutomaticTimeEnabled()
{
  return MEMORY[0x24BE289C0]();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return MEMORY[0x24BE289C8]();
}

uint64_t TMSetManualTime()
{
  return MEMORY[0x24BE289D0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x24BDBCFA8]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CTServerConnectionCopyFirmwareVersion()
{
  return MEMORY[0x24BDC2840]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionEraseBasebandSettings()
{
  return MEMORY[0x24BDC28B0]();
}

uint64_t _CTServerConnectionGetResetCellularAccountSettingsIsAllowed()
{
  return MEMORY[0x24BDC2900]();
}

uint64_t _CTServerConnectionGetUpdatedCarrierBundle()
{
  return MEMORY[0x24BDC2908]();
}

uint64_t _CTServerConnectionResetModem()
{
  return MEMORY[0x24BDC2930]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x24BED3BC0]();
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t lockdown_delete_pair_records()
{
  return MEMORY[0x24BEDC508]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x24BDE17E8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1818]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1848]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x24BDE19A0](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

