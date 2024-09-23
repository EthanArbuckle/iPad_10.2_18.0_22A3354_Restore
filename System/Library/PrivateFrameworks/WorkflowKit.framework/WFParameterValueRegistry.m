@implementation WFParameterValueRegistry

+ (id)allParameterValueClassesInWorkflowKit
{
  void *v2;

  static WFParameterValueRegistry.allParameterValueClassesInWorkflowKit()((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF700B60);
  v2 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "createRegisteredValueClassesSet");
}

+ (void)registerValueClass:(Class)a3
{
  void *v6;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF725A08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFParameterValueRegistry.m"), 34, CFSTR("Parameter value classes must conform to NSSecureCoding"));

  }
  objc_msgSend((id)_mutableRegisteredValueClasses, "addObject:", a3);
}

+ (id)registeredValueClasses
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "rediscoverParameterValueClassesIfNeeded");
  v2 = (void *)objc_msgSend((id)_mutableRegisteredValueClasses, "copy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

+ (void)createRegisteredValueClassesSet
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_mutableRegisteredValueClasses;
  _mutableRegisteredValueClasses = v9;

}

+ (void)rediscoverParameterValueClassesIfNeeded
{
  if (rediscoverParameterValueClassesIfNeeded_onceToken != -1)
    dispatch_once(&rediscoverParameterValueClassesIfNeeded_onceToken, &__block_literal_global_22201);
  WFRegisterClassesFromClassVendingMethodsIfNeeded();
}

uint64_t __67__WFParameterValueRegistry_rediscoverParameterValueClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerValueClass:", a2);
}

uint64_t __67__WFParameterValueRegistry_rediscoverParameterValueClassesIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rediscoverParameterValueClassesIfNeeded_calledParameterValueClassVendingSelectors;
  rediscoverParameterValueClassesIfNeeded_calledParameterValueClassVendingSelectors = v0;

  rediscoverParameterValueClassesIfNeeded_lock = 0;
  return _dyld_register_for_bulk_image_loads();
}

@end
