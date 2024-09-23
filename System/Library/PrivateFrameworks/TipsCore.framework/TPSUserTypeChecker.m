@implementation TPSUserTypeChecker

+ (int64_t)userType
{
  int64_t v3;
  void *v4;

  v3 = objc_msgSend((id)objc_opt_class(), "userTypeOverride");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = objc_msgSend(a1, "userTypeFromMigratorData");
    if (!v3)
    {
      v4 = (void *)MGGetStringAnswer();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
        v3 = 0;
      else
        v3 = objc_msgSend(a1, "userTypeFromCloudDataWithKey:", v4);

    }
  }
  return v3;
}

+ (int64_t)userTypeFromMigratorData
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int64_t v15;
  _Unwind_Exception *v17;
  _Unwind_Exception *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)MGCopyAnswer();
  v4 = objc_msgSend((id)objc_opt_class(), "_majorVersionForBuildVersion:", v3);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MigratedFromAndroidToiOSVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && ((v7 = objc_msgSend((id)objc_opt_class(), "_majorVersionForBuildVersion:", v6), v7 >= 1)
      ? (v8 = v7 == v4)
      : (v8 = 0),
        v8))
  {
    v15 = 2;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v9 = getDMGetUserDataDispositionSymbolLoc_ptr;
    v22 = getDMGetUserDataDispositionSymbolLoc_ptr;
    if (!getDMGetUserDataDispositionSymbolLoc_ptr)
    {
      v10 = (void *)DataMigrationLibrary();
      v9 = dlsym(v10, "DMGetUserDataDisposition");
      v20[3] = (uint64_t)v9;
      getDMGetUserDataDispositionSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v19, 8);
    if (!v9)
    {
      +[TPSUserTypeChecker _previousBuildVersion].cold.1();
      v18 = v17;
      _Block_object_dispose(&v19, 8);
      _Unwind_Resume(v18);
    }
    if ((((uint64_t (*)(uint64_t))v9)(v11) & 4) != 0)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(a1, "_previousBuildVersion", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_msgSend((id)objc_opt_class(), "_majorVersionForBuildVersion:", v12);
        v15 = v13 > 0 && v13 < v4;
      }
      else
      {
        v15 = 0;
      }

    }
  }

  return v15;
}

+ (int64_t)userTypeFromCloudDataWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.tips"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_15);

  if (v6)
  {
    v15[3] = 0;
    objc_msgSend(v4, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke_2;
    v11[3] = &unk_1E395CE48;
    v12 = v3;
    v13 = &v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  }
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

+ (id)_previousBuildVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
  v11 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
  if (!getDMGetPreviousBuildVersionSymbolLoc_ptr)
  {
    v3 = (void *)DataMigrationLibrary();
    v2 = dlsym(v3, "DMGetPreviousBuildVersion");
    v9[3] = (uint64_t)v2;
    getDMGetPreviousBuildVersionSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    +[TPSUserTypeChecker _previousBuildVersion].cold.1();
    v7 = v6;
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  ((void (*)(uint64_t))v2)(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)_majorVersionForBuildVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "intValue");

  return (int)v4;
}

+ (int64_t)userTypeOverride
{
  void *v2;
  void *v3;
  unsigned int v4;
  int64_t v5;

  +[TPSDefaultsManager userType](TPSDefaultsManager, "userType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = objc_msgSend(v2, "intValue"), v4 < 3))
    v5 = v4;
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

BOOL __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accountType") == 1;
}

void __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (void)_previousBuildVersion
{
  dlerror();
  abort_report_np();
  __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_1();
}

@end
