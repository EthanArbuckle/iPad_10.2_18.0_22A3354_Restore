@implementation RBSAssertion(PosterFoundation)

+ (id)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  NSClassFromString(CFSTR("RBSTarget"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.1();
LABEL_38:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244630DD8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSTargetClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244630E3CLL);
  }

  v14 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244630EA0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244630F04);
  }

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PrewarmRuntimeAssertion")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_prewarmRuntimeAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PosterUpdateRuntimeAssertion")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PosterUpdateMemoryAssertion")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_posterUpdateEntitledMemoryAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PhotosPosterUpdateMemoryAssertion")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_photosPosterUpdateEntitledMemoryAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Rendering-Nominal")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_posterRenderingRuntimeAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Rendering-Entitled")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_posterRenderingEntitledRuntimeAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Rendering-Photos")))
  {
    objc_msgSend(MEMORY[0x24BE80B10], "pf_posterRenderingPhotosMemoryHogRuntimeAssertionForTarget:explanation:", v13, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Editing")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown assertion identifier: %@"), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.3();
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x24BE80B10], "pf_posterEditingRuntimeAssertionForTarget:explanation:", v13, v11);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v16 = (void *)v15;
  if (v12)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __108__RBSAssertion_PosterFoundation__pf_assertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke;
    v22[3] = &unk_251543B88;
    v23 = v12;
    objc_msgSend(v16, "setInvalidationHandler:", v22);

  }
  return v16;
}

+ (uint64_t)pf_prewarmRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:
{
  return objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", a4, CFSTR("PrewarmRuntimeAssertion"), a3, a5);
}

+ (uint64_t)pf_posterUpdateRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:
{
  return objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", a4, CFSTR("PosterUpdateRuntimeAssertion"), a3, a5);
}

+ (id)pf_posterUpdateMemoryAssertionForReason:()PosterFoundation target:auditToken:posterProviderBundleIdentifier:invalidationHandler:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a5, "valueForEntitlement:", CFSTR("com.apple.posterkit.enhanced-memory-limits"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "BOOLValue"))
  {
    if (PFBundleIdentifierRequiresMemoryHogAssertion(v14))
      v17 = CFSTR("PhotosPosterUpdateMemoryAssertion");
    else
      v17 = CFSTR("PosterUpdateMemoryAssertion");
    objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v13, v17, v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)pf_prewarmRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("PosterPrewarm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_migrationRuntimeAssertionWithExplanation:()PosterFoundation
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE80B88];
  v4 = a3;
  objc_msgSend(v3, "attributeWithDomain:name:", CFSTR("com.apple.posterboard"), CFSTR("Foreground"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE80B10]);
  objc_msgSend(MEMORY[0x24BE80D38], "currentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithExplanation:target:attributes:", v4, v7, v8);

  return v9;
}

+ (id)pf_posterUpdateRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("PosterUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_posterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Updating-Entitled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_photosPosterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Updating-Photos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_posterEditingRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Editing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_posterRenderingRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Rendering-Nominal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_posterRenderingEntitledRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Rendering-Entitled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (id)pf_posterRenderingPhotosMemoryHogRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE80B88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "attributeWithDomain:name:", CFSTR("com.apple.posterkit.provider"), CFSTR("Rendering-Photos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v7, v10);

  return v11;
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.3()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
