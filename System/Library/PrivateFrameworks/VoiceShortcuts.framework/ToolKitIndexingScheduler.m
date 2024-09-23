@implementation ToolKitIndexingScheduler

- (void)requestReindexForAppIntentsMetadataChangedNotificationWithNotification:(id)a3
{
  sub_1C149C514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C149A590);
}

- (void)requestReindexForAppProtectionStateChangeWithNotification:(id)a3
{
  sub_1C149C514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C149BC4C);
}

- (void)requestReindexForLanguageChangeWithNotification:(id)a3
{
  sub_1C149C514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C149C2D0);
}

- (void)requestReindexAfterFirstUnlock
{
  sub_1C149CF6C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C149C5B4);
}

- (void)requestReindexForDaemonWakeupRequest
{
  sub_1C149CF6C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C149CD28);
}

- (BOOL)reindexWithDebouncer:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  swift_retain();
  sub_1C149D5C8(v4);
  swift_release();

  return 1;
}

@end
