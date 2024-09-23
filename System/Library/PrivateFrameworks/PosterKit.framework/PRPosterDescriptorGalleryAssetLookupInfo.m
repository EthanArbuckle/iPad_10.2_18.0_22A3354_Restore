@implementation PRPosterDescriptorGalleryAssetLookupInfo

+ (id)imageCache
{
  if (imageCache_onceToken[0] != -1)
    dispatch_once(imageCache_onceToken, &__block_literal_global_32);
  return (id)imageCache_imageCache;
}

void __54__PRPosterDescriptorGalleryAssetLookupInfo_imageCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", CFSTR("PRPosterDescriptorGalleryAssetLookupInfo mapped image cache"));
  v1 = (void *)imageCache_imageCache;
  imageCache_imageCache = v0;

}

+ (id)_assetManagerCache
{
  if (_assetManagerCache_onceToken != -1)
    dispatch_once(&_assetManagerCache_onceToken, &__block_literal_global_17);
  return (id)_assetManagerCache_assetManagerCache;
}

void __62__PRPosterDescriptorGalleryAssetLookupInfo__assetManagerCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_assetManagerCache_assetManagerCache;
  _assetManagerCache_assetManagerCache = v0;

}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithDictionary:(id)a3
{
  id v4;
  PRPosterDescriptorGalleryAssetLookupInfo *v5;
  uint64_t v6;
  NSDictionary *lookupInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterDescriptorGalleryAssetLookupInfo;
  v5 = -[PRPosterDescriptorGalleryAssetLookupInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (-[NSDictionary count](self->_lookupInfo, "count"))
    return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDictionary:", self->_lookupInfo);
  else
    return self;
}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterDescriptorGalleryAssetLookupInfo *v8;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, v6, CFSTR("lookupInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PRPosterDescriptorGalleryAssetLookupInfo initWithDictionary:](self, "initWithDictionary:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lookupInfo, CFSTR("lookupInfo"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultLookupInfo
{
  if (defaultLookupInfo_onceToken != -1)
    dispatch_once(&defaultLookupInfo_onceToken, &__block_literal_global_21);
  return (id)defaultLookupInfo_defaultLookupInfo;
}

void __61__PRPosterDescriptorGalleryAssetLookupInfo_defaultLookupInfo__block_invoke()
{
  PRPosterDescriptorGalleryAssetLookupInfo *v0;
  uint64_t v1;
  void *v2;

  v0 = [PRPosterDescriptorGalleryAssetLookupInfo alloc];
  v1 = -[PRPosterDescriptorGalleryAssetLookupInfo initWithDictionary:](v0, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  v2 = (void *)defaultLookupInfo_defaultLookupInfo;
  defaultLookupInfo_defaultLookupInfo = v1;

}

+ (id)lookUpInfoForAssetCatalogIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v6;

  v3 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterDescriptorGalleryAssetLookupInfo lookUpInfoForAssetCatalogIdentifier:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B4EB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterDescriptorGalleryAssetLookupInfo lookUpInfoForAssetCatalogIdentifier:].cold.1();
    goto LABEL_9;
  }

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetCatalogIdentifier:", v3);
  return v4;
}

- (PRPosterDescriptorGalleryAssetLookupInfo)init
{
  return -[PRPosterDescriptorGalleryAssetLookupInfo initWithDictionary:](self, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithAssetCatalogIdentifier:(id)a3
{
  id v4;
  void *v5;
  PRPosterDescriptorGalleryAssetLookupInfo *v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptorGalleryAssetLookupInfo initWithAssetCatalogIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B5058);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptorGalleryAssetLookupInfo initWithAssetCatalogIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B50BCLL);
  }

  v10 = CFSTR("assetCatalogIdentifier");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterDescriptorGalleryAssetLookupInfo initWithDictionary:](self, "initWithDictionary:", v5);

  return v6;
}

- (NSDictionary)lookupInfo
{
  return self->_lookupInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupInfo, 0);
}

+ (void)lookUpInfoForAssetCatalogIdentifier:.cold.1()
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

- (void)initWithAssetCatalogIdentifier:.cold.1()
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
