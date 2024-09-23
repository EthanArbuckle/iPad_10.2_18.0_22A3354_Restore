@implementation PBFGenericPosterDescriptorLookupInfo

- (PBFGenericPosterDescriptorLookupInfo)init
{
  PBFGenericPosterDescriptorLookupInfo *result;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  PBFGenericPosterDescriptorLookupInfo *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;

  result = (PBFGenericPosterDescriptorLookupInfo *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413314;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = CFSTR("PBFPosterPreview.m");
    v16 = 1024;
    v17 = 31;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v8, 0x30u);

  }
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFGenericPosterDescriptorLookupInfo;
  -[PBFGenericPosterDescriptorLookupInfo dealloc](&v3, sel_dealloc);
}

- (id)_initWithPath:(id)a3 extension:(id)a4
{
  id v7;
  id v8;
  PBFGenericPosterDescriptorLookupInfo *v9;
  PBFGenericPosterDescriptorLookupInfo *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  BSInvalidatable *pathValidityExtension;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBFGenericPosterDescriptorLookupInfo;
  v9 = -[PBFGenericPosterDescriptorLookupInfo init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendValidityForReason:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    pathValidityExtension = v10->_pathValidityExtension;
    v10->_pathValidityExtension = (BSInvalidatable *)v13;

    objc_storeStrong((id *)&v10->_extension, a4);
  }

  return v10;
}

+ (id)posterDescriptorLookupInfoForPath:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:].cold.1(a2);
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA9F668);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:].cold.2(a2);
    goto LABEL_9;
  }
  v9 = -[PBFGenericPosterDescriptorLookupInfo _initWithPath:extension:]([PBFGenericPosterDescriptorLookupInfo alloc], "_initWithPath:extension:", v6, v7);

  return v9;
}

+ (id)nullPosterDescriptorLookupInfo
{
  if (nullPosterDescriptorLookupInfo___once != -1)
    dispatch_once(&nullPosterDescriptorLookupInfo___once, &__block_literal_global_26);
  return (id)nullPosterDescriptorLookupInfo___nullInfo;
}

void __70__PBFGenericPosterDescriptorLookupInfo_nullPosterDescriptorLookupInfo__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PBFGenericPosterDescriptorLookupInfo _initWithPath:extension:]([PBFGenericPosterDescriptorLookupInfo alloc], "_initWithPath:extension:", 0, 0);
  v1 = (void *)nullPosterDescriptorLookupInfo___nullInfo;
  nullPosterDescriptorLookupInfo___nullInfo = (uint64_t)v0;

}

- (unint64_t)hash
{
  return -[PFServerPosterPath hash](self->_path, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PBFGenericPosterDescriptorLookupInfo *v4;
  char v5;

  v4 = (PBFGenericPosterDescriptorLookupInfo *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (PFServerPosterPath)posterDescriptorPath
{
  return self->_path;
}

- (PFPosterExtension)posterDescriptorExtension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

+ (void)posterDescriptorLookupInfoForPath:(const char *)a1 extension:.cold.1(const char *a1)
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

+ (void)posterDescriptorLookupInfoForPath:(const char *)a1 extension:.cold.2(const char *a1)
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

@end
