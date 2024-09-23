@implementation STAskForTimeRequestResponse

+ (id)upsertAskForTimeRequest:(id)a3 fromUser:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  STAskForTimeRequestResponse *v20;
  NSObject *v21;
  void *v22;
  STAskForTimeRequestResponse *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  id *v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  STAskForTimeRequestResponse *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(a1, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dsid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchPredicateForAskForTimeRequest:requestingUserDSID:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v16);

  v62 = 0;
  objc_msgSend(v14, "execute:", &v62);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v62;
  v19 = v18;
  if (v17)
  {
    v61 = v18;
    v60 = v13;
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "firstObject");
      v20 = (STAskForTimeRequestResponse *)objc_claimAutoreleasedReturnValue();
      +[STLog ask](STLog, "ask");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_opt_new();
        objc_msgSend(v53, "nextDateAfterDate:matchingHour:minute:second:options:", v54, 0, 0, 0, 1024);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAskForTimeRequestResponse setExpirationDate:](v20, "setExpirationDate:", v55);

        objc_msgSend(v11, "timeRequested");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAskForTimeRequestResponse setTimeRequested:](v20, "setTimeRequested:", v56);

        v20 = v20;
        v23 = v20;
LABEL_31:

        v13 = v60;
        v19 = v61;
        goto LABEL_32;
      }
      -[STAskForTimeRequestResponse identifier](v20, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v20;
      v65 = 2114;
      v66 = v22;
      _os_log_impl(&dword_1D22E7000, v21, OS_LOG_TYPE_DEFAULT, "Updating existing ask for time request %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    else
    {
      v59 = a6;
      v20 = -[STAskForTimeRequestResponse initWithContext:]([STAskForTimeRequestResponse alloc], "initWithContext:", v13);
      objc_msgSend(v12, "familySettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "organization");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[STAskForTimeRequestResponse setFamilyOrganization:](v20, "setFamilyOrganization:", v25);

      objc_msgSend(v11, "requestedResourceIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      +[STLog ask](STLog, "ask");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "requestIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = (STAskForTimeRequestResponse *)v21;
        v65 = 2114;
        v66 = v27;
        _os_log_impl(&dword_1D22E7000, v26, OS_LOG_TYPE_DEFAULT, "Adding new ask for time request for resource identifier %{public}@, request %{public}@", buf, 0x16u);

      }
      v28 = objc_msgSend(v11, "usageType");
      -[STAskForTimeRequestResponse setUsageType:](v20, "setUsageType:", v28);
      if (v28 == 2)
      {
        +[STLog ask](STLog, "ask");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:].cold.3((uint64_t)v21, v36, v37, v38, v39, v40, v41, v42);

        -[STAskForTimeRequestResponse setRequestedCategoryIdentifier:](v20, "setRequestedCategoryIdentifier:", v21);
      }
      else if (v28 == 1)
      {
        +[STLog ask](STLog, "ask");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:].cold.2((uint64_t)v21, v43, v44, v45, v46, v47, v48, v49);

        -[STAskForTimeRequestResponse setRequestedWebDomain:](v20, "setRequestedWebDomain:", v21);
      }
      else if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STAskForTimeRequestResponse.m"), 77, CFSTR("Unexpected usage type %ld"), v28);

      }
      else
      {
        +[STLog ask](STLog, "ask");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:].cold.1((uint64_t)v21, v29, v30, v31, v32, v33, v34, v35);

        -[STAskForTimeRequestResponse setRequestedApplicationBundleIdentifier:](v20, "setRequestedApplicationBundleIdentifier:", v21);
      }
      -[STAskForTimeRequestResponse requestedApplicationBundleIdentifier](v20, "requestedApplicationBundleIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51
        || (-[STAskForTimeRequestResponse requestedWebDomain](v20, "requestedWebDomain"),
            (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        -[STAskForTimeRequestResponse requestedCategoryIdentifier](v20, "requestedCategoryIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v58)
        {
          if (v59)
            *v59 = objc_retainAutorelease(v61);

          v23 = 0;
          goto LABEL_31;
        }
      }
      -[STAskForTimeRequestResponse setRequestingUser:](v20, "setRequestingUser:", v12);
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v11, "requestIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAskForTimeRequestResponse setIdentifier:](v20, "setIdentifier:", v52);

      }
      v22 = (void *)objc_opt_new();
      -[STAskForTimeRequestResponse setRequestTimeStamp:](v20, "setRequestTimeStamp:", v22);
    }

    goto LABEL_30;
  }
  v23 = 0;
  if (a6)
    *a6 = objc_retainAutorelease(v18);
LABEL_32:

  return v23;
}

+ (id)_fetchPredicateForAskForTimeRequest:(id)a3 requestingUserDSID:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
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
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "usageType");
  objc_msgSend(v7, "requestedResourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == 2)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    v12 = CFSTR("requestedCategoryIdentifier");
  }
  else if (v9 == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    v12 = CFSTR("requestedWebDomain");
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STAskForTimeRequestResponse.m"), 118, CFSTR("Unexpected usage type %ld"), v9);

      v13 = 0;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x1E0CB3880];
    v12 = CFSTR("requestedApplicationBundleIdentifier");
  }
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("(%K == %@)"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K > %@) && (%K == NULL)"), CFSTR("usageType"), v16, CFSTR("requestingUser.dsid"), v8, CFSTR("expirationDate"), v17, CFSTR("respondingUser"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v7, "requestIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("identifier"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v18;
  v30[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v24;
  v29[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STAskForTimeRequestResponse;
  -[STAskForTimeRequestResponse awakeFromInsert](&v4, sel_awakeFromInsert);
  v3 = (void *)objc_opt_new();
  -[STAskForTimeRequestResponse setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v3, CFSTR("identifier"));

}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STAskForTimeRequestResponse;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, a2, a3, "Associating app %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, a2, a3, "Associating web domain %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, a2, a3, "Associating category %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
