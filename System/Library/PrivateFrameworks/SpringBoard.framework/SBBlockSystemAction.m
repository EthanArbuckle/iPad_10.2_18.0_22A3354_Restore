@implementation SBBlockSystemAction

- (_QWORD)initWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 name:(void *)a5 actionBlock:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  objc_super v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a1)
    goto LABEL_6;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[name length] > 0"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:].cold.1(sel_initWithConfiguredAction_instanceIdentity_name_actionBlock_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0939CF4);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("actionBlock != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:].cold.2(sel_initWithConfiguredAction_instanceIdentity_name_actionBlock_);
    goto LABEL_12;
  }
  v19.receiver = a1;
  v19.super_class = (Class)SBBlockSystemAction;
  a1 = objc_msgSendSuper2(&v19, sel_initWithConfiguredAction_instanceIdentity_, v9, v10);
  if (a1)
  {
    v13 = objc_msgSend(v12, "copy");
    v14 = (void *)a1[7];
    a1[7] = v13;

    v15 = objc_msgSend(v11, "copy");
    v16 = (void *)a1[8];
    a1[8] = v15;

  }
LABEL_6:

  return a1;
}

- (_QWORD)initWithIdentifier:(void *)a3 sectionIdentifier:(void *)a4 associatedBundleIdentifier:(void *)a5 instanceIdentity:(void *)a6 name:(void *)a7 actionBlock:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;

  if (!a1)
    return 0;
  v13 = (objc_class *)MEMORY[0x1E0DC7A10];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = a2;
  v20 = (void *)objc_msgSend([v13 alloc], "initWithIdentifier:sectionIdentifier:associatedBundleIdentifier:name:systemImageName:shortcutsMetadata:", v19, v18, v17, CFSTR("Block Action"), 0, 0);

  v21 = -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](a1, v20, v16, v15, v14);
  v22 = v21;

  return v22;
}

- (SBSystemActionAnalyticsData)analyticsData
{
  id v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  objc_super v9;
  SBSystemActionAnalyticsData result;

  v9.receiver = self;
  v9.super_class = (Class)SBBlockSystemAction;
  v3 = -[SBSystemAction analyticsData](&v9, sel_analyticsData);
  v5 = v4;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%@)"), self->_name);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (NSString *)v6;
  v8 = v5;
  result.parameterValueIdentifier = v8;
  result.actionIdentifier = v7;
  return result;
}

- (id)newExecutor
{
  return -[SBBlockSystemActionExecutor initWithSystemAction:]([SBBlockSystemActionExecutor alloc], "initWithSystemAction:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  NSString *name;
  id v5;
  objc_super v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "appendString:withName:", name, CFSTR("name"));
  v6.receiver = self;
  v6.super_class = (Class)SBBlockSystemAction;
  -[SBSystemAction appendDescriptionToFormatter:](&v6, sel_appendDescriptionToFormatter_, v5);

}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  char isKindOfClass;
  char v7;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBlockSystemAction;
  if (-[SBSystemAction isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_self(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0)
    && self->_actionBlock == v4[7])
  {
    v7 = BSEqualStrings();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (uint64_t)name
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

+ (_QWORD)toggleSilentModeActionWithRingerControl:(void *)a3 instanceIdentity:(void *)a4 name:
{
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a2;
  v7 = a4;
  v8 = a3;
  v9 = (objc_class *)objc_opt_self();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(" Ringer Action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [v9 alloc];
  v12 = (void *)*MEMORY[0x1E0DC82A8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__SBBlockSystemAction_Utilities__toggleSilentModeActionWithRingerControl_instanceIdentity_name___block_invoke;
  v17[3] = &unk_1E8EB5960;
  v18 = v6;
  v19 = v10;
  v13 = v10;
  v14 = v6;
  v15 = -[SBBlockSystemAction initWithIdentifier:sectionIdentifier:associatedBundleIdentifier:instanceIdentity:name:actionBlock:](v11, v12, CFSTR("SilentMode"), CFSTR("com.apple.springboard"), v8, v7, v17);

  return v15;
}

void __96__SBBlockSystemAction_Utilities__toggleSilentModeActionWithRingerControl_instanceIdentity_name___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (**v5)(id, _QWORD);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRingerMuted:withFeedback:reason:clientType:", -[SBRingerControl isRingerMuted](v4) ^ 1, 0, *(_QWORD *)(a1 + 40), 1);
  v5[2](v5, 0);

}

+ (_QWORD)localActionWithConfiguredAction:(void *)a3 instanceIdentity:(void *)a4 actionBlock:
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = objc_alloc((Class)objc_opt_self());
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__SBBlockSystemAction_Utilities__localActionWithConfiguredAction_instanceIdentity_actionBlock___block_invoke;
  v13[3] = &unk_1E8EB5988;
  v14 = v6;
  v10 = v6;
  v11 = -[SBBlockSystemAction initWithConfiguredAction:instanceIdentity:name:actionBlock:](v9, v8, v7, CFSTR("Local"), v13);

  return v11;
}

void __95__SBBlockSystemAction_Utilities__localActionWithConfiguredAction_instanceIdentity_actionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0DAAC98];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  -[SBCameraActivationManager workspace]((uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "initWithPreciseTimestamp:actionSource:", v9, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)initWithConfiguredAction:(const char *)a1 instanceIdentity:name:actionBlock:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguredAction:(const char *)a1 instanceIdentity:name:actionBlock:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
