@implementation STCoreUser(Identifiers)

- (void)validateForUpdate:()Identifiers .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localUserDeviceState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_1(&dword_1D22E7000, v2, v3, "%{public}s Validate for update on CoreUser failed for %{public}s user, with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_2();
}

- (void)validateForUpdate:()Identifiers .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_2(&dword_1D22E7000, v0, v1, "%{public}s Built-in CoreData Validation for update on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)validateForInsert:()Identifiers .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localUserDeviceState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_1(&dword_1D22E7000, v2, v3, "%{public}s Validate for Insert on CoreUser failed for %{public}s user with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_2();
}

- (void)validateForInsert:()Identifiers .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_2(&dword_1D22E7000, v0, v1, "%{public}s Built-in CoreData Validation for Insert on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)validateForDelete:()Identifiers .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localUserDeviceState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_1(&dword_1D22E7000, v2, v3, "%{public}s Validate for Delete on CoreUser failed for %{public}s user failed with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_2();
}

- (void)validateForDelete:()Identifiers .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_2(&dword_1D22E7000, v0, v1, "%{public}s Built-in CoreData Validation for Delete on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
