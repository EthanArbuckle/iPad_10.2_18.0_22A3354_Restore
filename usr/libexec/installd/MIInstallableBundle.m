@implementation MIInstallableBundle

- (id)recordPromise
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordPromise"));

  return v3;
}

- (MIInstallableBundle)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 existingBundleContainer:(id)a9 operationType:(unint64_t)a10 error:(id *)a11
{
  uint64_t v13;
  id v17;
  MIInstallableBundle *v18;
  MIInstallableBundle *v19;
  id v21;
  objc_super v22;

  v13 = a5;
  v17 = a8;
  v21 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MIInstallableBundle;
  v18 = -[MIInstallable initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:operationType:error:](&v22, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:operationType:error:", a3, a4, v13, a6, a7, v17, a10, a11);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_existingBundleContainer, a9);
    if (((unint64_t)objc_msgSend(v17, "installTargetType") & 0xFFFFFFFFFFFFFFFELL) == 2)
      v19->_isPlaceholderInstall = 1;
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  sub_1000388BC(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle dataContainer](self, "dataContainer"));
  sub_1000388BC(v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionDataContainers](self, "appExtensionDataContainers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        sub_1000388BC(*(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)MIInstallableBundle;
  -[MIInstallableBundle dealloc](&v10, "dealloc");
}

- (unint64_t)eligibilityOperationType
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v4 = objc_msgSend(v3, "installIntent");

  if (v4 == (id)3)
    return 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
    v5 = objc_msgSend(v8, "isPlaceholder") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_verifyBundleMetadataWithError:(id *)a3
{
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  unsigned __int8 v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    v6 = 0;
  }
  else
  {
    v23 = 0;
    v10 = objc_msgSend(v5, "isApplicableToCurrentDeviceFamilyWithError:", &v23);
    v11 = v23;
    v12 = v11;
    if (!v10)
      goto LABEL_16;
    v22 = v11;
    v13 = objc_msgSend(v5, "isApplicableToCurrentOSVersionWithError:", &v22);
    v6 = v22;

    if ((v13 & 1) == 0)
    {
      v14 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
        MOLogWrite(v14, 3, "-[MIInstallableBundle _verifyBundleMetadataWithError:]", CFSTR("Bundle is not applicable to current OS: %@"));

      }
      goto LABEL_17;
    }
  }
  v7 = objc_msgSend(v5, "bundleType");
  if (v7 - 1 < 5 || v7 == 9)
  {
    v21 = v6;
    v8 = objc_msgSend(v5, "validateAppMetadataWithError:", &v21);
    v9 = v21;

    v6 = v9;
    if (!v8)
      goto LABEL_17;
  }
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    v16 = 1;
    goto LABEL_20;
  }
  v20 = v6;
  v17 = objc_msgSend(v5, "thinningMatchesCurrentDeviceWithError:", &v20);
  v12 = v20;

  if ((v17 & 1) != 0)
  {
    v16 = 1;
    v6 = v12;
    goto LABEL_20;
  }
LABEL_16:
  v6 = v12;
LABEL_17:
  if (a3)
  {
    v6 = objc_retainAutorelease(v6);
    v16 = 0;
    *a3 = v6;
  }
  else
  {
    v16 = 0;
  }
LABEL_20:

  return v16;
}

- (BOOL)_installEmbeddedProfilesWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *k;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  BOOL v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _BYTE v70[128];
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE v73[128];
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[128];
  _QWORD v77[2];
  _QWORD v78[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  v7 = objc_msgSend(v5, "installEmbeddedProvisioningProfileWithProgress:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v9 = objc_msgSend(v8, "provisioningProfileInstallFailureIsFatal");

  if (MIIsFatalMISProfileInstallationError(v7, v9))
  {
    v10 = (void *)MIInstallerErrorDomain;
    v77[0] = CFSTR("LegacyErrorString");
    v77[1] = MILibMISErrorNumberKey;
    v78[0] = CFSTR("ApplicationVerificationFailed");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    v78[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v15 = MIErrorStringForMISError(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = sub_100010E50((uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]", 320, v10, 13, 0, v12, CFSTR("Failed to install embedded profile for %@ : 0x%08x (%@)"), v17, (uint64_t)v14);
LABEL_32:
    v43 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v42 = 0;
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v21)
            objc_enumerationMutation(v11);
          v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          v25 = objc_msgSend(v23, "installEmbeddedProvisioningProfileWithProgress:", v24);

          if ((MIIsFatalMISProfileInstallationError(v25, v9) & 1) != 0)
          {
            v44 = (void *)MIInstallerErrorDomain;
            v75[0] = CFSTR("ApplicationVerificationFailed");
            v74[0] = CFSTR("LegacyErrorString");
            v74[1] = MILibMISErrorNumberKey;
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25));
            v75[1] = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v75, v74, 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
            v45 = MIErrorStringForMISError(v25);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v45);
            v53 = (uint64_t)v14;
            v47 = CFSTR("Failed to install embedded profile for %@ : 0x%08x (%@)");
            v48 = 327;
LABEL_31:
            v18 = sub_100010E50((uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]", v48, v44, 13, 0, v13, v47, v46, v53);
            goto LABEL_32;
          }
        }
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
        if (v20)
          continue;
        break;
      }
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v59 != v28)
            objc_enumerationMutation(v11);
          v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          v32 = objc_msgSend(v30, "installEmbeddedProvisioningProfileWithProgress:", v31);

          if ((MIIsFatalMISProfileInstallationError(v32, v9) & 1) != 0)
          {
            v44 = (void *)MIInstallerErrorDomain;
            v71[0] = CFSTR("LegacyErrorString");
            v71[1] = MILibMISErrorNumberKey;
            v72[0] = CFSTR("ApplicationVerificationFailed");
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
            v72[1] = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
            v49 = MIErrorStringForMISError(v32);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v49);
            v53 = (uint64_t)v14;
            v47 = CFSTR("Failed to install embedded profile for %@ : 0x%08x (%@)");
            v48 = 335;
            goto LABEL_31;
          }
        }
        v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
        if (v27)
          continue;
        break;
      }
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
    v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v55;
      while (2)
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(_QWORD *)v55 != v35)
            objc_enumerationMutation(v11);
          v37 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)k);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          v39 = objc_msgSend(v37, "installEmbeddedProvisioningProfileWithProgress:", v38);

          if (MIIsFatalMISProfileInstallationError(v39, v9))
          {
            v44 = (void *)MIInstallerErrorDomain;
            v68[0] = CFSTR("LegacyErrorString");
            v68[1] = MILibMISErrorNumberKey;
            v69[0] = CFSTR("ApplicationVerificationFailed");
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v39));
            v69[1] = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
            v51 = MIErrorStringForMISError(v39);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v51);
            v53 = (uint64_t)v14;
            v47 = CFSTR("Failed to install embedded profile for %@ : 0x%08x (%@)");
            v48 = 344;
            goto LABEL_31;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
          v41 = objc_msgSend(v37, "installMacStyleEmbeddedProvisioningProfileWithProgress:", v40);

          if (MIIsFatalMISProfileInstallationError(v41, v9))
          {
            v44 = (void *)MIInstallerErrorDomain;
            v66[0] = CFSTR("LegacyErrorString");
            v66[1] = MILibMISErrorNumberKey;
            v67[0] = CFSTR("ApplicationVerificationFailed");
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
            v67[1] = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
            v52 = MIErrorStringForMISError(v41);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v52);
            v53 = (uint64_t)v14;
            v47 = CFSTR("Failed to install Mac-style embedded profile for %@ : 0x%08x (%@)");
            v48 = 349;
            goto LABEL_31;
          }
        }
        v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        v42 = 1;
        if (v34)
          continue;
        break;
      }
      v43 = 0;
    }
    else
    {
      v43 = 0;
      v42 = 1;
    }
  }

  if (a3 && !v42)
    *a3 = objc_retainAutorelease(v43);

  return v42;
}

- (BOOL)_checkCanInstallWithError:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v6 = objc_msgSend(v5, "bundleType");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "builtInFrameworkBundleIDs"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = objc_msgSend(v8, "containsObject:", v10);

  if (v11)
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v16 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 382, v12, 57, 0, &off_10008F8E8, CFSTR("A system framework has the bundle ID %@ so an app with the same identifier cannot be installed."), v15, (uint64_t)v14);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);

LABEL_3:
    v18 = 0;
    goto LABEL_4;
  }
  v17 = 0;
  v19 = 1;
  v20 = v6 - 1;
  v18 = 0;
  switch(v20)
  {
    case 0u:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "systemAppBundleIDToInfoMap"));

      if (v22)
        goto LABEL_14;
      v24 = (void *)MIInstallerErrorDomain;
      v25 = CFSTR("Failed to get system app map");
      v26 = 397;
      goto LABEL_44;
    case 1u:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "internalAppBundleIDToInfoMap"));

      if (v22)
        goto LABEL_14;
      v24 = (void *)MIInstallerErrorDomain;
      v25 = CFSTR("Failed to get internal app map");
      v26 = 419;
      goto LABEL_44;
    case 2u:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](MIDiskImageManager, "sharedInstance"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "diskImageAppInfoForBundleID:", v29));
      goto LABEL_15;
    case 3u:
      goto LABEL_41;
    case 4u:
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "coreServicesAppBundleIDToInfoMap"));

      if (!v22)
      {
        v24 = (void *)MIInstallerErrorDomain;
        v25 = CFSTR("Failed to get core services app map");
        v26 = 405;
LABEL_44:
        v61 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", v26, v24, 4, 0, 0, v25, v23, (uint64_t)v65);
        v17 = (id)objc_claimAutoreleasedReturnValue(v61);
        goto LABEL_3;
      }
LABEL_14:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v29));
LABEL_15:
      v18 = (void *)v30;

      if (!v18)
        goto LABEL_39;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL")));
      objc_opt_class(NSURL);
      v33 = v32;
      if ((objc_opt_isKindOfClass(v33) & 1) != 0)
        v34 = v33;
      else
        v34 = 0;

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", kCFBundleVersionKey));
      objc_opt_class(NSString);
      v36 = v35;
      if ((objc_opt_isKindOfClass(v36) & 1) != 0)
        v37 = v36;
      else
        v37 = 0;

      if (!v37)
      {
        v43 = (void *)MIInstallerErrorDomain;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "identifier"));
        v47 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 430, v43, 4, 0, 0, CFSTR("Failed to get CFBundleVersion from Info.plist of installed OS app with bundle ID %@"), v46, (uint64_t)v45);
        v17 = (id)objc_claimAutoreleasedReturnValue(v47);

        goto LABEL_4;
      }
      v67 = v34;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "infoPlistSubset"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", kCFBundleVersionKey));
      objc_opt_class(NSString);
      v41 = v40;
      if ((objc_opt_isKindOfClass(v41) & 1) != 0)
        v42 = v41;
      else
        v42 = 0;

      if (v42)
      {
        v48 = objc_msgSend(v42, "compare:options:", v37, 64);
        v49 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
        if ((unint64_t)v48 < 2)
          v50 = v49;
        else
          v50 = 0;
        if ((v50 & 1) != 0 || v48 == (id)1)
          goto LABEL_38;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
        v52 = objc_msgSend(v51, "allowsInternalSecurityPolicy");

        if (v52 && !v48)
        {
          v53 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
            MOLogWrite(v53, 5, "-[MIInstallableBundle _checkCanInstallWithError:]", CFSTR("INTERNAL-ONLY: Allowing version numbers to be equal when upgrading %@."));

          }
LABEL_38:
          -[MIInstallableBundle setUpgradingBuiltInAppAtURL:](self, "setUpgradingBuiltInAppAtURL:", v67, v65);

LABEL_39:
          v17 = 0;
          v19 = 1;
          goto LABEL_41;
        }
        v62 = (void *)MIInstallerErrorDomain;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifier"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "path"));
        v64 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 457, v62, 34, 0, &off_10008F910, CFSTR("Rejecting downgrade of system/internal app %@ at %@: installed version is %@, proposed version is %@"), v63, (uint64_t)v58);
        v17 = (id)objc_claimAutoreleasedReturnValue(v64);

      }
      else
      {
        v56 = (void *)MIInstallerErrorDomain;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifier"));
        v60 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 436, v56, 33, 0, 0, CFSTR("Failed to get CFBundleVersion from Info.plist for incoming OS app upgrade for bundle ID %@"), v59, (uint64_t)v58);
        v17 = (id)objc_claimAutoreleasedReturnValue(v60);
      }

LABEL_4:
      if (a3)
      {
        v17 = objc_retainAutorelease(v17);
        v19 = 0;
        *a3 = v17;
      }
      else
      {
        v19 = 0;
      }
LABEL_41:

      return v19;
    default:
      v18 = 0;
      goto LABEL_41;
  }
}

- (BOOL)_validateITunesMetadataOptionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  id v23;
  id v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sinfData"));

  if (!v7 || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iTunesMetadata"))) == 0)
  {
    v19 = 0;
    v18 = 0;
    v12 = 0;
    v16 = 0;
    v10 = 0;
    v20 = 1;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v5));

  if (v10 && v12 && (objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
  {
    v23 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]", 516, MIInstallerErrorDomain, 79, 0, &off_10008F938, CFSTR("iTunesMetadata.plist content supplied to install command specified bundleVersion (%@) that did not match app's CFBundleVersion (%@)."), v13, (uint64_t)v12);
    v19 = (id)objc_claimAutoreleasedReturnValue(v23);
    v16 = 0;
    v18 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleShortVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v5));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleShortVersionString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v5));

  v19 = 0;
  v20 = 1;
  if (v16 && v18)
  {
    if ((objc_msgSend(v16, "isEqualToString:", v18) & 1) != 0)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v24 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]", 524, MIInstallerErrorDomain, 79, 0, &off_10008F960, CFSTR("iTunesMetadata.plist content supplied to install command specified bundleShortVersionString (%@) that did not match app's CFBundleShortVersionString (%@)."), v21, (uint64_t)v18);
    v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (!a3)
    {
LABEL_15:
      v20 = 0;
      goto LABEL_11;
    }
LABEL_13:
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a3 = v19;
  }
LABEL_11:

  return v20;
}

- (BOOL)performPreflightWithError:(id *)a3
{
  unsigned int v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSMutableArray *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSMutableArray *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  NSMutableArray *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  BOOL v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  NSMutableArray *v77;
  void *v78;
  unsigned int v79;
  NSMutableArray *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  NSMutableArray *v88;
  void *v89;
  unsigned int v90;
  void *v91;
  unsigned int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned __int8 v98;
  unsigned int v99;
  unsigned int v100;
  void *v101;
  unsigned int v102;
  void *v103;
  unsigned int v104;
  void *v105;
  unsigned int v106;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  NSMutableArray *obj;
  NSMutableArray *v112;
  NSMutableArray *v113;
  NSMutableArray *v114;
  NSMutableArray *v115;
  NSMutableArray *v116;
  NSMutableArray *v117;
  NSMutableArray *v118;
  NSMutableArray *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  NSMutableArray *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  NSMutableArray *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  NSMutableArray *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  NSMutableArray *v139;
  NSMutableArray *v140;
  NSMutableArray *v141;
  NSMutableArray *v142;
  NSMutableArray *v143;
  NSMutableArray *v144;
  NSMutableArray *v145;
  objc_super v146;
  id v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];

  v5 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v6)[2](v6, CFSTR("PreflightingApplication"), 30);

  v146.receiver = self;
  v146.super_class = (Class)MIInstallableBundle;
  v147 = 0;
  LODWORD(v6) = -[MIInstallable performPreflightWithError:](&v146, "performPreflightWithError:", &v147);
  v7 = (NSMutableArray *)v147;
  if (!(_DWORD)v6)
    goto LABEL_70;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v9 = v8;
  if (v5)
  {
    v145 = v7;
    v10 = objc_msgSend(v8, "setIsPlaceholderWithError:", &v145);
    v11 = v145;

    if ((v10 & 1) == 0)
      goto LABEL_72;
  }
  else
  {
    v144 = v7;
    v12 = objc_msgSend(v8, "executableExistsWithError:", &v144);
    v11 = v144;

    if (!v12)
      goto LABEL_72;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v14 = objc_msgSend(v13, "bundleType");

  if (v14 - 1 < 5 || v14 == 9)
  {
    v143 = v11;
    v15 = -[MIInstallableBundle _validateITunesMetadataOptionWithError:](self, "_validateITunesMetadataOptionWithError:", &v143);
    v7 = v143;

    if (!v15)
      goto LABEL_70;
    v11 = v7;
  }
  v142 = v11;
  v16 = -[MIInstallableBundle _checkCanInstallWithError:](self, "_checkCanInstallWithError:", &v142);
  v7 = v142;

  if (!v16)
  {
LABEL_70:
    v61 = 0;
    if (!a3)
      goto LABEL_76;
    goto LABEL_74;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v141 = v7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "frameworkBundlesWithError:", &v141));
  v11 = v141;

  -[MIInstallableBundle setFrameworkBundles:](self, "setFrameworkBundles:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));

  if (!v19)
    goto LABEL_72;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v140 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appExtensionBundlesWithError:", &v140));
  v7 = v140;

  -[MIInstallableBundle setAppExtensionBundles:](self, "setAppExtensionBundles:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));

  if (!v22)
    goto LABEL_70;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v139 = v7;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "driverKitExtensionBundlesWithError:", &v139));
  v11 = v139;

  -[MIInstallableBundle setDriverKitExtensionBundles:](self, "setDriverKitExtensionBundles:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));

  if (!v25)
    goto LABEL_72;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  -[MIInstallableBundle setIdentifiersMap:](self, "setIdentifiersMap:", v26);

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
  if (v27)
  {
    v28 = v27;
    v109 = *(_QWORD *)v136;
LABEL_16:
    v29 = 0;
    v30 = v11;
    while (1)
    {
      if (*(_QWORD *)v136 != v109)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)v29);
      v134 = v30;
      v32 = objc_msgSend(v31, "executableExistsWithError:", &v134);
      v11 = v134;

      if (!v32)
        goto LABEL_60;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v33));

      if (v35)
      {
        v62 = (void *)MIInstallerErrorDomain;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleURL"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "path"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", v33));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "path"));
        v69 = sub_100010E50((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 602, v62, 57, 0, &off_10008F988, CFSTR("Found bundle at %@ with the same identifier (%@) as bundle at %@"), v68, (uint64_t)v64);
LABEL_36:
        v72 = objc_claimAutoreleasedReturnValue(v69);

        v61 = 0;
        v11 = (NSMutableArray *)v72;
        goto LABEL_61;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleURL"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v33);

      v29 = (char *)v29 + 1;
      v30 = v11;
      if (v28 == v29)
      {
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
        if (v28)
          goto LABEL_16;
        break;
      }
    }
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
  if (v38)
  {
    v39 = v38;
    v110 = *(_QWORD *)v131;
LABEL_25:
    v40 = 0;
    v41 = v11;
    while (1)
    {
      if (*(_QWORD *)v131 != v110)
        objc_enumerationMutation(obj);
      v42 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)v40);
      v129 = v41;
      v43 = objc_msgSend(v42, "executableExistsWithError:", &v129);
      v11 = v129;

      if (!v43)
        goto LABEL_60;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v33));

      if (v45)
      {
        v70 = (void *)MIInstallerErrorDomain;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundleURL"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "path"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", v33));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "path"));
        v69 = sub_100010E50((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 617, v70, 57, 0, &off_10008F9B0, CFSTR("Found bundle at %@ with the same identifier (%@) as bundle at %@"), v71, (uint64_t)v64);
        goto LABEL_36;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundleURL"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v33);

      v40 = (char *)v40 + 1;
      v41 = v11;
      if (v39 == v40)
      {
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
        if (v39)
          goto LABEL_25;
        break;
      }
    }
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "identifier"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v50));

  if (v51)
  {
    v52 = (void *)MIInstallerErrorDomain;
    obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray identifier](obj, "identifier"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "identifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v56));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "path"));
    v59 = sub_100010E50((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 624, v52, 57, 0, &off_10008F9D8, CFSTR("The parent bundle has the same identifier (%@) as sub-bundle at %@"), v58, (uint64_t)v53);
    v60 = objc_claimAutoreleasedReturnValue(v59);

    v61 = 0;
    v11 = (NSMutableArray *)v60;
LABEL_61:

    goto LABEL_73;
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v125, v149, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v126;
LABEL_39:
    v76 = 0;
    v77 = v11;
    while (1)
    {
      if (*(_QWORD *)v126 != v75)
        objc_enumerationMutation(obj);
      v78 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)v76);
      v124 = v77;
      v79 = objc_msgSend(v78, "executableExistsWithError:", &v124);
      v11 = v124;

      if (!v79)
        break;
      v76 = (char *)v76 + 1;
      v77 = v11;
      if (v74 == v76)
      {
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v125, v149, 16);
        if (v74)
          goto LABEL_39;
        goto LABEL_45;
      }
    }
LABEL_60:
    v61 = 0;
    goto LABEL_61;
  }
LABEL_45:

  if (v5)
  {
    v80 = objc_opt_new(NSMutableArray);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    -[NSMutableArray addObjectsFromArray:](v80, "addObjectsFromArray:", v81);

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v80, "addObjectsFromArray:", v82);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v80, "addObjectsFromArray:", v83);

    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    obj = v80;
    v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v120, v148, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v121;
      while (2)
      {
        v87 = 0;
        v88 = v11;
        do
        {
          if (*(_QWORD *)v121 != v86)
            objc_enumerationMutation(obj);
          v89 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v87);
          v119 = v88;
          v90 = objc_msgSend(v89, "setIsPlaceholderWithError:", &v119);
          v11 = v119;

          if (!v90)
          {

            goto LABEL_60;
          }
          v87 = (char *)v87 + 1;
          v88 = v11;
        }
        while (v85 != v87);
        v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v120, v148, 16);
        if (v85)
          continue;
        break;
      }
    }

  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v92 = objc_msgSend(v91, "bundleType");

  if (v92 - 1 >= 5 && v92 != 9)
    goto LABEL_65;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v95 = v94;
  if (v93)
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "bundle"));
    v118 = v11;
    v98 = objc_msgSend(v95, "transferInstallationIdentityFromBundle:error:", v97, &v118);
    v7 = v118;

    if ((v98 & 1) == 0)
      goto LABEL_70;
  }
  else
  {
    v117 = v11;
    v99 = objc_msgSend(v94, "makeAndSetNewInstallationIdentityWithError:", &v117);
    v7 = v117;

    if (!v99)
      goto LABEL_70;
  }
  v11 = v7;
LABEL_65:
  v116 = v11;
  v100 = -[MIInstallableBundle _verifyBundleMetadataWithError:](self, "_verifyBundleMetadataWithError:", &v116);
  v7 = v116;

  if (!v100)
    goto LABEL_70;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v115 = v7;
  v102 = objc_msgSend(v101, "validatePluginKitMetadataWithError:", &v115);
  v11 = v115;

  if (!v102)
  {
LABEL_72:
    v61 = 0;
LABEL_73:
    v7 = v11;
    if (!a3)
      goto LABEL_76;
    goto LABEL_74;
  }
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v114 = v11;
  v104 = objc_msgSend(v103, "validateExtensionKitMetadataWithError:", &v114);
  v7 = v114;

  if (!v104)
    goto LABEL_70;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v113 = v7;
  v106 = objc_msgSend(v105, "validateDriverKitExtensionMetadataWithError:", &v113);
  obj = v113;

  if (v106)
  {
    v112 = obj;
    v61 = -[MIInstallableBundle _installEmbeddedProfilesWithError:](self, "_installEmbeddedProfilesWithError:", &v112);
    v11 = v112;
    goto LABEL_61;
  }
  v61 = 0;
  v7 = obj;
  if (!a3)
    goto LABEL_76;
LABEL_74:
  if (!v61)
    *a3 = objc_retainAutorelease(v7);
LABEL_76:

  return v61;
}

- (BOOL)_performCompanionWatchAppValidationForWatchApp:(id)a3 withVersion:(unsigned __int8)a4 companionAppSigningInfo:(id)a5 frameworks:(id)a6 error:(id *)a7
{
  int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  id v17;
  unsigned __int8 v18;
  BOOL v19;
  const __CFString *v20;
  id v21;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v11, "isWatchApp") & 1) == 0)
  {
    v20 = CFSTR("Unknown");
    if (v10 == 3)
      v20 = CFSTR("2.0");
    if (v10 == 2)
      v20 = CFSTR("1.0");
    v21 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performCompanionWatchAppValidationForWatchApp:withVersion:companionAppSigningInfo:frameworks:error:]", 718, MIInstallerErrorDomain, 102, 0, &off_10008FA00, CFSTR("WatchKit %@ app's UIDeviceFamily key does not specify that it's compatible with device family 4."), v14, (uint64_t)v20);
    v15 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "codeSignerType") == (id)2 && (objc_msgSend(v11, "isPlaceholder") & 1) == 0)
  {
    v41 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 1, 0, 1, 0, 0, &v41));
    v15 = v41;

    if (!v23)
      goto LABEL_14;
    v32 = a7;
    v33 = v13;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v13;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v38;
      while (2)
      {
        v28 = 0;
        v29 = v15;
        do
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v28);
          v36 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 1, 0, 1, 0, 1, &v36));
          v15 = v36;

          if (!v31)
          {

            a7 = v32;
            v13 = v33;
            goto LABEL_14;
          }
          v28 = (char *)v28 + 1;
          v29 = v15;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v26)
          continue;
        break;
      }
    }

    a7 = v32;
    v13 = v33;
  }
  else
  {
    v15 = 0;
  }
  if (v10 != 3)
  {
LABEL_8:
    v19 = 1;
    goto LABEL_17;
  }
  v35 = v15;
  v16 = objc_msgSend(v11, "validatePluginKitMetadataWithError:", &v35);
  v17 = v35;

  if (v16)
  {
    v34 = v17;
    v18 = objc_msgSend(v11, "validateExtensionKitMetadataWithError:", &v34);
    v15 = v34;

    if ((v18 & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    v15 = v17;
  }
LABEL_14:
  if (a7)
  {
    v15 = objc_retainAutorelease(v15);
    v19 = 0;
    *a7 = v15;
  }
  else
  {
    v19 = 0;
  }
LABEL_17:

  return v19;
}

- (BOOL)_validateCompanionAppStateInWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 isSystemAppInstall:(BOOL)a5 error:(id *)a6
{
  int v7;
  id v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;

  v7 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "companionAppIdentifier"));
  v11 = objc_msgSend(v9, "isWatchOnlyApp");
  v12 = objc_msgSend(v9, "watchKitAppRunsIndependentlyOfCompanion");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR(".")));

  if (v11 && v12)
  {
    v17 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 789, MIInstallerErrorDomain, 138, 0, &off_10008FA28, CFSTR("This app defines both %@ and %@ in its Info.plist and/or its WatchKit extension's Info.plist. Having both defined is not allowed."), v16, (uint64_t)CFSTR("WKWatchOnly"));
LABEL_6:
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    v19 = v10;
    goto LABEL_7;
  }
  if (v11)
  {
    v17 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 808, MIInstallerErrorDomain, 135, 0, &off_10008FA50, CFSTR("Watch-only apps cannot be contained in companion apps installed on the companion."), v16, v43);
    goto LABEL_6;
  }
  v19 = v10;
  if (v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    v24 = objc_msgSend(v10, "isEqualToString:", v23);

    if ((v24 & 1) != 0)
    {
      if (!a5)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        if ((objc_msgSend(v25, "hasPrefix:", v15) & 1) != 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          v27 = objc_msgSend(v26, "length");
          v28 = objc_msgSend(v15, "length");

          if (v27 > v28)
            goto LABEL_16;
        }
        else
        {

        }
        v38 = (void *)MIInstallerErrorDomain;
        v39 = CFSTR("Unknown");
        if (v7 == 3)
          v39 = CFSTR("2.0");
        if (v7 == 2)
          v39 = CFSTR("1.0");
        v40 = v39;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v42 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 829, v38, 101, 0, &off_10008FAC8, CFSTR("WatchKit %@ app's bundle ID %@ is not prefixed by the parent app's bundle ID followed by a '.'; expected prefix %@"),
                v41,
                (uint64_t)v40);
        v18 = (id)objc_claimAutoreleasedReturnValue(v42);

        goto LABEL_7;
      }
LABEL_16:
      v18 = 0;
      v20 = 1;
      goto LABEL_10;
    }
    v33 = (void *)MIInstallerErrorDomain;
    v34 = CFSTR("Unknown");
    if (v7 == 3)
      v34 = CFSTR("2.0");
    if (v7 == 2)
      v34 = CFSTR("1.0");
    v35 = v34;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
    v37 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 820, v33, 97, 0, &off_10008FAA0, CFSTR("Invalid value of WKCompanionAppBundleIdentifier key in WatchKit %@ app's Info.plist: %@ (expected %@)"), v36, (uint64_t)v35);
    v18 = (id)objc_claimAutoreleasedReturnValue(v37);

  }
  else
  {
    v29 = (void *)MIInstallerErrorDomain;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v32 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 813, v29, 97, 0, &off_10008FA78, CFSTR("%@: Missing WKCompanionAppBundleIdentifier key in WatchKit %@ app's Info.plist"), v31, (uint64_t)v30);
    v18 = (id)objc_claimAutoreleasedReturnValue(v32);
  }

LABEL_7:
  if (a6)
  {
    v18 = objc_retainAutorelease(v18);
    v20 = 0;
    *a6 = v18;
  }
  else
  {
    v20 = 0;
  }
LABEL_10:

  return v20;
}

- (BOOL)_isValidWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 installableSigningInfo:(id)a5 isSystemAppInstall:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  id v33;
  BOOL v34;
  void *v36;
  unsigned int v37;
  void *v38;
  uint64_t v39;
  id v40;
  unsigned __int8 v41;
  id v42;
  uint64_t v43;
  _BOOL8 v44;
  unsigned __int8 v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  unsigned int v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;

  v8 = a6;
  v10 = a4;
  v12 = a3;
  v13 = a5;
  if (objc_msgSend(v12, "isExtensionBasedWatchKitApp") && objc_msgSend(v13, "codeSignerType") == (id)3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entitlements"));
    if ((sub_100046B04(v14) & 1) != 0 || (objc_msgSend(v12, "isPlaceholder") & 1) != 0)
      v50 = 0;
    else
      v50 = objc_msgSend(v12, "isApplicableToOSVersionEarlierThan:", CFSTR("9.0")) & !v8;

  }
  else
  {
    v50 = 0;
  }
  v51 = a7;
  v52 = v13;
  if (objc_msgSend(v12, "minimumWatchOSVersionIsPreV6"))
  {
    v60 = 0;
    v15 = objc_msgSend(v12, "hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:", v10, &v60);
    v16 = v60;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = v16;
    if (!v15)
      goto LABEL_29;
  }
  else
  {
    v16 = 0;
  }
  v59 = v16;
  v21 = -[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:](self, "_validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:", v12, v10, v8, &v59);
  v20 = v59;

  if (!v21)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_20;
  }
  v58 = v20;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frameworkBundlesWithError:", &v58));
  v22 = v58;

  if (!v17)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_28;
  }
  if (!objc_msgSend(v17, "count")
    || !objc_msgSend(v12, "isApplicableToOSVersion:error:", CFSTR("2.9.9"), 0))
  {
    v57 = v22;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pluginKitBundlesWithError:", &v57));
    v20 = v57;

    if (v18)
    {
      v56 = v20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "extensionKitBundlesWithError:", &v56));
      v22 = v56;

      if (v19)
      {
        v55 = v22;
        v29 = v52;
        v30 = -[MIInstallableBundle _performCompanionWatchAppValidationForWatchApp:withVersion:companionAppSigningInfo:frameworks:error:](self, "_performCompanionWatchAppValidationForWatchApp:withVersion:companionAppSigningInfo:frameworks:error:", v12, v10, v52, v17, &v55);
        v20 = v55;

        if (!v30)
          goto LABEL_29;
        if ((_DWORD)v10 == 3)
        {
          if (v50)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
            v37 = objc_msgSend(v36, "codeSigningEnforcementIsDisabled");

            if (v37)
            {
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", CFSTR("Boot-args disabled code signing enforcement so not validating WatchKit 2.0 app's stub."));
            }
            else
            {
              v54 = v20;
              v41 = +[MICodeSigningVerifier validateWatchKitV2StubExecutableBundle:error:](MICodeSigningVerifier, "validateWatchKitV2StubExecutableBundle:error:", v12, &v54);
              v42 = v54;

              if ((v41 & 1) == 0)
              {
                v24 = v42;
                v48 = sub_100010E50((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 927, MIInstallerErrorDomain, 72, v42, &off_10008FB18, CFSTR("The WatchKit 2.0 app being installed contains an invalid application executable."), v43, v49);
                v20 = (id)objc_claimAutoreleasedReturnValue(v48);
                goto LABEL_18;
              }
              v20 = v42;
            }
          }
          v44 = (objc_msgSend(v12, "isPlaceholder") & 1) == 0
             && objc_msgSend(v52, "codeSignerType") == (id)2;
          v53 = v20;
          v45 = -[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:](self, "_verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:", v18, v19, v12, v44, v44, &v53);
          v46 = v53;
          v47 = v20;
          v20 = v46;

          if ((v45 & 1) == 0)
            goto LABEL_29;
        }
        else
        {
          v32 = v20;
          if ((_DWORD)v10 != 2)
          {
            v38 = (void *)MIInstallerErrorDomain;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            v40 = sub_100010E50((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 961, v38, 4, 0, 0, CFSTR("Unknown WatchKit app version while validating %@: %hhu"), v39, (uint64_t)v24);
            v20 = (id)objc_claimAutoreleasedReturnValue(v40);

            goto LABEL_18;
          }
          v33 = sub_100010E50((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 911, MIInstallerErrorDomain, 133, 0, 0, CFSTR("WatchKit version %hhu is no longer supported"), v31, 2);
          v20 = (id)objc_claimAutoreleasedReturnValue(v33);

        }
        v34 = 1;
        goto LABEL_33;
      }
LABEL_28:
      v20 = v22;
      goto LABEL_29;
    }
LABEL_20:
    v19 = 0;
    goto LABEL_29;
  }
  v23 = (void *)MIInstallerErrorDomain;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundleURL"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
  v28 = sub_100010E50((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 882, v23, 119, 0, &off_10008FAF0, CFSTR("WatchKit 2 app contains a framework at %@. Frameworks are only allowed at that location in WatchKit apps compatible with watchOS 3.0 or later."), v27, (uint64_t)v26);
  v20 = (id)objc_claimAutoreleasedReturnValue(v28);

  v18 = 0;
  v19 = 0;
LABEL_18:

LABEL_29:
  if (v51)
  {
    v20 = objc_retainAutorelease(v20);
    v34 = 0;
    *v51 = v20;
  }
  else
  {
    v34 = 0;
  }
  v29 = v52;
LABEL_33:

  return v34;
}

- (BOOL)_verifyPluginKitPlugins:(id)a3 extensionKitExtensions:(id)a4 inWatchKit2App:(id)a5 checkAppexSignatures:(BOOL)a6 checkFrameworkSignature:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  id v47;
  _BOOL4 v48;
  _BOOL4 v49;
  id *v50;
  id v51;
  id v52;
  int v53;
  int v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v16 = v13;
  v57 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  v17 = 0;
  v18 = 0;
  if (!v57)
    goto LABEL_23;
  v58 = *(_QWORD *)v72;
  v51 = v15;
  v52 = v14;
  v50 = a8;
  v55 = v16;
  v48 = v9;
  v49 = v10;
  while (2)
  {
    for (i = 0; i != v57; i = (char *)i + 1)
    {
      if (*(_QWORD *)v72 != v58)
        objc_enumerationMutation(v16);
      v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
      if (v10)
      {
        v70 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 1, 0, 1, 0, 0, &v70));
        v22 = v70;

        if (!v21)
        {
          v47 = v16;
LABEL_51:
          v15 = v51;
          v14 = v52;
          a8 = v50;
          goto LABEL_47;
        }
      }
      else
      {
        v22 = v18;
      }
      v69 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "frameworkBundlesWithError:", &v69));
      v18 = v69;

      if (!v23)
      {
        v47 = v16;
        v22 = v18;
        goto LABEL_51;
      }
      if (v9)
      {
        v53 = v17;
        v68 = 0u;
        v66 = 0u;
        v67 = 0u;
        v65 = 0u;
        v22 = v23;
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v66;
          while (2)
          {
            v27 = 0;
            v28 = v18;
            do
            {
              if (*(_QWORD *)v66 != v26)
                objc_enumerationMutation(v22);
              v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v27);
              v64 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 1, 0, 1, 0, 1, &v64));
              v18 = v64;

              if (!v30)
              {

                v16 = v55;
                v47 = v55;
                v15 = v51;
                v14 = v52;
                a8 = v50;
                goto LABEL_46;
              }
              v27 = (char *)v27 + 1;
              v28 = v18;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            if (v25)
              continue;
            break;
          }
        }

        v16 = v55;
        v17 = v53;
        v9 = v48;
        v10 = v49;
      }
      v17 |= objc_msgSend(v20, "isWatchKitExtension");

    }
    v15 = v51;
    v14 = v52;
    a8 = v50;
    v57 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v57)
      continue;
    break;
  }
LABEL_23:

  if (v10)
  {
    v54 = v17;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v47 = v14;
    v31 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    v56 = v16;
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v61;
      while (2)
      {
        v34 = 0;
        v35 = v18;
        do
        {
          if (*(_QWORD *)v61 != v33)
            objc_enumerationMutation(v47);
          v36 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v34);
          v59 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 1, 0, 1, 0, 0, &v59));
          v18 = v59;

          if (!v37)
          {
            v22 = v18;
            v16 = v56;
            goto LABEL_47;
          }
          v34 = (char *)v34 + 1;
          v35 = v18;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        if (v32)
          continue;
        break;
      }
    }

    v22 = v18;
    v16 = v56;
    v17 = v54;
  }
  else
  {
    v22 = v18;
  }
  if (objc_msgSend(v15, "isExtensionlessWatchKitApp")
    && objc_msgSend(v15, "isExtensionBasedWatchKitApp"))
  {
    v38 = (void *)MIInstallerErrorDomain;
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v40 = sub_100010E50((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1038, v38, 144, 0, &off_10008FB40, CFSTR("WatchKit app %@ has both WKApplication and WKWatchKitApp Info.plist keys. A WatchKit app should only have one of these keys."), v39, (uint64_t)v47);
    goto LABEL_45;
  }
  if ((objc_msgSend(v15, "isExtensionlessWatchKitApp") & v17) == 1)
  {
    v41 = (void *)MIInstallerErrorDomain;
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v40 = sub_100010E50((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1041, v41, 143, 0, &off_10008FB68, CFSTR("Extensionless WatchKit app %@ has a WatchKit extension."), v42, (uint64_t)v47);
    goto LABEL_45;
  }
  if (v17 & 1 | ((objc_msgSend(v15, "isExtensionBasedWatchKitApp") & 1) == 0))
  {
    v43 = 1;
  }
  else
  {
    v44 = (void *)MIInstallerErrorDomain;
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v40 = sub_100010E50((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1044, v44, 96, 0, &off_10008FB90, CFSTR("Extension-based WatchKit 2 app %@ is missing its app extension."), v45, (uint64_t)v47);
LABEL_45:
    v18 = (id)objc_claimAutoreleasedReturnValue(v40);
LABEL_46:

    v22 = v18;
LABEL_47:

    if (a8)
    {
      v22 = objc_retainAutorelease(v22);
      v43 = 0;
      *a8 = v22;
    }
    else
    {
      v43 = 0;
    }
  }

  return v43;
}

- (id)_validateBundle:(id)a3 validatingResources:(BOOL)a4 performingOnlineAuthorization:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 allowingFreeProfileValidation:(BOOL)a7 skippingProfileIDValidation:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v33;
  id v34;

  v9 = a8;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v15 = a3;
  v34 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", v13, v12, 1, v11, v9, &v34));
  v17 = v34;
  v18 = v17;
  if (v16)
  {
    if (!-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")
      && objc_msgSend(v15, "codeSignatureVerificationState") != (id)2
      || -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")
      && objc_msgSend(v15, "codeSignatureVerificationState") != (id)1)
    {
      v28 = (void *)MIInstallerErrorDomain;
      v29 = objc_msgSend(v15, "codeSignatureVerificationState");
      v31 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]", 1076, v28, 4, 0, 0, CFSTR("Unexpectedly failed to validate code signing (status %lu) for %@"), v30, (uint64_t)v29);
      v22 = (id)objc_claimAutoreleasedReturnValue(v31);
      goto LABEL_15;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "personaUniqueString"));
    v33 = v18;
    v21 = objc_msgSend(v15, "hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:", v16, v20, &v33);
    v22 = v33;

    if (v21)
    {
      if (objc_msgSend(v15, "codeSignatureVerificationState") != (id)2
        || objc_msgSend(v16, "profileValidationType") != (id)3
        || a7)
      {
        v27 = v16;
        goto LABEL_18;
      }
      v23 = (void *)MIInstallerErrorDomain;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v25 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]", 1085, v23, 111, 0, &off_10008FBB8, CFSTR("The bundle being installed with bundle ID %@ is authorized by a free provisioning profile, but apps validated by those are not allowed to be installed from this source."), v24, (uint64_t)v18);
      v26 = objc_claimAutoreleasedReturnValue(v25);

      v22 = (id)v26;
LABEL_15:

      if (!a9)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v22 = v17;
  }
  if (!a9)
  {
LABEL_16:
    v27 = 0;
    goto LABEL_18;
  }
LABEL_13:
  v22 = objc_retainAutorelease(v22);
  v27 = 0;
  *a9 = v22;
LABEL_18:

  return v27;
}

- (BOOL)_validateApplicationIdentifierForNewBundleSigningInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  const __CFString *v45;
  uint64_t v46;
  _BOOL4 v47;
  BOOL v48;
  _BOOL4 v49;
  uint64_t v50;
  const __CFString *v51;
  id v52;
  unsigned __int8 v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  void *v59;
  void *v60;
  void *v61;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entitlements"));
  v8 = sub_100046A44(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
    goto LABEL_2;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  if (objc_msgSend(v28, "codeSigningEnforcementIsDisabled"))
  {
    v29 = objc_msgSend(v6, "codeSignerType");

    if (v29 == (id)1)
    {
      v31 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
        MOLogWrite(v31, 5, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", CFSTR("INTERNAL-ONLY BEHAVIOR: allowing app %@ to have missing application-identifier entitlement."));

      }
LABEL_2:
      v10 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer", v59));
      if (!v10
        || (v11 = (void *)v10,
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundle")),
            v13,
            v12,
            v11,
            !v9)
        || !v13)
      {
        v26 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
          MOLogWrite(v26, 7, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", CFSTR("Skipping application-identifier check for %@"));

        }
        goto LABEL_74;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, 0));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements"));
      v18 = sub_100046A44(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v16 && v19)
      {
        v20 = objc_msgSend(v6, "codeSignerType");
        v21 = objc_msgSend(v16, "codeSignerType");
        if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
          goto LABEL_8;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
        if (objc_msgSend(v39, "isPlaceholder"))
        {
          if (v20 == (id)2)
          {

            goto LABEL_54;
          }
          v53 = sub_100046B04(v7);

          if ((v53 & 1) != 0)
          {
LABEL_54:
            v50 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
              goto LABEL_73;
            v51 = CFSTR("Skipping application-identifier check because existing app is a placeholder and app being installed is not validated by a profile or is a TestFlight app");
            goto LABEL_72;
          }
          v49 = 0;
          v47 = v21 == (id)2;
        }
        else
        {

          v47 = v21 == (id)2;
          v48 = v20 == (id)2;
          v49 = v20 == (id)2;
          if (v48 && v21 == (id)2)
          {
            v50 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
              goto LABEL_73;
            v51 = CFSTR("Skipping application-identifier check because both existing app and app being installed are not validated by a profile.");
            goto LABEL_72;
          }
        }
        if (sub_100046B04(v7)
          && (v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements")),
              v55 = sub_100046B04(v54),
              v54,
              v55))
        {
          v50 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
            goto LABEL_73;
          v51 = CFSTR("Skipping application-identifier check because both existing app and app being installed are TestFlight apps.");
        }
        else if (v49
               && (v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements")),
                   v57 = sub_100046B04(v56),
                   v56,
                   v57))
        {
          v50 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
            goto LABEL_73;
          v51 = CFSTR("Skipping application-identifier check because existing installed app is a TestFlight app and app being installed is not validated by a profile.");
        }
        else
        {
          if ((sub_100046B04(v7) & v47) != 1)
          {
LABEL_8:
            if ((objc_msgSend(v9, "isEqualToString:", v19) & 1) != 0)
            {
LABEL_73:

LABEL_74:
              v34 = 0;
              v35 = 1;
              goto LABEL_75;
            }
            if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
              MOLogWrite(qword_10009E048, 7, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", CFSTR("Application identifiers (old:\"%@\", new:\"%@\") did not match; trying previous-application-identifiers."));
            v22 = sub_100046AB0(v7);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v25 = v23;
            if (v23 && objc_msgSend(v23, "containsObject:", v19))
            {

              goto LABEL_73;
            }
            if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
              MOLogWrite(qword_10009E048, 7, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", CFSTR("Application identifier \"%@\" not found in previous-application-identifiers %@"));
            v52 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", 1206, MIInstallerErrorDomain, 64, 0, &off_10008FC08, CFSTR("Upgrade's application-identifier entitlement string (%@) does not match installed application's application-identifier string (%@); rejecting upgrade."),
                    v24,
                    (uint64_t)v9);
            v34 = (id)objc_claimAutoreleasedReturnValue(v52);

            if (!a4)
              goto LABEL_52;
            goto LABEL_25;
          }
          v50 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
            goto LABEL_73;
          v51 = CFSTR("Skipping application-identifier check because existing installed app is a not validated by a profile and app being installed is a TestFlight app.");
        }
LABEL_72:
        MOLogWrite(v50, 7, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", v51);
        goto LABEL_73;
      }
      if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
      {
        v36 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
          MOLogWrite(v36, 5, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", CFSTR("Allowing placeholder upgrade without existing entitlements for %@"));

        }
        goto LABEL_73;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundle"));
      v44 = objc_msgSend(v43, "isPlaceholder");

      if (v44)
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
          goto LABEL_47;
        v45 = CFSTR("Existing installed placeholder %@ did not have the application-identifier entitlement.");
        v46 = 7;
      }
      else
      {
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
          goto LABEL_47;
        v45 = CFSTR("Allowing update to app %@ even though the older version does not have the application-identifier entitlement.");
        v46 = 5;
      }
      MOLogWrite(qword_10009E048, v46, "-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", v45);
LABEL_47:

      goto LABEL_73;
    }
  }
  else
  {

  }
  v33 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", 1128, MIInstallerErrorDomain, 63, 0, &off_10008FBE0, CFSTR("Application is missing the application-identifier entitlement."), v30, (uint64_t)v59);
  v34 = (id)objc_claimAutoreleasedReturnValue(v33);
  if (!a4)
  {
LABEL_52:
    v35 = 0;
    goto LABEL_75;
  }
LABEL_25:
  v34 = objc_retainAutorelease(v34);
  v35 = 0;
  *a4 = v34;
LABEL_75:

  return v35;
}

- (BOOL)_performWatchVerificationForSigningInfo:(id)a3 isSystemAppInstall:(BOOL)a4 withError:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  unsigned int v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v33 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "watchKitV2AppBundleWithError:", &v33));
  v11 = v33;
  v12 = v11;
  if (v10)
  {
    if (v6)
    {
      v13 = (void *)MIInstallerErrorDomain;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v18 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performWatchVerificationForSigningInfo:isSystemAppInstall:withError:]", 1305, v13, 92, v12, &off_10008FC30, CFSTR("Embedded WatchKit apps are not allowed in deletable system apps (found one at %@ in %@)."), v17, (uint64_t)v15);
      v19 = objc_claimAutoreleasedReturnValue(v18);

      v12 = (id)v19;
LABEL_13:

      goto LABEL_14;
    }
    v32 = v11;
    v21 = objc_msgSend(v10, "watchKitVersionWithError:", &v32);
    v16 = v32;

    if (v21 != 3)
    {
      v26 = (void *)MIInstallerErrorDomain;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      v28 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performWatchVerificationForSigningInfo:isSystemAppInstall:withError:]", 1310, v26, 92, v16, &off_10008FC58, CFSTR("Found WatchKit app at %@ but it was not a WatchKit 2 app (was version %@). Is it missing its app extension?"), v27, (uint64_t)v15);
      v12 = (id)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_13;
    }
    v31 = v16;
    v22 = objc_msgSend(v10, "executableExistsWithError:", &v31);
    v23 = v31;

    if (!v22)
    {
      v12 = v23;
      if (a5)
        goto LABEL_16;
      goto LABEL_18;
    }
    v30 = v23;
    v24 = -[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:](self, "_isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:", v10, 3, v8, 0, &v30);
    v12 = v30;

    if (!v24)
    {
LABEL_15:
      if (a5)
      {
LABEL_16:
        v12 = objc_retainAutorelease(v12);
        v25 = 0;
        *a5 = v12;
        goto LABEL_19;
      }
LABEL_18:
      v25 = 0;
      goto LABEL_19;
    }
    -[MIInstallableBundle setEmbeddedWatchApp:](self, "setEmbeddedWatchApp:", v10);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    if (!objc_msgSend(v14, "isEqualToString:", MIInstallerErrorDomain))
    {
LABEL_14:

      goto LABEL_15;
    }
    v20 = objc_msgSend(v12, "code");

    if (v20 != (id)85)
      goto LABEL_15;

    v12 = 0;
  }
  v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)_getLinkedParentBundleID:(id *)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  id v19;
  id v20;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "linkedParentBundleID"));

  v11 = 0;
  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall") && !v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v13 = v12;
    if (v12)
    {
      v20 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleMetadataWithError:", &v20));
      v16 = v20;
      if (!v14)
      {
        v19 = sub_100010E50((uint64_t)"-[MIInstallableBundle _getLinkedParentBundleID:withError:]", 1374, MIInstallerErrorDomain, 4, v16, 0, CFSTR("Failed to read previously set bundle metadata for %@"), v15, (uint64_t)v8);
        v11 = (id)objc_claimAutoreleasedReturnValue(v19);

        if (a4)
        {
          v11 = objc_retainAutorelease(v11);
          v10 = 0;
          v17 = 0;
          *a4 = v11;
        }
        else
        {
          v10 = 0;
          v17 = 0;
        }
        goto LABEL_11;
      }
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "linkedParentBundleID"));

    }
    else
    {
      v10 = 0;
      v16 = 0;
    }

    v11 = v16;
  }
  if (a3)
  {
    v10 = objc_retainAutorelease(v10);
    *a3 = v10;
  }
  v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_validateLinkedParentForSigningInfo:(id)a3 appManagementDomainValue:(unint64_t)a4 error:(id *)a5
{
  id v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  BOOL v34;
  id v35;
  void *v37;
  id v38;
  uint64_t v39;
  id *v40;
  id v41;
  id v42;
  id v43;
  char v44;

  v8 = a3;
  v9 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v11 = objc_msgSend(v10, "localSigningIsUnrestricted");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  v14 = objc_msgSend(v8, "codeSignerType");
  v41 = 0;
  v42 = 0;
  LODWORD(self) = -[MIInstallableBundle _getLinkedParentBundleID:withError:](self, "_getLinkedParentBundleID:withError:", &v42, &v41);
  v15 = v42;
  v17 = v41;
  if (!(_DWORD)self)
    goto LABEL_43;
  v40 = a5;
  if (!v15)
  {
    LOBYTE(v19) = 0;
    goto LABEL_17;
  }
  v18 = v15;
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.Playgrounds")))
  {

    LOBYTE(v19) = 1;
    goto LABEL_17;
  }
  v39 = (uint64_t)v13;
  v44 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v43 = 0;
  v21 = objc_msgSend(v20, "isRunningInTestMode:outError:", &v44, &v43);
  v38 = v43;

  if (!v21)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      MOLogWrite(qword_10009E048, 5, "_IsPlaygroundsBundleID", CFSTR("Failed to determine if we're running in test mode: %@"));
      v22 = v38;
      v19 = 0;
      v13 = (void *)v39;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!v44)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mock.Playgrounds"));
LABEL_13:
  v22 = v38;
  v13 = (void *)v39;
LABEL_14:

  if (((v19 | v11) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    v24 = objc_msgSend(v23, "testFlagsAreSet:", 4);

    if ((v24 & 1) == 0)
    {
      v13 = (void *)v39;
      v35 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1417, MIInstallerErrorDomain, 195, 0, &off_10008FC80, CFSTR("App %@ specified \"%@\" as its linked parent app but that app isn't an allowed parent app."), v16, v39);
      goto LABEL_41;
    }
    LOBYTE(v19) = 0;
    v13 = (void *)v39;
  }
LABEL_17:
  if (v9)
  {
    if (a4 != 1 || v15)
      goto LABEL_23;
LABEL_31:
    v34 = 1;
    goto LABEL_46;
  }
  if (v14 != (id)5)
    goto LABEL_31;
  if ((v11 & 1) == 0)
  {
    if (a4 == 1 && !v15)
    {
      v35 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1433, MIInstallerErrorDomain, 170, 0, &off_10008FCA8, CFSTR("App %@ was signed with a local key but did not specify either the %@ entitlement or a linked parent bundle ID."), v16, (uint64_t)v13);
      goto LABEL_41;
    }
    if (!v15)
    {
      v35 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1436, MIInstallerErrorDomain, 196, 0, &off_10008FCD0, CFSTR("App %@ was signed with a local key but did not have linked parent bundle ID specified."), v16, (uint64_t)v13);
      goto LABEL_41;
    }
    if (a4 == 1)
    {
      v35 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1439, MIInstallerErrorDomain, 197, 0, &off_10008FCF8, CFSTR("App %@ was signed with a local key but did not have the %@ entitlement."), v16, (uint64_t)v13);
      goto LABEL_41;
    }
  }
LABEL_23:
  v25 = v19 ^ 1;
  if (a4 == 2)
    v25 = 1;
  if ((v25 & 1) != 0)
  {
    if (a4 == 2)
      v33 = v19;
    else
      v33 = 1;
    if ((v33 & 1) != 0)
      goto LABEL_31;
    v35 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1455, MIInstallerErrorDomain, 169, 0, &off_10008FD48, CFSTR("App %@ with the %@ entitlement set to a value prefixed by \"swift-playgrounds\" did not specify a linkage to the Swift Playgrounds app."), v16, (uint64_t)v13);
LABEL_41:
    v32 = objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_42;
  }
  v26 = (void *)MIInstallerErrorDomain;
  v27 = (uint64_t)v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitlements"));
  v29 = sub_100046BCC(v28);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1452, v26, 168, 0, &off_10008FD20, CFSTR("App %@ linked to Swift Playgrounds did not have the %@ entitlement set to a value prefixed by \"swift-playgrounds\" (found %@)."), v30, v27);
  v32 = objc_claimAutoreleasedReturnValue(v31);

  v17 = v28;
  v13 = (void *)v27;
LABEL_42:
  a5 = v40;

  v17 = (id)v32;
LABEL_43:
  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v34 = 0;
    *a5 = v17;
  }
  else
  {
    v34 = 0;
  }
LABEL_46:

  return v34;
}

- (BOOL)_validateAppManagementDomainForSigningInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  BOOL v18;
  void *v20;
  id v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entitlements"));
  v10 = sub_100046CA4(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v12 = objc_msgSend(v11, "localSigningIsUnrestricted");

  if (v10 || (v12 & 1) != 0)
  {
    v21 = 0;
    v18 = -[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:](self, "_validateLinkedParentForSigningInfo:appManagementDomainValue:error:", v6, v10, &v21);
    v17 = v21;
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    v13 = (void *)MIInstallerErrorDomain;
    v14 = sub_100046BCC(v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateAppManagementDomainForSigningInfo:error:]", 1479, v13, 194, 0, 0, CFSTR("App %@ has a value for its %@ entitlement that is not allowed: \"%@\"."), v15, (uint64_t)v8);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);

    v18 = 0;
    if (!a4)
      goto LABEL_8;
  }
  if (!v18)
    *a4 = objc_retainAutorelease(v17);
LABEL_8:

  return v18;
}

- (BOOL)_performAppClipSpecificValidationForEntitlements:(id)a3 isAppClip:(BOOL *)a4 withError:(id *)a5
{
  id v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  char v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *i;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _UNKNOWN **v49;
  __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  id obj;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];

  v7 = a3;
  v8 = sub_10004698C(v7);
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.widgetkit-extension")));
  if (!v8)
  {
    v13 = 0;
    v14 = 0;
    v24 = 0;
    v15 = 0;
    v18 = 0;
    v66 = 0;
    v23 = 0;
    goto LABEL_10;
  }
  v9 = sub_100046A44(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_10004699C(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v66 = v10;
  if (!v12)
  {
    v28 = (void *)MIInstallerErrorDomain;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
    v32 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1532, v28, 145, 0, &off_10008FD70, CFSTR("Attempted to install an app clip with bundleID %@ which is on demand install capable but doesn't have the %@ entitlement"), v31, (uint64_t)v30);
    v23 = (id)objc_claimAutoreleasedReturnValue(v32);

    v13 = 0;
LABEL_20:
    v14 = 0;
    v24 = 0;
    v15 = 0;
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  v13 = v12;
  if (objc_msgSend(v12, "count") != (id)1)
  {
    v33 = (void *)MIInstallerErrorDomain;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
    v37 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1538, v33, 151, 0, &off_10008FD98, CFSTR("Attempted to install an app clip with bundleID %@ which has %ld parent identifiers in the %@ entitlement"), v36, (uint64_t)v35);
    v23 = (id)objc_claimAutoreleasedReturnValue(v37);

    goto LABEL_20;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR(".")));
  if (!objc_msgSend(v10, "hasPrefix:", v15)
    || (v17 = objc_msgSend(v10, "length"), v17 <= objc_msgSend(v15, "length")))
  {
    v38 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1546, MIInstallerErrorDomain, 150, 0, &off_10008FDC0, CFSTR("Application identifier of the parent app, \"%@\", is not a prefix of the application identifier of the app clip, \"%@\"), v16, (uint64_t)v14);
    v23 = (id)objc_claimAutoreleasedReturnValue(v38);
    v24 = 0;
    goto LABEL_22;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v15, "length")));
  if (objc_msgSend(v18, "containsString:", CFSTR(".")))
  {
    v62 = (void *)MIInstallerErrorDomain;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
    v22 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1552, v62, 149, 0, &off_10008FDE8, CFSTR("App clip with bundleID \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\")'"),
            v21,
            (uint64_t)v20);
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);

LABEL_8:
    v24 = 0;
    goto LABEL_23;
  }
  v39 = sub_100046B14(v7);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (!v40)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v64)
    {
      v60 = *(_QWORD *)v70;
      while (2)
      {
        for (i = 0; i != v64; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v60)
            objc_enumerationMutation(obj);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i), "extensionPointIdentifier"));
          if (!objc_msgSend(v68, "containsObject:", v45))
          {
            v61 = (void *)MIInstallerErrorDomain;
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
            v55 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1568, v61, 173, 0, &off_10008FE38, CFSTR("The App Clip with bundle ID %@ contains an app extension with an extension point that is not allowed within an App Clip, \"%@\"."), v54, (uint64_t)v53);
            v23 = (id)objc_claimAutoreleasedReturnValue(v55);

            goto LABEL_8;
          }

        }
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        if (v64)
          continue;
        break;
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle embeddedWatchApp](self, "embeddedWatchApp"));
    if (v46)
    {
      v48 = (void *)MIInstallerErrorDomain;
      v49 = &off_10008FE60;
      v50 = CFSTR("App clip contains an embedded watch app");
      v51 = 1576;
      v52 = 146;
LABEL_40:
      v57 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", v51, v48, v52, 0, v49, v50, v47, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue(v57);
      goto LABEL_8;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
    v23 = objc_msgSend(v56, "count");

    if (v23)
    {
      v48 = (void *)MIInstallerErrorDomain;
      v49 = &off_10008FE88;
      v50 = CFSTR("App clip contains a DriverKit bundle");
      v51 = 1583;
      v52 = 179;
      goto LABEL_40;
    }
    v24 = 0;
LABEL_10:
    v25 = 1;
    if (!a4)
      goto LABEL_12;
    goto LABEL_11;
  }
  v24 = (void *)v40;
  v59 = (void *)MIInstallerErrorDomain;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "identifier"));
  v43 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1560, v59, 148, 0, &off_10008FE10, CFSTR("App clip with bundleID %@ has the %@ entitlement, which is not allowed on app clips"), v42, (uint64_t)v41);
  v23 = (id)objc_claimAutoreleasedReturnValue(v43);

LABEL_23:
  v25 = 0;
  if (a4)
LABEL_11:
    *a4 = v8;
LABEL_12:
  if (a5)
    v26 = v25;
  else
    v26 = 1;
  if ((v26 & 1) == 0)
    *a5 = objc_retainAutorelease(v23);

  return v25;
}

- (BOOL)_performBrowserAppValidationForEntitlements:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  BOOL v17;
  char v18;
  uint64_t v20;
  id v21;
  int v22;
  int v23;
  id *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *m;
  void *v34;
  id *v35;
  unsigned __int8 v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  void *i;
  void *v54;
  id *v55;
  unsigned __int8 v56;
  void *v57;
  id v58;
  void *j;
  void *v60;
  id *v61;
  unsigned __int8 v62;
  void *v63;
  id v64;
  id v65;
  void *k;
  void *v67;
  id *v68;
  unsigned __int8 v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  id v115;
  uint64_t *v116;
  id obj;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];

  v5 = a3;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = sub_10003DCE4;
  v122 = sub_10003DCF4;
  v123 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v7 = sub_10004718C(v5);
  v92 = v6;
  if (((sub_10004719C(v5) ^ 1 | v7) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v15 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1623, MIInstallerErrorDomain, 216, 0, 0, CFSTR("%@ has the \"%@\" entitlement, but it does not have the \"%@\" entitlement. The \"%@\" entitlement is only available to apps with the \"%@\" entitlement."), v14, (uint64_t)v10);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_5;
  }
  v8 = sub_100047064(v5);
  v9 = sub_100047074(v5);
  if ((v8 & v9) == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v12 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1634, MIInstallerErrorDomain, 212, 0, 0, CFSTR("%@ has both the \"%@\" entitlement and the \"%@\" entitlement. Only one of these entitlements may be present at a time. Remove one of these entitlements to allow this app to be installed."), v11, (uint64_t)v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
LABEL_5:
    v16 = (id)v119[5];
    v119[5] = v13;
LABEL_6:

    v17 = 0;
    goto LABEL_7;
  }
  if ((v9 & v7) == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v21 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1641, MIInstallerErrorDomain, 214, 0, 0, CFSTR("%@ has the \"%@\" entitlement so it may not also have the \"%@\" entitlement. Remove one of these entitlements to allow this app to be installed."), v20, (uint64_t)v10);
    v13 = objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_5;
  }
  if (v8)
  {
    v22 = MGGetBoolAnswer(CFSTR("li+w2foswFu0srn5UxdOug"));
    if ((v7 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
      v38 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1660, MIInstallerErrorDomain, 201, 0, 0, CFSTR("%@ has the \"%@\" entitlement but must also have the \"%@\" entitlement."), v37, (uint64_t)v10);
      v13 = objc_claimAutoreleasedReturnValue(v38);
      goto LABEL_5;
    }
    v23 = v22;
    if (v22)
    {
      v24 = (id *)(v119 + 5);
      obj = (id)v119[5];
      v25 = objc_msgSend(v6, "hasExecutableSliceForCPUType:subtype:error:", 16777228, 2, &obj);
      objc_storeStrong(v24, obj);
      if ((v25 & 1) == 0)
      {
        v48 = (void *)v119[5];
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
        v50 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1667, MIInstallerErrorDomain, 202, v48, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v49, (uint64_t)v10);
        v13 = objc_claimAutoreleasedReturnValue(v50);
        goto LABEL_5;
      }
      v26 = (void *)v119[5];
      v119[5] = 0;

      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_10003DCFC;
      v114[3] = &unk_1000858F0;
      v116 = &v118;
      v115 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "enumerateDylibsWithBlock:", v114));
      v10 = v27;
      v28 = v119;
      if (v119[5])
      {
LABEL_72:
        v16 = v115;
        goto LABEL_6;
      }
      if (v27)
      {
        v29 = v27;
        v30 = (void *)v28[5];
        v28[5] = (uint64_t)v29;
LABEL_71:

        goto LABEL_72;
      }
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
      if (v52)
      {
        v88 = v51;
        v89 = *(_QWORD *)v111;
        while (2)
        {
          for (i = 0; i != v52; i = (char *)i + 1)
          {
            if (*(_QWORD *)v111 != v89)
              objc_enumerationMutation(v88);
            v54 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
            v55 = (id *)(v119 + 5);
            v109 = (id)v119[5];
            v56 = objc_msgSend(v54, "hasExecutableSliceForCPUType:subtype:error:", 16777228, 2, &v109);
            objc_storeStrong(v55, v109);
            if ((v56 & 1) == 0)
            {
              v70 = (void *)v119[5];
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "relativePath"));
              v73 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1706, MIInstallerErrorDomain, 202, v70, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v72, (uint64_t)v71);
              v74 = objc_claimAutoreleasedReturnValue(v73);
              v75 = (void *)v119[5];
              v119[5] = v74;

LABEL_70:
              v30 = v88;
              goto LABEL_71;
            }
          }
          v51 = v88;
          v52 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
          if (v52)
            continue;
          break;
        }
      }

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
      if (v58)
      {
        v88 = v57;
        v90 = *(_QWORD *)v106;
        while (2)
        {
          for (j = 0; j != v58; j = (char *)j + 1)
          {
            if (*(_QWORD *)v106 != v90)
              objc_enumerationMutation(v88);
            v60 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j);
            v61 = (id *)(v119 + 5);
            v104 = (id)v119[5];
            v62 = objc_msgSend(v60, "hasExecutableSliceForCPUType:subtype:error:", 16777228, 2, &v104);
            objc_storeStrong(v61, v104);
            if ((v62 & 1) == 0)
            {
              v76 = (void *)v119[5];
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "relativePath"));
              v79 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1714, MIInstallerErrorDomain, 202, v76, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v78, (uint64_t)v77);
              v80 = objc_claimAutoreleasedReturnValue(v79);
              v81 = (void *)v119[5];
              v119[5] = v80;

              goto LABEL_70;
            }
          }
          v57 = v88;
          v58 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
          if (v58)
            continue;
          break;
        }
      }

      if (sub_1000465FC(v5))
      {
        v103 = 0u;
        v101 = 0u;
        v102 = 0u;
        v100 = 0u;
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
        v88 = v63;
        if (v64)
        {
          v91 = *(_QWORD *)v101;
          while (2)
          {
            v65 = v64;
            for (k = 0; k != v65; k = (char *)k + 1)
            {
              if (*(_QWORD *)v101 != v91)
                objc_enumerationMutation(v88);
              v67 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)k);
              v68 = (id *)(v119 + 5);
              v99 = (id)v119[5];
              v69 = objc_msgSend(v67, "hasExecutableSliceForCPUType:subtype:error:", 16777228, 2, &v99);
              objc_storeStrong(v68, v99);
              if ((v69 & 1) == 0)
              {
                v82 = (void *)v119[5];
                v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "relativePath"));
                v85 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1725, MIInstallerErrorDomain, 202, v82, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v84, (uint64_t)v83);
                v86 = objc_claimAutoreleasedReturnValue(v85);
                v87 = (void *)v119[5];
                v119[5] = v86;

                goto LABEL_70;
              }
            }
            v64 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
            if (v64)
              continue;
            break;
          }
        }

      }
    }
  }
  else
  {
    v23 = 0;
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v124, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v96;
    while (2)
    {
      for (m = 0; m != v31; m = (char *)m + 1)
      {
        if (*(_QWORD *)v96 != v32)
          objc_enumerationMutation(v10);
        v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)m);
        if (v23)
        {
          v35 = (id *)(v119 + 5);
          v94 = (id)v119[5];
          v36 = objc_msgSend(v34, "hasExecutableSliceForCPUType:subtype:error:", 16777228, 2, &v94);
          objc_storeStrong(v35, v94);
          if ((v36 & 1) == 0)
          {
            v39 = (void *)v119[5];
            v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "relativePath"));
            v41 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1739, MIInstallerErrorDomain, 202, v39, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v40, (uint64_t)v16);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            v43 = (void *)v119[5];
            v119[5] = v42;
LABEL_39:

            goto LABEL_6;
          }
        }
        if ((v8 & 1) == 0 && objc_msgSend(v34, "targetsBrowserExtensionPoint"))
        {
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "relativePath"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "extensionPointIdentifier"));
          v45 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]", 1745, MIInstallerErrorDomain, 203, 0, 0, CFSTR("The app extension at \"%@\" targets the extension point \"%@\", which is not allowed in a non-browser app. Either add the entitlement \"%@\" to the containing app, or remove this app extension."), v44, (uint64_t)v16);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          v47 = (void *)v119[5];
          v119[5] = v46;

          goto LABEL_39;
        }
      }
      v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v124, 16);
      v17 = 1;
      if (v31)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_7:

  if (a4)
    v18 = v17;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
    *a4 = objc_retainAutorelease((id)v119[5]);

  _Block_object_dispose(&v118, 8);
  return v17;
}

- (BOOL)_checkEligibilityForEntitlements:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  const char *v38;
  id v39;
  const char *v40;
  id v41;
  uint64_t v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));

  v9 = -[MIInstallableBundle eligibilityOperationType](self, "eligibilityOperationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

  v12 = sub_100047064(v6);
  v13 = sub_100047074(v6);
  if ((v12 & 1) == 0 && !v13)
  {
    v15 = 0;
    goto LABEL_4;
  }
  v51 = 0;
  if (v12)
  {
    switch(v9)
    {
      case 2:
        v23 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
          goto LABEL_33;
        v44 = v11;
        v24 = CFSTR("Checking eligibility for restore of browser engine host app %@");
        break;
      case 1:
        v23 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
        {
LABEL_33:
          v21 = 4;
          goto LABEL_45;
        }
        v44 = v11;
        v24 = CFSTR("Checking eligibility for update of browser engine host app %@");
        break;
      case 0:
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v44 = v11;
          MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", CFSTR("Checking eligibility for initial install of browser engine host app %@"));
        }
        v21 = 7;
        goto LABEL_45;
      default:
        v22 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1792, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unknown validation operation %lu for %@"), v14, v9);
LABEL_55:
        v15 = (id)objc_claimAutoreleasedReturnValue(v22);
        if (!a4)
          goto LABEL_72;
        goto LABEL_64;
    }
    MOLogWrite(v23, 5, "-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", v24);
    goto LABEL_33;
  }
  if (!v13)
  {
    v22 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1817, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unknown validation operation for %@"), v14, (uint64_t)v11);
    goto LABEL_55;
  }
  if (v9 == 2)
  {
    v26 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      goto LABEL_44;
    v44 = v11;
    v27 = CFSTR("Checking eligibility for restore of embedded web engine app %@");
    goto LABEL_43;
  }
  if (v9 == 1)
  {
    v26 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      goto LABEL_44;
    v44 = v11;
    v27 = CFSTR("Checking eligibility for update of embedded web engine app %@");
LABEL_43:
    MOLogWrite(v26, 5, "-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", v27);
LABEL_44:
    v21 = 6;
    goto LABEL_45;
  }
  if (v9)
  {
    v22 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1813, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unknown validation operation %lu for %@"), v14, v9);
    goto LABEL_55;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v44 = v11;
    MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", CFSTR("Checking eligibility for initial install of embedded web engine app %@"));
  }
  v21 = 23;
LABEL_45:
  v49 = 0;
  v50 = 0;
  v48 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIEligibilityManager sharedInstance](MIEligibilityManager, "sharedInstance", v44));
  v47 = 0;
  v29 = objc_msgSend(v28, "getEligibilityForDomain:answer:source:status:context:error:", v21, &v51, &v50, &v49, &v48, &v47);
  v15 = v47;

  if ((v29 & 1) == 0)
  {
    v31 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1825, MIInstallerErrorDomain, 4, v15, 0, CFSTR("Failed to get eligibility for browser engine app %@"), v30, (uint64_t)v11);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    goto LABEL_63;
  }
  if (v51 != 4)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", CFSTR("Eligibility check for domain %llu returned ineligible value %llu, source %llu, status %@, context %@"));
    v33 = sub_10003E4EC(v50, v49);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (v34)
    {
      v36 = (void *)v34;
      v37 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v34));

    }
    else
    {
      v37 = &stru_100086E88;
    }
    v38 = "install";
    if (v9 == 1)
      v38 = "update";
    if (v9 == 2)
      v38 = "restore";
    v39 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1839, MIInstallerErrorDomain, 208, 0, 0, CFSTR("This device is not eligible to %s the browser engine app \"%@\".%@"), v35, (uint64_t)v38);
    v32 = objc_claimAutoreleasedReturnValue(v39);

    v15 = (id)v37;
LABEL_63:

    v15 = (id)v32;
    if (!a4)
    {
LABEL_72:
      v20 = 0;
      goto LABEL_73;
    }
LABEL_64:
    v15 = objc_retainAutorelease(v15);
    v20 = 0;
    *a4 = v15;
    goto LABEL_73;
  }

LABEL_4:
  if (!sub_10004662C(v6))
  {
    v20 = 1;
    goto LABEL_73;
  }
  LOBYTE(v51) = 0;
  v45 = v15;
  v46 = 0;
  v16 = -[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:](self, "_getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:", 1, 1, v9, &v51, &v46, &v45);
  v17 = (__CFString *)v46;
  v18 = v45;

  if (!v16)
  {
LABEL_71:

    v15 = v18;
    if (!a4)
      goto LABEL_72;
    goto LABEL_64;
  }
  if (!(_BYTE)v51)
  {
    if (v17)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v17));

      v17 = (__CFString *)v25;
    }
    else
    {
      v17 = &stru_100086E88;
    }
    v40 = "install";
    if (v9 == 1)
      v40 = "update";
    if (v9 == 2)
      v40 = "restore";
    v41 = sub_100010E50((uint64_t)"-[MIInstallableBundle _checkEligibilityForEntitlements:withError:]", 1859, MIInstallerErrorDomain, 208, 0, 0, CFSTR("This device is not eligible to %s the marketplace \"%@\".%@"), v19, (uint64_t)v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);

    v18 = (id)v42;
    goto LABEL_71;
  }

  v20 = 1;
  v15 = v18;
LABEL_73:

  return v20;
}

- (id)_builtInAppUpgradeFailureError
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v6 = objc_msgSend(v5, "hasInternalContent");

  v7 = (void *)MIInstallerErrorDomain;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v6)
  else
    v11 = sub_100010E50((uint64_t)"-[MIInstallableBundle _builtInAppUpgradeFailureError]", 1944, v7, 58, 0, &off_10008FED8, CFSTR("This app has the same bundle identifier, \"%@\", as a built-in system app located at \"%@\". However, this app is not configured correctly to allow it to upgrade that system app."), v9, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (BOOL)_performBuiltInAppUpgradeValidationWithSigningInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  BOOL v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entitlements"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByDeletingLastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "systemAppsDirectory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if (v15
      && !+[MIExecutableBundle isGrandfatheredNonContainerizedForSigningInfo:](MIExecutableBundle, "isGrandfatheredNonContainerizedForSigningInfo:", v6)|| (sub_10003EAC4(v8) & 1) != 0)
    {
      v16 = 0;
      v17 = 1;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _builtInAppUpgradeFailureError](self, "_builtInAppUpgradeFailureError"));
      v16 = v18;
      if (a4)
      {
        v16 = objc_retainAutorelease(v18);
        v17 = 0;
        *a4 = v16;
      }
      else
      {
        v17 = 0;
      }
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)performVerificationWithError:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *i;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  unsigned int v60;
  id v61;
  int v62;
  id v63;
  id v64;
  void *j;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  int v70;
  id v71;
  int v72;
  void *v73;
  unsigned int v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned int v98;
  void *v99;
  id v100;
  id v101;
  uint64_t v102;
  void *k;
  void *v104;
  void *v105;
  void *m;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  id v112;
  int v113;
  id v114;
  id v115;
  uint64_t v116;
  void *n;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  id v131;
  BOOL v132;
  id v134;
  id v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  unsigned __int8 v145;
  void *v146;
  id v147;
  uint64_t v148;
  unsigned int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  id v164;
  void *v165;
  uint64_t v166;
  id v167;
  void *v168;
  void *v169;
  uint64_t v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  unsigned int v182;
  id v183;
  void *v184;
  unsigned __int8 v185;
  unsigned int v186;
  id v187;
  id v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  unsigned __int8 v193;
  id v194;
  uint64_t v195;
  void *v196;
  void *v197;
  unsigned int v198;
  void *v199;
  unsigned int v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  id v205;
  id v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  const __CFString *v213;
  void *v214;
  void *v215;
  objc_class *v216;
  NSString *v217;
  void *v218;
  uint64_t v219;
  id v220;
  id v221;
  void *v222;
  id v223;
  void *v224;
  void *v225;
  id v226;
  uint64_t v227;
  void *v228;
  void *v229;
  const __CFString *v230;
  void *v231;
  objc_class *v232;
  NSString *v233;
  uint64_t v234;
  id v235;
  void *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  unsigned __int8 v242;
  void *v243;
  unsigned int v244;
  uint64_t v245;
  void *v246;
  _UNKNOWN **v247;
  __CFString *v248;
  uint64_t v249;
  void *v250;
  unsigned __int8 v251;
  uint64_t v252;
  void *v253;
  void *v254;
  const __CFString *v255;
  void *v256;
  void *v257;
  unsigned __int8 v258;
  unsigned __int8 v259;
  void *v260;
  uint64_t v261;
  id v262;
  unsigned int v263;
  id v264;
  void *v265;
  id v266;
  id v267;
  int v268;
  id v269;
  id v270;
  uint64_t v271;
  void *v272;
  void *v273;
  id v274;
  id v275;
  int v276;
  id v277;
  id v278;
  uint64_t v279;
  void *v280;
  void *v281;
  id v282;
  id v283;
  int v284;
  id v285;
  id v286;
  uint64_t v287;
  void *ii;
  void *v289;
  id v290;
  id v291;
  id v292;
  unsigned __int8 v293;
  unsigned __int8 v294;
  uint64_t v295;
  id v296;
  uint64_t v297;
  id *v298;
  void *v299;
  uint64_t v300;
  id v301;
  uint64_t v302;
  void *v303;
  void *v304;
  id obj;
  id obja;
  id objb;
  id *v308;
  void *v309;
  id v310;
  uint64_t v311;
  id v312;
  uint64_t v313;
  void *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  unsigned int v318;
  unsigned int v319;
  void *v320;
  void *v321;
  unsigned int v322;
  id v323;
  id v324;
  id v325;
  id v326;
  id v327;
  id v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  id v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  id v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  id v343;
  id v344;
  id v345;
  id v346;
  id v347;
  char v348;
  id v349;
  id v350;
  id v351;
  id v352;
  id v353;
  id v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  id v363;
  id v364;
  id v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  id v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  id v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  id v384;
  id v385;
  id v386;
  id v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  id v392;
  id v393;
  id v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  id v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  id v404;
  id v405;
  id v406;
  objc_super v407;
  _BYTE v408[128];
  _BYTE v409[128];
  _BYTE v410[128];
  _BYTE v411[128];
  _BYTE v412[128];
  _BYTE v413[128];
  _BYTE v414[128];
  _BYTE v415[128];
  _BYTE v416[128];
  _BYTE v417[128];
  _BYTE v418[128];
  _BYTE v419[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v6 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
  v407.receiver = self;
  v407.super_class = (Class)MIInstallableBundle;
  if (!-[MIInstallable performVerificationWithError:](&v407, "performVerificationWithError:", a3))
  {
    v16 = 0;
    v17 = 0;
LABEL_139:
    v132 = 0;
    goto LABEL_140;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
    ((void (**)(_QWORD, const __CFString *, uint64_t))v8)[2](v8, CFSTR("VerifyingApplication"), 40);

  }
  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executableURL")));
    removexattr((const char *)objc_msgSend(v10, "fileSystemRepresentation"), "com.apple.installd.hidden_archs_fat_header", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executableURL")));
    v13 = sub_100005714((const char *)objc_msgSend(v12, "fileSystemRepresentation"));

    if ((v13 & 1) == 0)
    {
      v30 = (void *)MIInstallerErrorDomain;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "executableURL"));
      v34 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2010, v30, 14, 0, 0, CFSTR("Failed to unhide archs in executable %@"), v33, (uint64_t)v32);
      v17 = (id)objc_claimAutoreleasedReturnValue(v34);

      goto LABEL_22;
    }
  }
  if (objc_msgSend(v5, "installTargetType") == (id)1)
  {
    v14 = objc_msgSend(v5, "isDeveloperInstall");
    v15 = objc_msgSend(v5, "isSystemAppInstall");
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  if (((objc_msgSend(v18, "codeSigningEnforcementIsDisabled") | v6) & 1) != 0 || v15)
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v20 = objc_msgSend(v19, "isRemovableSystemApp");

    if (v20)
    {
      v22 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2029, MIInstallerErrorDomain, 25, 0, &off_10008FF00, CFSTR("Attempted to install a deletable system app with incorrect install type."), v21, v297);
      v17 = (id)objc_claimAutoreleasedReturnValue(v22);
LABEL_22:
      v16 = 0;
      goto LABEL_137;
    }
  }
  v318 = v15;
  v319 = v6;
  v23 = objc_msgSend(v5, "allowLocalProvisioned");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v406 = 0;
  v298 = &v406;
  v322 = v14 ^ 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v24, v14 ^ 1, 1, 1, v23, 0));
  v17 = v406;

  if (!v16)
    goto LABEL_137;
  v25 = objc_msgSend(v16, "codeSignerType");
  if (v14)
  {
    v26 = v25;
    if (objc_msgSend(v16, "profileValidationType") == (id)2 || v26 == (id)2)
      goto LABEL_26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements"));
    if (sub_10004660C(v27))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v29 = objc_msgSend(v28, "codeSigningEnforcementIsDisabled") ^ 1;

    }
    else
    {
      v29 = 0;
    }

    if ((v29 & 1) != 0 || v26 == (id)5)
    {
LABEL_26:
      if (objc_msgSend(v16, "codeSignerType") == (id)2)
      {
        v35 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
          goto LABEL_38;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v37 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
        v298 = v37;
        v38 = CFSTR("App %@ is being installed in a way that would ordinarily skip resource validation, but because it's not validated by a profile we're going to validate resources anyway.");
      }
      else
      {
        v39 = objc_msgSend(v16, "profileValidationType");
        v35 = qword_10009E048;
        if (v39 == (id)2)
        {
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
            goto LABEL_38;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v37 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
          v298 = v37;
          v38 = CFSTR("App %@ is being installed in a way that would ordinarily skip resource validation, but because it's validated by a UPP we're going to validate resources anyway.");
        }
        else
        {
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
            goto LABEL_38;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v37 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
          v298 = v37;
          v38 = CFSTR("App %@ is being installed in a way that would ordinarily skip resource validation, but because of how it's signed we're going to validate resources anyway.");
        }
      }
      MOLogWrite(v35, 5, "-[MIInstallableBundle performVerificationWithError:]", v38);

LABEL_38:
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle", v298));
      v405 = v17;
      v298 = &v405;
      v41 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v40, 1, 1, 1, v23, 0));
      v42 = v405;

      if (!v41)
      {
        v16 = 0;
        v17 = v42;
        goto LABEL_137;
      }
      v16 = (void *)v41;
      v17 = v42;
    }
  }
  v43 = v17;
  -[MIInstallableBundle setBundleSigningInfo:](self, "setBundleSigningInfo:", v16);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements"));
  v404 = v17;
  v46 = sub_100040F7C(v44, v45, &v404);
  v17 = v404;

  if (!v46)
    goto LABEL_137;
  v321 = v16;
  v308 = a3;
  v309 = v5;
  v402 = 0u;
  v403 = 0u;
  v400 = 0u;
  v401 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v400, v419, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v401;
    do
    {
      v51 = 0;
      v52 = v17;
      do
      {
        if (*(_QWORD *)v401 != v50)
          objc_enumerationMutation(v47);
        v53 = *(_QWORD *)(*((_QWORD *)&v400 + 1) + 8 * (_QWORD)v51);
        v399 = v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v53, v322, 0, 1, v23, 1, &v399));
        v17 = v399;

        if (!v54)
        {

          goto LABEL_62;
        }
        v51 = (char *)v51 + 1;
        v52 = v17;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v400, v419, 16);
    }
    while (v49);
  }

  v397 = 0u;
  v398 = 0u;
  v395 = 0u;
  v396 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v310 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v395, v418, 16);
  if (!v310)
    goto LABEL_64;
  v313 = *(_QWORD *)v396;
  do
  {
    for (i = 0; i != v310; i = (char *)i + 1)
    {
      if (*(_QWORD *)v396 != v313)
        objc_enumerationMutation(obj);
      v56 = *(void **)(*((_QWORD *)&v395 + 1) + 8 * (_QWORD)i);
      v394 = v17;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v56, v322, 0, 1, v23, 0, &v394));
      v58 = v394;

      if (!v57)
        goto LABEL_135;
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "entitlements"));
      v393 = v58;
      v60 = objc_msgSend(v56, "validateHasCorrespondingEntitlements:error:", v59, &v393);
      v61 = v393;

      if (!v60)
        goto LABEL_134;
      v392 = v61;
      v62 = sub_10004115C(v56, v59, &v392);
      v17 = v392;

      if (!v62)
      {
        v61 = v17;
LABEL_134:

        v58 = v61;
LABEL_135:
        a3 = v308;
        v5 = v309;

        v17 = v58;
        goto LABEL_136;
      }
      if (sub_10004662C(v59))
      {
        v128 = (void *)MIInstallerErrorDomain;
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "relativePath"));
        v131 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2138, v128, 210, 0, 0, CFSTR("The app extension at \"%@\" has the \"%@\" entitlement, which is not allowed on an app extension."), v130, (uint64_t)v129);
        v61 = (id)objc_claimAutoreleasedReturnValue(v131);

        goto LABEL_134;
      }

      v16 = v321;
    }
    v310 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v395, v418, 16);
  }
  while (v310);
LABEL_64:

  v390 = 0u;
  v391 = 0u;
  v388 = 0u;
  v389 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
  v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v388, v417, 16);
  if (!v63)
    goto LABEL_76;
  v64 = v63;
  v311 = *(_QWORD *)v389;
  do
  {
    for (j = 0; j != v64; j = (char *)j + 1)
    {
      if (*(_QWORD *)v389 != v311)
        objc_enumerationMutation(obja);
      v66 = *(void **)(*((_QWORD *)&v388 + 1) + 8 * (_QWORD)j);
      v387 = v17;
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v66, v322, 0, 1, v23, 0, &v387));
      v68 = v387;

      if (!v67)
      {
        v160 = obja;
        a3 = v308;
        v5 = v309;
LABEL_178:

        v17 = v68;
        goto LABEL_137;
      }
      v314 = v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "entitlements"));
      if ((sub_100046E28(v69) & 1) == 0)
      {
        v160 = obja;
        v161 = (void *)MIInstallerErrorDomain;
        v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bundleURL"));
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "path"));
        v164 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2160, v161, 178, 0, &off_10008FF28, CFSTR("Found DriverKit bundle %@ with missing entitlement %@"), v163, (uint64_t)v17);
        v71 = (id)objc_claimAutoreleasedReturnValue(v164);

        goto LABEL_176;
      }
      v386 = v68;
      v70 = sub_10004115C(v66, v69, &v386);
      v71 = v386;

      if (!v70)
      {
        v160 = obja;
        goto LABEL_174;
      }
      v385 = v71;
      v72 = sub_100040F7C(v66, v69, &v385);
      v17 = v385;

      if (!v72)
      {
        v160 = obja;
        v71 = v17;
LABEL_174:
        a3 = v308;
        v5 = v309;
        v16 = v321;
LABEL_177:

        v68 = v71;
        goto LABEL_178;
      }
      v16 = v321;
      if (sub_10004662C(v69))
      {
        v160 = obja;
        v165 = (void *)MIInstallerErrorDomain;
        v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "relativePath"));
        v167 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2174, v165, 210, 0, 0, CFSTR("The DriverKit extension at \"%@\" has the \"%@\" entitlement, which is not allowed on a DriverKit extension."), v166, (uint64_t)v162);
        v71 = (id)objc_claimAutoreleasedReturnValue(v167);
LABEL_176:
        v5 = v309;

        a3 = v308;
        goto LABEL_177;
      }

    }
    v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v388, v417, 16);
  }
  while (v64);
LABEL_76:

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entitlements"));
  v74 = sub_1000465FC(v73);

  if (!v74)
  {
    v77 = v17;
    goto LABEL_142;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v384 = v17;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "xpcServiceBundlesWithError:", &v384));
  v77 = v384;

  -[MIInstallableBundle setXpcServiceBundles:](self, "setXpcServiceBundles:", v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));

  if (!v78)
  {
    v17 = v77;
    goto LABEL_187;
  }
  v382 = 0u;
  v383 = 0u;
  v380 = 0u;
  v381 = 0u;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v380, v416, 16);
  if (v80)
  {
    v81 = v80;
    v315 = *(_QWORD *)v381;
    do
    {
      v82 = 0;
      v83 = v77;
      do
      {
        if (*(_QWORD *)v381 != v315)
          objc_enumerationMutation(v79);
        v84 = *(void **)(*((_QWORD *)&v380 + 1) + 8 * (_QWORD)v82);
        v379 = v83;
        v85 = objc_msgSend(v84, "executableExistsWithError:", &v379);
        v77 = v379;

        if (!v85)
          goto LABEL_185;
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "identifier"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", v86));

        if (v88)
        {
          v173 = (void *)MIInstallerErrorDomain;
          v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bundleURL"));
          v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "path"));
          v176 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
          v177 = v79;
          v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "objectForKeyedSubscript:", v86));
          v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "path"));
          v180 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2197, v173, 57, 0, &off_10008FF50, CFSTR("Found bundle at %@ with the same identifier (%@) as bundle at %@"), v179, (uint64_t)v175);
          v181 = objc_claimAutoreleasedReturnValue(v180);

          v79 = v177;
          v77 = (id)v181;
LABEL_185:

LABEL_186:
          v17 = v77;
          goto LABEL_62;
        }
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bundleURL"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        objc_msgSend(v90, "setObject:forKeyedSubscript:", v89, v86);

        v82 = (char *)v82 + 1;
        v83 = v77;
      }
      while (v81 != v82);
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v380, v416, 16);
    }
    while (v81);
  }

  if (!v319)
    goto LABEL_97;
  v377 = 0u;
  v378 = 0u;
  v375 = 0u;
  v376 = 0u;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v375, v415, 16);
  if (!v92)
    goto LABEL_96;
  v93 = v92;
  v94 = *(_QWORD *)v376;
  do
  {
    v95 = 0;
    v96 = v77;
    do
    {
      if (*(_QWORD *)v376 != v94)
        objc_enumerationMutation(v91);
      v97 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * (_QWORD)v95);
      v374 = v96;
      v98 = objc_msgSend(v97, "setIsPlaceholderWithError:", &v374);
      v77 = v374;

      if (!v98)
      {

        goto LABEL_186;
      }
      v95 = (char *)v95 + 1;
      v96 = v77;
    }
    while (v93 != v95);
    v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v375, v415, 16);
  }
  while (v93);
LABEL_96:

LABEL_97:
  v372 = 0u;
  v373 = 0u;
  v370 = 0u;
  v371 = 0u;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
  v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v370, v414, 16);
  if (v100)
  {
    v101 = v100;
    v102 = *(_QWORD *)v371;
    do
    {
      for (k = 0; k != v101; k = (char *)k + 1)
      {
        if (*(_QWORD *)v371 != v102)
          objc_enumerationMutation(v99);
        v104 = *(void **)(*((_QWORD *)&v370 + 1) + 8 * (_QWORD)k);
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
        objc_msgSend(v104, "installEmbeddedProvisioningProfileWithProgress:", v105);

      }
      v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v370, v414, 16);
    }
    while (v101);
  }

  v368 = 0u;
  v369 = 0u;
  v366 = 0u;
  v367 = 0u;
  objb = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
  v312 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v366, v413, 16);
  if (v312)
  {
    v316 = *(_QWORD *)v367;
    do
    {
      for (m = 0; m != v312; m = (char *)m + 1)
      {
        if (*(_QWORD *)v367 != v316)
          objc_enumerationMutation(objb);
        v107 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * (_QWORD)m);
        v365 = v77;
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v107, v322, 0, 1, v23, 0, &v365));
        v17 = v365;

        if (!v108)
        {
          v207 = objb;
          a3 = v308;
          v5 = v309;
          v16 = v321;
LABEL_209:

          goto LABEL_137;
        }
        v109 = v108;
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "entitlements"));
        v364 = v17;
        v111 = sub_10004115C(v107, v110, &v364);
        v112 = v364;

        if (!v111)
        {
          v207 = objb;
LABEL_208:
          v16 = v321;

          v17 = v112;
          a3 = v308;
          v5 = v309;
          goto LABEL_209;
        }
        v363 = v112;
        v113 = sub_100040F7C(v107, v110, &v363);
        v77 = v363;

        if (!v113)
        {
          v207 = objb;
          v112 = v77;
          goto LABEL_208;
        }
        if (sub_10004662C(v110))
        {
          v207 = objb;
          v208 = (void *)MIInstallerErrorDomain;
          v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "relativePath"));
          v211 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2243, v208, 210, 0, 0, CFSTR("The XPCService extension at \"%@\" has the \"%@\" entitlement, which is not allowed on an XPCService."), v210, (uint64_t)v209);
          v112 = (id)objc_claimAutoreleasedReturnValue(v211);

          goto LABEL_208;
        }

      }
      v312 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v366, v413, 16);
    }
    while (v312);
  }

  v361 = 0u;
  v362 = 0u;
  v359 = 0u;
  v360 = 0u;
  v323 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
  v114 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v359, v412, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v360;
    do
    {
      for (n = 0; n != v115; n = (char *)n + 1)
      {
        if (*(_QWORD *)v360 != v116)
          objc_enumerationMutation(v323);
        v118 = *(void **)(*((_QWORD *)&v359 + 1) + 8 * (_QWORD)n);
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "infoPlistSubset"));
        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("XPCService")));

        if (v120)
        {
          objc_opt_class(NSDictionary);
          v121 = sub_100013C00(v120);
          v122 = (void *)objc_claimAutoreleasedReturnValue(v121);

          if (!v122)
          {
            v214 = (void *)MIInstallerErrorDomain;
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bundleURL"));
            v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "path"));
            v216 = (objc_class *)objc_opt_class(v120);
            v217 = NSStringFromClass(v216);
            v218 = (void *)objc_claimAutoreleasedReturnValue(v217);
            v220 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2252, v214, 113, 0, 0, CFSTR("XPCService key in Info.plist of XPC service at %@ has illegal value type: %@"), v219, (uint64_t)v215);
            goto LABEL_225;
          }
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("ServiceType")));
          if (v123)
          {
            objc_opt_class(NSString);
            v124 = sub_100013C00(v123);
            v125 = (void *)objc_claimAutoreleasedReturnValue(v124);

            if (!v125)
            {
              v231 = (void *)MIInstallerErrorDomain;
              v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bundleURL"));
              v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "path"));
              v232 = (objc_class *)objc_opt_class(v123);
              v233 = NSStringFromClass(v232);
              v302 = objc_claimAutoreleasedReturnValue(v233);
              v235 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2259, v231, 51, 0, 0, CFSTR("XPCService's ServiceType key in Info.plist of service at %@ has illegal value type: %@"), v234, (uint64_t)v218);
              v17 = (id)objc_claimAutoreleasedReturnValue(v235);

              v77 = (id)v302;
              goto LABEL_226;
            }
            if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Application")) & 1) == 0)
            {
              v236 = (void *)MIInstallerErrorDomain;
              v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bundleURL"));
              v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "path"));
              v220 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2264, v236, 51, 0, 0, CFSTR("XPCService's ServiceType key in Info.plist of service at %@ has illegal value: %@ (must be \"Application\")"), v237, (uint64_t)v218);
LABEL_225:
              v17 = (id)objc_claimAutoreleasedReturnValue(v220);
LABEL_226:

LABEL_183:
              goto LABEL_62;
            }
          }

        }
      }
      v115 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v359, v412, 16);
    }
    while (v115);
  }

  v126 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v298 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "identifier"));
    MOLogWrite(v126, 5, "-[MIInstallableBundle performVerificationWithError:]", CFSTR("Enabling XPC services in %@"));

  }
  -[MIInstallableBundle setXpcServiceBundlesEnabled:](self, "setXpcServiceBundlesEnabled:", 1, v298);
LABEL_142:
  v357 = 0u;
  v358 = 0u;
  v355 = 0u;
  v356 = 0u;
  v323 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v134 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v355, v411, 16);
  if (!v134)
    goto LABEL_161;
  v135 = v134;
  v136 = *(_QWORD *)v356;
  v317 = MIContainerManagerErrorDomain;
  while (2)
  {
    v137 = 0;
    v138 = v77;
    while (2)
    {
      if (*(_QWORD *)v356 != v136)
        objc_enumerationMutation(v323);
      v139 = *(void **)(*((_QWORD *)&v355 + 1) + 8 * (_QWORD)v137);
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity", v298));
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "personaUniqueString"));
      v354 = v138;
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "dataContainerForPersona:error:", v141, &v354));
      v77 = v354;

      if (v120)
      {
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "parentBundleID"));
        if (v142)
        {
          v143 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "identifier"));
          v145 = objc_msgSend(v142, "isEqualToString:", v144);

          if ((v145 & 1) == 0)
          {
            v168 = (void *)MIInstallerErrorDomain;
            v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "identifier"));
            v171 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2306, v168, 88, 0, &off_10008FF78, CFSTR("An app extension with the identifier %@ is already installed as part of the bundle with identifier %@"), v170, (uint64_t)v169);
            v17 = (id)objc_claimAutoreleasedReturnValue(v171);

            v77 = v142;
            goto LABEL_182;
          }
        }
        else if (objc_msgSend(v120, "status") != (id)3 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        {
          v298 = (id *)v120;
          MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle performVerificationWithError:]", CFSTR("No parent bundle ID set for plugin container %@"));
        }

      }
      else
      {
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "domain"));
        if (!objc_msgSend(v146, "isEqualToString:", v317))
        {

LABEL_181:
          v172 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2314, MIInstallerErrorDomain, 4, v77, 0, CFSTR("Failed to look up data container for app extension %@"), v148, (uint64_t)v139);
          v17 = (id)objc_claimAutoreleasedReturnValue(v172);
LABEL_182:

          goto LABEL_183;
        }
        v147 = objc_msgSend(v77, "code");

        if (v147 != (id)21)
          goto LABEL_181;
      }

      v137 = (char *)v137 + 1;
      v138 = v77;
      if (v135 != v137)
        continue;
      break;
    }
    v135 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v355, v411, 16);
    if (v135)
      continue;
    break;
  }
LABEL_161:

  v16 = v321;
  v353 = v77;
  v149 = -[MIInstallableBundle _validateAppManagementDomainForSigningInfo:error:](self, "_validateAppManagementDomainForSigningInfo:error:", v321, &v353);
  v17 = v353;

  if (!v149)
  {
LABEL_187:
    a3 = v308;
    v5 = v309;
    goto LABEL_137;
  }
  if (!v319)
  {
    v350 = v17;
    v182 = -[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:](self, "_validateApplicationIdentifierForNewBundleSigningInfo:error:", v321, &v350);
    v183 = v350;

    if (v182)
    {
      v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "entitlements"));
      v349 = v183;
      v185 = -[MIInstallableBundle _performWatchVerificationForSigningInfo:isSystemAppInstall:withError:](self, "_performWatchVerificationForSigningInfo:isSystemAppInstall:withError:", v321, v318, &v349);
      v17 = v349;

      if ((v185 & 1) == 0)
      {

        goto LABEL_62;
      }
      v348 = 0;
      v347 = v17;
      v325 = v184;
      v186 = -[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:](self, "_performAppClipSpecificValidationForEntitlements:isAppClip:withError:", v184, &v348, &v347);
      v187 = v347;

      if (!v186)
        goto LABEL_306;
      if (v348)
      {
        v188 = sub_100046A44(v325);
        v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
        v190 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
        v191 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "bundleURL"));
        v346 = v187;
        v193 = objc_msgSend(v190, "setAppClipAppIdentifier:insecurelyCachedOnBundle:error:", v189, v192, &v346);
        v194 = v346;

        if ((v193 & 1) == 0)
        {
          v195 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v196 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle", v298));
            v298 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "bundleURL"));
            v301 = v194;
            MOLogWrite(v195, 3, "-[MIInstallableBundle performVerificationWithError:]", CFSTR("Failed to mark bundle %@ as app clip; this can affect keychain removal: %@"));

          }
          v194 = 0;
        }

        v187 = v194;
      }
      v197 = v187;
      v345 = v187;
      v198 = -[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:](self, "_performBrowserAppValidationForEntitlements:error:", v325, &v345, v298, v301);
      v187 = v345;

      if (!v198)
        goto LABEL_306;
      if (sub_10004662C(v325))
      {
        v199 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v200 = objc_msgSend(v199, "isLaunchProhibited");

        if (v200)
        {
          v201 = (void *)MIInstallerErrorDomain;
          v202 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "displayName"));
          v205 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2498, v201, 209, 0, 0, CFSTR("The marketplace \"%@\" has the key \"%@\" = TRUE in its Info.plist. This is not allowed."), v204, (uint64_t)v203);
          v206 = (id)objc_claimAutoreleasedReturnValue(v205);

          v187 = v202;
LABEL_304:

          goto LABEL_305;
        }
      }
      v239 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      if ((objc_msgSend(v239, "codeSigningEnforcementIsDisabled") & 1) != 0
        || (v240 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"))) == 0)
      {

      }
      else
      {
        v241 = (void *)v240;
        v242 = sub_100046564(v325);

        if ((v242 & 1) == 0)
        {
          v243 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
          v244 = objc_msgSend(v243, "hasInternalContent");

          v246 = (void *)MIInstallerErrorDomain;
          if (v244)
          {
            v247 = &off_10008FFA0;
            v248 = CFSTR("System app upgrade is missing upgrade entitlement (disable code signing enforcement via boot-args to avoid this).");
            v249 = 2504;
          }
          else
          {
            v247 = &off_10008FFC8;
            v248 = CFSTR("System app upgrade is missing upgrade entitlement.");
            v249 = 2506;
          }
          v295 = 16;
          goto LABEL_303;
        }
      }
      if (!v318 || (sub_10004660C(v325) & 1) != 0)
      {
        v250 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        if (objc_msgSend(v250, "isRemovableSystemApp"))
        {
          v251 = sub_10004660C(v325);

          if ((v251 & 1) == 0)
          {
            v246 = (void *)MIInstallerErrorDomain;
            v247 = &off_100090018;
            v248 = CFSTR("Install of known system app missing system app entitlement");
            v249 = 2519;
LABEL_300:
            v295 = 127;
LABEL_303:
            v296 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", v249, v246, v295, 0, v247, v248, v245, v300);
            v206 = (id)objc_claimAutoreleasedReturnValue(v296);
            goto LABEL_304;
          }
        }
        else
        {

        }
        v344 = v187;
        v263 = -[MIInstallableBundle _performBuiltInAppUpgradeValidationWithSigningInfo:error:](self, "_performBuiltInAppUpgradeValidationWithSigningInfo:error:", v321, &v344);
        v264 = v344;

        if (v263)
        {
          v265 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v266 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "executableURL")));
          v267 = objc_msgSend(v266, "fileSystemRepresentation");
          v343 = v264;
          v268 = MIMachOFileMatchesMyArchitecture(v267, &v343);
          v206 = v343;

          if (!v268)
          {
LABEL_305:
            v187 = v206;
            goto LABEL_306;
          }
          v341 = 0u;
          v342 = 0u;
          v339 = 0u;
          v340 = 0u;
          v187 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
          v269 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v339, v410, 16);
          if (v269)
          {
            v270 = v269;
            v271 = *(_QWORD *)v340;
LABEL_273:
            v272 = 0;
            v273 = v206;
            while (1)
            {
              if (*(_QWORD *)v340 != v271)
                objc_enumerationMutation(v187);
              v274 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v339 + 1) + 8 * (_QWORD)v272), "executableURL")));
              v275 = objc_msgSend(v274, "fileSystemRepresentation");
              v338 = v273;
              v276 = MIMachOFileMatchesMyArchitecture(v275, &v338);
              v206 = v338;

              if (!v276)
                goto LABEL_304;
              v272 = (char *)v272 + 1;
              v273 = v206;
              if (v270 == v272)
              {
                v270 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v339, v410, 16);
                if (v270)
                  goto LABEL_273;
                break;
              }
            }
          }

          v336 = 0u;
          v337 = 0u;
          v334 = 0u;
          v335 = 0u;
          v187 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
          v277 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v334, v409, 16);
          if (v277)
          {
            v278 = v277;
            v279 = *(_QWORD *)v335;
LABEL_281:
            v280 = 0;
            v281 = v206;
            while (1)
            {
              if (*(_QWORD *)v335 != v279)
                objc_enumerationMutation(v187);
              v282 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v334 + 1) + 8 * (_QWORD)v280), "executableURL")));
              v283 = objc_msgSend(v282, "fileSystemRepresentation");
              v333 = v281;
              v284 = MIMachOFileMatchesMyArchitecture(v283, &v333);
              v206 = v333;

              if (!v284)
                goto LABEL_304;
              v280 = (char *)v280 + 1;
              v281 = v206;
              if (v278 == v280)
              {
                v278 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v334, v409, 16);
                if (v278)
                  goto LABEL_281;
                break;
              }
            }
          }

          v331 = 0u;
          v332 = 0u;
          v329 = 0u;
          v330 = 0u;
          v187 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
          v285 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v329, v408, 16);
          if (v285)
          {
            v286 = v285;
            v287 = *(_QWORD *)v330;
            while (2)
            {
              for (ii = 0; ii != v286; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v330 != v287)
                  objc_enumerationMutation(v187);
                v289 = *(void **)(*((_QWORD *)&v329 + 1) + 8 * (_QWORD)ii);
                v290 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v289, "executableURL")));
                v291 = objc_msgSend(v290, "fileSystemRepresentation");

                v328 = v206;
                LODWORD(v291) = MIMachOFileMatchesMyArchitecture(v291, &v328);
                v292 = v328;

                if (!(_DWORD)v291)
                {
                  v206 = v292;
                  goto LABEL_304;
                }
                v327 = v292;
                v293 = objc_msgSend(v289, "onlyHasExecutableSlicesForPlatform:error:", 10, &v327);
                v206 = v327;

                if ((v293 & 1) == 0)
                {
                  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                    MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle performVerificationWithError:]", CFSTR("DriverKit executable was not built for DriverKit platform: %@"));
                  goto LABEL_304;
                }
              }
              v286 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v329, v408, 16);
              if (v286)
                continue;
              break;
            }
          }

          v326 = v206;
          v294 = -[MIInstallableBundle _checkEligibilityForEntitlements:withError:](self, "_checkEligibilityForEntitlements:withError:", v325, &v326);
          v17 = v326;

          if ((v294 & 1) != 0)
          {

            goto LABEL_264;
          }
          v187 = v17;
        }
        else
        {
          v187 = v264;
        }
LABEL_306:

        v17 = v187;
        goto LABEL_62;
      }
      v246 = (void *)MIInstallerErrorDomain;
      v247 = &off_10008FFF0;
      v248 = CFSTR("System app install missing system app entitlement");
      v249 = 2513;
      goto LABEL_300;
    }
    v17 = v183;
    goto LABEL_187;
  }
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "bundle"));
  v152 = v151;
  if (!v150)
  {
    v212 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
      goto LABEL_263;
    v324 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v324, "identifier"));
    v213 = CFSTR("%@: Initial placeholder install; skipping application-identifier check");
LABEL_230:
    MOLogWrite(v212, 7, "-[MIInstallableBundle performVerificationWithError:]", v213);
LABEL_262:

LABEL_263:
LABEL_264:
    v132 = 1;
    v5 = v309;
    v16 = v321;
    goto LABEL_140;
  }
  if ((objc_msgSend(v151, "isPlaceholder") & 1) == 0 && objc_msgSend(v309, "installTargetType") != (id)3)
  {
    v212 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
      goto LABEL_263;
    v324 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v324, "identifier"));
    v213 = CFSTR("%@: Parallel placeholder install or upgrade; skipping application-identifier check");
    goto LABEL_230;
  }
  v324 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "entitlements", v298));
  v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, 0));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v320, "entitlements"));
  v154 = v153;
  if (!v153)
  {
    v227 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v222 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "identifier"));
      v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "bundleURL"));
      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "path"));
      v230 = CFSTR("%@: Failed to fetch entitlements from existing installed bundle at %@; we won't be able to authenticate its upgrade.");
      goto LABEL_237;
    }
LABEL_261:

    goto LABEL_262;
  }
  if (sub_10004662C(v153) && objc_msgSend(v309, "installTargetType") == (id)3)
  {
    v155 = (void *)MIInstallerErrorDomain;
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "displayName"));
    v158 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2406, v155, 172, 0, 0, CFSTR("Offloading is not allowed for the marketplace \"%@\"."), v157, (uint64_t)v156);
    v159 = objc_claimAutoreleasedReturnValue(v158);
    goto LABEL_266;
  }
  if (v324)
  {
    v221 = sub_100046A44(v154);
    v222 = (void *)objc_claimAutoreleasedReturnValue(v221);
    v223 = sub_100046A44(v324);
    v224 = (void *)objc_claimAutoreleasedReturnValue(v223);
    v225 = v224;
    if (v222)
    {
      if (v224)
      {
        if ((objc_msgSend(v224, "isEqualToString:", v222) & 1) != 0)
        {
          v226 = v17;
          goto LABEL_260;
        }
        v252 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v253 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "identifier"));
          v301 = v225;
          v303 = v222;
          v299 = v254;
          v255 = CFSTR("%@: Supplied application-identifier in placeholder, \"%@\", was not equal to installed application-identifier, \"%@\"; replacing supplied entitlements with existing.");
LABEL_256:
          MOLogWrite(v252, 5, "-[MIInstallableBundle performVerificationWithError:]", v255);

        }
      }
      else
      {
        v252 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v253 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "identifier"));
          v299 = v254;
          v255 = CFSTR("%@: No application-identifier was in the supplied entitlements but the existing installed placeholder has it; replacing supplied entitlements with existing.");
          goto LABEL_256;
        }
      }
LABEL_257:

      goto LABEL_258;
    }
    v227 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v228 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "identifier"));
      v230 = CFSTR("%@: Existing bundle has no application-identifier entitlement; we can't authenticate its upgrade.");
LABEL_237:
      MOLogWrite(v227, 5, "-[MIInstallableBundle performVerificationWithError:]", v230);

    }
    goto LABEL_261;
  }
  v238 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "identifier"));
    v299 = v225;
    MOLogWrite(v238, 5, "-[MIInstallableBundle performVerificationWithError:]", CFSTR("%@: No placeholder entitlements supplied; writing existing."));
    goto LABEL_257;
  }
LABEL_258:
  v256 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle", v299, v301, v303));
  v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "bundleURL"));
  v352 = v17;
  v258 = sub_10004668C(v257, v154, (uint64_t)&v352);
  v226 = v352;

  if ((v258 & 1) != 0)
  {
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v225 = v321;
    v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 1, 0, 0, 0));
LABEL_260:

    v351 = v226;
    v259 = -[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:](self, "_validateApplicationIdentifierForNewBundleSigningInfo:error:", v321, &v351);
    v17 = v351;

    if ((v259 & 1) != 0)
      goto LABEL_261;
  }
  else
  {
    v260 = (void *)MIInstallerErrorDomain;
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "identifier"));
    v262 = sub_100010E50((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2431, v260, 4, v226, 0, CFSTR("%@: Unable to write placeholder entitlements into downgrade placeholder: %@"), v261, (uint64_t)v17);
    v159 = objc_claimAutoreleasedReturnValue(v262);

LABEL_266:
    v17 = (id)v159;
  }

LABEL_62:
  a3 = v308;
  v5 = v309;
LABEL_136:
  v16 = v321;
LABEL_137:
  if (!a3)
    goto LABEL_139;
  v17 = objc_retainAutorelease(v17);
  v132 = 0;
  *a3 = v17;
LABEL_140:

  return v132;
}

- (BOOL)_writeData:(id)a3 toFile:(id)a4 inContainerAtURL:(id)a5 legacyErrorString:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  id v25;
  const __CFString *v26;
  id v27;

  v11 = a3;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "URLByAppendingPathComponent:isDirectory:", a4, 0));
  v25 = 0;
  v14 = objc_msgSend(v11, "writeToURL:options:error:", v13, 268435457, &v25);
  v15 = v25;
  if (v14)
  {
    v16 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    {
      objc_msgSend(v11, "length");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
      MOLogWrite(v16, 7, "-[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]", CFSTR("Wrote %ld bytes of data from options to %@"));

    }
  }
  else
  {
    v17 = (void *)MIInstallerErrorDomain;
    v26 = CFSTR("LegacyErrorString");
    v27 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v21 = sub_100010E50((uint64_t)"-[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]", 2597, v17, 24, v15, v18, CFSTR("Failed to write data to %@"), v20, (uint64_t)v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (a7)
    {
      v15 = objc_retainAutorelease(v22);
      *a7 = v15;
    }
    else
    {
      v15 = v22;
    }
  }

  return v14;
}

- (BOOL)_writeOptionsDataToBundle:(id)a3 orContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  BOOL v21;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iTunesMetadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iTunesMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distributorInfo"));

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sinfData"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "distributorID"));
    if (v15 && !objc_msgSend(v12, "distributorIsFirstPartyApple"))
    {
      v23 = objc_msgSend(v10, "sinfDataType");

      if (v23 != 1)
      {
        v24 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
          MOLogWrite(v24, 5, "-[MIInstallableBundle _writeOptionsDataToBundle:orContainer:error:]", CFSTR("Forcing SINF data type to ALD for non-Apple distributed app %@"));

        }
        objc_msgSend(v10, "setSinfDataType:", 1, v32);
      }
    }
    else
    {

    }
  }
  v40 = 0;
  v16 = objc_msgSend(v8, "setSinfDataType:withError:", objc_msgSend(v10, "sinfDataType"), &v40);
  v17 = v40;
  if (!v16)
  {
    v18 = 0;
LABEL_10:
    v20 = v17;
    goto LABEL_11;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sinfData"));
  if (v18)
  {
    v39 = v17;
    v19 = objc_msgSend(v8, "updateSinfWithData:error:", v18, &v39);
    v20 = v39;

    if ((v19 & 1) == 0)
      goto LABEL_11;
  }
  else
  {
    v38 = v17;
    v26 = objc_msgSend(v8, "replicateRootSinfWithError:", &v38);
    v20 = v38;

    if (!v26)
    {
      v18 = 0;
      goto LABEL_11;
    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoJSONData"));

  if (v27)
  {
    v37 = v20;
    v28 = -[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:](self, "_writeData:toFile:inContainerAtURL:legacyErrorString:error:", v27, CFSTR("GeoJSON"), v34, CFSTR("GeoJSONCaptureFailed"), &v37);
    v17 = v37;

    if (!v28)
    {
      v18 = v27;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = v20;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iTunesArtworkData"));

  if (v18)
  {
    v36 = v17;
    v29 = -[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:](self, "_writeData:toFile:inContainerAtURL:legacyErrorString:error:", v18, CFSTR("iTunesArtwork"), v34, CFSTR("iTunesArtworkCaptureFailed"), &v36);
    v20 = v36;

    if (!v29)
      goto LABEL_11;
  }
  else
  {
    v20 = v17;
  }
  if (!v33)
  {
    v21 = 1;
    goto LABEL_14;
  }
  v35 = v20;
  v30 = objc_msgSend(v9, "writeiTunesMetadata:error:", v33, &v35);
  v31 = v35;

  if ((v30 & 1) != 0)
  {
    v21 = 1;
    v20 = v31;
    goto LABEL_14;
  }
  v20 = v31;
LABEL_11:
  if (a5)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a5 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_14:

  return v21;
}

- (BOOL)_captureDataFromStagingRootOrBundle:(id)a3 toContainer:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iTunesMetadata"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable stagingRootURL](self, "stagingRootURL"));
  v13 = objc_msgSend(v9, "captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:", v12, 1, 1, v11 == 0, a5);

  v14 = v13
     && (-[MIInstallable packageFormat](self, "packageFormat") != 2
      || objc_msgSend(v9, "captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:", v8, 1, 1, v11 == 0, a5));

  return v14;
}

- (BOOL)_validateSinfsWithError:(id *)a3
{
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_new(NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
      -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v13);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v7;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v6 = 0;
      v16 = *(_QWORD *)v25;
      while (2)
      {
        v17 = 0;
        v18 = v6;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v5);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17);
          v23 = v18;
          v20 = objc_msgSend(v19, "validateSinfWithError:", &v23);
          v6 = v23;

          if (!v20)
          {

            if (a3)
            {
              v6 = objc_retainAutorelease(v6);
              v21 = 0;
              *a3 = v6;
            }
            else
            {
              v21 = 0;
            }
            goto LABEL_19;
          }
          v17 = (char *)v17 + 1;
          v18 = v6;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  v21 = 1;
LABEL_19:

  return v21;
}

- (BOOL)_getMarketplaceEligibilityForWebDistribution:(BOOL)a3 isMarketplace:(BOOL)a4 operationType:(unint64_t)a5 isEligible:(BOOL *)a6 ineligibilityReason:(id *)a7 error:(id *)a8
{
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  BOOL v31;
  const __CFString *v32;
  const char *v34;
  char *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v15 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  if (v13 && !v12)
  {
    switch(a5)
    {
      case 2uLL:
        v19 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
          goto LABEL_26;
        v34 = v15;
        v20 = CFSTR("Checking eligibility for restore of web-distributed app %@");
        break;
      case 1uLL:
        v19 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
        {
LABEL_26:
          v17 = 20;
          goto LABEL_36;
        }
        v34 = v15;
        v20 = CFSTR("Checking eligibility for update of web-distributed app %@");
        break;
      case 0uLL:
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v34 = v15;
          MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", CFSTR("Checking eligibility for initial install of web-distributed app %@"));
        }
        v17 = 19;
        goto LABEL_36;
      default:
        v21 = sub_100010E50((uint64_t)"-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", 2764, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unknown validation operation %lu for %@"), v16, a5);
LABEL_51:
        v26 = (id)objc_claimAutoreleasedReturnValue(v21);
        if (a8)
          goto LABEL_41;
        goto LABEL_52;
    }
    MOLogWrite(v19, 5, "-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", v20);
    goto LABEL_26;
  }
  v18 = "marketplace-distributed app";
  if (v12)
    v18 = "marketplace";
  if (a5 == 2)
  {
    v22 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      goto LABEL_35;
    v34 = v18;
    v35 = v15;
    v23 = CFSTR("Checking eligibility for restore of %s %@");
    goto LABEL_34;
  }
  if (a5 == 1)
  {
    v22 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      goto LABEL_35;
    v34 = v18;
    v35 = v15;
    v23 = CFSTR("Checking eligibility for update of %s %@");
LABEL_34:
    MOLogWrite(v22, 5, "-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", v23);
LABEL_35:
    v17 = 3;
    goto LABEL_36;
  }
  if (a5)
  {
    v21 = sub_100010E50((uint64_t)"-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", 2791, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unknown validation operation %lu for %@"), v16, a5);
    goto LABEL_51;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v34 = v18;
    v35 = v15;
    MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", CFSTR("Checking eligibility for initial install of %s %@"));
  }
  v17 = 2;
LABEL_36:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIEligibilityManager sharedInstance](MIEligibilityManager, "sharedInstance", v34, v35));
  v36 = 0;
  v25 = objc_msgSend(v24, "getEligibilityForDomain:answer:source:status:context:error:", v17, &v40, &v39, &v38, &v37, &v36);
  v26 = v36;

  if ((v25 & 1) == 0)
  {
    v29 = sub_100010E50((uint64_t)"-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", 2797, MIInstallerErrorDomain, 4, v26, 0, CFSTR("Failed to get eligibility for %@"), v27, (uint64_t)v15);
    v30 = objc_claimAutoreleasedReturnValue(v29);

    v26 = (id)v30;
    if (a8)
    {
LABEL_41:
      v26 = objc_retainAutorelease(v26);
      v28 = 0;
      v31 = 0;
      *a8 = v26;
      goto LABEL_53;
    }
LABEL_52:
    v28 = 0;
    v31 = 0;
    goto LABEL_53;
  }
  if (v40 == 4)
  {
    v28 = 0;
    if (!a6)
      goto LABEL_47;
  }
  else
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:]", CFSTR("Eligibility check for domain %llu returned ineligible value %llu, source %llu, status %@, context %@"));
    v32 = sub_10003E4EC(v39, v38);
    v28 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (!a6)
      goto LABEL_47;
  }
  *a6 = v40 == 4;
LABEL_47:
  if (a7)
  {
    v28 = objc_retainAutorelease(v28);
    *a7 = v28;
  }
  v31 = 1;
LABEL_53:

  return v31;
}

- (BOOL)_validateiTunesMetadataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  id *v29;
  BOOL v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  BOOL v37;
  int IsThirdParty;
  int v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  unsigned int v51;
  __CFString *v52;
  uint64_t v53;
  int v54;
  id v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  char v77;
  id v78;
  id v79;
  id v80[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

  v80[0] = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iTunesMetadataWithError:", v80));
  v9 = v80[0];
  v10 = v9;
  if (v8)
  {
    v11 = v9;
    goto LABEL_3;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
  if (!objc_msgSend(v22, "isEqualToString:", NSCocoaErrorDomain))
  {

LABEL_25:
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle _validateiTunesMetadataWithError:]", CFSTR("Failed to read iTunesMetadata from %@ : %@"));
    v15 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v12 = 0;
    v25 = 0;
    goto LABEL_29;
  }
  v23 = objc_msgSend(v11, "code");

  if (v23 != (id)260)
    goto LABEL_25;

  v11 = 0;
LABEL_3:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "distributorInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "distributorID"));
  v14 = objc_msgSend(v12, "distributorType");
  v74 = v13;
  v71 = v8;
  if (!v5)
  {
    v15 = 0;
    v73 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_10;
  }
  v79 = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iTunesMetadataWithError:", &v79));
  v10 = v79;

  if (!v15)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    if (objc_msgSend(v34, "isEqualToString:", NSCocoaErrorDomain))
    {
      v69 = v4;
      v35 = v5;
      v36 = objc_msgSend(v11, "code");

      v37 = v36 == (id)260;
      v5 = v35;
      v4 = v69;
      if (v37)
      {

        v10 = 0;
        v15 = 0;
        goto LABEL_5;
      }
    }
    else
    {

    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle _validateiTunesMetadataWithError:]", CFSTR("Failed to read existing iTunesMetadata from %@ : %@"));
    v15 = 0;
    v72 = 0;
    v73 = 0;
    goto LABEL_85;
  }
LABEL_5:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distributorInfo"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "distributorID"));
  v73 = v16;
  v18 = objc_msgSend(v16, "distributorType");
  v19 = (void *)v17;
  v20 = v18;
  v11 = v10;
  v13 = v74;
LABEL_10:
  v72 = v19;
  if (v13 && !v19)
    goto LABEL_12;
  if (v13 || !v19)
  {
    if (!v13 || !v19 || (objc_msgSend(v13, "isEqualToString:") & 1) != 0 || v14 == (id)2 || v20 == (id)2)
    {
LABEL_12:
      v20 = v14;
      v24 = v12;
      v10 = v11;
LABEL_13:
      if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
      {
        v25 = v71;
LABEL_65:
        -[MIInstallable setInstalledDistributorID:](self, "setInstalledDistributorID:", v74);
        v30 = 1;
        goto LABEL_88;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));

      v67 = v24;
      v68 = v4;
      v66 = v5;
      if (v74)
        v32 = objc_msgSend(v11, "isEqualToString:", v74);
      else
        v32 = 0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "entitlements"));
      v44 = sub_10004662C(v43);

      v46 = v32;
      if (v74 && v44 && (v32 & 1) == 0 && v20 != (id)2)
      {
        v47 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2938, MIInstallerErrorDomain, 211, 0, 0, CFSTR("The marketplace \"%@\" may not be installed by the distributor ID \"%@\"."), v45, (uint64_t)v7);
        v48 = objc_claimAutoreleasedReturnValue(v47);

        v12 = v67;
        v4 = v68;
        v10 = (id)v48;
        v5 = v66;
        v29 = a3;
        v25 = v71;
        goto LABEL_86;
      }
      if (v20 == (id)-1)
        v49 = v44;
      else
        v49 = 1;
      v24 = v67;
      v4 = v68;
      if ((v49 & 1) != 0)
      {
        v25 = v71;
LABEL_64:

        v5 = v66;
        goto LABEL_65;
      }
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v62 = v11;
        v63 = v74;
        MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _validateiTunesMetadataWithError:]", CFSTR("Validating %@ distributed by %@"));
      }
      v77 = 0;
      v50 = -[MIInstallableBundle eligibilityOperationType](self, "eligibilityOperationType", v62, v63);
      v75 = v10;
      v76 = 0;
      v51 = -[MIInstallableBundle _getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:](self, "_getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:", v46, 0, v50, &v77, &v76, &v75);
      v52 = (__CFString *)v76;
      v65 = v75;

      if (v51)
      {
        if (v77)
        {

          v10 = v65;
          v25 = v71;
          goto LABEL_64;
        }
        if (v52)
        {
          v53 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v52));

          v52 = (__CFString *)v53;
        }
        else
        {
          v52 = &stru_100086E88;
        }
        v5 = v66;
        v56 = (void *)MIInstallerErrorDomain;
        v57 = "install";
        if (v50 == 1)
          v57 = "update";
        if (v50 == 2)
          v58 = "restore";
        else
          v58 = v57;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "distributorNameForCurrentLocale"));
        v60 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2960, v56, 208, 0, 0, CFSTR("This device is not eligible to %s the app \"%@\" distributed by \"%@\".%@"), v59, (uint64_t)v58);
        v10 = (id)objc_claimAutoreleasedReturnValue(v60);

      }
      else
      {
        v10 = v65;
        v5 = v66;
      }

      v12 = v67;
LABEL_85:
      v29 = a3;
      v25 = v71;
LABEL_86:

      v24 = v12;
      if (v29)
        goto LABEL_87;
      goto LABEL_21;
    }
    IsThirdParty = MIDistributorTypeIsThirdParty(v14);
    v39 = MIDistributorTypeIsThirdParty(v20);
    if (IsThirdParty && v20 == (id)1)
    {
      v41 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2907, MIInstallerErrorDomain, 199, 0, 0, CFSTR("The app being installed, \"%@\", is distributed by a third party (distributor ID \"%@\") but its existing installation is distributed by Apple (distributor ID \"%@\"). An app cannot change its distribution source from Apple to a third party once installed. Uninstall this app, then try installing it again."), v40, (uint64_t)v7);
LABEL_74:
      v10 = (id)objc_claimAutoreleasedReturnValue(v41);
      goto LABEL_85;
    }
    if (v14 == (id)1)
      v54 = v39;
    else
      v54 = 0;
    if (v54 == 1)
    {
      v41 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2910, MIInstallerErrorDomain, 199, 0, 0, CFSTR("The app being installed, \"%@\", is distributed by Apple (distributor ID \"%@\") but its existing installation is distributed by a third party (distributor ID \"%@\"). An app cannot change its distribution source from a third party to Apple once installed. Uninstall this app, then try installing it again."), v40, (uint64_t)v7);
      goto LABEL_74;
    }
    v25 = v71;
    if ((IsThirdParty & v39) == 1)
      v55 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2913, MIInstallerErrorDomain, 199, 0, 0, CFSTR("The app being installed, \"%@\", is distributed by \"%@\" but its existing installation is distributed by \"%@\". An app cannot change its third party distribution source once installed. Uninstall this app, then try installing it again."), v40, (uint64_t)v7);
    else
      v55 = sub_100010E50((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 2917, MIInstallerErrorDomain, 199, 0, 0, CFSTR("The app being installed, \"%@\", is distributed by \"%@\" but its existing installation is distributed by \"%@\". An app cannot change its distribution source once installed, except to/from TestFlight. Uninstall this app, then try installing it again."), v40, (uint64_t)v7);
    v10 = (id)objc_claimAutoreleasedReturnValue(v55);
LABEL_29:
    v29 = a3;
    goto LABEL_86;
  }
  v26 = v19;
  v24 = objc_msgSend(v73, "copy");

  v74 = v26;
  v27 = v71;
  if (!v71)
    v27 = (void *)objc_opt_new(MIStoreMetadata);
  objc_msgSend(v27, "setDistributorInfo:", v24);
  v78 = v11;
  v71 = v27;
  v28 = objc_msgSend(v4, "writeiTunesMetadata:error:", v27, &v78);
  v10 = v78;

  if ((v28 & 1) != 0)
    goto LABEL_13;
  v72 = v74;
  v29 = a3;
  v25 = v71;
  if (a3)
  {
LABEL_87:
    v10 = objc_retainAutorelease(v10);
    v30 = 0;
    *v29 = v10;
    goto LABEL_88;
  }
LABEL_21:
  v30 = 0;
LABEL_88:

  return v30;
}

- (BOOL)_setLinkageInBundleMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  id v32;
  void *v33;
  __CFString *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "linkedParentBundleID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v10 = v9;
  if (v9)
  {
    v40 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleMetadataWithError:", &v40));
    v12 = v40;
    if (!v11)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", CFSTR("Could not read previously set bundle metadata with: %@"));
        if (a4)
        {
LABEL_19:
          v25 = objc_retainAutorelease(v12);
          v28 = 0;
          *a4 = v25;
          goto LABEL_33;
        }
LABEL_16:
        v28 = 0;
LABEL_32:
        v25 = v12;
        goto LABEL_33;
      }
LABEL_18:
      if (a4)
        goto LABEL_19;
      goto LABEL_16;
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "linkedParentBundleID"));
    v14 = (void *)v13;
    if (v8)
    {
      if (v13)
      {
        if ((objc_msgSend(v8, "isEqualToString:", v13) & 1) == 0)
        {
          v37 = (void *)MIInstallerErrorDomain;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          v18 = sub_100010E50((uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", 3009, v37, 4, 0, 0, CFSTR("Existing installation of %@ is linked to %@, but the client supplied a linked parent bundle ID of %@ for the update. Changing linkage of an already installed app is not supported"), v17, (uint64_t)v16);
          v19 = objc_claimAutoreleasedReturnValue(v18);

          v12 = v15;
          goto LABEL_27;
        }
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
        v30 = objc_msgSend(v29, "isPlaceholder");

        if ((v30 & 1) == 0)
        {
          v32 = sub_100010E50((uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", 3004, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Client specified a linked parent bundle ID for an upgrade to %@ when a parent linkage was not originally specified when the app was installed. Linkage cannot be established by updating an app"), v31, (uint64_t)v8);
          v19 = objc_claimAutoreleasedReturnValue(v32);
LABEL_27:

          v12 = (id)v19;
          if (!a4)
            goto LABEL_16;
          goto LABEL_19;
        }
      }
    }
    else if (v13)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v35 = CFSTR("LinkedParentBundleID");
        v36 = (id)v13;
        MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", CFSTR("%@ not supplied in installation options; preserving existing parent bundle ID link: %@"));
      }
      v8 = v14;
    }
    else
    {
      v8 = 0;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "linkedChildBundleIDs", v35, v36));
    objc_msgSend(v6, "setLinkedChildBundleIDs:", v33);

    if (!v8)
    {
LABEL_31:
      v28 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    v12 = 0;
    if (!v8)
      goto LABEL_31;
  }
  v38 = v6;
  v20 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", -[MIInstallable installationDomain](self, "installationDomain")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  v39 = v12;
  v24 = objc_msgSend(v21, "preflightLinkingChild:toParent:error:", v23, v8, &v39);
  v25 = v39;

  if (!v24)
  {

    v12 = v25;
    a4 = v20;
    v6 = v38;
    goto LABEL_18;
  }
  v26 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v36 = v8;
    MOLogWrite(v26, 5, "-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", CFSTR("Setting linked parent app for %@ to %@"));

  }
  v6 = v38;
  objc_msgSend(v38, "setLinkedParentBundleID:", v8, v35, v36);

  v28 = 1;
LABEL_33:

  return v28;
}

- (BOOL)_setBundleMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v44 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleMetadataWithError:", &v44));
  v8 = v44;

  if (!v7)
  {
    v12 = 0;
    v15 = 0;
    goto LABEL_40;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "setInstallDate:", v9);

  v10 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  objc_opt_class(NSString);
  v11 = v10;
  v12 = 0;
  if ((objc_opt_isKindOfClass(v11) & 1) != 0)
    v12 = v11;

  if (!v12)
  {
    v16 = sub_100010E50((uint64_t)"-[MIInstallableBundle _setBundleMetadataWithError:]", 3057, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to copy build version for %@"), v13, (uint64_t)self);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    v15 = 0;
LABEL_39:

    v8 = v17;
    goto LABEL_40;
  }
  objc_msgSend(v7, "setInstallBuildVersion:", v12);
  v14 = objc_msgSend(v5, "lsInstallType");
  if (!v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));

    if (!v18)
      goto LABEL_21;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundle"));
    v43 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lsInstallTypeWithError:", &v43));
    v22 = v43;

    if (v21)
    {
      objc_msgSend(v7, "setInstallType:", objc_msgSend(v21, "unsignedIntegerValue"));
LABEL_20:

      v8 = v22;
      goto LABEL_21;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "domain"));
    if (objc_msgSend(v23, "isEqualToString:", MIInstallerErrorDomain))
    {
      v24 = objc_msgSend(v22, "code");

      if (v24 == (id)158)
      {
LABEL_19:

        v22 = 0;
        goto LABEL_20;
      }
    }
    else
    {

    }
    v25 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundle"));
      v39 = v22;
      MOLogWrite(v25, 3, "-[MIInstallableBundle _setBundleMetadataWithError:]", CFSTR("Failed to get installType from existing bundle %@ : %@"));

    }
    goto LABEL_19;
  }
  objc_msgSend(v7, "setInstallType:", v14);
LABEL_21:
  v42 = v8;
  v27 = -[MIInstallableBundle _setLinkageInBundleMetadata:error:](self, "_setLinkageInBundleMetadata:error:", v7, &v42, v37, v39);
  v28 = v42;

  if (v27)
  {
    v29 = objc_msgSend(v5, "autoInstallOverride");
    v30 = v29;
    if (v29 == (id)2)
    {
      v31 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
        goto LABEL_32;
      v32 = CFSTR("Setting override auto-install for watch app flag");
    }
    else
    {
      if (v29 != (id)1)
      {
LABEL_33:
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alternateIconName"));
        if (v8)
        {
          v33 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
            v40 = v8;
            MOLogWrite(v33, 5, "-[MIInstallableBundle _setBundleMetadataWithError:]", CFSTR("%@: Storing alternate icon name: %@"));

          }
          objc_msgSend(v7, "setAlternateIconName:", v8, v38, v40);
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
        v41 = v28;
        v15 = objc_msgSend(v35, "saveBundleMetadata:withError:", v7, &v41);
        v17 = v41;

        goto LABEL_39;
      }
      v31 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      {
LABEL_32:
        objc_msgSend(v7, "setAutoInstallOverride:", v30);
        goto LABEL_33;
      }
      v32 = CFSTR("Setting skip watch app install flag");
    }
    MOLogWrite(v31, 5, "-[MIInstallableBundle _setBundleMetadataWithError:]", v32);
    goto LABEL_32;
  }
  v15 = 0;
  v8 = v28;
LABEL_40:
  if (a3 && (v15 & 1) == 0)
    *a3 = objc_retainAutorelease(v8);

  return v15;
}

- (BOOL)_handleStashMode:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;

  if (a3 == 2)
  {
    v11 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      MOLogWrite(v11, 5, "-[MIInstallableBundle _handleStashMode:withError:]", CFSTR("%@: MIStashModePurge was specified in install options; dropping any previously stashed version while installing this version"));

    }
    v13 = 0;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v18 = 0;
    v9 = objc_msgSend(v7, "stashBundleContainerContents:error:", v8, &v18);
    v10 = v18;
  }
  else
  {
    if (a3)
    {
      v15 = sub_100010E50((uint64_t)"-[MIInstallableBundle _handleStashMode:withError:]", 3147, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Unknown stash mode specified in options: %lu"), v4, a3);
      v13 = (id)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_13;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v19 = 0;
    v9 = objc_msgSend(v7, "transferExistingStashesFromContainer:error:", v8, &v19);
    v10 = v19;
  }
  v13 = v10;

  if ((v9 & 1) != 0)
  {
LABEL_11:
    v14 = 1;
    goto LABEL_16;
  }
LABEL_13:
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a4 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (BOOL)_linkToParentApplication:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "linkedParentBundleID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", -[MIInstallable installationDomain](self, "installationDomain")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v13 = 0;
    v10 = objc_msgSend(v7, "linkChild:toParent:error:", v9, v6, &v13);
    v11 = v13;

    if (a3 && (v10 & 1) == 0)
    {
      v11 = objc_retainAutorelease(v11);
      v10 = 0;
      *a3 = v11;
    }
  }
  else
  {
    v7 = 0;
    v11 = 0;
    v10 = 1;
  }

  return v10;
}

- (BOOL)_handleStashOptionWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  BOOL v16;
  id v18;

  v5 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
  if (objc_msgSend(v8, "isPlaceholder"))
  {

LABEL_11:
    v15 = 0;
LABEL_12:
    v16 = 1;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v10 = objc_msgSend(v9, "allowsInternalSecurityPolicy");

  if (!v10)
    goto LABEL_11;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v12 = objc_msgSend(v11, "stashMode");
  if (objc_msgSend(v11, "installTargetType") == (id)3)
    v13 = 2;
  else
    v13 = (uint64_t)v12;
  v18 = 0;
  v14 = -[MIInstallableBundle _handleStashMode:withError:](self, "_handleStashMode:withError:", v13, &v18);
  v15 = v18;

  if ((v14 & 1) != 0)
    goto LABEL_12;
  if (a3)
  {
    v15 = objc_retainAutorelease(v15);
    v16 = 0;
    *a3 = v15;
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (BOOL)_preserveExistingPlaceholderAsParallelPlaceholderWithError:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  id v38;
  id v39;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hasParallelPlaceholder");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
    v9 = objc_msgSend(v8, "isPlaceholder");

    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      v10 = (void *)MIInstallerErrorDomain;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = MIStringForInstallationDomain(-[MIInstallable installationDomain](self, "installationDomain"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = sub_100010E50((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", 3234, v10, 190, 0, 0, CFSTR("Existing installed bundle for %@ in %@ was not a placeholder or did not have a parallel placeholder."), v15, (uint64_t)v12);
      goto LABEL_6;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parallelPlaceholderURL"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    if (v7)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parallelPlaceholderURL"));
      v39 = 0;
      v26 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v25, v21, &v39);
      v20 = v39;

      if ((v26 & 1) == 0)
      {
        v28 = (void *)MIInstallerErrorDomain;
        v29 = CFSTR("Could not copy existing parallel placeholder to new bundle container.");
        v30 = 3244;
        goto LABEL_14;
      }
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleURL"));
      v38 = 0;
      v33 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v32, v21, &v38);
      v20 = v38;

      if ((v33 & 1) == 0)
      {
        v28 = (void *)MIInstallerErrorDomain;
        v29 = CFSTR("Could not copy existing placeholder to parallel placeholder.");
        v30 = 3249;
LABEL_14:
        v34 = sub_100010E50((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", v30, v28, 4, v20, 0, v29, v27, v37);
        v35 = objc_claimAutoreleasedReturnValue(v34);

        v20 = (id)v35;
        if (a3)
          goto LABEL_7;
LABEL_15:
        v22 = 0;
        goto LABEL_16;
      }
    }
    v22 = 1;
    goto LABEL_16;
  }
  v17 = (void *)MIInstallerErrorDomain;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v18 = MIStringForInstallationDomain(-[MIInstallable installationDomain](self, "installationDomain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v16 = sub_100010E50((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", 3227, v17, 190, 0, 0, CFSTR("Did not find existing bundle container for %@ in %@ from which to preserve placeholder."), v19, (uint64_t)v12);
LABEL_6:
  v20 = (id)objc_claimAutoreleasedReturnValue(v16);

  v21 = 0;
  if (!a3)
    goto LABEL_15;
LABEL_7:
  v20 = objc_retainAutorelease(v20);
  v22 = 0;
  *a3 = v20;
LABEL_16:

  return v22;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  void *v32;
  unsigned int v33;
  unsigned __int8 v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)MIInstallableBundle;
  if (!-[MIInstallable performInstallationWithError:](&v55, "performInstallationWithError:"))
  {
    v17 = 0;
    if (!a3)
      goto LABEL_22;
    goto LABEL_20;
  }
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v5)[2](v5, CFSTR("CreatingContainer"), 50);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v7 = objc_msgSend(v6, "bundleType");

  if (v7 <= 5 && ((1 << v7) & 0x36) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v54 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer tempAppBundleContainerWithIdentifier:inDomain:withError:](MIBundleContainer, "tempAppBundleContainerWithIdentifier:inDomain:withError:", v9, -[MIInstallable installationDomain](self, "installationDomain"), &v54));
    v11 = v54;
    -[MIInstallableBundle setBundleContainer:](self, "setBundleContainer:", v10);

  }
  else
  {
    v42 = (void *)MIInstallerErrorDomain;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v43 = objc_msgSend(v8, "bundleType");
    v45 = sub_100010E50((uint64_t)"-[MIInstallableBundle performInstallationWithError:]", 3296, v42, 4, 0, 0, CFSTR("Don't know how to create bundle container for installable type %d"), v44, v43);
    v11 = (id)objc_claimAutoreleasedReturnValue(v45);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  if (!v12)
  {
    v36 = (void *)MIInstallerErrorDomain;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
    v40 = sub_100010E50((uint64_t)"-[MIInstallableBundle performInstallationWithError:]", 3301, v36, 21, v11, &off_100090040, CFSTR("Failed to create container for %@"), v39, (uint64_t)v38);
    v17 = (id)objc_claimAutoreleasedReturnValue(v40);

    goto LABEL_19;
  }
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v13)[2](v13, CFSTR("InstallingApplication"), 60);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v53 = v11;
  v16 = objc_msgSend(v14, "captureBundleByMoving:withError:", v15, &v53);
  v17 = v53;

  if (!v16)
    goto LABEL_19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v52 = v17;
  v22 = -[MIInstallableBundle _captureDataFromStagingRootOrBundle:toContainer:withError:](self, "_captureDataFromStagingRootOrBundle:toContainer:withError:", v20, v21, &v52);
  v23 = v52;

  if (!v22)
    goto LABEL_21;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v51 = v23;
  v27 = -[MIInstallableBundle _writeOptionsDataToBundle:orContainer:error:](self, "_writeOptionsDataToBundle:orContainer:error:", v25, v26, &v51);
  v17 = v51;

  if (!v27)
    goto LABEL_19;
  v50 = v17;
  v28 = -[MIInstallableBundle _validateiTunesMetadataWithError:](self, "_validateiTunesMetadataWithError:", &v50);
  v23 = v50;

  if (!v28)
    goto LABEL_21;
  v49 = v23;
  v29 = -[MIInstallableBundle _setBundleMetadataWithError:](self, "_setBundleMetadataWithError:", &v49);
  v17 = v49;

  if (!v29)
    goto LABEL_19;
  v48 = v17;
  v30 = -[MIInstallableBundle _validateSinfsWithError:](self, "_validateSinfsWithError:", &v48);
  v23 = v48;

  if (!v30)
    goto LABEL_21;
  v47 = v23;
  v31 = -[MIInstallableBundle _handleStashOptionWithError:](self, "_handleStashOptionWithError:", &v47);
  v17 = v47;

  if (!v31)
  {
LABEL_19:
    if (!a3)
    {
LABEL_22:
      v35 = 0;
      goto LABEL_23;
    }
LABEL_20:
    v17 = objc_retainAutorelease(v17);
    v35 = 0;
    *a3 = v17;
    goto LABEL_23;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v33 = objc_msgSend(v32, "preservePlaceholderAsParallel");

  if (!v33)
  {
    v35 = 1;
    goto LABEL_23;
  }
  v46 = v17;
  v34 = -[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:](self, "_preserveExistingPlaceholderAsParallelPlaceholderWithError:", &v46);
  v23 = v46;

  if ((v34 & 1) == 0)
  {
LABEL_21:
    v17 = v23;
    if (!a3)
      goto LABEL_22;
    goto LABEL_20;
  }
  v35 = 1;
  v17 = v23;
LABEL_23:

  return v35;
}

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  unsigned int v12;
  unsigned __int8 v13;
  id v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v30;
  id v31;
  id *v32;
  id obj;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v5 = objc_opt_new(NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v34)
  {
    v32 = a3;
    v6 = 0;
    v35 = *(_QWORD *)v40;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v35)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      v10 = objc_msgSend(v9, "isPlaceholder");

      if ((v10 & 1) != 0)
      {
        v11 = v6;
      }
      else
      {
        v38 = v6;
        v12 = objc_msgSend(v8, "makeExecutableWithError:", &v38);
        v11 = v38;

        if (!v12)
          goto LABEL_22;
      }
      v37 = 0;
      v13 = objc_msgSend(v8, "updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:", 1, &v37);
      v14 = v37;
      if ((v13 & 1) == 0)
        break;
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personaUniqueString"));
      v36 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v17, 0, 0, &v36));
      v6 = v36;

      if (!v18)
      {
        v26 = (void *)MIInstallerErrorDomain;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v28 = sub_100010E50((uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]", 3396, v26, 21, v6, &off_100090068, CFSTR("Failed to create plugin data container for plugin %@"), v27, (uint64_t)v22);
        v25 = objc_claimAutoreleasedReturnValue(v28);
        v11 = v6;
        v5 = v15;
LABEL_21:

        v11 = (id)v25;
LABEL_22:

        if (v32)
        {
          v11 = objc_retainAutorelease(v11);
          v19 = 0;
          *v32 = v11;
        }
        else
        {
          v19 = 0;
        }
        goto LABEL_25;
      }
      v5 = v15;
      -[NSMutableArray addObject:](v15, "addObject:", v18);

      if (v34 == (id)++v7)
      {
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v34)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    v20 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v31 = v14;
      MOLogWrite(v20, 3, "-[MIInstallableBundle _postFlightAppExtensionsWithError:]", CFSTR("Failed to update container manager with code signing info for %@ : %@"));

    }
    v21 = (void *)MIInstallerErrorDomain;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", v30, v31));
    objc_msgSend(v8, "isPlaceholder");
    v24 = sub_100010E50((uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]", 3389, v21, 110, v14, 0, CFSTR("Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c"), v23, (uint64_t)v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_21;
  }
  v6 = 0;
LABEL_15:

  -[MIInstallableBundle setAppExtensionDataContainers:](self, "setAppExtensionDataContainers:", v5);
  v19 = 1;
  v11 = v6;
LABEL_25:

  return v19;
}

- (BOOL)_setLaunchWarningDataWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  uint64_t v13;
  id v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchWarningData"));
    v14 = 0;
    v9 = objc_msgSend(v7, "setLaunchWarningData:withError:", v8, &v14);
    v10 = v14;

    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v11 = sub_100010E50((uint64_t)"-[MIInstallableBundle _setLaunchWarningDataWithError:]", 3423, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unexpectedly missing bundle signing information"), v5, v13);
    v10 = (id)objc_claimAutoreleasedReturnValue(v11);
    v9 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if ((v9 & 1) == 0)
    *a3 = objc_retainAutorelease(v10);
LABEL_7:

  return v9;
}

- (BOOL)postFlightInstallationWithError:(id *)a3
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  BOOL v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  unsigned __int8 v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v5)[2](v5, CFSTR("PostflightingApplication"), 70);

  v52.receiver = self;
  v52.super_class = (Class)MIInstallableBundle;
  if (!-[MIInstallable postFlightInstallationWithError:](&v52, "postFlightInstallationWithError:", a3))
  {
    v12 = 0;
    goto LABEL_33;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v7 = objc_msgSend(v6, "needsDataContainer");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaUniqueString"));
    v51 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v10, 0, 0, &v51));
    v12 = v51;

    if (!v11)
      goto LABEL_33;
    -[MIInstallableBundle setDataContainer:](self, "setDataContainer:", v11);

  }
  else
  {
    v12 = 0;
  }
  v13 = v12;
  v50 = v12;
  v14 = -[MIInstallableBundle _postFlightAppExtensionsWithError:](self, "_postFlightAppExtensionsWithError:", &v50);
  v12 = v50;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v16 = objc_msgSend(v15, "isPlaceholder");

    if ((v16 & 1) != 0)
    {
LABEL_9:
      v17 = 1;
      goto LABEL_36;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v49 = v12;
    v19 = objc_msgSend(v18, "makeExecutableWithError:", &v49);
    v20 = v49;

    if (!v19)
      goto LABEL_32;
    if (-[MIInstallableBundle xpcServiceBundlesEnabled](self, "xpcServiceBundlesEnabled"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v46;
LABEL_14:
        v25 = 0;
        v26 = v20;
        while (1)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v25);
          v44 = v26;
          v28 = objc_msgSend(v27, "makeExecutableWithError:", &v44);
          v20 = v44;

          if (!v28)
            goto LABEL_31;
          v25 = (char *)v25 + 1;
          v26 = v20;
          if (v23 == v25)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            if (v23)
              goto LABEL_14;
            break;
          }
        }
      }

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));
    v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v41;
LABEL_23:
      v32 = 0;
      v33 = v20;
      while (1)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v21);
        v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v32);
        v39 = v33;
        v35 = objc_msgSend(v34, "makeExecutableWithError:", &v39);
        v20 = v39;

        if (!v35)
          break;
        v32 = (char *)v32 + 1;
        v33 = v20;
        if (v30 == v32)
        {
          v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v30)
            goto LABEL_23;
          goto LABEL_29;
        }
      }
LABEL_31:

LABEL_32:
      v12 = v20;
      goto LABEL_33;
    }
LABEL_29:

    v38 = v20;
    v36 = -[MIInstallableBundle _setLaunchWarningDataWithError:](self, "_setLaunchWarningDataWithError:", &v38);
    v12 = v38;

    if ((v36 & 1) != 0)
      goto LABEL_9;
  }
LABEL_33:
  if (a3)
  {
    v12 = objc_retainAutorelease(v12);
    v17 = 0;
    *a3 = v12;
  }
  else
  {
    v17 = 0;
  }
LABEL_36:

  return v17;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  id v16;

  v6 = a3;
  if (!-[MIInstallable shouldModifyExistingContainers](self, "shouldModifyExistingContainers")
    || objc_msgSend(v6, "status") != (id)1)
  {
    v9 = 0;
LABEL_8:
    v13 = 1;
    goto LABEL_9;
  }
  v16 = 0;
  v7 = objc_msgSend(v6, "regenerateDirectoryUUIDWithError:", &v16);
  v8 = v16;
  v9 = v8;
  if (v7)
  {
    v10 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      MOLogWrite(v10, 5, "-[MIInstallableBundle _refreshUUIDForContainer:withError:]", CFSTR("Data container for %@ is now at %@"));

    }
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v8);
    v13 = 0;
    *a4 = v9;
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (unint64_t)_installationJournalOperationType
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  if ((id)-[MIInstallable installOperationType](self, "installOperationType") == (id)1)
    return 5;
  if (!-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundle")),
        v7 = objc_msgSend(v6, "isPlaceholder"),
        v6,
        (v7 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
    v9 = objc_msgSend(v8, "installTargetType");

    if (v9 == (id)3)
      v3 = 4;
    else
      v3 = 3;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

- (id)_noLongerPresentAppExtensionDataContainers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  MIInstallableBundle *v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundle"));

  v46 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appExtensionBundlesWithError:", &v46));
  v6 = v46;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "identifier"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v10);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v5;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v14)
    {
      v15 = v14;
      v32 = v5;
      v33 = v4;
      v16 = *(_QWORD *)v39;
      do
      {
        v17 = 0;
        v18 = v6;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier", v30, v31));
          v21 = objc_msgSend(v7, "containsObject:", v20);

          if ((v21 & 1) != 0)
          {
            v6 = v18;
          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](v35, "identity"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "personaUniqueString"));
            v37 = v18;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 0, v23, 0, 0, &v37));
            v25 = v37;

            v26 = qword_10009E048;
            if (v24)
            {
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
                MOLogWrite(v26, 5, "-[MIInstallableBundle _noLongerPresentAppExtensionDataContainers]", CFSTR("App no longer needs data container for appex with id %@; removing it"));

              }
              objc_msgSend(v34, "addObject:", v24, v30);
            }
            else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
              v31 = v25;
              MOLogWrite(v26, 3, "-[MIInstallableBundle _noLongerPresentAppExtensionDataContainers]", CFSTR("Failed to fetch data container for no longer present app extension with id %@ : %@"));

            }
            v6 = v25;
            v18 = v25;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v15);
      v5 = v32;
      v4 = v33;
    }
    goto LABEL_31;
  }
  v27 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v31 = v6;
    obj = v30;
    MOLogWrite(v27, 3, "-[MIInstallableBundle _noLongerPresentAppExtensionDataContainers]", CFSTR("Failed to discover bundle identifiers of app extension bundles in previously installed app at %@ : %@"));
LABEL_31:

  }
  v28 = objc_msgSend(v34, "copy", v30, v31);

  return v28;
}

- (id)_createJournalEntry
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  MIInstallationJournalEntry *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  MIInstallationJournalEntry *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  if (v4 && !-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _noLongerPresentAppExtensionDataContainers](self, "_noLongerPresentAppExtensionDataContainers"));
  else
    v5 = 0;
  v6 = -[MIInstallableBundle _installationJournalOperationType](self, "_installationJournalOperationType");
  v7 = [MIInstallationJournalEntry alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleContainer](self, "bundleContainer"));
  v10 = -[MIInstallable installationDomain](self, "installationDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle bundleSigningInfo](self, "bundleSigningInfo"));
  v12 = -[MIInstallationJournalEntry initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:](v7, "initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:", v8, v9, v4, v10, v6, v3, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  -[MIInstallationJournalEntry setProgressBlock:](v12, "setProgressBlock:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "linkedParentBundleID"));
  -[MIInstallationJournalEntry setLinkToParentBundleID:](v12, "setLinkToParentBundleID:", v14);

  -[MIInstallationJournalEntry setNoLongerPresentAppExtensionDataContainers:](v12, "setNoLongerPresentAppExtensionDataContainers:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle dataContainer](self, "dataContainer"));
  -[MIInstallationJournalEntry setDataContainer:](v12, "setDataContainer:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  v17 = objc_msgSend(v16, "copy");
  -[MIInstallationJournalEntry setAppExtensionBundles:](v12, "setAppExtensionBundles:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionDataContainers](self, "appExtensionDataContainers"));
  v19 = objc_msgSend(v18, "copy");
  -[MIInstallationJournalEntry setAppExtensionDataContainers:](v12, "setAppExtensionDataContainers:", v19);

  return v12;
}

- (BOOL)finalizeInstallationWithError:(id *)a3
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  BOOL v12;
  id v14;
  objc_super v15;
  id v16;

  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v5)[2](v5, CFSTR("SandboxingApplication"), 80);

  v15.receiver = self;
  v15.super_class = (Class)MIInstallableBundle;
  v16 = 0;
  v6 = -[MIInstallable finalizeInstallationWithError:](&v15, "finalizeInstallationWithError:", &v16);
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _createJournalEntry](self, "_createJournalEntry"));
    v14 = v8;
    v10 = objc_msgSend(v9, "finalizeContainersWithError:", &v14);
    v11 = v14;

    if (v10)
    {
      -[MIInstallableBundle setJournalEntry:](self, "setJournalEntry:", v9);
      v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    v11 = v7;
  }
  if (a3)
  {
    v11 = objc_retainAutorelease(v11);
    v12 = 0;
    *a3 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4
{
  unsigned int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v20;
  id v21;
  id v22;
  objc_super v23;
  id v24;
  id v25;

  v24 = 0;
  v25 = 0;
  v23.receiver = self;
  v23.super_class = (Class)MIInstallableBundle;
  v7 = -[MIInstallable stageBackgroundUpdate:withError:](&v23, "stageBackgroundUpdate:withError:", &v25, &v24);
  v8 = v25;
  v9 = v24;
  v10 = v9;
  if (!v7)
  {
    v11 = 0;
    v13 = v9;
    if (!a4)
    {
LABEL_15:
      v15 = 0;
      goto LABEL_17;
    }
LABEL_6:
    v13 = objc_retainAutorelease(v13);
    v15 = 0;
    *a4 = v13;
    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _createJournalEntry](self, "_createJournalEntry"));
  v22 = v10;
  v12 = objc_msgSend(v11, "stageUpdateForLater:", &v22);
  v13 = v22;

  if ((v12 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v20 = v11;
      MOLogWrite(qword_10009E048, 5, "-[MIInstallableBundle stageBackgroundUpdate:withError:]", CFSTR("Failed to stage journal for later. Purging the journal entry %@"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](MIJournal, "sharedInstance", v20));
    v21 = 0;
    v17 = objc_msgSend(v16, "purgeJournalEntry:withError:", v11, &v21);
    v18 = v21;

    if ((v17 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
      MOLogWrite(qword_10009E048, 3, "-[MIInstallableBundle stageBackgroundUpdate:withError:]", CFSTR("Failed to purge journal entry %@ : %@"));

    if (!a4)
      goto LABEL_15;
    goto LABEL_6;
  }
  -[MIInstallableBundle setJournalEntry:](self, "setJournalEntry:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));

  if (a3)
  {
    v8 = objc_retainAutorelease(v14);
    *a3 = v8;
    v15 = 1;
  }
  else
  {
    v15 = 1;
    v8 = v14;
  }
LABEL_17:

  return v15;
}

- (id)launchServicesBundleRecordsWithError:(id *)a3
{
  NSMutableArray *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v5 = objc_opt_new(NSMutableArray);
  v12.receiver = self;
  v12.super_class = (Class)MIInstallableBundle;
  v6 = -[MIInstallable launchServicesBundleRecordsWithError:](&v12, "launchServicesBundleRecordsWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleRecordsToRegister"));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);

    v10 = -[NSMutableArray copy](v5, "copy");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle journalEntry](self, "journalEntry"));
  LOBYTE(a3) = objc_msgSend(v4, "performLaunchServicesRegistrationWithError:", a3);

  return (char)a3;
}

- (BOOL)isPlaceholderInstall
{
  return self->_isPlaceholderInstall;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bundleContainer, a3);
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainer, a3);
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
  objc_storeStrong((id *)&self->_appExtensionBundles, a3);
}

- (NSArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
  objc_storeStrong((id *)&self->_appExtensionDataContainers, a3);
}

- (NSArray)frameworkBundles
{
  return self->_frameworkBundles;
}

- (void)setFrameworkBundles:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkBundles, a3);
}

- (NSArray)xpcServiceBundles
{
  return self->_xpcServiceBundles;
}

- (void)setXpcServiceBundles:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServiceBundles, a3);
}

- (NSArray)driverKitExtensionBundles
{
  return self->_driverKitExtensionBundles;
}

- (void)setDriverKitExtensionBundles:(id)a3
{
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, a3);
}

- (NSURL)upgradingBuiltInAppAtURL
{
  return self->_upgradingBuiltInAppAtURL;
}

- (void)setUpgradingBuiltInAppAtURL:(id)a3
{
  objc_storeStrong((id *)&self->_upgradingBuiltInAppAtURL, a3);
}

- (NSMutableDictionary)identifiersMap
{
  return self->_identifiersMap;
}

- (void)setIdentifiersMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersMap, a3);
}

- (BOOL)xpcServiceBundlesEnabled
{
  return self->_xpcServiceBundlesEnabled;
}

- (void)setXpcServiceBundlesEnabled:(BOOL)a3
{
  self->_xpcServiceBundlesEnabled = a3;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (void)setBundleSigningInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSigningInfo, a3);
}

- (MIInstallationJournalEntry)journalEntry
{
  return self->_journalEntry;
}

- (void)setJournalEntry:(id)a3
{
  objc_storeStrong((id *)&self->_journalEntry, a3);
}

- (MIEmbeddedWatchBundle)embeddedWatchApp
{
  return self->_embeddedWatchApp;
}

- (void)setEmbeddedWatchApp:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedWatchApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedWatchApp, 0);
  objc_storeStrong((id *)&self->_journalEntry, 0);
  objc_storeStrong((id *)&self->_bundleSigningInfo, 0);
  objc_storeStrong((id *)&self->_identifiersMap, 0);
  objc_storeStrong((id *)&self->_upgradingBuiltInAppAtURL, 0);
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, 0);
  objc_storeStrong((id *)&self->_xpcServiceBundles, 0);
  objc_storeStrong((id *)&self->_frameworkBundles, 0);
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
}

@end
