@implementation AppSuggestionEventsHandler

- (void)receivePriorEvent:(id)a3
{
  sub_2454674F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24548B54C);
}

- (void)receiveCurrentEvent:(id)a3
{
  sub_2454674F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24548BE68);
}

- (id)correlateWithCurrentEvent:(id)a3
{
  _TtC15ReportingPluginP33_49CE6DC6C0E03C8622C4C40E70DD74A726AppSuggestionEventsHandler *v4;
  id v5;
  id v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = -[BPSCorrelateHandler context](v4, sel_context);
  v6 = sub_24548C518();
  swift_unknownObjectRelease();

  swift_release();
  return v6;
}

@end
