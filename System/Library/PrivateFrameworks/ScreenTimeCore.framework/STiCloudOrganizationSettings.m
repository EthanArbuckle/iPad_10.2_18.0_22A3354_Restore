@implementation STiCloudOrganizationSettings

- (id)computeUniqueIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "serializableClassName");
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)STiCloudOrganizationSettings;
  if (-[STCoreOrganizationSettings updateWithDictionaryRepresentation:](&v42, sel_updateWithDictionaryRepresentation_, v4))
  {
    -[STiCloudOrganizationSettings managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:error:](STiCloudOrganization, "fetchOrCreateiCloudOrganizationWithContext:error:", v5, &v41);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    v8 = v6 != 0;
    if (v6)
    {
      -[STiCloudOrganizationSettings setOrganization:](self, "setOrganization:", v6);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passcode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STiCloudOrganizationSettings setPasscode:](self, "setPasscode:", v9);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoveryAltDSID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STiCloudOrganizationSettings setRecoveryAltDSID:](self, "setRecoveryAltDSID:", v10);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allLimitsEnabled"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        -[STiCloudOrganizationSettings setAllLimitsEnabled:](self, "setAllLimitsEnabled:", -[NSObject BOOLValue](v11, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultUserPolicies"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        -[STiCloudOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", objc_msgSend(v13, "longLongValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("communicationPolicy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        -[STiCloudOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", objc_msgSend(v15, "longLongValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("communicationWhileLimitedPolicy"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        -[STiCloudOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", objc_msgSend(v17, "longLongValue"));
      v38 = v14;
      v39 = v12;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactManagementState"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = objc_msgSend(v19, "longLongValue");
        if (v21 != -[STiCloudOrganizationSettings contactManagementState](self, "contactManagementState"))
          -[STiCloudOrganizationSettings setContactManagementState:](self, "setContactManagementState:", objc_msgSend(v20, "longLongValue"));
      }
      v37 = v16;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetySendingRestricted"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        -[STCoreOrganizationSettings setIsCommunicationSafetySendingRestricted:](self, "setIsCommunicationSafetySendingRestricted:", objc_msgSend(v22, "BOOLValue"));
      v36 = v18;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyReceivingRestricted"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        -[STCoreOrganizationSettings setIsCommunicationSafetyReceivingRestricted:](self, "setIsCommunicationSafetyReceivingRestricted:", objc_msgSend(v24, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyNotificationEnabled"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
        -[STiCloudOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", objc_msgSend(v26, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyAnalyticsEnabled"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        -[STiCloudOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", objc_msgSend(v28, "BOOLValue"));
      v40 = v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEyeReliefEnabled"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
        -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", objc_msgSend(v30, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppAndWebsiteActivityEnabled"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
        -[STiCloudOrganizationSettings setIsAppAndWebsiteActivityEnabled:](self, "setIsAppAndWebsiteActivityEnabled:", objc_msgSend(v32, "BOOLValue"));
      -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");

      v8 = 1;
      v34 = v39;
      v7 = v40;
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[STiCloudOrganizationSettings updateWithDictionaryRepresentation:].cold.1();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v13.receiver = self;
  v13.super_class = (Class)STiCloudOrganizationSettings;
  -[STCoreOrganizationSettings dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STiCloudOrganizationSettings isAppAndWebsiteActivityEnabled](self, "isAppAndWebsiteActivityEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("isAppAndWebsiteActivityEnabled"));

  -[STiCloudOrganizationSettings organization](self, "organization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("organization"));

  -[STiCloudOrganizationSettings recoveryAltDSID](self, "recoveryAltDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("recoveryAltDSID"));

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("user")))
  {
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("passcode")))
  {
    -[STiCloudOrganizationSettings passcode](self, "passcode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[STiCloudOrganizationSettings organization](self, "organization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "blueprints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v12, "users");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[STiCloudOrganizationSettings user](self, "user");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "containsObject:", v14);

            if (v15)
              -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:](self, "_changeAppLimitsFromAskToWarn:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)STiCloudOrganizationSettings;
  -[STiCloudOrganizationSettings didChangeValueForKey:](&v16, sel_didChangeValueForKey_, v4);

}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("icset");
}

- (void)updateWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to fetch organization: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
