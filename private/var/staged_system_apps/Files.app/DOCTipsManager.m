@implementation DOCTipsManager

- (void)dealloc
{
  void *v2;
  _TtC5Files14DOCTipsManager *v3;
  uint64_t v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_sourceObserver);
  v3 = self;
  objc_msgSend(v2, "stopObservingSources");
  v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_sharingFlowTask);
  if (v4)
  {
    swift_retain();
    sub_10006922C((uint64_t *)&unk_100643490);
    Task.cancel()();
    swift_release(v4);
  }
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  -[DOCTipsManager dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files14DOCTipsManager_controller);
  sub_100068588((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_familyFetcher));

  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files14DOCTipsManager_familyFolderFilePath, &qword_100643470);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_familySharedFolderTip));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_sharingFlowTask));
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  _TtC5Files14DOCTipsManager *v6;
  id v7;

  v7 = a3;
  v6 = self;
  sub_100111A00(v7, a4);

}

- (void)initiateShareFlow
{
  _TtC5Files14DOCTipsManager *v2;

  v2 = self;
  sub_100114F50();

}

- (_TtC5Files14DOCTipsManager)init
{
  _TtC5Files14DOCTipsManager *result;

  result = (_TtC5Files14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCTipsManager", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
