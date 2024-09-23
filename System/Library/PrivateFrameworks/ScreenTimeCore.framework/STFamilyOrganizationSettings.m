@implementation STFamilyOrganizationSettings

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STFamilyOrganizationSettings user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "serializableClassName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "serializableClassName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  STVersionVector *v16;
  void *v17;
  STVersionVector *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("user")))
  {
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("passcode")))
  {
    -[STFamilyOrganizationSettings passcode](self, "passcode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[STFamilyOrganizationSettings organization](self, "organization");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "blueprints");
      v18 = (STVersionVector *)objc_claimAutoreleasedReturnValue();

      v22 = -[STVersionVector countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v18);
            v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v26, "users");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[STFamilyOrganizationSettings user](self, "user");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "containsObject:", v28);

            if (v29)
              -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:](self, "_changeAppLimitsFromAskToWarn:", v26);
          }
          v23 = -[STVersionVector countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v23);
      }
      goto LABEL_29;
    }
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("isManaged")))
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("isDirty"))
      || !-[STFamilyOrganizationSettings isDirty](self, "isDirty"))
    {
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings setModificationDate:](self, "setModificationDate:", v15);

    v16 = [STVersionVector alloc];
    -[STFamilyOrganizationSettings versionVector](self, "versionVector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[STVersionVector initWithDataRepresentation:](v16, "initWithDataRepresentation:", v17);

    STGetDeviceUUID();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[STVersionVector incrementNodeWithIdentifier:](v18, "incrementNodeWithIdentifier:", v19);

    -[STVersionVector dataRepresentation](v18, "dataRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings setVersionVector:](self, "setVersionVector:", v20);

LABEL_29:
    goto LABEL_30;
  }
  if ((-[STFamilyOrganizationSettings isManaged](self, "isManaged") & 1) == 0)
  {
    -[STFamilyOrganizationSettings setPasscode:](self, "setPasscode:", 0);
    -[STFamilyOrganizationSettings managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[STFamilyOrganizationSettings user](self, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "usages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          +[STLog screentime](STLog, "screentime");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[STFamilyOrganizationSettings didChangeValueForKey:]";
            v41 = 2112;
            v42 = v13;
            _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting usage (%@)", buf, 0x16u);
          }

          objc_msgSend(v6, "deleteObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v10);
    }

  }
LABEL_30:
  v30.receiver = self;
  v30.super_class = (Class)STFamilyOrganizationSettings;
  -[STFamilyOrganizationSettings didChangeValueForKey:](&v30, sel_didChangeValueForKey_, v4);

}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  STVersionVector *v4;
  STVersionVector *v5;
  void *v6;
  STVersionVector *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  STVersionVector *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  STVersionVector *v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  _BOOL4 v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NSObject *v31;
  NSObject *v32;
  BOOL v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  NSObject *v68;
  char v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  STVersionVector *v79;
  void *v80;
  void *v81;
  id v82;
  objc_super v83;
  uint8_t buf[4];
  NSObject *v85;
  __int16 v86;
  STVersionVector *v87;
  __int16 v88;
  STVersionVector *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = (STVersionVector *)a3;
  v5 = [STVersionVector alloc];
  -[STFamilyOrganizationSettings versionVector](self, "versionVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STVersionVector initWithDataRepresentation:](v5, "initWithDataRepresentation:", v6);

  -[STVersionVector nodes](v7, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("versionVector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STVersionVector initWithDataRepresentation:]([STVersionVector alloc], "initWithDataRepresentation:", v10);
  if (!v7)
    goto LABEL_51;
  +[STLog versionVector](STLog, "versionVector");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[STFamilyOrganizationSettings user](self, "user");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dsid");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v85 = v14;
    v86 = 2112;
    v87 = v7;
    v88 = 2112;
    v89 = v11;
    _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_INFO, "COMPARE SETTINGS (%@): %@ vs %@", buf, 0x20u);

  }
  v15 = -[STVersionVector evaluateCausality:](v7, "evaluateCausality:", v11);
  v16 = v15;
  switch(v15)
  {
    case 1:
      +[STLog versionVector](STLog, "versionVector");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.4();
      break;
    case 3:
      +[STLog versionVector](STLog, "versionVector");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.7();
      break;
    case 2:
      +[STLog versionVector](STLog, "versionVector");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.6();
      break;
    default:
      if (v15)
        goto LABEL_17;
      +[STLog versionVector](STLog, "versionVector");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.5();
      break;
  }

LABEL_17:
  -[STVersionVector join:](v7, "join:", v11);
  -[STVersionVector dataRepresentation](v7, "dataRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyOrganizationSettings setVersionVector:](self, "setVersionVector:", v18);

  switch(v16)
  {
    case 1:
      +[STLog screentime](STLog, "screentime");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_INFO, "Received family settings representation is out of date. Skipping update.", buf, 2u);
      }
      goto LABEL_44;
    case 3:
      +[STLog screentime](STLog, "screentime");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[STFamilyOrganizationSettings dictionaryRepresentation](self, "dictionaryRepresentation");
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v85 = v32;
        v86 = 2112;
        v87 = v4;
        _os_log_impl(&dword_1D22E7000, v31, OS_LOG_TYPE_INFO, "Family settings version clocks equal: %@ \n %@", buf, 0x16u);

      }
      if (v9)
      {
        v33 = 1;
        goto LABEL_82;
      }
      break;
    case 2:
      +[STLog screentime](STLog, "screentime");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v20, OS_LOG_TYPE_DEFAULT, "Settings version clocks concurrent. Most recent modification wins", buf, 2u);
      }

      +[STLog screentime](STLog, "screentime");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[STFamilyOrganizationSettings updateWithDictionaryRepresentation:].cold.3(self, v21);

      +[STLog screentime](STLog, "screentime");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.6();

      -[STFamilyOrganizationSettings modificationDate](self, "modificationDate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modificationDate"));
      v23 = (STVersionVector *)objc_claimAutoreleasedReturnValue();
      +[STLog screentime](STLog, "screentime");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v19 && v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412546;
          v85 = v19;
          v86 = 2112;
          v87 = v23;
          _os_log_impl(&dword_1D22E7000, v24, OS_LOG_TYPE_DEFAULT, "Local modification date = %@, Incoming modification date = %@", buf, 0x16u);
        }

        v26 = -[NSObject compare:](v19, "compare:", v23);
        +[STLog screentime](STLog, "screentime");
        v24 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v26 != -1)
        {
          if (v27)
          {
            *(_DWORD *)buf = 138412546;
            v85 = v19;
            v86 = 2112;
            v87 = v23;
            v28 = "Local settings is more recently modified. We will ignore the received settings. Local = %@, Incoming = %@";
            v29 = v24;
            v30 = 22;
LABEL_42:
            _os_log_impl(&dword_1D22E7000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
            goto LABEL_43;
          }
          goto LABEL_43;
        }
        if (!v27)
          goto LABEL_50;
        *(_DWORD *)buf = 138412546;
        v85 = v19;
        v86 = 2112;
        v87 = v23;
        v34 = "Received settings is more recently modified. We will overwrite the local settings. Local = %@, Incoming = %@";
        v35 = v24;
        v36 = 22;
      }
      else
      {
        if (v19)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            v28 = "Only the local blueprint has a modification date. We will ignore the received blueprint.";
            v29 = v24;
            v30 = 2;
            goto LABEL_42;
          }
LABEL_43:

LABEL_44:
          v33 = 0;
LABEL_81:

          goto LABEL_82;
        }
        if (!v25)
          goto LABEL_50;
        *(_WORD *)buf = 0;
        v34 = "Only the inboud blueprint has a modification date. We will overwrite the local blueprint.";
        v35 = v24;
        v36 = 2;
      }
      _os_log_impl(&dword_1D22E7000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_50:

      break;
  }
LABEL_51:
  v83.receiver = self;
  v83.super_class = (Class)STFamilyOrganizationSettings;
  if (-[STCoreOrganizationSettings updateWithDictionaryRepresentation:](&v83, sel_updateWithDictionaryRepresentation_, v4))
  {
    -[STFamilyOrganizationSettings managedObjectContext](self, "managedObjectContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    +[STFamilyOrganization fetchWithContext:error:](STFamilyOrganization, "fetchWithContext:error:", v37, &v82);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v82;

    v33 = v38 != 0;
    if (!v38)
    {
      +[STLog persistence](STLog, "persistence");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
        -[STiCloudOrganizationSettings updateWithDictionaryRepresentation:].cold.1();
      goto LABEL_80;
    }
    v77 = v38;
    -[STFamilyOrganizationSettings setOrganization:](self, "setOrganization:", v38);
    v71 = -[STFamilyOrganizationSettings isManaged](self, "isManaged");
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isManaged"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings setIsManaged:](self, "setIsManaged:", objc_msgSend(v39, "BOOLValue"));

    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("passcode"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings setPasscode:](self, "setPasscode:", v40);

    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("allLimitsEnabled"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
      -[STFamilyOrganizationSettings setAllLimitsEnabled:](self, "setAllLimitsEnabled:", -[NSObject BOOLValue](v41, "BOOLValue"));
    v76 = v42;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("defaultUserPolicies"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
      -[STFamilyOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", objc_msgSend(v43, "longLongValue"));
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("communicationPolicy"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
      -[STFamilyOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", objc_msgSend(v45, "longLongValue"));
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("communicationWhileLimitedPolicy"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
      -[STFamilyOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", objc_msgSend(v47, "longLongValue"));
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("contactManagementState"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v48;
    v81 = v49;
    if (v49)
    {
      v50 = v46;
      v51 = objc_msgSend(v49, "longLongValue");
      v52 = v51 == -[STFamilyOrganizationSettings contactManagementState](self, "contactManagementState");
      v46 = v50;
      if (!v52)
        -[STFamilyOrganizationSettings setContactManagementState:](self, "setContactManagementState:", objc_msgSend(v81, "longLongValue"));
    }
    v80 = v10;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetySendingRestricted"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
      -[STCoreOrganizationSettings setIsCommunicationSafetySendingRestricted:](self, "setIsCommunicationSafetySendingRestricted:", objc_msgSend(v53, "BOOLValue"));
    v79 = v11;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyReceivingRestricted"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v55)
      -[STCoreOrganizationSettings setIsCommunicationSafetyReceivingRestricted:](self, "setIsCommunicationSafetyReceivingRestricted:", objc_msgSend(v55, "BOOLValue"));
    v75 = v44;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyNotificationEnabled"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
      -[STFamilyOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", objc_msgSend(v57, "BOOLValue"));
    v72 = v58;
    v78 = v19;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyAnalyticsEnabled"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v59)
      -[STFamilyOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", objc_msgSend(v59, "BOOLValue"));
    v73 = v54;
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isEyeReliefEnabled"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v61)
      -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", objc_msgSend(v61, "BOOLValue"));
    -[STVersionVector objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("isAppAndWebsiteActivityEnabled"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (!v63)
    {
      v70 = -[STFamilyOrganizationSettings isManaged](self, "isManaged");
      if ((v71 & 1) != 0)
      {
        if ((v70 & 1) != 0)
          goto LABEL_76;
        v64 = (void *)MEMORY[0x1E0C9AAA0];
      }
      else
      {
        if ((v70 & 1) == 0)
          goto LABEL_76;
        v64 = (void *)MEMORY[0x1E0C9AAB0];
      }
    }
    -[STFamilyOrganizationSettings setIsAppAndWebsiteActivityEnabled:](self, "setIsAppAndWebsiteActivityEnabled:", v64);
LABEL_76:
    -[STVersionVector dataRepresentation](v7, "dataRepresentation");
    v65 = v33;
    v66 = v46;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyOrganizationSettings setVersionVector:](self, "setVersionVector:", v67);

    v33 = v65;
    v11 = v79;
    v10 = v80;
    v38 = v77;
    v19 = v78;
    v68 = v76;
LABEL_80:

    goto LABEL_81;
  }
  v33 = 0;
LABEL_82:

  return v33;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v16.receiver = self;
  v16.super_class = (Class)STFamilyOrganizationSettings;
  -[STCoreOrganizationSettings dictionaryRepresentation](&v16, sel_dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  -[STFamilyOrganizationSettings organization](self, "organization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("organization"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STFamilyOrganizationSettings isManaged](self, "isManaged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("isManaged"));

  -[STFamilyOrganizationSettings versionVector](self, "versionVector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("versionVector"));

  -[STFamilyOrganizationSettings isAppAndWebsiteActivityEnabled](self, "isAppAndWebsiteActivityEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[STFamilyOrganizationSettings isAppAndWebsiteActivityEnabled](self, "isAppAndWebsiteActivityEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("isAppAndWebsiteActivityEnabled"));

  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)STFamilyOrganizationSettings;
  -[STCoreOrganizationSettings description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STFamilyOrganizationSettings isDirty](self, "isDirty");
  v6 = -[STFamilyOrganizationSettings isManaged](self, "isManaged");
  v7 = -[STFamilyOrganizationSettings shareWebUsage](self, "shareWebUsage");
  -[STFamilyOrganizationSettings isAppAndWebsiteActivityEnabled](self, "isAppAndWebsiteActivityEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, ({\n isDirty: %d\n isManaged: %d\n shareWebUsage: %d\n isAppAndWebsiteActivityEnabled: %@\n})"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("famset");
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_1D22E7000, a2, v4, "L: %@", v5);

}

- (void)updateWithDictionaryRepresentation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Local newer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)updateWithDictionaryRepresentation:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Local older", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)updateWithDictionaryRepresentation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Concurrent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)updateWithDictionaryRepresentation:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, v0, v1, "Local equal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
