@implementation MONotifier(MODispatcherUtility)

- (void)registerDispatcher:()MODispatcherUtility forNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)unregisterDispatcher:()MODispatcherUtility .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
