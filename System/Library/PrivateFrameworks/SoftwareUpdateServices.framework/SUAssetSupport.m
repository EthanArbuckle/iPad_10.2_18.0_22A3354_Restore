@implementation SUAssetSupport

+ (id)tryCreateDescriptorFromSoftwareUpdateAsset:(id)a3 withReleaseDate:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUDescriptor *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v104;
  uint64_t v105;

  if (!a3)
  {
    v64 = CFSTR("Unable to create descriptor from nil asset.");
    goto LABEL_82;
  }
  if (!objc_msgSend(a3, "attributes") || !objc_msgSend((id)objc_msgSend(a3, "attributes"), "count"))
  {
    v64 = CFSTR("Unable to create descriptor from asset without attributes.");
LABEL_82:
    SULogDebug(v64, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v104);
    return 0;
  }
  v10 = objc_alloc_init(SUDescriptor);
  v11 = (void *)objc_msgSend(a3, "attributes");
  v105 = objc_msgSend(a3, "assetId");
  v12 = objc_msgSend(v11, "objectForKey:", CFSTR("OSVersion"));
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v13, "length") >= 4
        && objc_msgSend(v13, "rangeOfString:options:range:", CFSTR("9.9."), 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (void *)objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_24CE3EA48);
        SULogInfo(CFSTR("9.9. replaced. New version string: %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      }
      -[SUDescriptor setProductVersion:](v10, "setProductVersion:", v13);
    }
  }
  v21 = objc_msgSend(v11, "objectForKey:", CFSTR("Build"));
  if (v21)
  {
    v22 = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setProductBuildVersion:](v10, "setProductBuildVersion:", v22);
  }
  v23 = objc_msgSend(v11, "objectForKey:", CFSTR("SUProductSystemName"));
  if (v23)
  {
    v24 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setProductSystemName:](v10, "setProductSystemName:", v24);
  }
  v25 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("ReleaseType"));
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setReleaseType:](v10, "setReleaseType:", v25);
  }
  v26 = objc_msgSend(v11, "objectForKey:", CFSTR("SUPublisher"));
  if (v26)
  {
    v27 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setPublisher:](v10, "setPublisher:", v27);
  }
  v28 = objc_msgSend(v11, "objectForKey:", CFSTR("AllowableOTA"));
  if (v28)
  {
    v29 = (void *)v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setDownloadable:](v10, "setDownloadable:", objc_msgSend(v29, "BOOLValue"));
  }
  v30 = objc_msgSend(v11, "objectForKey:", CFSTR("AutomaticDownloadOver3G"));
  if (v30)
  {
    v31 = (void *)v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setAutoDownloadAllowableForCellular:](v10, "setAutoDownloadAllowableForCellular:", objc_msgSend(v31, "BOOLValue"));
  }
  v32 = objc_msgSend(v11, "objectForKey:", CFSTR("AllowableOverCellular"));
  if (v32)
  {
    v33 = (void *)v32;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setDownloadableOverCellular:](v10, "setDownloadableOverCellular:", objc_msgSend(v33, "BOOLValue"));
  }
  v34 = objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE66AA0]);
  if (v34)
  {
    v35 = (void *)v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setDownloadSize:](v10, "setDownloadSize:", objc_msgSend(v35, "unsignedLongLongValue"));
  }
  v36 = objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE66AB8]);
  if (v36)
  {
    v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor _setUnarchiveSize:](v10, "_setUnarchiveSize:", objc_msgSend(v37, "unsignedLongLongValue"));
  }
  v38 = objc_msgSend(v11, "objectForKey:", CFSTR("ActualMinimumSystemPartition"));
  if (v38)
  {
    v39 = (void *)v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setMinimumSystemPartitionSize:](v10, "setMinimumSystemPartitionSize:", objc_msgSend(v39, "unsignedLongLongValue") << 20);
  }
  v40 = objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE66AA8]);
  if (v40)
  {
    v41 = (void *)v40;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor _setStreamingZipCapable:](v10, "_setStreamingZipCapable:", objc_msgSend(v41, "BOOLValue"));
  }
  v42 = objc_msgSend(v11, "objectForKey:", CFSTR("SUDisableSiriVoiceDeletion"));
  if (v42)
  {
    v43 = (void *)v42;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor _setDisableSiriVoiceDeletion:](v10, "_setDisableSiriVoiceDeletion:", objc_msgSend(v43, "BOOLValue"));
  }
  v44 = objc_msgSend(v11, "objectForKey:", CFSTR("SUDisableCDLevel4"));
  if (v44)
  {
    v45 = (void *)v44;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor _setDisableCDLevel4:](v10, "_setDisableCDLevel4:", objc_msgSend(v45, "BOOLValue"));
  }
  v46 = objc_msgSend(v11, "objectForKey:", CFSTR("SUDisableAppDemotion"));
  if (v46)
  {
    v47 = (void *)v46;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor _setDisableAppDemotion:](v10, "_setDisableAppDemotion:", objc_msgSend(v47, "BOOLValue"));
  }
  v48 = objc_msgSend(v11, "objectForKey:", CFSTR("SUInstallTonightEnabled"));
  if (v48)
  {
    v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v49, "BOOLValue") & 1) == 0)
      -[SUDescriptor _setDisableInstallTonight:](v10, "_setDisableInstallTonight:", 1);
  }
  v50 = objc_msgSend(v11, "objectForKey:", CFSTR("Ramp"));
  if (v50)
  {
    v51 = (void *)v50;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v51, "BOOLValue"))
        -[SUDescriptor setRampEnabled:](v10, "setRampEnabled:", 1);
    }
  }
  v52 = objc_msgSend(v11, "objectForKey:", CFSTR("GranularlyRamped"));
  if (v52)
  {
    v53 = (void *)v52;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v53, "BOOLValue"))
        -[SUDescriptor setGranularlyRamped:](v10, "setGranularlyRamped:", 1);
    }
  }
  v54 = objc_msgSend(v11, "objectForKey:", CFSTR("AutoUpdate"));
  if (v54)
  {
    v55 = (void *)v54;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v55, "BOOLValue"))
        -[SUDescriptor setAutoUpdateEnabled:](v10, "setAutoUpdateEnabled:", 1);
    }
  }
  v56 = objc_msgSend(v11, "objectForKey:", CFSTR("SystemPartitionPadding"));
  if (v56)
  {
    v57 = v56;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setSystemPartitionPadding:](v10, "setSystemPartitionPadding:", v57);
  }
  v58 = objc_msgSend(v11, "objectForKey:", CFSTR("SEPDigest"));
  if (v58)
  {
    v59 = v58;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setSEPDigest:](v10, "setSEPDigest:", v59);
  }
  v60 = objc_msgSend(v11, "objectForKey:", CFSTR("RSEPDigest"));
  if (v60)
  {
    v61 = v60;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setRSEPDigest:](v10, "setRSEPDigest:", v61);
  }
  v62 = objc_msgSend(v11, "objectForKey:", CFSTR("SEPTBMDigests"));
  if (v62)
  {
    v63 = v62;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUDescriptor setSEPTBMDigest:](v10, "setSEPTBMDigest:", v63);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v63, 1);
        if (v65)
        {
          v66 = (void *)v65;
          -[SUDescriptor setSEPTBMDigest:](v10, "setSEPTBMDigest:", v65);

        }
      }
    }
  }
  v67 = objc_msgSend(v11, "objectForKey:", CFSTR("RSEPTBMDigests"));
  if (v67)
  {
    v68 = v67;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUDescriptor setRSEPTBMDigest:](v10, "setRSEPTBMDigest:", v68);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v68, 1);
        if (v69)
        {
          v70 = (void *)v69;
          -[SUDescriptor setRSEPTBMDigest:](v10, "setRSEPTBMDigest:", v69);

        }
      }
    }
  }
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUDescriptor setReleaseDate:](v10, "setReleaseDate:", a4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v71 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v71, "setDateFormat:", CFSTR("yyyy-MM-dd"));
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
        objc_msgSend(v71, "setLocale:", v72);
        v73 = objc_msgSend(v71, "dateFromString:", a4);

        if (v73)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[SUDescriptor setReleaseDate:](v10, "setReleaseDate:", v73);
        }

      }
    }
  }
  v74 = objc_msgSend(v11, "objectForKey:", CFSTR("MDMDelayInterval"));
  if (v74)
  {
    v75 = (void *)v74;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setMdmDelayInterval:](v10, "setMdmDelayInterval:", objc_msgSend(v75, "unsignedLongLongValue"));
  }
  v76 = objc_msgSend(v11, "objectForKey:", CFSTR("SetupCritical"));
  if (v76)
  {
    v77 = v76;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setSetupCritical:](v10, "setSetupCritical:", v77);
  }
  v78 = objc_msgSend(v11, "objectForKey:", CFSTR("SetupCriticalCellularOverride"));
  if (v78)
  {
    v79 = (void *)v78;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v79, "BOOLValue"))
        v80 = CFSTR("WifiAndCellular");
      else
        v80 = CFSTR("WifiOnly");
      -[SUDescriptor setCriticalDownloadPolicy:](v10, "setCriticalDownloadPolicy:", v80);
    }
  }
  v81 = objc_msgSend(v11, "objectForKey:", CFSTR("SetupCriticalUpdateOutOfBoxOnly"));
  if (v81)
  {
    v82 = (void *)v81;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setCriticalOutOfBoxOnly:](v10, "setCriticalOutOfBoxOnly:", objc_msgSend(v82, "BOOLValue"));
  }
  v83 = objc_msgSend(v11, "objectForKey:", CFSTR("PrerequisiteBuild"));
  if (v83)
  {
    v84 = v83;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setPrerequisiteBuild:](v10, "setPrerequisiteBuild:", v84);
  }
  v85 = objc_msgSend(v11, "objectForKey:", CFSTR("PrerequisiteOSVersion"));
  if (v85)
  {
    v86 = v85;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setPrerequisiteOS:](v10, "setPrerequisiteOS:", v86);
  }
  v87 = objc_msgSend(v11, "objectForKey:", CFSTR("__HideInstallAlert"));
  if (v87 && (v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v89 = objc_msgSend(v88, "BOOLValue");
  }
  else
  {
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("Beta")) & 1) != 0)
      goto LABEL_127;
    v89 = +[SUAssetSupport updateIsPreCRelease:](SUAssetSupport, "updateIsPreCRelease:", -[SUDescriptor productVersion](v10, "productVersion"));
  }
  -[SUDescriptor setHideInstallAlert:](v10, "setHideInstallAlert:", v89);
LABEL_127:
  v90 = objc_msgSend(v11, "objectForKey:", CFSTR("ForcePasscodeRequired"));
  if (v90)
  {
    v91 = (void *)v90;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUDescriptor setForcePasscodeRequired:](v10, "setForcePasscodeRequired:", objc_msgSend(v91, "BOOLValue"));
  }
  if (v105)
    -[SUDescriptor setAssetID:](v10, "setAssetID:");
  v92 = objc_msgSend(v11, "objectForKey:", CFSTR("MacBuddyEligibleUpdate"));
  if (v92)
  {
    v93 = (void *)v92;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUDescriptor setMandatoryUpdateEligible:](v10, "setMandatoryUpdateEligible:", 1);
      v94 = objc_msgSend(v93, "objectForKey:", CFSTR("VersionMin"));
      if (v94)
      {
        v95 = v94;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUDescriptor setMandatoryUpdateVersionMin:](v10, "setMandatoryUpdateVersionMin:", v95);
      }
      v96 = objc_msgSend(v93, "objectForKey:", CFSTR("VersionMax"));
      if (v96)
      {
        v97 = v96;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUDescriptor setMandatoryUpdateVersionMin:](v10, "setMandatoryUpdateVersionMin:", v97);
      }
      v98 = objc_msgSend(v93, "objectForKey:", CFSTR("Optional"));
      if (v98)
      {
        v99 = (void *)v98;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUDescriptor setMandatoryUpdateOptional:](v10, "setMandatoryUpdateOptional:", objc_msgSend(v99, "BOOLValue"));
      }
      v100 = objc_msgSend(v93, "objectForKey:", CFSTR("RestrictedToOutOfTheBox"));
      if (v100)
      {
        v101 = (void *)v100;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v10, "setMandatoryUpdateRestrictedToOutOfTheBox:", objc_msgSend(v101, "BOOLValue"));
      }
    }
  }
  MSUAssetCalculateApplySize();
  MSUAssetCalculatePrepareSize();
  -[SUDescriptor _setMsuPrepareSize:](v10, "_setMsuPrepareSize:", 0);
  -[SUDescriptor setInstallationSize:](v10, "setInstallationSize:", 0);
  if ((objc_msgSend(a3, "isEmergencyUpdate") & 1) != 0)
  {
    v102 = 3;
  }
  else
  {
    v102 = 1;
    if (!objc_msgSend(v11, "objectForKey:", CFSTR("PrerequisiteBuild")))
    {
      if (objc_msgSend(v11, "objectForKey:", CFSTR("PrerequisiteOSVersion")))
        v102 = 1;
      else
        v102 = 2;
    }
  }
  -[SUDescriptor setUpdateType:](v10, "setUpdateType:", v102);
  return v10;
}

+ (void)_queue_cleanupAllInstalledAssetsOfType:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", a3);
  objc_msgSend(v3, "returnTypes:", 1);
  objc_msgSend(v3, "setDoNotBlockBeforeFirstUnlock:", 1);
  v4 = objc_msgSend(v3, "queryMetaDataSync");
  if (v4)
  {
    SULogInfo(CFSTR("queryMetaDataSync failed in _queue_cleanupAllInstalledAssetsOfType: %ld"), v5, v6, v7, v8, v9, v10, v11, v4);
  }
  else
  {
    v12 = (void *)objc_msgSend(v3, "results");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v17, "purgeSync"))
            SULogInfo(CFSTR("purgeSync for asset:%@ failed in _queue_cleanupAllInstalledAssetsOfType: %ld"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }
  }

}

+ (void)cleanupAllInstalledAssets:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = +[SUUtility taskQueue](SUUtility, "taskQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUAssetSupport_cleanupAllInstalledAssets___block_invoke;
  block[3] = &unk_24CE3B9F0;
  block[4] = a3;
  dispatch_async(v4, block);
}

uint64_t __44__SUAssetSupport_cleanupAllInstalledAssets___block_invoke(uint64_t a1)
{
  uint64_t result;

  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:](SUAssetSupport, "_queue_cleanupAllInstalledAssetsOfType:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:](SUAssetSupport, "_queue_cleanupAllInstalledAssetsOfType:", CFSTR("com.apple.MobileAsset.SoftwareUpdateDocumentation"));
  +[SUAssetSupport _queue_cleanupAllInstalledAssetsOfType:](SUAssetSupport, "_queue_cleanupAllInstalledAssetsOfType:", *MEMORY[0x24BEAE958]);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)_cleanupAllAssetsOfType:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", a3);
  objc_msgSend(v5, "returnTypes:", 1);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileAsset.SoftwareUpdate")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BEAE958]))
  {
    objc_msgSend(a1, "setSUFilters:", v5);
  }
  v6 = objc_msgSend(v5, "queryMetaDataSync");
  if (v6)
  {
    SULogInfo(CFSTR("queryMetaDataSync failed in _cleanupAllAssetsOfType: %d"), v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    v14 = (void *)objc_msgSend(v5, "results");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "cleanupAsset");
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }
  }

}

+ (void)cleanupAllSoftwareUpdateAssets
{
  dispatch_async((dispatch_queue_t)+[SUUtility taskQueue](SUUtility, "taskQueue"), &__block_literal_global_1);
}

uint64_t __48__SUAssetSupport_cleanupAllSoftwareUpdateAssets__block_invoke()
{
  +[SUAssetSupport _cleanupAllAssetsOfType:](SUAssetSupport, "_cleanupAllAssetsOfType:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  return +[SUAssetSupport _cleanupAllAssetsOfType:](SUAssetSupport, "_cleanupAllAssetsOfType:", *MEMORY[0x24BEAE958]);
}

+ (void)cleanupAllSoftwareUpdateAndRelatedAssets
{
  NSObject *v3;
  _QWORD block[5];

  v3 = +[SUUtility taskQueue](SUUtility, "taskQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUAssetSupport_cleanupAllSoftwareUpdateAndRelatedAssets__block_invoke;
  block[3] = &unk_24CE3BA38;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t __58__SUAssetSupport_cleanupAllSoftwareUpdateAndRelatedAssets__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = objc_msgSend(*(id *)(a1 + 32), "getLocalDefaultSoftwareUpdateAssetIfExists");
  if (v1)
  {
    v2 = v1;
    v11 = 0;
    if ((objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BE67268]), "initWithUpdateAsset:", v1), "cancel:", &v11) & 1) == 0)SULogInfo(CFSTR("Unable to cleanup brain for default asset: %@"), v3, v4, v5, v6, v7, v8, v9, v2);
  }
  +[SUAssetSupport _cleanupAllAssetsOfType:](SUAssetSupport, "_cleanupAllAssetsOfType:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  +[SUAssetSupport _cleanupAllAssetsOfType:](SUAssetSupport, "_cleanupAllAssetsOfType:", CFSTR("com.apple.MobileAsset.SoftwareUpdateDocumentation"));
  +[SUAssetSupport _cleanupAllAssetsOfType:](SUAssetSupport, "_cleanupAllAssetsOfType:", *MEMORY[0x24BEAE958]);
  return +[SUUtility purgeV1SUAssets](SUUtility, "purgeV1SUAssets");
}

+ (int64_t)requestCatalogDownload:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  dispatch_time_t v16;
  int64_t v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 3;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_opt_new();
  objc_msgSend(a3, "modifyMADownloadOptions:", v5);
  v6 = objc_msgSend(a3, "assetType");
  SULogInfo(CFSTR("requesting %@ catalog download"), v7, v8, v9, v10, v11, v12, v13, v6);
  v14 = (void *)MEMORY[0x24BE66B90];
  v15 = objc_msgSend(a3, "assetType");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__SUAssetSupport_requestCatalogDownload___block_invoke;
  v19[3] = &unk_24CE3BA60;
  v19[5] = v4;
  v19[6] = &v20;
  v19[4] = a3;
  objc_msgSend(v14, "startCatalogDownload:options:then:", v15, v5, v19);
  v16 = dispatch_time(0, 90000000000);
  dispatch_semaphore_wait(v4, v16);
  dispatch_release(v4);

  v17 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v17;
}

intptr_t __41__SUAssetSupport_requestCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v3)
  {
    if (v3 == 18)
    {
      v27 = objc_msgSend(*(id *)(a1 + 32), "assetType");
      SULogInfo(CFSTR("Pallas found no matching asset for %@"), v11, v12, v13, v14, v15, v16, v17, v27);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    if (v3 != 10)
    {
      v28 = objc_msgSend(*(id *)(a1 + 32), "assetType");
      SULogInfo(CFSTR("failed to download %@ catalog: %d"), v18, v19, v20, v21, v22, v23, v24, v28);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }
  v26 = objc_msgSend(*(id *)(a1 + 32), "assetType");
  SULogInfo(CFSTR("Successfully downloaded %@ catalog"), v4, v5, v6, v7, v8, v9, v10, v26);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_gestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "findAssetWithMatcher:localSearch:releaseDate:error:", a3, a4, 0, a5);
}

+ (void)setAssetQueryFilters:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[5];
  _QWORD v36[6];

  v36[5] = *MEMORY[0x24BDAC8D0];
  if ((__CFString *)objc_msgSend(a3, "assetType") == CFSTR("com.apple.MobileAsset.SoftwareUpdate"))
  {
    v5 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("ProductType"));
    v6 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("ReleaseType"));
    v7 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("BuildVersion"));
    v8 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("ProductVersion"));
    v9 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("HWModelStr"));
    v10 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = v10;
    if (!v6)
      v6 = v10;
    if (-[SUPreferences forceFullReplacement](+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"), "forceFullReplacement"))
    {
      v12 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, 0);
      v13 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, 0, v29);
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v7, v11, 0);
      v13 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v8, v11, 0);
    }
    v14 = v13;
    v35[0] = CFSTR("SupportedDevices");
    v36[0] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
    v35[1] = CFSTR("SupportedDeviceModels");
    v36[1] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, v9, 0);
    v35[2] = CFSTR("ReleaseType");
    v36[2] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
    v36[3] = v12;
    v35[3] = CFSTR("PrerequisiteBuild");
    v35[4] = CFSTR("PrerequisiteOSVersion");
    v36[4] = v14;
    v15 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = (void *)objc_msgSend(v15, "allKeys");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(a3, "addKeyValueArray:with:", v21, objc_msgSend(v15, "objectForKey:", v21)))
            SULogInfo(CFSTR("error setting filter for: %@"), v22, v23, v24, v25, v26, v27, v28, v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }
  }
}

+ (void)setSUFilters:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  if ((__CFString *)objc_msgSend(a3, "assetType") == CFSTR("com.apple.MobileAsset.SoftwareUpdate"))
  {
    v5 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("ProductType"));
    v6 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("HWModelStr"));
    v7 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v27[0] = CFSTR("SupportedDevices");
    v27[1] = CFSTR("SupportedDeviceModels");
    v28[0] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
    v28[1] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v7, v6, 0);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (void *)objc_msgSend(v8, "allKeys");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(a3, "addKeyValueArray:with:", v14, objc_msgSend(v8, "objectForKey:", v14)))
            SULogInfo(CFSTR("error setting filter for: %@"), v15, v16, v17, v18, v19, v20, v21, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
  }
}

+ (id)copySUAssetForAssetID:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  objc_msgSend(v4, "returnTypes:", 2);
  +[SUAssetSupport setSUFilters:](SUAssetSupport, "setSUFilters:", v4);
  if (objc_msgSend(v4, "queryMetaDataSync"))
  {
    SULogInfo(CFSTR("Failed to query matching assetID: %@ QueryResult: %d"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)a3);
LABEL_3:
    v19 = 0;
    v20 = CFSTR("Failed to find asset matching assetID: %@");
    goto LABEL_4;
  }
  v22 = (void *)objc_msgSend(v4, "results");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v23)
    goto LABEL_3;
  v24 = v23;
  v25 = *(_QWORD *)v30;
LABEL_7:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v25)
      objc_enumerationMutation(v22);
    v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v26);
    if ((objc_msgSend((id)objc_msgSend(v27, "assetId"), "isEqualToString:", a3) & 1) != 0)
      break;
    if (v24 == ++v26)
    {
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v24)
        goto LABEL_7;
      goto LABEL_3;
    }
  }
  v28 = v27;
  if (!v28)
    goto LABEL_3;
  v19 = v28;
  v20 = CFSTR("Found SU asset matching assetID: %@");
LABEL_4:
  SULogInfo(v20, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a3);

  return v19;
}

+ (id)copyInstalledAssets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  objc_msgSend(v2, "returnTypes:", 1);
  objc_msgSend(v2, "setDoNotBlockBeforeFirstUnlock:", 1);
  v3 = objc_msgSend(v2, "queryInstalledAssetIds");
  if (v3)
  {
    SULogInfo(CFSTR("Failed to query for installed builds: %d"), v4, v5, v6, v7, v8, v9, v10, v3);
    v11 = 0;
  }
  else
  {
    v11 = (id)objc_msgSend(v2, "assetIds");
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v11, "count");
    SULogInfo(CFSTR("MobileAsset found %d installed build%s: assetIDs: %@"), v13, v14, v15, v16, v17, v18, v19, v12);
  }

  return v11;
}

+ (id)findAssetWithMatcher:(id)a3 localSearch:(BOOL)a4 releaseDate:(id *)a5 error:(id *)a6
{
  int64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SUAssetSupport.m"), 682, CFSTR("Matcher must be non-nil for a query."));
  v67 = 0;
  if (a4
    || ((v11 = +[SUAssetSupport requestCatalogDownload:](SUAssetSupport, "requestCatalogDownload:", a3)) != 0
      ? (v12 = v11 == 10)
      : (v12 = 1),
        v12))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", objc_msgSend(a3, "assetType"));
    objc_msgSend(v13, "augmentResultsWithState:", 1);
    objc_msgSend(a1, "setAssetQueryFilters:", v13);
    v14 = objc_msgSend(v13, "queryMetaDataSync");
    if (v14)
    {
      SULogInfo(CFSTR("asset query failed: %d"), v15, v16, v17, v18, v19, v20, v21, v14);
      v67 = +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 58);
      if (v67)
      {
        v22 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v24 = (void *)objc_msgSend(v13, "results");
      v25 = objc_msgSend(v24, "count");
      SULogInfo(CFSTR("MobileAsset returned %d matching assets"), v26, v27, v28, v29, v30, v31, v32, v25);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v64 != v35)
              objc_enumerationMutation(v24);
            v37 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "attributes");
            SULogInfo(CFSTR("Asset info: %@"), v38, v39, v40, v41, v42, v43, v44, v37);
          }
          v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v34);
      }
      if (v24)
      {
        v22 = (void *)objc_msgSend(a3, "findMatchFromCandidates:error:", v24, &v67);
        if (v22)
        {
          if (objc_msgSend(v13, "postedDate"))
          {
            v52 = objc_msgSend(v13, "postedDate");
          }
          else
          {
            SULogInfo(CFSTR("Asset query did not return posting date. Setting posting date to now"), v45, v46, v47, v48, v49, v50, v51, v62);
            v52 = objc_msgSend(MEMORY[0x24BDBCE60], "date");
          }
          v61 = (void *)v52;
          if (a5)
          {
            SULogInfo(CFSTR("release date of update is %@"), v53, v54, v55, v56, v57, v58, v59, v52);
            *a5 = v61;
          }
        }
LABEL_12:
        v23 = v67;
        if (!v67)
        {
LABEL_14:

          return v22;
        }
LABEL_13:
        +[SUUtility assignError:withError:translate:](SUUtility, "assignError:withError:translate:", a6, v23, 0);
        goto LABEL_14;
      }
    }
    v23 = +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", -1);
    v22 = 0;
    v67 = v23;
    if (!v23)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v11 != 18)
    +[SUUtility assignError:withError:translate:](SUUtility, "assignError:withError:translate:", a6, +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 57), 0);
  return 0;
}

+ (id)findExactMatchInAssets:(id)a3 forAssetId:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = 0;
  v26 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v11, "assetId")))
          {
            v4 = v11;
            v12 = objc_msgSend(v11, "assetId");
            SULogInfo(CFSTR("Found asset matching assetId:%@"), v13, v14, v15, v16, v17, v18, v19, v12);
            return v4;
          }
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v4 = 0;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (id)filterSuAssets:(id)a3 MatchingDescriptor:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v5 = a3;
  v88 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a3, "count");
  objc_msgSend(v5, "count");
  SULogInfo(CFSTR("Found %lu asset%s matching descriptor"), v7, v8, v9, v10, v11, v12, v13, v6);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v15)
  {
    v16 = v15;
    v77 = *(_QWORD *)v83;
    v74 = v5;
    v75 = v14;
    do
    {
      v17 = 0;
      v76 = v16;
      do
      {
        if (*(_QWORD *)v83 != v77)
          objc_enumerationMutation(v5);
        v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "assetProperty:", CFSTR("PrerequisiteBuild"));
        v20 = objc_msgSend(v18, "assetProperty:", CFSTR("PrerequisiteOSVersion"));
        if (!objc_msgSend(a4, "prerequisiteBuild") || !objc_msgSend(a4, "prerequisiteOS"))
        {
          if (v19 | v20)
            goto LABEL_27;
LABEL_26:
          objc_msgSend(v14, "addObject:", v18);
          goto LABEL_27;
        }
        if (objc_msgSend((id)v19, "isEqual:", objc_msgSend(a4, "prerequisiteBuild"))
          && objc_msgSend((id)v20, "isEqual:", objc_msgSend(a4, "prerequisiteOS")))
        {
          goto LABEL_26;
        }
        v21 = objc_msgSend(v18, "assetProperty:", CFSTR("ComboAsset"));
        if (v21)
        {
          v22 = (void *)v21;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v79 != v32)
                    objc_enumerationMutation(v22);
                  v34 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v42 = (void *)objc_msgSend(v34, "valueForKey:", CFSTR("PrerequisiteBuild"));
                    v43 = (void *)objc_msgSend(v34, "valueForKey:", CFSTR("PrerequisiteOSVersion"));
                    if (objc_msgSend(v42, "isEqual:", objc_msgSend(a4, "prerequisiteBuild"))
                      && objc_msgSend(v43, "isEqual:", objc_msgSend(a4, "prerequisiteOS")))
                    {
                      v14 = v75;
                      objc_msgSend(v75, "addObject:", v18);
                      v5 = v74;
                      v16 = v76;
                      goto LABEL_27;
                    }
                  }
                  else
                  {
                    SULogInfo(CFSTR("ComboAsset array item is not a dictionary, skipping"), v35, v36, v37, v38, v39, v40, v41, v70);
                  }
                }
                v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
                v5 = v74;
                v14 = v75;
                v16 = v76;
              }
              while (v31);
            }
          }
          else
          {
            SULogInfo(CFSTR("ComboAsset value is not an array, skipping"), v23, v24, v25, v26, v27, v28, v29, v70);
          }
        }
LABEL_27:
        ++v17;
      }
      while (v17 != v16);
      v44 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      v16 = v44;
    }
    while (v44);
  }
  v45 = objc_msgSend(v14, "count");
  objc_msgSend(v14, "count");
  SULogInfo(CFSTR("Found %lu asset%s matching descriptor prerequisite build & version"), v46, v47, v48, v49, v50, v51, v52, v45);
  v53 = (void *)objc_msgSend(a1, "findExactMatchInAssets:forAssetId:", v14, objc_msgSend(a4, "assetID"));
  if (!v53)
  {
    v54 = (id)objc_msgSend(v14, "firstObject");
    v53 = v54;
    if (v54)
    {
      v72 = objc_msgSend(v54, "assetId");
      SULogInfo(CFSTR("Taking the first asset, assetId:%@"), v62, v63, v64, v65, v66, v67, v68, v72);
    }
    else
    {
      SULogInfo(CFSTR("Could not find matching asset"), v55, v56, v57, v58, v59, v60, v61, v71);
    }
  }

  return v53;
}

+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3 exactAssetIdMatch:(BOOL)a4 installedOnly:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v5 = a5;
  v6 = a4;
  v21[4] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v9 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("ProductType"));
  v10 = objc_msgSend(a1, "_gestaltValueForKey:", CFSTR("HWModelStr"));
  v11 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = objc_msgSend(a3, "releaseType");
  if (v12)
    v13 = v12;
  else
    v13 = v11;
  v20[0] = CFSTR("SupportedDevices");
  v21[0] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v9);
  v20[1] = CFSTR("SupportedDeviceModels");
  v21[1] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, v10, 0);
  v20[2] = CFSTR("ReleaseType");
  v21[2] = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v13);
  v20[3] = CFSTR("Build");
  v21[3] = objc_msgSend(a3, "productBuildVersion");
  v14 = objc_msgSend(a1, "queryMetaDataOfType:WithFilter:installedOnly:error:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4), v5, &v19);
  if (!v14)
    return 0;
  v15 = (void *)v14;
  if (v6)
    v16 = objc_msgSend(a1, "findExactMatchInAssets:forAssetId:", v14, objc_msgSend(a3, "assetID"));
  else
    v16 = objc_msgSend(a1, "filterSuAssets:MatchingDescriptor:", v14, a3);
  v17 = (void *)v16;

  return v17;
}

+ (id)copySuAssetInCatalogMatchingDescriptor:(id)a3
{
  return (id)objc_msgSend(a1, "copySuAssetInCatalogMatchingDescriptor:exactAssetIdMatch:installedOnly:", a3, 0, 0);
}

+ (id)copySuAssetInstalledExactlyMatchingDescriptor:(id)a3
{
  return (id)objc_msgSend(a1, "copySuAssetInCatalogMatchingDescriptor:exactAssetIdMatch:installedOnly:", a3, 1, 1);
}

+ (id)queryMetaDataOfType:(id)a3 WithFilter:(id)a4 installedOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v6 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", a3);
  objc_msgSend(v8, "setDoNotBlockBeforeFirstUnlock:", 1);
  if (v6)
    objc_msgSend(v8, "returnTypes:", 1);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = (void *)objc_msgSend(a4, "allKeys");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v13);
        v15 = objc_msgSend(a4, "objectForKey:", v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!objc_msgSend(v8, "addKeyValueArray:with:", v14, v15))
            goto LABEL_12;
LABEL_11:
          SULogInfo(CFSTR("error setting filter for: %@"), v16, v17, v18, v19, v20, v21, v22, v14);
          goto LABEL_12;
        }
        if (objc_msgSend(v8, "addKeyValuePair:with:", v14, v15))
          goto LABEL_11;
LABEL_12:
        ++v13;
      }
      while (v11 != v13);
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v11 = v23;
    }
    while (v23);
  }
  v24 = objc_msgSend(v8, "queryMetaDataSync");
  if (v24 && (v24 == 9 ? (v32 = !v6) : (v32 = 1), v32))
  {
    if (a6)
    {
      SULogInfo(CFSTR("asset query failed: %d"), v25, v26, v27, v28, v29, v30, v31, v24);
      v33 = 0;
      *a6 = +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 58);
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = (id)objc_msgSend(v8, "results");
    v34 = objc_msgSend(v33, "count");
    SULogInfo(CFSTR("MobileAsset returned %d matching assets"), v35, v36, v37, v38, v39, v40, v41, v34);
  }

  return v33;
}

+ (void)purgeMSUUpdate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = +[SUUtility taskQueue](SUUtility, "taskQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUAssetSupport_purgeMSUUpdate___block_invoke;
  block[3] = &unk_24CE3B9F0;
  block[4] = a3;
  dispatch_async(v4, block);
}

void __33__SUAssetSupport_purgeMSUUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x212BF5ECC]();
  SULogInfo(CFSTR("Attempting to purge prepared and suspended update from disk."), v3, v4, v5, v6, v7, v8, v9, v11);
  MSUPurgeSuspendedUpdate();
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, 0);
  objc_autoreleasePoolPop(v2);
}

+ (id)getLocalDefaultSoftwareUpdateAssetIfExists
{
  return (id)objc_msgSend(a1, "getLocalDefaultSoftwareUpdateAssetIfExistsWithReleaseDate:", 0);
}

+ (id)getLocalDefaultSoftwareUpdateAssetIfExistsWithReleaseDate:(id *)a3
{
  id v4;

  v4 = +[SUSoftwareUpdateAssetMatcher matcherForCurrentDeviceWithInterestedStates:](SUSoftwareUpdateAssetMatcher, "matcherForCurrentDeviceWithInterestedStates:", 0);
  objc_msgSend(v4, "setCompareWithTatsuForEligibility:", 0);
  return +[SUAssetSupport findAssetWithMatcher:localSearch:releaseDate:error:](SUAssetSupport, "findAssetWithMatcher:localSearch:releaseDate:error:", v4, 1, a3, 0);
}

+ (id)getInstalledDocumentationAssetFromSoftwareUpdateAssetIfExists:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SUAssetSupport.m"), 945, CFSTR("SoftwareUpdateAsset must be non-nil to fetch documentation from."));
  if ((objc_msgSend((id)objc_msgSend(a3, "assetType"), "isEqualToString:", CFSTR("com.apple.MobileAsset.SoftwareUpdate")) & 1) == 0)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SUAssetSupport.m"), 946, CFSTR("Asset passed in must be a software update asset"));
  return +[SUAssetSupport findAssetWithMatcher:localSearch:error:](SUAssetSupport, "findAssetWithMatcher:localSearch:error:", +[SUDocumentationAssetMatcher matcherForInstalledDocumentationFromAsset:](SUDocumentationAssetMatcher, "matcherForInstalledDocumentationFromAsset:", a3), 1, 0);
}

+ (id)defaultAssetDownloadOptionsWithPriority:(int)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = v4;
  if (a3 == 1)
  {
    v6 = (_QWORD *)MEMORY[0x24BE66B10];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v6 = (_QWORD *)MEMORY[0x24BE66B08];
LABEL_5:
    objc_msgSend(v4, "setObject:forKey:", *v6, *MEMORY[0x24BE66AF8]);
  }
  return v5;
}

+ (id)assetDownloadOptionsForDocumentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(a1, "defaultAssetDownloadOptionsWithPriority:", 2);
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x24BE66AE8]);
  v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BE66AC0]);
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x24BE66AC8]);
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x24BE66AD0]);
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  objc_msgSend(v2, "setObject:forKey:", v7, *MEMORY[0x24BE66AD8]);
  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUNetworkMonitor isCellularDataRoamingEnabled](+[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance"), "isCellularDataRoamingEnabled"));
  objc_msgSend(v2, "setObject:forKey:", v8, *MEMORY[0x24BE66AE0]);
  return v2;
}

+ (id)assetDownloadOptionsFromMetadata:(id)a3 descriptor:(id)a4 priority:(int)a5 forBrain:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a6;
  v9 = (void *)objc_msgSend(a1, "defaultAssetDownloadOptionsWithPriority:", *(_QWORD *)&a5);
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE66B00]);
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledForWifi"));
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BE66AE8]);
  v12 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledFor2G"));
  objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x24BE66AC0]);
  v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledFor3G"));
  objc_msgSend(v10, "setObject:forKey:", v13, *MEMORY[0x24BE66AC8]);
  v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledFor4G"));
  objc_msgSend(v10, "setObject:forKey:", v14, *MEMORY[0x24BE66AD0]);
  v15 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledOnBatteryPower"));
  objc_msgSend(v10, "setObject:forKey:", v15, *MEMORY[0x24BE66AD8]);
  v16 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isEnabledForCellularRoaming"));
  objc_msgSend(v10, "setObject:forKey:", v16, *MEMORY[0x24BE66AE0]);
  v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), objc_msgSend(a4, "productVersion"), objc_msgSend(a4, "productBuildVersion"));
  objc_msgSend(v10, "setObject:forKey:", v17, *MEMORY[0x24BE66AF0]);
  return v10;
}

+ (BOOL)updateIsPreCRelease:(id)a3
{
  id v3;

  v3 = +[SUAssetSupport minorOSVersion:](SUAssetSupport, "minorOSVersion:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "compare:", &unk_24CE6DFF8) == -1;
  return (char)v3;
}

+ (id)minorOSVersion:(id)a3
{
  return +[SUAssetSupport OSVersionComponent:osVersion:](SUAssetSupport, "OSVersionComponent:osVersion:", 1, a3);
}

+ (id)OSVersionComponent:(unint64_t)a3 osVersion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = (void *)objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("."));
  if (!v5)
    return 0;
  v6 = v5;
  if (objc_msgSend(v5, "count") <= a3)
    return 0;
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v8 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v8, "setNumberStyle:", 1);
  v9 = (void *)objc_msgSend(v8, "numberFromString:", v7);

  return v9;
}

@end
