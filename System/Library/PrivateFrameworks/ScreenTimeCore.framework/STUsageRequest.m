@implementation STUsageRequest

+ (id)fetchRequestForLocalUsageRequests
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("forUserDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchRequestForUsageRequestsThatAreForRemoteUsers
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("forUserDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchOrCreateUsageRequestForUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "longLongValue"))
    +[STCoreUser fetchUserWithDSID:inContext:error:](STCoreUser, "fetchUserWithDSID:inContext:error:", v8, v9, a5);
  else
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "fetchOrCreateUsageRequestForUser:inContext:error:", v10, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchOrCreateUsageRequestForUser:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "localUserDeviceState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "fetchOrCreateUsageRequestForLocalUserInContext:error:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fetchOrCreateUsageRequestForRemoteUserWithDSID:inContext:error:", v12, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)fetchOrCreateUsageRequestForLocalUserInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  STUsageRequest *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "fetchRequestForLocalUsageRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      +[STLog usage](STLog, "usage");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[STUsageRequest fetchOrCreateUsageRequestForLocalUserInContext:error:].cold.1(v7);

    }
    objc_msgSend(v9, "firstObject");
    v11 = (STUsageRequest *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = -[STUsageRequest initWithContext:]([STUsageRequest alloc], "initWithContext:", v6);
      v12 = (void *)objc_opt_new();
      -[STUsageRequest setRequestedDate:](v11, "setRequestedDate:", v12);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchOrCreateUsageRequestForRemoteUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  STUsageRequest *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("forUserDSID"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "execute:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      +[STLog usage](STLog, "usage");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[STUsageRequest fetchOrCreateUsageRequestForLocalUserInContext:error:].cold.1(v10);

    }
    objc_msgSend(v13, "firstObject");
    v15 = (STUsageRequest *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = -[STUsageRequest initWithContext:]([STUsageRequest alloc], "initWithContext:", v9);
      v16 = (void *)objc_opt_new();
      -[STUsageRequest setRequestedDate:](v15, "setRequestedDate:", v16);

      -[STUsageRequest setForUserDSID:](v15, "setForUserDSID:", v8);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)fetchOrCreateUsageRequestForLocalUserInContext:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D22E7000, v2, v3, "There was more than 1 usage request for %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
