@implementation WFAppIntentShortcutsMetadata

- (id)attributionBundleIdentifierWithDefaultValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
    v3 = sub_1C1B0F224();
  else
    v3 = 0;
  sub_1C1649BFC(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_1C1B0F1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (WFAppIntentShortcutsMetadata)init
{
  AppIntentShortcutsMetadata.init()();
}

- (void).cxx_destruct
{
  sub_1C164ABA0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFAppIntentShortcutsMetadata_displayedAppDescriptor), *(_QWORD *)&self->displayedAppDescriptor[OBJC_IVAR___WFAppIntentShortcutsMetadata_displayedAppDescriptor]);

  sub_1C1649A58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFAppIntentShortcutsMetadata_iconSymbol), *(_QWORD *)&self->displayedAppDescriptor[OBJC_IVAR___WFAppIntentShortcutsMetadata_iconSymbol]);
  swift_bridgeObjectRelease();
}

- (id)dictionaryRepresentation
{
  WFAppIntentShortcutsMetadata *v2;
  void *v3;

  v2 = self;
  AppIntentShortcutsMetadata.dictionaryRepresentation()();

  _s3__C3KeyVMa_0(0);
  sub_1C1613648();
  v3 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return v3;
}

@end
