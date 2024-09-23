uint64_t SASExpressSettingsPrivacyBundleReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v19;
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

void sub_1D460015C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4601C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4601E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
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

void sub_1D4602060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4602204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D460240C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSUManagerClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
  {
    SoftwareUpdateServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUManagerClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSUManagerClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSUManagerClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNRMigratorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRMigrator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRMigratorClass_block_invoke_cold_1();
    free(v3);
  }
  getNRMigratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBBundleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBBundle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBBundleClass_block_invoke_cold_1();
    free(v3);
  }
  getOBBundleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUISUserInterfaceStyleModeClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    UIKitServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UISUserInterfaceStyleMode");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUISUserInterfaceStyleModeClass_block_invoke_cold_1();
    free(v3);
  }
  getUISUserInterfaceStyleModeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!QuartzCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CADisplay");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCADisplayClass_block_invoke_cold_1();
    free(v3);
  }
  getCADisplayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D46033CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4603958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

uint64_t SASExpressSettingsReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  SASExpressSettingsPrivacyBundle *v85;
  uint64_t v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  void *v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_141;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_143;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_141:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_143:
        v111 = 88;
        goto LABEL_188;
      case 2u:
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 104;
        goto LABEL_139;
      case 3u:
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 96;
        goto LABEL_139;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_WORD *)(a1 + 124) |= 8u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v28 = 0;
                goto LABEL_147;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_147:
        v112 = v28 != 0;
        v113 = 113;
        goto LABEL_201;
      case 5u:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        *(_WORD *)(a1 + 124) |= 4u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v14 = v33++ >= 9;
              if (v14)
              {
                v34 = 0;
                goto LABEL_151;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v34 = 0;
LABEL_151:
        v112 = v34 != 0;
        v113 = 112;
        goto LABEL_201;
      case 6u:
        v38 = 0;
        v39 = 0;
        v40 = 0;
        *(_WORD *)(a1 + 124) |= 0x40u;
        while (2)
        {
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              v14 = v39++ >= 9;
              if (v14)
              {
                v40 = 0;
                goto LABEL_155;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v40 = 0;
LABEL_155:
        v112 = v40 != 0;
        v113 = 116;
        goto LABEL_201;
      case 7u:
        v44 = 0;
        v45 = 0;
        v46 = 0;
        *(_WORD *)(a1 + 124) |= 0x20u;
        while (2)
        {
          v47 = *v3;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v14 = v45++ >= 9;
              if (v14)
              {
                v46 = 0;
                goto LABEL_159;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v46 = 0;
LABEL_159:
        v112 = v46 != 0;
        v113 = 115;
        goto LABEL_201;
      case 8u:
        v50 = 0;
        v51 = 0;
        v52 = 0;
        *(_WORD *)(a1 + 124) |= 0x200u;
        while (2)
        {
          v53 = *v3;
          v54 = *(_QWORD *)(a2 + v53);
          if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
            *(_QWORD *)(a2 + v53) = v54 + 1;
            v52 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              v14 = v51++ >= 9;
              if (v14)
              {
                v52 = 0;
                goto LABEL_163;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v52 = 0;
LABEL_163:
        v112 = v52 != 0;
        v113 = 119;
        goto LABEL_201;
      case 9u:
        v56 = 0;
        v57 = 0;
        v58 = 0;
        *(_WORD *)(a1 + 124) |= 0x80u;
        while (2)
        {
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 1;
            v58 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              v14 = v57++ >= 9;
              if (v14)
              {
                v58 = 0;
                goto LABEL_167;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v58 = 0;
LABEL_167:
        v112 = v58 != 0;
        v113 = 117;
        goto LABEL_201;
      case 0xAu:
        v62 = 0;
        v63 = 0;
        v64 = 0;
        *(_WORD *)(a1 + 124) |= 0x1000u;
        while (2)
        {
          v65 = *v3;
          v66 = *(_QWORD *)(a2 + v65);
          if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
            *(_QWORD *)(a2 + v65) = v66 + 1;
            v64 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v14 = v63++ >= 9;
              if (v14)
              {
                v64 = 0;
                goto LABEL_171;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v64 = 0;
LABEL_171:
        v112 = v64 != 0;
        v113 = 122;
        goto LABEL_201;
      case 0xBu:
        v68 = 0;
        v69 = 0;
        v70 = 0;
        *(_WORD *)(a1 + 124) |= 0x800u;
        while (2)
        {
          v71 = *v3;
          v72 = *(_QWORD *)(a2 + v71);
          if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
            *(_QWORD *)(a2 + v71) = v72 + 1;
            v70 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v14 = v69++ >= 9;
              if (v14)
              {
                v70 = 0;
                goto LABEL_175;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v70 = 0;
LABEL_175:
        v112 = v70 != 0;
        v113 = 121;
        goto LABEL_201;
      case 0xCu:
        v74 = 0;
        v75 = 0;
        v76 = 0;
        *(_WORD *)(a1 + 124) |= 0x100u;
        while (2)
        {
          v77 = *v3;
          v78 = *(_QWORD *)(a2 + v77);
          if (v78 == -1 || v78 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
            *(_QWORD *)(a2 + v77) = v78 + 1;
            v76 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              v14 = v75++ >= 9;
              if (v14)
              {
                v76 = 0;
                goto LABEL_179;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v76 = 0;
LABEL_179:
        v112 = v76 != 0;
        v113 = 118;
        goto LABEL_201;
      case 0xDu:
        v80 = 0;
        v81 = 0;
        v19 = 0;
        *(_WORD *)(a1 + 124) |= 1u;
        while (2)
        {
          v82 = *v3;
          v83 = *(_QWORD *)(a2 + v82);
          if (v83 == -1 || v83 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v84 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v83);
            *(_QWORD *)(a2 + v82) = v83 + 1;
            v19 |= (unint64_t)(v84 & 0x7F) << v80;
            if (v84 < 0)
            {
              v80 += 7;
              v14 = v81++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_183;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_183:
        v111 = 16;
        goto LABEL_188;
      case 0xEu:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        v86 = 24;
        goto LABEL_105;
      case 0xFu:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        v86 = 8;
        goto LABEL_105;
      case 0x10u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        v86 = 56;
        goto LABEL_105;
      case 0x11u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        v86 = 48;
        goto LABEL_105;
      case 0x12u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        v86 = 80;
LABEL_105:
        objc_storeStrong((id *)(a1 + v86), v85);
        if (PBReaderPlaceMark() && (SASExpressSettingsPrivacyBundleReadFrom((uint64_t)v85, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_202:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0x13u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 64;
        goto LABEL_139;
      case 0x14u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 32;
        goto LABEL_139;
      case 0x15u:
        v87 = 0;
        v88 = 0;
        v19 = 0;
        *(_WORD *)(a1 + 124) |= 2u;
        while (2)
        {
          v89 = *v3;
          v90 = *(_QWORD *)(a2 + v89);
          if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
            *(_QWORD *)(a2 + v89) = v90 + 1;
            v19 |= (unint64_t)(v91 & 0x7F) << v87;
            if (v91 < 0)
            {
              v87 += 7;
              v14 = v88++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_187;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_187:
        v111 = 40;
LABEL_188:
        *(_DWORD *)(a1 + v111) = v19;
        goto LABEL_202;
      case 0x16u:
        v92 = 0;
        v93 = 0;
        v94 = 0;
        *(_WORD *)(a1 + 124) |= 0x2000u;
        while (2)
        {
          v95 = *v3;
          v96 = *(_QWORD *)(a2 + v95);
          if (v96 == -1 || v96 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v96);
            *(_QWORD *)(a2 + v95) = v96 + 1;
            v94 |= (unint64_t)(v97 & 0x7F) << v92;
            if (v97 < 0)
            {
              v92 += 7;
              v14 = v93++ >= 9;
              if (v14)
              {
                v94 = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v94 = 0;
LABEL_192:
        v112 = v94 != 0;
        v113 = 123;
        goto LABEL_201;
      case 0x17u:
        v98 = 0;
        v99 = 0;
        v100 = 0;
        *(_WORD *)(a1 + 124) |= 0x10u;
        while (2)
        {
          v101 = *v3;
          v102 = *(_QWORD *)(a2 + v101);
          if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
            *(_QWORD *)(a2 + v101) = v102 + 1;
            v100 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              v14 = v99++ >= 9;
              if (v14)
              {
                v100 = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v100 = 0;
LABEL_196:
        v112 = v100 != 0;
        v113 = 114;
        goto LABEL_201;
      case 0x18u:
        v104 = 0;
        v105 = 0;
        v106 = 0;
        *(_WORD *)(a1 + 124) |= 0x400u;
        while (2)
        {
          v107 = *v3;
          v108 = *(_QWORD *)(a2 + v107);
          if (v108 == -1 || v108 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
            *(_QWORD *)(a2 + v107) = v108 + 1;
            v106 |= (unint64_t)(v109 & 0x7F) << v104;
            if (v109 < 0)
            {
              v104 += 7;
              v14 = v105++ >= 9;
              if (v14)
              {
                v106 = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v106 = 0;
LABEL_200:
        v112 = v106 != 0;
        v113 = 120;
LABEL_201:
        *(_BYTE *)(a1 + v113) = v112;
        goto LABEL_202;
      case 0x19u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 72;
LABEL_139:
        v110 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_202;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_202;
    }
  }
}

void sub_1D460A764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose((const void *)(v7 - 64), 8);
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

void sub_1D460B9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t scanComplete(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "wirelessScanComplete:error:", a2, a3);
}

id getCLLocationManagerClass()
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
  v0 = (void *)getCLLocationManagerClass_softClass;
  v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1E97DC4E8;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D460BADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D460BF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D460C1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
  {
    FindMyDeviceLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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

uint64_t SetupAssistantLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getCLLocationManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSRVoiceProfileManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
  {
    SpeakerRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSSRVoiceProfileManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("SSRVoiceProfileManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getSSRVoiceProfileManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBYLicenseAgreementClass_block_invoke(uint64_t a1)
{
  Class result;

  SetupAssistantLibrary();
  result = objc_getClass("BYLicenseAgreement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBYLicenseAgreementClass_block_invoke_cold_1();
  getBYLicenseAgreementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreTelephonyLibrary();
  result = objc_getClass("CoreTelephonyClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCoreTelephonyClientClass_block_invoke_cold_1();
  getCoreTelephonyClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreTelephonyLibrary()
{
  void *v0;

  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCTServiceDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreTelephonyLibrary();
  result = objc_getClass("CTServiceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCTServiceDescriptorClass_block_invoke_cold_1();
  getCTServiceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_1();
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSUManagerClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSUManagerClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNRMigratorClass_block_invoke_cold_1(v0);
}

uint64_t __getNRMigratorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBBundleClass_block_invoke_cold_1(v0);
}

uint64_t __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFMDFMIPManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTManagementStateClass_block_invoke_cold_1(v0);
}

uint64_t __getSTManagementStateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUISUserInterfaceStyleModeClass_block_invoke_cold_1(v0);
}

uint64_t __getUISUserInterfaceStyleModeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCADisplayClass_block_invoke_cold_1(v0);
}

uint64_t __getCADisplayClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1(v0);
}

void __getMBManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  __getCLLocationManagerClass_block_invoke_cold_1();
}

void __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSSRVoiceProfileManagerClass_block_invoke_cold_1(v0);
}

void __getSSRVoiceProfileManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getBYLicenseAgreementClass_block_invoke_cold_1(v0);
}

void __getBYLicenseAgreementClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCoreTelephonyClientClass_block_invoke_cold_1(v0);
}

void __getCoreTelephonyClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCTServiceDescriptorClass_block_invoke_cold_1(v0);
}

void __getCTServiceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMCProfileConnectionClass_block_invoke_cold_1(v0);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  const __CFArray *v0;

  v0 = (const __CFArray *)abort_report_np();
  CFArrayGetCount(v0);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return MEMORY[0x1E0D1A640]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1E0D4FAF8]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1E0D4FBA0]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x1E0D4FBF8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x1E0D4FCD0]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x1E0D4FCD8]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x1E0D4FD48]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1E0D4FD60]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x1E0D4FD70]();
}

uint64_t WiFiNetworkIsExpirable()
{
  return MEMORY[0x1E0D4FD78]();
}

uint64_t WiFiNetworkIsProfileBased()
{
  return MEMORY[0x1E0D4FDA0]();
}

uint64_t _AXSCopySettingsDataBlobForBuddy()
{
  return MEMORY[0x1E0DDD6C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

