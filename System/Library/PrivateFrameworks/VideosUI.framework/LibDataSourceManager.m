@implementation LibDataSourceManager

- (void)handleHomeSharingUpdates
{
  sub_1D9CEB4D8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D9CEADF4);
}

- (void)appWillEnterForeground
{
  sub_1D9CEB4D8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D9CEB278);
}

- (void)appDidEnterBackground
{
  OUTLINED_FUNCTION_257_4();
  sub_1D9CEB500();
  OUTLINED_FUNCTION_10_3();
}

- (void)handleAccountChanges
{
  sub_1D9CEBA8C();
}

- (void)handleNetworkChanges
{
  sub_1D9CEBA8C();
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DA13F0B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  OUTLINED_FUNCTION_70();
  sub_1D9CEC150();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_28_0();
}

@end
