@implementation STUserDeviceState

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STUserDeviceState;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequestMatchingLocalUserDeviceState
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("localUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchOrCreateLocalUserDeviceStateInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  STUserDeviceState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  STCoreUser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  STUserDeviceState *v22;
  void *v23;
  void *v24;
  char v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("cannot fetch or create Local User Device state with simplified agent"), CFSTR("cannot fetch or create Local User Device state with simplified agent"));
  +[STCoreDevice fetchOrCreateLocalDeviceInContext:error:](STCoreDevice, "fetchOrCreateLocalDeviceInContext:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "fetchLocalUserDeviceStateInContext:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "setDevice:", v7);
      objc_msgSend(v9, "setLocalDevice:", v7);
      v10 = v9;
    }
    else
    {
      +[STCoreUser fetchRequest](STCoreUser, "fetchRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3880];
      +[STUserDescription currentUser](STUserDescription, "currentUser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K == %@ OR %K == %@"), CFSTR("dsid"), &unk_1E938DA60, CFSTR("dsid"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPredicate:", v15);

      objc_msgSend(v6, "executeFetchRequest:error:", v11, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "firstObject");
        v18 = (STCoreUser *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          v18 = -[STCoreUser initWithContext:]([STCoreUser alloc], "initWithContext:", v6);
        +[STLog screentime](STLog, "screentime");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[STCoreUser dsid](v18, "dsid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446722;
          v28 = "+[STUserDeviceState fetchOrCreateLocalUserDeviceStateInContext:error:]";
          v29 = 2112;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating UserDeviceState for user: (%@), deviceIdentifier: (%@)", buf, 0x20u);

        }
        v22 = -[STUserDeviceState initWithContext:]([STUserDeviceState alloc], "initWithContext:", v6);
        -[STUserDeviceState setUser:](v22, "setUser:", v18);
        -[STUserDeviceState setLocalUser:](v22, "setLocalUser:", v18);
        -[STUserDeviceState setDevice:](v22, "setDevice:", v7);
        -[STUserDeviceState setLocalDevice:](v22, "setLocalDevice:", v7);
        objc_msgSend(a1, "_getCoreDuetIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[STUserDeviceState coreDuetIdentifier](v22, "coreDuetIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if ((v25 & 1) == 0)
            -[STUserDeviceState setCoreDuetIdentifier:](v22, "setCoreDuetIdentifier:", v23);
        }
        v10 = v22;

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fetchLocalUserDeviceStateInContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequestMatchingLocalUserDeviceState", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(a1, "_getCoreDuetIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "coreDuetIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
          objc_msgSend(v9, "setCoreDuetIdentifier:", v10);
      }
      v13 = v9;

    }
    else if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("No local user device state found in the database");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 12, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_getCoreDuetIdentifier
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[STUserDeviceState isUnitTestRunning](STUserDeviceState, "isUnitTestRunning"))
    return CFSTR("testCoreDuetIndentifier");
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0DC5E60], "getLocalDeviceIdentifierAndReturnError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  +[STLog usage](STLog, "usage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "STUserDeviceState setting coreduetIdentifier %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    +[STUserDeviceState _getCoreDuetIdentifier].cold.1((uint64_t)v4, v6);
  }

  return v3;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("device")))
  {
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("uniqueIdentifier")))
  {
    -[STUserDeviceState installedApps](self, "installedApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_updateUniqueIdentifier);

  }
  v6.receiver = self;
  v6.super_class = (Class)STUserDeviceState;
  -[STUserDeviceState didChangeValueForKey:](&v6, sel_didChangeValueForKey_, v4);

}

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v4, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  STInstalledApp *v44;
  void *v45;
  STInstalledApp *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id obj;
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
  __int128 v82;
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capabilitiesPlist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setCapabilitiesPlist:](self, "setCapabilitiesPlist:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreDuetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setCoreDuetIdentifier:](self, "setCoreDuetIdentifier:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfoPlist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setDeviceInfoPlist:](self, "setDeviceInfoPlist:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("managementEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setManagementEnabled:](self, "setManagementEnabled:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passcodeOwner"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setPasscodeOwner:](self, "setPasscodeOwner:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenTimeEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setScreenTimeEnabled:](self, "setScreenTimeEnabled:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastFamilyCheckinDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState setLastFamilyCheckinDate:](self, "setLastFamilyCheckinDate:", v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("platform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fromCloud"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "BOOLValue") ^ 1;
  }
  else
  {
    -[STUserDeviceState user](self, "user");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "isManaged");

  }
  -[STUserDeviceState device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", v13);
  if (objc_msgSend(v19, "platform"))
  {
    if (!v17)
      goto LABEL_39;
  }
  else
  {
    objc_msgSend(v19, "setPlatform:", (__int16)objc_msgSend(v14, "integerValue"));
    if (!v17)
      goto LABEL_39;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installedApps"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v69 = v4;
  v65 = v13;
  v66 = v12;
  v61 = (void *)v20;
  v62 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v22 = (void *)v21;
  v63 = v16;
  v64 = v14;
  -[STUserDeviceState installedApps](self, "installedApps");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKeyPath:", CFSTR("bundleIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  v67 = v25;
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  v68 = v22;
  objc_msgSend(v26, "minusSet:", v22);
  -[STUserDeviceState installedApps](self, "installedApps");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v26;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("bundleIdentifier"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "filteredSetUsingPredicate:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v29;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v80 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
        +[STLog screentime](STLog, "screentime");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v86 = "-[STUserDeviceState updateWithDictionaryRepresentation:]";
          v87 = 2112;
          v88 = v34;
          _os_log_impl(&dword_1D22E7000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting app (%@)", buf, 0x16u);
        }

        -[STUserDeviceState managedObjectContext](self, "managedObjectContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "deleteObject:", v34);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    }
    while (v31);
  }

  v37 = (void *)objc_msgSend(v68, "mutableCopy");
  objc_msgSend(v37, "minusSet:", v67);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v38 = v37;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v76 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
        v44 = [STInstalledApp alloc];
        -[STUserDeviceState managedObjectContext](self, "managedObjectContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[STInstalledApp initWithContext:](v44, "initWithContext:", v45);

        -[STInstalledApp setBundleIdentifier:](v46, "setBundleIdentifier:", v43);
        -[STInstalledApp setUserDeviceState:](v46, "setUserDeviceState:", self);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v40);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.metadata"), CFSTR("installedApps"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[STUserDeviceState installedApps](self, "installedApps");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v72 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
        objc_msgSend(v54, "displayName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
        {
          objc_msgSend(v54, "bundleIdentifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("displayName"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58)
            objc_msgSend(v54, "setDisplayName:", v58);

        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v51);
  }

  v4 = v69;
  v13 = v65;
  v12 = v66;
  v16 = v63;
  v14 = v64;
  v19 = v62;
LABEL_39:

  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;
  _QWORD v65[3];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)STUserDeviceState;
  -[STUniquedManagedObject dictionaryRepresentation](&v62, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState capabilitiesPlist](self, "capabilitiesPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("capabilitiesPlist"));

  -[STUserDeviceState coreDuetIdentifier](self, "coreDuetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreDuetIdentifier"));

  -[STUserDeviceState deviceInfoPlist](self, "deviceInfoPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceInfoPlist"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STUserDeviceState managementEnabled](self, "managementEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("managementEnabled"));

  -[STUserDeviceState passcodeOwner](self, "passcodeOwner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("passcodeOwner"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STUserDeviceState screenTimeEnabled](self, "screenTimeEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("screenTimeEnabled"));

  -[STUserDeviceState lastFamilyCheckinDate](self, "lastFamilyCheckinDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("lastFamilyCheckinDate"));

  -[STUserDeviceState device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    +[STLog screentime](STLog, "screentime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[STUserDeviceState dictionaryRepresentation].cold.1((uint64_t)self, v14, v21, v22, v23, v24, v25, v26);
    goto LABEL_7;
  }
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    +[STLog screentime](STLog, "screentime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[STUserDeviceState dictionaryRepresentation].cold.2((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
LABEL_7:

  }
  v65[0] = CFSTR("identifier");
  objc_msgSend(v12, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v27;
  v65[1] = CFSTR("name");
  objc_msgSend(v12, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v28;
  v65[2] = CFSTR("platform");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v12, "platform"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("device"));

  -[STUserDeviceState user](self, "user");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dsid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("user"));

  if ((_os_feature_enabled_impl() & 1) != 0
    || (-[STUserDeviceState user](self, "user"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend(v33, "isManaged"),
        v33,
        v34))
  {
    v56 = v12;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v35 = objc_claimAutoreleasedReturnValue();
    -[STUserDeviceState installedApps](self, "installedApps");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "valueForKeyPath:", CFSTR("bundleIdentifier"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)v35;
    v64 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sortedArrayUsingDescriptors:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v3;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("installedApps"));

    v54 = v37;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[STUserDeviceState installedApps](self, "installedApps");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v59 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "displayName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("displayName"));

          v49 = (void *)objc_msgSend(v47, "copy");
          objc_msgSend(v46, "bundleIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v49, v50);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v43);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.metadata"), CFSTR("installedApps"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v57;
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v40, v51);

    v12 = v56;
  }
  v52 = (void *)objc_msgSend(v3, "copy");

  return v52;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  STUserDeviceState *v18;
  uint64_t v19;
  void *v20;
  STUsage *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  STUsage *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("user"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToNumber:", &unk_1E938DA60))
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v8, a5);
  else
    +[STCoreUser fetchUserWithDSID:inContext:error:](STCoreUser, "fetchUserWithDSID:inContext:error:", v10, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "fetchRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("user"), v13, CFSTR("device.identifier"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "execute:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      objc_msgSend(v16, "firstObject");
      v18 = (STUserDeviceState *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_13:

        goto LABEL_14;
      }
      +[STCoreDevice fetchOrCreateDeviceWithIdentifier:inContext:error:](STCoreDevice, "fetchOrCreateDeviceWithIdentifier:inContext:error:", v12, v8, a5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        v21 = -[STUsage initWithContext:]([STUsage alloc], "initWithContext:", v8);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsage setLastUpdatedDate:](v21, "setLastUpdatedDate:", v22);

        -[STUsage setDevice:](v21, "setDevice:", v20);
        -[STUsage setUser:](v21, "setUser:", v13);
        +[STLog screentime](STLog, "screentime");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "dsid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v21;
          objc_msgSend(v20, "identifier");
          *(_DWORD *)buf = 136446722;
          v29 = "+[STUserDeviceState fetchOrCreateWithDictionaryRepresentation:inContext:error:]";
          v30 = 2112;
          v31 = v26;
          v32 = 2112;
          v33 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v33;
          _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating UserDeviceState for user: (%@), deviceIdentifier: (%@)", buf, 0x20u);

          v21 = v27;
        }

        v18 = -[STUserDeviceState initWithContext:]([STUserDeviceState alloc], "initWithContext:", v8);
        -[STUserDeviceState setUser:](v18, "setUser:", v13);
        -[STUserDeviceState setDevice:](v18, "setDevice:", v20);

        goto LABEL_13;
      }
    }
    v18 = 0;
    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("uds");
}

+ (BOOL)isUnitTestRunning
{
  return NSClassFromString(CFSTR("XCTestProbe")) != 0;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUserDeviceState;
  v5 = -[STUserDeviceState validateForUpdate:](&v9, sel_validateForUpdate_);
  if (!v5)
    return v5;
  if (!_os_feature_enabled_impl())
    goto LABEL_9;
  v5 = -[STUserDeviceState _validateCoreDuetIdentifier:](self, "_validateCoreDuetIdentifier:", a3);
  if (!v5)
    return v5;
  v5 = -[STUserDeviceState _validateNumberOfLocalUserDeviceStates:](self, "_validateNumberOfLocalUserDeviceStates:", a3);
  if (!v5)
    return v5;
  -[STUserDeviceState localUser](self, "localUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_8;
  }
  -[STUserDeviceState localDevice](self, "localDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
LABEL_8:
  v5 = -[STUserDeviceState _validateLocalUserDeviceState:](self, "_validateLocalUserDeviceState:", a3);
  if (v5)
    goto LABEL_9;
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUserDeviceState;
  v5 = -[STUserDeviceState validateForInsert:](&v9, sel_validateForInsert_);
  if (!v5)
    return v5;
  if (!_os_feature_enabled_impl())
    goto LABEL_9;
  v5 = -[STUserDeviceState _validateCoreDuetIdentifier:](self, "_validateCoreDuetIdentifier:", a3);
  if (!v5)
    return v5;
  v5 = -[STUserDeviceState _validateNumberOfLocalUserDeviceStates:](self, "_validateNumberOfLocalUserDeviceStates:", a3);
  if (!v5)
    return v5;
  -[STUserDeviceState localUser](self, "localUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_8;
  }
  -[STUserDeviceState localDevice](self, "localDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
LABEL_8:
  v5 = -[STUserDeviceState _validateLocalUserDeviceState:](self, "_validateLocalUserDeviceState:", a3);
  if (v5)
    goto LABEL_9;
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUserDeviceState;
  v5 = -[STUserDeviceState validateForDelete:](&v7, sel_validateForDelete_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STUserDeviceState _validateNumberOfLocalUserDeviceStates:](self, "_validateNumberOfLocalUserDeviceStates:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_validateLocalUserDeviceState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[STUserDeviceState device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState localDevice](self, "localDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    if (!a3)
      return 0;
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("The local device must match the device of the UserDeviceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 527, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v27 = v8;
    v28 = CFSTR("The local device must match the device of the UserDeviceState.");
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v28;
    v14 = &v27;
    goto LABEL_9;
  }
  -[STUserDeviceState user](self, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserDeviceState localUser](self, "localUser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v16)
    return 1;
  if (a3)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("The local user must match the user of the UserDeviceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 527, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v23 = v18;
      v24 = CFSTR("The local user must match the user of the UserDeviceState.");
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v24;
      v14 = &v23;
LABEL_9:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 527, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
}

- (BOOL)_validateNumberOfLocalUserDeviceStates:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  +[STUserDeviceState fetchRequest](STUserDeviceState, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL OR %K != NULL"), CFSTR("localUser"), CFSTR("localDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "execute:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_12;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    if (objc_msgSend(v7, "count"))
    {
      LOBYTE(a3) = 1;
    }
    else if (a3)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("There must be a local user device state.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 528, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v22 = v17;
        v23 = CFSTR("There must be a local user device state.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        v15 = 528;
        goto LABEL_11;
      }
LABEL_12:
      LOBYTE(a3) = 0;
    }
  }
  else if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("There must be one and only local UserDeviceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 529, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v26 = v9;
      v27 = CFSTR("There must be one and only local UserDeviceState.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = 529;
LABEL_11:
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v15, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_12;
  }

  return (char)a3;
}

- (BOOL)_validateCoreDuetIdentifier:(id *)a3
{
  void *v3;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[STUserDeviceState device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "platform");
  if (v7 != 2)
  {
    -[STUserDeviceState device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "platform") != 1)
    {

      return 1;
    }
  }
  -[STUserDeviceState coreDuetIdentifier](self, "coreDuetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 != 2)
  if (v9)
    return 1;
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("There must be a CoreDuet identifier for UserDeviceStates.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 530, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = v11;
      v18 = CFSTR("There must be a CoreDuet identifier for UserDeviceStates.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 530, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
}

+ (void)_getCoreDuetIdentifier
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "STUserDeviceState failed to fetch coreduetIdentifier %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, a2, a3, "-[STUserDeviceState dictionaryRepresentation] called when device.identifier = nil : %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
