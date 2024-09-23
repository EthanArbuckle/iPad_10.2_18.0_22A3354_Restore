@implementation PRPosterDescriptor

- (PRPosterDescriptor)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PRPosterDescriptor *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PRPosterDescriptor *v18;
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
    v20 = CFSTR("PRPosterDescriptor.m");
    v21 = 1024;
    v22 = 39;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PRPosterDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRPosterDescriptor;
  -[PRPosterDescriptor dealloc](&v3, sel_dealloc);
}

- (void)_swapOutPathForPath:(id)a3
{
  id v4;
  PFPosterPath *path;
  BSInvalidatable *pathValidityExtension;
  BSInvalidatable *v7;
  PFPosterPath *v8;
  PFPosterPath *v9;
  objc_class *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  void *v14;
  id v15;

  v4 = a3;
  NSClassFromString(CFSTR("PFPosterPath"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptor _swapOutPathForPath:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63A300);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptor _swapOutPathForPath:].cold.1();
    goto LABEL_9;
  }

  path = self->_path;
  pathValidityExtension = self->_pathValidityExtension;
  self->_path = (PFPosterPath *)v4;
  v15 = v4;
  v7 = pathValidityExtension;
  v8 = path;

  v9 = self->_path;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterPath extendValidityForReason:](v9, "extendValidityForReason:", v11);
  v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  v13 = self->_pathValidityExtension;
  self->_pathValidityExtension = v12;

  -[BSInvalidatable invalidate](v7, "invalidate");
}

- (id)_initWithPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PRPosterDescriptor *v8;
  PRPosterDescriptor *v9;
  PFPosterPath *path;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  BSInvalidatable *pathValidityExtension;
  void *v15;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptor _initWithPath:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63A4E4);
  }
  v6 = v5;
  objc_msgSend(v5, "descriptorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("descriptors must have descriptorIdentifiers : %@"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptor _initWithPath:].cold.2();
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)PRPosterDescriptor;
  v8 = -[PRPosterDescriptor init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    path = v9->_path;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterPath extendValidityForReason:](path, "extendValidityForReason:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    pathValidityExtension = v9->_pathValidityExtension;
    v9->_pathValidityExtension = (BSInvalidatable *)v13;

    if (objc_msgSend(v6, "isServerPosterPath"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&v9->_cache, v15);

      }
    }
  }

  return v9;
}

- (NSString)role
{
  return (NSString *)-[PFPosterPath role](self->_path, "role");
}

- (NSString)identifier
{
  return (NSString *)-[PFPosterPath descriptorIdentifier](self->_path, "descriptorIdentifier");
}

- (NSString)displayNameLocalizationKey
{
  void *v2;
  void *v3;

  -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)preferredTimeFontConfigurations
{
  void *v3;
  void *v4;

  PRBundleURLFromReturnAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterDescriptor preferredTimeFontConfigurationsWithExtensionBundleURL:](self, "preferredTimeFontConfigurationsWithExtensionBundleURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)preferredTitleColors
{
  void *v2;
  void *v3;

  -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredTitleColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (double)luminance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "luminance");
    v5 = v4;
  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (id)preferredTimeFontConfigurationsWithExtensionBundleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredTimeFontConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PRPosterDescriptor_preferredTimeFontConfigurationsWithExtensionBundleURL___block_invoke;
  v10[3] = &unk_1E2183970;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __76__PRPosterDescriptor_preferredTimeFontConfigurationsWithExtensionBundleURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timeFontConfigurationWithExtensionBundleURL:", *(_QWORD *)(a1 + 32));
}

- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration
{
  void *v2;
  void *v3;

  -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHomeScreenConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterDescriptorHomeScreenConfiguration *)v3;
}

- (id)loadGalleryOptionsWithError:(id *)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "proactiveGalleryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PRPosterDescriptorGalleryOptions)preferredGalleryOptions
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  objc_msgSend(WeakRetained, "galleryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PRPosterDescriptor _path](self, "_path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadPosterDescriptorGalleryOptionsForPath:error:](PRPosterPathUtilities, "loadPosterDescriptorGalleryOptionsForPath:error:", v7, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (PRPosterDescriptorGalleryOptions *)v6;
}

- (int64_t)ambientSupportedDataLayout
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[PRPosterDescriptor ambientConfiguration](self, "ambientConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "supportedDataLayout");
  }
  else
  {
    -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "ambientSupportedDataLayout");

  }
  return v5;
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  void *v3;
  void *v4;
  PRMutablePosterAmbientConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PRPosterDescriptor _path](self, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterPathUtilities loadAmbientConfigurationForPath:error:](PRPosterPathUtilities, "loadAmbientConfigurationForPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(PRMutablePosterAmbientConfiguration);
    -[PRPosterDescriptor loadConfigurableOptionsWithError:](self, "loadConfigurableOptionsWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterAmbientConfiguration setSupportedDataLayout:](v5, "setSupportedDataLayout:", objc_msgSend(v6, "ambientSupportedDataLayout"));

    -[PRPosterDescriptor _path](self, "_path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:](PRPosterPathUtilities, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v7, v8, 0);

    v4 = (void *)-[PRMutablePosterAmbientConfiguration copy](v5, "copy");
  }
  return (PRPosterAmbientConfiguration *)v4;
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
    -[PRPosterDescriptor _path](self, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadConfigurableOptionsForPath:error:](PRPosterPathUtilities, "loadConfigurableOptionsForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
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
      -[PRPosterDescriptor objectForUserInfoKey:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63AB60);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptor objectForUserInfoKey:].cold.1();
    goto LABEL_9;
  }

  -[PRPosterDescriptor loadUserInfoWithError:](self, "loadUserInfoWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)descriptorIdentifier
{
  return (NSString *)-[PFPosterPath descriptorIdentifier](self->_path, "descriptorIdentifier");
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PFPosterPath contentsURL](self->_path, "contentsURL");
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
  PRPosterDescriptor *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (PRPosterDescriptor *)a3;
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
  PRPosterDescriptor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __33__PRPosterDescriptor_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __33__PRPosterDescriptor_description__block_invoke(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (v1)
    return (id)objc_msgSend(*((id *)result + 5), "appendObject:withName:", *(_QWORD *)(v1 + 24), CFSTR("path"));
  return result;
}

- (_QWORD)appendDescriptionToFormatter:(_QWORD *)result
{
  if (result)
    return (id)objc_msgSend(a2, "appendObject:withName:", result[3], CFSTR("path"));
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

- (id)pr_posterUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[PRPosterDescriptor _path](self, "_path");
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

  -[PRPosterDescriptor _path](self, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_swapOutPathForPath:.cold.1()
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithPath:.cold.2()
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
