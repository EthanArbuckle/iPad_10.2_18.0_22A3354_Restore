@implementation STCoreUser

- (BOOL)isCommunicationSafetySendingRestricted
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCommunicationSafetySendingRestricted");

  return v3;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCommunicationSafetyNotificationEnabled");

  return v3;
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCommunicationSafetyReceivingRestricted");

  return v3;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCommunicationSafetyAnalyticsEnabled");

  return v3;
}

- (int64_t)communicationPolicy
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "communicationPolicy");
  else
    v4 = 0;

  return v4;
}

- (int64_t)communicationWhileLimitedPolicy
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "communicationWhileLimitedPolicy");
  else
    v4 = 0;

  return v4;
}

- (STCoreOrganizationSettings)unmodeledManagingOrganizationSettings
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (!_os_feature_enabled_impl())
  {
    -[STCoreUser localSettings](self, "localSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreUser familySettings](self, "familySettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreUser cloudSettings](self, "cloudSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isManaged"))
    {
      v11 = v9;
      goto LABEL_12;
    }
    if (v10)
    {
      v11 = v10;
      goto LABEL_12;
    }
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FD8]);

      if (v14 == 2)
      {
        v7 = 0;
        goto LABEL_13;
      }
      v11 = v8;
LABEL_12:
      v7 = v11;
LABEL_13:

      return (STCoreOrganizationSettings *)v7;
    }
    -[STCoreUser managedObjectContext](self, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v15, &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;

    if (v16)
    {
      if (objc_msgSend(v16, "screenTimeEnabled"))
      {
        v7 = v8;
LABEL_27:

        goto LABEL_13;
      }
    }
    else
    {
      +[STLog screentime](STLog, "screentime");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[STCoreUser(UnmodeledInternal) unmodeledManagingOrganizationSettings].cold.2();

    }
    v7 = 0;
    goto LABEL_27;
  }
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__6;
    v25 = __Block_byref_object_dispose__6;
    v26 = 0;
    -[STCoreUser managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke;
    v20[3] = &unk_1E9370A58;
    v20[4] = self;
    v20[5] = &v21;
    objc_msgSend(v4, "performBlockAndWait:", v20);

    v5 = (void *)v22[5];
    if (!v5)
    {
      +[STLog screentime](STLog, "screentime");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[STCoreUser(UnmodeledInternal) unmodeledManagingOrganizationSettings].cold.1();

      v5 = (void *)v22[5];
    }
    v7 = v5;
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    -[STCoreUser familySettings](self, "familySettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (STCoreOrganizationSettings *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberType, 0);
}

+ (id)fetchLocalUserInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fetchRequestMatchingLocalUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
      {
        v14 = v16;
        v15 = v14;
      }
      else
      {
        if (a4)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB2D50];
          v26 = *MEMORY[0x1E0CB2D50];
          v27 = CFSTR("There must be at least one local user object.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 10, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v24 = v18;
            v25 = CFSTR("There must be at least one local user object.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 10, v22);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v15 = 0;
      }
      goto LABEL_13;
    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("There must be one and only one local user object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 508, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v28 = v10;
        v29 = CFSTR("There must be one and only one local user object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 508, v14);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)fetchRequestMatchingLocalUser
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("localUserDeviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

- (STCoreUser)initWithFamilyMemberType:(id)a3 context:(id)a4
{
  NSString *v6;
  STCoreUser *v7;
  NSString *familyMemberType;
  objc_super v10;

  v6 = (NSString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)STCoreUser;
  v7 = -[STCoreUser initWithContext:](&v10, sel_initWithContext_, a4);
  familyMemberType = v7->_familyMemberType;
  v7->_familyMemberType = v6;

  return v7;
}

- (void)updateWithDescription:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "userDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
  {
    -[STCoreUser dsid](self, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v30, "userDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCoreUser setDsid:](self, "setDsid:", v9);

    }
    -[STCoreUser altDSID](self, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userAltDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v30, "userAltDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCoreUser setAltDSID:](self, "setAltDSID:", v13);

    }
    -[STCoreUser givenName](self, "givenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "givenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v30, "givenName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCoreUser setGivenName:](self, "setGivenName:", v17);

    }
    -[STCoreUser familyName](self, "familyName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "familyName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    v21 = v30;
    if ((v20 & 1) == 0)
    {
      objc_msgSend(v30, "familyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCoreUser setFamilyName:](self, "setFamilyName:", v22);

LABEL_26:
      v21 = v30;
    }
  }
  else
  {
    -[STCoreUser givenName](self, "givenName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      -[STCoreUser setGivenName:](self, "setGivenName:", 0);
    -[STCoreUser familyName](self, "familyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      -[STCoreUser setFamilyName:](self, "setFamilyName:", 0);
    -[STCoreUser familyMemberType](self, "familyMemberType");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v25 != CFSTR("Unknown"))
      -[STCoreUser setFamilyMemberType:](self, "setFamilyMemberType:", CFSTR("Unknown"));
    if (-[STCoreUser isParent](self, "isParent"))
      -[STCoreUser setIsParent:](self, "setIsParent:", 0);
    if (-[STCoreUser isFamilyOrganizer](self, "isFamilyOrganizer"))
      -[STCoreUser setIsFamilyOrganizer:](self, "setIsFamilyOrganizer:", 0);
    -[STCoreUser dsid](self, "dsid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToNumber:", &unk_1E938D9D0);

    if ((v27 & 1) == 0)
      -[STCoreUser setDsid:](self, "setDsid:", &unk_1E938D9D0);
    -[STCoreUser altDSID](self, "altDSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      -[STCoreUser setAltDSID:](self, "setAltDSID:", 0);
    v29 = -[STCoreUser supportsEncryption](self, "supportsEncryption");
    v21 = v30;
    if (v29)
    {
      -[STCoreUser setSupportsEncryption:](self, "setSupportsEncryption:", 0);
      goto LABEL_26;
    }
  }

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("dsid")))
  {
    -[STCoreUser userDeviceStates](self, "userDeviceStates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_updateUniqueIdentifier);

    -[STCoreUser familySettings](self, "familySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateUniqueIdentifier");

  }
  v7.receiver = self;
  v7.super_class = (Class)STCoreUser;
  -[STCoreUser didChangeValueForKey:](&v7, sel_didChangeValueForKey_, v4);

}

+ (id)fetchUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[STCoreUser fetchRequestForUsersWithDSID:](STCoreUser, "fetchRequestForUsersWithDSID:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 11, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fetchUserWithAppleID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[STCoreUser fetchRequestMatchingAppleID:](STCoreUser, "fetchRequestMatchingAppleID:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 11, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STCoreUser;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequestMatchingUmanagedRemoteAdults
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL AND (%K == %@ OR %K == %@) AND (%K == nil OR %K == NO)"), CFSTR("localUserDeviceState"), CFSTR("familyMemberType"), CFSTR("Unknown"), CFSTR("familyMemberType"), CFSTR("Adult"), CFSTR("familySettings"), CFSTR("familySettings.isManaged"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchRequestForUsersWithDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("dsid"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

+ (id)fetchRequestForFamilyMembers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("familySettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dsid"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  return v2;
}

+ (id)fetchRequestMatchingAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("appleID"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  +[STLog persistence](STLog, "persistence");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Notify server of Screen Time state change", buf, 2u);
  }

  v6 = objc_alloc(MEMORY[0x1E0D20EC8]);
  -[STCoreUser dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFamilyMemberDSID:flag:enabled:", v7, *MEMORY[0x1E0D20E80], v3);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke;
  v10[3] = &unk_1E9371428;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "startRequestWithCompletionHandler:", v10);

}

void __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STLog persistence](STLog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke_cold_1();

  }
}

- (id)_contactStoreForUser
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (id)objc_opt_new();
  -[STCoreUser altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D20E98]);
    v12[0] = CFSTR("member-first-name");
    -[STCoreUser givenName](self, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v12[1] = CFSTR("member-dsid");
    -[STCoreUser dsid](self, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = CFSTR("member-altDSID");
    v13[1] = v8;
    v13[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithDictionaryRepresentation:", v9);

    objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[STCoreUser _contactStoreForUser].cold.1();
    v11 = 0;
  }

  return v11;
}

- (id)_primaryContainerInContactStore:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "defaultContainerIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)MEMORY[0x1E0C972C0];
      v22[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateForContainersWithIdentifiers:", v16);
      v8 = objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    +[STLog persistence](STLog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STCoreUser _primaryContainerInContactStore:withError:].cold.1();
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  v8 = objc_opt_new();
  -[NSObject aa_primaryAppleAccount](v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[STLog persistence](STLog, "persistence");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[STCoreUser _primaryContainerInContactStore:withError:].cold.2();

    goto LABEL_16;
  }
  v10 = v9;
  objc_msgSend(v9, "childCardDAVAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[STLog persistence](STLog, "persistence");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[STCoreUser _primaryContainerInContactStore:withError:].cold.3();

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersInAccountWithExternalIdentifier:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
LABEL_7:
  objc_msgSend(v6, "containersMatchingPredicate:error:", v8, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v18;
}

+ (id)localizedFullNameForAppleID:(id)a3 givenName:(id)a4 familyName:(id)a5 systemFullUserName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = objc_msgSend(v12, "length");

  if (v14)
  {
    objc_msgSend(v13, "setGivenName:", v9);
    objc_msgSend(v13, "setFamilyName:", v10);
  }
  else
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "personNameComponentsFromString:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = v11;
      goto LABEL_6;
    }

    v13 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v13, 0, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v13;
LABEL_6:

  return v17;
}

- (NSString)localizedFullName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[STCoreUser appleID](self, "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser familyName](self, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSFullUserName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STCoreUser localizedFullNameForAppleID:givenName:familyName:systemFullUserName:](STCoreUser, "localizedFullNameForAppleID:givenName:familyName:systemFullUserName:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingLocalizedFullName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("givenName"), CFSTR("familyName"), CFSTR("appleID"), 0);
}

+ (id)keyPathsForValuesAffectingScreenTimeEnabled
{
  uint64_t v3;

  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("localUserDeviceState"), CFSTR("familySettings.isAppAndWebsiteActivityEnabled"), CFSTR("familySettings.isManaged"), 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("localUserDeviceState"), CFSTR("familySettings.isManaged"), 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)screenTimeEnabled
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v20;
  id v21;
  id v22;
  id v23;

  if (_os_feature_enabled_impl())
  {
    v3 = (void *)objc_opt_new();
    -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v22 = 0;
      v5 = objc_msgSend(v3, "isScreenTimeEnabledForLocalUserWithError:", &v22);
      v6 = v22;
      if (!v6)
        goto LABEL_12;
    }
    else
    {
      -[STCoreUser dsid](self, "dsid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v5 = objc_msgSend(v3, "isScreenTimeEnabledForRemoteUserWithDSID:error:", v11, &v23);
      v6 = v23;

      if (!v6)
      {
LABEL_12:

        goto LABEL_17;
      }
    }
    +[STLog persistence](STLog, "persistence");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STCoreUser(UnmodeledProperties) screenTimeEnabled].cold.1();

    goto LABEL_12;
  }
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[STCoreUser managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v8, &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    if (v9)
    {
      v5 = objc_msgSend(v9, "screenTimeEnabled");
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[STCoreUser(UnmodeledProperties) screenTimeEnabled].cold.2();

      v5 = 0;
    }

    return v5;
  }
  v13 = _os_feature_enabled_impl();
  -[STCoreUser familySettings](self, "familySettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v14;
  if (v13)
  {
    objc_msgSend(v14, "isAppAndWebsiteActivityEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[STCoreUser familySettings](self, "familySettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v16;
    if (v15)
    {
      objc_msgSend(v16, "isAppAndWebsiteActivityEnabled");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      return v18;
    }
  }
  v5 = objc_msgSend(v3, "isManaged");
LABEL_17:

  return v5;
}

+ (id)keyPathsForValuesAffectingAppAndWebsiteActivityEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("familySettings.isAppAndWebsiteActivityEnabled"), CFSTR("cloudSettings.isAppAndWebsiteActivityEnabled"), 0);
}

- (NSNumber)isAppAndWebsiteActivityEnabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  id v16;
  id v17;

  if (_os_feature_enabled_impl())
  {
    v3 = (void *)objc_opt_new();
    -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[STCoreUser dsid](self, "dsid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v6 = objc_msgSend(v3, "isScreenTimeEnabledForRemoteUserWithDSID:error:", v5, &v16);
      v7 = v16;

      if (!v7)
        goto LABEL_12;
    }
    else
    {
      v17 = 0;
      v6 = objc_msgSend(v3, "isScreenTimeEnabledForLocalUserWithError:", &v17);
      v7 = v17;
      if (!v7)
      {
LABEL_12:
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = v6;
LABEL_13:
        objc_msgSend(v12, "numberWithBool:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    +[STLog persistence](STLog, "persistence");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STCoreUser(UnmodeledProperties) screenTimeEnabled].cold.1();

    goto LABEL_12;
  }
  -[STCoreUser familySettings](self, "familySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v3)
  {
    objc_msgSend(v3, "isAppAndWebsiteActivityEnabled");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[STCoreUser cloudSettings](self, "cloudSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v7, "isAppAndWebsiteActivityEnabled");
    v12 = v15;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  return (NSNumber *)v10;
}

+ (id)keyPathsForValuesAffectingSyncingEnabled
{
  void *v2;

  if (_os_feature_enabled_impl())
  {
    v2 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("screenTimeEnabled"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)syncingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;
  id v10;

  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = objc_msgSend(v5, "cloudSyncEnabled");
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[STCoreUser(UnmodeledProperties) screenTimeEnabled].cold.2();

    v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingCanSetUpFamily
{
  uint64_t v3;

  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("localUserDeviceState"), CFSTR("dsid"), CFSTR("familyMemberType"), 0, v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("screenTimeEnabled"), CFSTR("localUserDeviceState"), CFSTR("dsid"), CFSTR("familyMemberType"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSetUpFamily
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    LOBYTE(v4) = 0;
    if (!-[STCoreUser screenTimeEnabled](self, "screenTimeEnabled") || !v3)
      return (char)v4;
  }
  -[STCoreUser dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[STCoreUser dsid](self, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_1E938D9D0);

    if ((v6 & 1) != 0)
    {
LABEL_8:
      LOBYTE(v4) = 0;
      return (char)v4;
    }
    -[STCoreUser familyMemberType](self, "familyMemberType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Adult")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("Teen")) & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LODWORD(v4) = objc_msgSend(v7, "isEqualToString:", CFSTR("Child")) ^ 1;
    }

  }
  return (char)v4;
}

+ (id)keyPathsForValuesAffectingAllLimitsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.allLimitsEnabled"), CFSTR("cloudSettings.allLimitsEnabled"), CFSTR("familySettings.allLimitsEnabled"), 0);
}

- (BOOL)allLimitsEnabled
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allLimitsEnabled");

  return v3;
}

+ (id)keyPathsForValuesAffectingDefaultUserPolicies
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("localSettings.defaultUserPolicies"), CFSTR("cloudSettings.defaultUserPolicies"), CFSTR("familySettings.defaultUserPolicies"), 0);
}

- (int64_t)defaultUserPolicies
{
  void *v2;
  int64_t v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultUserPolicies");

  return v3;
}

+ (id)keyPathsForValuesAffectingManagingOrganization
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("cloudSettings"), CFSTR("familySettings"), CFSTR("isManaged"), CFSTR("localSettings"), 0);
}

- (STCoreOrganization)managingOrganization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser localSettings](self, "localSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    -[STCoreUser localSettings](self, "localSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = v8;
    objc_msgSend(v8, "organization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  -[STCoreUser cloudSettings](self, "cloudSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v5)
  {
    -[STCoreUser cloudSettings](self, "cloudSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[STCoreUser familySettings](self, "familySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    -[STCoreUser familySettings](self, "familySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return (STCoreOrganization *)v7;
}

+ (id)keyPathsForValuesAffectingManaged
{
  if (_os_feature_enabled_impl())
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("familySettings.isManaged"));
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("screenTimeEnabled"), CFSTR("familySettings.isManaged"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isManaged
{
  void *v3;
  void *v4;
  char v5;

  -[STCoreUser familySettings](self, "familySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
    v5 = objc_msgSend(v3, "isManaged");
  else
    v5 = 0;

  return v5;
}

+ (id)keyPathsForValuesAffectingManaging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isParent"), CFSTR("familySettings.organization.settings"), 0);
}

- (BOOL)isManaging
{
  void *v3;
  int v4;
  char v5;
  void *v6;
  void *v7;

  -[STCoreUser familySettings](self, "familySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STCoreUser isParent](self, "isParent");
  v5 = 0;
  if (v4 && v3)
  {
    objc_msgSend(v3, "organization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("settings.isManaged"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "containsObject:", MEMORY[0x1E0C9AAB0]);

  }
  return v5;
}

+ (id)keyPathsForValuesAffectingEffectivePasscode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.passcode"), CFSTR("cloudSettings.passcode"), CFSTR("familySettings.passcode"), 0);
}

- (NSString)effectivePasscode
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog screentime](STLog, "screentime");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    objc_msgSend(v2, "passcode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 1024;
    v11 = v5 != 0;
    _os_log_impl(&dword_1D22E7000, v3, OS_LOG_TYPE_INFO, "The effective passcode is from %{public}@ and is set %d", (uint8_t *)&v8, 0x12u);

  }
  objc_msgSend(v2, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)keyPathsForValuesAffectingEffectiveRecoveryAltDSID
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.recoveryAltDSID"), CFSTR("cloudSettings.recoveryAltDSID"), 0);
}

- (NSString)effectiveRecoveryAltDSID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser localSettings](self, "localSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser cloudSettings](self, "cloudSettings");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 == v4 || v3 == (void *)v5)
  {
    objc_msgSend(v3, "recoveryAltDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingNeedsToSetPasscode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.needsToSetPasscode"), 0);
}

- (BOOL)needsToSetPasscode
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsToSetPasscode");

  return v3;
}

+ (id)keyPathsForValuesAffectingShareWebUsage
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("familySettings.shareWebUsage"), 0);
}

- (BOOL)shareWebUsage
{
  void *v3;
  void *v4;
  char v5;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser familySettings](self, "familySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
    v5 = objc_msgSend(v3, "shareWebUsage");
  else
    v5 = 1;

  return v5;
}

- (NSString)organizationIdentifier
{
  void *v3;
  __CFString **v4;
  NSString *v5;

  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &STOrganizationIdentifierFamily;
  if (v3 && !-[STCoreUser isManaged](self, "isManaged"))
    v4 = STOrganizationIdentifierPersonal;
  v5 = *v4;

  return v5;
}

+ (id)keyPathsForValuesAffectingCommunicationPolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.communicationPolicy"), CFSTR("cloudSettings.communicationPolicy"), CFSTR("familySettings.communicationPolicy"), 0);
}

+ (id)keyPathsForValuesAffectingCommunicationWhileLimitedPolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.communicationWhileLimitedPolicy"), CFSTR("cloudSettings.communicationWhileLimitedPolicy"), CFSTR("familySettings.communicationWhileLimitedPolicy"), 0);
}

- (BOOL)contactsEditable
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  -[STCoreUser _contactStoreForUser](self, "_contactStoreForUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = 0;
    -[STCoreUser _primaryContainerInContactStore:withError:](self, "_primaryContainerInContactStore:withError:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      LODWORD(v6) = objc_msgSend(v4, "isGuardianRestricted") ^ 1;
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[STCoreUser(UnmodeledProperties) contactsEditable].cold.1();

      LOBYTE(v6) = 1;
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetySendingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.isCommunicationSafetySendingRestricted"), CFSTR("cloudSettings.isCommunicationSafetySendingRestricted"), CFSTR("familySettings.isCommunicationSafetySendingRestricted"), CFSTR("defaultUserPolicies"), 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyReceivingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.isCommunicationSafetyReceivingRestricted"), CFSTR("cloudSettings.isCommunicationSafetyReceivingRestricted"), CFSTR("familySettings.isCommunicationSafetyReceivingRestricted"), 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyNotificationEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.isCommunicationSafetyNotificationEnabled"), CFSTR("cloudSettings.isCommunicationSafetyNotificationEnabled"), CFSTR("familySettings.isCommunicationSafetyNotificationEnabled"), 0);
}

+ (id)keyPathsForValuesAffectingIsCommunicationSafetyAnalyticsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.isCommunicationSafetyAnalyticsEnabled"), CFSTR("cloudSettings.isCommunicationSafetyAnalyticsEnabled"), CFSTR("familySettings.isCommunicationSafetyAnalyticsEnabled"), 0);
}

+ (id)keyPathsForValuesAffectingIsEyeReliefEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.isEyeReliefEnabled"), CFSTR("cloudSettings.isEyeReliefEnabled"), CFSTR("familySettings.isEyeReliefEnabled"), 0);
}

- (BOOL)isEyeReliefEnabled
{
  void *v2;
  char v3;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEyeReliefEnabled");

  return v3;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v3 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (v3 || (_os_feature_enabled_impl() & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v24 = 0;
      v10 = +[STBlueprint deleteManagedUserBlueprintForUser:error:](STBlueprint, "deleteManagedUserBlueprintForUser:error:", self, &v24);
      v5 = v24;
      if (!v10)
      {
        +[STLog persistence](STLog, "persistence");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:].cold.3();

      }
      -[STCoreUser setContactsEditable:](self, "setContactsEditable:", 1);
    }
    -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STCoreUser familySettings](self, "familySettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIsAppAndWebsiteActivityEnabled:", v15);

      }
      else
      {
        -[STCoreUser familySettings](self, "familySettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIsManaged:", v3);
      }

      -[STCoreUser familySettings](self, "familySettings");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsDirty:", 1);
      goto LABEL_35;
    }
    -[STCoreUser managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v13, &v23);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v7)
    {
      objc_msgSend(v7, "setScreenTimeEnabled:", v3);
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:].cold.2();

    }
    if (!_os_feature_enabled_impl())
    {
LABEL_34:
      v5 = v14;
      goto LABEL_35;
    }
    -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreUser cloudSettings](self, "cloudSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STCoreUser isManaged](self, "isManaged"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCoreUser familySettings](self, "familySettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIsAppAndWebsiteActivityEnabled:", v20);

      -[STCoreUser familySettings](self, "familySettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setIsDirty:", 1);
    }
    else
    {
      if (v18 != v19)
      {
LABEL_33:

        goto LABEL_34;
      }
      -[STCoreUser cloudSettings](self, "cloudSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setIsAppAndWebsiteActivityEnabled:", v3);
    }

    goto LABEL_33;
  }
  v5 = (id)objc_opt_new();
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v25 = 0;
    objc_msgSend(v5, "setScreenTimeEnabledForLocalUser:error:", v3, &v25);
    v7 = v25;
    if (!v7)
      goto LABEL_35;
  }
  else
  {
    -[STCoreUser dsid](self, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v5, "setScreenTimeEnabledForRemoteUserWithDSID:enabled:error:", v8, v3, &v26);
    v7 = v26;

    if (!v7)
      goto LABEL_35;
  }
  +[STLog persistence](STLog, "persistence");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:].cold.1();

LABEL_35:
}

- (void)setManaged:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (!a3)
  {
    -[STCoreUser setScreenTimeEnabled:](self, "setScreenTimeEnabled:", 0);
    v10 = 0;
    v5 = +[STBlueprint deleteManagedUserBlueprintForUser:error:](STBlueprint, "deleteManagedUserBlueprintForUser:error:", self, &v10);
    v6 = v10;
    if (!v5)
    {
      +[STLog persistence](STLog, "persistence");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:].cold.3();

    }
    -[STCoreUser setContactsEditable:](self, "setContactsEditable:", 1);

  }
  -[STCoreUser familySettings](self, "familySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsManaged:", v3);

  -[STCoreUser familySettings](self, "familySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsDirty:", 1);

}

- (void)setSyncingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STCoreUser managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v6, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    if (v7)
    {
      objc_msgSend(v7, "setCloudSyncEnabled:", v3);
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[STCoreUser(UnmodeledInternal) setScreenTimeEnabled:].cold.2();

    }
  }
}

- (void)setAllLimitsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllLimitsEnabled:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setDefaultUserPolicies:(int64_t)a3
{
  id v5;
  id v6;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultUserPolicies:", a3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setShareWebUsage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[STCoreUser familySettings](self, "familySettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareWebUsage:", v3);
  objc_msgSend(v4, "setIsDirty:", 1);

}

- (void)setEffectivePasscode:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog screentime](STLog, "screentime");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = objc_opt_class();
    v10 = 1024;
    v11 = v4 != 0;
    _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "The effective passcode is from %{public}@ and is being set %d", (uint8_t *)&v8, 0x12u);
  }

  objc_msgSend(v5, "setPasscode:", v4);
  -[STCoreUser familySettings](self, "familySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
    objc_msgSend(v5, "setIsDirty:", 1);

}

- (void)setEffectiveRecoveryAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser localSettings](self, "localSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreUser cloudSettings](self, "cloudSettings");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 == v6 || v5 == (void *)v7)
  {
    objc_msgSend(v5, "setRecoveryAltDSID:", v4);
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v9)
      -[STCoreUser(UnmodeledInternal) setEffectiveRecoveryAltDSID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)setCommunicationPolicy:(int64_t)a3
{
  id v5;
  id v6;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommunicationPolicy:", a3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setCommunicationWhileLimitedPolicy:(int64_t)a3
{
  id v5;
  id v6;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommunicationWhileLimitedPolicy:", a3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

+ (id)keyPathsForValuesAffectingContactManagementState
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("managed"), CFSTR("localSettings.contactManagementState"), CFSTR("cloudSettings.contactManagementState"), CFSTR("familySettings.contactManagementState"), 0);
}

- (int64_t)contactManagementState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "contactManagementState");
  else
    v4 = 0;

  return v4;
}

- (void)setContactManagementState:(int64_t)a3
{
  id v5;
  id v6;

  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactManagementState:", a3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setContactsEditable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[STCoreUser _contactStoreForUser](self, "_contactStoreForUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0;
    -[STCoreUser _primaryContainerInContactStore:withError:](self, "_primaryContainerInContactStore:withError:", v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");

    if (v8)
    {
      v9 = !v3;
      objc_msgSend(v8, "setGuardianRestricted:", !v3);
      v10 = objc_opt_new();
      -[NSObject setIgnoresGuardianRestrictions:](v10, "setIgnoresGuardianRestrictions:", 1);
      -[NSObject updateContainer:](v10, "updateContainer:", v8);
      v16 = v7;
      v11 = objc_msgSend(v5, "executeSaveRequest:error:", v10, &v16);
      v12 = v16;

      +[STLog persistence](STLog, "persistence");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v19 = v9;
          v20 = 2114;
          v21 = v15;
          _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "Set guardian restricted to %d on container %{public}@", buf, 0x12u);

        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[STCoreUser(UnmodeledInternal) setContactsEditable:].cold.2(v3, (uint64_t)v12, v14);
      }

    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[STCoreUser(UnmodeledInternal) setContactsEditable:].cold.1();
      v12 = v7;
    }

  }
}

- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsCommunicationSafetySendingRestricted:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsCommunicationSafetyReceivingRestricted:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setIsCommunicationSafetyNotificationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsCommunicationSafetyNotificationEnabled:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setIsCommunicationSafetyAnalyticsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsCommunicationSafetyAnalyticsEnabled:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  -[STCoreUser unmodeledManagingOrganizationSettings](self, "unmodeledManagingOrganizationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsEyeReliefEnabled:", v3);
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    objc_msgSend(v6, "setIsDirty:", 1);

}

void __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v2, &v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;

  if (!v3)
  {
    +[STLog screentime](STLog, "screentime");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "failed to fetch local settings: %{public}@. Current settings will be recalculated", buf, 0xCu);
    }

  }
  objc_msgSend(v3, "currentOrganization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[STLog screentime](STLog, "screentime");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke_cold_1();

  }
  objc_msgSend(v3, "currentOrganization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "familySettings");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 32), "familySettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isManaged");

      if (v15)
      {
        +[STLog screentime](STLog, "screentime");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "Family settings indicated the user: (localUser, privacy: .public) is managed.", buf, 2u);
        }

        goto LABEL_18;
      }
    }
    +[STLog screentime](STLog, "screentime");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_DEFAULT, "The user: (localUser, privacy: .public) is using cloud settings.", buf, 2u);
    }

LABEL_23:
    objc_msgSend(*(id *)(a1 + 32), "cloudSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v3, "currentOrganization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localSettings");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v11;

    goto LABEL_25;
  }
  objc_msgSend(v3, "currentOrganization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
LABEL_18:
    objc_msgSend(*(id *)(a1 + 32), "familySettings");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v3, "currentOrganization");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
    goto LABEL_23;
LABEL_25:

}

- (BOOL)unmodeledParticipatesInSharedLedger
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  -[STCoreUser familySettings](self, "familySettings");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  -[STCoreUser familySettings](self, "familySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isManaged") & 1) != 0
    || -[STCoreUser isFamilyOrganizer](self, "isFamilyOrganizer"))
  {

    goto LABEL_8;
  }
  v6 = -[STCoreUser isParent](self, "isParent");

  if ((v6 & 1) == 0)
  {
LABEL_7:
    -[STCoreUser familyMemberType](self, "familyMemberType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Child")) & 1) == 0)
    {
      v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("Teen"));
      goto LABEL_10;
    }
LABEL_8:
    v7 = 1;
LABEL_10:

    return v7;
  }
  return 1;
}

- (NSString)contentPrivacyActivationIdentifier
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  -[STCoreUser organizationIdentifier](self, "organizationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("personal")))
  {
    v4 = CFSTR("digital_health_restrictions");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[STCoreUser dsid](self, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("digital_health_restrictions"), v7);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (id)contentPrivacyConfigurationIdentifierForType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[STCoreUser organizationIdentifier](self, "organizationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("personal"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("digital_health_restrictions"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STCoreUser dsid](self, "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("digital_health_restrictions"), v10, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)alwaysAllowActivationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[STCoreUser organizationIdentifier](self, "organizationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("personal")))
  {
    createIdentifierWithComponents(CFSTR("always_allow_activation"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STCoreUser dsid](self, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    createIdentifierWithComponents(CFSTR("always_allow_activation"), v3, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)alwaysAllowConfigurationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[STCoreUser organizationIdentifier](self, "organizationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("personal")))
  {
    createIdentifierWithComponents(CFSTR("always_allow_app_configuration"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STCoreUser dsid](self, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    createIdentifierWithComponents(CFSTR("always_allow_app_configuration"), v3, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)managedUserActivationIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[STCoreUser dsid](self, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("managed_user_activation"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)iCloudLogoutConfigurationIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[STCoreUser dsid](self, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("icloud_logout_configuration"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)automaticDateTimeConfigurationIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[STCoreUser dsid](self, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("force_date_time_configuration"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STCoreUser;
  if (!-[STCoreUser validateForUpdate:](&v12, sel_validateForUpdate_))
  {
    +[STLog coreDataValidation](STLog, "coreDataValidation");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[STCoreUser(Identifiers) validateForUpdate:].cold.2();
    v9 = 0;
    goto LABEL_22;
  }
  if (!_os_feature_enabled_impl())
    return 1;
  v5 = objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[STCoreUser _validateRemoteUser:](self, "_validateRemoteUser:", v6))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (!-[STCoreUser _validateLocalUser:](self, "_validateLocalUser:", v6))
LABEL_5:
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
LABEL_6:
  if (!-[STCoreUser _validateNumberOfLocalUsers:](self, "_validateNumberOfLocalUsers:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateDSID:](self, "_validateDSID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateAltDSID:](self, "_validateAltDSID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateAppleID:](self, "_validateAppleID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (-[NSObject count](v5, "count"))
  {
    +[STLog coreDataValidation](STLog, "coreDataValidation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STCoreUser(Identifiers) validateForUpdate:].cold.1(self);

  }
  v11.receiver = self;
  v11.super_class = (Class)STCoreUser;
  v9 = -[NSManagedObject parseValidationErrors:otherErrors:](&v11, sel_parseValidationErrors_otherErrors_, a3, v5);

LABEL_22:
  return v9;
}

- (BOOL)validateForInsert:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STCoreUser;
  if (!-[STCoreUser validateForInsert:](&v12, sel_validateForInsert_))
  {
    +[STLog coreDataValidation](STLog, "coreDataValidation");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[STCoreUser(Identifiers) validateForInsert:].cold.2();
    v9 = 0;
    goto LABEL_22;
  }
  if (!_os_feature_enabled_impl())
    return 1;
  v5 = objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[STCoreUser localUserDeviceState](self, "localUserDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[STCoreUser _validateRemoteUser:](self, "_validateRemoteUser:", v6))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (!-[STCoreUser _validateLocalUser:](self, "_validateLocalUser:", v6))
LABEL_5:
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
LABEL_6:
  if (!-[STCoreUser _validateNumberOfLocalUsers:](self, "_validateNumberOfLocalUsers:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateDSID:](self, "_validateDSID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateAltDSID:](self, "_validateAltDSID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (!-[STCoreUser _validateAppleID:](self, "_validateAppleID:", v6))
    -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  if (-[NSObject count](v5, "count"))
  {
    +[STLog coreDataValidation](STLog, "coreDataValidation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STCoreUser(Identifiers) validateForInsert:].cold.1(self);

  }
  v11.receiver = self;
  v11.super_class = (Class)STCoreUser;
  v9 = -[NSManagedObject parseValidationErrors:otherErrors:](&v11, sel_parseValidationErrors_otherErrors_, a3, v5);

LABEL_22:
  return v9;
}

- (BOOL)validateForDelete:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STCoreUser;
  if (-[STCoreUser validateForDelete:](&v11, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl())
      return 1;
    v5 = objc_opt_new();
    v6 = (void *)objc_opt_new();
    if (!-[STCoreUser _validateNumberOfLocalUsers:](self, "_validateNumberOfLocalUsers:", v6))
      -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
    if (-[NSObject count](v5, "count"))
    {
      +[STLog coreDataValidation](STLog, "coreDataValidation");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[STCoreUser(Identifiers) validateForDelete:].cold.1(self);

    }
    v10.receiver = self;
    v10.super_class = (Class)STCoreUser;
    v8 = -[NSManagedObject parseValidationErrors:otherErrors:](&v10, sel_parseValidationErrors_otherErrors_, a3, v5);

  }
  else
  {
    +[STLog coreDataValidation](STLog, "coreDataValidation");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[STCoreUser(Identifiers) validateForDelete:].cold.2();
    v8 = 0;
  }

  return v8;
}

- (BOOL)_validateAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STCoreUser appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STCoreUser fetchRequestMatchingAppleID:](STCoreUser, "fetchRequestMatchingAppleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(v6, "execute:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (!v7)
  {
    objc_msgSend(v4, "addObject:", v8);
    v17 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("There are multiple users with the same Apple ID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 511, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  -[STCoreUser appleID](self, "appleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
    goto LABEL_7;
  -[STCoreUser dsid](self, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("If the user has an Apple ID, they must have a DSID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 512, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

LABEL_7:
  }
  v17 = objc_msgSend(v4, "count") == 0;
LABEL_10:

  return v17;
}

- (BOOL)_validateAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[STCoreUser fetchRequest](STCoreUser, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[STCoreUser altDSID](self, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("altDSID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v21 = 0;
  objc_msgSend(v5, "execute:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  if (!v9)
  {
    objc_msgSend(v4, "addObject:", v10);
    v19 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("There are multiple users with the same altDSID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 516, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  -[STCoreUser dsid](self, "dsid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", &unk_1E938D9D0) & 1) != 0)
    goto LABEL_7;
  -[STCoreUser altDSID](self, "altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("If the user has a DSID, they must have an altDSID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 517, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

LABEL_7:
  }
  v19 = objc_msgSend(v4, "count") == 0;
LABEL_10:

  return v19;
}

- (BOOL)_validateDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STCoreUser dsid](self, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STCoreUser fetchRequestForUsersWithDSID:](STCoreUser, "fetchRequestForUsersWithDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v6, "execute:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v7)
  {
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("There are multiple users with the same DSID.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 509, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

    }
    v12 = objc_msgSend(v4, "count") == 0;
  }
  else
  {
    objc_msgSend(v4, "addObject:", v8);
    v12 = 0;
  }

  return v12;
}

- (BOOL)_validateLocalUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STCoreUser cloudSettings](self, "cloudSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("A local user must have Cloud Settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 515, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  -[STCoreUser familyMemberType](self, "familyMemberType");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9 == CFSTR("Child"))
    goto LABEL_8;
  -[STCoreUser familyMemberType](self, "familyMemberType");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == CFSTR("Teen"))
  {

LABEL_8:
    goto LABEL_9;
  }
  -[STCoreUser familyMemberType](self, "familyMemberType");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 != CFSTR("Adult"))
  {

LABEL_11:
    goto LABEL_12;
  }
  v18 = -[STCoreUser isParent](self, "isParent");

  if ((v18 & 1) != 0)
    goto LABEL_12;
LABEL_9:
  -[STCoreUser familySettings](self, "familySettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("A local user who is a child, teen, nor non-parent adult must have family settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 514, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
    goto LABEL_11;
  }
LABEL_12:
  v16 = objc_msgSend(v4, "count") == 0;

  return v16;
}

- (BOOL)_validateNumberOfLocalUsers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[STCoreUser fetchRequestMatchingLocalUser](STCoreUser, "fetchRequestMatchingLocalUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "execute:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("There must be one and only one local user.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 508, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

    }
    if (!objc_msgSend(v5, "count"))
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17 = CFSTR("There must be one local user.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
    v13 = objc_msgSend(v3, "count") == 0;
  }
  else
  {
    objc_msgSend(v3, "addObject:", v6);
    v13 = 0;
  }

  return v13;
}

- (BOOL)_validateRemoteUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[STCoreUser isParent](self, "isParent") & 1) == 0)
  {
    -[STCoreUser familySettings](self, "familySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("A remote user must have Family Settings.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 514, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
  }
  -[STCoreUser familyMemberType](self, "familyMemberType");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        -[STCoreUser familyMemberType](self, "familyMemberType"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Unknown")),
        v11,
        v10,
        v12))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("A remote user must be family member..");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 513, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

  }
  v16 = objc_msgSend(v4, "count") == 0;

  return v16;
}

+ (id)keyPathsForValuesAffectingObservableScreenTimeEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("screenTimeEnabled"));
}

- (BOOL)observableScreenTimeEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__STCoreUser_Observable__observableScreenTimeEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__STCoreUser_Observable__observableScreenTimeEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "screenTimeEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableScreenTimeEnabled:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke;
  v7[3] = &unk_1E93714C8;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setScreenTimeEnabled:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 48) && (_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEffectivePasscode:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setEffectiveRecoveryAltDSID:", 0);
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableManagementEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("managed"));
}

- (BOOL)observableManagementEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__STCoreUser_Observable__observableManagementEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__STCoreUser_Observable__observableManagementEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isManaged");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableManagementEnabled:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke;
  v7[3] = &unk_1E93714C8;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setManaged:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableSyncingEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("syncingEnabled"));
}

- (BOOL)observableSyncingEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__STCoreUser_Observable__observableSyncingEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__STCoreUser_Observable__observableSyncingEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "syncingEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableSyncingEnabled:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke;
  v7[3] = &unk_1E93714C8;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setSyncingEnabled:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableAllLimitsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("allLimitsEnabled"));
}

- (BOOL)observableAllLimitsEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__STCoreUser_Observable__observableAllLimitsEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __52__STCoreUser_Observable__observableAllLimitsEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allLimitsEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableAllLimitsEnabled:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke;
  v7[3] = &unk_1E93714C8;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setAllLimitsEnabled:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableCanSetUpFamily
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("canSetUpFamily"));
}

- (BOOL)observableCanSetUpFamily
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__STCoreUser_Observable__observableCanSetUpFamily__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__STCoreUser_Observable__observableCanSetUpFamily__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSetUpFamily");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingObservableShareWebUsage
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("shareWebUsage"));
}

- (BOOL)observableShareWebUsage
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__STCoreUser_Observable__observableShareWebUsage__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__STCoreUser_Observable__observableShareWebUsage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shareWebUsage");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableShareWebUsage:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke;
  v7[3] = &unk_1E93714C8;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setShareWebUsage:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

- (void)resetPasscode
{
  void *v3;
  STPINController *v4;

  v4 = -[STPINController initWithUser:]([STPINController alloc], "initWithUser:", self);
  -[STCoreUser effectivePasscode](self, "effectivePasscode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINController removePIN:completionHandler:](v4, "removePIN:completionHandler:", v3, &__block_literal_global_11);

}

void __39__STCoreUser_Observable__resetPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STLog persistence](STLog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __39__STCoreUser_Observable__resetPasscode__block_invoke_cold_1();

  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetySendingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isCommunicationSafetySendingRestricted"));
}

- (BOOL)observableCommunicationSafetySendingRestricted
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__STCoreUser_Observable__observableCommunicationSafetySendingRestricted__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __72__STCoreUser_Observable__observableCommunicationSafetySendingRestricted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCommunicationSafetySendingRestricted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetySendingRestricted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[STLog communicationSafety](STLog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v12 = v3;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetySendingRestricted restriction to: %{public}u", buf, 8u);
  }

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke;
  v8[3] = &unk_1E93714C8;
  v10 = v3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetySendingRestricted:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog communicationSafety](STLog, "communicationSafety");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyReceivingRestricted
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isCommunicationSafetyReceivingRestricted"));
}

- (BOOL)observableCommunicationSafetyReceivingRestricted
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__STCoreUser_Observable__observableCommunicationSafetyReceivingRestricted__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __74__STCoreUser_Observable__observableCommunicationSafetyReceivingRestricted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCommunicationSafetyReceivingRestricted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[STLog communicationSafety](STLog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v12 = v3;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyReceivingRestricted restriction to: %{public}u", buf, 8u);
  }

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke;
  v8[3] = &unk_1E93714C8;
  v10 = v3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyReceivingRestricted:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog communicationSafety](STLog, "communicationSafety");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyNotificationEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isCommunicationSafetyNotificationEnabled"));
}

- (BOOL)observableCommunicationSafetyNotificationEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__STCoreUser_Observable__observableCommunicationSafetyNotificationEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __74__STCoreUser_Observable__observableCommunicationSafetyNotificationEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCommunicationSafetyNotificationEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyNotificationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[STLog communicationSafety](STLog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v12 = v3;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyNotificationEnabled restriction to: %{public}u", buf, 8u);
  }

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke;
  v8[3] = &unk_1E93714C8;
  v10 = v3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyNotificationEnabled:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog communicationSafety](STLog, "communicationSafety");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

+ (id)keyPathsForValuesAffectingObservableCommunicationSafetyAnalyticsEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isCommunicationSafetyAnalyticsEnabled"));
}

- (BOOL)observableCommunicationSafetyAnalyticsEnabled
{
  STCoreUser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__STCoreUser_Observable__observableCommunicationSafetyAnalyticsEnabled__block_invoke;
  v5[3] = &unk_1E93714A0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __71__STCoreUser_Observable__observableCommunicationSafetyAnalyticsEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCommunicationSafetyAnalyticsEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObservableCommunicationSafetyAnalyticsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[STLog communicationSafety](STLog, "communicationSafety");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v12 = v3;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Setting isCommunicationSafetyAnalyticsEnabled to: %{public}u", buf, 8u);
  }

  -[STCoreUser managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke;
  v8[3] = &unk_1E93714C8;
  v10 = v3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsCommunicationSafetyAnalyticsEnabled:", *(unsigned __int8 *)(a1 + 48));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v2 = *(void **)(a1 + 40);
      v6 = 0;
      v3 = objc_msgSend(v2, "save:", &v6);
      v4 = v6;
      if ((v3 & 1) == 0)
      {
        +[STLog communicationSafety](STLog, "communicationSafety");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke_cold_1();

      }
    }
    else
    {
      v4 = 0;
    }

  }
}

void __46__STCoreUser_notifyServerOfScreenTimeEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Error sending family state to server %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_contactStoreForUser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "User has no altDSID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_primaryContainerInContactStore:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "Default Contact container identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)_primaryContainerInContactStore:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "No Apple Account exists for user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

- (void)_primaryContainerInContactStore:withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, v0, v1, "No CardDAV identifier found for user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __70__STCoreUser_UnmodeledInternal__unmodeledManagingOrganizationSettings__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_3(&dword_1D22E7000, v0, v1, "No current organizaiton in ST settings. Current settings will be recalculated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __57__STCoreUser_Observable__setObservableScreenTimeEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save Screen Time enabled: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__STCoreUser_Observable__setObservableManagementEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save management enabled: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__STCoreUser_Observable__setObservableSyncingEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save syncing enabled: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__STCoreUser_Observable__setObservableAllLimitsEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save all limits enabled: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__STCoreUser_Observable__setObservableShareWebUsage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save web usage sharing: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__STCoreUser_Observable__resetPasscode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to reset passcode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__STCoreUser_Observable__setObservableCommunicationSafetySendingRestricted___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save communication safety sending restriction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyReceivingRestricted___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save communication safety receiving restriction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__STCoreUser_Observable__setObservableCommunicationSafetyNotificationEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save isCommunicationSafetyNotificationEnabled restriction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__STCoreUser_Observable__setObservableCommunicationSafetyAnalyticsEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to save isCommunicationSafetyAnalyticsEnabled: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
