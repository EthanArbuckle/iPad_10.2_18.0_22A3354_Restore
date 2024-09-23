id PFPosterRolesSupportedForDeviceClass(uint64_t a1)
{
  id v1;
  uint64_t v3;
  uint64_t v4;

  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("PRPosterRoleLockScreen"), CFSTR("PRPosterRoleAmbient"), CFSTR("PRPosterRoleIncomingCall"), 0);
      goto LABEL_8;
    case 1:
      if (PFPosterRolesSupportedForDeviceClass_onceToken != -1)
        dispatch_once(&PFPosterRolesSupportedForDeviceClass_onceToken, &__block_literal_global);
      v1 = (id)PFPosterRolesSupportedForDeviceClass_roles;
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("PRPosterRoleAmbient"), 0, v3, v4);
LABEL_8:
      v1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

uint64_t PFPosterRoles()
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("PRPosterRoleLockScreen"), CFSTR("PRPosterRoleAmbient"), CFSTR("PRPosterRoleIncomingCall"), 0);
}

id PFPosterRolesSupportedForCurrentDeviceClass()
{
  if (PFPosterRolesSupportedForCurrentDeviceClass_onceToken != -1)
    dispatch_once(&PFPosterRolesSupportedForCurrentDeviceClass_onceToken, &__block_literal_global_10);
  return (id)PFPosterRolesSupportedForCurrentDeviceClass_appropriateForCurrentDeviceClass;
}

uint64_t PFPosterRoleIsValid(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    if (PFPosterRoleIsValid_onceToken != -1)
      dispatch_once(&PFPosterRoleIsValid_onceToken, &__block_literal_global_11);
    v3 = objc_msgSend((id)PFPosterRoleIsValid_validPosterRoles, "containsObject:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t PFPosterRoleSupportsDynamicDescriptors(void *a1)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall")) ^ 1;
}

void PFPosterRoleEnumerateValidRolesForCurrentDeviceClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  PFPosterRolesSupportedForCurrentDeviceClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __PFPosterRoleEnumerateValidRolesForCurrentDeviceClass_block_invoke;
  v4[3] = &unk_251543938;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void PFPosterRoleEnumerateAllRoles(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("PRPosterRoleLockScreen"), CFSTR("PRPosterRoleAmbient"), CFSTR("PRPosterRoleIncomingCall"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __PFPosterRoleEnumerateAllRoles_block_invoke;
  v4[3] = &unk_251543938;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

__CFString *PFPosterRoleDefaultRoleForCurrentExtensionProcess(int a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  __CFString *result;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PosterBoard")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PosterTester"));
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pf_defaultRole");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 || (v4 & 1) != 0)
  {
LABEL_10:

    return v6;
  }
  if (!a1)
  {
    PFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_2();

    v6 = CFSTR("PRPosterRoleLockScreen");
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to determine Role for process %@; error looking up bundle: %@"),
    v3,
    0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_1();
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PFPosterRolesKnownAmbient()
{
  if (PFPosterRolesKnownAmbient_onceToken != -1)
    dispatch_once(&PFPosterRolesKnownAmbient_onceToken, &__block_literal_global_23);
  return (id)PFPosterRolesKnownAmbient_knownBundleIdentifiers;
}

id PFPosterRolesKnownIncomingCall()
{
  if (PFPosterRolesKnownIncomingCall_onceToken != -1)
    dispatch_once(&PFPosterRolesKnownIncomingCall_onceToken, &__block_literal_global_34);
  return (id)PFPosterRolesKnownIncomingCall_knownBundleIdentifiers;
}

id PFPosterRolesKnownLockScreen()
{
  if (PFPosterRolesKnownLockScreen_onceToken != -1)
    dispatch_once(&PFPosterRolesKnownLockScreen_onceToken, &__block_literal_global_43);
  return (id)PFPosterRolesKnownLockScreen_knownBundleIdentifiers;
}

id PFProvidersForRole(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id result;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRPosterRoleAmbient")))
  {
    PFPosterRolesKnownAmbient();
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v3 = (void *)v2;

    return v3;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRPosterRoleLockScreen")))
  {
    PFPosterRolesKnownLockScreen();
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall")))
  {
    PFPosterRolesKnownIncomingCall();
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown role: %@"), v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    PFProvidersForRole_cold_1();
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PFPosterRolesForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  PFPosterRolesKnownAmbient();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v1);

  if (v4)
    objc_msgSend(v2, "addObject:", CFSTR("PRPosterRoleAmbient"));
  PFPosterRolesKnownLockScreen();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v1);

  if (v6)
    objc_msgSend(v2, "addObject:", CFSTR("PRPosterRoleLockScreen"));
  PFPosterRolesKnownIncomingCall();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v1);

  if (v8)
    objc_msgSend(v2, "addObject:", CFSTR("PRPosterRoleIncomingCall"));
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

__CFString *PFPosterDefaultRoleForBundleIdentifier(void *a1)
{
  void *v1;
  __CFString *v2;

  PFPosterRolesForBundleIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("PRPosterRoleLockScreen");
  }

  return v2;
}

_PFRoleManifest *PFRoleProviderForLSApplicationExtensionRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  _PFRoleManifest *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  _PFRoleManifest *v18;
  void *v19;
  _PFRoleManifest *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "infoDictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *MEMORY[0x24BDBD288];
      objc_opt_self();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:ofClass:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v3);

      if (v8)
      {
        v9 = v4;
      }
      else
      {
        v10 = objc_alloc(MEMORY[0x24BDD1488]);
        objc_msgSend(v2, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithURL:", v11);

        objc_msgSend(v12, "pf_roleManifest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_getAssociatedObject(v2, "roleManifest"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = v13;
        }
        else
        {
          PFPosterRolesForBundleIdentifier(v3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PFPosterDefaultRoleForBundleIdentifier(v3);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          v9 = 0;
          if (v15 && v16)
          {
            v18 = [_PFRoleManifest alloc];
            v21[0] = v5;
            v21[1] = CFSTR("PRSupportedRoles");
            v22[0] = v3;
            v22[1] = v15;
            v21[2] = CFSTR("PRDefaultRole");
            v22[2] = v17;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[_PFRoleManifest initWithInfoDictionary:](v18, "initWithInfoDictionary:", v19);

            objc_setAssociatedObject(v2, "roleManifest", v20, (void *)0x301);
            v9 = v20;
          }

        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_24462FFE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244630244(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2446305AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2446306A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244630900(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244630A48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PFTemporaryDirectory()
{
  if (PFTemporaryDirectory_onceToken != -1)
    dispatch_once(&PFTemporaryDirectory_onceToken, &__block_literal_global_1);
  return (id)PFTemporaryDirectory_pfProcessTempDirectory;
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t PFCurrentDeviceIsVirtualMachine()
{
  MEMORY[0x2495140EC]("BOOL PFCurrentDeviceIsVirtualMachine(void)");
  return 0;
}

uint64_t PFCurrentDeviceClass()
{
  void *v0;
  unsigned int v1;
  uint64_t v2;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue") - 1;
  if (v1 > 3)
    v2 = -1;
  else
    v2 = qword_244643638[v1];

  return v2;
}

uint64_t PFIsPhotosPosterProviderBundleId(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = PFIsPhotosPosterProviderBundleId_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&PFIsPhotosPosterProviderBundleId_onceToken, &__block_literal_global_4);
  v3 = objc_msgSend((id)PFIsPhotosPosterProviderBundleId_photosBundleIdentifiers, "containsObject:", v2);

  return v3;
}

uint64_t PFIsLegacyPosterBundleId(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.PaperBoard.LegacyPoster"));
}

uint64_t PFBundleIdentifierRequiresMemoryHogAssertion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.PaperBoard.LegacyPoster")) & 1) != 0)
    v2 = 1;
  else
    v2 = PFIsPhotosPosterProviderBundleId(v1);

  return v2;
}

uint64_t PF_IS_PAD_DEVICE()
{
  if (PF_IS_PAD_DEVICE_onceToken != -1)
    dispatch_once(&PF_IS_PAD_DEVICE_onceToken, &__block_literal_global_10_0);
  return PF_IS_PAD_DEVICE_isPad;
}

void sub_244633C0C(void *a1)
{
  void *v1;

  objc_begin_catch(a1);

  objc_exception_rethrow();
}

void sub_244633C1C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PFFileProtectionNoneAttributes()
{
  if (PFFileProtectionNoneAttributes_onceToken != -1)
    dispatch_once(&PFFileProtectionNoneAttributes_onceToken, &__block_literal_global_5);
  return (id)PFFileProtectionNoneAttributes___sharedInstance;
}

uint64_t PFServerPosterTypeFromDirectoryName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("staticdescriptors")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("descriptors")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("configurations")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t PFServerPosterTypeToDirectoryName(unint64_t a1)
{
  uint64_t result;
  void *v2;
  void *v3;
  void *v4;

  if (a1 - 1 < 3)
    return *((_QWORD *)&off_251543C80 + a1 - 1);
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromPFServerPosterType(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("cannot map PFServerPosterType %@ to a directoryName"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    PFServerPosterTypeToDirectoryName_cold_1((uint64_t)v4);
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

id NSStringFromPFServerPosterType(unint64_t a1)
{
  if (a1 < 4)
    return *((id *)&off_251543C98 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(lli)"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL PFServerPosterTypeIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

const __CFString *PFErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown error.");
  else
    return (const __CFString *)*((_QWORD *)&off_251543CC0 + a1 - 1);
}

id PFLogCommon()
{
  if (PFLogCommon_onceToken != -1)
    dispatch_once(&PFLogCommon_onceToken, &__block_literal_global_6);
  return (id)PFLogCommon___logObj;
}

id PFLogPosterContents()
{
  if (PFLogPosterContents_onceToken != -1)
    dispatch_once(&PFLogPosterContents_onceToken, &__block_literal_global_3);
  return (id)PFLogPosterContents___logObj;
}

id PFLogHosting()
{
  if (PFLogHosting_onceToken != -1)
    dispatch_once(&PFLogHosting_onceToken, &__block_literal_global_5);
  return (id)PFLogHosting___logObj;
}

id PFLogExtensions()
{
  if (PFLogExtensions_onceToken != -1)
    dispatch_once(&PFLogExtensions_onceToken, &__block_literal_global_7);
  return (id)PFLogExtensions___logObj;
}

id PFLogExtensionInstance()
{
  if (PFLogExtensionInstance_onceToken != -1)
    dispatch_once(&PFLogExtensionInstance_onceToken, &__block_literal_global_9);
  return (id)PFLogExtensionInstance___logObj;
}

void sub_244636D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_244638644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2446388B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_sync_exit(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_244638AB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244638BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244638CC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244638D4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244638DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_244638FC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24463910C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PFPosterPathFileAttributes()
{
  if (PFPosterPathFileAttributes_onceToken != -1)
    dispatch_once(&PFPosterPathFileAttributes_onceToken, &__block_literal_global_9);
  return (id)PFPosterPathFileAttributes___sharedInstance;
}

id PFPosterPathURLResourceValues()
{
  if (PFPosterPathURLResourceValues_onceToken != -1)
    dispatch_once(&PFPosterPathURLResourceValues_onceToken, &__block_literal_global_2_0);
  return (id)PFPosterPathURLResourceValues___sharedInstance;
}

void sub_24463BB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
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

void sub_24463BE28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24463C06C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PFPosterRole  _Nonnull PFPosterRoleDefaultRoleForCurrentExtensionProcess(BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_24462A000, MEMORY[0x24BDACB70], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_8();
}

void PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_2()
{
  os_log_t v0;
  uint8_t v1[14];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v2 = 0;
  _os_log_fault_impl(&dword_24462A000, v0, OS_LOG_TYPE_FAULT, "Unable to determine Role for process %{public}@; error looking up bundle: %{public}@",
    v1,
    0x16u);
}

void PFProvidersForRole_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSSet<NSString *> * _Nonnull PFProvidersForRole(__strong PFPosterRole _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_24462A000, MEMORY[0x24BDACB70], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_8();
}

void PFServerPosterTypeToDirectoryName_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull PFServerPosterTypeToDirectoryName(PFServerPosterType)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("PFServerPosterIdentity.m");
  v7 = 1024;
  v8 = 41;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x24BE0BD48]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x24BE0BEE8]();
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

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x24BDADF50]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x24BDAE028](workloop, frequency);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

