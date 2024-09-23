@implementation STLocalOrganizationSettings

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
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)STLocalOrganizationSettings;
  if (-[STCoreOrganizationSettings updateWithDictionaryRepresentation:](&v38, sel_updateWithDictionaryRepresentation_, v4))
  {
    -[STLocalOrganizationSettings managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    +[STLocalOrganization fetchOrCreateLocalOrganizationWithContext:error:](STLocalOrganization, "fetchOrCreateLocalOrganizationWithContext:error:", v5, &v37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;

    v8 = v6 != 0;
    if (v6)
    {
      -[STLocalOrganizationSettings setOrganization:](self, "setOrganization:", v6);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passcode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STLocalOrganizationSettings setPasscode:](self, "setPasscode:", v9);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoveryAltDSID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STLocalOrganizationSettings setRecoveryAltDSID:](self, "setRecoveryAltDSID:", v10);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allLimitsEnabled"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        -[STLocalOrganizationSettings setAllLimitsEnabled:](self, "setAllLimitsEnabled:", -[NSObject BOOLValue](v11, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultUserPolicies"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        -[STLocalOrganizationSettings setDefaultUserPolicies:](self, "setDefaultUserPolicies:", objc_msgSend(v13, "longLongValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("communicationPolicy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        -[STLocalOrganizationSettings setCommunicationPolicy:](self, "setCommunicationPolicy:", objc_msgSend(v15, "longLongValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("communicationWhileLimitedPolicy"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        -[STLocalOrganizationSettings setCommunicationWhileLimitedPolicy:](self, "setCommunicationWhileLimitedPolicy:", objc_msgSend(v17, "longLongValue"));
      v34 = v16;
      v35 = v14;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactManagementState"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = objc_msgSend(v19, "longLongValue");
        if (v21 != -[STLocalOrganizationSettings contactManagementState](self, "contactManagementState"))
          -[STLocalOrganizationSettings setContactManagementState:](self, "setContactManagementState:", objc_msgSend(v20, "longLongValue"));
      }
      v36 = v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetySendingRestricted"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        -[STCoreOrganizationSettings setIsCommunicationSafetySendingRestricted:](self, "setIsCommunicationSafetySendingRestricted:", objc_msgSend(v22, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyReceivingRestricted"), v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        -[STCoreOrganizationSettings setIsCommunicationSafetyReceivingRestricted:](self, "setIsCommunicationSafetyReceivingRestricted:", objc_msgSend(v24, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyNotificationEnabled"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
        -[STLocalOrganizationSettings setIsCommunicationSafetyNotificationEnabled:](self, "setIsCommunicationSafetyNotificationEnabled:", objc_msgSend(v26, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunicationSafetyAnalyticsEnabled"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        -[STLocalOrganizationSettings setIsCommunicationSafetyAnalyticsEnabled:](self, "setIsCommunicationSafetyAnalyticsEnabled:", objc_msgSend(v28, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEyeReliefEnabled"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
        -[STCoreOrganizationSettings setIsEyeReliefEnabled:](self, "setIsEyeReliefEnabled:", objc_msgSend(v30, "BOOLValue"));

      v8 = 1;
      v7 = v36;
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[STLocalOrganizationSettings updateWithDictionaryRepresentation:].cold.1();
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
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v12.receiver = self;
  v12.super_class = (Class)STLocalOrganizationSettings;
  -[STCoreOrganizationSettings dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[STLocalOrganizationSettings organization](self, "organization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("organization"));

  -[STLocalOrganizationSettings recoveryAltDSID](self, "recoveryAltDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("recoveryAltDSID"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("passcode")))
  {
    -[STLocalOrganizationSettings setNeedsToSetPasscode:](self, "setNeedsToSetPasscode:", 0);
    -[STLocalOrganizationSettings passcode](self, "passcode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[STLocalOrganizationSettings organization](self, "organization");
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
            -[STLocalOrganizationSettings user](self, "user");
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
  v16.super_class = (Class)STLocalOrganizationSettings;
  -[STLocalOrganizationSettings didChangeValueForKey:](&v16, sel_didChangeValueForKey_, v4);

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
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "could not fetch local organization: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
