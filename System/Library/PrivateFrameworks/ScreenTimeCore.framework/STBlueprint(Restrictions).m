@implementation STBlueprint(Restrictions)

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch existing restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "failed to disable restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "Disabling restrictions blueprint.", a5, a6, a7, a8, 0);
}

- (void)permitWebFilterURL:()Restrictions pageTitle:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Unknown web filter state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)permitWebFilterURL:()Restrictions pageTitle:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "permitWebFilterURL: called but the web filter is not active: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "failed to save restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "Saving restrictions blueprint with preset restrictions.", a5, a6, a7, a8, 0);
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_FAULT, "failed to serialize restrictions during save: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
