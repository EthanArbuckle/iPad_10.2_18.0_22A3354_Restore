@implementation WFShortcutsSyncEngine

- (WFShortcutsSyncEngine)initWithDatabase:(id)a3 container:(id)a4
{
  return (WFShortcutsSyncEngine *)ShortcutsSyncEngine.init(database:container:)(a3, a4);
}

- (WFShortcutsSyncEngine)init
{
  ShortcutsSyncEngine.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3
{
  sub_1C1489220(self, (int)a2, a3, (uint64_t)&unk_1E7AA29F0, (uint64_t)&unk_1EF6E36B0);
}

@end
