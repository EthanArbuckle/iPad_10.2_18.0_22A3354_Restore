@implementation STBlueprint(ManagedUser)

+ (void)saveManagedUserBlueprintForUser:()ManagedUser error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a1, a3, "Failed to create user management blueprint: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)saveManagedUserBlueprintForUser:()ManagedUser error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to save user management blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createManagedUserBlueprintForUser:()ManagedUser error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "User has no managing organization: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createManagedUserBlueprintForUser:()ManagedUser error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch existing user management blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createManagedUserBlueprintForUser:()ManagedUser error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to serialize iCloud logout data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createManagedUserBlueprintForUser:()ManagedUser error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to serialize force date time data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)createManagedUserBlueprintForUser:()ManagedUser error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "More than one user management blueprint with the same identifier found in the database: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)deleteManagedUserBlueprintForUser:()ManagedUser error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to save disablement of managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)deleteManagedUserBlueprintForUser:()ManagedUser error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to disable managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)disableManagedUserBlueprintForUser:()ManagedUser error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch existing user management blueprints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
