@implementation STBlueprint

- (void)tombstone
{
  id v3;

  -[STBlueprint setEnabled:](self, "setEnabled:", 0);
  -[STBlueprint setLimitEnabled:](self, "setLimitEnabled:", 0);
  -[STBlueprint setIsTombstoned:](self, "setIsTombstoned:", 1);
  if (_os_feature_enabled_impl())
  {
    -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setExpiration:](self, "setExpiration:", v3);

}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STBlueprint;
  -[STUniquedManagedObject awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v3, CFSTR("modificationDate"));

}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STBlueprint;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequestMatchingExpiredBlueprints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(%K < %@) OR ((%K < %@) AND (NOT %K BEGINSWITH %@))"), CFSTR("expiration"), v6, CFSTR("expiration"), v3, CFSTR("identifier"), CFSTR("one_more_minute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  return v2;
}

+ (id)fetchRequestMatchingOrphanedBlueprints
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == 0"), CFSTR("users"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchRequestMatchingUnexpiredOneMoreMinuteBlueprints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K BEGINSWITH %@) AND (%K >= %@)"), CFSTR("identifier"), CFSTR("one_more_minute"), CFSTR("expiration"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  return v2;
}

+ (id)_fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K == %@ AND %K == NO"), CFSTR("users.dsid"), v4, CFSTR("isTombstoned"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_1E938D988;
  if (v7)
    v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == NO"), v9, CFSTR("users.dsid"), CFSTR("type"), v6, CFSTR("isTombstoned"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v10);
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 fromOrganization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_1E938D988;
  if (v7)
    v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == NO"), v9, CFSTR("users.dsid"), CFSTR("organization"), v6, CFSTR("isTombstoned"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v10);
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 fromOrganization:(id)a4 includeTombstones:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@"), v9, CFSTR("users"), CFSTR("organization"), v8, v13);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == NO"), v9, CFSTR("users"), CFSTR("organization"), v8, CFSTR("isTombstoned"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  return v10;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 fromOrganization:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1E938D988;
  if (v10)
    v12 = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@ AND %K == NO"), v12, CFSTR("users.dsid"), CFSTR("type"), v9, CFSTR("organization"), v8, CFSTR("isTombstoned"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v13);
  return v11;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = &unk_1E938D988;
  if (v13)
    v15 = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@ AND %K == NO"), v15, CFSTR("users.dsid"), CFSTR("type"), v12, CFSTR("identifier"), v11, CFSTR("organization"), v10, CFSTR("isTombstoned"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v16);
  return v14;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 fromOrganization:(id)a5 includeTombstones:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@"), v12, CFSTR("users"), CFSTR("type"), v11, CFSTR("organization"), v10, v16);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@ AND %K == NO"), v12, CFSTR("users"), CFSTR("type"), v11, CFSTR("organization"), v10, CFSTR("isTombstoned"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPredicate:", v14);
  return v13;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6 includeTombstones:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(a1, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@"), v15, CFSTR("users"), CFSTR("type"), v14, CFSTR("identifier"), v13, CFSTR("organization"), v12, v19);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@ AND %K == NO"), v15, CFSTR("users"), CFSTR("type"), v14, CFSTR("identifier"), v13, CFSTR("organization"), v12, CFSTR("isTombstoned"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPredicate:", v17);
  return v16;
}

+ (id)fetchResultsRequestsForChangesToBlueprints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  +[STBlueprintSchedule fetchRequest](STBlueprintSchedule, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  +[STBlueprintUsageLimit fetchRequest](STBlueprintUsageLimit, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  +[STBlueprintConfiguration fetchRequest](STBlueprintConfiguration, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  +[STCoreOrganizationSettings fetchRequest](STCoreOrganizationSettings, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchResultsRequestsForChangesToBlueprintsForUserWithDSID:(id)a3
{
  void *v4;
  id v5;
  id v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  if (a3)
    v5 = a3;
  else
    v5 = &unk_1E938D988;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%@ IN %K"), v5, CFSTR("blueprint.users.dsid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule fetchRequest](STBlueprintSchedule, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v21);
  +[STBlueprintUsageLimit fetchRequest](STBlueprintUsageLimit, "fetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredicate:", v21);
  +[STBlueprintConfiguration fetchRequest](STBlueprintConfiguration, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v21);
  +[STCoreOrganizationSettings fetchRequest](STCoreOrganizationSettings, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STCoreDowntimeOverride fetchRequest](STCoreDowntimeOverride, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchRequestMatchingBlueprintsForUserWithDSID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v14;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v15;
  +[STFetchResultsRequest requestWithFetchRequest:](STFetchResultsRequest, "requestWithFetchRequest:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)createBlueprintWithType:(id)a3 user:(id)a4
{
  id v6;
  id v7;
  void *v8;
  STBlueprint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v8);
  v10 = (void *)objc_opt_new();
  -[STBlueprint setCreationDate:](v9, "setCreationDate:", v10);

  -[STBlueprint setType:](v9, "setType:", v7);
  objc_msgSend(a1, "blueprintIdentifierForUser:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setIdentifier:](v9, "setIdentifier:", v11);

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectWithID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setUsers:](v9, "setUsers:", v15);

  objc_msgSend(v6, "managingOrganization");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[STBlueprint setOrganization:](v9, "setOrganization:", v16);
  return v9;
}

+ (id)blueprintIdentifierForUser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "organizationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("family")))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("digital_health_restrictions"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("digital_health_restrictions");
  }

  return v7;
}

- (id)declarationsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  -[STBlueprint type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("downtime")))
  {
    +[STBlueprint _predicateForDowntimeBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForDowntimeBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("usage-limit")))
  {
    +[STBlueprint _predicateForUsageLimitBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForUsageLimitBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("usage-limit-override")))
  {
    +[STBlueprint _predicateForUsageLimitOverrideBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForUsageLimitOverrideBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("always-allowed-apps")))
  {
    +[STBlueprint _predicateForAlwaysAllowedAppsBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForAlwaysAllowedAppsBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("restrictions")))
  {
    +[STBlueprint _predicateForRestrictionsBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForRestrictionsBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("managed-user")))
    {
      +[STLog blueprint](STLog, "blueprint");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[STBlueprint declarationsWithError:].cold.2();
      goto LABEL_18;
    }
    +[STBlueprint _predicateForManagedUserBlueprint:withDateFormatter:calendar:](STBlueprint, "_predicateForManagedUserBlueprint:withDateFormatter:calendar:", self, v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
  {
    +[STLog blueprint](STLog, "blueprint");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STBlueprint declarationsWithError:].cold.1(self);
LABEL_18:
    v11 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  v15 = 0;
  +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:](STBlueprint, "_buildConfigurationsByDeclarationIdentifierFromBlueprint:error:", self, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v10)
  {
    -[STBlueprint identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint _buildDeclarationsFromConfigurationsByDeclarationIdentifier:predicate:identifier:](STBlueprint, "_buildDeclarationsFromConfigurationsByDeclarationIdentifier:predicate:identifier:", v10, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

LABEL_21:
  return v13;
}

+ (id)_predicateForDowntimeBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("downtime"));

  if ((v12 & 1) != 0)
  {
    v13 = objc_opt_new();
    v14 = (void *)objc_opt_new();
    objc_msgSend(a1, "_addCommonPredicatesForBlueprint:toAllPredicates:usingDateFormatter:calendar:", v8, v13, v9, v10);
    objc_msgSend(v8, "activeOverride");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x1E0D134D8], "buildWithPredicates:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        if (-[NSObject count](v13, "count"))
          objc_msgSend(v14, "addObject:", v24);
        objc_msgSend(MEMORY[0x1E0D134E0], "buildWithPredicates:", v14);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = v24;
      }
      v20 = v25;

      goto LABEL_24;
    }
    objc_msgSend(v8, "configurations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[STBlueprint _cemPredicateWithDowntimeOverride:shouldUseGracePeriod:dateFormater:calendar:](STBlueprint, "_cemPredicateWithDowntimeOverride:shouldUseGracePeriod:dateFormater:calendar:", v15, +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:](STBlueprint, "shouldUseGracePeriodForDowntimeOverride:configuration:", v15, v17), v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_msgSend(v15, "state");
      if (v19)
      {
        if (v19 == 1)
          objc_msgSend(v14, "addObject:", v18);
        goto LABEL_17;
      }
      objc_msgSend(v8, "schedule");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "enabled");

      if (v23)
        objc_msgSend(MEMORY[0x1E0D13518], "buildWithPredicate:", v18);
      else
        objc_msgSend(MEMORY[0x1E0D13510], "build");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v13, "addObject:", v21);
    }
    else
    {
      +[STLog blueprint](STLog, "blueprint");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138543362;
        v28 = v15;
        _os_log_impl(&dword_1D22E7000, v21, OS_LOG_TYPE_DEFAULT, "Did not create CEM predicate for downtime override: %{public}@", (uint8_t *)&v27, 0xCu);
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  +[STLog blueprint](STLog, "blueprint");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[STBlueprint _predicateForDowntimeBlueprint:withDateFormatter:calendar:].cold.1(v8);
  v20 = 0;
LABEL_24:

  return v20;
}

+ (id)_predicateForUsageLimitBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id obj;
  id obja;
  id objb;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  void *v97;
  _BYTE v98[128];
  _QWORD v99[3];
  _QWORD v100[3];
  void *v101;
  void *v102;
  _BYTE v103[128];
  void *v104;
  uint8_t buf[4];
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("usage-limit"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "_buildPredicateForDisablingBlueprint:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v14 = v13;
      v15 = v14;
    }
    else if ((objc_msgSend(v8, "limitEnabled") & 1) != 0)
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(a1, "_addCommonPredicatesForBlueprint:toAllPredicates:usingDateFormatter:calendar:", v8, v17, v9, v10);
      objc_msgSend(v8, "usageLimit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v81 = v17;
        v82 = v9;
        v83 = v8;
        objc_msgSend(v18, "budgetLimitScheduleRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "applicationIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "categoryIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "categoryIdentifiersVersion2");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v19;
        objc_msgSend(v19, "websiteIdentifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v21;
        v80 = v20;
        v77 = v23;
        v78 = v22;
        v76 = v24;
        if (objc_msgSend(v21, "count")
          || objc_msgSend(v22, "count")
          || objc_msgSend(v23, "count")
          || objc_msgSend(v24, "count"))
        {
          objc_msgSend(MEMORY[0x1E0D13500], "buildWithApps:withWebSites:withCategories:withCategoriesVersion2:", v21, v24, v22, v23);
          v74 = objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v20, "customScheduleItems");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          objc_msgSend(v20, "customScheduleItems");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v93;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v93 != v30)
                  objc_enumerationMutation(obj);
                v32 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
                v33 = (void *)MEMORY[0x1E0D13508];
                v34 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v32, "budgetLimit");
                objc_msgSend(v34, "numberWithDouble:");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "day"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "buildWithSeconds:withDays:", v35, v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "addObject:", v38);
              }
              v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
            }
            while (v29);
          }

          v39 = (void *)MEMORY[0x1E0D134F8];
          objc_msgSend(v10, "calendarIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v84, "notificationTimeInterval");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v42, "integerValue"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)v74;
          objc_msgSend(v39, "buildWithCalendarIdentifier:withMonitors:withNotificationTimes:withTimeBudget:", v40, v74, v44, v27);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v53 = *MEMORY[0x1E0D13450];
          v99[0] = CFSTR("app");
          v99[1] = CFSTR("webdomain");
          v54 = *MEMORY[0x1E0D13460];
          v100[0] = v53;
          v100[1] = v54;
          v99[2] = CFSTR("category");
          v100[2] = *MEMORY[0x1E0D13458];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v20, "customScheduleItems");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_msgSend(v55, "initWithCapacity:", objc_msgSend(v56, "count"));

          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          objc_msgSend(v20, "customScheduleItems");
          obja = (id)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
          if (v58)
          {
            v59 = v58;
            v60 = *(_QWORD *)v89;
            do
            {
              for (j = 0; j != v59; ++j)
              {
                if (*(_QWORD *)v89 != v60)
                  objc_enumerationMutation(obja);
                v62 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
                v63 = (void *)MEMORY[0x1E0D134F0];
                v64 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v62, "budgetLimit");
                objc_msgSend(v64, "numberWithDouble:");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v62, "day"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = v66;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "buildWithSeconds:withDays:", v65, v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v57, "addObject:", v68);
              }
              v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
            }
            while (v59);
          }

          objc_msgSend(v84, "itemIdentifiers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)MEMORY[0x1E0D134E8];
          objc_msgSend(v10, "calendarIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "usageItemType");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v75;
          objc_msgSend(v75, "objectForKeyedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v84, "notificationTimeInterval");
          objb = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "numberWithInteger:", objc_msgSend(objb, "integerValue"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v73;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v69;
          v27 = v57;
          objc_msgSend(v72, "buildWithCalendarIdentifier:withMonitor:withIdentifiers:withIdentifiersVersion2:withNotificationTimes:withTimeBudget:", v42, v44, v40, v40, v71, v57);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v8 = v83;
        v17 = v81;
        v14 = 0;
        if (objc_msgSend(v83, "invertUsageLimit"))
        {
          objc_msgSend(MEMORY[0x1E0D13518], "buildWithPredicate:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v47);

        }
        else
        {
          objc_msgSend(v81, "addObject:", v46);
        }
        v9 = v82;
        v19 = v84;

      }
      objc_msgSend(MEMORY[0x1E0D134D8], "buildWithPredicates:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[STLog blueprint](STLog, "blueprint");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v106 = v49;
        _os_log_impl(&dword_1D22E7000, v48, OS_LOG_TYPE_DEFAULT, "Usage limit is disabled: %{public}@)", buf, 0xCu);

      }
      v50 = (void *)MEMORY[0x1E0D134D8];
      objc_msgSend(MEMORY[0x1E0D13510], "build");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "buildWithPredicates:", v52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[STBlueprint _predicateForUsageLimitBlueprint:withDateFormatter:calendar:].cold.1(v8);
    v15 = 0;
  }

  return v15;
}

+ (id)_predicateForUsageLimitOverrideBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("usage-limit-override"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "_buildPredicateForUnspecializedBlueprint:usingDateFormatter:calendar:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[STBlueprint _predicateForUsageLimitOverrideBlueprint:withDateFormatter:calendar:].cold.1(v8);

    v13 = 0;
  }

  return v13;
}

+ (id)_predicateForAlwaysAllowedAppsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("always-allowed-apps"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "_buildPredicateForUnspecializedBlueprint:usingDateFormatter:calendar:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[STBlueprint _predicateForAlwaysAllowedAppsBlueprint:withDateFormatter:calendar:].cold.1(v8);

    v13 = 0;
  }

  return v13;
}

+ (id)_predicateForRestrictionsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("restrictions"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "_buildPredicateForUnspecializedBlueprint:usingDateFormatter:calendar:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[STBlueprint _predicateForRestrictionsBlueprint:withDateFormatter:calendar:].cold.1(v8);

    v13 = 0;
  }

  return v13;
}

+ (id)_predicateForManagedUserBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("managed-user"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "_buildPredicateForUnspecializedBlueprint:usingDateFormatter:calendar:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[STBlueprint _predicateForManagedUserBlueprint:withDateFormatter:calendar:].cold.1(v8);

    v13 = 0;
  }

  return v13;
}

+ (id)_buildPredicateForDisablingBlueprint:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "enabled") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Blueprint is disabled: %{public}@)", buf, 0xCu);

    }
    v7 = (void *)MEMORY[0x1E0D134D8];
    objc_msgSend(MEMORY[0x1E0D13510], "build");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildWithPredicates:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (void)_addExpirationPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v14, "expiration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "setFormatOptions:", 1907);
    v10 = (void *)MEMORY[0x1E0D13520];
    objc_msgSend(v14, "expiration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buildRequiredOnlyWithDateTime:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
  }

}

+ (void)_addMinimumInstallationDatePredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(a3, "minimumInstallationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "setFormatOptions:", 1907);
    v9 = (void *)MEMORY[0x1E0D13520];
    objc_msgSend(v7, "stringFromDate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildRequiredOnlyWithDateTime:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13518], "buildWithPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

  }
}

+ (void)_addUserPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
    goto LABEL_2;
  if (v8 == 1)
  {
    objc_msgSend(v5, "users");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_2:
      v23 = v6;
      v9 = (void *)objc_opt_new();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v5, "users");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = (void *)MEMORY[0x1E0D13530];
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dsid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "buildWithDSID:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v12);
      }

      objc_msgSend(MEMORY[0x1E0D134E0], "buildWithPredicates:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v23;
      objc_msgSend(v23, "addObject:", v19);

    }
  }

}

+ (void)_addSchedulePredicatesForBlueprintScheudle:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id obj;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  void *v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v67 = a6;
  if ((objc_msgSend(v9, "enabled") & 1) != 0)
  {
    v53 = v10;
    v62 = v9;
    objc_msgSend(v9, "scheduleRepresentation");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFormatOptions:", 544);
    v66 = objc_msgSend(v67, "maximumRangeOfUnit:", 512);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(v67, "startOfDayForDate:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v16;
    objc_msgSend(v11, "stringFromDate:", v16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_opt_new();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v52 = v12;
    -[NSObject customScheduleItems](v12, "customScheduleItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    if (!v65)
      goto LABEL_19;
    v54 = v14 - 1;
    v64 = *(_QWORD *)v70;
    v61 = v11;
    while (1)
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "day");
        v20 = v19 + v66;
        objc_msgSend(v18, "startTime");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "dateFromComponents:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "endTime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "dateFromComponents:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringFromDate:", v22);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringFromDate:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "compare:", v24);
        if (v26 == 1)
        {
          v58 = v22;
          if (v19 == v54)
            v35 = v66;
          else
            v35 = v20 + 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0D13528];
          objc_msgSend(v67, "calendarIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v25;
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v62, "notificationTimeInterval");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "numberWithInteger:", objc_msgSend(v40, "integerValue"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "buildWithCalendarIdentifier:withStartDay:withStartTime:withEndDay:withEndTime:withNotificationTimes:", v37, v38, v68, v34, v55, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v60;
          objc_msgSend(v63, "addObject:", v43);
          if ((objc_msgSend(v60, "isEqualToString:", v55) & 1) == 0)
          {
            v44 = (void *)MEMORY[0x1E0D13528];
            objc_msgSend(v67, "calendarIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "buildWithCalendarIdentifier:withStartDay:withStartTime:withEndDay:withEndTime:withNotificationTimes:", v45, v34, v55, v34, v60, MEMORY[0x1E0C9AA60]);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "addObject:", v46);
          }

          v22 = v58;
        }
        else
        {
          if (v26 != -1)
            goto LABEL_17;
          v59 = (void *)MEMORY[0x1E0D13528];
          objc_msgSend(v67, "calendarIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v62, "notificationTimeInterval");
          v30 = v25;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v31, "integerValue"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "buildWithCalendarIdentifier:withStartDay:withStartTime:withEndDay:withEndTime:withNotificationTimes:", v57, v27, v68, v28, v30, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v30;
          objc_msgSend(v63, "addObject:", v34);
        }

        v11 = v61;
LABEL_17:

      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (!v65)
      {
LABEL_19:

        objc_msgSend(MEMORY[0x1E0D134E0], "buildWithPredicates:", v63);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v53;
        objc_msgSend(v53, "addObject:", v47);

        v9 = v62;
        v48 = v52;
        goto LABEL_22;
      }
    }
  }
  +[STLog blueprint](STLog, "blueprint");
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "blueprint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v77 = v50;
    _os_log_impl(&dword_1D22E7000, v48, OS_LOG_TYPE_DEFAULT, "Schedule is not enabled for blueprint: %{public}@", buf, 0xCu);

  }
LABEL_22:

}

+ (void)_addCommonPredicatesForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "_addExpirationPredicateForBlueprint:toAllPredicates:usingDateFormatter:", v15, v10, v11);
  objc_msgSend(a1, "_addMinimumInstallationDatePredicateForBlueprint:toAllPredicates:usingDateFormatter:", v15, v10, v11);
  if ((_os_feature_enabled_impl() & 1) == 0)
    objc_msgSend(a1, "_addUserPredicateForBlueprint:toAllPredicates:", v15, v10);
  objc_msgSend(v15, "schedule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v15, "schedule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_addSchedulePredicatesForBlueprintScheudle:toAllPredicates:usingDateFormatter:calendar:", v14, v10, v11, v12);

  }
}

+ (id)_buildPredicateForUnspecializedBlueprint:(id)a3 usingDateFormatter:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_buildPredicateForDisablingBlueprint:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(a1, "_addCommonPredicatesForBlueprint:toAllPredicates:usingDateFormatter:calendar:", v8, v14, v9, v10);
    objc_msgSend(MEMORY[0x1E0D134D8], "buildWithPredicates:", v14);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)_buildConfigurationsByDeclarationIdentifierFromBlueprint:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v25 = v4;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
      objc_msgSend(v13, "payloadPlist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        break;
      v15 = (void *)MEMORY[0x1E0D13488];
      objc_msgSend(v13, "payloadPlist");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v15, "declarationForData:error:", v16, &v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v27;

      if (!v17)
      {
        +[STLog persistence](STLog, "persistence");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:].cold.2();

        if (a4)
          *a4 = objc_retainAutorelease(v18);

        v4 = v25;
LABEL_21:

        v20 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v17, "declarationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v19);

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v4 = v25;
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    +[STLog persistence](STLog, "persistence");
    v21 = objc_claimAutoreleasedReturnValue();
    v4 = v25;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 14, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 14, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_21;
  }
LABEL_10:

  v20 = (void *)objc_msgSend(v7, "copy");
LABEL_22:

  return v20;
}

+ (id)_buildDeclarationsFromConfigurationsByDeclarationIdentifier:(id)a3 predicate:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)MEMORY[0x1E0D13470];
  objc_msgSend(v7, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildWithIdentifier:withStandardConfigurations:withPredicate:", v9, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "serialize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "allValues", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "serialize");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v10, "copy");
  return v21;
}

+ (BOOL)shouldUseGracePeriodForDowntimeOverride:(id)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
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
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t v31[8];
  id v32;

  v5 = a4;
  if (objc_msgSend(a3, "state") == 1)
  {
    if (v5)
    {
      objc_msgSend(v5, "payloadPlist");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0D13490];
        objc_msgSend(v5, "payloadPlist");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        objc_msgSend(v7, "declarationForData:error:", v8, &v32);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v32;

        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "payloadMode");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D13428]);

            if (v12)
            {
              +[STLog blueprint](STLog, "blueprint");
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v31 = 0;
                _os_log_impl(&dword_1D22E7000, v13, OS_LOG_TYPE_DEFAULT, "Block at downtime is enabled. Using grace period.", v31, 2u);
              }

            }
            goto LABEL_22;
          }
          +[STLog blueprint](STLog, "blueprint");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:].cold.4();
        }
        else
        {
          +[STLog blueprint](STLog, "blueprint");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:].cold.3((uint64_t)v10, v28, v29);
        }

      }
      else
      {
        +[STLog blueprint](STLog, "blueprint");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:].cold.2(v10, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      +[STLog blueprint](STLog, "blueprint");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:].cold.1(v10, v14, v15, v16, v17, v18, v19, v20);
    }
    LOBYTE(v12) = 0;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

+ (id)_cemPredicateWithDowntimeOverride:(id)a3 shouldUseGracePeriod:(BOOL)a4 dateFormater:(id)a5 calendar:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[16];
  _QWORD v39[2];

  v8 = a4;
  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v8 && (_os_feature_enabled_impl() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringForKey:", CFSTR("OnDemandDowntimeDelay"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = (double)objc_msgSend(v18, "integerForKey:", CFSTR("OnDemandDowntimeDelay"));
      else
        v20 = 300.0;

    }
    else
    {
      v20 = 300.0;
    }
    objc_msgSend(v10, "setFormatOptions:", 544);
    objc_msgSend(v9, "creationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    STLocalDateFromUTCErasedDate(v21, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dateByAddingTimeInterval:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    STLocalDateFromUTCErasedDate(v24, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "compare:", v25) == -1)
    {
      v27 = objc_msgSend(v11, "component:fromDate:", 512, v23);
      v28 = objc_msgSend(v11, "component:fromDate:", 512, v25);
      objc_msgSend(v10, "stringFromDate:", v23);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromDate:", v25);
      v29 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D13528];
      v36 = (void *)v29;
      objc_msgSend(v11, "calendarIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "buildWithCalendarIdentifier:withStartDay:withStartTime:withEndDay:withEndTime:withNotificationTimes:", v34, v33, v37, v30, v36, v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[STLog blueprint](STLog, "blueprint");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v26, OS_LOG_TYPE_DEFAULT, "Downtime override duration is less than grace period - not synthesizing CEM predicate", buf, 2u);
      }

      v16 = 0;
    }
  }
  else
  {
    objc_msgSend(v10, "setFormatOptions:", 1907);
    objc_msgSend(v9, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    STLocalDateFromUTCErasedDate(v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0D13520];
    objc_msgSend(v10, "stringFromDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buildWithDateTime:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)migrateToVersion2CategoriesIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to serialize declaration while migrating to version 2 categories: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  STVersionVector *v6;
  void *v7;
  STVersionVector *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("identifier")))
  {
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("isDirty"))
         && -[STBlueprint isDirty](self, "isDirty"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setModificationDate:](self, "setModificationDate:", v5);

    v6 = [STVersionVector alloc];
    -[STBlueprint versionVector](self, "versionVector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[STVersionVector initWithDataRepresentation:](v6, "initWithDataRepresentation:", v7);

    STGetDeviceUUID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STVersionVector incrementNodeWithIdentifier:](v8, "incrementNodeWithIdentifier:", v9);

    -[STVersionVector dataRepresentation](v8, "dataRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setVersionVector:](self, "setVersionVector:", v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)STBlueprint;
  -[STBlueprint didChangeValueForKey:](&v11, sel_didChangeValueForKey_, v4);

}

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  STVersionVector *v6;
  void *v7;
  STVersionVector *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  STVersionVector *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  STBlueprintSchedule *v49;
  void *v50;
  STBlueprintSchedule *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  unint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  STVersionVector *v60;
  NSObject *v61;
  _BOOL4 v62;
  uint64_t v63;
  _BOOL4 v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  void *v68;
  NSObject *v69;
  STVersionVector *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  _BOOL4 v75;
  void *v76;
  STCoreDowntimeOverride *v77;
  void *v78;
  STCoreDowntimeOverride *v79;
  uint64_t v80;
  NSObject *v81;
  _BOOL4 v82;
  void *v83;
  STBlueprintUsageLimit *v84;
  void *v85;
  STBlueprintUsageLimit *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  STVersionVector *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  objc_class *v118;
  void *v119;
  NSObject *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  BOOL v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  const char *v131;
  NSObject *v132;
  uint32_t v133;
  NSObject *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  STVersionVector *v141;
  STVersionVector *v142;
  void *v143;
  void *v144;
  id obj;
  STBlueprint *v146;
  NSObject *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  uint8_t v159[128];
  uint8_t buf[4];
  unint64_t v161;
  __int16 v162;
  STVersionVector *v163;
  __int16 v164;
  STVersionVector *v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[STLog screentime](STLog, "screentime");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "STBlueprint: enter updateWithDictionaryRepresentation", buf, 2u);
  }

  v6 = [STVersionVector alloc];
  -[STBlueprint versionVector](self, "versionVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STVersionVector initWithDataRepresentation:](v6, "initWithDataRepresentation:", v7);

  -[STVersionVector nodes](v8, "nodes");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)v9, "count");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("versionVector"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[STVersionVector initWithDataRepresentation:]([STVersionVector alloc], "initWithDataRepresentation:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fromCloud"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v13, "BOOLValue");
  +[STLog screentime](STLog, "screentime");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  v144 = v13;
  if ((v9 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: dictionaryRepresentation is fromCloud. Version vectors will be ignored.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: dictionaryRepresentation is NOT fromCloud. Compare version vectors.", buf, 2u);
  }

  if (!v8)
  {
    +[STLog screentime](STLog, "screentime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - there is no versionvector", buf, 2u);
    }
    goto LABEL_159;
  }
  +[STLog versionVector](STLog, "versionVector");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    -[STBlueprint uniqueIdentifier](self, "uniqueIdentifier");
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v161 = (unint64_t)v31;
    v162 = 2112;
    v163 = v8;
    v164 = 2112;
    v165 = v12;
    _os_log_impl(&dword_1D22E7000, v30, OS_LOG_TYPE_DEFAULT, "COMPARE BLUEPRINTS (%@): %@ vs %@", buf, 0x20u);

  }
  v32 = -[STVersionVector evaluateCausality:](v8, "evaluateCausality:", v12);
  v33 = v32;
  switch(v32)
  {
    case 1:
      +[STLog versionVector](STLog, "versionVector");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        break;
      }
      *(_WORD *)buf = 0;
      v35 = "Local newer";
LABEL_25:
      _os_log_impl(&dword_1D22E7000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
      goto LABEL_26;
    case 3:
      +[STLog versionVector](STLog, "versionVector");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      v35 = "Local equal";
      goto LABEL_25;
    case 2:
      +[STLog versionVector](STLog, "versionVector");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      v35 = "Concurrent";
      goto LABEL_25;
    case 0:
      +[STLog versionVector](STLog, "versionVector");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      v35 = "Local older";
      goto LABEL_25;
  }
  -[STVersionVector join:](v8, "join:", v12);
  -[STVersionVector dataRepresentation](v8, "dataRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setVersionVector:](self, "setVersionVector:", v36);

  if (v33 == 1)
  {
    +[STLog screentime](STLog, "screentime");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D22E7000, v37, OS_LOG_TYPE_DEFAULT, "Received blueprint representation is out of date. Skipping update.", buf, 2u);
    }

    +[STLog screentime](STLog, "screentime");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self, v38);

    +[STLog screentime](STLog, "screentime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[STBlueprint updateWithDictionaryRepresentation:].cold.6();
    goto LABEL_159;
  }
  if (v33 != 3)
  {
    if (v33 == 2)
    {
      +[STLog screentime](STLog, "screentime");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v57, OS_LOG_TYPE_DEFAULT, "Blueprint version clocks concurrent. Most recent modification wins", buf, 2u);
      }

      +[STLog screentime](STLog, "screentime");
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self, v58);

      +[STLog screentime](STLog, "screentime");
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.6();

      -[STBlueprint modificationDate](self, "modificationDate");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modificationDate"));
      v60 = (STVersionVector *)objc_claimAutoreleasedReturnValue();
      +[STLog screentime](STLog, "screentime");
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      if (v14 && v60)
      {
        if (v62)
        {
          *(_DWORD *)buf = 138412546;
          v161 = (unint64_t)v14;
          v162 = 2112;
          v163 = v60;
          _os_log_impl(&dword_1D22E7000, v61, OS_LOG_TYPE_DEFAULT, "Local modification date = %@, Incoming modification date = %@", buf, 0x16u);
        }

        v63 = -[NSObject compare:](v14, "compare:", v60);
        +[STLog screentime](STLog, "screentime");
        v61 = objc_claimAutoreleasedReturnValue();
        v64 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
        if (v63 != -1)
        {
          if (v64)
          {
            *(_DWORD *)buf = 138412546;
            v161 = (unint64_t)v14;
            v162 = 2112;
            v163 = v60;
            v65 = "Local blueprint is more recently modified. We will ignore the received blueprint. Local = %@, Incoming = %@";
            v66 = v61;
            v67 = 22;
LABEL_157:
            _os_log_impl(&dword_1D22E7000, v66, OS_LOG_TYPE_DEFAULT, v65, buf, v67);
            goto LABEL_158;
          }
          goto LABEL_158;
        }
        if (v64)
        {
          *(_DWORD *)buf = 138412546;
          v161 = (unint64_t)v14;
          v162 = 2112;
          v163 = v60;
          v131 = "Received blueprint is more recently modified. We will overwrite the local blueprint. Local = %@, Incoming = %@";
          v132 = v61;
          v133 = 22;
LABEL_166:
          _os_log_impl(&dword_1D22E7000, v132, OS_LOG_TYPE_DEFAULT, v131, buf, v133);
        }
      }
      else
      {
        if (v14)
        {
          if (v62)
          {
            *(_WORD *)buf = 0;
            v65 = "Only the local blueprint has a modification date. We will ignore the received blueprint.";
            v66 = v61;
            v67 = 2;
            goto LABEL_157;
          }
LABEL_158:

LABEL_159:
          v125 = 0;
          goto LABEL_160;
        }
        if (v62)
        {
          *(_WORD *)buf = 0;
          v131 = "Only the inboud blueprint has a modification date. We will overwrite the local blueprint.";
          v132 = v61;
          v133 = 2;
          goto LABEL_166;
        }
      }

LABEL_6:
    }
LABEL_7:
    v146 = self;
    v141 = v8;
    v142 = v12;
    v140 = v11;
    v143 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configurations"));
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v155;
      do
      {
        v20 = 0;
        v21 = v18;
        do
        {
          if (*(_QWORD *)v155 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * v20);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("identifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[STBlueprintConfiguration fetchRequest](STBlueprintConfiguration, "fetchRequest");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %@"), CFSTR("blueprint"), v146, CFSTR("identifier"), v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPredicate:", v25);

          v153 = v21;
          objc_msgSend(v24, "execute:", &v153);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v153;

          objc_msgSend(v26, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
            objc_msgSend(v28, "updateWithDictionaryRepresentation:", v22);

          ++v20;
          v21 = v27;
        }
        while (v17 != v20);
        v18 = v27;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    v4 = v143;
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("type"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setType:](v146, "setType:", v39);

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("enabled"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "BOOLValue");

    -[STBlueprint setEnabled:](v146, "setEnabled:", v41);
    -[STBlueprint type](v146, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("downtime"));

    v12 = v142;
    if (v43)
    {
      +[STLog screentime](STLog, "screentime");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v44, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - downtime blueprint", buf, 2u);
      }

      objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("schedule"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[STLog screentime](STLog, "screentime");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v45)
      {
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D22E7000, v46, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has scheduleDictionary", buf, 2u);
        }

        -[STBlueprint schedule](v146, "schedule");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v48)
        {
          v49 = [STBlueprintSchedule alloc];
          -[STBlueprint managedObjectContext](v146, "managedObjectContext");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[STBlueprintSchedule initWithContext:](v49, "initWithContext:", v50);
          -[STBlueprint setSchedule:](v146, "setSchedule:", v51);

        }
        -[STBlueprint schedule](v146, "schedule");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "updateWithDictionaryRepresentation:", v45);

        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("enabled"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v53)
        {
          -[STBlueprint schedule](v146, "schedule");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setEnabled:", v41);

          +[STLog blueprint](STLog, "blueprint");
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v161 = v41;
            _os_log_impl(&dword_1D22E7000, v55, OS_LOG_TYPE_DEFAULT, "Deserializing legacy downtime, treating blueprint enabled (%ld) as schedule enabled", buf, 0xCu);
          }

        }
        v56 = 0x1E936F000;
      }
      else
      {
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D22E7000, v46, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have a scheduleDictionary", buf, 2u);
        }

        -[STBlueprint schedule](v146, "schedule");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0x1E936F000uLL;
        if (v68)
        {
          +[STLog screentime](STLog, "screentime");
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            -[STBlueprint schedule](v146, "schedule");
            v70 = (STVersionVector *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446466;
            v161 = (unint64_t)"-[STBlueprint updateWithDictionaryRepresentation:]";
            v162 = 2112;
            v163 = v70;
            _os_log_impl(&dword_1D22E7000, v69, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting schedule (%@)", buf, 0x16u);

          }
          -[STBlueprint managedObjectContext](v146, "managedObjectContext");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[STBlueprint schedule](v146, "schedule");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "deleteObject:", v72);

        }
        -[STBlueprint setSchedule:](v146, "setSchedule:", 0);
      }
      objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("override"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v56 + 3304), "screentime");
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
      if (v73)
      {
        if (v75)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D22E7000, v74, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has overideDictionary", buf, 2u);
        }

        -[STBlueprint override](v146, "override");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v76)
        {
          v77 = [STCoreDowntimeOverride alloc];
          -[STBlueprint managedObjectContext](v146, "managedObjectContext");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = -[STCoreDowntimeOverride initWithContext:](v77, "initWithContext:", v78);
          -[STBlueprint setOverride:](v146, "setOverride:", v79);

        }
        -[STBlueprint override](v146, "override");
        v74 = objc_claimAutoreleasedReturnValue();
        -[NSObject updateWithDictionaryRepresentation:](v74, "updateWithDictionaryRepresentation:", v73);
      }
      else if (v75)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v74, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have an overideDictionary", buf, 2u);
      }

    }
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("usageLimit"));
    v80 = objc_claimAutoreleasedReturnValue();
    +[STLog screentime](STLog, "screentime");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    if (v80)
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v81, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has usageLimitDictionary", buf, 2u);
      }

      -[STBlueprint usageLimit](v146, "usageLimit");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v83)
      {
        v84 = [STBlueprintUsageLimit alloc];
        -[STBlueprint managedObjectContext](v146, "managedObjectContext");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = -[STBlueprintUsageLimit initWithContext:](v84, "initWithContext:", v85);
        -[STBlueprint setUsageLimit:](v146, "setUsageLimit:", v86);

      }
      -[STBlueprint usageLimit](v146, "usageLimit");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "updateWithDictionaryRepresentation:", v80);

    }
    else
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v81, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have a usageLimitDictionary", buf, 2u);
      }

      -[STBlueprint usageLimit](v146, "usageLimit");
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (v88)
      {
        +[STLog screentime](STLog, "screentime");
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          -[STBlueprint usageLimit](v146, "usageLimit");
          v90 = (STVersionVector *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v161 = (unint64_t)"-[STBlueprint updateWithDictionaryRepresentation:]";
          v162 = 2112;
          v163 = v90;
          _os_log_impl(&dword_1D22E7000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting usageLimit (%@)", buf, 0x16u);

        }
        -[STBlueprint managedObjectContext](v146, "managedObjectContext");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprint usageLimit](v146, "usageLimit");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "deleteObject:", v92);

      }
      -[STBlueprint setUsageLimit:](v146, "setUsageLimit:", 0);
    }
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("limitEnabled"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (v93)
      v95 = objc_msgSend(v93, "BOOLValue");
    else
      v95 = 1;
    -[STBlueprint setLimitEnabled:](v146, "setLimitEnabled:", v95);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("isTombstoned"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v96;
      if (v96)
        v98 = objc_msgSend(v96, "BOOLValue");
      else
        v98 = 0;
      -[STBlueprint setIsTombstoned:](v146, "setIsTombstoned:", v98);

    }
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setCreationDate:](v146, "setCreationDate:", v99);

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("expiration"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setExpiration:](v146, "setExpiration:", v100);

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("minimumInstallationDate"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setMinimumInstallationDate:](v146, "setMinimumInstallationDate:", v101);

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("invertUsageLimit"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprint setInvertUsageLimit:](v146, "setInvertUsageLimit:", objc_msgSend(v102, "BOOLValue"));

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      -[STBlueprint setModificationDate:](v146, "setModificationDate:", v103);
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("users"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[STCoreUser fetchRequest](STCoreUser, "fetchRequest");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v18;
    objc_msgSend(v105, "execute:", &v152);
    v106 = objc_claimAutoreleasedReturnValue();
    v14 = v152;

    v107 = (void *)v106;
    v139 = (void *)v80;
    if (!v106)
    {
      +[STLog persistence](STLog, "persistence");
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.1();
      v125 = 0;
      goto LABEL_141;
    }
    v136 = v103;
    v137 = v94;
    v108 = objc_opt_new();
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v135 = v107;
    v109 = v107;
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v149;
      do
      {
        for (i = 0; i != v111; ++i)
        {
          if (*(_QWORD *)v149 != v112)
            objc_enumerationMutation(v109);
          v114 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
          objc_msgSend(v114, "dsid");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = objc_msgSend(v104, "containsObject:", v115);

          if (v116)
            -[NSObject addObject:](v108, "addObject:", v114);
        }
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
      }
      while (v111);
    }

    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("organization.class"));
    v117 = objc_claimAutoreleasedReturnValue();
    v118 = +[STCoreOrganization internalClassForSerializableClassName:](STCoreOrganization, "internalClassForSerializableClassName:", v117);
    v138 = (void *)v117;
    if (!v118)
    {
      +[STLog persistence](STLog, "persistence");
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.2();
      v125 = 0;
      v126 = v14;
      v4 = v143;
      v103 = v136;
      v94 = v137;
      v107 = v135;
      goto LABEL_140;
    }
    -[objc_class fetchRequest](v118, "fetchRequest");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = v14;
    objc_msgSend(v119, "execute:", &v147);
    v120 = objc_claimAutoreleasedReturnValue();
    v134 = v147;

    if (v120)
    {
      if ((unint64_t)-[NSObject count](v120, "count") >= 2)
      {
        +[STLog persistence](STLog, "persistence");
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
          -[STBlueprint updateWithDictionaryRepresentation:].cold.5();

      }
      -[NSObject firstObject](v120, "firstObject");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprint setOrganization:](v146, "setOrganization:", v122);

      -[STBlueprint organization](v146, "organization");
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      if (v123)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v108);
        v124 = objc_claimAutoreleasedReturnValue();
        -[STBlueprint setUsers:](v146, "setUsers:", v124);
        v125 = 1;
LABEL_138:
        v4 = v143;
        v103 = v136;
        v94 = v137;
        v126 = v134;
        v107 = v135;
        goto LABEL_139;
      }
      +[STLog persistence](STLog, "persistence");
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
        -[STBlueprint updateWithDictionaryRepresentation:].cold.4();
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
      {
        v126 = v134;
        -[STBlueprint updateWithDictionaryRepresentation:].cold.3();
        v125 = 0;
        v4 = v143;
        v103 = v136;
        v94 = v137;
        v107 = v135;
LABEL_139:

LABEL_140:
        v14 = v126;
        v12 = v142;
LABEL_141:

        v11 = v140;
        v8 = v141;
LABEL_160:

        goto LABEL_161;
      }
    }
    v125 = 0;
    goto LABEL_138;
  }
  +[STLog screentime](STLog, "screentime");
  v127 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v127, OS_LOG_TYPE_DEFAULT, "Blueprint version clocks equal.", buf, 2u);
  }

  +[STLog screentime](STLog, "screentime");
  v128 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
    -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self, v128);

  +[STLog screentime](STLog, "screentime");
  v129 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
    -[STBlueprint updateWithDictionaryRepresentation:].cold.6();

  if (!v10)
    goto LABEL_7;
  v125 = 1;
LABEL_161:

  return v125;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[STBlueprint users](self, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("dsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[STBlueprint configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[STBlueprint configurations](self, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v11);
  }

  v41.receiver = self;
  v41.super_class = (Class)STBlueprint;
  -[STUniquedManagedObject dictionaryRepresentation](&v41, sel_dictionaryRepresentation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint type](self, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("downtime"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  if (v17)
  {
    -[STBlueprint schedule](self, "schedule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "enabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("enabled"));

    -[STBlueprint override](self, "override");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("override"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STBlueprint enabled](self, "enabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("enabled"));
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STBlueprint limitEnabled](self, "limitEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("limitEnabled"));

  -[STBlueprint creationDate](self, "creationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("creationDate"));

  -[STBlueprint expiration](self, "expiration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("expiration"));

  -[STBlueprint minimumInstallationDate](self, "minimumInstallationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("minimumInstallationDate"));

  -[STBlueprint identifier](self, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STBlueprint invertUsageLimit](self, "invertUsageLimit"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("invertUsageLimit"));

  -[STBlueprint type](self, "type");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, CFSTR("type"));

  -[STBlueprint organization](self, "organization");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("organization.class"));

  -[STBlueprint schedule](self, "schedule");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("schedule"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("configurations"));
  -[STBlueprint usageLimit](self, "usageLimit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, CFSTR("usageLimit"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("users"));
  -[STBlueprint versionVector](self, "versionVector");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, CFSTR("versionVector"));

  -[STBlueprint modificationDate](self, "modificationDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v37, CFSTR("modificationDate"));

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STBlueprint isTombstoned](self, "isTombstoned"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v38, CFSTR("isTombstoned"));

  }
  v39 = (void *)objc_msgSend(v15, "copy");

  return v39;
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
  STBlueprint *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  NSObject *v36;
  id v38;
  void *v39;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "execute:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v47 = 0;
    goto LABEL_37;
  }
  v42 = v11;
  v43 = v10;
  objc_msgSend(v13, "firstObject");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    v15 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v15;
    -[STBlueprint setIdentifier:](v15, "setIdentifier:", v16);

  }
  v40 = v14;
  v41 = a5;
  v46 = (void *)objc_opt_new();
  v44 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("configurations"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v56;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v21);
        v54 = v22;
        +[STBlueprintConfiguration fetchOrCreateWithDictionaryRepresentation:inContext:error:](STBlueprintConfiguration, "fetchOrCreateWithDictionaryRepresentation:inContext:error:", v23, v9, &v54);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v54;

        if (v19)
        {
          +[STLog persistence](STLog, "persistence");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v60 = (const char *)v19;
            _os_log_error_impl(&dword_1D22E7000, v25, OS_LOG_TYPE_ERROR, "Could not create blueprint configuration: %{public}@", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v24, "setBlueprint:", v47);
          objc_msgSend(v46, "addObject:", v24);
        }

        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v47, "setConfigurations:", v46);
  +[STBlueprintConfiguration fetchRequest](STBlueprintConfiguration, "fetchRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("blueprint"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPredicate:", v27);

  v53 = v19;
  objc_msgSend(v26, "execute:", &v53);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v53;

  v45 = v28;
  if (v28)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v30 = v28;
    v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    if (v31)
    {
      v32 = v31;
      v38 = v29;
      v39 = v26;
      v33 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v50 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          +[STLog screentime](STLog, "screentime");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v60 = "+[STBlueprint fetchOrCreateWithDictionaryRepresentation:inContext:error:]";
            v61 = 2112;
            v62 = v35;
            _os_log_impl(&dword_1D22E7000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s: deleting orphanConfiguration (%@)", buf, 0x16u);
          }

          objc_msgSend(v9, "deleteObject:", v35);
        }
        v32 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      }
      while (v32);
      v10 = v43;
      v8 = v44;
      a5 = v41;
      v11 = v42;
      v26 = v39;
      v14 = v40;
      v29 = v38;
      goto LABEL_33;
    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[STBlueprint fetchOrCreateWithDictionaryRepresentation:inContext:error:].cold.1();
  }
  v11 = v42;
  v10 = v43;
  v14 = v40;
  v8 = v44;
LABEL_33:

  if (a5 && v29)
    *a5 = objc_retainAutorelease(v29);

LABEL_37:
  return v47;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("bp");
}

+ (id)scheduleTextWithLocale:(id)a3 weekdayScheduleComparator:(id)a4 scheduleTimeGetter:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD aBlock[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[4];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setLocale:", v7);
  objc_msgSend(v11, "shortWeekdaySymbols");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v7;
  v12 = v9;
  v13 = objc_msgSend(v11, "maximumRangeOfUnit:", 512);
  v15 = v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v14);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v15);
  v17 = objc_msgSend(v11, "firstWeekday");
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = v17;
  v18 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__STBlueprint_scheduleTextWithLocale_weekdayScheduleComparator_scheduleTimeGetter___block_invoke;
  aBlock[3] = &unk_1E9370DD0;
  v76 = v17;
  v45 = v8;
  v73 = v45;
  v75 = v79;
  v46 = v12;
  v74 = v46;
  v19 = v16;
  v67 = v19;
  v77 = v13;
  v78 = v15 + v13 - 1;
  v48 = v58;
  v68 = v48;
  v47 = v11;
  v69 = v47;
  v49 = v18;
  v70 = v49;
  v51 = v60;
  v71 = v51;
  v55 = v56;
  v72 = v55;
  v52 = _Block_copy(aBlock);
  if (v17 == v15 + v13 - 1)
    v20 = v13;
  else
    v20 = v17 + 1;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v13, v15);
  objc_msgSend(v21, "enumerateIndexesInRange:options:usingBlock:", v20, v15 + v13 - v20, 0, v52);
  objc_msgSend(v21, "enumerateIndexesInRange:options:usingBlock:", v13, v20 - v13, 0, v52);
  v50 = v21;
  +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = v51;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v61 = (id)objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v19;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
  v24 = 0;
  if (v23)
  {
    v54 = *(_QWORD *)v63;
    do
    {
      v59 = v23;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v63 != v54)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v55, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");
        if (v28 < 3)
        {
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CustomScheduleTwoWeekdayRangeSeparator"), &stru_1E9372498, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "componentsJoinedByString:", v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CustomScheduleThreeOrMoreWeekdayRangeCommaSeparator"), &stru_1E9372498, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v28 - 1;
          objc_msgSend(v27, "subarrayWithRange:", 0, v28 - 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "componentsJoinedByString:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CustomScheduleThreeOrMoreWeekdayRangeAndSeparator"), &stru_1E9372498, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v27, "objectAtIndexedSubscript:", v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v34, "initWithFormat:locale:", v33, v61, v35);

          objc_msgSend(v32, "stringByAppendingString:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 1;
        }

        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CustomDailyScheduleFormat"), &stru_1E9372498, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:locale:", v38, v61, v37, v26, v45, v46, v47, v48, v49);
        objc_msgSend(v57, "addObject:", v39);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v57, "count"))
  {
    v40 = CFSTR("CustomScheduleDetailTextCommaSeparator");
    if ((v24 & 1) != 0)
      v40 = CFSTR("CustomScheduleDetailTextSemicolonSeparator");
    v41 = v40;
    objc_msgSend(v22, "localizedStringForKey:value:table:", v41, &stru_1E9372498, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "componentsJoinedByString:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = 0;
  }

  _Block_object_dispose(v79, 8);
  return v43;
}

void __83__STBlueprint_scheduleTextWithLocale_weekdayScheduleComparator_scheduleTimeGetter___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (*(_QWORD *)(a1 + 104) == a2 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))() & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v14 = v4;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
      if (*(_QWORD *)(a1 + 112) == a2)
        v5 = *(_QWORD *)(a1 + 120);
      else
        v5 = a2 - 1;
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      if (v6 == v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5 - 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "nextDateAfterDate:matchingUnit:value:options:", *(_QWORD *)(a1 + 56), 512, v6, 1024);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "nextDateAfterDate:matchingUnit:value:options:", v8, 512, v5, 1024);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_opt_new();
        v11 = v10;
        if (*(_QWORD *)(a1 + 64))
          objc_msgSend(v10, "setLocale:");
        objc_msgSend(v11, "setDateTemplate:", CFSTR("ccc"));
        objc_msgSend(v11, "stringFromDate:toDate:", v8, v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "addObject:", v7);
      }
      else
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
        objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v13, v14);
      }

      v4 = v14;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = a2;

  }
}

+ (id)blueprintTypeForDeclarationType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v42;
  char v43;
  void *v44;
  int v45;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D134B8], "registeredIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("always-allowed-apps");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D134C0], "registeredIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("downtime");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13498], "registeredIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13550], "registeredIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13588], "registeredIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v3, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13538], "registeredIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v3, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13558], "registeredIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v3, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D134A0], "registeredIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v3, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13480], "registeredIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v3, "isEqualToString:", v21);

      if ((v22 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13580], "registeredIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v3, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13578], "registeredIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v3, "isEqualToString:", v25);

      if ((v26 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13540], "registeredIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v3, "isEqualToString:", v27);

      if ((v28 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13570], "registeredIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v3, "isEqualToString:", v29);

      if ((v30 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D134B0], "registeredIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v3, "isEqualToString:", v31);

      if ((v32 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13468], "registeredIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v3, "isEqualToString:", v33);

      if ((v34 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D134A8], "registeredIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v3, "isEqualToString:", v35);

      if ((v36 & 1) != 0)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0D13568], "registeredIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v3, "isEqualToString:", v37);

      if ((v38 & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D13590], "registeredIdentifier"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend(v3, "isEqualToString:", v39),
            v39,
            (v40 & 1) != 0))
      {
LABEL_21:
        v6 = CFSTR("restrictions");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D13478], "registeredIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v3, "isEqualToString:", v42);

        v6 = CFSTR("restrictions");
        if ((v43 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D135A0], "registeredIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v3, "isEqualToString:", v44);

          if (!v45)
            v6 = 0;
        }
      }
    }
  }

  return (id)v6;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STBlueprint;
  v5 = -[STBlueprint validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STBlueprint _validateUsersOnBlueprint:](self, "_validateUsersOnBlueprint:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STBlueprint;
  v5 = -[STBlueprint validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STBlueprint _validateUsersOnBlueprint:](self, "_validateUsersOnBlueprint:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STBlueprint;
  v3 = -[STBlueprint validateForDelete:](&v5, sel_validateForDelete_, a3);
  if (v3)
    _os_feature_enabled_impl();
  return v3;
}

- (BOOL)_validateUsersOnBlueprint:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  -[STBlueprint users](self, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    if (!a3)
      return 0;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("There must be one user assigned to Blueprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 531, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      return 0;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v27 = v18;
    v28 = CFSTR("There must be one user assigned to Blueprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    v16 = 531;
    goto LABEL_9;
  }
  -[STBlueprint users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 2)
  {
    if (!a3)
      return 0;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("There must be one and only one user assigned to Blueprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 532, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      return 0;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v23 = v10;
    v24 = CFSTR("There must be one and only one user assigned to Blueprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = 532;
LABEL_9:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v16, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return 1;
}

+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 error:(id *)a5
{
  return +[STBlueprint saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:](STBlueprint, "saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:", a3, a4, 1, a5);
}

+ (BOOL)saveDefaultAlwaysAllowListIfNecessaryForUser:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  uint8_t v10[16];

  v5 = a3;
  +[STLog persistence](STLog, "persistence");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to save the default Always Allow list, if necessary.", v10, 2u);
  }

  +[STBlueprint defaultAlwaysAllowBundleIDs](STBlueprint, "defaultAlwaysAllowBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[STBlueprint saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:](STBlueprint, "saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:", v5, v7, 0, a4);

  return v8;
}

+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 overwriteExistingList:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  STBlueprint *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  STBlueprintConfiguration *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  id *v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "managingOrganization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v54 = a6;
    objc_msgSend(v9, "dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alwaysAllowActivationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v12, CFSTR("always-allowed-apps"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
    v57 = 0;
    objc_msgSend(v14, "execute:", &v57);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v57;
    if (!v16)
    {
      +[STLog persistence](STLog, "persistence");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.2();

      if (a6)
      {
        v17 = objc_retainAutorelease(v17);
        v23 = 0;
        *a6 = v17;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_45;
    }
    if ((unint64_t)objc_msgSend(v16, "count") >= 2)
    {
      +[STLog persistence](STLog, "persistence");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.6();

    }
    v53 = v10;
    objc_msgSend(v9, "managedObjectContext");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v19;
    if (v20)
    {
      v21 = (STBlueprint *)v20;
      if (!a5)
      {
        +[STLog persistence](STLog, "persistence");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.5(v45);
        v23 = 1;
        goto LABEL_44;
      }
      v51 = v15;
    }
    else
    {
      v51 = v15;
      v21 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v19);
      -[STBlueprint setType:](v21, "setType:", CFSTR("always-allowed-apps"));
      objc_msgSend(v9, "alwaysAllowActivationIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprint setIdentifier:](v21, "setIdentifier:", v25);

      -[STBlueprint setOrganization:](v21, "setOrganization:", v11);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, 0);
      -[STBlueprint setUsers:](v21, "setUsers:", v26);

    }
    -[STBlueprint setIsDirty:](v21, "setIsDirty:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v9, "alwaysAllowConfigurationIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v30);
    v31 = objc_claimAutoreleasedReturnValue();

    -[STBlueprint configurations](v21, "configurations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v31;
    objc_msgSend(v32, "filteredSetUsingPredicate:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v28;
    objc_msgSend(v33, "sortedArrayUsingDescriptors:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v35 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v52);
      objc_msgSend(v9, "alwaysAllowConfigurationIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintConfiguration setIdentifier:](v35, "setIdentifier:", v36);

      -[STBlueprintConfiguration setBlueprint:](v35, "setBlueprint:", v21);
    }
    v37 = (void *)MEMORY[0x1E0D134B8];
    objc_msgSend(v9, "alwaysAllowConfigurationIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "buildWithIdentifier:withMode:withApps:", v38, *MEMORY[0x1E0D13418], v53);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "updateServerHash");
    v56 = v17;
    objc_msgSend(v39, "serializeAsDataWithError:", &v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v56;

    if (v40)
    {
      -[STBlueprintConfiguration setPayloadPlist:](v35, "setPayloadPlist:", v40);
      objc_msgSend(v39, "declarationType");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintConfiguration setType:](v35, "setType:", v42);

      if ((_os_feature_enabled_impl() & 1) != 0 || !objc_msgSend(v52, "hasChanges"))
      {
        v23 = 1;
LABEL_43:

        v17 = v41;
        v45 = v50;
        v15 = v51;
LABEL_44:

        v10 = v53;
LABEL_45:

        goto LABEL_46;
      }
      v55 = v41;
      v43 = objc_msgSend(v52, "save:", &v55);
      v44 = v55;

      if ((v43 & 1) != 0)
      {
        v23 = 1;
LABEL_42:
        v41 = v44;
        goto LABEL_43;
      }
      +[STLog persistence](STLog, "persistence");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.4();

      if (!v54)
      {
        v23 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.3();

      if (!v54)
      {
        v23 = 0;
        goto LABEL_43;
      }
      v44 = v41;
    }
    v41 = objc_retainAutorelease(v44);
    v23 = 0;
    *v54 = v41;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  +[STLog persistence](STLog, "persistence");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.1();

  if (a6)
  {
    v17 = objc_retainAutorelease(v17);
    v23 = 0;
    *a6 = v17;
  }
  else
  {
    v23 = 0;
  }
LABEL_46:

  return v23;
}

+ (NSArray)defaultAlwaysAllowBundleIDs
{
  return (NSArray *)&unk_1E938DCC8;
}

- (void)setDowntimeEnabled:(BOOL)a3
{
  -[STBlueprint setEnabled:](self, "setEnabled:", a3);
  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
}

- (id)_downtimeConfigurationAtDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STDowntimeConfiguration *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  STDowntimeConfiguration *v21;
  void *v22;
  STDowntimeConfiguration *v23;
  STDowntimeConfiguration *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  STDowntimeConfiguration *v29;
  STDowntimeConfiguration *v30;

  v6 = a4;
  v7 = a3;
  -[STBlueprint schedule](self, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint activeOverride](self, "activeOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  STUTCErasedDateFromDate(v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v6, "copy");
  STUTCTimeZone();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);

  v13 = -[STDowntimeConfiguration initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:]([STDowntimeConfiguration alloc], "initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:", 0, v10, 0, 0, v11);
  v14 = objc_msgSend(v8, "enabled");
  if ((-[STBlueprint enabled](self, "enabled") & 1) == 0
    && (v14 & 1) == 0
    && (!v9 || (objc_msgSend(v9, "isActiveAtDate:", v10) & 1) == 0))
  {
    goto LABEL_25;
  }
  if (objc_msgSend(v9, "isActiveAtDate:", v10))
  {
    v15 = objc_msgSend(v9, "state");
    v16 = 2;
    if (!v14)
      v16 = 0;
    v17 = v14;
    v18 = 4;
    if (v15 != 1)
    {
      v18 = 0;
      v17 = 0;
    }
    if (v15)
      v19 = v18;
    else
      v19 = 3;
    if (v15)
      v20 = v17;
    else
      v20 = v16;
    v21 = [STDowntimeConfiguration alloc];
    objc_msgSend(v9, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[STDowntimeConfiguration initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:](v21, "initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:", v19, v10, v20, v22, v11);

    v24 = v23;
    goto LABEL_26;
  }
  if (!v14)
  {
LABEL_25:
    v24 = v13;
LABEL_26:
    v30 = v24;
    goto LABEL_27;
  }
  v25 = objc_msgSend(v8, "isActiveAtDate:inCalendar:", v10, v11);
  if (v25)
    v26 = 2;
  else
    v26 = 1;
  if (v25)
    v27 = 1;
  else
    v27 = 2;
  objc_msgSend(v8, "computeNextScheduleBoundaryAfterDate:inCalendar:isStartDate:", v10, v11, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[STDowntimeConfiguration initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:]([STDowntimeConfiguration alloc], "initWithCurrentState:currentDate:nextState:nextStateChangeDate:calendar:", v26, v10, v27, v28, v11);

  v30 = v29;
LABEL_27:

  return v30;
}

- (STDowntimeConfiguration)downtimeConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint _downtimeConfigurationAtDate:inCalendar:](self, "_downtimeConfigurationAtDate:inCalendar:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (STDowntimeConfiguration *)v5;
}

+ (id)downtimeConfigurationForUserID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  +[STBlueprint _userForUserID:inContext:error:](STBlueprint, "_userForUserID:inContext:error:", a3, v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprint _downtimeForUser:inContext:error:](STBlueprint, "_downtimeForUser:inContext:error:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "downtimeConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[STBlueprint schedule](self, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStartTime:endTime:", v7, v6);

  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
  -[STBlueprint _updateActiveOverrideAfterScheduleChange](self, "_updateActiveOverrideAfterScheduleChange");
}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[STBlueprint schedule](self, "schedule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStartTime:endTime:forDay:", v9, v8, a5);

  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
  -[STBlueprint _updateActiveOverrideAfterScheduleChange](self, "_updateActiveOverrideAfterScheduleChange");
}

- (void)disableDowntimeForDay:(unint64_t)a3
{
  void *v5;

  -[STBlueprint schedule](self, "schedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartTime:endTime:forDay:", 0, 0, a3);

  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
  -[STBlueprint _updateActiveOverrideAfterScheduleChange](self, "_updateActiveOverrideAfterScheduleChange");
}

- (void)_updateActiveOverrideAfterScheduleChange
{
  STBlueprintBackedDowntimeOverrideModifier *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;

  v3 = -[STBlueprintBackedDowntimeOverrideModifier initWithDowntimeBlueprint:]([STBlueprintBackedDowntimeOverrideModifier alloc], "initWithDowntimeBlueprint:", self);
  v7 = 0;
  v4 = +[STDowntimeOverrideUpdater updateActiveOverrideOnBlueprintNow:usingModifier:error:](STDowntimeOverrideUpdater, "updateActiveOverrideOnBlueprintNow:usingModifier:error:", self, v3, &v7);
  v5 = v7;
  if (!v4)
  {
    +[STLog blueprint](STLog, "blueprint");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[STBlueprint(Downtime) _updateActiveOverrideAfterScheduleChange].cold.1();

  }
}

- (id)activeOverride
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[STBlueprint override](self, "override");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || (objc_msgSend(v2, "isTombstoned") & 1) != 0 || objc_msgSend(v3, "isDeleted"))
  {
    +[STLog blueprint](STLog, "blueprint");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D22E7000, v4, OS_LOG_TYPE_INFO, "No active override for downtime", (uint8_t *)&v8, 2u);
    }
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDowntimeOverrideTransformer downtimeOverrideFromCoreDowntimeOverride:inContext:](STDowntimeOverrideTransformer, "downtimeOverrideFromCoreDowntimeOverride:inContext:", v3, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[STLog blueprint](STLog, "blueprint");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D22E7000, v4, OS_LOG_TYPE_DEFAULT, "Got active override for downtime: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5;
}

- (id)_applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 atDate:(id)a5 inCalendar:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  STBlueprintBackedDowntimeOverrideModifier *v20;
  _BOOL4 v21;
  void *v22;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  STUTCErasedDateFromDate(a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "copy");

  STUTCTimeZone();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  +[STLog blueprint](STLog, "blueprint");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v17 = CFSTR("Enable");
    else
      v17 = CFSTR("Disable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "Applying on-demand state change: %@, for fixed duration: %@, at: %@", (uint8_t *)&v24, 0x20u);

  }
  +[STDowntimeOverrideBuilder createFixedDurationOverrideWithInterval:state:creationDate:calendar:](STDowntimeOverrideBuilder, "createFixedDurationOverrideWithInterval:state:creationDate:calendar:", a3 == 1, v13, v14, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[STBlueprintBackedDowntimeOverrideModifier initWithDowntimeBlueprint:]([STBlueprintBackedDowntimeOverrideModifier alloc], "initWithDowntimeBlueprint:", self);
  v21 = -[STBlueprintBackedDowntimeOverrideModifier applyDowntimeOverride:error:](v20, "applyDowntimeOverride:error:", v19, a7);

  if (v21)
  {
    -[STBlueprint _downtimeConfigurationAtDate:inCalendar:](self, "_downtimeConfigurationAtDate:inCalendar:", v13, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  STBlueprintBackedDowntimeOverrideModifier *v19;
  _BOOL4 v20;
  void *v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  STUTCErasedDateFromDate(a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");

  STUTCTimeZone();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v13);

  -[STBlueprint _downtimeConfigurationAtDate:inCalendar:](self, "_downtimeConfigurationAtDate:inCalendar:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[STBlueprint _isStateChangeValid:forState:](STBlueprint, "_isStateChangeValid:forState:", a3, objc_msgSend(v14, "currentState")))
  {
    +[STLog blueprint](STLog, "blueprint");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("Enable");
      if (!a3)
        v16 = CFSTR("Disable");
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D22E7000, v15, OS_LOG_TYPE_DEFAULT, "Applying on-demand (automatic duration) state change: %@ at: %@", (uint8_t *)&v23, 0x16u);
    }

    -[STBlueprint schedule](self, "schedule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDowntimeOverrideBuilder createAutomaticOverrideWithState:schedule:creationDate:calendar:](STDowntimeOverrideBuilder, "createAutomaticOverrideWithState:schedule:creationDate:calendar:", a3 == 1, v17, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[STBlueprintBackedDowntimeOverrideModifier initWithDowntimeBlueprint:]([STBlueprintBackedDowntimeOverrideModifier alloc], "initWithDowntimeBlueprint:", self);
    v20 = -[STBlueprintBackedDowntimeOverrideModifier applyDowntimeOverride:error:](v19, "applyDowntimeOverride:error:", v18, a6);

    if (v20)
    {
      -[STBlueprint _downtimeConfigurationAtDate:inCalendar:](self, "_downtimeConfigurationAtDate:inCalendar:", v11, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprint _reportCoreAnalyticsEventForDowntimeOverride:currentDate:](self, "_reportCoreAnalyticsEventForDowntimeOverride:currentDate:", v18, v11);
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
    if (a6)
      *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
  }

  return v21;
}

+ (BOOL)_isStateChangeValid:(int64_t)a3 forState:(int64_t)a4
{
  char v4;
  BOOL v5;

  switch(a4)
  {
    case 0:
    case 1:
    case 3:
      v5 = a3 == 1;
      goto LABEL_4;
    case 2:
    case 4:
      v5 = a3 == 0;
LABEL_4:
      v4 = v5;
      break;
    default:
      return v4 & 1;
  }
  return v4 & 1;
}

+ (id)_downtimeForUser:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "managingOrganization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v8, CFSTR("downtime"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    objc_msgSend(v9, "execute:", &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v10)
    {
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        +[STLog persistence](STLog, "persistence");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          +[STBlueprint(Downtime) _downtimeForUser:inContext:error:].cold.3();

      }
      objc_msgSend(v10, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v14 = v13;
        v15 = v14;
      }
      else
      {
        +[STLog blueprint](STLog, "blueprint");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "dsid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v18;
          _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_INFO, "User has no downtime: %@", buf, 0xCu);

        }
        v15 = 0;
      }
    }
    else
    {
      +[STLog blueprint](STLog, "blueprint");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[STBlueprint(Downtime) _downtimeForUser:inContext:error:].cold.2();
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[STLog persistence](STLog, "persistence");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.1();

    if (a5)
    {
      v11 = objc_retainAutorelease(v11);
      v15 = 0;
      *a5 = v11;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint _applyOnDemandDowntimeStateChange:withFixedDuration:atDate:inCalendar:error:](self, "_applyOnDemandDowntimeStateChange:withFixedDuration:atDate:inCalendar:error:", a3, v9, v10, a5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)removeFixedDurationOnDemandDowntimeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  STBlueprintBackedDowntimeOverrideModifier *v8;
  char v9;
  uint8_t v11[16];

  +[STLog blueprint](STLog, "blueprint");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Removing fixed duration on-demand downtime", v11, 2u);
  }

  -[STBlueprint activeOverride](self, "activeOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "type") == 1)
  {
    v8 = -[STBlueprintBackedDowntimeOverrideModifier initWithDowntimeBlueprint:]([STBlueprintBackedDowntimeOverrideModifier alloc], "initWithDowntimeBlueprint:", self);
    v9 = -[STBlueprintBackedDowntimeOverrideModifier removeDowntimeOverrideWithError:](v8, "removeDowntimeOverrideWithError:", a3);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint _applyAutomaticOnDemandDowntimeStateChange:atDate:inCalendar:error:](self, "_applyAutomaticOnDemandDowntimeStateChange:atDate:inCalendar:error:", a3, v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)applyScheduleStateChange:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint _applyScheduleStateChange:atDate:inCalendar:error:](self, "_applyScheduleStateChange:atDate:inCalendar:error:", a3, v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 forUserID:(id)a5 context:(id)a6 error:(id *)a7
{
  void *v10;
  void *v11;
  void *v12;

  +[STBlueprint _fetchOrCreateDowntimeForUserID:inContext:error:](STBlueprint, "_fetchOrCreateDowntimeForUserID:inContext:error:", a5, a6, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "applyOnDemandDowntimeStateChange:withFixedDuration:error:", a3, a7, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)removeFixedDurationOnDemandDowntimeForUserID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  +[STBlueprint _userForUserID:inContext:error:](STBlueprint, "_userForUserID:inContext:error:", a3, v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprint _downtimeForUser:inContext:error:](STBlueprint, "_downtimeForUser:inContext:error:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "removeFixedDurationOnDemandDowntimeWithError:", a5);
  else
    v10 = 1;

  return v10;
}

+ (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;

  +[STBlueprint _fetchOrCreateDowntimeForUserID:inContext:error:](STBlueprint, "_fetchOrCreateDowntimeForUserID:inContext:error:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "applyAutomaticOnDemandDowntimeStateChange:error:", a3, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)applyScheduleStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;

  +[STBlueprint _fetchOrCreateDowntimeForUserID:inContext:error:](STBlueprint, "_fetchOrCreateDowntimeForUserID:inContext:error:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "applyScheduleStateChange:error:", a3, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_reportCoreAnalyticsEventForDowntimeOverride:(id)a3 currentDate:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  STDowntimeOverrideCoreAnalyticsEvent *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = objc_msgSend(v20, "state");
  -[STBlueprint configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:](STBlueprint, "shouldUseGracePeriodForDowntimeOverride:configuration:", v20, v9);
  -[STBlueprint schedule](self, "schedule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "enabled");
  else
    v13 = 0;
  objc_msgSend(v20, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "component:fromDate:", 32, v6);

  -[STBlueprint users](self, "users");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isManaged");

  v19 = -[STDowntimeOverrideCoreAnalyticsEvent initWithDowntimeEnabled:gracePeriodUsed:scheduleEnabled:hourOfDay:userIsManaged:]([STDowntimeOverrideCoreAnalyticsEvent alloc], "initWithDowntimeEnabled:gracePeriodUsed:scheduleEnabled:hourOfDay:userIsManaged:", v7 == 1, v10, v13, v15, v18);
  +[STCoreAnalyticsReporter reportEvent:](STCoreAnalyticsReporter, "reportEvent:", v19);

}

+ (id)_fetchOrCreateDowntimeForUserID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  +[STBlueprint _userForUserID:inContext:error:](STBlueprint, "_userForUserID:inContext:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprint _downtimeForUser:inContext:error:](STBlueprint, "_downtimeForUser:inContext:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_msgSend(v9, "isManaged");
    +[STBlueprint defaultStartTime](STBlueprint, "defaultStartTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint defaultEndTime](STBlueprint, "defaultEndTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:", v9, v12, v13, 0, 0, v11, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = v10;

  return v14;
}

+ (id)_userForUserID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "dsid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[STCoreUser fetchUserWithDSID:inContext:error:](STCoreUser, "fetchUserWithDSID:inContext:error:", v9, v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      +[STBlueprint(Downtime) _userForUserID:inContext:error:].cold.1();

    if (a5)
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 11, 0);
  }

  return v10;
}

+ (BOOL)saveDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  char v28;
  void *v29;
  id v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;

  v10 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "managedObjectContext");
  v36 = objc_claimAutoreleasedReturnValue();
  +[STBlueprint _downtimeForUser:inContext:error:](STBlueprint, "_downtimeForUser:inContext:error:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "schedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:", v18, v17, v16, v15, v10, a8, a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "schedule");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "schedule");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "enabled") == v10)
    {
      v26 = v35;
      v28 = objc_msgSend(v35, "isEqualToDictionary:", v23);

      v25 = (void *)v36;
      if ((v28 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

      v26 = v35;
      v25 = (void *)v36;
    }
    v38 = 0;
    objc_msgSend(v21, "applyScheduleStateChange:error:", v10, &v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v38;

    if (!v29)
    {
      +[STLog blueprint](STLog, "blueprint");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        +[STBlueprint(Downtime) saveDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:].cold.1(v10, (uint64_t)v30, v33);

      goto LABEL_18;
    }

LABEL_8:
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v27 = 1;
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(v25, "hasChanges"))
    {
      v37 = 0;
      v31 = objc_msgSend(v25, "save:", &v37);
      v30 = v37;
      if ((v31 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          +[STBlueprint(Downtime) saveDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:].cold.2();

LABEL_18:
        if (a9)
        {
          v30 = objc_retainAutorelease(v30);
          v27 = 0;
          *a9 = v30;
        }
        else
        {
          v27 = 0;
        }
        goto LABEL_23;
      }
    }
    else
    {
      v30 = 0;
    }
    v27 = 1;
LABEL_23:

    goto LABEL_24;
  }
  v27 = 0;
  v26 = v35;
  v25 = (void *)v36;
LABEL_25:

  return v27;
}

+ (id)_updatedDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9
{
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  STBlueprintSchedule *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v46;
  id v47;
  void *v48;
  unint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  _QWORD v54[2];

  v14 = a9;
  v54[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (v18 || v16 && v17)
  {
    objc_msgSend(v15, "managingOrganization");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v49 = a8;
      v51 = v17;
      objc_msgSend(v15, "managedObjectContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dsid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v21, CFSTR("downtime"), v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0;
      objc_msgSend(v22, "execute:", &v52);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v52;
      if (v23)
      {
        v46 = v22;
        if ((unint64_t)objc_msgSend(v23, "count") >= 2)
        {
          +[STLog persistence](STLog, "persistence");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            +[STBlueprint(Downtime) _downtimeForUser:inContext:error:].cold.3();

        }
        objc_msgSend(v23, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(a1, "_createDowntimeForUser:organization:context:", v15, v19, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "schedule");
        v26 = (STBlueprintSchedule *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v26 = -[STBlueprintSchedule initWithContext:]([STBlueprintSchedule alloc], "initWithContext:", v20);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 300.0);
          v27 = v16;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[STBlueprintSchedule setNotificationTimeInterval:](v26, "setNotificationTimeInterval:", v28);

          v16 = v27;
          v14 = a9;
          -[STBlueprintSchedule setEnabled:](v26, "setEnabled:", 0);
          objc_msgSend(v25, "setSchedule:", v26);
        }
        v47 = v16;
        objc_msgSend(a1, "_updatedScheduleFromSchedule:withStartTime:endTime:scheduleByWeekdayIndex:context:", v26, v16, v51, v18, v20);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_configurationForDowntime:context:", v25, v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_declarationForDowntime:user:configuration:behaviorType:context:error:", v25, v15, v29, v49, v20, v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30
          && objc_msgSend(a1, "_updateConfiguration:withDeclaration:context:error:", v29, v30, v20, v14))
        {
          v31 = v50;
          if ((objc_msgSend(v29, "hasChanges") & 1) != 0
            || (objc_msgSend(v48, "hasChanges") & 1) != 0
            || objc_msgSend(v25, "hasChanges"))
          {
            objc_msgSend(v25, "setIsDirty:", 1);
          }
          v14 = v25;
        }
        else
        {
          v14 = 0;
          v31 = v50;
        }

        v34 = v46;
        v16 = v47;
      }
      else
      {
        v34 = v22;
        +[STLog persistence](STLog, "persistence");
        v35 = objc_claimAutoreleasedReturnValue();
        v31 = v50;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          +[STBlueprint(Downtime) _downtimeForUser:inContext:error:].cold.2();

        if (a9)
        {
          v14 = 0;
          *a9 = objc_retainAutorelease(v50);
        }
      }

      v17 = v51;
      goto LABEL_37;
    }
    +[STLog persistence](STLog, "persistence");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      +[STBlueprint(Downtime) _updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:].cold.1();

    if (!a9)
      goto LABEL_37;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    v14 = 0;
    *a9 = v33;
LABEL_37:

    goto LABEL_38;
  }
  +[STLog persistence](STLog, "persistence");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    +[STBlueprint(Downtime) _updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);

  if (a9)
  {
    v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v53 = *MEMORY[0x1E0CB2D50];
    v54[0] = CFSTR("Cannot create downtime without valid start/end time or schedule");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v44, "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, v19);
    goto LABEL_36;
  }
LABEL_38:

  return v14;
}

+ (id)_organizationIdentifierForUser:(id)a3 context:(id)a4
{
  id v4;
  uint64_t v5;
  __CFString **v6;
  void *v7;
  int v8;
  __CFString *v9;

  v4 = a3;
  objc_msgSend(v4, "localUserDeviceState");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = &STOrganizationIdentifierFamily;
  if (v5)
  {
    v7 = (void *)v5;
    v8 = objc_msgSend(v4, "isManaged");

    if (!v8)
      v6 = STOrganizationIdentifierPersonal;
  }
  v9 = *v6;

  return v9;
}

+ (id)_userDSIDStringForUser:(id)a3 context:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "localUserDeviceState");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v4, "isManaged"), v6, !v7))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)_createDowntimeForUser:(id)a3 organization:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  STBlueprint *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a1, "_organizationIdentifierForUser:context:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDSIDStringForUser:context:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v9);

  -[STBlueprint setType:](v13, "setType:", CFSTR("downtime"));
  v14 = v11;
  v15 = v12;
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v15)
    v17 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@_%@_%@"), CFSTR("bedtime_activation"), v14, v15);
  else
    v17 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@_%@"), CFSTR("bedtime_activation"), v14, v22);
  v18 = (void *)v17;

  -[STBlueprint setIdentifier:](v13, "setIdentifier:", v18);
  -[STBlueprint setOrganization:](v13, "setOrganization:", v10);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprint setUsers:](v13, "setUsers:", v19);

  -[STBlueprint setEnabled:](v13, "setEnabled:", 0);
  v20 = (void *)objc_opt_new();
  -[STBlueprint setCreationDate:](v13, "setCreationDate:", v20);

  return v13;
}

+ (id)_updatedScheduleFromSchedule:(id)a3 withStartTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maximumRangeOfUnit:", 512);
    v18 = v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v18);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__STBlueprint_Downtime___updatedScheduleFromSchedule_withStartTime_endTime_scheduleByWeekdayIndex_context___block_invoke;
    v21[3] = &unk_1E9370E08;
    v22 = v14;
    v23 = v11;
    objc_msgSend(v19, "enumerateIndexesUsingBlock:", v21);

  }
  else if (v12 && v13)
  {
    objc_msgSend(v11, "setStartTime:endTime:", v12, v13);
  }

  return v11;
}

void __107__STBlueprint_Downtime___updatedScheduleFromSchedule_withStartTime_endTime_scheduleByWeekdayIndex_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v9, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartTime:endTime:forDay:", v7, v8, a2);

}

+ (id)_declarationModeForBehaviorType:(unint64_t)a3
{
  id *v3;

  if (!a3)
  {
    v3 = (id *)MEMORY[0x1E0D13430];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = (id *)MEMORY[0x1E0D13428];
LABEL_5:
    a1 = *v3;
  }
  return a1;
}

+ (id)_configurationForDowntime:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  STBlueprintConfiguration *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v6);
    -[STBlueprintConfiguration setBlueprint:](v11, "setBlueprint:", v5);
  }

  return v11;
}

+ (id)_declarationForDowntime:(id)a3 user:(id)a4 configuration:(id)a5 behaviorType:(unint64_t)a6 context:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  id v30;

  v13 = a7;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a1, "_organizationIdentifierForUser:context:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDSIDStringForUser:context:", v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_declarationModeForBehaviorType:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "payloadPlist");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D134C0];
  if (v19)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0D134C0], "declarationForData:error:", v19, &v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v30;
    if (v21)
    {
      objc_msgSend(v21, "setPayloadMode:", v18);

      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      +[STBlueprint(Downtime) _declarationForDowntime:user:configuration:behaviorType:context:error:].cold.1();
      if (!a8)
        goto LABEL_9;
    }
    else if (!a8)
    {
LABEL_9:

      v21 = 0;
      goto LABEL_12;
    }
    *a8 = objc_retainAutorelease(v22);
    goto LABEL_9;
  }
  v23 = v16;
  v24 = v17;
  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v24)
    v26 = objc_msgSend(v25, "initWithFormat:", CFSTR("%@_%@_%@"), CFSTR("bedtime_configuration"), v23, v24);
  else
    v26 = objc_msgSend(v25, "initWithFormat:", CFSTR("%@_%@"), CFSTR("bedtime_configuration"), v23, v29);
  v27 = (void *)v26;

  objc_msgSend(v20, "buildRequiredOnlyWithIdentifier:withMode:", v27, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v21;
}

+ (BOOL)_updateConfiguration:(id)a3 withDeclaration:(id)a4 context:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;

  v8 = a3;
  v9 = a4;
  STAvailableVersion1CategoriesExcludingSystemCategories();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPayloadCategories:", v10);

  STAvailableCategoriesExcludingSystemCategories();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPayloadCategoriesVersion2:", v11);

  objc_msgSend(v9, "updateServerHash");
  v20 = 0;
  objc_msgSend(v9, "serializeAsDataWithError:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    objc_msgSend(v8, "payloadPlist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToData:", v12);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v8, "setPayloadPlist:", v12);
      objc_msgSend(v9, "declarationIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIdentifier:", v16);

      objc_msgSend(v9, "declarationType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setType:", v17);

    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[STBlueprint(Downtime) _updateConfiguration:withDeclaration:context:error:].cold.1();

    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }

  return v12 != 0;
}

+ (NSDateComponents)defaultStartTime
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setHour:", 22);
  objc_msgSend(v2, "setMinute:", 0);
  return (NSDateComponents *)v2;
}

+ (NSDateComponents)defaultEndTime
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setHour:", 7);
  objc_msgSend(v2, "setMinute:", 0);
  return (NSDateComponents *)v2;
}

- (id)_applyScheduleStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  STBlueprintBackedDowntimeOverrideModifier *v30;
  void *v31;
  BOOL v32;
  id v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  STUTCErasedDateFromDate(a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");

  STUTCTimeZone();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v13);

  -[STBlueprint schedule](self, "schedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog blueprint](STLog, "blueprint");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[STBlueprint(Downtime) _applyScheduleStateChange:atDate:inCalendar:error:].cold.1(a3, v16, v19, v20, v21, v22, v23, v24);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("Enable");
    if (!a3)
      v17 = CFSTR("Disable");
    *(_DWORD *)buf = 138412546;
    v37 = v17;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "Appying schedule state change: %@ at: %@", buf, 0x16u);
  }

  if (a3)
  {
    if (a3 != 1 || (objc_msgSend(v14, "enabled") & 1) != 0)
      goto LABEL_28;
    v18 = 1;
  }
  else
  {
    if (!objc_msgSend(v14, "enabled"))
      goto LABEL_28;
    v18 = 0;
  }
  objc_msgSend(v14, "setEnabled:", v18);
  -[STBlueprint setEnabled:](self, "setEnabled:", v18);
  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
  objc_msgSend(v14, "managedObjectContext");
  v16 = objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (-[NSObject hasChanges](v16, "hasChanges"))
    {
      v35 = 0;
      v26 = -[NSObject save:](v16, "save:", &v35);
      v27 = v35;
      if ((v26 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[STBlueprint(Downtime) _applyScheduleStateChange:atDate:inCalendar:error:].cold.2();

        if (a6)
          *a6 = objc_retainAutorelease(v27);

LABEL_12:
        v25 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      v27 = 0;
    }

  }
  +[STLog blueprint](STLog, "blueprint");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v29, OS_LOG_TYPE_DEFAULT, "Saved downtime schedule state change", buf, 2u);
  }

LABEL_28:
  v30 = -[STBlueprintBackedDowntimeOverrideModifier initWithDowntimeBlueprint:]([STBlueprintBackedDowntimeOverrideModifier alloc], "initWithDowntimeBlueprint:", self);
  -[STBlueprint schedule](self, "schedule");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v32 = +[STDowntimeOverrideUpdater updateActiveOverrideUsingModifier:byRecomputingFromSchedule:atDate:inCalendar:error:](STDowntimeOverrideUpdater, "updateActiveOverrideUsingModifier:byRecomputingFromSchedule:atDate:inCalendar:error:", v30, v31, v11, v12, &v34);
  v16 = v34;

  if (v32)
  {
    -[STBlueprint _downtimeConfigurationAtDate:inCalendar:](self, "_downtimeConfigurationAtDate:inCalendar:", v11, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }

LABEL_33:
  return v25;
}

+ (id)keyPathsForValuesAffectingDowntimeScheduleText
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("schedule.scheduleRepresentation"));
}

- (NSString)downtimeScheduleText
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  STBlueprint *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[STBlueprint schedule](self, "schedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "simpleSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v5, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "simpleScheduleTimeRangeWithStartTimeComponents:endTimeComponents:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = v4;
    objc_msgSend(v4, "customScheduleItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "day"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    v19 = (void *)objc_opt_class();
    v20 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke;
    v28[3] = &unk_1E9370E30;
    v29 = v11;
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke_2;
    v25[3] = &unk_1E9370E58;
    v21 = v29;
    v26 = v21;
    v27 = self;
    objc_msgSend(v19, "scheduleTextWithLocale:weekdayScheduleComparator:scheduleTimeGetter:", 0, v28, v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ScheduleOff"), &stru_1E9372498, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v4 = v24;
  }

  return (NSString *)v9;
}

uint64_t __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {
      objc_msgSend(v10, "endTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customScheduleTimeRangeWithLocale:startTimeComponents:endTimeComponents:", 0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)customScheduleTimeRangeWithLocale:(id)a3 startTimeComponents:(id)a4 endTimeComponents:(id)a5
{
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL4 v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setLocale:", v7);
  objc_msgSend(v11, "setTimeStyle:", 1);
  objc_msgSend(v11, "setDateStyle:", 0);
  objc_msgSend(v11, "setFormattingContext:", 1);
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (v7)
    objc_msgSend(v12, "setLocale:", v7);
  objc_msgSend(v13, "setFormattingContext:", 1);
  objc_msgSend(v13, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v14;
  v39 = v9;
  objc_msgSend(v14, "dateFromComponents:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v18 = v17;
  if (v7)
    objc_msgSend(v17, "setLocale:", v7);
  objc_msgSend(v18, "setLocalizedDateFormatFromTemplate:", CFSTR("a"));
  objc_msgSend(v18, "stringFromDate:", v15);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate:", v16);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3578];
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v38 = v8;
  if (objc_msgSend(v20, "containsString:", CFSTR("H")))
  {

LABEL_13:
    v23 = 0;
    v24 = 1;
    goto LABEL_15;
  }
  v22 = objc_msgSend(v20, "containsString:", CFSTR("k"));

  if ((v22 & 1) != 0)
    goto LABEL_13;
  v25 = objc_msgSend(v8, "minute");
  v24 = 0;
  v23 = v25 == 0;
LABEL_15:
  if (objc_msgSend(v41, "isEqualToString:", v40))
  {
    v26 = (void *)objc_opt_new();
    v27 = v26;
    if (v7)
      objc_msgSend(v26, "setLocale:", v7);
    objc_msgSend(v27, "setFormattingContext:", 1);
    if (v23)
      v28 = CFSTR("J");
    else
      v28 = CFSTR("Jmm");
    objc_msgSend(v27, "setLocalizedDateFormatFromTemplate:", v28);
    objc_msgSend(v27, "stringFromDate:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v23)
      v30 = v13;
    else
      v30 = v11;
    objc_msgSend(v30, "stringFromDate:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v11;
  if ((v24 & 1) == 0)
  {
    if (objc_msgSend(v39, "minute"))
      v31 = v11;
    else
      v31 = v13;
  }
  objc_msgSend(v31, "stringFromDate:", v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("TimeRangeFormat"), &stru_1E9372498, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v34, v29, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)simpleScheduleTimeRangeWithStartTimeComponents:(id)a3 endTimeComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "startOfDayForDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "date:matchesComponents:", v9, v5))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v9, v5, 512);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (objc_msgSend(v7, "date:matchesComponents:", v9, v6))
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v9, v6, 512);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setDateStyle:", 0);
  objc_msgSend(v14, "setTimeStyle:", 1);
  objc_msgSend(v14, "stringFromDate:toDate:", v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)saveManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v6 = a3;
  objc_msgSend(a1, "createManagedUserBlueprintForUser:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[STLog blueprint](STLog, "blueprint");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[STBlueprint(ManagedUser) saveManagedUserBlueprintForUser:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v12 = 0;
    if (a4)
      goto LABEL_14;
    goto LABEL_15;
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || (objc_msgSend(v6, "managedObjectContext"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasChanges"),
        v8,
        !v9))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v11 = objc_msgSend(v10, "save:", &v24);
    v12 = v24;

    if ((v11 & 1) == 0)
    {
      +[STLog persistence](STLog, "persistence");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[STBlueprint(ManagedUser) saveManagedUserBlueprintForUser:error:].cold.2();

      if (a4)
      {
        v12 = objc_retainAutorelease(v12);
LABEL_14:
        v14 = 0;
        *a4 = v12;
        goto LABEL_16;
      }
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
  }
  v14 = 1;
LABEL_16:

  return v14;
}

+ (id)createManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  STBlueprint *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  STBlueprintConfiguration *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  STBlueprintConfiguration *v29;
  void *v30;
  void *v31;
  void *v32;
  STBlueprint *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;

  v5 = a3;
  objc_msgSend(v5, "managingOrganization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedUserActivationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v7, CFSTR("managed-user"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0;
    objc_msgSend(v9, "execute:", &v50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v50;
    if (v10)
    {
      v45 = v9;
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        +[STLog persistence](STLog, "persistence");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.5();

      }
      v41 = a4;
      objc_msgSend(v5, "managedObjectContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v10;
      objc_msgSend(v10, "firstObject");
      v13 = (STBlueprint *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v13 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v47);
        -[STBlueprint setType:](v13, "setType:", CFSTR("managed-user"));
        objc_msgSend(v5, "managedUserActivationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprint setIdentifier:](v13, "setIdentifier:", v14);

        -[STBlueprint setOrganization:](v13, "setOrganization:", v6);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
        -[STBlueprint setUsers:](v13, "setUsers:", v15);

      }
      -[STBlueprint setEnabled:](v13, "setEnabled:", 1);
      -[STBlueprint setIsDirty:](v13, "setIsDirty:", 1);
      objc_msgSend(v5, "iCloudLogoutConfigurationIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      -[STBlueprint configurations](v13, "configurations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredSetUsingPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyObject");
      v20 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v20 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v47);
        -[STBlueprintConfiguration setIdentifier:](v20, "setIdentifier:", v16);
        -[STBlueprintConfiguration setBlueprint:](v20, "setBlueprint:", v13);
      }
      v43 = (void *)v16;
      objc_msgSend(MEMORY[0x1E0D134D0], "buildRequiredOnlyWithIdentifier:withMode:", v16, *MEMORY[0x1E0D13448]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v11;
      objc_msgSend(v21, "serializeAsDataWithError:", &v49);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v49;

      v42 = v21;
      v46 = (void *)v22;
      if (v22)
      {
        -[STBlueprintConfiguration setPayloadPlist:](v20, "setPayloadPlist:", v22);
        objc_msgSend(v21, "declarationType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintConfiguration setType:](v20, "setType:", v24);

        objc_msgSend(v5, "automaticDateTimeConfigurationIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        -[STBlueprint configurations](v13, "configurations");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "filteredSetUsingPredicate:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "anyObject");
        v29 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          v29 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v47);
          -[STBlueprintConfiguration setIdentifier:](v29, "setIdentifier:", v25);
          -[STBlueprintConfiguration setBlueprint:](v29, "setBlueprint:", v13);
        }
        v40 = (void *)v25;
        objc_msgSend(MEMORY[0x1E0D13560], "buildRequiredOnlyWithIdentifier:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setPayloadForceAutomaticDateAndTime:", MEMORY[0x1E0C9AAB0]);
        objc_msgSend(v30, "updateServerHash");
        v48 = v23;
        objc_msgSend(v30, "serializeAsDataWithError:", &v48);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v48;

        if (v31)
        {
          -[STBlueprintConfiguration setPayloadPlist:](v29, "setPayloadPlist:", v31);
          objc_msgSend(v30, "declarationType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[STBlueprintConfiguration setType:](v29, "setType:", v32);

          v33 = v13;
        }
        else
        {
          +[STLog persistence](STLog, "persistence");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.4();

          v33 = 0;
          if (v41)
            *v41 = objc_retainAutorelease(v11);
        }
        v38 = v43;

        v10 = v44;
        v9 = v45;
      }
      else
      {
        +[STLog persistence](STLog, "persistence");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.3();

        v10 = v44;
        v9 = v45;
        if (v41)
        {
          v11 = objc_retainAutorelease(v23);
          v33 = 0;
          *v41 = v11;
        }
        else
        {
          v33 = 0;
          v11 = v23;
        }
        v38 = v43;
      }

    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.2();

      if (a4)
      {
        v11 = objc_retainAutorelease(v11);
        v33 = 0;
        *a4 = v11;
      }
      else
      {
        v33 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[STLog persistence](STLog, "persistence");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.1();

    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v33 = 0;
      *a4 = v11;
    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
}

+ (BOOL)deleteManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;

  v6 = a3;
  v19 = 0;
  v7 = objc_msgSend(a1, "disableManagedUserBlueprintForUser:error:", v6, &v19);
  v8 = v19;
  if ((v7 & 1) != 0)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || (objc_msgSend(v6, "managedObjectContext"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "hasChanges"),
          v9,
          !v10))
    {
      v14 = 1;
      goto LABEL_18;
    }
    objc_msgSend(v6, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v12 = objc_msgSend(v11, "save:", &v18);
    v13 = v18;

    if ((v12 & 1) != 0)
    {
      v14 = 1;
LABEL_17:
      v8 = v13;
      goto LABEL_18;
    }
    +[STLog persistence](STLog, "persistence");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[STBlueprint(ManagedUser) deleteManagedUserBlueprintForUser:error:].cold.1();

    if (!a4)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v8 = v13;
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[STBlueprint(ManagedUser) deleteManagedUserBlueprintForUser:error:].cold.2();

    if (!a4)
    {
      v14 = 0;
      goto LABEL_18;
    }
  }
  v8 = objc_retainAutorelease(v8);
  v14 = 0;
  *a4 = v8;
LABEL_18:

  return v14;
}

+ (BOOL)disableManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;

  v5 = a3;
  objc_msgSend(v5, "managingOrganization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedUserActivationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v7, CFSTR("managed-user"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(v9, "execute:", &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    v12 = v10 != 0;
    if (v10)
    {
      v13 = objc_msgSend(v10, "count");
      if (v13)
      {
        if (v13 != 1)
        {
          +[STLog persistence](STLog, "persistence");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.5();

        }
        objc_msgSend(v10, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEnabled:", 0);
        objc_msgSend(v15, "setIsDirty:", 1);

      }
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[STBlueprint(ManagedUser) disableManagedUserBlueprintForUser:error:].cold.3();

      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[STLog persistence](STLog, "persistence");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.1();

    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v12 = 0;
      *a4 = v11;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)disableRestrictionsBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;

  v5 = a3;
  objc_msgSend(v5, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managingOrganization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v6, CFSTR("restrictions"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v8, "execute:", &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    if (v9)
    {
      objc_msgSend(v5, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      objc_msgSend(v12, "setIsDirty:", 1);
      objc_msgSend(v12, "setEnabled:", 0);
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);

        if (objc_msgSend(v11, "hasChanges"))
        {
          v28 = v10;
          v22 = objc_msgSend(v11, "save:", &v28);
          v27 = v28;

          if ((v22 & 1) != 0)
          {
            v13 = 1;
            v10 = v27;
          }
          else
          {
            +[STLog persistence](STLog, "persistence");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:].cold.3();

            if (a4)
            {
              v10 = objc_retainAutorelease(v27);
              v13 = 0;
              *a4 = v10;
            }
            else
            {
              v10 = v27;
              v13 = 0;
            }
          }
        }
        else
        {
          v13 = 1;
        }
      }

    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:].cold.2();

      if (a4)
      {
        v10 = objc_retainAutorelease(v10);
        v13 = 0;
        *a4 = v10;
      }
      else
      {
        v13 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[STLog persistence](STLog, "persistence");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.1();

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v13 = 0;
      *a4 = v10;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_webFilterBlacklistStringsForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v8, &stru_1E9372498);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = v5;
  v13[2] = v9;
  v13[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v45 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v7 = a4;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[STBlueprint configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v9)
    goto LABEL_9;
  v10 = v9;
  v11 = *(_QWORD *)v48;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v48 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v13, "type", v45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("system.webcontentfilter.basic"));

      if ((v15 & 1) != 0)
      {
        v16 = v13;

        if (!v16)
          goto LABEL_20;
        objc_msgSend(v16, "cemConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v17, "payloadRestrictWeb"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "BOOLValue"),
              v18,
              (v19 & 1) != 0))
        {
          objc_msgSend(v17, "payloadUseContentFilter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLValue");

          objc_msgSend(v17, "payloadWhiteListEnabled");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          v24 = v46;
          v25 = v7;
          if (v21 && (v23 & 1) == 0)
          {
            objc_msgSend(v17, "payloadFilterBlackList");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[STBlueprint _webFilterBlacklistStringsForURL:](self, "_webFilterBlacklistStringsForURL:", v46);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "removeObjectsInArray:", v28);
              objc_msgSend(v27, "array");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setPayloadFilterBlackList:", v29);

            }
            objc_msgSend(v17, "payloadFilterWhiteList");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            v32 = (void *)MEMORY[0x1E0C9AA60];
            if (v30)
              v32 = (void *)v30;
            v33 = v32;

            objc_msgSend(v46, "host");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "arrayByAddingObject:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setPayloadFilterWhiteList:", v35);
LABEL_37:

            objc_msgSend(v17, "updateServerHash");
            objc_msgSend(v16, "setCemConfiguration:", v17);
            v36 = 1;
            -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
LABEL_38:

            goto LABEL_39;
          }
          if (((v21 | v23 ^ 1) & 1) == 0)
          {
            v26 = (void *)objc_opt_new();
            objc_msgSend(v46, "absoluteString");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setPayloadAddress:", v39);

            objc_msgSend(v26, "setPayloadPageTitle:", v25);
            objc_msgSend(v17, "payloadSiteWhiteList");
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v40;
            v42 = (void *)MEMORY[0x1E0C9AA60];
            if (v40)
              v42 = (void *)v40;
            v43 = v42;

            objc_msgSend(v43, "arrayByAddingObject:", v26);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setPayloadSiteWhiteList:", v34);
            goto LABEL_37;
          }
          +[STLog blueprint](STLog, "blueprint");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[STBlueprint(Restrictions) permitWebFilterURL:pageTitle:error:].cold.1();

        }
        else
        {
          +[STLog blueprint](STLog, "blueprint");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[STBlueprint(Restrictions) permitWebFilterURL:pageTitle:error:].cold.2();

          v24 = v46;
          v25 = v7;
        }
        if (v45)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, 0);
          v36 = 0;
          *v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        goto LABEL_38;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v10)
      continue;
    break;
  }
LABEL_9:

LABEL_20:
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 14, 0);
    v36 = 0;
    *v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v24 = v46;
  v25 = v7;
LABEL_39:

  return v36;
}

+ (BOOL)saveRestrictionsBlueprintWithValuesForPresetRestrictions:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  __CFString **v58;
  void *v59;
  int v60;
  __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  NSObject *v73;
  id v74;
  void *v75;
  SEL v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  __CFString *v81;
  id v82;
  NSObject *v83;
  id v84;
  id v85;
  __CFString *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  id v90;
  __CFString *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  STBlueprint *v109;
  __CFString *v110;
  id v111;
  __CFString *v112;
  BOOL v113;
  NSObject *v114;
  NSObject *v115;
  __CFString *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  void *v130;
  STBlueprintConfiguration *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  NSObject *v146;
  NSObject *v147;
  id v148;
  id v149;
  uint64_t v150;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  __CFString *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  __CFString *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  id v168;
  void *v169;
  void *v171;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  id obj;
  id obja;
  NSObject *v182;
  NSObject *v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  _BYTE v202[128];
  void *v203;
  id v204;
  _QWORD v205[2];
  _QWORD v206[2];
  _QWORD v207[2];
  _QWORD v208[2];
  _QWORD v209[16];
  uint8_t buf[4];
  uint64_t v211;
  __int16 v212;
  void *v213;
  __int16 v214;
  __CFString *v215;
  __int16 v216;
  void *v217;
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v156 = a4;
  v7 = v6;
  v8 = (void *)objc_opt_new();
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v193, v209, 16);
  v11 = 0x1E0CB3000uLL;
  v153 = v9;
  if (v10)
  {
    v12 = v10;
    v177 = *(_QWORD *)v194;
    v158 = v8;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v194 != v177)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * v13);
        objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("."));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "lastObject");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeLastObject");
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v19 = v17;
        v20 = v18;
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        obj = (id)objc_claimAutoreleasedReturnValue();
        if (!obj)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          obj = (id)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration")))
        {
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("STCustomRestrictionCellularData")))
          {
            v207[0] = CFSTR("network.cellular.settings.allowAppCellularDataModification");
            v207[1] = CFSTR("network.cellular.settings.allowCellularPlanModification");
            v21 = obj;
            v208[0] = obj;
            v208[1] = obj;
            v22 = (void *)MEMORY[0x1E0C99D80];
            v23 = v208;
            v24 = v207;
LABEL_20:
            objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          v21 = obj;
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("STCustomRestrictionSiriDictation")))
          {
            v205[0] = CFSTR("system.siri.allowAssistant");
            v205[1] = CFSTR("system.siri.allowDictation");
            v206[0] = obj;
            v206[1] = obj;
            v22 = (void *)MEMORY[0x1E0C99D80];
            v23 = v206;
            v24 = v205;
            goto LABEL_20;
          }
          v168 = v20;
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("STCustomRestrictionWebFilterState")))
          {
            v30 = objc_msgSend(obj, "unsignedIntegerValue");
            if (v30)
            {
              v31 = v30;
              if (v30 == 2)
              {
                v162 = v19;
                v166 = v12;
                v160 = (void *)objc_msgSend(&unk_1E938DE98, "mutableCopy");
                objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "defaultUserBookmarks");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v197 = 0u;
                v198 = 0u;
                v199 = 0u;
                v200 = 0u;
                v37 = v35;
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v198;
                  do
                  {
                    for (i = 0; i != v39; ++i)
                    {
                      if (*(_QWORD *)v198 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
                      v43 = (void *)MEMORY[0x1E0D13548];
                      objc_msgSend(v42, "URL");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "absoluteString");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "title");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "buildWithAddress:withPageTitle:", v45, v46);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v36, "addObject:", v47);
                    }
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v197, buf, 16);
                  }
                  while (v39);
                }

                v48 = (void *)objc_msgSend(v36, "copy");
                objc_msgSend(v160, "setObject:forKeyedSubscript:", v48, CFSTR("system.webcontentfilter.basic.siteWhiteList"));

                v29 = (void *)objc_msgSend(v160, "copy");
                v9 = v153;
                v11 = 0x1E0CB3000;
                v8 = v158;
                v19 = v162;
                v12 = v166;
                v21 = obj;
              }
              else if (v30 == 1)
              {
                v29 = &unk_1E938DE70;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "NSDictionary<NSString *,id> * _Nonnull restrictionsForWebFilterState(STWebFilterState)");
                v50 = v19;
                v51 = v12;
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("STBlueprint+Restrictions.m"), 445, CFSTR("Unimplemented web filter state %d"), v31);

                v12 = v51;
                v19 = v50;

                v29 = (void *)MEMORY[0x1E0C9AA70];
              }
            }
            else
            {
              v29 = &unk_1E938DE48;
            }
            v20 = v168;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "NSDictionary<NSString *,id> * _Nonnull valuesForRestrictionsToSaveFromPresetRestrictions(NSDictionary<NSString *,id> * _Nonnull __strong)");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("STBlueprint+Restrictions.m"), 362, CFSTR("Unimplemented restriction %@ %@"), v168, v19);

            v20 = v168;
            v29 = 0;
          }
        }
        else
        {
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("system.gamecenter"))
            && objc_msgSend(v19, "isEqualToString:", CFSTR("allowedGameCenterOtherPlayerTypes")))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = v20;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "NSDictionary<NSString *,id> * _Nonnull valuesForRestrictionsToSaveFromPresetRestrictions(NSDictionary<NSString *,id> * _Nonnull __strong)");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("STBlueprint+Restrictions.m"), 366, CFSTR("Unimplemented non-preset restriction %@ %@"), v25, v19);

            v20 = v25;
          }
          v203 = v14;
          v21 = obj;
          v28 = obj;
          if (!obj)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v174;
          }
          v204 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!obj)

        }
LABEL_21:
        objc_msgSend(v8, "addEntriesFromDictionary:", v29);

        ++v13;
      }
      while (v13 != v12);
      v53 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v193, v209, 16);
      v12 = v53;
    }
    while (v53);
  }

  v54 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v156, "dsid");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v156;
  objc_msgSend(v56, "localUserDeviceState");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = &STOrganizationIdentifierFamily;
  if (v57)
  {
    objc_msgSend(v56, "familySettings");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isManaged");

    if (!v60)
      v58 = STOrganizationIdentifierPersonal;
  }
  v61 = *v58;
  v152 = v56;

  v167 = (void *)objc_opt_new();
  v159 = (void *)objc_opt_new();
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  obja = v54;
  v157 = v61;
  v178 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
  if (v178)
  {
    v175 = *(_QWORD *)v190;
    v154 = v55;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v190 != v175)
          objc_enumerationMutation(obja);
        v63 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v62);
        objc_msgSend(obja, "objectForKeyedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64 == v65)
        {

          v64 = 0;
        }
        v66 = v63;
        objc_msgSend(v66, "componentsSeparatedByString:", CFSTR("."));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v67, "mutableCopy");

        objc_msgSend(v68, "lastObject");
        v69 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "removeLastObject");
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("."));
        v70 = (id)objc_claimAutoreleasedReturnValue();

        v71 = v69;
        v72 = v70;
        +[STLog persistence](STLog, "persistence");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v211 = (uint64_t)v66;
          v212 = 2114;
          v213 = v64;
          v214 = 2114;
          v215 = v61;
          v216 = 2112;
          v217 = v55;
          _os_log_impl(&dword_1D22E7000, v73, OS_LOG_TYPE_DEFAULT, "Asked to change restriction %{public}@ value to %{public}@ for %{public}@.%@", buf, 0x2Au);
        }

        if (objc_msgSend(v72, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v74 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STBlueprint+Restrictions.m"), 211, CFSTR("Unimplemented restriction %@ %@"), v72, v71);
          goto LABEL_60;
        }
        if (objc_msgSend(v72, "isEqualToString:", CFSTR("STSBCapabilityConfiguration")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v75;
          v148 = v72;
          v149 = v71;
          v77 = a1;
          v76 = a2;
          v78 = 213;
LABEL_59:
          objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", v76, v77, CFSTR("STBlueprint+Restrictions.m"), v78, CFSTR("Unimplemented non-preset restriction %@ %@"), v148, v149);
          goto LABEL_60;
        }
        if (objc_msgSend(v72, "isEqualToString:", CFSTR("STMCFeatureConfiguration")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v75;
          v148 = v72;
          v149 = v71;
          v77 = a1;
          v76 = a2;
          v78 = 215;
          goto LABEL_59;
        }
        objc_msgSend(v167, "objectForKeyedSubscript:", v72);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v79)
        {
          v80 = v72;
          v81 = v61;
          v82 = v55;
          +[STLog persistence](STLog, "persistence");
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v211 = (uint64_t)v80;
            _os_log_impl(&dword_1D22E7000, v83, OS_LOG_TYPE_DEFAULT, "Creating new restriction configuration %{public}@", buf, 0xCu);
          }

          v84 = v80;
          v85 = v82;
          v86 = v81;
          if (-[__CFString isEqualToString:](v86, "isEqualToString:", CFSTR("personal")))
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("digital_health_restrictions"), v84, v150);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("digital_health_restrictions"), v85, v84);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v84, "isEqualToString:", CFSTR("account.settings")))
          {
            v88 = (void *)MEMORY[0x1E0D13468];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("application.settings")))
          {
            v88 = (void *)MEMORY[0x1E0D13478];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("application.store")))
          {
            v88 = (void *)MEMORY[0x1E0D13480];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("legacy.restrictions.apps")))
          {
            objc_msgSend(MEMORY[0x1E0D13498], "buildRequiredOnlyWithIdentifier:", v87);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setPayloadBlacklistedAppBundleIDs:", MEMORY[0x1E0C9AA60]);
            goto LABEL_76;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("media.settings")))
          {
            v88 = (void *)MEMORY[0x1E0D134A0];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("network.cellular.settings")))
          {
            v88 = (void *)MEMORY[0x1E0D134A8];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("passcode.settings")))
          {
            v88 = (void *)MEMORY[0x1E0D134B0];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.airdrop")))
          {
            v88 = (void *)MEMORY[0x1E0D13538];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.camera")))
          {
            v88 = (void *)MEMORY[0x1E0D13550];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.carplay")))
          {
            v88 = (void *)MEMORY[0x1E0D13558];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.donotdisturb")))
          {
            v88 = (void *)MEMORY[0x1E0D13568];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.gamecenter")))
          {
            v88 = (void *)MEMORY[0x1E0D13570];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.icloud")))
          {
            v88 = (void *)MEMORY[0x1E0D135A0];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.music")))
          {
            v88 = (void *)MEMORY[0x1E0D13578];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.ratings")))
          {
            v88 = (void *)MEMORY[0x1E0D13580];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.siri")))
          {
            v88 = (void *)MEMORY[0x1E0D13588];
            goto LABEL_74;
          }
          if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.tvprovider")))
          {
            v88 = (void *)MEMORY[0x1E0D13590];
LABEL_74:
            objc_msgSend(v88, "buildRequiredOnlyWithIdentifier:", v87);
            v89 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v84, "isEqualToString:", CFSTR("system.webcontentfilter.basic")))
            {
              v164 = v86;
              if (objc_msgSend(v84, "isEqualToString:", CFSTR("system.web.tracking")))
              {
                objc_msgSend(MEMORY[0x1E0D13598], "buildRequiredOnlyWithIdentifier:", v87);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__kindof CEMConfigurationBase * _Nonnull createUnrestrictedConfiguration(NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSNumber * _Nonnull __strong)");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, CFSTR("STBlueprint+Restrictions.m"), 516, CFSTR("Unimplemented for type %@"), v84);

                v79 = 0;
              }
              v86 = v164;
              goto LABEL_76;
            }
            objc_msgSend(MEMORY[0x1E0D13540], "buildRequiredOnlyWithIdentifier:withRestrictWeb:", v87, MEMORY[0x1E0C9AAA0]);
            v89 = objc_claimAutoreleasedReturnValue();
          }
          v79 = (void *)v89;
LABEL_76:

        }
        v74 = v79;
        v90 = v71;
        v91 = v64;
        objc_msgSend(v90, "substringToIndex:", 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "substringWithRange:", 1, objc_msgSend(v90, "length") - 1);
        v93 = objc_claimAutoreleasedReturnValue();
        v209[0] = CFSTR("payload");
        v163 = v92;
        objc_msgSend(v92, "capitalizedString");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v209[1] = v94;
        v161 = (void *)v93;
        v209[2] = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 3);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "componentsJoinedByString:", &stru_1E9372498);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        +[STLog persistence](STLog, "persistence");
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          v98 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v211 = v98;
          v212 = 2112;
          v213 = v96;
          v214 = 2112;
          v215 = v91;
          _os_log_impl(&dword_1D22E7000, v97, OS_LOG_TYPE_DEFAULT, "Setting CEM key %@.%@ to %@", buf, 0x20u);
        }

        objc_msgSend(v74, "setValue:forKeyPath:", v91, v96);
        objc_msgSend(v74, "updateServerHash");

        objc_msgSend(v167, "setObject:forKeyedSubscript:", v74, v72);
        objc_msgSend(v159, "addObject:", v72);
        v55 = v154;
        v61 = v157;
LABEL_60:

        ++v62;
      }
      while (v178 != v62);
      v101 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
      v178 = v101;
    }
    while (v101);
  }

  if (objc_msgSend(v159, "count"))
  {
    v102 = v152;
    objc_msgSend(v152, "managingOrganization");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v153;
    if (!v103)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
      v107 = objc_claimAutoreleasedReturnValue();
      +[STLog persistence](STLog, "persistence");
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.1();

      if (a5)
      {
        v107 = objc_retainAutorelease(v107);
        v113 = 0;
        *a5 = v107;
      }
      else
      {
        v113 = 0;
      }
      goto LABEL_157;
    }
    +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:fromOrganization:", v55, CFSTR("restrictions"), v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = 0;
    objc_msgSend(v105, "execute:", &v188);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v188;
    v173 = v106;
    if (!v106)
    {
      +[STLog persistence](STLog, "persistence");
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:].cold.2();

      if (a5)
      {
        v107 = objc_retainAutorelease(v107);
        v113 = 0;
        *a5 = v107;
      }
      else
      {
        v113 = 0;
      }
      goto LABEL_156;
    }
    objc_msgSend(v152, "managedObjectContext");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "firstObject");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v108)
    {
      v109 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v179);
      -[STBlueprint setType:](v109, "setType:", CFSTR("restrictions"));
      v110 = v61;
      v111 = v55;
      if (-[__CFString isEqualToString:](v110, "isEqualToString:", CFSTR("personal")))
      {
        v112 = CFSTR("digital_health_restrictions");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("digital_health_restrictions"), v111);
        v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v116 = v112;

      v108 = v109;
      -[STBlueprint setIdentifier:](v109, "setIdentifier:", v116);

      -[STBlueprint setOrganization:](v109, "setOrganization:", v103);
      v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v152, 0);
      -[STBlueprint setUsers:](v109, "setUsers:", v117);

    }
    v165 = v105;
    v169 = v103;
    v155 = v55;
    objc_msgSend(v108, "setIsDirty:", 1);
    objc_msgSend(v108, "setEnabled:", 1);
    v176 = v108;
    objc_msgSend(v108, "configurations");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "allObjects");
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v119, "valueForKey:", CFSTR("type"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v119;
    objc_msgSend(v120, "dictionaryWithObjects:forKeys:", v119, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v123 = v159;
    v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
    if (v124)
    {
      v125 = v124;
      v126 = *(_QWORD *)v185;
      while (2)
      {
        v127 = 0;
        v128 = v107;
        do
        {
          if (*(_QWORD *)v185 != v126)
            objc_enumerationMutation(v123);
          v129 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v127);
          objc_msgSend(v167, "objectForKeyedSubscript:", v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "objectForKeyedSubscript:", v129);
          v131 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();
          if (!v131)
          {
            v131 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v179);
            objc_msgSend(v130, "declarationIdentifier");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            -[STBlueprintConfiguration setIdentifier:](v131, "setIdentifier:", v132);

            -[STBlueprintConfiguration setType:](v131, "setType:", v129);
            -[STBlueprintConfiguration setBlueprint:](v131, "setBlueprint:", v176);
          }
          objc_msgSend(v130, "updateServerHash");
          v183 = v128;
          objc_msgSend(v130, "serializeAsDataWithError:", &v183);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v183;

          if (!v133)
          {
            +[STLog persistence](STLog, "persistence");
            v134 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
              +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.5();

            v61 = v157;
            v103 = v169;
            if (a5)
              *a5 = objc_retainAutorelease(v107);

            v113 = 0;
            v102 = v152;
            v104 = v153;
            goto LABEL_153;
          }
          -[STBlueprintConfiguration setPayloadPlist:](v131, "setPayloadPlist:", v133);

          ++v127;
          v128 = v107;
        }
        while (v125 != v127);
        v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
        if (v125)
          continue;
        break;
      }
    }

    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v113 = 1;
      v102 = v152;
      v104 = v153;
      v61 = v157;
      v103 = v169;
LABEL_153:
      v105 = v165;
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v137 = objc_claimAutoreleasedReturnValue();
      v102 = v152;
      v104 = v153;
      v61 = v157;
      v105 = v165;
      v135 = v179;
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
        +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.4(v137, v138, v139, v140, v141, v142, v143, v144);

      v103 = v169;
      if (!objc_msgSend(v179, "hasChanges"))
      {
        v113 = 1;
        goto LABEL_155;
      }
      v182 = v107;
      v145 = objc_msgSend(v179, "save:", &v182);
      v146 = v182;

      if ((v145 & 1) != 0)
      {
        v113 = 1;
        v107 = v146;
        goto LABEL_155;
      }
      +[STLog persistence](STLog, "persistence");
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
        +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.3();

      if (a5)
      {
        v107 = objc_retainAutorelease(v146);
        v113 = 0;
        *a5 = v107;
      }
      else
      {
        v113 = 0;
        v107 = v146;
      }
    }
    v135 = v179;
LABEL_155:

    v55 = v155;
LABEL_156:

LABEL_157:
    goto LABEL_158;
  }
  +[STLog persistence](STLog, "persistence");
  v107 = objc_claimAutoreleasedReturnValue();
  v102 = v152;
  v104 = v153;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v107, OS_LOG_TYPE_DEFAULT, "No preset restrictions to apply, exiting.", buf, 2u);
  }
  v113 = 1;
LABEL_158:

  return v113;
}

- (void)setUsageLimitEnabled:(BOOL)a3
{
  -[STBlueprint setLimitEnabled:](self, "setLimitEnabled:", a3);
  -[STBlueprint setIsDirty:](self, "setIsDirty:", 1);
}

+ (BOOL)saveUsageLimitWithIdentifier:(id)a3 user:(id)a4 bundleIdentifiers:(id)a5 webDomains:(id)a6 categoryIdentifiers:(id)a7 dailyBudgetLimit:(double)a8 budgetLimitByWeekday:(id)a9 enabled:(BOOL)a10 behaviorType:(unint64_t)a11 error:(id *)a12
{
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  STBlueprint *v39;
  void *v40;
  void *v41;
  STBlueprintUsageLimit *v42;
  void *v43;
  __CFString **v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id *v51;
  id *v52;
  id *v53;
  _BOOL4 v54;
  STBlueprintConfiguration *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id *v70;
  void *v71;
  NSObject *v72;
  STBlueprintConfiguration *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  int v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id *v90;
  void *v91;
  NSObject *v92;
  STBlueprintConfiguration *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  int v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id *v110;
  void *v111;
  void *v112;
  id *v113;
  char v114;
  NSObject *v115;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  NSObject *v125;
  id v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id obj;
  _QWORD v141[4];
  NSObject *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  BOOL v151;
  BOOL v152;
  BOOL v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  char v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  void (*v168)(uint64_t);
  id v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  id v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  void (*v186)(uint64_t);
  id v187;
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  uint64_t (*v191)(uint64_t, uint64_t);
  void (*v192)(uint64_t);
  id v193;
  _QWORD v194[4];
  STBlueprintUsageLimit *v195;
  id v196;
  uint64_t v197;
  id *v198;
  uint64_t v199;
  uint64_t (*v200)(uint64_t, uint64_t);
  void (*v201)(uint64_t);
  id v202;
  _QWORD v203[3];

  v203[1] = *MEMORY[0x1E0C80C00];
  v133 = a3;
  v136 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v126 = a9;
  v131 = v20;
  v23 = objc_msgSend(v20, "count");
  v130 = v21;
  v24 = objc_msgSend(v21, "count");
  v132 = v22;
  v127 = objc_msgSend(v22, "count");
  if (!v23 && !v24 && !v127)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STBlueprint+UsageLimit.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasBundleIdentifiers || hasWebDomains || hasCategoryIdentifiers"));

  }
  v197 = 0;
  v198 = (id *)&v197;
  v199 = 0x3032000000;
  v200 = __Block_byref_object_copy__1;
  v201 = __Block_byref_object_dispose__1;
  v202 = 0;
  objc_msgSend(v136, "managingOrganization");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v134)
  {
    if (v133)
    {
      objc_msgSend(v136, "dsid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v25, CFSTR("usage-limit"), v133, v134);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setReturnsObjectsAsFaults:", 0);
      v27 = v198;
      v196 = v198[5];
      objc_msgSend(v26, "execute:", &v196);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v27 + 5, v196);

      if (!v28)
      {
        +[STLog persistence](STLog, "persistence");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.8();
        v129 = 0;
        v33 = 0;
        goto LABEL_100;
      }
      v29 = (void *)v28;
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB3940]);
      v35 = (void *)objc_opt_new();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (id)objc_msgSend(v34, "initWithFormat:", CFSTR("%@_%@"), CFSTR("budget_activation"), v36);

      v29 = 0;
    }
    v129 = v29;
    if ((unint64_t)objc_msgSend(v29, "count") >= 2)
    {
      +[STLog persistence](STLog, "persistence");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.7();

    }
    objc_msgSend(v136, "managedObjectContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "firstObject");
    v39 = (STBlueprint *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v39 = -[STBlueprint initWithContext:]([STBlueprint alloc], "initWithContext:", v38);
      -[STBlueprint setType:](v39, "setType:", CFSTR("usage-limit"));
      -[STBlueprint setIdentifier:](v39, "setIdentifier:", v133);
      -[STBlueprint setOrganization:](v39, "setOrganization:", v134);
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v136, 0);
      -[STBlueprint setUsers:](v39, "setUsers:", v40);

      v41 = (void *)objc_opt_new();
      -[STBlueprint setCreationDate:](v39, "setCreationDate:", v41);

    }
    -[STBlueprint setIsDirty:](v39, "setIsDirty:", 1);
    -[STBlueprint setLimitEnabled:](v39, "setLimitEnabled:", a10);
    -[STBlueprint usageLimit](v39, "usageLimit");
    v42 = (STBlueprintUsageLimit *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v42 = -[STBlueprintUsageLimit initWithContext:]([STBlueprintUsageLimit alloc], "initWithContext:", v38);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 300.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintUsageLimit setNotificationTimeInterval:](v42, "setNotificationTimeInterval:", v43);

    }
    -[STBlueprintUsageLimit setApplicationIdentifiers:](v42, "setApplicationIdentifiers:", v20);
    -[STBlueprintUsageLimit setWebsiteIdentifiers:](v42, "setWebsiteIdentifiers:", v130);
    -[STBlueprintUsageLimit setCategoryIdentifiersVersion2:](v42, "setCategoryIdentifiersVersion2:", v132);
    v135 = (void *)objc_msgSend(v132, "mutableCopy");
    objc_msgSend(v135, "removeObject:", *MEMORY[0x1E0D0D4F0]);
    objc_msgSend(v135, "removeObject:", *MEMORY[0x1E0D0D4A0]);
    objc_msgSend(v135, "removeObject:", *MEMORY[0x1E0D0D4E8]);
    if (v127 && !objc_msgSend(v135, "count"))
      objc_msgSend(v135, "addObject:", *MEMORY[0x1E0D0D480]);
    -[STBlueprintUsageLimit setCategoryIdentifiers:](v42, "setCategoryIdentifiers:", v135);
    if (v127)
    {
      -[STBlueprintUsageLimit setItemIdentifiers:](v42, "setItemIdentifiers:", v135);
      v44 = &STBlueprintUsageLimitItemTypeCategory;
    }
    else if (v23)
    {
      -[STBlueprintUsageLimit setItemIdentifiers:](v42, "setItemIdentifiers:", v20);
      v44 = STBlueprintUsageLimitItemTypeApp;
    }
    else
    {
      if (!v24)
        goto LABEL_34;
      -[STBlueprintUsageLimit setItemIdentifiers:](v42, "setItemIdentifiers:", v130);
      v44 = STBlueprintUsageLimitItemTypeWebDomain;
    }
    -[STBlueprintUsageLimit setUsageItemType:](v42, "setUsageItemType:", *v44);
LABEL_34:
    v46 = MEMORY[0x1E0C809B0];
    if (v126)
    {
      v194[0] = MEMORY[0x1E0C809B0];
      v194[1] = 3221225472;
      v194[2] = __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke;
      v194[3] = &unk_1E9370E90;
      v195 = v42;
      objc_msgSend(v126, "enumerateKeysAndObjectsUsingBlock:", v194);

    }
    else
    {
      -[STBlueprintUsageLimit setBudgetLimit:](v42, "setBudgetLimit:", a8);
    }
    -[STBlueprint setUsageLimit:](v39, "setUsageLimit:", v42);
    v188 = 0;
    v189 = &v188;
    v190 = 0x3032000000;
    v191 = __Block_byref_object_copy__1;
    v192 = __Block_byref_object_dispose__1;
    v193 = 0;
    v182 = 0;
    v183 = &v182;
    v184 = 0x3032000000;
    v185 = __Block_byref_object_copy__1;
    v186 = __Block_byref_object_dispose__1;
    v187 = 0;
    v176 = 0;
    v177 = &v176;
    v178 = 0x3032000000;
    v179 = __Block_byref_object_copy__1;
    v180 = __Block_byref_object_dispose__1;
    v181 = 0;
    v170 = 0;
    v171 = &v170;
    v172 = 0x3032000000;
    v173 = __Block_byref_object_copy__1;
    v174 = __Block_byref_object_dispose__1;
    v175 = 0;
    v164 = 0;
    v165 = &v164;
    v166 = 0x3032000000;
    v167 = __Block_byref_object_copy__1;
    v168 = __Block_byref_object_dispose__1;
    v169 = 0;
    v158 = 0;
    v159 = &v158;
    v160 = 0x3032000000;
    v161 = __Block_byref_object_copy__1;
    v162 = __Block_byref_object_dispose__1;
    v163 = 0;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v203[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    -[STBlueprint configurations](v39, "configurations");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "sortedArrayUsingDescriptors:", v48);
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    v154 = 0;
    v155 = &v154;
    v156 = 0x2020000000;
    v157 = 0;
    v141[0] = v46;
    v141[1] = 3221225472;
    v141[2] = __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke_2;
    v141[3] = &unk_1E9370EB8;
    v143 = &v197;
    v144 = &v154;
    v151 = v23 != 0;
    v145 = &v188;
    v146 = &v182;
    v45 = v38;
    v142 = v45;
    v147 = &v176;
    v152 = v24 != 0;
    v148 = &v170;
    v149 = &v164;
    v153 = v127 != 0;
    v150 = &v158;
    objc_msgSend(v122, "enumerateObjectsUsingBlock:", v141);
    if (*((_BYTE *)v155 + 24))
    {
      +[STLog persistence](STLog, "persistence");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.6();
      v33 = 0;
      goto LABEL_99;
    }
    if (a11)
    {
      if (a11 != 1)
      {
        v124 = 0;
        v125 = 0;
        v123 = 0;
        if (v23)
          goto LABEL_47;
        goto LABEL_50;
      }
      v51 = (id *)MEMORY[0x1E0D13428];
      v52 = (id *)MEMORY[0x1E0D13438];
      v53 = (id *)MEMORY[0x1E0D13410];
    }
    else
    {
      v51 = (id *)MEMORY[0x1E0D13430];
      v52 = (id *)MEMORY[0x1E0D13440];
      v53 = (id *)MEMORY[0x1E0D13420];
    }
    v125 = *v53;
    v124 = *v52;
    v123 = *v51;
    if (v23)
    {
LABEL_47:
      if (v189[5])
      {
        objc_msgSend((id)v183[5], "setPayloadMode:", v125);
        objc_msgSend((id)v183[5], "setPayloadApps:", v131);
      }
      else
      {
        v55 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v45);
        v56 = (void *)v189[5];
        v189[5] = (uint64_t)v55;

        objc_msgSend((id)v189[5], "setBlueprint:", v39);
        v57 = (void *)MEMORY[0x1E0D134B8];
        v58 = v136;
        objc_msgSend(v58, "localUserDeviceState");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59 && (v60 = objc_msgSend(v58, "isManaged"), v59, !v60))
        {
          v64 = objc_alloc(MEMORY[0x1E0CB3940]);
          v61 = (void *)objc_opt_new();
          objc_msgSend(v61, "UUIDString");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = (void *)objc_msgSend(v64, "initWithFormat:", CFSTR("%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("personal"), v120);
        }
        else
        {
          v118 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v58, "dsid");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringValue");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_opt_new();
          objc_msgSend(v62, "UUIDString");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = (void *)objc_msgSend(v118, "initWithFormat:", CFSTR("%@_%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("family"), v120, v63);

        }
        objc_msgSend(v57, "buildWithIdentifier:withMode:withApps:", v119, v125, v131);
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)v183[5];
        v183[5] = v65;

      }
      objc_msgSend((id)v183[5], "declarationIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v189[5], "setIdentifier:", v67);

      objc_msgSend((id)v183[5], "declarationType");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v189[5], "setType:", v68);

      objc_msgSend((id)v183[5], "updateServerHash");
      v69 = (void *)v183[5];
      v70 = v198;
      obj = v198[5];
      objc_msgSend(v69, "serializeAsDataWithError:", &obj);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v70 + 5, obj);
      v54 = v71 != 0;
      if (v71)
      {
        objc_msgSend((id)v189[5], "setPayloadPlist:", v71);
      }
      else
      {
        +[STLog persistence](STLog, "persistence");
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
          +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.2();

      }
LABEL_62:
      if (v54 && v24)
      {
        if (v177[5])
        {
          objc_msgSend((id)v171[5], "setPayloadMode:", v124);
          objc_msgSend((id)v171[5], "setPayloadHostnames:", v130);
        }
        else
        {
          v73 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v45);
          v74 = (void *)v177[5];
          v177[5] = (uint64_t)v73;

          objc_msgSend((id)v177[5], "setBlueprint:", v39);
          v75 = (void *)MEMORY[0x1E0D134C8];
          v76 = v136;
          objc_msgSend(v76, "localUserDeviceState");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77 && (v78 = objc_msgSend(v76, "isManaged"), v77, !v78))
          {
            v84 = objc_alloc(MEMORY[0x1E0CB3940]);
            v80 = (void *)objc_opt_new();
            objc_msgSend(v80, "UUIDString");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = (void *)objc_msgSend(v84, "initWithFormat:", CFSTR("%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("personal"), v121);
          }
          else
          {
            v79 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v76, "dsid");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "stringValue");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = (void *)objc_opt_new();
            objc_msgSend(v81, "UUIDString");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = (void *)objc_msgSend(v79, "initWithFormat:", CFSTR("%@_%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("family"), v121, v82);

          }
          objc_msgSend(v75, "buildWithIdentifier:withMode:withHostnames:", v83, v124, v130);
          v85 = objc_claimAutoreleasedReturnValue();
          v86 = (void *)v171[5];
          v171[5] = v85;

        }
        objc_msgSend((id)v171[5], "declarationIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v177[5], "setIdentifier:", v87);

        objc_msgSend((id)v171[5], "declarationType");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v177[5], "setType:", v88);

        objc_msgSend((id)v171[5], "updateServerHash");
        v89 = (void *)v171[5];
        v90 = v198;
        v139 = v198[5];
        objc_msgSend(v89, "serializeAsDataWithError:", &v139);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v90 + 5, v139);
        v54 = v91 != 0;
        if (v91)
        {
          objc_msgSend((id)v177[5], "setPayloadPlist:", v91);
        }
        else
        {
          +[STLog persistence](STLog, "persistence");
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
            +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.2();

        }
      }
      if (v54 && v127)
      {
        if (v165[5])
        {
          objc_msgSend((id)v159[5], "setPayloadMode:", v123);
          objc_msgSend((id)v159[5], "setPayloadCategories:", v135);
          objc_msgSend((id)v159[5], "setPayloadCategoriesVersion2:", v132);
        }
        else
        {
          v93 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v45);
          v94 = (void *)v165[5];
          v165[5] = (uint64_t)v93;

          objc_msgSend((id)v165[5], "setBlueprint:", v39);
          v95 = (void *)MEMORY[0x1E0D134C0];
          v96 = v136;
          objc_msgSend(v96, "localUserDeviceState");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (v97 && (v98 = objc_msgSend(v96, "isManaged"), v97, !v98))
          {
            v104 = objc_alloc(MEMORY[0x1E0CB3940]);
            v128 = (void *)objc_opt_new();
            objc_msgSend(v128, "UUIDString");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = (void *)objc_msgSend(v104, "initWithFormat:", CFSTR("%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("personal"), v100);
          }
          else
          {
            v99 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v96, "dsid");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "stringValue");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = (void *)objc_opt_new();
            objc_msgSend(v101, "UUIDString");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = (void *)objc_msgSend(v99, "initWithFormat:", CFSTR("%@_%@_%@_%@"), CFSTR("budget_configuration"), CFSTR("family"), v100, v102);

          }
          objc_msgSend(v95, "buildWithIdentifier:withMode:withCategories:withCategoriesVersion2:", v103, v123, v135, v132);
          v105 = objc_claimAutoreleasedReturnValue();
          v106 = (void *)v159[5];
          v159[5] = v105;

        }
        objc_msgSend((id)v159[5], "declarationIdentifier");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v165[5], "setIdentifier:", v107);

        objc_msgSend((id)v159[5], "declarationType");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v165[5], "setType:", v108);

        objc_msgSend((id)v159[5], "updateServerHash");
        v109 = (void *)v159[5];
        v110 = v198;
        v138 = v198[5];
        objc_msgSend(v109, "serializeAsDataWithError:", &v138);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v110 + 5, v138);
        if (!v111)
        {
          +[STLog persistence](STLog, "persistence");
          v115 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
            +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.2();
LABEL_96:

LABEL_97:
          v33 = 0;
          goto LABEL_98;
        }
        objc_msgSend((id)v165[5], "setPayloadPlist:", v111);

      }
      else if (!v54)
      {
        goto LABEL_97;
      }
      +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v198;
      v137 = v198[5];
      v114 = objc_msgSend(v112, "saveContext:error:", v45, &v137);
      objc_storeStrong(v113 + 5, v137);

      if ((v114 & 1) != 0)
      {
        v33 = 1;
LABEL_98:

        v50 = v125;
LABEL_99:

        _Block_object_dispose(&v154, 8);
        _Block_object_dispose(&v158, 8);

        _Block_object_dispose(&v164, 8);
        _Block_object_dispose(&v170, 8);

        _Block_object_dispose(&v176, 8);
        _Block_object_dispose(&v182, 8);

        _Block_object_dispose(&v188, 8);
LABEL_100:

        goto LABEL_101;
      }
      +[STLog persistence](STLog, "persistence");
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.3();
      goto LABEL_96;
    }
LABEL_50:
    v54 = 1;
    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v198[5];
  v198[5] = (id)v30;

  +[STLog persistence](STLog, "persistence");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.1();

  v129 = 0;
  v33 = 0;
LABEL_101:
  if (a12)
    *a12 = objc_retainAutorelease(v198[5]);

  _Block_object_dispose(&v197, 8);
  return v33;
}

uint64_t __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  v8 = objc_msgSend(v5, "unsignedIntegerValue");

  return objc_msgSend(v4, "setBudgetLimit:forDay:", v8, v7);
}

void __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id obj;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "payloadPlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D13488];
    objc_msgSend(v7, "payloadPlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v9, "declarationForData:error:", v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);

    if (!v12)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_26;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 104))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
          v13 = *(_QWORD *)(a1 + 64);
LABEL_17:
          objc_storeStrong((id *)(*(_QWORD *)(v13 + 8) + 40), v12);
          goto LABEL_26;
        }
        +[STLog screentime](STLog, "screentime");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        goto LABEL_25;
      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 105))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
          v13 = *(_QWORD *)(a1 + 80);
          goto LABEL_17;
        }
        +[STLog screentime](STLog, "screentime");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        goto LABEL_25;
      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 106))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a2);
          v13 = *(_QWORD *)(a1 + 96);
          goto LABEL_17;
        }
        +[STLog screentime](STLog, "screentime");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_24:
          *(_DWORD *)buf = 136446466;
          v17 = "+[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentif"
                "iers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]_block_invoke";
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting configuration (%@)", buf, 0x16u);
        }
LABEL_25:

        objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v7);
      }
    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:].cold.1();
  }
LABEL_26:

}

+ (BOOL)deleteUsageLimitWithIdentifier:(id)a3 user:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v24;
  id v25;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "managingOrganization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:](STBlueprint, "fetchRequestMatchingBlueprintsForUserWithDSID:ofType:withIdentifier:fromOrganization:", v13, CFSTR("usage-limit"), v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  v25 = 0;
  objc_msgSend(v14, "execute:", &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v15)
  {
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      +[STLog persistence](STLog, "persistence");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.7();

    }
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject tombstone](v18, "tombstone");
      +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v16;
      v20 = objc_msgSend(v19, "saveContext:error:", v9, &v24);
      v21 = v24;

      if ((v20 & 1) == 0)
      {
        +[STLog persistence](STLog, "persistence");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[STBlueprint(UsageLimit) deleteUsageLimitWithIdentifier:user:managedObjectContext:error:].cold.2();

      }
    }
    else
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 14, 0);
      v20 = 0;
      v18 = v16;
    }
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[STBlueprint(UsageLimit) deleteUsageLimitWithIdentifier:user:managedObjectContext:error:].cold.1();
    v20 = 0;
    v21 = v16;
  }

  if (a6)
    *a6 = objc_retainAutorelease(v21);

  return v20;
}

+ (id)keyPathsForValuesAffectingLimitDisplayName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("usageLimit.categoryIdentifiers"), CFSTR("usageLimit.categoryIdentifiersVersion2"), CFSTR("usageLimit.applicationIdentifiers"), CFSTR("usageLimit.websiteIdentifiers"), CFSTR("usageLimit.usageItemType"), CFSTR("usageLimit.itemIdentifiers"), 0);
}

- (NSString)limitDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[STBlueprint usageLimit](self, "usageLimit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryIdentifiersVersion2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "categoryIdentifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v2, "applicationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "websiteIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count") && !objc_msgSend(v7, "count") && !objc_msgSend(v8, "count"))
  {
    objc_msgSend(v2, "usageItemType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("category")))
    {
      objc_msgSend(v2, "itemIdentifiers");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v6 = (void *)v10;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("app")))
    {
      objc_msgSend(v2, "itemIdentifiers");
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = v7;
      v7 = (void *)v12;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("webdomain")))
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v2, "itemIdentifiers");
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = v8;
      v8 = (void *)v13;
    }

    goto LABEL_14;
  }
LABEL_15:
  +[STBlueprint displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:](STBlueprint, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v6, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

+ (id)displayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  __int128 v38;
  uint64_t v39;
  id v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v42 = a4;
  v41 = a5;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1;
  v55 = __Block_byref_object_dispose__1;
  v56 = 0;
  v50 = 2;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(a1, "_getDisplayNameAndAddCategories:toItemNames:remainingItems:", v7, v8, &v50);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v52[5];
  v52[5] = v9;

  if (!v52[5])
  {
    v11 = objc_msgSend(v7, "count");
    v12 = objc_msgSend(v42, "count");
    v13 = objc_msgSend(v41, "count");
    if (v50)
    {
      v39 = v12 + v11 + v13;
      +[STAppInfoCache sharedCache](STAppInfoCache, "sharedCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v15 = v42;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      if (v16)
      {
        v18 = *(_QWORD *)v46;
        *(_QWORD *)&v17 = 138543874;
        v38 = v17;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "appInfoForBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v19), v38);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (!v20)
            {
              +[STLog appInfo](STLog, "appInfo");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(0, "description");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v38;
                v58 = v32;
                v59 = 2080;
                v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                v61 = 1024;
                v62 = 421;
                _os_log_error_impl(&dword_1D22E7000, v25, OS_LOG_TYPE_ERROR, "Nil appInfo: %{public}@ in function: %s:%d", buf, 0x1Cu);

              }
              goto LABEL_13;
            }
            objc_msgSend(v20, "displayName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "length") == 0;

            if (v23)
            {
              objc_msgSend(v21, "bundleIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "length") == 0;

              if (v29)
              {
                +[STLog appInfo](STLog, "appInfo");
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v21, "description");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v38;
                  v58 = v34;
                  v59 = 2080;
                  v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                  v61 = 1024;
                  v62 = 429;
                  _os_log_error_impl(&dword_1D22E7000, v25, OS_LOG_TYPE_ERROR, "Display name and bundleId missing for appInfo: %{public}@ in function: %s:%d", buf, 0x1Cu);

                }
LABEL_13:

                +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("DisplayNameUnknown"), &stru_1E9372498, 0);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_19;
              }
              +[STLog appInfo](STLog, "appInfo");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "description");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v38;
                v58 = v33;
                v59 = 2080;
                v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                v61 = 1024;
                v62 = 426;
                _os_log_error_impl(&dword_1D22E7000, v30, OS_LOG_TYPE_ERROR, "Display name missing for appInfo: %{public}@ in function: %s:%d. using bundleId instead", buf, 0x1Cu);

              }
              objc_msgSend(v21, "bundleIdentifier");
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v21, "displayName");
              v24 = objc_claimAutoreleasedReturnValue();
            }
            v27 = (void *)v24;
LABEL_19:
            objc_msgSend(v8, "addObject:", v27);
            v31 = --v50 == 0;

            if (v31)
              goto LABEL_26;
            ++v19;
          }
          while (v16 != v19);
          v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
          v16 = v35;
        }
        while (v35);
      }
LABEL_26:

      if (v50)
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_2;
        v43[3] = &unk_1E9370EE0;
        v43[4] = &v51;
        objc_msgSend(a1, "_addWebDomains:toItemNames:remainingItems:totalCount:completionHandler:", v41, v8, v50, v39, v43);
      }
      else
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_49;
        v44[3] = &unk_1E9370EE0;
        v44[4] = &v51;
        objc_msgSend(a1, "_createDisplayNameWithItemNames:itemCount:completionHandler:", v8, v39, v44);
      }

    }
    else
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke;
      v49[3] = &unk_1E9370EE0;
      v49[4] = &v51;
      objc_msgSend(a1, "_createDisplayNameWithItemNames:itemCount:completionHandler:", v8, v12 + v11 + v13, v49);
    }
  }
  v36 = (id)v52[5];

  _Block_object_dispose(&v51, 8);
  return v36;
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_49(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)fetchDisplayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  void (**v32)(id, void *);
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 2;
  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend(v14, "initWithCapacity:", v37[3]);
  objc_msgSend(a1, "_getDisplayNameAndAddCategories:toItemNames:remainingItems:", v10, v15, v37 + 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v13[2](v13, v16);
  }
  else
  {
    v17 = objc_msgSend(v11, "count");
    v18 = objc_msgSend(v10, "count");
    v19 = objc_msgSend(v12, "count");
    if (v37[3])
    {
      if (v17)
      {
        v27 = v18 + v17 + v19;
        if ((unint64_t)objc_msgSend(v11, "count") >= 2 && v37[3] == 2)
        {
          v20 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v20, "initWithObjects:", v21, v22, 0);

        }
        else
        {
          v24 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v24, "initWithObjects:", v21, 0);
        }

        +[STAppInfoCache sharedCache](STAppInfoCache, "sharedCache");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __127__STBlueprint_UsageLimit__fetchDisplayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains_completionHandler___block_invoke;
        v28[3] = &unk_1E9370F08;
        v26 = v23;
        v29 = v26;
        v30 = v15;
        v33 = &v36;
        v34 = a1;
        v35 = v27;
        v32 = v13;
        v31 = v12;
        objc_msgSend(v25, "fetchAppInfoForBundleIdentifiers:completionHandler:", v26, v28);

      }
      else
      {
        objc_msgSend(a1, "_addWebDomains:toItemNames:remainingItems:totalCount:completionHandler:", v12, v15);
      }
    }
    else
    {
      objc_msgSend(a1, "_createDisplayNameWithItemNames:itemCount:completionHandler:", v15, v18 + v17 + v19, v13);
    }
  }

  _Block_object_dispose(&v36, 8);
}

void __127__STBlueprint_UsageLimit__fetchDisplayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v12 = v11;
        else
          v12 = v9;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = *(void **)(a1 + 72);
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v14)
    objc_msgSend(v13, "_addWebDomains:toItemNames:remainingItems:totalCount:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(v13, "_createDisplayNameWithItemNames:itemCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));

}

+ (id)_getDisplayNameAndAddCategories:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  STAvailableCategoriesExcludingSystemCategories();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  if (objc_msgSend(v9, "isEqualToSet:", v12))
  {
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AllAppsAndCategoriesDisplayName"), &stru_1E9372498, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
LABEL_5:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        STCategoryNameWithIdentifier(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v20, (_QWORD)v23);

        if ((*a5)-- == 1)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            goto LABEL_5;
          break;
        }
      }
    }

    v14 = 0;
  }

  return v14;
}

+ (void)_addWebDomains:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t)a5 totalCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v14);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "_lp_userVisibleHost");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v19);

      if (a5 - 1 == v18)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        a5 -= v18;
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(a1, "_createDisplayNameWithItemNames:itemCount:completionHandler:", v12, a6, v13);
}

+ (void)_createDisplayNameWithItemNames:(id)a3 itemCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a5;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (a4)
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      ((void (**)(_QWORD, void *))v8)[2](v8, v9);
    }
    else
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BudgetPredicateTitleText"), &stru_1E9372498, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithFormat:locale:", v12, v14, a4 - 2, v9, v10);
      ((void (**)(_QWORD, void *))v8)[2](v8, v15);

    }
  }
  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, &stru_1E9372498);
  }

}

+ (id)keyPathsForValuesAffectingLimitScheduleText
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("usageLimit.budgetLimitScheduleRepresentation"));
}

- (NSString)limitScheduleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setFormattingContext:", 1);
  objc_msgSend(v3, "setUnitsStyle:", 5);
  -[STBlueprint usageLimit](self, "usageLimit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "budgetLimitScheduleRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "simpleSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "budgetLimit");
    objc_msgSend(v3, "stringFromTimeInterval:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TimeEveryDayFormat"), &stru_1E9372498, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:locale:", v10, v12, v8);

  }
  else
  {
    v30 = v5;
    objc_msgSend(v5, "customScheduleItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v21, "budgetLimit");
          objc_msgSend(v22, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "day"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    v25 = (void *)objc_opt_class();
    v26 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke;
    v34[3] = &unk_1E9370E30;
    v35 = v15;
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke_2;
    v31[3] = &unk_1E9370E58;
    v27 = v35;
    v32 = v27;
    v33 = v3;
    objc_msgSend(v25, "scheduleTextWithLocale:weekdayScheduleComparator:scheduleTimeGetter:", 0, v34, v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ScheduleOff"), &stru_1E9372498, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
    v5 = v30;
  }

  return (NSString *)v13;
}

uint64_t __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isEqualToNumber:", v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v6, "stringFromTimeInterval:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)declarationsWithError:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Unable to build predicate for blueprint: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)declarationsWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1D22E7000, v0, v1, "Unknown blueprint type: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_predicateForDowntimeBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'downtime': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_predicateForUsageLimitBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'usage limit': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_predicateForUsageLimitOverrideBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'usage limit override': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_predicateForAlwaysAllowedAppsBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'always allowed apps': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_predicateForRestrictionsBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'restrictions': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_predicateForManagedUserBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "Blueprint is not of type 'managed user': %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)_buildConfigurationsByDeclarationIdentifierFromBlueprint:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "blueprint is missing a config: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_buildConfigurationsByDeclarationIdentifierFromBlueprint:error:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_8_0(&dword_1D22E7000, v1, (uint64_t)v1, "failed to deserialize config: %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "No blueprint configuration. Defaulting to no grace period.", a5, a6, a7, a8, 0);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(uint64_t)a3 configuration:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "No blueprint configuration declaration data. Defaulting to no grace period.", a5, a6, a7, a8, 0);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(uint64_t)a3 configuration:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = 0;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_8_0(&dword_1D22E7000, a2, a3, "Failed to deserialize declaration: %{public}@: %{public}@. Defaulting to no grace period.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)shouldUseGracePeriodForDowntimeOverride:configuration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1D22E7000, v0, v1, "Failed to fetch users: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDictionaryRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1D22E7000, v0, v1, "unknown organization class name: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDictionaryRepresentation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Unable to fetch organizations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "There were no organizations for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Multiple organizations of type: %{public}@ found in database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDictionaryRepresentation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_1D22E7000, v0, v1, "R: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.7(void *a1, NSObject *a2)
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

  OUTLINED_FUNCTION_3();
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1D22E7000, v0, v1, "Could not query for orphaned blueprint configurations: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
