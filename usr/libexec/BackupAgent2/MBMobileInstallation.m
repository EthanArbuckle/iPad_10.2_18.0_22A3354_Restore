@implementation MBMobileInstallation

- (MBMobileInstallation)init
{
  MBMobileInstallation *v2;
  MBIgnoredAccountsTracker *v3;
  MBIgnoredAccountsTracker *accountsTracker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBMobileInstallation;
  v2 = -[MBMobileInstallation init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(MBIgnoredAccountsTracker);
    accountsTracker = v2->_accountsTracker;
    v2->_accountsTracker = v3;

  }
  return v2;
}

- (MBMobileInstallation)initWithSafeHarborDir:(id)a3
{
  id v5;
  MBMobileInstallation *v6;
  MBMobileInstallation *v7;

  v5 = a3;
  v6 = -[MBMobileInstallation init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_safeHarborDir, a3);

  return v7;
}

- (void)_enumerateAppsWithEnumerationOptions:(unint64_t)a3 to:(id)a4 persona:(id)a5 dataSeparatedBundleIDs:(id)a6
{
  NSObject *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t isKindOfClass;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  unsigned __int8 v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  id v74;
  id v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  double v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  NSObject *v88;
  int v89;
  unsigned int v90;
  id v91;
  int v92;
  id v93;
  NSObject *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  unint64_t v100;
  __int16 v101;
  NSObject *v102;
  __int16 v103;
  double v104;
  __int16 v105;
  id v106;
  _BYTE v107[128];

  v93 = a4;
  v9 = a5;
  v86 = a6;
  v10 = objc_claimAutoreleasedReturnValue(-[NSObject user](v9, "user"));
  v11 = objc_msgSend((id)v10, "isPrimaryUser");

  LODWORD(v10) = -[NSObject isPersonalPersona](v9, "isPersonalPersona");
  v88 = v9;
  v12 = -[NSObject isDataSeparatedPersona](v9, "isDataSeparatedPersona");
  v13 = v12;
  v89 = v10;
  if ((v10 & 1) == 0 && (v12 & 1) == 0)
    sub_1000882D8();
  v94 = objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v88, "personaIdentifier"));
  if (!v94)
    sub_1000882B0();
  v90 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaType:](UMUserPersonaAttributes, "personaAttributesForPersonaType:", 3));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userPersonaUniqueString"));

  v87 = (void *)v15;
  if (v15)
    v18 = 0;
  else
    v18 = v11;
  if (v18 == 1)
  {
    v19 = MBGetDefaultLog(v16, v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Could not fetch system persona for primary user", buf, 2u);
      _MBLog(CFSTR("FAULT"), "Could not fetch system persona for primary user");
    }

  }
  v21 = MBGetDefaultLog(v16, v17);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v100 = a3;
    v101 = 2112;
    v102 = v88;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Starting app enumeration (options = %llu) for %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Starting app enumeration (options = %llu) for %@", a3, v88);
  }

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v24 = v23;
  v85 = a3;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", a3));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
  if (v26)
  {
    v27 = v26;
    v92 = v89 & v11;
    v28 = *(_QWORD *)v96;
    v91 = v25;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v96 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)v29);
        v31 = objc_autoreleasePoolPush();
        v32 = objc_opt_class(LSApplicationRecord);
        isKindOfClass = objc_opt_isKindOfClass(v30, v32);
        if ((isKindOfClass & 1) != 0)
        {
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
          v36 = objc_msgSend(v30, "mb_isContainerized");
          if ((v36 & 1) == 0)
          {
            v46 = MBGetDefaultLog(v36, v37);
            v43 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v100 = (unint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Skipping isContainerized for %@", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "Skipping isContainerized for %@", v35);
            }
            goto LABEL_27;
          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mb_applicationType"));
          v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("Hidden"));

          if (v39)
          {
            v42 = MBGetDefaultLog(v40, v41);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v100 = (unint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Skipping %@ as of Hidden type", buf, 0xCu);
              _MBLog(CFSTR("INFO"), "Skipping %@ as of Hidden type", v35);
            }
            goto LABEL_27;
          }
          if (objc_msgSend(v30, "isPlaceholder"))
          {
            v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", v35));
            v43 = v47;
            if (v47)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", CFSTR("IsPlaceholder")));
              v49 = objc_msgSend(v48, "BOOLValue");

              if ((v49 & 1) == 0)
              {
                v71 = MBGetDefaultLog(v50, v51);
                v72 = objc_claimAutoreleasedReturnValue(v71);
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v100 = (unint64_t)v35;
                  _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Skipping placeholder for %@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), "Skipping placeholder for %@", v35);
                }

                v25 = v91;
                goto LABEL_27;
              }
            }

            v25 = v91;
          }
          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "managedPersonas"));
          v52 = -[NSObject count](v43, "count");
          if (v52)
          {
            v54 = MBGetDefaultLog(v52, v53);
            v55 = objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v100 = (unint64_t)v35;
              v101 = 2114;
              v102 = v43;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Found app %@ with managed personae: %{public}@", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), "Found app %@ with managed personae: %{public}@", v35, v43);
            }

LABEL_39:
            v56 = -[NSObject containsObject:](v43, "containsObject:", v94);
            if (v92)
            {
              if ((v56 & 1) == 0)
              {
                v58 = -[NSObject containsObject:](v43, "containsObject:", v87);
                if ((v58 & 1) == 0)
                {
                  v60 = MBGetDefaultLog(v58, v59);
                  v61 = objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    v100 = (unint64_t)v35;
                    v101 = 2112;
                    v102 = v94;
                    v103 = 2112;
                    v104 = *(double *)&v87;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ since it's not managed by the personal:%@ persona nor system:%@ persona", buf, 0x20u);
                    v25 = v91;
                    _MBLog(CFSTR("DEFAULT"), "Skipping %{public}@ since it's not managed by the personal:%@ persona nor system:%@ persona", v35, v94, v87);
                  }
LABEL_62:

                  goto LABEL_27;
                }
              }
            }
            else if (v90)
            {
              if ((v56 & 1) == 0)
              {
                v62 = objc_msgSend(v86, "containsObject:", v35);
                if ((v62 & 1) == 0)
                {
                  v64 = MBGetDefaultLog(v62, v63);
                  v61 = objc_claimAutoreleasedReturnValue(v64);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v100 = (unint64_t)v35;
                    v101 = 2114;
                    v102 = v94;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ for data-separated persona %{public}@ since it's not in the list of managed personae", buf, 0x16u);
                    _MBLog(CFSTR("DEFAULT"), "Skipping %{public}@ for data-separated persona %{public}@ since it's not in the list of managed personae", v35, v94, v84);
                  }
                  goto LABEL_62;
                }
              }
            }
            else if ((v56 & 1) == 0)
            {
              v73 = MBGetDefaultLog(v56, v57);
              v61 = objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v100 = (unint64_t)v35;
                v101 = 2114;
                v102 = v94;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ for persona %{public}@ since it's not in the list of managed personae", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), "Skipping %{public}@ for persona %{public}@ since it's not in the list of managed personae", v35, v94, v84);
              }
              goto LABEL_62;
            }
          }
          else if ((v89 & 1) == 0)
          {
            goto LABEL_39;
          }
          v65 = sub_10004727C(v30);
          if (v65 == 2)
          {
            v68 = MBGetDefaultLog(2, v66);
            v61 = objc_claimAutoreleasedReturnValue(v68);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v100 = (unint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping %@ (Swift Playgrounds app)", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Skipping %@ (Swift Playgrounds app)", v35, v83, v84);
            }
          }
          else if (v65 == 1)
          {
            v67 = MBGetDefaultLog(1, v66);
            v61 = objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v100 = (unint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping %@ (app clip)", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Skipping %@ (app clip)", v35, v83, v84);
            }
          }
          else
          {
            v61 = objc_claimAutoreleasedReturnValue(-[NSObject userDataVolume](v88, "userDataVolume"));
            v69 = sub_100047DA8(v30, v61);
            v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
            objc_msgSend(v93, "setObject:forKeyedSubscript:", v70, v35);

          }
          goto LABEL_62;
        }
        v44 = MBGetDefaultLog(isKindOfClass, v34);
        v35 = objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
        *(_DWORD *)buf = 138412290;
        v100 = (unint64_t)v45;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Skipping isKindOfClass for %@", buf, 0xCu);

        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
        _MBLog(CFSTR("DEFAULT"), "Skipping isKindOfClass for %@", v43);
LABEL_27:

LABEL_28:
        objc_autoreleasePoolPop(v31);
        v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      v74 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      v27 = v74;
    }
    while (v74);
  }

  v75 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v77 = v76;
  v79 = MBGetDefaultLog(v75, v78);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    v81 = v77 - v24;
    v82 = objc_msgSend(v93, "count");
    *(_DWORD *)buf = 134218754;
    v100 = v85;
    v101 = 2112;
    v102 = v88;
    v103 = 2048;
    v104 = v81;
    v105 = 2048;
    v106 = v82;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Finished app enumeration (options = %llu) for %@ in %0.3fs: %lu apps", buf, 0x2Au);
    _MBLog(CFSTR("DEFAULT"), "Finished app enumeration (options = %llu) for %@ in %0.3fs: %lu apps", v85, v88, *(_QWORD *)&v81, objc_msgSend(v93, "count"));
  }

}

- (id)userAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = objc_autoreleasePoolPush();
  -[MBMobileInstallation _enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:](self, "_enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:", 0, v9, v7, v8);
  -[MBMobileInstallation _enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:](self, "_enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:", 64, v9, v7, v8);
  objc_autoreleasePoolPop(v10);

  return v9;
}

- (id)userAppWithBundleID:(id)a3 placeholder:(BOOL)a4 persona:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v16 = 0;
  v11 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v8, v7, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userDataVolume"));
  v13 = sub_100047DA8(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  objc_autoreleasePoolPop(v10);
  return v14;
}

- (id)systemPluginsForPersona:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  uint64_t HasVolumePrefix;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  void *context;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id obj;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _QWORD v105[6];
  _BYTE v106[24];
  NSObject *v107;
  __int128 v108;
  _QWORD v109[3];
  _QWORD v110[3];
  uint8_t buf[4];
  id v112;
  __int16 v113;
  void *v114;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  context = objc_autoreleasePoolPush();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationExtensionRecord enumeratorWithOptions:](LSApplicationExtensionRecord, "enumeratorWithOptions:", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v97;
    v92 = v5;
    v87 = v6;
    v88 = v4;
    v86 = *(_QWORD *)v97;
    do
    {
      v10 = 0;
      v89 = v8;
      do
      {
        if (*(_QWORD *)v97 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        if (objc_msgSend(v11, "mb_isContainerized"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containingBundleRecord"));

          if (!v13)
          {
            v93 = v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userDataVolume"));
            v15 = v11;
            v94 = v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataContainerURL"));

            if (v16)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_bundleURL"));

              if (v19)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));

                if (v22)
                {
                  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_entitlements"));
                  if (!v25)
                  {
                    v27 = MBGetDefaultLog(0, v26);
                    v28 = objc_claimAutoreleasedReturnValue(v27);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                    {
                      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                      *(_DWORD *)buf = 138412290;
                      v112 = v29;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Plugin %@ found without entitlements.", buf, 0xCu);

                      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                      _MBLog(CFSTR("DEBUG"), "Plugin %@ found without entitlements.", v30);

                    }
                    v25 = &__NSDictionary0__struct;
                  }
                  v90 = v25;
                  v91 = v10;
                  v31 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  v100 = 0u;
                  v101 = 0u;
                  v102 = 0u;
                  v103 = 0u;
                  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "groupContainerURLs"));
                  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
                  v33 = v94;
                  if (v32)
                  {
                    v34 = v32;
                    v35 = *(_QWORD *)v101;
                    do
                    {
                      v36 = 0;
                      do
                      {
                        v37 = (void *)v31;
                        if (*(_QWORD *)v101 != v35)
                          objc_enumerationMutation(obj);
                        v38 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v36);
                        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "groupContainerURLs"));
                        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v38));

                        if (v40)
                        {
                          v43 = sub_10004ADEC(v40);
                          v44 = objc_claimAutoreleasedReturnValue(v43);
                          HasVolumePrefix = MBPathHasVolumePrefix(v44, v33);
                          if ((HasVolumePrefix & 1) != 0)
                          {
                            v110[0] = v38;
                            v109[0] = kCFBundleIdentifierKey;
                            v109[1] = CFSTR("ContainerContentClass");
                            v47 = MBStringForContainerType(3);
                            v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
                            v109[2] = CFSTR("Container");
                            v110[1] = v48;
                            v110[2] = v44;
                            v49 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v110, v109, 3));

                            v31 = (uint64_t)v37;
                            objc_msgSend(v37, "addObject:", v49);
LABEL_28:

                            goto LABEL_29;
                          }
                          v52 = MBGetDefaultLog(HasVolumePrefix, v46);
                          v49 = objc_claimAutoreleasedReturnValue(v52);
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                          {
                            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                            *(_DWORD *)v106 = 138413058;
                            *(_QWORD *)&v106[4] = v53;
                            *(_WORD *)&v106[12] = 2112;
                            *(_QWORD *)&v106[14] = v38;
                            *(_WORD *)&v106[22] = 2112;
                            v107 = v44;
                            LOWORD(v108) = 2112;
                            *(_QWORD *)((char *)&v108 + 2) = v94;
                            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", v106, 0x2Au);

                            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                            _MBLog(CFSTR("DEFAULT"), "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", v54, v38, v44, v94);

                            v33 = v94;
                          }
LABEL_27:
                          v31 = (uint64_t)v37;
                          goto LABEL_28;
                        }
                        v50 = MBGetDefaultLog(v41, v42);
                        v44 = objc_claimAutoreleasedReturnValue(v50);
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                        {
                          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                          *(_DWORD *)v106 = 138412546;
                          *(_QWORD *)&v106[4] = v51;
                          *(_WORD *)&v106[12] = 2112;
                          *(_QWORD *)&v106[14] = v38;
                          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found without a container - will not be backed up", v106, 0x16u);

                          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                          _MBLog(CFSTR("DEFAULT"), "Plugin %@ groupContainer %@ found without a container - will not be backed up", v49, v38);
                          goto LABEL_27;
                        }
                        v31 = (uint64_t)v37;
LABEL_29:

                        v36 = (char *)v36 + 1;
                      }
                      while (v34 != v36);
                      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
                      v34 = v55;
                    }
                    while (v55);
                  }

                  v105[0] = kCFBundleIdentifierKey;
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  *(_QWORD *)v106 = v56;
                  v105[1] = CFSTR("ContainerContentClass");
                  v57 = MBStringForContainerType(2);
                  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
                  *(_QWORD *)&v106[8] = v58;
                  v105[2] = CFSTR("Path");
                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_bundleURL"));
                  v60 = sub_10004ADEC(v59);
                  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
                  *(_QWORD *)&v106[16] = v61;
                  v105[3] = CFSTR("Container");
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataContainerURL"));
                  v63 = sub_10004ADEC(v62);
                  v64 = objc_claimAutoreleasedReturnValue(v63);
                  v107 = v64;
                  v65 = v90;
                  *(_QWORD *)&v108 = v90;
                  v105[4] = CFSTR("Entitlements");
                  v105[5] = CFSTR("GroupContainers");
                  *((_QWORD *)&v108 + 1) = v31;
                  v66 = (void *)v31;
                  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v106, v105, 6));

                  v6 = v87;
                  v68 = v88;
                  v8 = v89;
                  v9 = v86;
                  v10 = v91;
LABEL_41:

                  v4 = v68;
                  v5 = v92;
LABEL_43:

                  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, v78);

                  v12 = v93;
                  goto LABEL_44;
                }
                v75 = MBGetDefaultLog(v23, v24);
                v65 = objc_claimAutoreleasedReturnValue(v75);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v68 = v4;
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  *(_DWORD *)buf = 138412546;
                  v112 = v76;
                  v113 = 2112;
                  v114 = v77;
                  _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", buf, 0x16u);

                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
                  _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", v66, v56);
                  goto LABEL_40;
                }
LABEL_42:
                v67 = 0;
                goto LABEL_43;
              }
              v72 = MBGetDefaultLog(v20, v21);
              v65 = objc_claimAutoreleasedReturnValue(v72);
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                goto LABEL_42;
              v68 = v4;
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_bundleURL"));
              *(_DWORD *)buf = 138412546;
              v112 = v73;
              v113 = 2112;
              v114 = v74;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a bundle URL (%@) - will not be backed up.", buf, 0x16u);

              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_bundleURL"));
              _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a bundle URL (%@) - will not be backed up.", v66, v56);
            }
            else
            {
              v69 = MBGetDefaultLog(v17, v18);
              v65 = objc_claimAutoreleasedReturnValue(v69);
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                goto LABEL_42;
              v68 = v4;
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataContainerURL"));
              *(_DWORD *)buf = 138412546;
              v112 = v70;
              v113 = 2112;
              v114 = v71;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a data container (%@) - will not be backed up.", buf, 0x16u);

              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mb_pluginIdentifier"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataContainerURL"));
              _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a data container (%@) - will not be backed up.", v66, v56);
            }
LABEL_40:
            v67 = 0;
            goto LABEL_41;
          }
        }
LABEL_44:
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(context);
  v81 = MBGetDefaultLog(v79, v80);
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v83 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v112 = v83;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Finished app enumeration PLUGINS: %lu apps", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Finished app enumeration PLUGINS: %lu apps", objc_msgSend(v5, "count"));
  }

  return v5;
}

- (id)_systemContainersWithError:(id *)a3 shared:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t all_with_class_for_current_user;
  uint64_t v9;
  unint64_t v10;
  int v11;
  _UNKNOWN **v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  _UNKNOWN **v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id *v39;
  void *v40;
  unsigned int v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  _BYTE buf[24];

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v42 = 0;
  v43 = 1;
  if (v4)
    v7 = 13;
  else
    v7 = 12;
  all_with_class_for_current_user = container_get_all_with_class_for_current_user(v7, 0, &v42, &v43);
  if (v43 != 1)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to fetch system containers: %llu"), v43));
    v31 = MBGetDefaultLog(v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v43;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error fetching all system containers: %llu", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Error fetching all system containers: %llu", v43);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v29);

LABEL_25:
    v33 = 0;
    goto LABEL_26;
  }
  v9 = all_with_class_for_current_user;
  if (v42)
  {
    v39 = a3;
    v10 = 0;
    if (v4)
      v11 = 5;
    else
      v11 = 4;
    v41 = v11;
    v40 = v6;
    v12 = &AnalyticsSendEventLazy_ptr;
    while (1)
    {
      v13 = objc_msgSend(v12[229], "stringWithUTF8String:", container_get_identifier(*(_QWORD *)(v9 + 8 * v10)));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = container_copy_path(*(_QWORD *)(v9 + 8 * v10), &v43);
      if (v43 != 1)
        break;
      v16 = (void *)v15;
      v17 = *(_QWORD *)(v9 + 8 * v10);
      v18 = MBStringForContainerType(v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v44[0] = kCFBundleIdentifierKey;
      v20 = objc_msgSend(v12[229], "stringWithUTF8String:", container_get_identifier(v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_QWORD *)buf = v21;
      *(_QWORD *)&buf[8] = v19;
      v44[1] = CFSTR("ContainerContentClass");
      v44[2] = CFSTR("Container");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v16, 1, 0));
      v23 = sub_10004ADEC(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_QWORD *)&buf[16] = v24;
      v25 = v9;
      v26 = v12;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v44, 3));

      v6 = v40;
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v27, v14);

      v12 = v26;
      v9 = v25;
      free(v16);

      ++v10;
      v28 = v42;
      if (v10 >= v42)
        goto LABEL_19;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to copy container path for %@: %llu"), v14, v43));
    v36 = MBGetDefaultLog(v34, v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v43;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Error copying container path for %@: %llu", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Error copying container path for %@: %llu", v14, v43);
    }

    if (v39)
      *v39 = objc_retainAutorelease(v34);
    container_free_array_of_containers(v9, v42);

    goto LABEL_25;
  }
  v28 = 0;
LABEL_19:
  container_free_array_of_containers(v9, v28);
  v33 = v6;
LABEL_26:

  return v33;
}

- (id)systemContainersWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v5 = objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  v7 = objc_autoreleasePoolPush();
  if (qword_1000F9E10)
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[MBMobileInstallation _systemContainersWithError:shared:](self, "_systemContainersWithError:shared:", &v13, 0));
    v8 = v13;
    v10 = (void *)qword_1000F9E10;
    qword_1000F9E10 = v9;

  }
  objc_autoreleasePoolPop(v7);
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v11 = (id)qword_1000F9E10;

  objc_sync_exit(v6);
  return v11;
}

- (id)systemSharedContainersWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v5 = objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  v7 = objc_autoreleasePoolPush();
  if (qword_1000F9E18)
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[MBMobileInstallation _systemContainersWithError:shared:](self, "_systemContainersWithError:shared:", &v13, 1));
    v8 = v13;
    v10 = (void *)qword_1000F9E18;
    qword_1000F9E18 = v9;

  }
  objc_autoreleasePoolPop(v7);
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v11 = (id)qword_1000F9E18;

  objc_sync_exit(v6);
  return v11;
}

+ (unint64_t)_containerClassForMBContainerType:(int)a3
{
  if ((a3 - 1) > 4)
    return 15;
  else
    return qword_10009D3D0[a3 - 1];
}

+ (id)_defaultSubdirectoriesForMCMContainerType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v14 = 1;
  v6 = container_subdirectories_for_class(a3, &v14);
  v8 = (void *)v6;
  if (v6)
  {
    v9 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
  }
  else
  {
    v10 = MBGetDefaultLog(0, v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v16 = 2;
      v17 = 2048;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get subdirectory names for container class %llu : %llu", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to get subdirectory names for container class %llu : %llu", 2, v14);
    }

    if (a4)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("container_subdirectories_for_class failed for class %llu with error %llu"), a3, v14));
      v9 = 0;
      *a4 = v12;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)defaultSubdirectoriesForMBContainerType:(int)a3 withNestedSubdirectories:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  int v30;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v6 = a1;
  objc_sync_enter(v6);
  if (!qword_1000F9E20)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v8 = (void *)qword_1000F9E20;
    qword_1000F9E20 = (uint64_t)v7;

  }
  v10 = objc_msgSend(v6, "_containerClassForMBContainerType:", v5);
  if (v10 == (id)15)
  {
    v11 = MBGetDefaultLog(15, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v28 = 15;
      v29 = 1024;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unknown MCM container type %llu for MB container type %u", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "Unknown MCM container type %llu for MB container type %u", 15, v5);
    }
    v13 = 0;
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000F9E20, "objectForKeyedSubscript:", v12));
    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_defaultSubdirectoriesForMCMContainerType:withError:", v10, 0));
      objc_msgSend((id)qword_1000F9E20, "setObject:forKeyedSubscript:", v14, v12);
    }
    if (v4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "pathComponents"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));

            objc_msgSend(v13, "addObject:", v20);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
  }

  objc_sync_exit(v6);
  return v13;
}

- (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a3;
  v6 = (void *)objc_opt_new(IXUninstallOptions);
  objc_msgSend(v6, "setRequestUserConfirmation:", 0);
  objc_msgSend(v6, "setWaitForDeletion:", 1);
  objc_msgSend(v6, "setShowArchiveOption:", 0);
  objc_msgSend(v6, "setSystemAppNotAllowed:", 0);
  v7 = +[IXAppInstallCoordinator uninstallAppWithBundleID:options:disposition:error:](IXAppInstallCoordinator, "uninstallAppWithBundleID:options:disposition:error:", v5, v6, 0, a4);
  v9 = (char)v7;
  if ((v7 & 1) == 0)
  {
    v10 = MBGetDefaultLog(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *a4;
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error uninstalling app with bundleID:%@{public} options:%@ error:%@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "Error uninstalling app with bundleID:%@{public} options:%@ error:%@", v5, v6, *a4);
    }

  }
  return v9;
}

- (id)safeHarborsWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MobileInstallationCopySafeHarbors(0, a2);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("MobileInstallationCopySafeHarbors failed")));
  }

  return v5;
}

- (BOOL)registerSafeHarborWithIdentifier:(id)a3 path:(id)a4 type:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  char v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = MCMContainerContentClassForMBContainerType(v7);
  v12 = MobileInstallationRegisterSafeHarborForContainerType(v10, v9, v11, 0);
  v14 = MBGetDefaultLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v10;
    v20 = 2112;
    v21 = v9;
    v22 = 1024;
    v23 = v11;
    v24 = 1024;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MobileInstallationRegisterSafeHarborForContainerType(\"%@\", \"%@\", %d, NULL): %d", buf, 0x22u);
    _MBLog(CFSTR("DEBUG"), "MobileInstallationRegisterSafeHarborForContainerType(\"%@\", \"%@\", %d, NULL): %d", v10, v9, v11, v12);
  }

  if (a6)
    v16 = v12;
  else
    v16 = 1;
  if ((v16 & 1) == 0)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("MobileInstallationRegisterSafeHarborForContainerType failed: %@: %@"), v9, v10));

  return v12;
}

- (BOOL)removeSafeHarborWithIdentifier:(id)a3 type:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  if ((_DWORD)v6)
    v8 = MCMContainerContentClassForMBContainerType(v6);
  else
    v8 = 1;
  v9 = MobileInstallationRemoveSafeHarborForContainerType(v7, v8, 0);
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    v17 = 1024;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MobileInstallationRemoveSafeHarborForContainerType(\"%@\", %d, NULL): %d", buf, 0x18u);
    _MBLog(CFSTR("DEBUG"), "MobileInstallationRemoveSafeHarborForContainerType(\"%@\", %d, NULL): %d", v7, v8, v9);
  }

  if (a5)
    v13 = v9;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("MobileInstallationRemoveSafeHarborForContainerType failed: %@"), v7));

  return v9;
}

+ (id)displayNameForBundleIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v3 = a3;
  v25 = 0;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v25);
  v5 = v25;
  v7 = v5;
  if (!v4)
  {
    v17 = MBGetDefaultLog(v5, v6);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v3;
      v28 = 2114;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to find the app record for %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to find the app record for %{public}@: %{public}@", v3, v7);
    }
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationState"));
  v9 = objc_msgSend(v8, "isInstalled");

  if ((v9 & 1) == 0)
  {
    v19 = MBGetDefaultLog(v10, v11);
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found an app record for %{public}@ but it's not installed", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Found an app record for %{public}@ but it's not installed", v3);
    }
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v12 = MBLocalizations();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedNameWithPreferredLocalizations:", v13));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  v20 = v16;

  v24 = MBGetDefaultLog(v22, v23);
  v18 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v27 = v3;
    v28 = 2114;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Mapped %{public}@ to %{public}@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "Mapped %{public}@ to %{public}@", v3, v20);
  }
LABEL_10:

  return v20;
}

+ (id)displayNameForDomain:(id)a3 isSystemDomain:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if ((+[MBDomain isSystemContainerName:](MBDomain, "isSystemContainerName:", v6) & 1) != 0
      || +[MBDomain isSystemSharedContainerName:](MBDomain, "isSystemSharedContainerName:", v6))
    {
      v7 = MBLocalizedStringFromTable(CFSTR("INCOMPLETE_SYSTEM_CONFIGURATION"), CFSTR("MobileBackup"));
      v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v6));
      if (!v9)
        v9 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000E5070, "objectForKeyedSubscript:", v9));
      v11 = v10;
      if (v10)
      {
        v12 = v10;

        v9 = v12;
      }
      v13 = objc_msgSend((id)objc_opt_class(a1), "displayNameForBundleIdentifier:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v14)
      {
        v8 = v14;

      }
      else
      {

        if (v4)
        {
          v15 = MBLocalizedStringFromTable(CFSTR("INCOMPLETE_SYSTEM_CONFIGURATION"), CFSTR("MobileBackup"));
          v8 = (id)objc_claimAutoreleasedReturnValue(v15);
        }
        else
        {
          v8 = 0;
        }
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)displayNamesForDomainNames:(id)a3 domainManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  if (!v6)
    sub_100088300();
  v7 = v6;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MBMobileInstallation displayNameForDomain:isSystemDomain:](MBMobileInstallation, "displayNameForDomain:isSystemDomain:", v14, objc_msgSend(v7, "isSystemDomainName:", v14, (_QWORD)v18)));
        if (v16)
          objc_msgSend(v8, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (NSString)safeHarborDir
{
  return self->_safeHarborDir;
}

- (void)setSafeHarborDir:(id)a3
{
  objc_storeStrong((id *)&self->_safeHarborDir, a3);
}

- (MBIgnoredAccountsTracker)accountsTracker
{
  return self->_accountsTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsTracker, 0);
  objc_storeStrong((id *)&self->_safeHarborDir, 0);
}

@end
