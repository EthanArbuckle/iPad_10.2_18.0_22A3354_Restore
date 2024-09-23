@implementation PREditingDidDismissAction

+ (id)cancelAction
{
  return -[PREditingDidDismissAction _initWithCompletion:]([PREditingDidDismissAction alloc], "_initWithCompletion:", 0);
}

+ (id)acceptChangesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id result;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[PREditingDidDismissAction _initWithCompletion:]([PREditingDidDismissAction alloc], "_initWithCompletion:", v3);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PREditingDidDismissAction acceptChangesWithCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PREditingDidDismissAction *v9;
  objc_super v11;
  _QWORD v12[4];
  PREditingDidDismissAction *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 2);

    v7 = (void *)MEMORY[0x1E0D016A0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PREditingDidDismissAction__initWithCompletion___block_invoke;
    v12[3] = &unk_1E2185170;
    v14 = v4;
    v13 = self;
    objc_msgSend(v7, "responderWithHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQueue:", MEMORY[0x1E0C80D38]);

  }
  else
  {
    v5 = 0;
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PREditingDidDismissAction;
  v9 = -[PREditingDidDismissAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v5, v8);

  return v9;
}

void __49__PREditingDidDismissAction__initWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "descriptorIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v11 = -[PRPosterConfiguration _initWithPath:]([PRMutablePosterConfiguration alloc], "_initWithPath:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      goto LABEL_11;
    }
    PRSLogPosterContents();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__PREditingDidDismissAction__initWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v9);

    objc_msgSend(v7, "invalidate");
  }
  else
  {
    PRSLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      *(_DWORD *)buf = 138544642;
      v20 = v18;
      v21 = 2112;
      v22 = v14;
      v23 = 2048;
      v24 = v5;
      v25 = 2112;
      v26 = v16;
      v27 = 2048;
      v28 = v7;
      v29 = 2112;
      v30 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v30;
      _os_log_error_impl(&dword_18B634000, v10, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration or finishedSavingAction in response is invalid : path=<%@:%p> finishedSavingAction=<%@:%p> error=%@", buf, 0x3Eu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

- (void)sendResponseWithUpdatedConfiguration:(id)a3 updatedProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PRMutablePosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:].cold.1();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6BC82CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRMutablePosterConfigurationClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6BC890);
  }

  objc_msgSend(v8, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updatedConfiguration looks to be invalid : %@"), v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:].cold.3();
    goto LABEL_23;
  }
  -[PREditingDidDismissAction info](self, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForSetting:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = v12;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  objc_msgSend(v9, "extendContentsReadAccessToAuditToken:error:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extendValidityForReason:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0D01698]);
    v22 = (void *)MEMORY[0x1E0D016A0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __84__PREditingDidDismissAction_sendResponseWithUpdatedConfiguration_updatedProperties___block_invoke;
    v32[3] = &unk_1E2185700;
    v33 = v20;
    v23 = v20;
    objc_msgSend(v22, "responderWithHandler:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "initWithInfo:responder:", 0, v24);

    v26 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(v26, "setObject:forSetting:", v17, 1);
    objc_msgSend(v26, "setObject:forSetting:", v25, 3);
    objc_msgSend(v26, "setObject:forSetting:", v7, 4);
    objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31.receiver = self;
    v31.super_class = (Class)PREditingDidDismissAction;
    -[PREditingDidDismissAction sendResponse:](&v31, sel_sendResponse_, v27);

  }
  else
  {
    PRSLogPosterContents();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PREditingDidDismissAction sendResponseWithUpdatedConfiguration:updatedProperties:].cold.2((uint64_t)self, v28);

    -[PREditingDidDismissAction invalidate](self, "invalidate");
  }

}

uint64_t __84__PREditingDidDismissAction_sendResponseWithUpdatedConfiguration_updatedProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2)
    return CFSTR("serverAuditToken");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 2)
    return 0;
  objc_msgSend(a4, "description", a3, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)graphicComplications
{
  return self->_graphicComplications;
}

- (PRSWidget)inlineComplication
{
  return self->_inlineComplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_graphicComplications, 0);
}

+ (void)acceptChangesWithCompletion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __49__PREditingDidDismissAction__initWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_18B634000, a3, OS_LOG_TYPE_ERROR, "%{public}@: updatedConfiguration in response looks to be invalid : %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)sendResponseWithUpdatedConfiguration:updatedProperties:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sendResponseWithUpdatedConfiguration:(uint64_t)a1 updatedProperties:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "%{public}@: cannot send updatedConfiguration back to server due to sandbox extension error", (uint8_t *)&v5, 0xCu);

}

- (void)sendResponseWithUpdatedConfiguration:updatedProperties:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
