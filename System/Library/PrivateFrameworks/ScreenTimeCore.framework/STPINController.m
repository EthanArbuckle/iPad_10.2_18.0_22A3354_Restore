@implementation STPINController

- (STPINController)initWithUser:(id)a3
{
  id v5;
  STPINController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STPINController;
  v6 = -[STPINController init](&v12, sel_init);
  if (v6)
  {
    +[STLog pinController](STLog, "pinController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[STPINController initWithUser:].cold.1((uint64_t)v6, v5, v7);

    objc_storeStrong((id *)&v6->_user, a3);
    objc_msgSend(v5, "passcodeEntryTimeoutEndDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:", v9);

      if (v10 == 1)
      {
        objc_storeStrong((id *)&v6->_timeoutEndDate, v8);
        -[STPINController _beginTimeoutUntilDate:](v6, "_beginTimeoutUntilDate:", v8);
      }
    }

  }
  return v6;
}

+ (unint64_t)pinLength
{
  return 4;
}

- (BOOL)canRecoveryAuthenticate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  char v11;
  BOOL v12;

  -[STPINController user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveRecoveryAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue"))
  {
    objc_msgSend(v3, "familyMemberType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Child")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("Teen")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "altDSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  -[STPINController timeoutEndDate](self, "timeoutEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = objc_msgSend(v3, "passcodeRecoveryAttemptCount") < 1;
  else
    v10 = 1;

  if (v4)
    v11 = 1;
  else
    v11 = v7;
  v12 = v11 & v10;

  return v12;
}

- (void)setPIN:(id)a3 withRecoveryAppleIDPrompt:(id)a4 completionHandler:(id)a5
{
  -[STPINController _setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:](self, "_setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:", a3, 0, a4, a5);
}

- (void)updatePIN:(id)a3 toPIN:(id)a4 withRecoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6
{
  -[STPINController _setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:](self, "_setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:", a4, a3, a5, a6);
}

- (void)removePIN:(id)a3 completionHandler:(id)a4
{
  -[STPINController _setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:](self, "_setNewPIN:currentPIN:recoveryAppleIDPrompt:completionHandler:", 0, a3, 0, a4);
}

- (BOOL)_isPINValid:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 == objc_msgSend((id)objc_opt_class(), "pinLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setNewPIN:(id)a3 currentPIN:(id)a4 recoveryAppleIDPrompt:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  STPINController *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  STPINController *v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v32 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11 || -[STPINController _isPINValid:](self, "_isPINValid:", v11))
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__13;
    v59 = __Block_byref_object_dispose__13;
    v60 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    -[STPINController user](self, "user");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
    v16 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke;
    v41[3] = &unk_1E9371A40;
    v17 = v15;
    v42 = v17;
    v18 = v14;
    v43 = v18;
    v44 = v32;
    v48 = &v55;
    v19 = v11;
    v45 = v19;
    v49 = &v51;
    v20 = v12;
    v50 = &v61;
    v46 = self;
    v47 = v20;
    objc_msgSend(v17, "performBlockAndWait:", v41);
    if (*((_BYTE *)v62 + 24))
    {
      if (*((_BYTE *)v52 + 24))
      {
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STPINController.m"), 163, CFSTR("Recovery Apple ID prompt must not be nil"));

        }
        v33[0] = v16;
        v33[1] = 3221225472;
        v33[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_31;
        v33[3] = &unk_1E9371A90;
        v39 = &v61;
        v34 = v17;
        v35 = self;
        v36 = v19;
        v37 = v18;
        v40 = &v55;
        v38 = v13;
        (*((void (**)(id, _QWORD *))v20 + 2))(v20, v33);

        goto LABEL_12;
      }
      v30 = 0;
    }
    else
    {
      v30 = v56[5];
    }
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v30);
LABEL_12:

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);

    _Block_object_dispose(&v61, 8);
    goto LABEL_13;
  }
  +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PINInvalidError"), &stru_1E9372498, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("EnterValidPIN"), &stru_1E9372498, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:locale:", v23, v25, objc_msgSend((id)objc_opt_class(), "pinLength"));

  v27 = *MEMORY[0x1E0CB2D80];
  v65[0] = *MEMORY[0x1E0CB2D50];
  v65[1] = v27;
  v66[0] = v22;
  v66[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 20, v28);
  (*((void (**)(id, void *))v13 + 2))(v13, v29);

LABEL_13:
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  id obj;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 40);
  if (v2 && (objc_msgSend(v2, "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "effectivePasscode");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v3) & 1) == 0)
    {
      +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PINIncorrectError"), &stru_1E9372498, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0CB2D50];
      v36[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 18, v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "effectiveRecoveryAltDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "familyMemberType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_QWORD *)(a1 + 72) || v14)
        {
          v25 = a1 + 88;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "dsid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");
          v18 = 1;
          if (v17 && v15)
          {
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
            {
              v18 = 1;
            }
            else if (objc_msgSend(v15, "isEqualToString:", CFSTR("Adult")))
            {
              v18 = objc_msgSend(*(id *)(a1 + 40), "isManaged") ^ 1;
            }
            else
            {
              v18 = 0;
            }
          }
          v25 = a1 + 88;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v18;

        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v25 + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
        }
        else
        {
          v28 = *(_QWORD *)(a1 + 56);
          v27 = *(void **)(a1 + 64);
          v29 = *(_QWORD *)(a1 + 40);
          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v34 = *(id *)(v30 + 40);
          v31 = objc_msgSend(v27, "_setPasscode:recoveryAppleID:forUser:error:", v28, v14, v29, &v34);
          objc_storeStrong((id *)(v30 + 40), v34);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v31;
        }

      }
      else
      {
        v19 = *(_QWORD *)(a1 + 40);
        obj = 0;
        v20 = +[STBlueprint deleteManagedUserBlueprintForUser:error:](STBlueprint, "deleteManagedUserBlueprintForUser:error:", v19, &obj);
        objc_storeStrong(v12, obj);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v20;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "setEffectivePasscode:", 0);
          objc_msgSend(*(id *)(a1 + 40), "setEffectiveRecoveryAltDSID:", 0);
          objc_msgSend(*(id *)(a1 + 40), "setContactsEditable:", 1);
          objc_msgSend(*(id *)(a1 + 40), "setIsCommunicationSafetySendingRestricted:", 0);
          objc_msgSend(*(id *)(a1 + 40), "setIsCommunicationSafetyReceivingRestricted:", 0);
          objc_msgSend(*(id *)(a1 + 40), "setIsCommunicationSafetyNotificationEnabled:", 0);
          objc_msgSend(*(id *)(a1 + 40), "setIsCommunicationSafetyAnalyticsEnabled:", 0);
          v21 = *(void **)(a1 + 64);
          v22 = *(_QWORD *)(a1 + 40);
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v32 = *(id *)(v23 + 40);
          v24 = objc_msgSend(v21, "_saveChangesForUser:error:", v22, &v32);
          objc_storeStrong((id *)(v23 + 40), v32);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v24;
        }
        else
        {
          +[STLog pinController](STLog, "pinController");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_2();

        }
      }
    }
  }
  else
  {
    +[STLog pinController](STLog, "pinController");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_1();
  }

}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a2;
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_2;
    v9[3] = &unk_1E9371A68;
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 72);
    v9[4] = v3;
    v10 = *(id *)(a1 + 48);
    v11 = v8;
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 80);
    v12 = v5;
    v14 = v6;
    objc_msgSend(v4, "performBlockAndWait:", v9);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      v7 = 0;
    else
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "_setPasscode:recoveryAppleID:forUser:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v7;
}

- (BOOL)_setPasscode:(id)a3 recoveryAppleID:(id)a4 forUser:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (+[STBlueprint saveManagedUserBlueprintForUser:error:](STBlueprint, "saveManagedUserBlueprintForUser:error:", v12, a6))
  {
    objc_msgSend(v12, "setEffectivePasscode:", v10);
    objc_msgSend(v12, "setEffectiveRecoveryAltDSID:", v11);
    v13 = -[STPINController _saveChangesForUser:error:](self, "_saveChangesForUser:error:", v12, a6);
  }
  else
  {
    +[STLog pinController](STLog, "pinController");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STPINController _setPasscode:recoveryAppleID:forUser:error:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (BOOL)_saveChangesForUser:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "saveContext:error:", v7, a4);

  }
  else
  {
    objc_msgSend(v5, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "save:", a4);

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      +[STLog pinController](STLog, "pinController");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[STPINController _saveChangesForUser:error:].cold.1(v5, (uint64_t *)a4, v11);

      +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PersistPINError"), &stru_1E9372498, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x1E0CB2D50];
      v20[0] = v13;
      v15 = *MEMORY[0x1E0CB3388];
      v19[0] = v14;
      v19[1] = v15;
      STXPCSafeErrorFromCoreDataError(*a4, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 1, v17);
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)authenticateWithPIN:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  -[STPINController user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__STPINController_authenticateWithPIN_error___block_invoke;
  v13[3] = &unk_1E9371AB8;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "performBlockAndWait:", v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __45__STPINController_authenticateWithPIN_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  id obj;

  v2 = a1 + 56;
  v1 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v2 - 16);
  v5 = *(_QWORD *)(v2 - 8);
  v6 = *(_QWORD *)(v1 + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "_authenticateWithPIN:forUser:allowPasscodeRecovery:error:", v4, v5, 0, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) == 0)
  {
    +[STLog pinController](STLog, "pinController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __45__STPINController_authenticateWithPIN_error___block_invoke_cold_1();

  }
}

- (void)authenticateWithPIN:(id)a3 allowPasscodeRecovery:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  -[STPINController user](self, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke;
  v15[3] = &unk_1E9371AE0;
  v15[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

void __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v15 = 0;
  v6 = objc_msgSend(v2, "_authenticateWithPIN:forUser:allowPasscodeRecovery:error:", v3, v4, v5, &v15);
  v7 = v15;
  if ((v6 & 1) == 0)
  {
    +[STLog pinController](STLog, "pinController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7, objc_msgSend(*(id *)(a1 + 48), "passcodeEntryAttemptCount"));

}

- (void)authenticateWithPIN:(id)a3 completionHandler:(id)a4
{
  -[STPINController authenticateWithPIN:allowPasscodeRecovery:completionHandler:](self, "authenticateWithPIN:allowPasscodeRecovery:completionHandler:", a3, 0, a4);
}

- (BOOL)_authenticateWithPIN:(id)a3 forUser:(id)a4 allowPasscodeRecovery:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  uint64_t v39;
  _QWORD v40[2];

  v7 = a5;
  v40[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[STPINController timeoutEndDate](self, "timeoutEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || v7 && -[STPINController canRecoveryAuthenticate](self, "canRecoveryAuthenticate"))
  {
    objc_msgSend(v11, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshObject:mergeChanges:", v11, 1);
    if (!v11 || objc_msgSend(v11, "isDeleted"))
    {
      +[STLog pinController](STLog, "pinController");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:].cold.1(v11, v14);

      if (a6)
      {
        v15 = 0;
        *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 11, 0);
LABEL_36:

        goto LABEL_37;
      }
LABEL_12:
      v15 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v11, "effectivePasscode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if ((objc_msgSend(v10, "isEqualToString:", v19) & 1) == 0)
      {
        if (v12)
        {
          objc_msgSend(v11, "setPasscodeRecoveryAttemptCount:", objc_msgSend(v11, "passcodeRecoveryAttemptCount") + 1);
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 25, 0);
        }
        else
        {
          v22 = objc_msgSend(v11, "passcodeEntryAttemptCount");
          v23 = v22 + 1;
          objc_msgSend(v11, "setPasscodeEntryAttemptCount:", v22 + 1);
          +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PINIncorrectError"), &stru_1E9372498, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 < 5)
          {
            v35[0] = *MEMORY[0x1E0CB2D50];
            v35[1] = CFSTR("PINAuthenticationAttempts");
            v36[0] = v25;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v36[1] = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[STPINController _timeoutEndDateForAttemptNumber:](self, "_timeoutEndDateForAttemptNumber:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[STPINController _beginTimeoutUntilDate:](self, "_beginTimeoutUntilDate:", v26);
            objc_msgSend(v11, "setPasscodeEntryTimeoutEndDate:", v26);
            v27 = *MEMORY[0x1E0CB2D50];
            v38[0] = v25;
            v37[0] = v27;
            v37[1] = CFSTR("PINAuthenticationAttempts");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v37[2] = CFSTR("PINTimeoutDate");
            v38[1] = v28;
            v38[2] = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 18, v29);

        }
        goto LABEL_27;
      }
      objc_msgSend(v11, "setPasscodeEntryAttemptCount:", 0);
      objc_msgSend(v11, "setPasscodeEntryTimeoutEndDate:", 0);
      objc_msgSend(v11, "setPasscodeRecoveryAttemptCount:", 0);
      -[STPINController setTimeoutEndDate:](self, "setTimeoutEndDate:", 0);
    }
    else
    {
      +[STLog pinController](STLog, "pinController");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:].cold.3(v20);

      objc_msgSend(v11, "setPasscodeEntryAttemptCount:", 0);
    }
    v21 = 0;
LABEL_27:
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v34 = 0;
      v30 = objc_msgSend(v13, "save:", &v34);
      v31 = v34;
      if ((v30 & 1) == 0)
      {
        +[STLog pinController](STLog, "pinController");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          -[STPINController _authenticateWithPIN:forUser:allowPasscodeRecovery:error:].cold.2((uint64_t)v31, v32);

      }
    }
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    v15 = v21 == 0;

    goto LABEL_36;
  }
  if (a6)
  {
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PINEntryTimeoutError"), &stru_1E9372498, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 24, v18);

    goto LABEL_12;
  }
  v15 = 0;
LABEL_37:

  return v15;
}

- (id)_timeoutEndDateForAttemptNumber:(int64_t)a3
{
  double v3;
  unint64_t v4;

  v3 = 0.0;
  v4 = a3 - 6;
  if (a3 >= 6)
  {
    if (v4 > 2)
      v3 = 3600.0;
    else
      v3 = dbl_1D236A558[v4];
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v3);
}

- (void)_beginTimeoutUntilDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  _QWORD handler[5];
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STPINController setTimeoutEndDate:](self, "setTimeoutEndDate:", v4);
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  if (!csr_check())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("com.apple.ScreenTimeAgent.PINTimeoutIntervalOverride"));

    if (v8 >= 1)
    {
      +[STLog pinController](STLog, "pinController");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[STPINController _beginTimeoutUntilDate:].cold.1(v9);

      v6 = (double)v8;
    }
  }
  +[STLog pinController](STLog, "pinController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v21 = vcvtpd_s64_f64(v6);
    _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_INFO, "Scheduled PIN timeout for %d seconds", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__STPINController__beginTimeoutUntilDate___block_invoke;
  v18[3] = &unk_1E93719C8;
  v18[4] = self;
  v13 = v4;
  v19 = v13;
  objc_msgSend(v11, "addOperationWithBlock:", v18);

  -[STPINController backoffTimer](self, "backoffTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v16 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = __42__STPINController__beginTimeoutUntilDate___block_invoke_2;
    handler[3] = &unk_1E93719F0;
    handler[4] = self;
    dispatch_source_set_event_handler(v15, handler);
    -[STPINController setBackoffTimer:](self, "setBackoffTimer:", v15);
    dispatch_activate(v15);

  }
}

void __42__STPINController__beginTimeoutUntilDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("TimeoutEndDate");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PINTimeoutDidBegin"), v4, v5);

}

void __42__STPINController__beginTimeoutUntilDate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "backoffTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "setBackoffTimer:", 0);
  +[STLog pinController](STLog, "pinController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v3, OS_LOG_TYPE_INFO, "PIN backoff time fired", buf, 2u);
  }

  +[STLog pinController](STLog, "pinController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D22E7000, v4, OS_LOG_TYPE_DEFAULT, "PIN backoff time fired", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTimeoutEndDate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PINTimeoutDidEnd"), *(_QWORD *)(a1 + 32), 0);

}

- (NSDate)timeoutEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimeoutEndDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (STCoreUser)user
{
  return self->_user;
}

- (OS_dispatch_source)backoffTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackoffTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_timeoutEndDate, 0);
}

- (void)initWithUser:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1D22E7000, a3, OS_LOG_TYPE_DEBUG, "Created new PinController: %@ for user: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_2_3();
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to get user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__STPINController__setNewPIN_currentPIN_recoveryAppleIDPrompt_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setPasscode:recoveryAppleID:forUser:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to save managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveChangesForUser:(NSObject *)a3 error:.cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1D22E7000, a3, OS_LOG_TYPE_ERROR, "Failed to save PIN for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_2_3();
}

void __45__STPINController_authenticateWithPIN_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to authenticate PIN: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__STPINController_authenticateWithPIN_allowPasscodeRecovery_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to authenticate PIN: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_authenticateWithPIN:(void *)a1 forUser:(NSObject *)a2 allowPasscodeRecovery:error:.cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "isDeleted");
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to get user - was deleted: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)_authenticateWithPIN:(uint64_t)a1 forUser:(NSObject *)a2 allowPasscodeRecovery:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_FAULT, "Failed to save pin entry attempt count: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_authenticateWithPIN:(os_log_t)log forUser:allowPasscodeRecovery:error:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "WARN: Attempting to authenticate against an unset PIN, this seems unexpected", v1, 2u);
}

- (void)_beginTimeoutUntilDate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "Overriding PIN timeout", v1, 2u);
}

@end
