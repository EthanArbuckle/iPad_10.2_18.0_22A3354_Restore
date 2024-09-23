@implementation PeopleSuggestionEventsHandler

- (void)receivePriorEvent:(id)a3
{
  sub_2454674F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24548B898);
}

- (void)receiveCurrentEvent:(id)a3
{
  sub_2454674F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24548C1B4);
}

- (id)correlateWithCurrentEvent:(id)a3
{
  _TtC15ReportingPluginP33_241C54B559B2FB062FFCBE75917645D829PeopleSuggestionEventsHandler *v4;
  id v5;
  id v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = -[BPSCorrelateHandler context](v4, sel_context);
  v6 = sub_24548C770();
  swift_unknownObjectRelease();

  swift_release();
  return v6;
}

@end
