@implementation STCoreUser(UnmodeledInternal)

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not set screenTimeEnabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to fetch screen time settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setEffectiveRecoveryAltDSID:()UnmodeledInternal .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1D22E7000, MEMORY[0x1E0C81028], a3, "Attempted to set a recoveryAltDSID on family organization settings.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_4();
}

- (void)setContactsEditable:()UnmodeledInternal .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch contacts container to set managed state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setContactsEditable:()UnmodeledInternal .cold.2(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  if ((a1 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "Failed to set contacts editable to %@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)unmodeledManagingOrganizationSettings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "failed to fetch local settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
