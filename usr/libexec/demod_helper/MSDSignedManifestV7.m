@implementation MSDSignedManifestV7

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3;
  MSDSignedManifestV7 *v4;

  v3 = a3;
  v4 = -[MSDSignedManifestV7 initWithManifestData:]([MSDSignedManifestV7 alloc], "initWithManifestData:", v3);

  return v4;
}

- (MSDSignedManifestV7)initWithManifestData:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  MSDSignedManifestV7 *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MSDSignedManifestV7 *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  NSObject *v89;
  id v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  id v135;
  void *v136;
  void *v137;
  NSMutableDictionary *v138;
  void *v139;
  void *v140;
  objc_super v141;
  uint8_t buf[4];
  const char *v143;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v141.receiver = self;
  v141.super_class = (Class)MSDSignedManifestV7;
  v6 = -[MSDSignedManifestV7 init](&v141, "init");
  if (!v6)
  {
    v7 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Info")));
  if (!v7 || (v8 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    v43 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000287A0(v9, v44, v45, v46, v47, v48, v49, v50);
    goto LABEL_95;
  }
  if (+[MSDPlatform iOSHub](MSDPlatform, "iOSHub"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Product")));
    if (!v9 || (v10 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
    {
      v69 = sub_100024A40();
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        sub_100028810(v70, v71, v72, v73, v74, v75, v76, v77);

      goto LABEL_95;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    objc_msgSend(v11, "setPlatformWithManifestProductList:", v9);

    v12 = NSClassFromString(CFSTR("MSDHubTestConfiguration"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v12, "sharedInstance"));
      if ((objc_opt_respondsToSelector(v13, "shouldRunManifestRigorousTest") & 1) != 0
        && (objc_msgSend(v13, "shouldRunManifestRigorousTest") & 1) == 0)
      {
        v18 = sub_100024A40();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v143 = "-[MSDSignedManifestV7 initWithManifestData:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s - Will not run rigorous testing on iOS hub.", buf, 0xCu);
        }

        v14 = &__kCFBooleanFalse;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));

  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](MSDDemoManifestCheck, "sharedInstance"));
    -[MSDSignedManifest setManifestVerifier:](v6, "setManifestVerifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
    if (!v22)
    {
      v126 = sub_100024A40();
      v9 = objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100028880(v9, v127, v128, v129, v130, v131, v132, v133);
LABEL_95:
      v15 = 0;
      v16 = 0;
      goto LABEL_96;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Version")));
  if (v14)
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, CFSTR("RigorousTestingOverride"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](v6, "getDataSectionKeys"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "verifyManifestSignature:forDataSectionKeys:withOptions:", v4, v24, v5));

  if (v9)
  {
    v25 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v25) & 1) != 0)
    {
      v140 = v16;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("InstallationOrder")));
      if (v26 && (v27 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v26, v27) & 1) != 0))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("CriticalComponents")));
        v139 = v28;
        if (v28)
          v29 = (char *)objc_msgSend(v28, "count");
        else
          v29 = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("Components")));
        v31 = v30;
        if (v30)
          v29 = &v29[(_QWORD)objc_msgSend(v30, "count")];
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("BackupData")));
        if (v32)
        {
          v33 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
          {
            v137 = v31;
            v138 = v5;
            v34 = (char *)objc_msgSend(v32, "count");
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("Apps")));
            v136 = v32;
            if (v15)
            {
              v35 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v15, v35) & 1) == 0)
              {
                v90 = sub_100024A40();
                v91 = objc_claimAutoreleasedReturnValue(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  sub_100028BE4(v91, v92, v93, v94, v95, v96, v97, v98);

                goto LABEL_87;
              }
              v34 = &v34[(_QWORD)objc_msgSend(v15, "count")];
            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("SystemApps")));
            if (v36)
            {
              v37 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v36, v37) & 1) == 0)
              {
                v99 = sub_100024A40();
                v100 = objc_claimAutoreleasedReturnValue(v99);
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                  sub_100028B74(v100, v101, v102, v103, v104, v105, v106, v107);

LABEL_86:
LABEL_87:
                v17 = 0;
LABEL_92:
                v5 = v138;
                goto LABEL_52;
              }
              if (objc_msgSend(v36, "count"))
                ++v34;
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("Packages")));
            v135 = v4;
            if (!v38)
              goto LABEL_45;
            v39 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
            {
              v34 = &v34[(_QWORD)objc_msgSend(v38, "count")];
LABEL_45:
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("ConfigurationProfiles")));
              if (v40)
              {
                v41 = objc_opt_class(NSDictionary);
                if ((objc_opt_isKindOfClass(v40, v41) & 1) == 0)
                {
                  v117 = sub_100024A40();
                  v118 = objc_claimAutoreleasedReturnValue(v117);
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    sub_100028A94(v118, v119, v120, v121, v122, v123, v124, v125);

LABEL_91:
                  v17 = 0;
                  v4 = v135;
                  goto LABEL_92;
                }
                v34 = &v34[(_QWORD)objc_msgSend(v40, "count")];
              }
              if (v29 == v34)
              {
                -[MSDSignedManifest setSigningKey:](v6, "setSigningKey:", CFSTR("MultipleContentSignings"));
                -[MSDSignedManifest setPayload:](v6, "setPayload:", v9);
                v5 = v138;
                if (-[MSDSignedManifestV7 checkPlatformTypeForAllComponents](v6, "checkPlatformTypeForAllComponents"))
                {
                  -[MSDSignedManifestV7 parseNonContainerizedContentRootSet](v6, "parseNonContainerizedContentRootSet");
                  -[MSDSignedManifest parseInstallationOrder](v6, "parseInstallationOrder");
                  -[MSDSignedManifest parseBundleID:](v6, "parseBundleID:", v7);
                  -[MSDSignedManifestV7 parseLocaleCode](v6, "parseLocaleCode");
                  +[MSDSignedManifest setSignedManifest:](MSDSignedManifest, "setSignedManifest:", v6);
                  v17 = v6;

                }
                else
                {
                  v88 = sub_100024A40();
                  v89 = objc_claimAutoreleasedReturnValue(v88);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                    sub_1000289D0(v89);

                  v17 = 0;
                }
                v4 = v135;
                goto LABEL_52;
              }
              v87 = sub_100024A40();
              v134 = objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                sub_100028A10((uint64_t)v29, (uint64_t)v34, v134);

              goto LABEL_91;
            }
            v108 = sub_100024A40();
            v109 = objc_claimAutoreleasedReturnValue(v108);
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              sub_100028B04(v109, v110, v111, v112, v113, v114, v115, v116);

            goto LABEL_86;
          }
        }
        v60 = sub_100024A40();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          sub_100028960(v61, v62, v63, v64, v65, v66, v67, v68);

      }
      else
      {
        v51 = sub_100024A40();
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          sub_1000288F0(v52, v53, v54, v55, v56, v57, v58, v59);

      }
      v15 = 0;
      v17 = 0;
LABEL_52:
      v16 = v140;
LABEL_53:

      goto LABEL_54;
    }
    v78 = sub_100024A40();
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      sub_100028C54(v79, v80, v81, v82, v83, v84, v85, v86);

    v15 = 0;
LABEL_96:
    v17 = 0;
    goto LABEL_53;
  }
  v15 = 0;
LABEL_12:
  v17 = 0;
LABEL_54:

  return v17;
}

- (BOOL)isItemBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/BackupData/"));
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/BackupData/baseBackup"));
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/BackupData/systemContainer"));
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/BackupData/provisioningProfile."));
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/BackupData/configurationProfile"));
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("criticalSystemPreferences"));
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/SystemApps"));
}

- (BOOL)isItemApp:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/Apps/"));
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/Packages/"));
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:](self, "getSettingsFromSection:forIdentifier:", CFSTR("BackupData"), a3));
  v4 = v3 != 0;

  return v4;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[MSDSignedManifestV7 isItemApp:](self, "isItemApp:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("/Apps/"), "length")));
  else
    v5 = 0;

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[MSDSignedManifestV7 isItemStandAlonePackage:](self, "isItemStandAlonePackage:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("/Packages/"), "length")));
  else
    v5 = 0;

  return v5;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("/ConfigurationProfiles/"));
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[MSDSignedManifestV7 isItemConfigurationProfile:](self, "isItemConfigurationProfile:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("/ConfigurationProfiles/"), "length")));
  else
    v5 = 0;

  return v5;
}

- (id)getLocaleCode
{
  return -[MSDSignedManifestV7 localeCodeStr](self, "localeCodeStr");
}

- (id)getBackupList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("BackupData")));

  return v3;
}

- (id)getAppDependecies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Apps")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Dependencies")));

  return v9;
}

- (id)getSystemAppDependecies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SystemApps")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Dependencies")));

  return v9;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Info")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("AppPrivacyPermissions")));
  return v9;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSystemAppDataList](self, "getSystemAppDataList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Manifest")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Info")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppPrivacyPermissions")));

  return v9;
}

- (int64_t)getAppType:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v6 = objc_msgSend(v5, "macOS");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Apps")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Manifest")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Info")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("AppType")));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Info")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("AppType")));

        v16 = (int64_t)objc_msgSend(v15, "unsignedIntegerValue");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 2;
  }

  return v16;
}

- (id)getAppFileSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Apps")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Info")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Size")));
  return v10;
}

- (id)getAppRealSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  NSObject *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Apps")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Info")));

  if (!v9)
  {
    v14 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100028CC4();
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RealSize")));
  if (!v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Size")));
    v12 = v11;
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2 * (_QWORD)-[NSObject unsignedLongLongValue](v11, "unsignedLongLongValue")));
LABEL_5:

      goto LABEL_6;
    }
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100028D30();

LABEL_12:
    v10 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (id)getStandAlonePackageFileSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Packages")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Info")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Size")));
  return v10;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  NSObject *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Packages")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Info")));

  if (!v9)
  {
    v14 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100028D9C();
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("RealSize")));
  if (!v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Size")));
    v12 = v11;
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2 * (_QWORD)-[NSObject unsignedLongLongValue](v11, "unsignedLongLongValue")));
LABEL_5:

      goto LABEL_6;
    }
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100028E08();

LABEL_12:
    v10 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getManifestDataFromSection:forIdentifier:](self, "getManifestDataFromSection:forIdentifier:", v6, v7));
  v9 = v8;
  if (v8)
  {
    v27 = v7;
    v28 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v17 = objc_autoreleasePoolPush();
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v16));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("MSDManifestFileAttributes")));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileType"));
            v21 = objc_msgSend(v20, "isEqualToString:", NSFileTypeRegular);

            if (v21)
              v13 += (uint64_t)objc_msgSend(v19, "fileSize");
          }

          objc_autoreleasePoolPop(v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13));
    v7 = v27;
    v6 = v28;
    v9 = v26;
  }
  else
  {
    v24 = sub_100024A40();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100028E74();

    v22 = 0;
  }

  return v22;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  NSRange v27;

  length = a3.length;
  location = a3.location;
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27.location = location;
    v27.length = length;
    v8 = NSStringFromRange(v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Merging manifest item %{public}@", buf, 0xCu);

  }
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  if (location < location + length)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", location));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("/BackupData/"), "length")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getBackupList](self, "getBackupList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("Manifest")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Data")));

      if (-[MSDSignedManifestV7 isItemSystemContainerBackup:](self, "isItemSystemContainerBackup:", v12))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
        v18 = objc_msgSend(v17, "watchOS");

        v19 = sub_100024A40();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (!v18)
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "System container backup only allowed on Watch devices.", buf, 2u);
          }

          goto LABEL_13;
        }
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "System container backup found. Start restoring UUID paths...", buf, 2u);
        }

        v22 = objc_claimAutoreleasedReturnValue(+[NSString restoreSystemContainerUUIDPathsInDict:](NSString, "restoreSystemContainerUUIDPathsInDict:", v16));
        v16 = (void *)v22;
      }
      objc_msgSend(v24, "addEntriesFromDictionary:", v16);
LABEL_13:

      ++location;
      --length;
    }
    while (length);
  }

  return v24;
}

- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  unsigned int v18;

  length = a3.length;
  location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion") < 5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v7 = objc_msgSend(v6, "watchOS");

  if (!v7)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  v9 = v8;
  v10 = location + length;
  if (location >= location + length)
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", location));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/BackupData/systemContainer"));

    if ((v12 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = location + 1;
      v15 = length - 1;
      do
      {
        v16 = v14;
        if (!v15)
          break;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v14));
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/BackupData/systemContainer"));

        v14 = v16 + 1;
        --v15;
      }
      while (!v18);
      v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)getComponentVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v15 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100028EEC();
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Info")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("CFBundleShortVersionString")));
  v10 = sub_100024A40();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100028F58();

LABEL_12:
    v13 = 0;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[MSDSignedManifestV7 getComponentVersion:]";
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s - appName:%{public}@ componentVersion:%{public}@", (uint8_t *)&v16, 0x20u);
  }

  v13 = v9;
  v8 = v13;
LABEL_6:

  return v13;
}

- (id)getAppManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Info")));

  return v8;
}

- (id)getBackupSectionName
{
  return CFSTR("BackupData");
}

- (id)getStandAlonePackageVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getStandAlonePackageList](self, "getStandAlonePackageList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v15 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100028FC4();
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Info")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("Version")));
  v10 = sub_100024A40();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100029030();

LABEL_12:
    v13 = 0;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[MSDSignedManifestV7 getStandAlonePackageVersion:]";
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s - pkgName:%{public}@ pkgVersion:%{public}@", (uint8_t *)&v16, 0x20u);
  }

  v13 = v9;
  v8 = v13;
LABEL_6:

  return v13;
}

- (id)getStandAlonePackageList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Packages")));

  return v3;
}

- (id)getAppList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Apps")));

  return v3;
}

- (id)getInstallationOrderAppsPrefix
{
  return CFSTR("/Apps/");
}

- (id)getInstallationOrderSystemApps
{
  return CFSTR("/SystemApps");
}

- (BOOL)checkPlatformTypeForAllComponents
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  id v32;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  MSDSignedManifestV7 *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];

  if (+[MSDPlatform iOSHub](MSDPlatform, "iOSHub"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformType"));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &APFSContainerGetSpaceInfo_ptr;
    v9 = *(_QWORD *)v48;
    v40 = v5;
    v37 = *(_QWORD *)v48;
    v38 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload", v37, v38));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));
        v14 = objc_opt_class(v8[99]);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("Info")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("InstallationOrder")) & 1) != 0)
        {
          goto LABEL_11;
        }
        v15 = objc_msgSend(v11, "isEqualToString:", CFSTR("Certificates"));

        if ((v15 & 1) == 0)
        {
          v41 = v7;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
          v39 = v11;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v11));

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v13 = v17;
          v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
          if (!v18)
          {
            v12 = v13;
            goto LABEL_28;
          }
          v19 = v18;
          v20 = *(_QWORD *)v44;
LABEL_17:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(v13);
            v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v22));
            v24 = CFSTR("Manifest");
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("Manifest")));

            if (!v25)
            {
              v24 = CFSTR("Settings");
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("Settings")));

              if (!v26)
                break;
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v24));
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("Info")));

            if (!v28)
              break;
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v28, "objectForKey:", CFSTR("PlatformType")));
            v30 = objc_msgSend(v42, "isEqualToString:", v29);

            if ((v30 & 1) == 0)
            {
              v34 = sub_100024A40();
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v28, "objectForKey:", CFSTR("PlatformType")));
                *(_DWORD *)buf = 138544130;
                v52 = v36;
                v53 = 2114;
                v54 = v42;
                v55 = 2114;
                v56 = v22;
                v57 = 2114;
                v58 = v39;
                _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "PlatformType (%{public}@) in the manifest does not match the one that we are running on (%{public}@) for item: %{public}@ under component: %{public}@", buf, 0x2Au);

              }
LABEL_33:
              v5 = v40;

              v3 = 0;
              goto LABEL_34;
            }

            if (v19 == (id)++v21)
            {
              v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
              if (v19)
                goto LABEL_17;
              v12 = v13;
              v5 = v40;
              v9 = v37;
              self = v38;
              v8 = &APFSContainerGetSpaceInfo_ptr;
LABEL_28:
              v7 = v41;
LABEL_11:

              goto LABEL_12;
            }
          }
          v32 = sub_100024A40();
          v28 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            sub_10002909C();
          goto LABEL_33;
        }
LABEL_12:
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      v7 = v31;
    }
    while (v31);
  }
  v3 = 1;
LABEL_34:

  return v3;
}

- (id)getComponentDataList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  }
  else
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100029104(v9, v10, v11, v12, v13, v14, v15, v16);

    v6 = 0;
  }

  return v6;
}

- (id)getSystemAppDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SystemApps")));

  return v3;
}

- (id)getSharedDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SharedAppData")));

  return v3;
}

- (id)getUserDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("UserData")));

  return v3;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10004DE80);
}

- (id)getAllFileHash
{
  return -[MSDSignedManifestV7 parseAllFileHash](self, "parseAllFileHash");
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[5];
  __CFString *v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100006AA4;
  v12[4] = sub_100006AB4;
  v13 = &stru_100049858;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathComponents"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006ABC;
  v7[3] = &unk_100048BF8;
  v7[4] = self;
  v7[5] = v12;
  v7[6] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);

  return (char)self;
}

- (id)getManifestDataFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getManifestFromSection:forIdentifier:](self, "getManifestFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Data")));

  return v5;
}

- (id)getManifestInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getManifestFromSection:forIdentifier:](self, "getManifestFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Info")));

  return v5;
}

- (id)getSettingsFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getDictFromSection:forIdentifier:](self, "getDictFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Settings")));

  return v5;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:](self, "getSettingsFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Data")));

  return v5;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:](self, "getSettingsFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Info")));

  return v5;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder", a3.location, a3.length));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", location));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getBackupList](self, "getBackupList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("OriginServer")));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(".")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](self, "getDataSectionKeys"));
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
  {
    v8 = v6;
  }
  else
  {
    v10 = sub_100024A40();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100029174();

    v8 = 0;
  }

  return v8;
}

- (void)parseNonContainerizedContentRootSet
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](self, "getDataSectionKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (!-[MSDSignedManifest isContainerizedComponent:](self, "isContainerizedComponent:", v11, (_QWORD)v16))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 parseSectionForContentRoot:](self, "parseSectionForContentRoot:", v13));
          v15 = v14;
          if (v14 && objc_msgSend(v14, "count"))
            objc_msgSend(v3, "unionSet:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[MSDSignedManifestV7 setNonContainerizedContentRoots:](self, "setNonContainerizedContentRoots:", v3);
}

- (id)parseSectionForContentRoot:(id)a3
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v3 = a3;
  v27 = objc_alloc_init((Class)NSMutableSet);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v4 = CFSTR("/");
    v23 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v26 = v5;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v5)));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Data")));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v13);
              v15 = objc_autoreleasePoolPush();
              if ((objc_msgSend(v14, "isEqualToString:", v4) & 1) == 0)
              {
                v16 = v4;
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v14));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("MSDManifestFileExtendedAttributes")));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("MSDAnnotation")));

                if (v19)
                {
                  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v19, 4);
                  if (objc_msgSend(v20, "isEqualToString:", CFSTR("ContentRoot")))
                    objc_msgSend(v27, "addObject:", v14);

                }
                v4 = v16;
              }
              objc_autoreleasePoolPop(v15);
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v11);
        }

        v5 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }

  return v27;
}

- (void)parseLocaleCode
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;

  -[MSDSignedManifestV7 setLocaleCodeStr:](self, "setLocaleCodeStr:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSettingsDataFromSection:forIdentifier:](self, "getSettingsDataFromSection:forIdentifier:", CFSTR("BackupData"), CFSTR("locale")));
  v4 = v3;
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("language")));
    if (v5)
    {
      v6 = v5;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("region")));
      if (v7)
      {
        v8 = (void *)v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v6, v7));
        -[MSDSignedManifestV7 setLocaleCodeStr:](self, "setLocaleCodeStr:", v9);

      }
      else
      {
        v12 = sub_100024A40();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1000292D4();

      }
    }
    else
    {
      v11 = sub_100024A40();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100029258();
    }
  }
  else
  {
    v10 = sub_100024A40();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000291DC();
  }

}

- (id)parseAllFileHash
{
  NSMutableSet *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *context;
  void *contexta;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];

  v2 = objc_opt_new(NSMutableSet);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v54 = objc_msgSend(&off_10004DE98, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v54)
  {
    v52 = *(_QWORD *)v79;
    v3 = CFSTR("Manifest");
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v79 != v52)
          objc_enumerationMutation(&off_10004DE98);
        v58 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v4);
        context = objc_autoreleasePoolPush();
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v75;
          v60 = v8;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v75 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v12);
              v14 = objc_autoreleasePoolPush();
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v3));
              v17 = v16;
              if (v16)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("Info")));
                v19 = v18;
                if (v18)
                {
                  v20 = v10;
                  v21 = v11;
                  v22 = v3;
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Hash")));
                  if (v23)
                    -[NSMutableSet addObject:](v2, "addObject:", v23);

                  v3 = v22;
                  v11 = v21;
                  v10 = v20;
                  v8 = v60;
                }

              }
              objc_autoreleasePoolPop(v14);
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(context);
        v4 = v58 + 1;
      }
      while ((id)(v58 + 1) != v54);
      v54 = objc_msgSend(&off_10004DE98, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v54);
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v47 = objc_msgSend(&off_10004DEB0, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v71;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v71 != v46)
          objc_enumerationMutation(&off_10004DEB0);
        v49 = v24;
        v25 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v24);
        v48 = objc_autoreleasePoolPush();
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v25));

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v28 = v27;
        v55 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
        if (v55)
        {
          v51 = v28;
          v53 = *(_QWORD *)v67;
          do
          {
            v29 = 0;
            do
            {
              if (*(_QWORD *)v67 != v53)
                objc_enumerationMutation(v28);
              v30 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v29);
              v31 = objc_autoreleasePoolPush();
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v30));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("Manifest")));
              if (v33)
              {
                v59 = v32;
                v61 = v31;
                contexta = v33;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("Data")));
                v62 = 0u;
                v63 = 0u;
                v64 = 0u;
                v65 = 0u;
                v35 = v34;
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
                if (v36)
                {
                  v37 = v36;
                  v38 = *(_QWORD *)v63;
                  do
                  {
                    v39 = 0;
                    do
                    {
                      if (*(_QWORD *)v63 != v38)
                        objc_enumerationMutation(v35);
                      v40 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v39);
                      v41 = objc_autoreleasePoolPush();
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v40));
                      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("MSDManifestFileHash")));
                      if (v43)
                        -[NSMutableSet addObject:](v2, "addObject:", v43);

                      objc_autoreleasePoolPop(v41);
                      v39 = (char *)v39 + 1;
                    }
                    while (v37 != v39);
                    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
                  }
                  while (v37);
                }

                v28 = v51;
                v32 = v59;
                v31 = v61;
                v33 = contexta;
              }

              objc_autoreleasePoolPop(v31);
              v29 = (char *)v29 + 1;
            }
            while (v29 != v55);
            v55 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
          }
          while (v55);
        }

        objc_autoreleasePoolPop(v48);
        v24 = v49 + 1;
      }
      while ((id)(v49 + 1) != v47);
      v47 = objc_msgSend(&off_10004DEB0, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v47);
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v2));

  return v44;
}

- (NSString)localeCodeStr
{
  return self->_localeCodeStr;
}

- (void)setLocaleCodeStr:(id)a3
{
  objc_storeStrong((id *)&self->_localeCodeStr, a3);
}

- (NSSet)nonContainerizedContentRoots
{
  return self->_nonContainerizedContentRoots;
}

- (void)setNonContainerizedContentRoots:(id)a3
{
  objc_storeStrong((id *)&self->_nonContainerizedContentRoots, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonContainerizedContentRoots, 0);
  objc_storeStrong((id *)&self->_localeCodeStr, 0);
}

@end
