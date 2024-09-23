@implementation PRMutablePosterDescriptor

+ (id)mutableDescriptorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableDescriptorWithIdentifier:role:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)mutableDescriptorWithIdentifier:(id)a3 role:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63B028);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63B08CLL);
  }

  if ((PFPosterRoleIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid((PFPosterRole)role)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:].cold.2();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryDescriptorPathWithIdentifier:role:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PRPosterDescriptor _initWithPath:]([PRMutablePosterDescriptor alloc], "_initWithPath:", v8);
  objc_msgSend(v8, "invalidate");

  return v9;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PRMutablePosterDescriptor_setDisplayNameLocalizationKey___block_invoke;
  v6[3] = &unk_1E2183998;
  v7 = v4;
  v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);

}

void __59__PRMutablePosterDescriptor_setDisplayNameLocalizationKey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "setDisplayNameLocalizationKey:", v4);

}

- (void)mutateConfigurableOptions:(void *)a1
{
  void (**v3)(id, id);
  void *v4;
  void *v5;
  void *v6;
  PRPosterMutableConfigurableOptions *v7;
  PRPosterMutableConfigurableOptions *v8;
  void *v9;
  PRPosterMutableConfigurableOptions *v10;

  if (a1 && a2)
  {
    v3 = a2;
    objc_msgSend(a1, "loadConfigurableOptionsWithError:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = [PRPosterMutableConfigurableOptions alloc];
      v7 = -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:preferredHomeScreenConfiguration:](v8, "initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:preferredHomeScreenConfiguration:", 0, CFSTR("PRPosterRoleLockScreen"), 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
    }
    v10 = v7;

    v3[2](v3, v10);
    v9 = (void *)-[PRPosterMutableConfigurableOptions copy](v10, "copy");
    objc_msgSend(a1, "storeConfigurableOptions:error:", v9, 0);

  }
}

- (void)setRole:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((PFPosterRoleIsValid() & 1) != 0)
  {
    -[PRPosterDescriptor role](self, "role");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v11);

    if ((v5 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x18D77C448]();
      -[PRPosterDescriptor descriptorIdentifier](self, "descriptorIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryDescriptorPathWithIdentifier:role:", v7, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterDescriptor _path](self, "_path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "copyContentsOfPath:error:", v9, 0);

      -[PRPosterDescriptor _swapOutPathForPath:](self, "_swapOutPathForPath:", v8);
      objc_msgSend(v8, "invalidate");

      objc_autoreleasePoolPop(v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid((PFPosterRole)role)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterDescriptor setRole:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setPreferredTimeFontConfigurations:(id)a3
{
  id v4;
  PRTimeFontConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(PRTimeFontConfiguration);
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  PRBundleURLFromReturnAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke;
  v13[3] = &unk_1E21839C0;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v4, "bs_compactMap:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke_2;
  v11[3] = &unk_1E2183998;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v11);

}

PRPosterTimeFontConfiguration *__64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PRPosterTimeFontConfiguration configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:](PRPosterTimeFontConfiguration, "configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:", a2, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredTimeFontConfigurations:", *(_QWORD *)(a1 + 32));
}

- (void)setPreferredTitleColors:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PRMutablePosterDescriptor_setPreferredTitleColors___block_invoke;
  v6[3] = &unk_1E2183998;
  v7 = v4;
  v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);

}

void __53__PRMutablePosterDescriptor_setPreferredTitleColors___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "setPreferredTitleColors:", v4);

}

- (void)setLuminance:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PRMutablePosterDescriptor_setLuminance___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__PRPosterMutableConfigurableOptions_8l;
  *(double *)&v3[4] = a3;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v3);
}

uint64_t __42__PRMutablePosterDescriptor_setLuminance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLuminance:", *(double *)(a1 + 32));
}

- (void)setPreferredHomeScreenConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PRMutablePosterDescriptor_setPreferredHomeScreenConfiguration___block_invoke;
  v6[3] = &unk_1E2183998;
  v7 = v4;
  v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);

}

uint64_t __65__PRMutablePosterDescriptor_setPreferredHomeScreenConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredHomeScreenConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)setPreferredGalleryOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    +[PRPosterPathUtilities storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:](PRPosterPathUtilities, "storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:", v4, v5, 0);
  else
    +[PRPosterPathUtilities removePosterDescriptorGalleryOptions:error:](PRPosterPathUtilities, "removePosterDescriptorGalleryOptions:error:", v4, 0);

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
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63B904);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63B968);
  }

  v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDFE1EA8);
  if (v6 && (v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[anObject conformsToProtocol:@protocol(NSCoding)] || !anObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:].cold.2();
    goto LABEL_20;
  }
  -[PRPosterDescriptor loadUserInfoWithError:](self, "loadUserInfoWithError:", 0);
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
  v15 = -[PRMutablePosterDescriptor storeUserInfo:error:](self, "storeUserInfo:error:", v14, 0);

  return v15;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeUserInfo:error:", v6, a4);

  return (char)a4;
}

- (BOOL)storeGalleryOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:](PRPosterPathUtilities, "storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfigurableOptionsForPath:configurableOptions:error:](PRPosterPathUtilities, "storeConfigurableOptionsForPath:configurableOptions:error:", v7, v6, a4);

  return (char)a4;
}

- (void)setAmbientSupportedDataLayout:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[PRPosterDescriptor ambientConfiguration](self, "ambientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v10 = v8;

  objc_msgSend(v10, "setSupportedDataLayout:", a3);
  -[PRPosterDescriptor _path](self, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:](PRPosterPathUtilities, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v9, v10, 0);

}

- (void)setAmbientConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v7)
  {
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:](PRPosterPathUtilities, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v4, v7, 0);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:](PRPosterPathUtilities, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v5, v6, 0);

  }
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRPosterDescriptor _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "copyContentsOfPath:error:", v6, a4);

  return (char)a4;
}

+ (void)mutableDescriptorWithIdentifier:role:.cold.1()
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

+ (void)mutableDescriptorWithIdentifier:role:.cold.2()
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setRole:.cold.1()
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
