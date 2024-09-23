@implementation PRPosterConfiguration

- (id)pr_posterUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[PRPosterConfiguration _path](self, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pr_posterProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[PRPosterConfiguration _path](self, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PRPosterConfiguration)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PRPosterConfiguration *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PRPosterConfiguration *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("PRPosterConfiguration.m");
    v21 = 1024;
    v22 = 29;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PRPosterConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRPosterConfiguration;
  -[PRPosterConfiguration dealloc](&v3, sel_dealloc);
}

- (id)_initWithPath:(id)a3
{
  id v5;
  void *v6;
  PRPosterConfiguration *v7;
  PRPosterConfiguration *v8;
  PFPosterPath *path;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  BSInvalidatable *pathValidityExtension;
  void *v14;
  id result;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v17.receiver = self;
    v17.super_class = (Class)PRPosterConfiguration;
    v7 = -[PRPosterConfiguration init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_path, a3);
      path = v8->_path;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterPath extendValidityForReason:](path, "extendValidityForReason:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      pathValidityExtension = v8->_pathValidityExtension;
      v8->_pathValidityExtension = (BSInvalidatable *)v12;

      if (objc_msgSend(v6, "isServerPosterPath"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeWeak((id *)&v8->_cache, v14);

        }
      }
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterConfiguration _initWithPath:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_invalidate
{
  objc_storeWeak((id *)&self->_cache, 0);
  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
}

- (NSString)displayNameLocalizationKey
{
  void *v2;
  void *v3;

  -[PRPosterConfiguration loadOtherMetadataWithError:](self, "loadOtherMetadataWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)descriptorIdentifier
{
  return (NSString *)-[PFPosterPath descriptorIdentifier](self->_path, "descriptorIdentifier");
}

- (NSString)role
{
  return (NSString *)-[PFPosterPath role](self->_path, "role");
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PFPosterPath contentsURL](self->_path, "contentsURL");
}

- (id)objectForUserInfoKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterConfiguration objectForUserInfoKey:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68B758);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterConfiguration objectForUserInfoKey:].cold.1();
    goto LABEL_9;
  }

  -[PRPosterConfiguration loadUserInfoWithError:](self, "loadUserInfoWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadUserInfoWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PFPosterPath loadUserInfoWithError:](self->_path, "loadUserInfoWithError:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)loadConfigurableOptionsWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "configurableOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadConfigurableOptionsForPath:error:](PRPosterPathUtilities, "loadConfigurableOptionsForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadConfiguredPropertiesWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "configuredProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:](PRPosterPathUtilities, "loadConfiguredPropertiesForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadFocusConfigurationWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadFocusConfigurationForPath:error:](PRPosterPathUtilities, "loadFocusConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadHomeScreenConfigurationWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "homeScreenConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadHomeScreenConfigurationForPath:error:](PRPosterPathUtilities, "loadHomeScreenConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadTitleStyleConfigurationWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "titleStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadTitleStyleConfigurationForPath:error:](PRPosterPathUtilities, "loadTitleStyleConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadComplicationLayoutWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "complicationLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadComplicationLayoutForPath:error:](PRPosterPathUtilities, "loadComplicationLayoutForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadColorVariationsConfigurationWithError:(id *)a1
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    objc_msgSend(WeakRetained, "colorVariationsConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(a1, "_path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRPosterPathUtilities loadColorVariationsConfigurationForPath:error:](PRPosterPathUtilities, "loadColorVariationsConfigurationForPath:error:", v8, a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)loadQuickActionsConfigurationWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "quickActionsConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadQuickActionsConfigurationForPath:error:](PRPosterPathUtilities, "loadQuickActionsConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadSuggestionMetadataWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "suggestionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadSuggestionMetadataForPath:error:](PRPosterPathUtilities, "loadSuggestionMetadataForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadOtherMetadataWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "otherMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadOtherMetadataForPath:error:](PRPosterPathUtilities, "loadOtherMetadataForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadAmbientConfigurationWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "ambientConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PRPosterConfiguration _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadAmbientConfigurationForPath:error:](PRPosterPathUtilities, "loadAmbientConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)loadAmbientWidgetLayoutWithError:(id *)a1
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    objc_msgSend(WeakRetained, "ambientWidgetLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(a1, "_path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRPosterPathUtilities loadAmbientWidgetLayoutForPath:error:](PRPosterPathUtilities, "loadAmbientWidgetLayoutForPath:error:", v8, a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[PFPosterPath contentsURL](self->_path, "contentsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hash");

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterConfiguration *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (PRPosterConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PFPosterPath serverIdentity](v4->_path, "serverIdentity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = BSEqualObjects();

      }
      else
      {
        v6 = -[PFPosterPath isEqual:](self->_path, "isEqual:", v4->_path);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(id);
  void *v10;
  PRPosterConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __36__PRPosterConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __36__PRPosterConfiguration_description__block_invoke(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (v1)
    return (id)objc_msgSend(*((id *)result + 5), "appendObject:withName:", *(_QWORD *)(v1 + 24), CFSTR("path"));
  return result;
}

- (PFPosterPath)_path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)_initWithPath:.cold.1()
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

- (void)objectForUserInfoKey:.cold.1()
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
