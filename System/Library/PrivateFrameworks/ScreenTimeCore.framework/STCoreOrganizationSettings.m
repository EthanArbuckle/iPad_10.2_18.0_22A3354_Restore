@implementation STCoreOrganizationSettings

+ (id)fetchResultsRequestsForChangesToOrganizationSettingsForUserWithDSID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("user.dsid"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLocalOrganizationSettings fetchRequest](STLocalOrganizationSettings, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v3);
  +[STiCloudOrganizationSettings fetchRequest](STiCloudOrganizationSettings, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v3);
  +[STFamilyOrganizationSettings fetchRequest](STFamilyOrganizationSettings, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v3);
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEyeReliefEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STCoreOrganizationSettings primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("isEyeReliefEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else if (_os_feature_enabled_impl())
  {
    -[STCoreOrganizationSettings user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyMemberType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreOrganizationSettings defaultSettingsForFamilyMemberOfType:](self, "defaultSettingsForFamilyMemberOfType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("isEyeReliefEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[STCoreOrganizationSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEyeReliefEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreOrganizationSettings setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isEyeReliefEnabled"));

  -[STCoreOrganizationSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEyeReliefEnabled"));
}

+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("user.familyMemberType"), 0);
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STCoreOrganizationSettings primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("isCommunicationSafetySendingRestricted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else if (_os_feature_enabled_impl())
  {
    -[STCoreOrganizationSettings user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyMemberType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreOrganizationSettings defaultSettingsForFamilyMemberOfType:](self, "defaultSettingsForFamilyMemberOfType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("isCommunicationSafetySendingRestricted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[STCoreOrganizationSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCommunicationSafetySendingRestricted"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreOrganizationSettings setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isCommunicationSafetySendingRestricted"));

  -[STCoreOrganizationSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCommunicationSafetySendingRestricted"));
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("user.familyMemberType"), 0);
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STCoreOrganizationSettings primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("isCommunicationSafetyReceivingRestricted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else if (_os_feature_enabled_impl())
  {
    -[STCoreOrganizationSettings user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyMemberType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreOrganizationSettings defaultSettingsForFamilyMemberOfType:](self, "defaultSettingsForFamilyMemberOfType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("isCommunicationSafetyReceivingRestricted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[STCoreOrganizationSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCommunicationSafetyReceivingRestricted"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreOrganizationSettings setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isCommunicationSafetyReceivingRestricted"));

  -[STCoreOrganizationSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCommunicationSafetyReceivingRestricted"));
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("user.familyMemberType"), 0);
}

- (id)defaultSettingsForFamilyMemberOfType:(id)a3
{
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Child")))
  {
    v5[0] = CFSTR("isEyeReliefEnabled");
    v5[1] = CFSTR("isCommunicationSafetySendingRestricted");
    v6[0] = &unk_1E938D9B8;
    v6[1] = &unk_1E938D9B8;
    v5[2] = CFSTR("isCommunicationSafetyReceivingRestricted");
    v6[2] = &unk_1E938D9B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("class"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("user"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v10, "unsignedIntValue"))
      goto LABEL_5;
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "dsid");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
LABEL_5:
      +[STiCloudOrganizationSettings serializableClassName](STiCloudOrganizationSettings, "serializableClassName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "isEqualToString:", v14);

      if (v15)
      {
        +[STiCloudOrganizationSettings fetchRequest](STiCloudOrganizationSettings, "fetchRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:error:](STiCloudOrganization, "fetchOrCreateiCloudOrganizationWithContext:error:", v8, a5);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = v18;
          goto LABEL_33;
        }
        +[STLog persistence](STLog, "persistence");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.3();
LABEL_29:
        v22 = 0;
LABEL_57:

        goto LABEL_58;
      }
      +[STFamilyOrganizationSettings serializableClassName](STFamilyOrganizationSettings, "serializableClassName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v9, "isEqualToString:", v23);

      if (v24)
      {
        +[STFamilyOrganizationSettings fetchRequest](STFamilyOrganizationSettings, "fetchRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        +[STFamilyOrganization fetchWithContext:error:](STFamilyOrganization, "fetchWithContext:error:", v8, a5);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          +[STLog persistence](STLog, "persistence");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.7();
          goto LABEL_29;
        }
        v19 = v25;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("user.dsid"), v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPredicate:", v26);

      }
      else
      {
        +[STLog persistence](STLog, "persistence");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.8();

        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
            v17 = 0;
            v19 = 0;
            v16 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          v17 = 0;
        }
        else
        {
          v17 = 0;
          v19 = 0;
        }
        v16 = 0;
      }
LABEL_33:
      objc_msgSend(v16, "execute:", a5);
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v28 = v30;
        v31 = -[NSObject count](v30, "count");
        if (v31 == 1)
        {
          +[STLog persistence](STLog, "persistence");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v47 = v7;
            _os_log_impl(&dword_1D22E7000, v41, OS_LOG_TYPE_DEFAULT, "There is already a settings object that matches: %{public}@.", buf, 0xCu);
          }

          -[NSObject firstObject](v28, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (v31)
        {
          +[STLog persistence](STLog, "persistence");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.5();

          if (a5
            && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                v43,
                v43))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
            v22 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
        }
        else
        {
          +[STLog persistence](STLog, "persistence");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v47 = v7;
            _os_log_impl(&dword_1D22E7000, v32, OS_LOG_TYPE_DEFAULT, "There is not already a settings object that matches: %{public}@. A new one will be created", buf, 0xCu);
          }

          +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v8, a5);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v22 = (void *)objc_msgSend([v17 alloc], "initWithContext:", v8);
            objc_msgSend(v22, "setUser:", v33);
            objc_msgSend(v22, "setValue:forKey:", v19, CFSTR("organization"));
          }
          else
          {
            +[STLog persistence](STLog, "persistence");
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.6();

            v22 = 0;
          }

        }
      }
      else
      {
        +[STLog persistence](STLog, "persistence");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.4((uint64_t)a5, v34, v35, v36, v37, v38, v39, v40);

        v22 = 0;
        v28 = v19;
      }
      goto LABEL_57;
    }
    +[STLog persistence](STLog, "persistence");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.2();

    goto LABEL_26;
  }
  +[STLog persistence](STLog, "persistence");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    +[STCoreOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.1();

  if (!a5
    || (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        !v21))
  {
LABEL_26:
    v22 = 0;
    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
  v22 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

  return v22;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("modificationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[STCoreOrganizationSettings setModificationDate:](self, "setModificationDate:", v4);

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)STCoreOrganizationSettings;
  -[STUniquedManagedObject dictionaryRepresentation](&v21, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreOrganizationSettings user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("user"));

  -[STCoreOrganizationSettings passcode](self, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("passcode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings allLimitsEnabled](self, "allLimitsEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("allLimitsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[STCoreOrganizationSettings defaultUserPolicies](self, "defaultUserPolicies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("defaultUserPolicies"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[STCoreOrganizationSettings communicationPolicy](self, "communicationPolicy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("communicationPolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[STCoreOrganizationSettings communicationWhileLimitedPolicy](self, "communicationWhileLimitedPolicy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("communicationWhileLimitedPolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[STCoreOrganizationSettings contactManagementState](self, "contactManagementState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contactManagementState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isCommunicationSafetySendingRestricted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isCommunicationSafetyReceivingRestricted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyNotificationEnabled](self, "isCommunicationSafetyNotificationEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isCommunicationSafetyNotificationEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings isCommunicationSafetyAnalyticsEnabled](self, "isCommunicationSafetyAnalyticsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isCommunicationSafetyAnalyticsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreOrganizationSettings isEyeReliefEnabled](self, "isEyeReliefEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isEyeReliefEnabled"));

  -[STCoreOrganizationSettings modificationDate](self, "modificationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[STCoreOrganizationSettings modificationDate](self, "modificationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("modificationDate"));

  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (void)_changeAppLimitsFromAskToWarn:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("usage-limit")))
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("downtime"));

  if (v6)
  {
LABEL_4:
    objc_msgSend(v3, "configurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v8, "payloadPlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[STLog persistence](STLog, "persistence");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:].cold.1();
      goto LABEL_30;
    }
    v10 = (void *)MEMORY[0x1E0D13488];
    objc_msgSend(v8, "payloadPlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v10, "declarationForData:error:", v11, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v12;
        -[NSObject payloadMode](v14, "payloadMode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D13410]);

        if ((v16 & 1) != 0)
        {
          v17 = (_QWORD *)MEMORY[0x1E0D13420];
LABEL_21:
          objc_msgSend(v12, "setPayloadMode:", *v17);

          +[STLog persistence](STLog, "persistence");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v24;
            _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "Updating configuration payload %{public}@ from ask to warn", buf, 0xCu);

          }
          objc_msgSend(v12, "updateServerHash");
          v26 = v13;
          objc_msgSend(v12, "serializeAsDataWithError:", &v26);
          v14 = objc_claimAutoreleasedReturnValue();
          v18 = v26;

          if (v14)
          {
            objc_msgSend(v8, "setPayloadPlist:", v14);
          }
          else
          {
            +[STLog persistence](STLog, "persistence");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:].cold.3(v8);

          }
          goto LABEL_28;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v12;
          -[NSObject payloadMode](v14, "payloadMode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D13438]);

          if ((v20 & 1) != 0)
          {
            v17 = (_QWORD *)MEMORY[0x1E0D13440];
            goto LABEL_21;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
          v14 = v12;
          -[NSObject payloadMode](v14, "payloadMode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D13428]);

          if (v22)
          {
            v17 = (_QWORD *)MEMORY[0x1E0D13430];
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[STCoreOrganizationSettings _changeAppLimitsFromAskToWarn:].cold.2(v8);
    }
    v18 = v13;
LABEL_28:

    v13 = v18;
    goto LABEL_29;
  }
LABEL_32:

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  void *v9;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[STCoreOrganizationSettings user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreOrganizationSettings passcode](self, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p> ({\n user: %@\n passcode enabled: %d\n allLimitsEnabled: %d\n defaultUserPolicies: %lu\n communicationPolicy: %lld\n communicationWhileLimitedPolicy: %lld\n contactManagementState: %lld\n isCommunicationSafetySendingRestricted: %d\n isCommunicationSafetyReceivingRestricted: %d\n isCommunicationSafetyNotificationEnabled: %d\n isCommunicationSafetyAnalyticsEnabled: %d\n isEyeReliefEnabled: %d\n)}"), v7, self, v3, v4 != 0, -[STCoreOrganizationSettings allLimitsEnabled](self, "allLimitsEnabled"), -[STCoreOrganizationSettings defaultUserPolicies](self, "defaultUserPolicies"), -[STCoreOrganizationSettings communicationPolicy](self, "communicationPolicy"), -[STCoreOrganizationSettings communicationWhileLimitedPolicy](self, "communicationWhileLimitedPolicy"), -[STCoreOrganizationSettings contactManagementState](self, "contactManagementState"), -[STCoreOrganizationSettings isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted"), -[STCoreOrganizationSettings isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted"), -[STCoreOrganizationSettings isCommunicationSafetyNotificationEnabled](self, "isCommunicationSafetyNotificationEnabled"),
    -[STCoreOrganizationSettings isCommunicationSafetyAnalyticsEnabled](self, "isCommunicationSafetyAnalyticsEnabled"), -[STCoreOrganizationSettings isEyeReliefEnabled](self, "isEyeReliefEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Settings payload does not contain a class key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Settings payload does not contain a user dsid and we could not find a local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Cloud organization could not be created: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:(uint64_t)a3 inContext:(uint64_t)a4 error:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to execute search for existing settings: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Settings payload is not supported as a serialized object: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Unable to find local user for:: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Family organization does not exist: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Settings payload is not supported as a serialized object: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_changeAppLimitsFromAskToWarn:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Failed to deserialize configuration payload %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_changeAppLimitsFromAskToWarn:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Failed to serialize configuration payload %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
