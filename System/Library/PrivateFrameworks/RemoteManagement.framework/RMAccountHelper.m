@implementation RMAccountHelper

+ (id)createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v16 = (void *)MEMORY[0x24BE2A838];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __87__RMAccountHelper_createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke;
  v25[3] = &unk_24D9679C8;
  v30 = &v39;
  v32 = a1;
  v17 = v12;
  v26 = v17;
  v18 = v13;
  v27 = v18;
  v19 = v14;
  v28 = v19;
  v20 = v15;
  v29 = v20;
  v31 = &v33;
  v21 = (id)objc_msgSend(v16, "performBlockUnderPersona:block:", v19, v25);
  if (a7)
  {
    v22 = (void *)v34[5];
    if (v22)
      *a7 = objc_retainAutorelease(v22);
  }
  v23 = (id)v40[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

void __87__RMAccountHelper_createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = (void *)a1[10];
  v7 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "_createAccountWithEnrollmentURL:username:personaID:description:error:", v2, v3, v4, v5, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (id)_createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDB4398], "rm_defaultStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4380], "rm_createTestAccountWithStore:username:description:enrollmentURL:", v15, v12, v14, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
    objc_msgSend(v16, "rm_setPersonaIdentifier:", v13);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v18 = (void *)objc_opt_new();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__RMAccountHelper__createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke;
  v24[3] = &unk_24D9679F0;
  v26 = v28;
  v27 = &v30;
  v19 = v18;
  v25 = v19;
  objc_msgSend(v15, "saveAccount:withCompletionHandler:", v17, v24);
  objc_msgSend(v19, "waitForCompletion");
  if (v31[5])
  {
    +[RMLog accountHelper](RMLog, "accountHelper");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "identifier");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "description");
      objc_claimAutoreleasedReturnValue();
      +[RMAccountHelper _createAccountWithEnrollmentURL:username:personaID:description:error:].cold.1();
    }

    if (a7 && (v21 = (void *)v31[5]) != 0)
    {
      v22 = 0;
      *a7 = objc_retainAutorelease(v21);
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    objc_msgSend(v17, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __88__RMAccountHelper__createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

+ (BOOL)updateAccountWithIdentifier:(id)a3 enrollmentURL:(id)a4 personaID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v12 = (void *)MEMORY[0x24BE2A838];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke;
  v20[3] = &unk_24D967A40;
  v24 = &v32;
  v13 = v9;
  v21 = v13;
  v25 = &v26;
  v14 = v11;
  v22 = v14;
  v15 = v10;
  v23 = v15;
  v16 = (id)objc_msgSend(v12, "performBlockUnderPersona:block:", v14, v20);
  if (a6)
  {
    v17 = (void *)v27[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDB4398], "rm_defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(id *)(v3 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke_2;
  v5[3] = &unk_24D967A18;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v8, v5);
  objc_storeStrong((id *)(v3 + 40), v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;

}

void __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "rm_setAccountScheme:", CFSTR("Bearer"));
    v3 = v4;
  }
  objc_msgSend(v3, "rm_setEnrollmentURL:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)removeAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  +[RMLog accountHelper](RMLog, "accountHelper");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[RMAccountHelper removeAccountWithIdentifier:error:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x24BDB4398], "rm_defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rm_remoteManagementAccountForIdentifier:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "_removeAccount:store:error:", v15, v14, a4);

  return v16;
}

+ (BOOL)removeAccountWithEnrollmentURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  +[RMLog accountHelper](RMLog, "accountHelper");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[RMAccountHelper removeAccountWithEnrollmentURL:error:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x24BDB4398], "rm_defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rm_remoteManagementAccountForEnrollmentURL:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "_removeAccount:store:error:", v15, v14, a4);

  return v16;
}

+ (BOOL)_removeAccount:(id)a3 store:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  _QWORD v36[3];
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    v43 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0;
    v9 = (void *)objc_opt_new();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __46__RMAccountHelper__removeAccount_store_error___block_invoke;
    v32[3] = &unk_24D9679F0;
    v34 = v36;
    v35 = &v38;
    v10 = v9;
    v33 = v10;
    objc_msgSend(v8, "removeAccount:withCompletionHandler:", v7, v32);
    objc_msgSend(v10, "waitForCompletion");
    v11 = v39[5];
    v12 = v11 == 0;
    if (v11)
    {
      +[RMLog accountHelper](RMLog, "accountHelper");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "identifier");
        objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v39[5], "description");
        objc_claimAutoreleasedReturnValue();
        +[RMAccountHelper _createAccountWithEnrollmentURL:username:personaID:description:error:].cold.1();
      }

      if (a5)
      {
        v14 = (void *)v39[5];
        if (v14)
          *a5 = objc_retainAutorelease(v14);
      }
    }
    else
    {
      +[RMLog accountHelper](RMLog, "accountHelper");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        +[RMAccountHelper _removeAccount:store:error:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    +[RMLog accountHelper](RMLog, "accountHelper");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[RMAccountHelper _removeAccount:store:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v12 = 1;
  }

  return v12;
}

void __46__RMAccountHelper__removeAccount_store_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v5 = 0;
  else
    v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

+ (void)_createAccountWithEnrollmentURL:username:personaID:description:error:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_21885E000, "Failed to remove account: %{public}@. Error: %{public}@", v5, v6);

}

+ (void)removeAccountWithIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21885E000, a2, a3, "Remove account with identifier %{public}@.", a5, a6, a7, a8, 2u);
}

+ (void)removeAccountWithEnrollmentURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21885E000, a2, a3, "Remove account with enrollment URL %{public}@.", a5, a6, a7, a8, 2u);
}

+ (void)_removeAccount:(uint64_t)a3 store:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21885E000, a1, a3, "No account to remove.", a5, a6, a7, a8, 0);
}

+ (void)_removeAccount:(uint64_t)a3 store:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21885E000, a1, a3, "Removed account.", a5, a6, a7, a8, 0);
}

@end
