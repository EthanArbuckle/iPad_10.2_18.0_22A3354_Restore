@implementation SUCorePolicyFamily

+ (id)getAssetTypeForKind:(int)a3 usingFamily:(int)a4
{
  void *v4;

  switch(a4)
  {
    case 1:
      +[SUCorePolicyFamily _getIOSAssetTypeForKind:](SUCorePolicyFamily, "_getIOSAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[SUCorePolicyFamily _getTVOSAssetTypeForKind:](SUCorePolicyFamily, "_getTVOSAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:](SUCorePolicyFamily, "_getWatchOSAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[SUCorePolicyFamily _getNERDCAssetTypeForKind:](SUCorePolicyFamily, "_getNERDCAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[SUCorePolicyFamily _getNERDSUAssetTypeForKind:](SUCorePolicyFamily, "_getNERDSUAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[SUCorePolicyFamily _getNERDBRAINAssetTypeForKind:](SUCorePolicyFamily, "_getNERDBRAINAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[SUCorePolicyFamily _getMacOSAssetTypeForKind:](SUCorePolicyFamily, "_getMacOSAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[SUCorePolicyFamily _getPlatformDefaultAssetTypeForKind:](SUCorePolicyFamily, "_getPlatformDefaultAssetTypeForKind:", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

+ (int)getFamilyUsingDeviceClass:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("iPod")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("AudioAccessory")))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to iOS family", buf, 2u);
    }
    v6 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV")))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = 2;
      _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to tvOS family", buf, 2u);
    }
    else
    {
      v6 = 2;
    }
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to watchOS family", buf, 2u);
    }
    v6 = 3;
  }
  else
  {
    v10 = objc_msgSend(v3, "isEqualToString:", CFSTR("Mac"));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to macOS family", buf, 2u);
      }
      v6 = 7;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v15 = v3;
        _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass unknown device class %{public}@, returning default instead", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v5 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown device class (%@), returning default instead"), v3);
      -[NSObject trackAnomaly:forReason:withResult:withError:](v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v13, 8116, 0);

      v6 = 0;
    }
  }

  return v6;
}

+ (int)getFamilyForBuildTarget
{
  return 1;
}

+ (id)getNameForSUCorePolicyAssetFamily:(int)a3
{
  __CFString *v3;

  if (a3 >= 8)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SUCORE_POLICY_FAMILY_UNKNOWN(%d)"), *(_QWORD *)&a3);
  else
    v3 = off_1EA878DA0[a3];
  return v3;
}

+ (id)getNameForSUCorePolicyAssetKind:(int)a3
{
  __CFString *v3;

  if ((a3 - 1) >= 7)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SUCORE_POLICY_KIND_UNKNOWN(%d)"), *(_QWORD *)&a3);
  else
    v3 = off_1EA878DE0[a3 - 1];
  return v3;
}

+ (id)_getIOSAssetTypeForKind:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878E18[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine iOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU"), v4);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return CFSTR("com.apple.MobileAsset.SoftwareUpdate");
}

+ (id)_getTVOSAssetTypeForKind:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878E50[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine tvOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU"), v4);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return CFSTR("com.apple.MobileAsset.SoftwareUpdate");
}

+ (id)_getWatchOSAssetTypeForKind:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878E88[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine watchOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU"), v4);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return CFSTR("com.apple.MobileAsset.SoftwareUpdate");
}

+ (id)_getNERDCAssetTypeForKind:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878EC0[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine NERDC asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU"), v4);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return CFSTR("com.apple.MobileAsset.RecoveryOSUpdate");
}

+ (id)_getNERDSUAssetTypeForKind:(int)a3
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = CFSTR("com.apple.MobileAsset.RecoveryOSUpdate");
  switch(a3)
  {
    case 1:
      return (id)v3;
    case 2:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no documentation asset type for NERDSU family, defaulting to NeRD SU asset type(%@)"), CFSTR("com.apple.MobileAsset.RecoveryOSUpdate"));
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no update brain asset type for NERDSU family, defaulting to NeRD SU asset type(%@)"), CFSTR("com.apple.MobileAsset.RecoveryOSUpdate"));
LABEL_6:
      v9 = (void *)v8;
      objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v8, 8102, 0);

      break;
    case 4:
      v3 = CFSTR("com.apple.MobileAsset.SFRSoftwareUpdate");
      break;
    case 5:
      v3 = CFSTR("com.apple.MobileAsset.SoftwareUpdateConfiguration");
      break;
    case 6:
    case 7:
      v3 = 0;
      break;
    default:
      v4 = *(_QWORD *)&a3;
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine NERDSU asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)"), v4, CFSTR("com.apple.MobileAsset.RecoveryOSUpdate"));
      objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

      break;
  }
  return (id)v3;
}

+ (id)_getNERDBRAINAssetTypeForKind:(int)a3
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain");
  switch(a3)
  {
    case 1:
      return (id)v3;
    case 2:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no documentation asset type for NERDBRAIN family, defaulting to NeRD update brain asset type(%@)"), CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"));
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no update brain asset type for NERDBRAIN family (since brain handled as SU asset), defaulting to NeRD update brain asset type(%@)"), CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"));
LABEL_6:
      v9 = (void *)v8;
      objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v8, 8102, 0);

      break;
    case 4:
      v3 = CFSTR("com.apple.MobileAsset.SFRSoftwareUpdate");
      break;
    case 5:
      v3 = CFSTR("com.apple.MobileAsset.SoftwareUpdateConfiguration");
      break;
    case 6:
    case 7:
      v3 = 0;
      break;
    default:
      v4 = *(_QWORD *)&a3;
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine NERDBRAIN asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)"), v4, CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"));
      objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

      break;
  }
  return (id)v3;
}

+ (id)_getMacOSAssetTypeForKind:(int)a3
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878EF8[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("com.apple.MobileAsset.MacSoftwareUpdate");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine macOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)"), v4, CFSTR("com.apple.MobileAsset.MacSoftwareUpdate"));
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return (id)v3;
}

+ (id)_getPlatformDefaultAssetTypeForKind:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SUCorePolicyFamily getFamilyUsingDeviceClass:](SUCorePolicyFamily, "getFamilyUsingDeviceClass:", v5);

  switch((int)v6)
  {
    case 1:
      +[SUCorePolicyFamily _getIOSAssetTypeForKind:](SUCorePolicyFamily, "_getIOSAssetTypeForKind:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[SUCorePolicyFamily _getTVOSAssetTypeForKind:](SUCorePolicyFamily, "_getTVOSAssetTypeForKind:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:](SUCorePolicyFamily, "_getWatchOSAssetTypeForKind:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[SUCorePolicyFamily _getMacOSAssetTypeForKind:](SUCorePolicyFamily, "_getMacOSAssetTypeForKind:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown family value (%d), defaulting to generic default family"), v6);
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v9, 8116, 0);

      +[SUCorePolicyFamily _getGenericDefaultAssetTypeForKind:](SUCorePolicyFamily, "_getGenericDefaultAssetTypeForKind:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v7;
}

+ (id)_getGenericDefaultAssetTypeForKind:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if ((a3 - 1) < 7)
    return off_1EA878F30[a3 - 1];
  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to determine generic default asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU"), v4);
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ASSET FAMILY"), v6, 8102, 0);

  return CFSTR("com.apple.MobileAsset.SoftwareUpdate");
}

+ (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

@end
