@implementation ContextMenuController

- (void)handleRequestNotificationWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DA13F0B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  OUTLINED_FUNCTION_70();
  sub_1D9FD0F1C();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_28_0();
}

@end
