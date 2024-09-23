@implementation REMError

+ (id)noPrimaryActiveCloudKitAccountError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No active CloudKit account is currently logged in or enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2938];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3007, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)noSuchObjectErrorWithObjectID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("No such object error {objectID: %@}"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = *MEMORY[0x1E0CB2938];
  v12[1] = CFSTR("REMErrorObjectIDEntityNameKey");
  v13[0] = v5;
  v13[1] = v6;
  v12[2] = CFSTR("REMErrorObjectIDUUIDKey");
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3000, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)throttledErrorWithRemainingTimeInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation is throttled {remainingTime: %.4f}"), *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorSanitizedForXPCFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "_errorSanitizedForXPCFromError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.reminderkit"));

  if (v7)
  {
    v8 = v5;
  }
  else
  {
    if (objc_msgSend(a1, "_isCoreDataError:", v4))
    {
      v9 = a1;
      v10 = -3004;
    }
    else
    {
      v9 = a1;
      v10 = -1;
    }
    objc_msgSend(v9, "_errorWithCode:underlyingError:", v10, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  return v11;
}

+ (id)internalErrorWithDebugDescription:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)mismatchedObjectIDWithObjectID:(id)a3 expected:(Class)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[REMLogStore utility](REMLogStore, "utility");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    +[REMError mismatchedObjectIDWithObjectID:expected:].cold.1((uint64_t)v5, (uint64_t)a4, v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatched objectID type {objectID: %@, expected: %@}"), v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2938];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)unexpectedError
{
  return (id)objc_msgSend(a1, "internalErrorWithDebugDescription:", CFSTR("Unexpected Error"));
}

+ (id)errorFromErrors:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[REMError errorFromErrors:].cold.1(v5);

    v6 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = MEMORY[0x1E0C9AA60];
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (id *)v15;
    v9 = &v14;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "count") != 1)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v13 = v3;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v13;
    v9 = &v12;
LABEL_8:
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -2, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v4;
}

+ (id)sqliteErrorWithCode:(int64_t)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v11);

  objc_msgSend(a1, "_errorWithCode:userInfo:error:path:URL:description:", a3, 0, 0, 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sqliteErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v14);

  objc_msgSend(a1, "_errorWithCode:userInfo:error:path:URL:description:", a3, 0, 0, v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing entitlement: %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3 requestedAccessLevel:(id)a4 currentAccesslevel:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing entitlement: %@ {requestedAccessLevel: %@, currentAccesslevel: %@}"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2938];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1000, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)babySatErrorWithOperationName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation is babysat {operationName: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1003, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cancelledError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1001, 0);
}

+ (id)retryLaterErrorWithInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v8 = CFSTR("REMErrorRetryAfterKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(a3, 0.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1004, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tooManyLoadedStoresError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1005, 0);
}

+ (id)notSupportedError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1006, 0);
}

+ (id)notSupportedErrorWithDebugDescription:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1006, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)internetNotReachableError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -1007, 0);
}

+ (BOOL)isNoSuchObjectError:(id)a3 forObjectID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.reminderkit")))
  {
    v8 = objc_msgSend(v5, "code");

    if (v8 == -3000)
    {
      objc_msgSend(v5, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDEntityNameKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v10, (uint64_t)v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDUUIDKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v13, (uint64_t)v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && v15)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
        if (v16)
        {
          objc_msgSend(v6, "entityName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqualToString:", v12))
          {
            objc_msgSend(v6, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqual:", v16);

          }
          else
          {
            v19 = 0;
          }

          goto LABEL_18;
        }
        +[REMLog utility](REMLog, "utility");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          +[REMError isNoSuchObjectError:forObjectID:].cold.1((uint64_t)v15, v26, v27, v28, v29, v30, v31, v32);

      }
      else
      {
        +[REMLog utility](REMLog, "utility");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          +[REMError isNoSuchObjectError:forObjectID:].cold.2((uint64_t)v9, v16, v20, v21, v22, v23, v24, v25);
      }
      v19 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {

  }
  v19 = 0;
LABEL_19:

  return v19;
}

+ (id)noSuchObjectErrorWithExternalIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No such object error {externalIdentifier: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)noSuchObjectErrorWithDACalendarItemUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No such object error {daCalendarItemUniqueIdentifier: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)noSuchSmartListErrorWithSmartListType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No such smart list error {smartListType: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3006, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)accountStoreMissingError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Persistent store not found for some of the changed objects {accountIdentifiers: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3008, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)saveErrorWithCoreDataError:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_errorSanitizedForXPCFromError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorWithCode:underlyingError:", -3001, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validationErrorMoveAcrossAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving object across is unsupported {objectID: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validationErrorMoveFromAccount:(id)a3 toAccount:(id)a4 objectID:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving between accounts is unsupported {fromAccountID: %@, toAccountID: %@: objectID: %@}"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2938];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validationErrorListHasNoAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("List should not have nil account {listID: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validationErrorMoveReminderFromList:(id)a3 toList:(id)a4 inAccount:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving between lists is unsupported in this account {fromListID: %@, toListID: %@, accountID: %@}"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2938];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validationErrorNestedSubtask:(id)a3 parentReminderID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nested subtasks is unsupported {parentReminderID: %@, reminderID: %@}"), a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validationErrorSubtaskAndParentNotOnSameList:(id)a3 parentReminderID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Subtask has different list from its parent reminder {parentReminderID: %@, reminderID: %@}"), a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validationErrorUndeleteHashtagFromAnotherReminder:(id)a3 expectedReminderID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to undelete hashtag from another reminder {hashtagID: %@, reminderID: %@}"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validationErrorNotCloudKitAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action is unavailable to non-CloudKit account {accountID: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validationErrorRemoveAccountBeingInserted:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing an account at the same time inserting it is unsupported {accountID: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validationErrorRemoveAccountBeingActivated:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing an account at the same time setting it as active is unsupported {accountID: %@}"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validationErrorDifferentZoneObjectID:(id)a3 zoneOwnerName:(id)a4 parentObjectID:(id)a5 parentZoneOwnerName:(id)a6
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object { id: %@, zoneOwner: %@} and its parent { id: %@, zoneOwner: %@} with different zones are unsupported"), a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3002, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)constraintConflictWithIdentifier:(id)a3 constraint:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled constraint conflict {identifier: %@, constraint: %@}"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3003, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)nullifiedRelationshipErrorWithRelationshipName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -3005, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)invalidParameterErrorWithDescription:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -4000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)unexpectedNilPropertyWithClass:(Class)a3 property:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil property {class: %@, property: %@}"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -4001, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)unexpectedNilPropertyWithObjectID:(id)a3 property:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil property {remObjectID: %@, property: %@}"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -4001, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)xpcPerformerUnavailableErrorWithDescription:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), -5000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)catchObjCException:(id)a3 error:(id *)a4
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

+ (BOOL)_isCoreDataError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C979C8]);

  }
  return v5;
}

+ (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4 error:(id)a5 path:(id)a6 URL:(id)a7 description:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = objc_msgSend(v13, "mutableCopy");
  v19 = (void *)v18;
  if (!v14 && !v15 && !v16 && !v17)
    goto LABEL_14;
  if (!v18)
  {
    v19 = (void *)objc_opt_new();
    if (!v14)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v14)
LABEL_7:
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3388]);
LABEL_8:
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2AA0]);
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3308]);
  if (v17)
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2938]);
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminderkit"), a3, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_errorSanitizedForXPCFromError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_msgSend(v3, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB2938];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

  }
  objc_msgSend(v3, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDEntityNameKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDEntityNameKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("REMErrorObjectIDEntityNameKey"));

  }
  objc_msgSend(v3, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDUUIDKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("REMErrorObjectIDUUIDKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("REMErrorObjectIDUUIDKey"));

  }
  objc_msgSend(v3, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSUnderlyingException"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v24, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reason");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("exception.name: %@, reason: %@"), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v11);

  }
  v29 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v3, "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v3, "code"), v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (void)mismatchedObjectIDWithObjectID:(os_log_t)log expected:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "Mismatched objectID type {objectID: %@, expected: %@}", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)errorFromErrors:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "No error object to produce REMErrorCodeMultipleErrors.", v1, 2u);
}

+ (void)isNoSuchObjectError:(uint64_t)a3 forObjectID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "noSuchObject REMError has an invalid UUID string {errorUUIDString: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)isNoSuchObjectError:(uint64_t)a3 forObjectID:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "noSuchObject REMError has unexpected keys {error.userInfo: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

@end
