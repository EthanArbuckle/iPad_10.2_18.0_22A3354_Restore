@implementation PBFStaticPosterDescriptorStoreCoordinator

+ (int64_t)type
{
  return 2;
}

+ (BOOL)shouldBeExcludedFromBackup
{
  return 1;
}

- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  -[PBFPosterModelStoreCoordinator extensionIdentifier](self, "extensionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator descriptorIdentifier](self, "descriptorIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator posterUUID](self, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator role](self, "role");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("static descriptors don't support multiple supplements : provider=%@ descriptor=%@ role=%@ posterUUID=%@ version=%llu supplement=%llu"), v8, v9, v11, v10, a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFStaticPosterDescriptorStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:].cold.2(a2);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6536CLL);
  }
  if (!v8 || !v9 || !v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("static descriptors missing component : provider=%@ descriptor=%@ role=%@ posterUUID=%@ version=%llu supplement=%llu"), v8, v9, v11, v10, a3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFStaticPosterDescriptorStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:].cold.1(a2);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D7F8E0], "staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:", v8, v9, v11, v10, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_accessQueue_buildIdentityForVersion:(const char *)a1 supplement:.cold.1(const char *a1)
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

- (void)_accessQueue_buildIdentityForVersion:(const char *)a1 supplement:.cold.2(const char *a1)
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
