@implementation SportsFavoritesManager

- (void)handleSportsFavoriteSyncNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  OUTLINED_FUNCTION_70();
  sub_1D9DCAC84();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

@end
