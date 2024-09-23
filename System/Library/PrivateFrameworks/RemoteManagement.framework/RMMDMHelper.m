@implementation RMMDMHelper

+ (BOOL)isActiveForScope:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  +[RMManagedDevice currentManagedDevice](RMManagedDevice, "currentManagedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPropertyForKey:scope:", CFSTR("RMDMActive"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

+ (void)_setActive:(BOOL)a3 scope:(int64_t)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = a3;
  +[RMManagedDevice currentManagedDevice](RMManagedDevice, "currentManagedDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:scope:", v6, CFSTR("RMDMActive"), a4);

}

+ (BOOL)processDeclarativeManagementCommandWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 username:(id)a6 personaID:(id)a7 request:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v33[5];
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40[5];

  v40[4] = *(id *)MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[RMLog mdmHelper](RMLog, "mdmHelper");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.4((uint64_t)v15, a4);

  +[RMEnrollmentController synchronousEnrollmentControllerForManagementEnrollmentType:scope:](RMEnrollmentController, "synchronousEnrollmentControllerForManagementEnrollmentType:scope:", a4, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40[0] = 0;
  obj = 0;
  objc_msgSend(a1, "_enrolledDDMChannelWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:", v20, v15, a4, a5, v16, v17, &obj);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v40, obj);
  if (!v36[5])
  {
    if (v21)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Data"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[RMErrorUtilities createMDMRequestFailed:](RMErrorUtilities, "createMDMRequestFailed:", CFSTR("Cannot refresh management channel because the sync tokens response is invalid."));
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v36[5];
          v36[5] = v28;

          +[RMLog mdmHelper](RMLog, "mdmHelper");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v36[5], "description");
            objc_claimAutoreleasedReturnValue();
            +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.1();
          }

          goto LABEL_19;
        }
      }
      objc_msgSend(v21, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __126__RMMDMHelper_processDeclarativeManagementCommandWithProfileIdentifier_enrollmentType_scope_username_personaID_request_error___block_invoke;
      v33[3] = &unk_24D967DF0;
      v33[4] = &v35;
      objc_msgSend(v20, "updateWithIdentifier:tokensResponse:completionHandler:", v26, v25, v33);

      if (v36[5])
      {
        +[RMLog mdmHelper](RMLog, "mdmHelper");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v36[5], "description");
          objc_claimAutoreleasedReturnValue();
          +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.1();
        }

LABEL_19:
        if (a9)
        {
          v31 = (void *)v36[5];
          if (v31)
            *a9 = objc_retainAutorelease(v31);
        }

        goto LABEL_23;
      }

    }
    v24 = 1;
    goto LABEL_26;
  }
  +[RMLog mdmHelper](RMLog, "mdmHelper");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)v36[5], "description");
    objc_claimAutoreleasedReturnValue();
    +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.3();
  }

  if (!a9 || (v23 = (void *)v36[5]) == 0)
  {
LABEL_23:
    v24 = 0;
    goto LABEL_26;
  }
  v24 = 0;
  *a9 = objc_retainAutorelease(v23);
LABEL_26:

  _Block_object_dispose(&v35, 8);
  return v24;
}

void __126__RMMDMHelper_processDeclarativeManagementCommandWithProfileIdentifier_enrollmentType_scope_username_personaID_request_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (BOOL)unenrollWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 error:(id *)a6
{
  id v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  int v17;

  v10 = a3;
  v11 = +[RMMDMHelper isActiveForScope:](RMMDMHelper, "isActiveForScope:", a5);
  +[RMLog mdmHelper](RMLog, "mdmHelper");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
      +[RMMDMHelper unenrollWithProfileIdentifier:enrollmentType:scope:error:].cold.1((uint64_t)v10, a4);

    +[RMEnrollmentController synchronousEnrollmentControllerForManagementEnrollmentType:scope:](RMEnrollmentController, "synchronousEnrollmentControllerForManagementEnrollmentType:scope:", a4, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setScheme:", CFSTR("mdm"));
    objc_msgSend(v15, "setPath:", v14);

    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(a1, "_unenrollDDMChannelWithController:enrollmentURL:enrollmentType:error:", v12, v16, a4, a6);
    if (v17)
      +[RMMDMHelper _setActive:scope:](RMMDMHelper, "_setActive:scope:", 0, a5);

  }
  else
  {
    if (v13)
      +[RMMDMHelper unenrollWithProfileIdentifier:enrollmentType:scope:error:].cold.2();
    LOBYTE(v17) = 1;
  }

  return v17;
}

+ (id)_enrolledDDMChannelWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9
{
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;

  v14 = 0;
  objc_msgSend(a1, "_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:", a3, a4, a5, a6, a7, a8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[RMMDMHelper _enrolledDDMChannelWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.1(v10, v11);

    v12 = 0;
    if (a9)
      *a9 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

+ (id)_enrollDDMChannelIfNeededWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id *v48;
  BOOL v49;
  void *v50;
  id *v51;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  uint8_t buf[8];
  id obj;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v61 = a7;
  v15 = a8;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__0;
  v76 = __Block_byref_object_dispose__0;
  v77 = 0;
  v16 = v14;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setScheme:", CFSTR("mdm"));
  objc_msgSend(v17, "setPath:", v16);
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (id *)(v73 + 5);
  obj = (id)v73[5];
  objc_msgSend(a1, "_managementChannelForEnrollmentURL:controller:error:", v18, v13, &obj);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v19, obj);
  v21 = (void *)v73[5];
  if (v21)
  {
    if (a9)
    {
LABEL_3:
      v22 = 0;
      *a9 = objc_retainAutorelease(v21);
      goto LABEL_50;
    }
LABEL_18:
    v22 = 0;
    goto LABEL_50;
  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "rm_defaultStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v79 = &v78;
    v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__0;
    v82 = __Block_byref_object_dispose__0;
    objc_msgSend(v24, "rm_remoteManagementAccountForEnrollmentURL:", v18);
    v25 = v24;
    v83 = (id)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v79[5];
    if (v26)
    {
      objc_msgSend(v26, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[RMLog mdmHelper](RMLog, "mdmHelper");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.5();

      goto LABEL_13;
    }
    objc_msgSend(v24, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v16);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v79[5];
    v79[5] = v32;

    if (!v79[5])
    {
      +[RMManagedDevice currentManagedDevice](RMManagedDevice, "currentManagedDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isSharediPad");

      if (v35)
      {
        +[RMLog mdmHelper](RMLog, "mdmHelper");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21885E000, v36, OS_LOG_TYPE_DEFAULT, "We are under Shared iPad mode!", buf, 2u);
        }

        v54 = (void *)objc_opt_new();
        v55 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "details");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke;
        v65[3] = &unk_24D967E18;
        v69 = &v78;
        v66 = v25;
        v67 = v18;
        v68 = v54;
        v38 = v37;
        v39 = v68;
        objc_msgSend(v55, "updateSharediPadUserChannelWithManagedAppleID:profileIdentifier:organizationName:enrollmentURL:completionHandler:", v61, v16, v56, v67, v65);

        objc_msgSend(v39, "waitForCompletion");
      }
    }
    v40 = (void *)v79[5];
    if (a5 || v40)
    {
      if (!v40)
      {
        +[RMLog mdmHelper](RMLog, "mdmHelper");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.3();

        v57 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v40, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[RMLog mdmHelper](RMLog, "mdmHelper");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.2();

      v48 = (id *)(v73 + 5);
      v64 = (id)v73[5];
      v49 = +[RMAccountHelper updateAccountWithIdentifier:enrollmentURL:personaID:error:](RMAccountHelper, "updateAccountWithIdentifier:enrollmentURL:personaID:error:", v57, v18, v15, &v64);
      objc_storeStrong(v48, v64);
      if (v49)
      {
LABEL_13:
        v28 = 1;
LABEL_34:
        _Block_object_dispose(&v78, 8);

        if ((v28 & 1) == 0)
          goto LABEL_40;
        +[RMLog mdmHelper](RMLog, "mdmHelper");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.1();

        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_25;
        v63[3] = &unk_24D967E40;
        v63[4] = &v72;
        objc_msgSend(v13, "enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:", a5, v45, v57, v15, v63);

        v46 = (void *)v73[5];
        if (!v46)
        {
          +[RMMDMHelper _setActive:scope:](RMMDMHelper, "_setActive:scope:", 1, a6);
          v51 = (id *)(v73 + 5);
          v62 = (id)v73[5];
          objc_msgSend(a1, "_managementChannelForEnrollmentURL:controller:error:", v18, v13, &v62);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v51, v62);
          goto LABEL_49;
        }
        if (a9)
        {
          v22 = 0;
          *a9 = objc_retainAutorelease(v46);
        }
        else
        {
LABEL_40:
          v22 = 0;
        }
LABEL_49:

        goto LABEL_50;
      }
      if (a9)
      {
        v50 = (void *)v73[5];
        if (v50)
        {
          v28 = 0;
          *a9 = objc_retainAutorelease(v50);
          goto LABEL_34;
        }
      }
    }
    else
    {
      +[RMLog mdmHelper](RMLog, "mdmHelper");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.4();

      if (a9)
      {
        +[RMErrorUtilities createAccountMissingErrorWithIdentifier:](RMErrorUtilities, "createAccountMissingErrorWithIdentifier:", v16);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
          *a9 = objc_retainAutorelease(v42);

      }
      v57 = 0;
    }
    v28 = 0;
    goto LABEL_34;
  }
  if (objc_msgSend(v20, "type") != a5)
  {
    +[RMErrorUtilities createMDMRequestFailed:](RMErrorUtilities, "createMDMRequestFailed:", CFSTR("Cannot enroll DDM channel because a different enrollment type already exists."));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v73[5];
    v73[5] = v29;

    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v73[5], "description");
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.7();
    }

    if (a9)
    {
      v21 = (void *)v73[5];
      if (v21)
        goto LABEL_3;
    }
    goto LABEL_18;
  }
  +[RMLog mdmHelper](RMLog, "mdmHelper");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.6();

  v22 = v20;
LABEL_50:

  _Block_object_dispose(&v72, 8);
  return v22;
}

uint64_t __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a4)
  {
    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rm_remoteManagementAccountForEnrollmentURL:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return objc_msgSend(*(id *)(a1 + 48), "complete");
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_25_cold_1(a1, v6);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

+ (BOOL)_unenrollDDMChannelWithController:(id)a3 enrollmentURL:(id)a4 enrollmentType:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  id obj;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28[5];

  v28[4] = *(id *)MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28[0] = 0;
  obj = 0;
  objc_msgSend(a1, "_managementChannelForEnrollmentURL:controller:error:", v11, v10, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v28, obj);
  if (v12)
  {
    if (objc_msgSend(v12, "type") == a5)
    {
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __84__RMMDMHelper__unenrollDDMChannelWithController_enrollmentURL_enrollmentType_error___block_invoke;
      v21[3] = &unk_24D967DF0;
      v21[4] = &v23;
      objc_msgSend(v10, "unenrollViaMDMWithEnrollmentType:identifier:completionHandler:", a5, v13, v21);

      if (v24[5])
      {
        +[RMLog mdmHelper](RMLog, "mdmHelper");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v24[5], "description");
          objc_claimAutoreleasedReturnValue();
          +[RMMDMHelper _unenrollDDMChannelWithController:enrollmentURL:enrollmentType:error:].cold.2();
        }

        goto LABEL_14;
      }
LABEL_18:
      v19 = 1;
      goto LABEL_19;
    }
    +[RMErrorUtilities createMDMRequestFailed:](RMErrorUtilities, "createMDMRequestFailed:", CFSTR("Management channel found does not match expected channel."));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v24[5];
    v24[5] = v16;

    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v24[5], "description");
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.7();
    }
  }
  else
  {
    if (!v24[5])
      goto LABEL_18;
    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v24[5], "description");
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.3();
    }
  }

LABEL_14:
  if (a6 && (v18 = (void *)v24[5]) != 0)
  {
    v19 = 0;
    *a6 = objc_retainAutorelease(v18);
  }
  else
  {
    v19 = 0;
  }
LABEL_19:

  _Block_object_dispose(&v23, 8);
  return v19;
}

void __84__RMMDMHelper__unenrollDDMChannelWithController_enrollmentURL_enrollmentType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)_managementChannelForEnrollmentURL:(id)a3 controller:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke;
  v12[3] = &unk_24D967E68;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v8, "managementChannelWithEnrollmentURL:completionHandler:", v7, v12);
  if (a5)
  {
    v9 = (void *)v20[5];
    if (v9)
      *a5 = objc_retainAutorelease(v9);
  }
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[RMLog mdmHelper](RMLog, "mdmHelper");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke_cold_1(v7, v8);

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_21885E000, v3, (uint64_t)v3, "Failed to refresh enrolled management channel. Error: %{public}@", v4);

  OUTLINED_FUNCTION_3_0();
}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_21885E000, v3, (uint64_t)v3, "Failed to retrieve enrolled management channel. Error: %{public}@", v4);

  OUTLINED_FUNCTION_3_0();
}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:(uint64_t)a1 enrollmentType:(uint64_t)a2 scope:username:personaID:request:error:.cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0(&dword_21885E000, v2, v3, "Processing RemoteManagement command for %{public}@, type: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_12();
}

+ (void)unenrollWithProfileIdentifier:(uint64_t)a1 enrollmentType:(uint64_t)a2 scope:error:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0(&dword_21885E000, v2, v3, "Processing unenroll request for %{public}@, type: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_12();
}

+ (void)unenrollWithProfileIdentifier:enrollmentType:scope:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Ignore unenroll request for %{public}@: rMDM is not active.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_enrolledDDMChannelWithController:(void *)a1 profileIdentifier:(NSObject *)a2 enrollmentType:scope:username:personaID:error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21885E000, a2, v4, "Failed to retrieve enrolled management channel. Error: %{public}@", v5);

  OUTLINED_FUNCTION_8_0();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "Enrolling DDM channel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Found RM account to update: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "No RM account found, but it is optional", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_21885E000, v0, v1, "Failed to find required RM account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Found RM account already setup: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "Found enrolled DDM channel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_21885E000, v3, (uint64_t)v3, "Management channel found is not the right enrollment type. Error: %{public}@", v4);

  OUTLINED_FUNCTION_3_0();
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_21885E000, v0, v1, "Failed to create RM account for Shared iPad!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21885E000, a2, v4, "Failed to enroll DDM channel. Error: %{public}@", v5);

  OUTLINED_FUNCTION_8_0();
}

+ (void)_unenrollDDMChannelWithController:enrollmentURL:enrollmentType:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_21885E000, v3, (uint64_t)v3, "Failed to unenroll management channel. Error: %{public}@", v4);

  OUTLINED_FUNCTION_3_0();
}

void __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21885E000, a2, v4, "Failed to find management channel. Error: %{public}@", v5);

  OUTLINED_FUNCTION_8_0();
}

@end
