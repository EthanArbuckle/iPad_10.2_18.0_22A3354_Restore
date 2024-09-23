@implementation PLShareParticipant

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLShareParticipant;
  -[PLManagedObject willSave](&v8, sel_willSave);
  -[PLShareParticipant managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLShareParticipant changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLShareParticipant share](self, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("acceptanceStatus"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v3, "delayedSaveActions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "recordLibraryScopeParticipantsUpdateForLibraryScope:", v5);

        }
      }
    }

  }
}

- (void)updateWithCPLShareParticipant:(id)a3 inShare:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char IsEqual;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "email");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "participantID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant emailAddress](self, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v5);

  if ((v11 & 1) == 0)
    -[PLShareParticipant setEmailAddress:](self, "setEmailAddress:", v5);
  -[PLShareParticipant nameComponents](self, "nameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v7);

  if ((v13 & 1) == 0)
    -[PLShareParticipant setNameComponents:](self, "setNameComponents:", v7);
  -[PLShareParticipant phoneNumber](self, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v6);

  if ((v15 & 1) == 0)
    -[PLShareParticipant setPhoneNumber:](self, "setPhoneNumber:", v6);
  -[PLShareParticipant userIdentifier](self, "userIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v8);

  if ((v17 & 1) == 0)
    -[PLShareParticipant setUserIdentifier:](self, "setUserIdentifier:", v8);
  -[PLShareParticipant participantID](self, "participantID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = PLObjectIsEqual();

  if ((IsEqual & 1) == 0)
    -[PLShareParticipant setParticipantID:](self, "setParticipantID:", v9);
  -[PLShareParticipant setRole:](self, "setRole:", objc_msgSend(v20, "role"));
  -[PLShareParticipant setAcceptanceStatus:](self, "setAcceptanceStatus:", objc_msgSend(v20, "acceptanceStatus"));
  -[PLShareParticipant setPermission:](self, "setPermission:", objc_msgSend(v20, "permission"));
  -[PLShareParticipant setIsCurrentUser:](self, "setIsCurrentUser:", objc_msgSend(v20, "isCurrentUser"));

}

- (BOOL)_relationshipInInvalidState
{
  void *v2;
  BOOL v3;

  -[PLShareParticipant share](self, "share");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = -[PLShareParticipant _relationshipInInvalidState](self, "_relationshipInInvalidState");
  if (v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      if (v5)
        v9 = CFSTR("insert");
      else
        v9 = CFSTR("update");
      -[PLShareParticipant description](self, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "Attemping to %@ an orphaned ShareParticipant. An ShareParticipant object should always have a Share relationship set: %@", buf, 0x16u);

    }
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      if (v5)
        v12 = CFSTR("insert");
      else
        v12 = CFSTR("update");
      -[PLShareParticipant description](self, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Attemping to %@ an orphaned ShareParticipant. A ShareParticipant object should always have a Share relationship set: %@"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D74498];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 71001, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Orphaned ShareParticipant"), v14);
    }
  }
  return !v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLShareParticipant;
  v5 = -[PLShareParticipant validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[PLShareParticipant _validateRelationshipConstraintForInsert:error:](self, "_validateRelationshipConstraintForInsert:error:", 1, a3);
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLShareParticipant;
  v5 = -[PLShareParticipant validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
    LOBYTE(v5) = -[PLShareParticipant _validateRelationshipConstraintForInsert:error:](self, "_validateRelationshipConstraintForInsert:error:", 0, a3);
  return v5;
}

- (void)setPermission:(int64_t)a3
{
  void *v5;

  -[PLShareParticipant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("permission"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("permission"));

  -[PLShareParticipant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("permission"));
}

- (int64_t)permission
{
  void *v3;
  int64_t v4;

  -[PLShareParticipant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("permission"));
  -[PLShareParticipant primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("permission"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PLShareParticipant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("permission"));
  return v4;
}

- (void)setRole:(int64_t)a3
{
  void *v5;

  -[PLShareParticipant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("role"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("role"));

  -[PLShareParticipant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("role"));
}

- (int64_t)role
{
  void *v3;
  int64_t v4;

  -[PLShareParticipant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("role"));
  -[PLShareParticipant primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("role"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PLShareParticipant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("role"));
  return v4;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  void *v5;

  -[PLShareParticipant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("acceptanceStatus"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("acceptanceStatus"));

  -[PLShareParticipant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("acceptanceStatus"));
}

- (int64_t)acceptanceStatus
{
  void *v3;
  int64_t v4;

  -[PLShareParticipant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("acceptanceStatus"));
  -[PLShareParticipant primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("acceptanceStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PLShareParticipant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("acceptanceStatus"));
  return v4;
}

- (id)shortName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[PLShareParticipant nameComponents](self, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3858];
    -[PLShareParticipant nameComponents](self, "nameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromPersonNameComponents:style:options:", v5, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v3, "length"))
  {
    -[PLShareParticipant emailAddress](self, "emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[PLShareParticipant emailAddress](self, "emailAddress");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PLShareParticipant phoneNumber](self, "phoneNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        goto LABEL_9;
      -[PLShareParticipant phoneNumber](self, "phoneNumber");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;

    v3 = v11;
  }
LABEL_9:
  if (objc_msgSend(v3, "length"))
    v12 = v3;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)description
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLShareParticipant emailAddress](self, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant nameComponents](self, "nameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant userIdentifier](self, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShareParticipant participantID](self, "participantID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D11478], "descriptionForRole:", -[PLShareParticipant role](self, "role"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D11478], "descriptionForAcceptanceStatus:", -[PLShareParticipant acceptanceStatus](self, "acceptanceStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D11478], "descriptionForPermission:", -[PLShareParticipant permission](self, "permission"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@ [%@|%@|%@]"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)insertInPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLShareParticipant.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUuid:", v9);

  return v8;
}

+ (PLShareParticipant)participantWithCPLShareParticipant:(id)a3 inShare:(id)a4
{
  id v6;
  id v7;
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
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "email");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "participantID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddress != nil AND emailAddress = %@) OR (phoneNumber != nil AND phoneNumber = %@) OR (userIdentifier != nil AND userIdentifier = %@) OR (participantID != nil AND participantID = %@)"), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("share = %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v12;
  v23[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_shareParticipantsWithPredicate:fetchLimit:inManagedObjectContext:", v18, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLShareParticipant *)v21;
}

+ (PLShareParticipant)participantWithPLShareParticipant:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D11478];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithUserIdentifier:participantID:phoneNumber:email:", v6, v7, v8, v9);
  return (PLShareParticipant *)v10;
}

+ (id)participantsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_shareParticipantsWithPredicate:fetchLimit:inManagedObjectContext:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)participantsWithUserIdentifiers:(id)a3 inScope:(id)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("userIdentifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("share"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v10;
    v18[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v9, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_shareParticipantsWithPredicate:fetchLimit:inManagedObjectContext:", v10, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)participantsWithScope:(id)a3 inPhotoLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("share"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_shareParticipantsWithPredicate:fetchLimit:inManagedObjectContext:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_shareParticipantsWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLShareParticipant entityName](PLShareParticipant, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v7);
  if (a4)
    objc_msgSend(v11, "setFetchLimit:", a4);
  v16 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (!v12)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch moment share participant with predicate %@: %@", buf, 0x16u);
    }

  }
  return v12;
}

+ (id)entityName
{
  return CFSTR("ShareParticipant");
}

+ (BOOL)isCurrentUserInScopeChange:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isCurrentUser", (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
