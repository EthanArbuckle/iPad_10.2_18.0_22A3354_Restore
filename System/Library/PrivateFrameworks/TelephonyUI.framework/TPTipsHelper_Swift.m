@implementation TPTipsHelper_Swift

- (UIViewController)popoverController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setPopoverController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

+ (void)donateEventKnownStoryLaunched
{
  sub_1BCFCE59C((uint64_t)a1, (uint64_t)a2, sub_1BCFD4620);
}

+ (void)donateEventKnownCallersDone
{
  sub_1BCFCE59C((uint64_t)a1, (uint64_t)a2, sub_1BCFD4674);
}

+ (void)donateEventSavedNumber
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  RecentsSaveAsContactTip.init()();
  v2 = sub_1BCFE28B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CE9618], v2);
  sub_1BCFD1974();
  sub_1BCFE27C4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v6 = sub_1BCFD3AD0();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
  sub_1BCFE2974();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

+ (void)donateEventCalledNonFavContact
{
  sub_1BCFCE59C((uint64_t)a1, (uint64_t)a2, sub_1BCFD3FE8);
}

+ (void)donateEventCalledNonContact
{
  sub_1BCFCE59C((uint64_t)a1, (uint64_t)a2, sub_1BCFD3A7C);
}

+ (void)donateEventOriginatedCallWithSiri
{
  sub_1BCFCEB9C((uint64_t)a1, (uint64_t)a2, (uint64_t)&unk_1E75FD938, (uint64_t)&unk_1EF4A5870, (void (*)(char *, uint64_t, uint64_t))sub_1BCFCD3E4);
}

+ (void)donateEventCreatedFacetimeLink
{
  sub_1BCFCEB9C((uint64_t)a1, (uint64_t)a2, (uint64_t)&unk_1E75FD910, (uint64_t)&unk_1EF4A5868, (void (*)(char *, uint64_t, uint64_t))sub_1BCFCD298);
}

+ (void)donateEventSearchedCallHistory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  sub_1BCFD7254(0);
  v2 = sub_1BCFD6D44();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, v3);
  sub_1BCFE2974();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (void)updateCanDisplayCallHistorySearchTip:(BOOL)a3
{
  sub_1BCFD7254(a3);
}

+ (void)didDisplayCallHistorySearchTip
{
  sub_1BCFD6F8C(1);
}

- (TPTipsHelper_Swift)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController) = 0;
  v3 = OBJC_IVAR___TPTipsHelper_Swift_entries;
  v4 = MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1BCFD14A4(MEMORY[0x1E0DEE9D8]);
  v5 = OBJC_IVAR___TPTipsHelper_Swift_currentTip;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1BCFD15A4(v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TPTipsHelper();
  return -[TPTipsHelper_Swift init](&v7, sel_init);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)donateEventSpeakerUsed
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  if ((byte_1EF4A6A68 & 1) == 0)
  {
    SpeakerphoneTip.init()();
    v0 = sub_1BCFE28B4();
    v1 = *(_QWORD *)(v0 - 8);
    MEMORY[0x1E0C80A78](v0);
    v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CE9618], v0);
    sub_1BCFD2448();
    sub_1BCFE27C4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v4 = sub_1BCFD3274();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4A4F00);
    v6 = *(_QWORD *)(v5 - 8);
    MEMORY[0x1E0C80A78](v5);
    v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4, v5);
    sub_1BCFE2974();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    byte_1EF4A6A68 = 1;
    objc_msgSend((id)objc_opt_self(), sel_logAnalyticsEventSpeakerphone);
  }
}

@end
