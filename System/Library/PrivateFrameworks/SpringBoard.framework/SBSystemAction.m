@implementation SBSystemAction

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (id)newSimplePreviewElement
{
  void *v3;
  void *v4;
  int v5;
  __objc2_class **v6;
  void *v7;

  -[SBSystemAction configuredAction](self, "configuredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Accessibility"));

  v6 = off_1E8E98740;
  if (!v5)
    v6 = off_1E8E98750;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithSystemAction:", self);

  return v7;
}

- (id)controlAction
{
  return 0;
}

- (SBSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBSystemAction *v11;
  SBSystemAction *v12;
  uint64_t v13;
  SBSystemActionInstanceIdentifying *instanceIdentity;
  SBSystemAction *result;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)SBSystemAction;
    v11 = -[SBSystemAction init](&v17, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_configuredAction, a3);
      v13 = objc_msgSend(v10, "copyWithZone:", 0);
      instanceIdentity = v12->_instanceIdentity;
      v12->_instanceIdentity = (SBSystemActionInstanceIdentifying *)v13;

      -[SBSystemAction _configureWithConfiguredAction]((uint64_t)v12);
    }

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("action != ((void *)0)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemAction initWithConfiguredAction:instanceIdentity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (SBSystemAction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_configureWithConfiguredAction
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "appendString:withName:", self->_hostBundleIdentifier, CFSTR("hostBundleIdentifier"));
  v4 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_cameraCaptureAction, CFSTR("isCameraCaptureAction"), 1);
  if (os_variant_has_internal_content())
    v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_configuredAction, CFSTR("configuredAction"));

}

- (BOOL)isEqual:(id)a3
{
  SBSystemAction *v4;
  void **v5;
  char v6;

  v4 = (SBSystemAction *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualObjects())
        v6 = SBSystemActionInstanceIdentityEqualToIdentity(self->_instanceIdentity, v5[3]);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[WFConfiguredStaccatoAction hash](self->_configuredAction, "hash");
  return -[SBSystemActionInstanceIdentifying hash](self->_instanceIdentity, "hash") ^ v3;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  SBSystemAction *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __29__SBSystemAction_description__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __29__SBSystemAction_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 40), 0);
}

- (WFConfiguredStaccatoAction)configuredAction
{
  return self->_configuredAction;
}

- (SBSystemActionInstanceIdentifying)instanceIdentity
{
  return self->_instanceIdentity;
}

- (BOOL)isCameraCaptureAction
{
  return self->_cameraCaptureAction;
}

- (BOOL)shouldBePerformedWhenSuppressed
{
  return self->_shouldBePerformedWhenSuppressed;
}

- (BOOL)shouldWakeScreenWhenPerformed
{
  return self->_shouldWakeScreenWhenPerformed;
}

- (BOOL)canBePerformedInSetupMode
{
  return self->_canBePerformedInSetupMode;
}

- (BOOL)hostBundleRequiresValidation
{
  return self->_hostBundleRequiresValidation;
}

- (SBSystemActionAnalyticsData)analyticsData
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  SBSystemActionAnalyticsData result;

  v3 = self->_analyticsData.actionIdentifier;
  v4 = self->_analyticsData.parameterValueIdentifier;
  v5 = v3;
  result.parameterValueIdentifier = v4;
  result.actionIdentifier = v5;
  return result;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceIdentity, 0);
  objc_storeStrong((id *)&self->_configuredAction, 0);
}

- (CHSControlIdentity)controlIdentity
{
  return 0;
}

- (id)newExecutor
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)initWithConfiguredAction:(const char *)a1 instanceIdentity:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

@end
