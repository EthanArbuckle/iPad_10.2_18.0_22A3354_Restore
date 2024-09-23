@implementation NSURL(DataModelAdditions)

+ (id)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:
{
  id v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  NSClassFromString(CFSTR("NSURL"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_14:
    JUMPOUT(0x1CBA74F9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA74FF8);
  }

  if ((unint64_t)(a3 - 1) > 2)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromPFServerPosterType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unsupported type: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.descriptor.identifier"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:
{
  id v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  NSClassFromString(CFSTR("NSURL"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_14:
    JUMPOUT(0x1CBA75164);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA751C0);
  }

  if ((unint64_t)(a3 - 1) > 2)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromPFServerPosterType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unsupported type: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.role.identifier"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pbf_providerInfoFileURLForIdentifierURL:()DataModelAdditions
{
  id v3;
  void *v4;
  void *v6;

  v3 = a3;
  NSClassFromString(CFSTR("NSURL"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75304);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("providerInfo.plist"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pbf_versionsURLForIdentifierURL:()DataModelAdditions
{
  id v3;
  void *v4;
  void *v6;

  v3 = a3;
  NSClassFromString(CFSTR("NSURL"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA75430);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("versions"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

+ (void)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

+ (void)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pbf_providerInfoFileURLForIdentifierURL:()DataModelAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

+ (void)pbf_versionsURLForIdentifierURL:()DataModelAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
