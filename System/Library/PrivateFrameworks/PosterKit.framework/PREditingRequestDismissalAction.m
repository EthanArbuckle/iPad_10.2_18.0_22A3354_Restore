@implementation PREditingRequestDismissalAction

- (id)_initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 auditTokenForSandboxExtension:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  PREditingRequestDismissalAction *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  NSObject *v26;
  uint64_t v27;
  BSInvalidatable *tempPathValidityExtension;
  PREditingRequestDismissalAction *v29;
  id result;
  void *v31;
  id v32;
  objc_super v33;
  id v34;
  _QWORD v35[4];
  PREditingRequestDismissalAction *v36;
  id v37;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0D016A0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __154__PREditingRequestDismissalAction__initWithUserAcceptedChanges_updatedConfiguration_updatedConfiguredProperties_auditTokenForSandboxExtension_completion___block_invoke;
  v35[3] = &unk_1E2185170;
  v17 = v15;
  v37 = v17;
  v18 = self;
  v36 = v18;
  objc_msgSend(v16, "responderWithHandler:", v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setQueue:", MEMORY[0x1E0C80D38]);
  v20 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v20, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
  objc_msgSend(v20, "setObject:forSetting:", v13, 5);
  objc_msgSend(v12, "_path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forSetting:", v21, 2);
  objc_msgSend(v21, "descriptorIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updatedConfiguration looks to be invalid : %@"), v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:].cold.2(a2, (uint64_t)v18, (uint64_t)v31);
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v14)
    {
      v32 = v12;
      v34 = 0;
      objc_msgSend(v21, "extendContentsReadAccessToAuditToken:error:", v14, &v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v34;
      if (v23)
      {
        objc_msgSend(v20, "setObject:forSetting:", v23, 2);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "extendValidityForReason:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        tempPathValidityExtension = v18->_tempPathValidityExtension;
        v18->_tempPathValidityExtension = (BSInvalidatable *)v27;

      }
      else
      {
        PRSLogPosterContents();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:].cold.1();
      }

      v12 = v32;
    }
    v33.receiver = v18;
    v33.super_class = (Class)PREditingRequestDismissalAction;
    v29 = -[PREditingRequestDismissalAction initWithInfo:responder:](&v33, sel_initWithInfo_responder_, v20, v19);

    return v29;
  }
  return result;
}

void __154__PREditingRequestDismissalAction__initWithUserAcceptedChanges_updatedConfiguration_updatedConfiguredProperties_auditTokenForSandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "tempPathValidityExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(v4, "info");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "BOOLForSetting:", 3);
    objc_msgSend(v7, "objectForSetting:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  PREditingRequestDismissalAction *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PREditingRequestDismissalAction_initWithUserAcceptedChanges_completion___block_invoke;
    v10[3] = &unk_1E2185198;
    v11 = v6;
    v8 = (PREditingRequestDismissalAction *)-[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:](self, "_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:", v4, 0, 0, 0, v10);

  }
  else
  {
    v8 = (PREditingRequestDismissalAction *)-[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:](self, "_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:", v4, 0, 0, 0, 0);
  }

  return v8;
}

uint64_t __74__PREditingRequestDismissalAction_initWithUserAcceptedChanges_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 completion:(id)a5
{
  return (PREditingRequestDismissalAction *)-[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:](self, "_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:", a3, a4, 0, 0, a5);
}

- (PREditingRequestDismissalAction)initWithUserAcceptedChanges:(BOOL)a3 updatedConfiguration:(id)a4 updatedConfiguredProperties:(id)a5 completion:(id)a6
{
  return (PREditingRequestDismissalAction *)-[PREditingRequestDismissalAction _initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:](self, "_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:", a3, a4, a5, 0, a6);
}

- (BOOL)userAcceptedChanges
{
  void *v2;
  char IsYes;

  -[PREditingRequestDismissalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 1);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (PRMutablePosterConfiguration)updatedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  -[PREditingRequestDismissalAction info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "descriptorIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = -[PRPosterConfiguration _initWithPath:]([PRMutablePosterConfiguration alloc], "_initWithPath:", v4);
      goto LABEL_8;
    }
    PRSLogPosterContents();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PREditingRequestDismissalAction updatedConfiguration].cold.1();
  }
  else
  {
    PRSLogPosterContents();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PREditingRequestDismissalAction updatedConfiguration].cold.2((uint64_t)self, (uint64_t)v4, v6);
  }

  v7 = 0;
LABEL_8:

  return (PRMutablePosterConfiguration *)v7;
}

- (PRPosterConfiguredProperties)updatedConfiguredProperties
{
  void *v2;
  void *v3;

  -[PREditingRequestDismissalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterConfiguredProperties *)v3;
}

- (void)sendResponseWithSuccess:(BOOL)a3 error:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v5 = (objc_class *)MEMORY[0x1E0D017D0];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  objc_msgSend(v7, "setObject:forSetting:", v6, 4);

  objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PREditingRequestDismissalAction;
  -[PREditingRequestDismissalAction sendResponse:](&v9, sel_sendResponse_, v8);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("updatedConfiguration");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("userAcceptedChanges");
  else
    return (id)v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    objc_msgSend(v6, "description");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    BSSettingFlagDescription();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

- (BSInvalidatable)tempPathValidityExtension
{
  return self->_tempPathValidityExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempPathValidityExtension, 0);
}

- (void)_initWithUserAcceptedChanges:updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "%{public}@: cannot send updatedConfiguration back to server due to sandbox extension error %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_initWithUserAcceptedChanges:(uint64_t)a3 updatedConfiguration:updatedConfiguredProperties:auditTokenForSandboxExtension:completion:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PREditingRequestDismissalAction.m");
  v16 = 1024;
  v17 = 54;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)updatedConfiguration
{
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2112;
  v12 = v8;
  v13 = 2048;
  v14 = a2;
  _os_log_error_impl(&dword_18B634000, a3, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration is invalid : path=<%@:%p>", (uint8_t *)&v9, 0x20u);

}

@end
