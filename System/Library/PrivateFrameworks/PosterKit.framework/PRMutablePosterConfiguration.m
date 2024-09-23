@implementation PRMutablePosterConfiguration

+ (id)mutableConfiguration
{
  void *v3;
  void *v4;

  PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableConfigurationWithRole:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mutableConfigurationWithRole:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryPathForRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRPosterConfiguration _initWithPath:]([PRMutablePosterConfiguration alloc], "_initWithPath:", v3);
  objc_msgSend(v3, "invalidate");

  return v4;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterMetadata *v8;

  v4 = a3;
  -[PRPosterConfiguration loadOtherMetadataWithError:](self, "loadOtherMetadataWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "setDisplayNameLocalizationKey:", v4);

    v8 = (PRPosterMetadata *)objc_msgSend(v7, "copy");
    v4 = v7;
  }
  else
  {
    v8 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:]([PRPosterMetadata alloc], "initWithDisplayNameLocalizationKey:", v4);
  }

  -[PRMutablePosterConfiguration storeOtherMetadata:error:](self, "storeOtherMetadata:error:", v8, 0);
}

- (BOOL)setObject:(id)a3 forUserInfoKey:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68C454);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68C4B8);
  }

  v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDFE1EA8);
  if (v6 && (v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[anObject conformsToProtocol:@protocol(NSCoding)] || !anObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:].cold.2();
    goto LABEL_20;
  }
  -[PRPosterConfiguration loadUserInfoWithError:](self, "loadUserInfoWithError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  if (v6)
    objc_msgSend(v13, "setObject:forKey:", v6, v7);
  else
    objc_msgSend(v13, "removeObjectForKey:", v7);
  v14 = (void *)objc_msgSend(v13, "copy");
  v15 = -[PRMutablePosterConfiguration storeUserInfo:error:](self, "storeUserInfo:error:", v14, 0);

  return v15;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeUserInfo:error:", v6, a4);

  return (char)a4;
}

- (BOOL)storeConfiguredProperties:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfiguredPropertiesForPath:configuredProperties:error:](PRPosterPathUtilities, "storeConfiguredPropertiesForPath:configuredProperties:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfigurableOptionsForPath:configurableOptions:error:](PRPosterPathUtilities, "storeConfigurableOptionsForPath:configurableOptions:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeFocusConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = +[PRPosterPathUtilities storeFocusConfigurationForPath:focusConfiguration:error:](PRPosterPathUtilities, "storeFocusConfigurationForPath:focusConfiguration:error:", v7, v6, a4);
  else
    v8 = +[PRPosterPathUtilities removeFocusConfigurationForPath:error:](PRPosterPathUtilities, "removeFocusConfigurationForPath:error:", v7, a4);
  v9 = v8;

  return v9;
}

- (BOOL)storeHomeScreenConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:](PRPosterPathUtilities, "storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeTitleStyleConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:](PRPosterPathUtilities, "storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeComplicationLayout:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeComplicationLayoutForPath:complicationLayout:error:](PRPosterPathUtilities, "storeComplicationLayoutForPath:complicationLayout:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeQuickActionsConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:](PRPosterPathUtilities, "storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeSuggestionMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeSuggestionMetadataForPath:suggestionMetadata:error:](PRPosterPathUtilities, "storeSuggestionMetadataForPath:suggestionMetadata:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeOtherMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeOtherMetadataForPath:otherMetadata:error:](PRPosterPathUtilities, "storeOtherMetadataForPath:otherMetadata:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeAmbientConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:](PRPosterPathUtilities, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "copyContentsOfPath:error:", v6, a4);

  return (char)a4;
}

- (BOOL)copyContentsOfConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v10;

  v6 = a3;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterConfiguration copyContentsOfConfiguration:error:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68CB14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterConfiguration copyContentsOfConfiguration:error:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(v6, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRMutablePosterConfiguration copyContentsOfPath:error:](self, "copyContentsOfPath:error:", v7, a4);

  return v8;
}

- (void)setObject:forUserInfoKey:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setObject:forUserInfoKey:.cold.2()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)copyContentsOfConfiguration:error:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
