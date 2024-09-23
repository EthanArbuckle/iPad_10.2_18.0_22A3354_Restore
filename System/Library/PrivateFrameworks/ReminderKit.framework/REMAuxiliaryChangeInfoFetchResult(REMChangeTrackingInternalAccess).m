@implementation REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess)

- (void)auxiliaryChangeInfoFromData:()REMChangeTrackingInternalAccess withObjectID:fromChangeObject:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass((Class)objc_msgSend(a1, "typedKlass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "REMChangeTracking+AuxiliaryChgInfo: Could not instantiate auxiliary change info model for {class: %{public}@, remObjectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)auxiliaryChangeInfoFromData:()REMChangeTrackingInternalAccess withObjectID:fromChangeObject:error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass((Class)objc_msgSend(a1, "typedKlass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "REMChangeTracking+AuxiliaryChgInfo: No object identifier decoded from plist dictionary for {class: %{public}@, remObjectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
