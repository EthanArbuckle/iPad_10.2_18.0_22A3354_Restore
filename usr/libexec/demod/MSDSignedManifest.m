@implementation MSDSignedManifest

+ (MSDSignedManifest)signedManifest
{
  return (MSDSignedManifest *)(id)qword_100175360;
}

+ (void)setSignedManifest:(id)a3
{
  objc_storeStrong((id *)&qword_100175360, a3);
}

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3;
  MSDSignedManifest *v4;

  v3 = a3;
  v4 = -[MSDSignedManifest initWithManifestData:]([MSDSignedManifest alloc], "initWithManifestData:", v3);

  return v4;
}

- (MSDSignedManifest)initWithManifestData:(id)a3
{
  id v4;
  id v5;
  MSDSignedManifest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  MSDSignedManifest *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  char *v49;
  char *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  objc_super v113;
  const __CFString *v114;
  void *v115;
  uint8_t buf[4];
  const char *v117;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v113.receiver = self;
  v113.super_class = (Class)MSDSignedManifest;
  v6 = -[MSDSignedManifest init](&v113, "init");
  if (!v6)
  {
    v9 = 0;
    v18 = 0;
    v7 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Version")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Info")));
  if (!v9 || (v10 = objc_opt_class(NSDictionary, v8), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    v55 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C09E0(v12, v56, v57, v58, v59, v60, v61, v62);
    goto LABEL_63;
  }
  if (+[MSDPlatform iOSHub](MSDPlatform, "iOSHub"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Product")));
    if (!v12 || (v13 = objc_opt_class(NSArray, v11), (objc_opt_isKindOfClass(v12, v13) & 1) == 0))
    {
      v72 = sub_1000604F0();
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        sub_1000C0A50(v73, v74, v75, v76, v77, v78, v79, v80);

      goto LABEL_63;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    objc_msgSend(v14, "setPlatformWithManifestProductList:", v12);

    v15 = NSClassFromString(CFSTR("MSDHubTestConfiguration"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v15, "sharedInstance"));
      if ((objc_opt_respondsToSelector(v16, "shouldRunManifestRigorousTest") & 1) != 0
        && (objc_msgSend(v16, "shouldRunManifestRigorousTest") & 1) == 0)
      {
        v20 = sub_1000604F0();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v117 = "-[MSDSignedManifest initWithManifestData:]";
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s - Will not run rigorous testing on iOS hub.", buf, 0xCu);
        }

        v17 = &__kCFBooleanFalse;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](MSDDemoManifestCheck, "sharedInstance"));
  -[MSDSignedManifest setManifestVerifier:](v6, "setManifestVerifier:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
  if (!v23)
  {
    v81 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C0AC0();
LABEL_63:
    v18 = 0;
LABEL_75:
    v19 = 0;
    goto LABEL_51;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getDataSectionKeys](v6, "getDataSectionKeys"));
  v114 = CFSTR("RigorousTestingOverride");
  v115 = v17;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "verifyManifestSignature:forDataSectionKeys:withOptions:", v4, v25, v26));

  if (v18)
  {
    v28 = objc_opt_class(NSDictionary, v27);
    if ((objc_opt_isKindOfClass(v18, v28) & 1) == 0)
    {
      v82 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000C0CC0(v12, v83, v84, v85, v86, v87, v88, v89);
      goto LABEL_75;
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("InstallationOrder")));
    if (v12)
    {
      v30 = objc_opt_class(NSArray, v29);
      if ((objc_opt_isKindOfClass(v12, v30) & 1) == 0)
      {
        v32 = objc_opt_class(NSDictionary, v31);
        if ((objc_opt_isKindOfClass(v12, v32) & 1) == 0)
        {
          v101 = sub_1000604F0();
          v91 = objc_claimAutoreleasedReturnValue(v101);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            sub_1000C0C50(v91, v102, v103, v104, v105, v106, v107, v108);
LABEL_74:

          goto LABEL_75;
        }
      }
      v112 = v9;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Backup")));
      if (!v34 || (v35 = objc_opt_class(NSDictionary, v33), (objc_opt_isKindOfClass(v34, v35) & 1) == 0))
      {
        v63 = sub_1000604F0();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          sub_1000C0B44(v64, v65, v66, v67, v68, v69, v70, v71);

        v19 = 0;
        goto LABEL_79;
      }
      v110 = v7;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("App")));
      v111 = v4;
      v38 = v5;
      if (v37)
      {
        v39 = objc_opt_class(NSDictionary, v36);
        if ((objc_opt_isKindOfClass(v37, v39) & 1) == 0)
        {
          v93 = sub_1000604F0();
          v52 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_1000C0BE0(v52, v94, v95, v96, v97, v98, v99, v100);
          goto LABEL_78;
        }
        v40 = (char *)objc_msgSend(v37, "count");
      }
      else
      {
        v40 = 0;
      }
      v41 = objc_opt_class(NSDictionary, v36);
      if ((objc_opt_isKindOfClass(v12, v41) & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v12, "objectForKey:", CFSTR("CriticalComponents")));

        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v12, "objectForKey:", CFSTR("CriticalComponents")));
          objc_msgSend(v5, "addObjectsFromArray:", v44);

        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v12, "objectForKey:", CFSTR("Components")));

        if (v45)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v12, "objectForKey:", CFSTR("Components")));
          objc_msgSend(v5, "addObjectsFromArray:", v46);

        }
      }
      else
      {
        v47 = objc_opt_class(NSArray, v42);
        if ((objc_opt_isKindOfClass(v12, v47) & 1) != 0)
          objc_msgSend(v5, "addObjectsFromArray:", v12);
      }
      v48 = objc_msgSend(v5, "containsObject:", CFSTR("systemappdata"));
      v38 = v5;
      v49 = (char *)objc_msgSend(v5, "count");
      v50 = (char *)objc_msgSend(v34, "count");
      if (v48)
      {
        if (v49 != &v50[(_QWORD)v40 + 1])
        {
          v51 = sub_1000604F0();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            goto LABEL_77;
          goto LABEL_78;
        }
      }
      else if (v49 != &v40[(_QWORD)v50])
      {
        v109 = sub_1000604F0();
        v52 = objc_claimAutoreleasedReturnValue(v109);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
LABEL_77:
          sub_1000C0BB4();
LABEL_78:

        v19 = 0;
        v5 = v38;
        v7 = v110;
        v4 = v111;
LABEL_79:
        v9 = v112;
        goto LABEL_51;
      }

      v7 = v110;
      v4 = v111;
      v9 = v112;
    }
    if ((int)objc_msgSend(v7, "intValue") > 4)
    {
      -[MSDSignedManifest setSigningKey:](v6, "setSigningKey:", CFSTR("MultipleContentSignings"));
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SigningKey")));
      -[MSDSignedManifest setSigningKey:](v6, "setSigningKey:", v53);

    }
    -[MSDSignedManifest setPayload:](v6, "setPayload:", v18);
    -[MSDSignedManifest parseInstallationOrder](v6, "parseInstallationOrder");
    if (-[MSDSignedManifest validateInstallationOrder](v6, "validateInstallationOrder"))
    {
      if (-[MSDSignedManifest parseBundleID:](v6, "parseBundleID:", v9))
      {
        +[MSDSignedManifest setSignedManifest:](MSDSignedManifest, "setSignedManifest:", v6);
        v19 = v6;
LABEL_51:

        goto LABEL_52;
      }
      v92 = sub_1000604F0();
      v91 = objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        sub_1000C0AEC();
    }
    else
    {
      v90 = sub_1000604F0();
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        sub_1000C0B18();
    }
    goto LABEL_74;
  }
LABEL_12:
  v19 = 0;
LABEL_52:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[MSDSignedManifest setPayload:](self, "setPayload:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MSDSignedManifest;
  -[MSDSignedManifest dealloc](&v3, "dealloc");
}

- (NSString)getInstallationOrderAppsPrefix
{
  return (NSString *)CFSTR("app.");
}

- (NSString)getInstallationOrderSystemApps
{
  return (NSString *)CFSTR("systemappdata");
}

- (int)getVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Version")));

  LODWORD(v2) = objc_msgSend(v3, "intValue");
  return (int)v2;
}

- (NSString)getLocaleCode
{
  return 0;
}

- (NSDictionary)getInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Info")));

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("App")));

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("AppData")));

  return (NSDictionary *)v3;
}

- (NSDictionary)getGroupDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("GroupData")));

  return (NSDictionary *)v3;
}

- (NSDictionary)getPlugInDataList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ExtensionData")));

  return (NSDictionary *)v3;
}

- (id)getAppDependecies:(id)a3
{
  return 0;
}

- (id)getSystemAppDependecies:(id)a3
{
  return 0;
}

- (int64_t)getAppType:(id)a3
{
  return 3;
}

- (id)getAppFileSize:(id)a3
{
  return 0;
}

- (id)getAppRealSize:(id)a3
{
  return 0;
}

- (id)getStandAlonePackageFileSize:(id)a3
{
  return 0;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  return 0;
}

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (NSDictionary)getSharedDataList
{
  return 0;
}

- (NSDictionary)getUserDataList
{
  return 0;
}

- (id)getComponentDataList:(id)a3
{
  return 0;
}

- (NSDictionary)getSystemAppDataList
{
  return 0;
}

- (NSSet)getAllFileHash
{
  return 0;
}

- (id)allContentRootPaths
{
  return 0;
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  return 0;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  return 0;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  return 0;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  return 0;
}

- (BOOL)isContainerizedComponent:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppData")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("GroupData")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ExtensionData"));
  }

  return v4;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (id)getOriginServerFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getDictFromSection:forIdentifier:](self, "getDictFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("OriginServer")));

  return v5;
}

- (NSDictionary)getBackup
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;

  if (-[MSDSignedManifest getVersion](self, "getVersion") >= 5)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C0D30();

    v4 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Backup")));

  }
  return (NSDictionary *)v4;
}

- (NSDictionary)getBackupList
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[MSDSignedManifest getVersion](self, "getVersion") < 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackup](self, "getBackup"));
    v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v3, CFSTR("backup.BaseBackup")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Backup")));
  }
  v5 = (void *)v4;

  return (NSDictionary *)v5;
}

- (id)itemAtIndexInManifest:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));

  return v5;
}

- (_NSRange)rangeOfGroupedBackups:(int64_t)a3
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  -[MSDSignedManifest getVersion](self, "getVersion");
  v4 = a3;
  v5 = 1;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  NSRange v27;

  length = a3.length;
  location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion") <= 4)
    return (id)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackup](self, "getBackup"));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v27.location = location;
    v27.length = length;
    v9 = NSStringFromRange(v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Merging manifest item %{public}@", buf, 0xCu);

  }
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  if (location < location + length)
  {
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", location));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackupList](self, "getBackupList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("Manifest")));
      v16 = v15;
      if (v15)
      {
        v17 = v15;

        v14 = v17;
      }
      if (-[MSDSignedManifest isItemSystemContainerBackup:](self, "isItemSystemContainerBackup:", v12))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
        v19 = objc_msgSend(v18, "watchOS");

        v20 = sub_1000604F0();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "System container backup only allowed on Watch devices.", buf, 2u);
          }

          goto LABEL_17;
        }
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "System container backup found. Start restoring UUID paths...", buf, 2u);
        }

        v23 = objc_claimAutoreleasedReturnValue(+[NSString restoreSystemContainerUUIDPathsInDict:](NSString, "restoreSystemContainerUUIDPathsInDict:", v14));
        v14 = (void *)v23;
      }
      objc_msgSend(v24, "addEntriesFromDictionary:", v14);
LABEL_17:

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
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("backup.SystemContainer"));

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
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("backup.SystemContainer"));

        v14 = v16 + 1;
        --v15;
      }
      while (!v18);
      v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion", a3.location, a3.length) >= 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", location));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackupList](self, "getBackupList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("OriginServer")));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)originServerForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("OriginServer")));

  }
  return v6;
}

- (BOOL)isItemBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("backup."));
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("backup.BaseBackup"));
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("backup.SystemContainer"));
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("backup.ProvisioningProfile"));
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("systemappdata"));
}

- (BOOL)isItemApp:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("app."));
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return 0;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return 0;
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  return 0;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[MSDSignedManifest isItemApp:](self, "isItemApp:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("app."), "length")));
  else
    v5 = 0;

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  return 0;
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  return 0;
}

+ (id)appsPrefixForManifestVersion:(id)a3
{
  unsigned int v3;
  const __CFString *v4;

  v3 = objc_msgSend(a3, "intValue");
  v4 = CFSTR("/Apps/");
  if (v3 != 7)
    v4 = 0;
  if (v3 == 6)
    return CFSTR("app.");
  else
    return (id)v4;
}

+ (id)getComponentFromPath:(id)a3 forManifestVersion:(id)a4
{
  id v5;
  unsigned int v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a4, "intValue");
  if (v6 == 7)
  {
LABEL_7:
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/Apps/")))
    {
      v7 = CFSTR("/Apps/");
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/BackupData/")))
    {
      v7 = CFSTR("/BackupData/");
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/Packages/")))
    {
      v7 = CFSTR("/Packages/");
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/ConfigurationProfiles/")))
    {
      v7 = CFSTR("/ConfigurationProfiles/");
      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("/SystemApps")))
    {
      v9 = v5;
      v8 = 1;
      goto LABEL_16;
    }
LABEL_19:
    v10 = v5;
    goto LABEL_20;
  }
  if (v6 != 6)
    goto LABEL_19;
  if (!objc_msgSend(v5, "hasPrefix:", CFSTR("app.")))
  {
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("backup.")))
    {
      v7 = CFSTR("backup.");
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  v7 = CFSTR("app.");
LABEL_15:
  v8 = (uint64_t)-[__CFString length](v7, "length");
  v9 = v5;
LABEL_16:
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", v8));
LABEL_20:
  v11 = v10;

  return v11;
}

- (id)getComponentVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleShortVersionString")));

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "appName:%{public}@ componentVersion:%{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v8;
}

- (id)getAppManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Manifest")));
  return v7;
}

- (id)getBackupSectionName
{
  return CFSTR("Backup");
}

- (id)getStandAlonePackageVersion:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  const char *v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDSignedManifest getStandAlonePackageVersion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - getStandAlonePackageVersion is applicable to manifest V7 only.", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E510);
}

- (void)parseInstallationOrder
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("InstallationOrder")));

  if (v4)
  {
    v6 = objc_opt_class(NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CriticalComponents")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Components")));
      if (v8)
      {
        v11 = objc_opt_class(NSArray, v9);
        if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
        {
          objc_msgSend(v14, "addObjectsFromArray:", v8);
          -[MSDSignedManifest setStaggeredContentUpdateEnabled:](self, "setStaggeredContentUpdateEnabled:", 1);
          -[MSDSignedManifest setCriticalComponents:](self, "setCriticalComponents:", v8);
        }
      }
      if (v10)
      {
        v12 = objc_opt_class(NSArray, v9);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
          objc_msgSend(v14, "addObjectsFromArray:", v10);
      }

      goto LABEL_12;
    }
    v13 = objc_opt_class(NSArray, v7);
    if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
    {
      v8 = v14;
      v14 = objc_msgSend(v4, "mutableCopy");
LABEL_12:

    }
  }
  -[MSDSignedManifest setInstallationOrder:](self, "setInstallationOrder:", v14);

}

- (BOOL)validateInstallationOrder
{
  id v2;
  void *v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v2 = v5;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (-[MSDSignedManifest isItemProvisioningProfileBackup:](self, "isItemProvisioningProfileBackup:", v9)
          || -[MSDSignedManifest isItemBaseBackup:](self, "isItemBaseBackup:", v9))
        {
          v6 = 1;
        }
        else if (-[MSDSignedManifest isItemApp:](self, "isItemApp:", v9))
        {
          if ((v6 & 1) != 0)
          {
            v10 = 0;
            LOBYTE(v2) = 1;
          }
          else
          {
            v11 = sub_1000604F0();
            v12 = objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v14 = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cannot place app before provisioning profile or base backup.", v14, 2u);
            }

            LOBYTE(v2) = 0;
            v10 = 0;
          }
          goto LABEL_18;
        }
      }
      v2 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v2)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_18:

  return (v2 | v10) & 1;
}

- (id)getDictFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));
  return v10;
}

- (id)getManifestFromSection:(id)a3 forIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getDictFromSection:forIdentifier:](self, "getDictFromSection:forIdentifier:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Manifest")));

  return v5;
}

- (BOOL)parseBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PartNumber")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Revision")));

  if (!v5)
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C0D5C(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_9;
  }
  if (!v6)
  {
    v19 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C0DCC(v11, v20, v21, v22, v23, v24, v25, v26);
LABEL_9:

    v8 = 0;
    goto LABEL_4;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), v5, objc_msgSend(v6, "intValue")));
  -[MSDSignedManifest setBundleID:](self, "setBundleID:", v7);

  v8 = 1;
LABEL_4:

  return v8;
}

- (NSString)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingKey, a3);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)installationOrder
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstallationOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCriticalComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MSDDemoManifestCheck)manifestVerifier
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 56, 1);
}

- (void)setManifestVerifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)staggeredContentUpdateEnabled
{
  return self->_staggeredContentUpdateEnabled;
}

- (void)setStaggeredContentUpdateEnabled:(BOOL)a3
{
  self->_staggeredContentUpdateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestVerifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_installationOrder, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

@end
