@implementation CarPlayDataManager

- (void)dealloc
{
  void *v2;
  _TtC5Books18CarPlayDataManager *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_player);
  v3 = self;
  objc_msgSend(v2, "removeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CarPlayDataManager();
  -[CarPlayDataManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books18CarPlayDataManager_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18CarPlayDataManager_libraryProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books18CarPlayDataManager_lastBookAssetID]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_player));

}

- (_TtC5Books18CarPlayDataManager)init
{
  _TtC5Books18CarPlayDataManager *result;

  result = (_TtC5Books18CarPlayDataManager *)_swift_stdlib_reportUnimplementedInitializer("Books.CarPlayDataManager", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4
{
  sub_1005619B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_1005622DC);
}

- (void)libraryProvider:(id)a3 contentDidChange:(id)a4
{
  sub_1005619B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_1005628B0);
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  sub_100561E34(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_100562E84);
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  _TtC5Books18CarPlayDataManager *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  CarPlayDataManager.player(_:audiobookDidChange:)(a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  sub_100561E34(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_100563100);
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  _TtC5Books18CarPlayDataManager *v7;

  if (a5 == 2)
  {
    swift_unknownObjectRetain(a3);
    v7 = self;
    sub_100561CC8();
    swift_unknownObjectRelease(a3);

  }
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  _QWORD *v7;
  uint64_t v8;
  id v9;
  _TtC5Books18CarPlayDataManager *v10;
  uint64_t Strong;
  uint64_t v12;

  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_lastBookAssetID);
  v8 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books18CarPlayDataManager_lastBookAssetID];
  *v7 = 0;
  v7[1] = 0;
  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = self;
  swift_bridgeObjectRelease(v8);
  Strong = swift_unknownObjectWeakLoadStrong((char *)v10 + OBJC_IVAR____TtC5Books18CarPlayDataManager_delegate);
  if (Strong)
  {
    v12 = Strong;
    sub_1002D547C((uint64_t)v9);

    swift_unknownObjectRelease(v12);
  }
  else
  {

  }
  swift_unknownObjectRelease(a3);
}

@end
