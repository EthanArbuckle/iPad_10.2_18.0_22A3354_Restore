@implementation RCAppStoreRatingPrompter

- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)initWithSavedRecordingsModel:(id)a3
{
  char *v4;
  id *v5;
  id v6;
  objc_super v8;

  v4 = (char *)self + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter____lazy_storage___gatingController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter_recordingCountProvider);
  *v5 = a3;
  v5[1] = &off_1001AF3E8;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RCAppStoreRatingPrompter();
  v6 = a3;
  return -[RCAppStoreRatingPrompter init](&v8, "init");
}

- (void)applicationDidEnterForeground
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v11;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v15;

  v3 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self(UIDevice);
  v15 = self;
  v7 = objc_msgSend(v6, "currentDevice");
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8)
  {

  }
  else
  {
    v9 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    v10 = (_QWORD *)swift_allocObject(&unk_1001AF430, 40, 7);
    v10[2] = 0;
    v10[3] = 0;
    v11 = v15;
    v10[4] = v15;
    v12 = v11;
    v13 = sub_1000F7930((uint64_t)v5, (uint64_t)&unk_1001EAA78, (uint64_t)v10);

    swift_release(v13);
  }
}

- (void)promptForRatingIfNeeded
{
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v2;

  v2 = self;
  sub_1000BFE48();

}

- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)init
{
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *result;

  result = (_TtC10VoiceMemos24RCAppStoreRatingPrompter *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCAppStoreRatingPrompter", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005440((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter____lazy_storage___gatingController, &qword_1001EAA60);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter_recordingCountProvider));
}

@end
